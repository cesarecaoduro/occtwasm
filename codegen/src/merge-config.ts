import { join } from 'node:path';
import { parseHeaderFile, isUnsupportedType, hasUnsupportedArgs, hasUnsupportedReturn } from './parse-headers.js';
import type { HeaderClass, HeaderMethod, HeaderArg } from './parse-headers.js';
import type {
  ModuleConfig, ClassDef, MethodDef, MethodOverload, ConstructorDef, Arg, EnumDef,
  MinimalModuleConfig, MinimalOverloadDef, MinimalMethodDef, MinimalConstructorDef,
  MinimalClassDef, MinimalEnumDef,
} from './parse-config.js';

// Re-export for consumers that import from merge-config
export type { MinimalModuleConfig };

export interface MergeWarning {
  level: 'warn' | 'error';
  message: string;
}

export interface MergeResult {
  config: ModuleConfig;
  warnings: MergeWarning[];
}

// ---------------------------------------------------------------------------
// Overload matching
// ---------------------------------------------------------------------------

/** Create a match key from header args: just the type names */
function matchKeyFromHeader(args: HeaderArg[]): string[] {
  return args.map(a => a.type);
}

/** Check if a YAML match array matches a header arg type list */
function matchesOverload(yamlMatch: string[], headerArgs: HeaderArg[]): boolean {
  if (yamlMatch.length !== headerArgs.length) return false;
  for (let i = 0; i < yamlMatch.length; i++) {
    if (yamlMatch[i] !== headerArgs[i].type) return false;
  }
  return true;
}

// ---------------------------------------------------------------------------
// Auto-suffix generation
// ---------------------------------------------------------------------------

/** Generate a distinguishing suffix from an overload's args.
 *  Strategy: use the first arg type that differs from other overloads.
 */
function sanitizeSuffixPart(s: string): string {
  return s.replace(/[^a-zA-Z0-9_]/g, '');
}

function shortTypeName(t: string): string {
  return t.includes('_') ? t.split('_').pop()! : t;
}

function autoSuffix(args: HeaderArg[], allOverloads: HeaderArg[][]): string {
  if (args.length === 0) return '_NoArgs';
  const parts = args.map(a => sanitizeSuffixPart(shortTypeName(a.type)));
  return `_${parts.join('_')}`;
}

// ---------------------------------------------------------------------------
// Convert HeaderArg to Arg
// ---------------------------------------------------------------------------

function headerArgToArg(ha: HeaderArg, mutArgs?: string[]): Arg {
  const arg: Arg = { name: ha.name, type: ha.type };
  if (mutArgs?.includes(ha.name)) {
    arg.mut = true;
  }
  return arg;
}

// ---------------------------------------------------------------------------
// Parent class resolution helper
// ---------------------------------------------------------------------------

/** Cache of parsed header classes to avoid re-parsing the same file */
const headerClassCache = new Map<string, HeaderClass | null>();

function resolveParentClass(parentName: string, headerDir: string): HeaderClass | null {
  if (headerClassCache.has(parentName)) {
    return headerClassCache.get(parentName)!;
  }

  const headerPath = join(headerDir, `${parentName}.hxx`);
  try {
    const parsed = parseHeaderFile(headerPath);
    const cls = parsed.classes.find(c => c.name === parentName) ?? null;
    headerClassCache.set(parentName, cls);
    return cls;
  } catch {
    headerClassCache.set(parentName, null);
    return null;
  }
}

/** Collect all methods from a class and its parent chain */
function collectAllMethods(
  headerClass: HeaderClass,
  headerDir: string,
): HeaderMethod[] {
  const allMethods = [...headerClass.methods];

  // Walk up the parent chain
  let parentName = headerClass.parentClass;
  while (parentName) {
    const parentClass = resolveParentClass(parentName, headerDir);
    if (!parentClass) break;
    allMethods.push(...parentClass.methods);
    parentName = parentClass.parentClass;
  }

  return allMethods;
}

// ---------------------------------------------------------------------------
// Main merge function
// ---------------------------------------------------------------------------

export function mergeHeadersAndConfig(
  minimalConfig: MinimalModuleConfig,
  headerDir: string,
): MergeResult {
  const warnings: MergeWarning[] = [];
  const config: ModuleConfig = {
    module: minimalConfig.module,
    classes: {},
    enums: {},
  };

  // Clear header class cache for each merge call
  headerClassCache.clear();

  // Process enums
  if (minimalConfig.enums) {
    for (const [enumName, enumDef] of Object.entries(minimalConfig.enums)) {
      const headerPath = join(headerDir, enumDef.include);
      try {
        const parsed = parseHeaderFile(headerPath);
        const headerEnum = parsed.enums.find(e => e.name === enumName);
        if (headerEnum) {
          config.enums[enumName] = {
            include: enumDef.include,
            values: headerEnum.values,
          };
        } else {
          warnings.push({ level: 'warn', message: `Enum ${enumName} not found in ${enumDef.include}` });
        }
      } catch (err) {
        warnings.push({ level: 'error', message: `Failed to parse header for enum ${enumName}: ${err}` });
      }
    }
  }

  // Process classes
  for (const [className, minClass] of Object.entries(minimalConfig.classes)) {
    const include = minClass.include ?? `${className}.hxx`;
    const headerPath = join(headerDir, include);

    let headerClass: HeaderClass | undefined;
    try {
      const parsed = parseHeaderFile(headerPath);
      headerClass = parsed.classes.find(c => c.name === className);
    } catch (err) {
      warnings.push({ level: 'error', message: `Failed to parse header for class ${className}: ${err}` });
    }

    if (!headerClass) {
      warnings.push({ level: 'warn', message: `Class ${className} not found in ${include}` });
      // Create a bare-bones class def
      config.classes[className] = {
        include,
        constructors: [],
        methods: {},
      };
      continue;
    }

    const classDef: ClassDef = {
      include,
      constructors: [],
      methods: {},
      skip: minClass.skip,
    };

    // Set inherits from header (unless suppressed in YAML)
    if (headerClass.parentClass && !minClass.suppress_inherits) {
      classDef.inherits = headerClass.parentClass;
    }

    // --- Constructors ---
    const headerCtors = headerClass.constructors.filter(c => !hasUnsupportedArgs(c.args));
    const yamlCtors = minClass.constructors;

    // Track which header constructors are explicitly matched by YAML
    const matchedHeaderCtorIndices = new Set<number>();

    if (yamlCtors && yamlCtors.length > 0) {
      // Match YAML constructors to header constructors
      for (const yamlCtor of yamlCtors) {
        if (yamlCtor.skip) continue;

        if (yamlCtor.match) {
          // Find matching header constructor
          const matchedIdx = headerCtors.findIndex(hc => matchesOverload(yamlCtor.match!, hc.args));
          if (matchedIdx >= 0) {
            matchedHeaderCtorIndices.add(matchedIdx);
            classDef.constructors.push({
              args: headerCtors[matchedIdx].args.map(a => headerArgToArg(a)),
              factory: yamlCtor.factory,
            });
          } else if (yamlCtor.match.length === 0 && headerCtors.length === 0) {
            // Explicit request for default constructor when header has none
            // (compiler-generated default constructors are valid in C++)
            classDef.constructors.push({
              args: [],
              factory: yamlCtor.factory,
            });
          } else {
            warnings.push({
              level: 'warn',
              message: `Constructor match [${yamlCtor.match.join(', ')}] in ${className} not found in header`,
            });
          }
        } else {
          // No match specified: include all non-skipped header constructors
          for (let i = 0; i < headerCtors.length; i++) {
            matchedHeaderCtorIndices.add(i);
            classDef.constructors.push({
              args: headerCtors[i].args.map(a => headerArgToArg(a)),
              factory: yamlCtor.factory,
            });
          }
        }
      }

      // Auto-include header constructors not matched by any YAML entry
      for (let i = 0; i < headerCtors.length; i++) {
        if (!matchedHeaderCtorIndices.has(i)) {
          classDef.constructors.push({
            args: headerCtors[i].args.map(a => headerArgToArg(a)),
          });
        }
      }
    } else {
      // No YAML constructor overrides: include all header constructors
      for (const hc of headerCtors) {
        classDef.constructors.push({
          args: hc.args.map(a => headerArgToArg(a)),
        });
      }
    }

    // Deduplicate non-factory constructors by arg count (embind only resolves by count, not type)
    // Factory constructors are emitted as class_function, so they don't conflict.
    {
      const seen = new Map<number, number>(); // argCount -> index (for non-factory only)
      const deduped: typeof classDef.constructors = [];
      for (const ctor of classDef.constructors) {
        if (ctor.factory) {
          // Factory constructors always pass through - they become static methods
          deduped.push(ctor);
        } else {
          const count = ctor.args.length;
          if (!seen.has(count)) {
            seen.set(count, deduped.length);
            deduped.push(ctor);
          }
          // Drop non-factory duplicates silently - first one wins
        }
      }
      classDef.constructors = deduped;
    }

    // --- Methods ---
    const skipList = new Set(minClass.skip ?? []);
    const yamlMethods = minClass.methods ?? {};

    // Group OWN header methods by name (not inherited — embind base<> handles inheritance)
    const headerMethodsByName = new Map<string, HeaderMethod[]>();
    for (const hm of headerClass.methods) {
      if (hasUnsupportedArgs(hm.args) || hasUnsupportedReturn(hm)) continue;
      if (skipList.has(hm.name)) continue;

      const existing = headerMethodsByName.get(hm.name) ?? [];
      existing.push(hm);
      headerMethodsByName.set(hm.name, existing);
    }

    // For YAML-referenced methods not found in own header, look up parent chain
    // This handles cases like BRep_Builder referencing MakeWire from TopoDS_Builder
    const inheritedMethods = headerClass.parentClass
      ? collectAllMethods(headerClass, headerDir).filter(hm => {
          // Only inherited (not own) methods
          return !headerClass!.methods.some(own =>
            own.name === hm.name && own.args.length === hm.args.length);
        })
      : [];
    const inheritedByName = new Map<string, HeaderMethod[]>();
    for (const hm of inheritedMethods) {
      if (hasUnsupportedArgs(hm.args) || hasUnsupportedReturn(hm)) continue;
      if (skipList.has(hm.name)) continue;
      const existing = inheritedByName.get(hm.name) ?? [];
      existing.push(hm);
      inheritedByName.set(hm.name, existing);
    }

    // Add inherited methods that are explicitly referenced in YAML
    for (const methodName of Object.keys(yamlMethods)) {
      if (!headerMethodsByName.has(methodName) && inheritedByName.has(methodName)) {
        headerMethodsByName.set(methodName, inheritedByName.get(methodName)!);
      }
    }

    // Validate skip list (check own + all inherited methods)
    const allHeaderMethodNames = new Set([
      ...headerClass.methods.map(m => m.name),
      ...inheritedMethods.map(m => m.name),
    ]);
    for (const skipped of skipList) {
      if (!allHeaderMethodNames.has(skipped)) {
        warnings.push({ level: 'warn', message: `Skip list entry "${skipped}" in ${className} not found in header` });
      }
    }

    // Validate YAML method declarations
    for (const methodName of Object.keys(yamlMethods)) {
      if (!headerMethodsByName.has(methodName) && !skipList.has(methodName)) {
        warnings.push({ level: 'warn', message: `YAML method "${methodName}" in ${className} not found in header` });
      }
    }

    // Process each method group
    for (const [methodName, headerOverloads] of headerMethodsByName) {
      const yamlMethod = yamlMethods[methodName];

      if (yamlMethod?.skip) continue;

      const isOverloaded = headerOverloads.length > 1;

      if (!isOverloaded) {
        // Single method - no overloads needed
        const hm = headerOverloads[0];
        const methodDef: MethodDef = {
          args: hm.args.map(a => headerArgToArg(a, yamlMethod?.mut_args)),
          returns: hm.returnType,
          const: hm.isConst || undefined,
          static: hm.isStatic || undefined,
          output_args: yamlMethod?.output_args,
        };
        classDef.methods[methodName] = methodDef;
      } else {
        // Overloaded method
        const yamlOverloads = yamlMethod?.overloads;
        const overloads: MethodOverload[] = [];

        // Determine shared properties from first overload
        const sharedReturns = headerOverloads[0].returnType;
        const sharedConst = headerOverloads.every(h => h.isConst) ? true : undefined;
        const sharedStatic = headerOverloads.every(h => h.isStatic) ? true : undefined;

        for (const hm of headerOverloads) {
          // Try to find a YAML override for this overload
          let yamlOvl: MinimalOverloadDef | undefined;
          if (yamlOverloads) {
            yamlOvl = yamlOverloads.find(yo => matchesOverload(yo.match, hm.args));
            // If YAML specifies explicit overloads, skip header overloads that don't match
            if (!yamlOvl) continue;
          }

          if (yamlOvl?.skip) continue;

          const suffix = yamlOvl?.suffix ?? autoSuffix(hm.args, headerOverloads.map(o => o.args));
          const mutArgs = yamlOvl?.mut_args ?? yamlMethod?.mut_args;

          const ovl: MethodOverload = {
            suffix,
            args: hm.args.map(a => headerArgToArg(a, mutArgs)),
            returns: hm.returnType !== sharedReturns ? hm.returnType : undefined,
            const: hm.isConst !== (sharedConst ?? false) ? hm.isConst : undefined,
            static: hm.isStatic !== (sharedStatic ?? false) ? hm.isStatic : undefined,
            output_args: yamlOvl?.output_args ?? yamlMethod?.output_args,
          };
          overloads.push(ovl);
        }

        // Validate: warn if YAML overloads didn't match
        if (yamlOverloads) {
          for (const yo of yamlOverloads) {
            if (yo.skip) continue;
            const matched = headerOverloads.some(hm => matchesOverload(yo.match, hm.args));
            if (!matched) {
              warnings.push({
                level: 'warn',
                message: `Overload match [${yo.match.join(', ')}] for ${className}.${methodName} not found in header`,
              });
            }
          }
        }

        // Ensure suffixes are unique (avoid embind name collisions)
        if (overloads.length > 1) {
          const used = new Map<string, number>();
          for (const ovl of overloads) {
            const base = ovl.suffix;
            const count = used.get(base) ?? 0;
            if (count > 0) {
              const newSuffix = `${base}_${count + 1}`;
              warnings.push({
                level: 'warn',
                message: `Overload suffix collision for ${className}.${methodName} (${base}); renamed to ${newSuffix}`,
              });
              ovl.suffix = newSuffix;
            }
            used.set(base, count + 1);
          }
        }

        if (overloads.length === 1) {
          // Single overload remaining: convert to simple method format
          const ovl = overloads[0];
          classDef.methods[methodName] = {
            args: ovl.args,
            returns: ovl.returns ?? sharedReturns,
            const: ovl.const ?? sharedConst ?? undefined,
            static: ovl.static ?? sharedStatic ?? undefined,
            output_args: ovl.output_args,
          };
        } else if (overloads.length > 1) {
          classDef.methods[methodName] = {
            overloads,
            returns: sharedReturns,
            const: sharedConst,
            static: sharedStatic,
          };
        }
      }
    }

    config.classes[className] = classDef;
  }

  return { config, warnings };
}

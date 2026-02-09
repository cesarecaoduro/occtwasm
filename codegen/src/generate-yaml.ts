import { resolve, dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { parseHeaderFile, isUnsupportedType, hasUnsupportedArgs } from './parse-headers.js';
import type { HeaderClass, HeaderMethod } from './parse-headers.js';

// ---------------------------------------------------------------------------
// Path constants
// ---------------------------------------------------------------------------

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, '../..');
const HEADER_DIR = resolve(ROOT, 'build/occt-install/include/opencascade');

// ---------------------------------------------------------------------------
// YAML generation
// ---------------------------------------------------------------------------

function indent(level: number): string {
  return '  '.repeat(level);
}

function generateClassYaml(cls: HeaderClass, level: number): string[] {
  const lines: string[] = [];
  const i = indent(level);

  lines.push(`${i}${cls.name}:`);

  // Constructors
  const ctors = cls.constructors.filter(c => !hasUnsupportedArgs(c.args));
  if (ctors.length > 0) {
    lines.push(`${i}  constructors:`);
    for (const ctor of ctors) {
      const matchTypes = ctor.args.map(a => a.type);
      if (matchTypes.length === 0) {
        lines.push(`${i}    - match: []`);
      } else {
        lines.push(`${i}    - match: [${matchTypes.join(', ')}]`);
      }
      lines.push(`${i}      # TODO: add factory name if needed for disambiguation`);
    }
  } else {
    lines.push(`${i}  constructors: []`);
  }

  // Group methods by name to detect overloads
  const methodGroups = new Map<string, HeaderMethod[]>();
  const suggestedSkips: string[] = [];

  for (const m of cls.methods) {
    if (hasUnsupportedArgs(m.args) || isUnsupportedType(m.returnType)) {
      suggestedSkips.push(m.name);
      continue;
    }
    const existing = methodGroups.get(m.name) ?? [];
    existing.push(m);
    methodGroups.set(m.name, existing);
  }

  // Methods (only overloaded ones need YAML entries)
  const overloadedMethods = [...methodGroups.entries()].filter(([, ms]) => ms.length > 1);

  if (overloadedMethods.length > 0) {
    lines.push(`${i}  methods:`);
    for (const [name, ms] of overloadedMethods) {
      lines.push(`${i}    ${name}:`);
      lines.push(`${i}      overloads:`);
      for (const m of ms) {
        const matchTypes = m.args.map(a => a.type);
        if (matchTypes.length === 0) {
          lines.push(`${i}        - match: []`);
        } else {
          lines.push(`${i}        - match: [${matchTypes.join(', ')}]`);
        }
        lines.push(`${i}          suffix: # TODO: choose suffix (e.g., _${getDistinguishingName(m)})`);
      }
    }
  }

  // Skip list
  const uniqueSkips = [...new Set(suggestedSkips)];
  if (uniqueSkips.length > 0) {
    lines.push(`${i}  skip: [${uniqueSkips.join(', ')}]`);
  }

  return lines;
}

function getDistinguishingName(method: HeaderMethod): string {
  if (method.args.length === 0) return 'NoArgs';
  const firstType = method.args[0].type;
  const shortName = firstType.includes('_') ? firstType.split('_').pop()! : firstType;
  return shortName;
}

function generateEnumYaml(enumName: string, include: string, level: number): string[] {
  const lines: string[] = [];
  const i = indent(level);
  lines.push(`${i}${enumName}:`);
  lines.push(`${i}  include: ${include}`);
  return lines;
}

// ---------------------------------------------------------------------------
// Main CLI
// ---------------------------------------------------------------------------

function main(): void {
  const args = process.argv.slice(2);
  let classNames: string[] = [];
  let enumNames: string[] = [];
  let moduleName = 'NewModule';

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--classes' && args[i + 1]) {
      classNames = args[i + 1].split(',');
      i++;
    } else if (args[i] === '--enums' && args[i + 1]) {
      enumNames = args[i + 1].split(',');
      i++;
    } else if (args[i] === '--module' && args[i + 1]) {
      moduleName = args[i + 1];
      i++;
    } else if (args[i] === '--help' || args[i] === '-h') {
      console.log('Usage: npx tsx codegen/src/generate-yaml.ts --classes gp_Pnt,gp_Vec --enums gp_TrsfForm --module TKNewModule');
      process.exit(0);
    }
  }

  if (classNames.length === 0 && enumNames.length === 0) {
    console.error('Error: specify at least --classes or --enums');
    console.error('Usage: npx tsx codegen/src/generate-yaml.ts --classes gp_Pnt,gp_Vec --enums gp_TrsfForm --module TKNewModule');
    process.exit(1);
  }

  const lines: string[] = [];
  lines.push('_format: minimal');
  lines.push(`module: ${moduleName}`);
  lines.push('');

  if (classNames.length > 0) {
    lines.push('classes:');
    for (const className of classNames) {
      const headerPath = join(HEADER_DIR, `${className}.hxx`);
      try {
        const parsed = parseHeaderFile(headerPath);
        const cls = parsed.classes.find(c => c.name === className);
        if (cls) {
          lines.push(...generateClassYaml(cls, 1));
          lines.push('');
        } else {
          lines.push(`  ${className}:`);
          lines.push(`    # WARNING: class not found in ${className}.hxx`);
          lines.push(`    constructors: []`);
          lines.push('');
        }
      } catch (err) {
        lines.push(`  ${className}:`);
        lines.push(`    # ERROR: could not parse ${className}.hxx: ${err}`);
        lines.push(`    constructors: []`);
        lines.push('');
      }
    }
  }

  if (enumNames.length > 0) {
    lines.push('enums:');
    for (const enumName of enumNames) {
      lines.push(...generateEnumYaml(enumName, `${enumName}.hxx`, 1));
    }
    lines.push('');
  }

  console.log(lines.join('\n'));
}

main();

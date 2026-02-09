import type {
  ModuleConfig,
  ClassDef,
  MethodDef,
  MethodOverload,
  ConstructorDef,
  Arg,
} from './parse-config.js';
import { getOverloads, getReturnType, isOverloaded } from './parse-config.js';
import { cppToEmbindType } from './type-mapper.js';

// ---------------------------------------------------------------------------
// Helper: format a constructor arg list as embind template params
// ---------------------------------------------------------------------------

function constructorTemplateArgs(args: Arg[]): string {
  return args.map((a) => cppToEmbindType(a.type)).join(', ');
}

// ---------------------------------------------------------------------------
// Helper: emit a lambda wrapper for a regular method (non-output-args)
// ---------------------------------------------------------------------------

function emitLambdaMethod(
  className: string,
  methodName: string,
  bindingName: string,
  overload: MethodOverload,
  methodDef: MethodDef,
): string {
  const isStatic = overload.static ?? methodDef.static ?? false;
  const isConst = overload.const ?? methodDef.const ?? false;
  const retType = getReturnType(methodDef, overload);
  const hasReturn = retType !== 'void';
  const bindFn = isStatic ? 'class_function' : 'function';

  // Build lambda parameter list
  const lambdaParams: string[] = [];
  if (!isStatic) {
    lambdaParams.push(`${isConst ? 'const ' : ''}${className}& self`);
  }
  for (const arg of overload.args) {
    // For mut args, pass by mutable reference so C++ can modify the original object
    if (arg.mut) {
      lambdaParams.push(`${arg.type}& ${arg.name}`);
    } else {
      lambdaParams.push(`${cppToEmbindType(arg.type)} ${arg.name}`);
    }
  }

  // Build call argument list
  const callArgs = overload.args.map((a) => a.name).join(', ');

  // Build the call expression
  const callExpr = isStatic
    ? `${className}::${methodName}(${callArgs})`
    : `self.${methodName}(${callArgs})`;

  const returnPrefix = hasReturn ? 'return ' : '';
  return `    .${bindFn}("${bindingName}", +[](${lambdaParams.join(', ')}) { ${returnPrefix}${callExpr}; })`;
}

// ---------------------------------------------------------------------------
// Helper: emit constructor bindings for a class
// ---------------------------------------------------------------------------

function emitConstructors(className: string, constructors: ConstructorDef[]): string {
  const lines: string[] = [];

  for (const ctor of constructors) {
    if (ctor.factory) {
      // Factory constructor: bind as a static class_function
      const argDecls = ctor.args
        .map((a) => `${cppToEmbindType(a.type)} ${a.name}`)
        .join(', ');
      const argNames = ctor.args.map((a) => a.name).join(', ');
      lines.push(
        `    .class_function("${ctor.factory}", +[](${argDecls}) { return ${className}(${argNames}); })`,
      );
    } else {
      // Regular constructor: use .constructor<...>()
      const templateArgs = constructorTemplateArgs(ctor.args);
      lines.push(`    .constructor<${templateArgs}>()`);
    }
  }

  return lines.join('\n');
}

// ---------------------------------------------------------------------------
// Helper: emit a lambda wrapper for output-argument methods
// ---------------------------------------------------------------------------

function emitOutputArgMethod(
  className: string,
  methodName: string,
  methodDef: MethodDef,
  overload: MethodOverload,
): string {
  const isStatic = overload.static ?? methodDef.static ?? false;
  const bindingName = methodName + overload.suffix;

  // The first arg in the overload is the output parameter
  const outputArg = overload.args[0];
  const inputArgs = overload.args.slice(1);

  // Build the lambda parameter list
  const lambdaParams: string[] = [];
  if (!isStatic) {
    lambdaParams.push(`const ${className}& self`);
  }
  for (const arg of inputArgs) {
    lambdaParams.push(`${cppToEmbindType(arg.type)} ${arg.name}`);
  }
  const lambdaParamStr = lambdaParams.join(', ');

  // Build the C++ call argument list (output param first, then input params)
  const callArgs = [outputArg.name, ...inputArgs.map((a) => a.name)].join(', ');

  // Determine the output type
  const outputType = outputArg.type;

  const bindFn = isStatic ? 'class_function' : 'function';

  const lines = [
    `    .${bindFn}("${bindingName}", +[](${lambdaParamStr}) {`,
    `        ${outputType} ${outputArg.name};`,
    `        self.${methodName}(${callArgs});`,
    `        return ${outputArg.name};`,
    `    })`,
  ];

  return lines.join('\n');
}

// ---------------------------------------------------------------------------
// Helper: emit method bindings for a class
// ---------------------------------------------------------------------------

function emitMethod(
  className: string,
  methodName: string,
  method: MethodDef,
): string {
  const lines: string[] = [];
  const overloads = getOverloads(method);
  const overloaded = isOverloaded(method);
  const isStatic = method.static ?? false;

  for (const overload of overloads) {
    const useOutputArgs = overload.output_args || method.output_args;
    const bindingName = overloaded ? methodName + overload.suffix : methodName;
    if (useOutputArgs) {
      lines.push(emitOutputArgMethod(className, methodName, method, overload));
    } else {
      lines.push(emitLambdaMethod(className, methodName, bindingName, overload, method));
    }
  }

  return lines.join('\n');
}

// ---------------------------------------------------------------------------
// Helper: emit a full class binding block
// ---------------------------------------------------------------------------

function emitClassBinding(className: string, classDef: ClassDef): string {
  const lines: string[] = [];

  // Class declaration with optional base<> (from header parsing)
  const baseClass = classDef.inherits;
  if (baseClass) {
    lines.push(`  class_<${className}, base<${baseClass}>>("${className}")`);
  } else {
    lines.push(`  class_<${className}>("${className}")`);
  }

  // Constructors
  const ctorBlock = emitConstructors(className, classDef.constructors);
  if (ctorBlock) {
    lines.push(ctorBlock);
  }

  // Methods (sorted by name for deterministic output)
  const methodNames = Object.keys(classDef.methods).sort();
  for (const methodName of methodNames) {
    if (classDef.skip?.includes(methodName)) continue;
    const method = classDef.methods[methodName];
    lines.push(emitMethod(className, methodName, method));
  }

  // Close class binding
  lines.push('    ;');

  return lines.join('\n');
}

// ---------------------------------------------------------------------------
// Helper: emit an enum binding block
// ---------------------------------------------------------------------------

function emitEnumBinding(enumName: string, values: string[]): string {
  const lines: string[] = [];

  lines.push(`  enum_<${enumName}>("${enumName}")`);
  for (const value of values) {
    lines.push(`    .value("${value}", ${value})`);
  }
  lines.push('    ;');

  return lines.join('\n');
}

// ---------------------------------------------------------------------------
// Main export: generate the complete embind C++ file
// ---------------------------------------------------------------------------

export function emitEmbindModule(config: ModuleConfig): string {
  const sections: string[] = [];

  // ---- Collect all unique includes ----
  const includes = new Set<string>();
  for (const classDef of Object.values(config.classes)) {
    includes.add(classDef.include);
    // Include headers for OCCT types referenced in constructors and methods.
    // Any type containing '_' (except Standard_*) is an OCCT class needing its header.
    const needsInclude = (t: string) => t.includes('_') && !t.startsWith('Standard_');
    for (const ctor of classDef.constructors) {
      for (const arg of ctor.args) {
        if (needsInclude(arg.type)) includes.add(`${arg.type}.hxx`);
      }
    }
    for (const method of Object.values(classDef.methods)) {
      for (const ovl of getOverloads(method)) {
        for (const arg of ovl.args) {
          if (needsInclude(arg.type)) includes.add(`${arg.type}.hxx`);
        }
        const ret = getReturnType(method, ovl);
        if (needsInclude(ret)) includes.add(`${ret}.hxx`);
      }
    }
  }
  for (const enumDef of Object.values(config.enums)) {
    includes.add(enumDef.include);
  }

  // ---- Emit header includes ----
  const headerLines: string[] = [];
  headerLines.push('#include <emscripten/bind.h>');
  headerLines.push('');

  const sortedIncludes = [...includes].sort();
  for (const inc of sortedIncludes) {
    headerLines.push(`#include <${inc}>`);
  }
  sections.push(headerLines.join('\n'));

  // ---- Using declaration ----
  sections.push('using namespace emscripten;');

  // ---- EMSCRIPTEN_BINDINGS block ----
  const bindingLines: string[] = [];
  bindingLines.push(`EMSCRIPTEN_BINDINGS(${config.module}) {`);

  // Enums first
  const enumNames = Object.keys(config.enums).sort();
  for (const enumName of enumNames) {
    const enumDef = config.enums[enumName];
    bindingLines.push('');
    bindingLines.push(emitEnumBinding(enumName, enumDef.values));
  }

  // Then classes
  const classNames = Object.keys(config.classes).sort();
  for (const className of classNames) {
    const classDef = config.classes[className];
    bindingLines.push('');
    bindingLines.push(emitClassBinding(className, classDef));
  }

  bindingLines.push('}');
  sections.push(bindingLines.join('\n'));

  return sections.join('\n\n') + '\n';
}

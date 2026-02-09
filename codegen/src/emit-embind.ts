import type {
  ModuleConfig,
  ClassDef,
  MethodDef,
  MethodOverload,
  ConstructorDef,
  Arg,
} from './parse-config.js';
import { getOverloads, getReturnType, isOverloaded } from './parse-config.js';
import {
  cppToEmbindType,
  embindReturnType,
} from './type-mapper.js';

// ---------------------------------------------------------------------------
// Known inheritance relationships for base<> declarations
// ---------------------------------------------------------------------------

const INHERITANCE_MAP: Record<string, string> = {
  TopoDS_Vertex: 'TopoDS_Shape',
  TopoDS_Edge: 'TopoDS_Shape',
  TopoDS_Wire: 'TopoDS_Shape',
  TopoDS_Face: 'TopoDS_Shape',
  TopoDS_Shell: 'TopoDS_Shape',
  TopoDS_Solid: 'TopoDS_Shape',
  TopoDS_Compound: 'TopoDS_Shape',
  BRep_Builder: 'TopoDS_Builder',
};

// ---------------------------------------------------------------------------
// Helper: format a constructor arg list as embind template params
// ---------------------------------------------------------------------------

function constructorTemplateArgs(args: Arg[]): string {
  return args.map((a) => cppToEmbindType(a.type)).join(', ');
}

// ---------------------------------------------------------------------------
// Helper: build select_overload expression for an overloaded method
// ---------------------------------------------------------------------------

function emitSelectOverload(
  className: string,
  methodName: string,
  overload: MethodOverload,
  methodDef: MethodDef,
): string {
  const retType = embindReturnType(getReturnType(methodDef, overload));
  const argTypes = overload.args.map((a) => cppToEmbindType(a.type)).join(', ');
  const isConst = overload.const ?? methodDef.const ?? false;
  const constSuffix = isConst ? ' const' : '';
  return `select_overload<${retType}(${argTypes})${constSuffix}>(&${className}::${methodName})`;
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

  // Handle output_args methods
  if (method.output_args) {
    for (const overload of overloads) {
      lines.push(emitOutputArgMethod(className, methodName, method, overload));
    }
    return lines.join('\n');
  }

  if (overloaded) {
    // Multiple overloads: each needs select_overload and a suffixed name
    for (const overload of overloads) {
      const bindingName = methodName + overload.suffix;
      const isOverloadStatic = overload.static ?? isStatic;
      const selectExpr = emitSelectOverload(className, methodName, overload, method);
      const bindFn = isOverloadStatic ? 'class_function' : 'function';
      lines.push(`    .${bindFn}("${bindingName}", ${selectExpr})`);
    }
  } else {
    // Single method: direct binding
    const overload = overloads[0];
    const isMethodStatic = overload.static ?? isStatic;
    const bindFn = isMethodStatic ? 'class_function' : 'function';
    lines.push(`    .${bindFn}("${methodName}", &${className}::${methodName})`);
  }

  return lines.join('\n');
}

// ---------------------------------------------------------------------------
// Helper: emit a full class binding block
// ---------------------------------------------------------------------------

function emitClassBinding(className: string, classDef: ClassDef): string {
  const lines: string[] = [];

  // Class declaration with optional base<>
  const baseClass = INHERITANCE_MAP[className];
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

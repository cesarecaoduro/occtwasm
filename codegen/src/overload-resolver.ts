import type { Arg, MethodOverload, MethodDef } from './parse-config.js';
import { isOverloaded, getOverloads, getReturnType } from './parse-config.js';
import { cppToTsType, isOcctClass, isOcctEnum, isPrimitive, tsTypeForArg } from './type-mapper.js';

// ---------------------------------------------------------------------------
// Helper: map a C++ type to a JavaScript `typeof` result string
// ---------------------------------------------------------------------------

function tsTypeof(cppType: string): string {
  const tsType = cppToTsType(cppType);
  switch (tsType) {
    case 'number': return 'number';
    case 'boolean': return 'boolean';
    case 'string': return 'string';
    default: return 'object';
  }
}

// ---------------------------------------------------------------------------
// Helper: generate the unwrapped expression for passing an argument to embind
// ---------------------------------------------------------------------------

function unwrapArg(index: number, arg: Arg, varPrefix: string): string {
  if (isOcctClass(arg.type) && !isOcctEnum(arg.type)) {
    return `${varPrefix}[${index}]._handle`;
  }
  if (isOcctEnum(arg.type)) {
    return `Module.${arg.type}.values[${varPrefix}[${index}]]`;
  }
  return `${varPrefix}[${index}]`;
}

// ---------------------------------------------------------------------------
// generateInstanceofCheck
// ---------------------------------------------------------------------------

/**
 * Generate a condition expression for matching an overload based on argument
 * types. The expression checks `args.length` and then validates each argument
 * using either `instanceof` (for OCCT classes) or `typeof` (for primitives
 * and enums).
 *
 * Examples:
 *   `args.length === 1 && args[0] instanceof gp_Pnt`
 *   `args.length === 3 && typeof args[0] === 'number'`
 */
export function generateInstanceofCheck(args: Arg[], varPrefix: string): string {
  const conditions: string[] = [];

  conditions.push(`${varPrefix}.length === ${args.length}`);

  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    if (isOcctClass(arg.type)) {
      conditions.push(`${varPrefix}[${i}] instanceof ${arg.type}`);
    } else if (isOcctEnum(arg.type)) {
      // Enums are represented as numbers at runtime
      conditions.push(`typeof ${varPrefix}[${i}] === 'number'`);
    } else if (isPrimitive(arg.type)) {
      conditions.push(`typeof ${varPrefix}[${i}] === '${tsTypeof(arg.type)}'`);
    } else {
      // Unknown types: fall back to typeof object
      conditions.push(`typeof ${varPrefix}[${i}] === '${tsTypeof(arg.type)}'`);
    }
  }

  return conditions.join(' && ');
}

// ---------------------------------------------------------------------------
// generateOverloadBody
// ---------------------------------------------------------------------------

/**
 * Generate the body of one overload branch (the code inside an if-block).
 *
 * Handles:
 * - Argument unwrapping (OCCT classes use `._handle`, primitives pass directly)
 * - Static vs instance method dispatch
 * - Return value wrapping (OCCT class results wrapped via `_fromHandle`)
 * - output_args methods (embind lambda already handles output param)
 */
export function generateOverloadBody(
  className: string,
  methodName: string,
  overload: MethodOverload,
  method: MethodDef,
  indent: string,
): string {
  const lines: string[] = [];
  const isStatic = overload.static ?? method.static ?? false;
  const outputArgs = overload.output_args ?? method.output_args ?? false;
  const isOverloadedMethod = isOverloaded(method);

  // For output_args, the return type is the first arg's type (the output param)
  let returnType: string;
  if (outputArgs && overload.args.length > 0) {
    returnType = overload.args[0].type;
  } else {
    returnType = getReturnType(method, overload);
  }
  const tsReturn = cppToTsType(returnType);
  const returnsVoid = returnType === 'void';
  const returnsOcctClass = isOcctClass(returnType) && !isOcctEnum(returnType);

  // Determine the method name on the embind handle
  const embindMethodName = isOverloadedMethod
    ? `${methodName}${overload.suffix}`
    : methodName;

  // Build argument expressions — strip the output arg for output_args methods
  const inputArgs = outputArgs ? overload.args.slice(1) : overload.args;
  const argExprs = inputArgs.map((arg, i) => unwrapArg(i, arg, 'args'));
  const argsStr = argExprs.join(', ');

  // Build the call expression
  let callExpr: string;
  if (isStatic) {
    callExpr = `Module.${className}.${embindMethodName}(${argsStr})`;
  } else {
    callExpr = `this._handle.${embindMethodName}(${argsStr})`;
  }

  const returnsEnum = isOcctEnum(returnType);

  // Emit the call and handle the return value
  if (returnsVoid) {
    lines.push(`${indent}${callExpr};`);
  } else if (returnsOcctClass) {
    lines.push(`${indent}const _result = ${callExpr};`);
    lines.push(`${indent}return ${tsReturn}._fromHandle(_result);`);
  } else if (returnsEnum) {
    // Embind enums are objects with a .value property
    lines.push(`${indent}return ${callExpr}.value;`);
  } else {
    lines.push(`${indent}return ${callExpr};`);
  }

  return lines.join('\n');
}

// ---------------------------------------------------------------------------
// generateOverloadDispatch
// ---------------------------------------------------------------------------

/**
 * Generate the full if/else dispatch chain for a method with multiple
 * overloads. Each branch checks argument types at runtime and delegates
 * to the appropriately-suffixed embind method.
 *
 * For single-overload methods the function still works correctly, emitting
 * a single if-branch with a fallback throw.
 */
export function generateOverloadDispatch(
  className: string,
  methodName: string,
  method: MethodDef,
  indent: string,
): string {
  const overloads = getOverloads(method);
  const lines: string[] = [];

  for (let i = 0; i < overloads.length; i++) {
    const overload = overloads[i];
    const outputArgs = overload.output_args ?? method.output_args ?? false;
    // For output_args, strip the first arg (output param) from the TS-level check
    const checkArgs = outputArgs ? overload.args.slice(1) : overload.args;
    const check = generateInstanceofCheck(checkArgs, 'args');
    const keyword = i === 0 ? 'if' : '} else if';
    lines.push(`${indent}${keyword} (${check}) {`);
    lines.push(generateOverloadBody(className, methodName, overload, method, indent + '  '));
  }

  lines.push(`${indent}} else {`);
  lines.push(`${indent}  throw new Error('Invalid arguments for ${className}.${methodName}');`);
  lines.push(`${indent}}`);

  return lines.join('\n');
}

import type { Arg } from './parse-config.js';

// C++ primitive type to TypeScript type mapping
const cppToTsMap: Record<string, string> = {
  'Standard_Real': 'number',
  'Standard_Integer': 'number',
  'Standard_Boolean': 'boolean',
  'Standard_CString': 'string',
  'void': 'void',
  'bool': 'boolean',
  'int': 'number',
  'double': 'number',
  'float': 'number',
};

// C++ type to embind C++ type (for function signatures)
const cppToEmbindMap: Record<string, string> = {
  'Standard_Real': 'double',
  'Standard_Integer': 'int',
  'Standard_Boolean': 'bool',
  'Standard_CString': 'std::string',
  'void': 'void',
  'bool': 'bool',
  'int': 'int',
  'double': 'double',
  'float': 'float',
};

// Dynamic registries - populated by codegen before emitting
const registeredEnums = new Set<string>();
const registeredClasses = new Set<string>();

/** Register OCCT enum type names (called from codegen before emit) */
export function registerEnums(names: string[]): void {
  for (const name of names) registeredEnums.add(name);
}

/** Register OCCT class names (called from codegen before emit) */
export function registerClasses(names: string[]): void {
  for (const name of names) registeredClasses.add(name);
}

/** Check if a C++ type is a registered OCCT class (not a primitive or enum) */
export function isOcctClass(type: string): boolean {
  if (registeredClasses.has(type)) return true;
  if (type in cppToTsMap) return false;
  if (registeredEnums.has(type)) return false;
  if (type.startsWith('Standard_')) return false;
  // Be strict: only treat explicitly registered classes as embind-wrapped.
  return false;
}

/** Strict check: returns true only if the type was explicitly registered */
export function isRegisteredClass(type: string): boolean {
  return registeredClasses.has(type);
}

/** Check if a C++ type is a registered OCCT enum */
export function isOcctEnum(type: string): boolean {
  return registeredEnums.has(type);
}

/** Map C++ type to TypeScript type */
export function cppToTsType(cppType: string): string {
  if (cppToTsMap[cppType]) return cppToTsMap[cppType];
  if (isOcctEnum(cppType)) return cppType;
  if (isOcctClass(cppType)) return cppType;
  return cppType;
}

/** Map C++ type to embind signature type */
export function cppToEmbindType(cppType: string): string {
  if (cppToEmbindMap[cppType]) return cppToEmbindMap[cppType];
  if (isOcctEnum(cppType)) return cppType;
  if (isOcctClass(cppType)) return `const ${cppType}&`;
  return cppType;
}

/** Get TypeScript type for an Arg */
export function tsTypeForArg(arg: Arg): string {
  return cppToTsType(arg.type);
}

/** Check if a type is a primitive (number, boolean, string, void) in TypeScript */
export function isPrimitive(cppType: string): boolean {
  return cppType in cppToTsMap;
}

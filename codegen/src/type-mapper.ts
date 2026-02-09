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

// Known OCCT class prefixes (types that are OCCT classes, not primitives)
const occtPrefixes = [
  'gp_', 'TopoDS_', 'TopExp_', 'BRep_', 'TopAbs_', 'TopLoc_',
  'Geom_', 'Geom2d_', 'BRepTools_', 'TopTools_',
];

/** Check if a C++ type is an OCCT class (not a primitive) */
export function isOcctClass(type: string): boolean {
  return occtPrefixes.some(p => type.startsWith(p));
}

/** Check if a C++ type is an OCCT enum */
export function isOcctEnum(type: string): boolean {
  const knownEnums = [
    'gp_TrsfForm', 'gp_EulerSequence',
    'TopAbs_ShapeEnum', 'TopAbs_Orientation', 'TopAbs_State',
  ];
  return knownEnums.includes(type);
}

/** Map C++ type to TypeScript type */
export function cppToTsType(cppType: string): string {
  if (cppToTsMap[cppType]) return cppToTsMap[cppType];
  if (isOcctEnum(cppType)) return cppType; // enums are used directly
  if (isOcctClass(cppType)) return cppType; // OCCT classes map to wrapper class names
  return cppType; // fallback: use as-is
}

/** Map C++ type to embind signature type */
export function cppToEmbindType(cppType: string): string {
  if (cppToEmbindMap[cppType]) return cppToEmbindMap[cppType];
  if (isOcctClass(cppType)) return `const ${cppType}&`; // OCCT classes passed by const ref
  return cppType;
}

/** Get TypeScript type for an Arg */
export function tsTypeForArg(arg: Arg): string {
  return cppToTsType(arg.type);
}

/** Get embind return type - for OCCT classes, return by value */
export function embindReturnType(cppType: string): string {
  if (cppToEmbindMap[cppType]) return cppToEmbindMap[cppType];
  return cppType; // OCCT classes returned by value
}

/** Check if a type is a primitive (number, boolean, string, void) in TypeScript */
export function isPrimitive(cppType: string): boolean {
  return cppType in cppToTsMap;
}

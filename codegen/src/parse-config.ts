import { parse } from 'yaml';
import { readFileSync } from 'node:fs';
import { join } from 'node:path';

// ---------------------------------------------------------------------------
// Interfaces for the YAML config schema
// ---------------------------------------------------------------------------

export interface Arg {
  name: string;
  type: string; // C++ type (e.g., "Standard_Real", "gp_Pnt")
  mut?: boolean; // true if the C++ param is a non-const reference (mutable)
}

export interface MethodOverload {
  suffix: string; // e.g., "_Pnt", "_Ax1"
  args: Arg[];
  returns?: string; // C++ return type, defaults to parent method's returns or "void"
  const?: boolean;
  static?: boolean;
  output_args?: boolean; // true if this overload uses output ref params (wrapper returns value instead)
}

export interface MethodDef {
  // For overloaded methods:
  overloads?: MethodOverload[];
  // For non-overloaded methods (shorthand):
  args?: Arg[];
  returns?: string; // C++ return type, defaults to "void"
  const?: boolean;
  static?: boolean;
  output_args?: boolean; // true if C++ uses output ref params (wrapper returns value instead)
}

export interface ConstructorDef {
  args: Arg[];
  factory?: string; // If set, bind as class_function factory (for same-argcount constructor disambiguation)
}

export interface ClassDef {
  include: string; // Header file (e.g., "gp_Pnt.hxx")
  constructors: ConstructorDef[];
  methods: Record<string, MethodDef>;
  skip?: string[];
}

export interface EnumDef {
  include: string;
  values: string[];
}

export interface ModuleConfig {
  module: string;
  classes: Record<string, ClassDef>;
  enums: Record<string, EnumDef>;
}

export interface ModulesConfig {
  modules: Record<string, {
    enabled: boolean;
    config: string;
  }>;
}

// ---------------------------------------------------------------------------
// Config loading functions
// ---------------------------------------------------------------------------

export function loadModulesConfig(configDir: string): ModulesConfig {
  const raw = readFileSync(join(configDir, 'modules.yaml'), 'utf-8');
  return parse(raw) as ModulesConfig;
}

export function loadModuleConfig(configDir: string, filename: string): ModuleConfig {
  const raw = readFileSync(join(configDir, filename), 'utf-8');
  return parse(raw) as ModuleConfig;
}

// ---------------------------------------------------------------------------
// Helper functions
// ---------------------------------------------------------------------------

/** Normalize a MethodDef: if it has no overloads array, return it as-is (simple method).
 *  This helper makes it easy for consumers to check if a method is overloaded. */
export function isOverloaded(method: MethodDef): boolean {
  return Array.isArray(method.overloads) && method.overloads.length > 1;
}

/** Get the effective return type for an overload or simple method */
export function getReturnType(method: MethodDef, overload?: MethodOverload): string {
  if (overload?.returns) return overload.returns;
  return method.returns ?? 'void';
}

/** Get all overloads for a method. For non-overloaded methods, returns a single-element array. */
export function getOverloads(method: MethodDef): MethodOverload[] {
  if (method.overloads) return method.overloads;
  // Convert shorthand to a single "overload" with empty suffix
  return [{
    suffix: '',
    args: method.args ?? [],
    returns: method.returns,
    const: method.const,
    static: method.static,
    output_args: method.output_args,
  }];
}

import { parse } from 'yaml';
import { readFileSync } from 'node:fs';
import { join } from 'node:path';

// ---------------------------------------------------------------------------
// Minimal YAML interfaces (what humans write in .minimal.yaml configs)
// ---------------------------------------------------------------------------

export interface MinimalOverloadDef {
  match: string[];
  suffix?: string;
  output_args?: boolean;
  mut_args?: string[];
  skip?: boolean;
}

export interface MinimalMethodDef {
  overloads?: MinimalOverloadDef[];
  skip?: boolean;
  output_args?: boolean;
  mut_args?: string[];
}

export interface MinimalConstructorDef {
  match?: string[];
  factory?: string;
  skip?: boolean;
}

export interface MinimalClassDef {
  include?: string;
  constructors?: MinimalConstructorDef[];
  methods?: Record<string, MinimalMethodDef>;
  skip?: string[];
  suppress_inherits?: boolean;
}

export interface MinimalEnumDef {
  include: string;
}

export interface MinimalModuleConfig {
  module: string;
  classes: Record<string, MinimalClassDef>;
  enums?: Record<string, MinimalEnumDef>;
}

// ---------------------------------------------------------------------------
// Resolved config interfaces (output of merge, input to emitters)
// ---------------------------------------------------------------------------

export interface Arg {
  name: string;
  type: string;
  mut?: boolean;
}

export interface MethodOverload {
  suffix: string;
  args: Arg[];
  returns?: string;
  const?: boolean;
  static?: boolean;
  output_args?: boolean;
}

export interface MethodDef {
  overloads?: MethodOverload[];
  args?: Arg[];
  returns?: string;
  const?: boolean;
  static?: boolean;
  output_args?: boolean;
}

export interface ConstructorDef {
  args: Arg[];
  factory?: string;
}

export interface ClassDef {
  include: string;
  constructors: ConstructorDef[];
  methods: Record<string, MethodDef>;
  skip?: string[];
  inherits?: string;
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
// Config loading
// ---------------------------------------------------------------------------

export function loadModulesConfig(configDir: string): ModulesConfig {
  const raw = readFileSync(join(configDir, 'modules.yaml'), 'utf-8');
  return parse(raw) as ModulesConfig;
}

export function loadMinimalConfig(configDir: string, filename: string): MinimalModuleConfig {
  const raw = readFileSync(join(configDir, filename), 'utf-8');
  return parse(raw) as MinimalModuleConfig;
}

// ---------------------------------------------------------------------------
// Helpers (used by emitters)
// ---------------------------------------------------------------------------

export function isOverloaded(method: MethodDef): boolean {
  return Array.isArray(method.overloads) && method.overloads.length > 1;
}

export function getReturnType(method: MethodDef, overload?: MethodOverload): string {
  if (overload?.returns) return overload.returns;
  return method.returns ?? 'void';
}

export function getOverloads(method: MethodDef): MethodOverload[] {
  if (method.overloads) return method.overloads;
  return [{
    suffix: '',
    args: method.args ?? [],
    returns: method.returns,
    const: method.const,
    static: method.static,
    output_args: method.output_args,
  }];
}

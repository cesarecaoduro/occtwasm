import { readFileSync } from 'node:fs';

// ---------------------------------------------------------------------------
// Exported interfaces for parsed header data
// ---------------------------------------------------------------------------

export interface HeaderArg {
  name: string;
  type: string;
  isConst: boolean;
  isRef: boolean;
}

export interface HeaderMethod {
  name: string;
  args: HeaderArg[];
  returnType: string;
  isConst: boolean;
  isStatic: boolean;
}

export interface HeaderConstructor {
  args: HeaderArg[];
}

export interface HeaderClass {
  name: string;
  parentClass?: string;
  constructors: HeaderConstructor[];
  methods: HeaderMethod[];
}

export interface HeaderEnum {
  name: string;
  values: string[];
}

export interface ParseResult {
  classes: HeaderClass[];
  enums: HeaderEnum[];
}

// ---------------------------------------------------------------------------
// Macro / qualifier stripping
// ---------------------------------------------------------------------------

const STRIP_WORDS = [
  'Standard_EXPORT',
  'Standard_NODISCARD',
  'Standard_DEPRECATED',
  'constexpr',
  'inline',
  'explicit',
  'virtual',
  'noexcept',
  'override',
  'final',
];

function stripMacros(line: string): string {
  let result = line;
  for (const macro of STRIP_WORDS) {
    result = result.replace(new RegExp(`\\b${macro}\\b`, 'g'), '');
  }
  return result.replace(/\s+/g, ' ').trim();
}

// ---------------------------------------------------------------------------
// Type parsing helpers
// ---------------------------------------------------------------------------

function parseParamType(raw: string): { type: string; isConst: boolean; isRef: boolean } {
  let s = raw.trim();
  const isConst = s.includes('const');
  const isRef = s.includes('&');
  s = s.replace(/\bconst\b/g, '').replace(/&/g, '').trim();
  s = s.replace(/\s+/g, ' ').trim();
  return { type: s, isConst, isRef };
}

function splitArgs(s: string): string[] {
  const parts: string[] = [];
  let depth = 0;
  let current = '';
  for (const ch of s) {
    if (ch === '<' || ch === '(') depth++;
    else if (ch === '>' || ch === ')') depth--;
    else if (ch === ',' && depth === 0) {
      parts.push(current);
      current = '';
      continue;
    }
    current += ch;
  }
  if (current.trim()) parts.push(current);
  return parts;
}

function parseSingleArg(decl: string): HeaderArg | null {
  let s = decl.trim();

  // Remove default values
  const eqIdx = s.indexOf('=');
  if (eqIdx !== -1) s = s.substring(0, eqIdx).trim();

  // Check for unsupported types
  if (s.includes('Handle(') || s.includes('Handle (') ||
      s.includes('NCollection') || s.includes('TCollection') ||
      s.includes('Standard_OStream') || s.includes('Standard_SStream') ||
      s.includes('Standard_IStream') ||
      s.includes('...') || s.includes('*') ||
      s.includes('<') || s.includes('>')) {
    return null;
  }

  const { type, isConst, isRef } = parseParamType(s);

  const tokens = type.split(/\s+/);
  if (tokens.length < 2) return null;

  const name = tokens[tokens.length - 1];
  const typePart = tokens.slice(0, -1).join(' ');

  if (!typePart || !name) return null;
  if (name === 'void' || name === 'const') return null;

  return { name, type: typePart, isConst, isRef };
}

function parseArgs(argsStr: string): HeaderArg[] | null {
  const s = argsStr.trim();
  if (!s) return [];

  const args: HeaderArg[] = [];
  const parts = splitArgs(s);

  for (const part of parts) {
    const parsed = parseSingleArg(part.trim());
    if (!parsed) return null;
    args.push(parsed);
  }

  return args;
}

// ---------------------------------------------------------------------------
// Skip patterns
// ---------------------------------------------------------------------------

function shouldSkipDeclaration(stmt: string): boolean {
  const s = stmt.trim();
  if (/\boperator\b/.test(s)) return true;
  if (s.startsWith('template')) return true;
  if (s.includes('DEFINE_STANDARD_ALLOC')) return true;
  if (s.startsWith('friend ')) return true;
  if (s.startsWith('using ')) return true;
  if (s.startsWith('typedef ')) return true;
  // Skip pure virtual methods (= 0) but allow regular virtual methods
  if (/=\s*0\s*$/.test(s)) return true;
  if (/^DEFINE_/.test(s)) return true;
  return false;
}

function escapeRegex(s: string): string {
  return s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

// ---------------------------------------------------------------------------
// Statement parsing (from a clean declaration string, no braces/bodies)
// ---------------------------------------------------------------------------

function parseMethodFromDecl(decl: string, className: string): HeaderMethod | null {
  let s = stripMacros(decl);
  if (shouldSkipDeclaration(s)) return null;

  // Skip destructor
  if (s.includes(`~${className}`)) return null;

  // Skip constructor
  const ctorRe = new RegExp(`^\\s*${escapeRegex(className)}\\s*\\(`);
  if (ctorRe.test(s)) return null;

  // Must have parentheses
  if (!s.includes('(')) return null;

  const isStatic = /\bstatic\b/.test(s);
  s = s.replace(/\bstatic\b/g, '').trim();

  // Find the opening parenthesis
  const parenStart = s.indexOf('(');
  if (parenStart === -1) return null;

  // Find matching close paren
  let depth = 1;
  let parenEnd = -1;
  for (let i = parenStart + 1; i < s.length; i++) {
    if (s[i] === '(') depth++;
    else if (s[i] === ')') {
      depth--;
      if (depth === 0) { parenEnd = i; break; }
    }
  }
  if (parenEnd === -1) return null;

  const argsStr = s.substring(parenStart + 1, parenEnd);
  const afterParen = s.substring(parenEnd + 1).trim();
  const isConst = /\bconst\b/.test(afterParen);

  // Parse return type and method name from before paren
  const beforeParen = s.substring(0, parenStart).trim();
  const tokens = beforeParen.split(/\s+/);
  if (tokens.length < 2) return null;

  const methodName = tokens[tokens.length - 1];
  let returnType = tokens.slice(0, -1).join(' ');
  returnType = returnType.replace(/\bconst\b/g, '').replace(/&/g, '').trim();
  if (!returnType) returnType = 'void';

  // Skip unsupported return types
  if (returnType.includes('Handle(') || returnType.includes('Handle (') ||
      returnType.includes('NCollection') || returnType.includes('TCollection') ||
      returnType.includes('Standard_OStream') || returnType.includes('Standard_SStream') ||
      returnType.includes('*') || returnType.includes('<') || returnType.includes('>')) {
    return null;
  }

  // Skip out-of-class definitions
  if (methodName.includes('::')) return null;

  const args = parseArgs(argsStr);
  if (args === null) return null;

  return { name: methodName, args, returnType, isConst, isStatic };
}

function parseCtorFromDecl(decl: string, className: string): HeaderConstructor | null {
  let s = stripMacros(decl);
  if (shouldSkipDeclaration(s)) return null;
  if (s.includes(`~${className}`)) return null;

  const ctorRe = new RegExp(`^\\s*${escapeRegex(className)}\\s*\\(`);
  if (!ctorRe.test(s)) return null;

  const parenStart = s.indexOf('(');
  if (parenStart === -1) return null;

  let depth = 1;
  let parenEnd = -1;
  for (let i = parenStart + 1; i < s.length; i++) {
    if (s[i] === '(') depth++;
    else if (s[i] === ')') {
      depth--;
      if (depth === 0) { parenEnd = i; break; }
    }
  }
  if (parenEnd === -1) return null;

  const argsStr = s.substring(parenStart + 1, parenEnd);

  // Skip template constructors
  const beforeParen = s.substring(0, parenStart).trim();
  if (beforeParen.includes('template') || beforeParen.includes('<')) return null;

  const args = parseArgs(argsStr);
  if (args === null) return null;

  return { args };
}

// ---------------------------------------------------------------------------
// Enum parsing
// ---------------------------------------------------------------------------

function parseEnumValue(line: string): string | null {
  let s = line.trim();
  s = s.replace(/,\s*$/, '');
  const commentIdx = s.indexOf('//');
  if (commentIdx !== -1) s = s.substring(0, commentIdx).trim();
  const eqIdx = s.indexOf('=');
  if (eqIdx !== -1) s = s.substring(0, eqIdx).trim();
  s = s.trim();
  if (!s || s === '{' || s === '}') return null;
  if (/^[A-Za-z_][A-Za-z0-9_]*$/.test(s)) return s;
  return null;
}

// ---------------------------------------------------------------------------
// Main parser - processes the entire file content at once
// ---------------------------------------------------------------------------

export function parseHeaderFile(filePath: string): ParseResult {
  const content = readFileSync(filePath, 'utf-8');
  return parseHeaderContent(content);
}

/** Strip block comments (/* ... *\/) from source text */
function stripBlockComments(src: string): string {
  return src.replace(/\/\*[\s\S]*?\*\//g, '');
}

export function parseHeaderContent(content: string): ParseResult {
  const stripped = stripBlockComments(content);
  const lines = stripped.split('\n');
  const classes: HeaderClass[] = [];
  const enums: HeaderEnum[] = [];

  // State tracking
  let currentClass: HeaderClass | null = null;
  let pendingClass: HeaderClass | null = null; // class decl seen but no '{' yet
  let accessLevel: 'public' | 'protected' | 'private' = 'private';
  let braceDepth = 0;
  let classStartDepth = 0;
  let inlineBodyDepth = -1;   // depth at which an inline body started (-1 = not in inline body)
  let declBuffer = '';         // accumulates declaration text
  let inEnum: HeaderEnum | null = null;
  let enumStartDepth = 0;

  for (const rawLine of lines) {
    // Strip comments
    let line = rawLine;
    const commentIdx = line.indexOf('//');
    if (commentIdx !== -1) line = line.substring(0, commentIdx);
    line = line.trim();

    if (!line) continue;
    if (line.startsWith('#')) continue;

    // Count braces on this line
    const openBraces = (line.match(/{/g) || []).length;
    const closeBraces = (line.match(/}/g) || []).length;
    const netBraces = openBraces - closeBraces;

    // === Inside an inline body (skip until matching close) ===
    if (inlineBodyDepth >= 0) {
      braceDepth += netBraces;
      if (braceDepth <= inlineBodyDepth) {
        inlineBodyDepth = -1;
      }
      continue;
    }

    // === Outside any class: detect out-of-class inline impls ===
    if (!currentClass && !inEnum) {
      if (/\w+::\w+/.test(line) && openBraces > 0 && !line.startsWith('class ') && !line.startsWith('struct ')) {
        braceDepth += netBraces;
        if (braceDepth > 0 && openBraces > closeBraces) {
          inlineBodyDepth = braceDepth - netBraces;
        }
        continue;
      }
    }

    // === Detect enum ===
    if (!currentClass && !inEnum) {
      const enumMatch = line.match(/^enum\s+(\w+)/);
      if (enumMatch) {
        inEnum = { name: enumMatch[1], values: [] };
        enumStartDepth = braceDepth;
        braceDepth += netBraces;
        continue;
      }
    }

    // === Inside enum ===
    if (inEnum) {
      braceDepth += netBraces;
      if (line.includes('}') && braceDepth <= enumStartDepth) {
        enums.push(inEnum);
        inEnum = null;
        continue;
      }
      const val = parseEnumValue(line);
      if (val) inEnum.values.push(val);
      continue;
    }

    // === Handle pending class (waiting for opening brace) ===
    if (pendingClass && !currentClass) {
      if (line === '{' || line.startsWith('{')) {
        currentClass = pendingClass;
        pendingClass = null;
        classStartDepth = braceDepth;
        accessLevel = 'private';
        braceDepth += netBraces;
        declBuffer = '';
        continue;
      } else {
        // Not a brace - might be part of the class declaration (inheritance)
        // or something else entirely
        pendingClass = null;
      }
    }

    // === Detect class ===
    if (!currentClass) {
      const classMatch = line.match(/^class\s+(\w+)\s*(?::\s*(?:public\s+)?(\w+)\s*)?/);
      if (classMatch && !line.includes(';')) {
        const cls: HeaderClass = { name: classMatch[1], constructors: [], methods: [] };
        if (classMatch[2]) cls.parentClass = classMatch[2];

        if (openBraces > 0) {
          // Opening brace on same line
          currentClass = cls;
          classStartDepth = braceDepth;
          accessLevel = 'private';
          braceDepth += netBraces;
          declBuffer = '';
        } else {
          // Opening brace will be on next line
          pendingClass = cls;
          braceDepth += netBraces;
        }
        continue;
      }
      braceDepth += netBraces;
      continue;
    }

    // === Inside a class ===

    // Check access level changes (before updating braces)
    const accessMatch = line.match(/^(public|protected|private)\s*:/);
    if (accessMatch) {
      accessLevel = accessMatch[1] as 'public' | 'protected' | 'private';
      braceDepth += netBraces;
      declBuffer = '';
      continue;
    }

    // Lines that are just `}` or `};` - update brace depth
    if (/^\}/.test(line)) {
      braceDepth += netBraces;
      // Check if we've exited the class
      if (braceDepth <= classStartDepth) {
        classes.push(currentClass);
        currentClass = null;
        declBuffer = '';
      }
      continue;
    }

    // If not public, skip but track braces
    if (accessLevel !== 'public') {
      braceDepth += netBraces;
      // If we just entered a nested scope, skip it
      if (openBraces > closeBraces) {
        inlineBodyDepth = braceDepth - netBraces;
      }
      continue;
    }

    // --- Public member processing ---

    // Skip standalone macros that don't end with ; or {
    if (/^DEFINE_\w+$/.test(line) || line === 'DEFINE_STANDARD_ALLOC') {
      continue;
    }

    // If this line has a '{', it's an inline implementation
    if (openBraces > 0) {
      // Extract the declaration part (before the '{')
      const braceIdx = line.indexOf('{');
      const declPart = line.substring(0, braceIdx).trim();

      // Append declaration part to buffer
      if (declPart) {
        declBuffer += ' ' + declPart;
      }

      // Process the accumulated declaration
      const fullDecl = declBuffer.trim();
      if (fullDecl) {
        processDeclaration(fullDecl, currentClass);
      }
      declBuffer = '';

      // Skip the inline body
      braceDepth += netBraces;
      if (braceDepth > classStartDepth + 1) {
        // Multi-line inline body
        inlineBodyDepth = braceDepth - netBraces;
      }
      // If open == close on same line (single-line body like `{ return x; }`),
      // we don't need to enter inline body mode
      continue;
    }

    // If this line has a ';', it completes a declaration
    if (line.includes(';')) {
      const semiIdx = line.indexOf(';');
      const declPart = line.substring(0, semiIdx).trim();
      if (declPart) {
        declBuffer += ' ' + declPart;
      }

      const fullDecl = declBuffer.trim();
      if (fullDecl) {
        processDeclaration(fullDecl, currentClass);
      }
      declBuffer = '';
      braceDepth += netBraces;
      continue;
    }

    // Continuation line - append to buffer
    declBuffer += ' ' + line;
    braceDepth += netBraces;
  }

  // If we have an unfinished class, push it
  if (currentClass) {
    classes.push(currentClass);
  }

  return { classes, enums };
}

function processDeclaration(decl: string, cls: HeaderClass): void {
  // Clean the declaration: remove init list colons
  let cleanDecl = decl;
  const colonIdx = findInitListColon(cleanDecl);
  if (colonIdx !== -1) {
    cleanDecl = cleanDecl.substring(0, colonIdx).trim();
  }

  if (!cleanDecl) return;

  // Try constructor first
  const ctor = parseCtorFromDecl(cleanDecl, cls.name);
  if (ctor) {
    cls.constructors.push(ctor);
    return;
  }

  // Try method
  const method = parseMethodFromDecl(cleanDecl, cls.name);
  if (method) {
    cls.methods.push(method);
  }
}

/** Find the colon that starts a constructor initializer list.
 *  Strategy: find the FIRST top-level ')' (the one closing the parameter list),
 *  then look for ':' between it and the next identifier.
 */
function findInitListColon(s: string): number {
  // Find the first '(' which opens the parameter list
  const firstParen = s.indexOf('(');
  if (firstParen === -1) return -1;

  // Find the matching ')'
  let depth = 1;
  let matchingClose = -1;
  for (let i = firstParen + 1; i < s.length; i++) {
    if (s[i] === '(') depth++;
    else if (s[i] === ')') {
      depth--;
      if (depth === 0) { matchingClose = i; break; }
    }
  }
  if (matchingClose === -1) return -1;

  // Look for ':' after the matching close paren (skipping whitespace and noexcept etc.)
  for (let i = matchingClose + 1; i < s.length; i++) {
    if (s[i] === ':') return i;
  }
  return -1;
}

// ---------------------------------------------------------------------------
// Unsupported type filtering (shared across codegen)
// ---------------------------------------------------------------------------

const UNSUPPORTED_TYPE_PATTERNS = [
  'Handle', 'NCollection', 'TCollection',
  'Standard_OStream', 'Standard_SStream', 'Standard_IStream',
  'TopLoc_Location',
];

/** Primitive types that cannot be passed by non-const reference in embind */
const PRIMITIVE_TYPES = new Set([
  'Standard_Real', 'Standard_Integer', 'Standard_Boolean', 'Standard_CString',
  'double', 'float', 'int', 'bool',
]);

export function isUnsupportedType(type: string): boolean {
  if (UNSUPPORTED_TYPE_PATTERNS.some(p => type.includes(p))) return true;
  if (type.includes('::')) return true;
  if (/^[A-Z]$/.test(type)) return true;
  return false;
}

export function hasUnsupportedArgs(args: HeaderArg[]): boolean {
  return args.some(a => {
    if (isUnsupportedType(a.type)) return true;
    if (a.isRef && !a.isConst && PRIMITIVE_TYPES.has(a.type)) return true;
    return false;
  });
}

export function hasUnsupportedReturn(method: HeaderMethod): boolean {
  return isUnsupportedType(method.returnType);
}

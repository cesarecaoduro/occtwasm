# @occtwasm/core

OpenCascade (OCCT) compiled to WebAssembly with TypeScript bindings.

## Status

Work in progress. See [plans/PLAN.md](plans/PLAN.md) for the implementation plan.

## Architecture

Two-layer binding approach:

1. **embind C++ layer** - Exposes OCCT classes to WASM with disambiguated names for overloaded methods
2. **TypeScript wrapper layer** - Provides proper method overloads with runtime `instanceof` dispatch

This approach is needed because Emscripten's embind only supports overloading by argument *count*, while OCCT heavily overloads by *type*.

## Quick Start

```typescript
import { initOCCT, gp_Pnt, gp_Trsf, gp_Ax1, gp_Dir } from '@occtwasm/core';

await initOCCT();

const origin = new gp_Pnt(0, 0, 0);
const p = new gp_Pnt(1, 2, 3);
const dist = origin.Distance(p);

const trsf = new gp_Trsf();
trsf.SetMirror(origin);                              // Mirror(gp_Pnt)
trsf.SetMirror(new gp_Ax1(origin, new gp_Dir(0,0,1))); // Mirror(gp_Ax1)
```

## Building from Source

### Prerequisites

- Docker (for Emscripten toolchain)
- Node.js >= 18
- npm

### Build Steps

```bash
npm install          # Install TS dependencies
make download        # Download OCCT source
make build-occt      # Build OCCT static libs (Docker)
make codegen         # Generate embind C++ and TS wrappers
make build-bindings  # Compile WASM module (Docker)
npm run build        # Build TypeScript package
npm test             # Run tests
```

## Project Structure

```
scripts/           # Download and build scripts (Docker-based)
codegen/           # YAML configs + TypeScript code generator
  config/          # Per-toolkit binding declarations
  src/             # Codegen tool source
bindings/
  generated/       # Auto-generated embind C++ and TS wrappers
  manual/          # Hand-written helpers (casting, module loading)
src/               # NPM package entry point
tests/             # Vitest test suite
swig/              # Reference SWIG interface files
```

## Initial Scope

~25 classes from gp (geometric primitives) and TopoDS (topological data structure):

- **gp**: Pnt, Vec, Dir, Ax1, Ax2, Ax3, Trsf, Mat, Quaternion, XYZ, Lin, Pln, Circ, Elips
- **TopoDS**: Shape, Vertex, Edge, Wire, Face, Shell, Solid, Compound, Builder, Iterator
- **TopExp**: Explorer
- **BRep**: Builder, Tool

## License

LGPL-2.1 (same as OCCT)

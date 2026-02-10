## Complete Corresponding Source Availability

This package distributes OCCT-based object code (`dist/occt.wasm` and
`dist/occt.js`) under LGPL-2.1-only WITH OCCT-exception-1.0.

Complete corresponding source for this distribution is available from:

- This project repository: https://github.com/cesarecaoduro/occtwasm
- OCCT upstream source at the exact pinned submodule commit:
  https://github.com/Open-Cascade-SAS/OCCT/tree/c1f6a132406913b3883f9184525518da7bdca8d4

The build and installation scripts used to produce this distribution are in:

- `scripts/build-wasm.sh`
- `scripts/build-bindings.sh`
- `Makefile`

To fetch sources and rebuild from source:

```bash
git clone https://github.com/cesarecaoduro/occtwasm.git
cd occtwasm
git submodule update --init --recursive
make build-occt
make codegen
make build-bindings
npm run build
```

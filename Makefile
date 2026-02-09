# occtwasm - OpenCascade to WebAssembly
# ======================================
#
# Prerequisites:
#   - Emscripten installed locally (emcmake, emmake, em++ on PATH)
#   - Node.js / npm installed

.PHONY: all init-submodule build-occt codegen build-bindings build test test-watch typecheck clean clean-all install

all: init-submodule build-occt codegen build-bindings build

# --- OCCT Source (git submodule) ---
init-submodule:
	git submodule update --init --recursive

# --- Build OCCT static libs (local Emscripten) ---
build-occt:
	bash scripts/build-wasm.sh

# --- Code generation ---
codegen:
	npx tsx codegen/src/codegen.ts

# --- Compile embind C++ into WASM (local Emscripten) ---
build-bindings:
	bash scripts/build-bindings.sh

# --- TypeScript build ---
build:
	npx tsup

# --- Tests ---
test:
	npx vitest run

test-watch:
	npx vitest

# --- Utilities ---
typecheck:
	npx tsc --noEmit

clean:
	rm -rf dist build/occt-wasm build/dist bindings/generated

clean-all: clean
	rm -rf build/occt-install node_modules

# --- Install deps ---
install:
	npm install

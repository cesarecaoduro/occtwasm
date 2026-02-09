# occtwasm - OpenCascade to WebAssembly
# ======================================

OCCT_TAG ?= V8_0_0_rc3
DOCKER_IMAGE := occtwasm-builder

.PHONY: all download build-occt codegen build-bindings build test clean docker-build

all: download build-occt codegen build-bindings build

# --- Docker ---
docker-build:
	docker build -t $(DOCKER_IMAGE) .

# --- OCCT Source ---
download:
	bash scripts/download-occt.sh

# --- Build OCCT static libs (inside Docker) ---
build-occt: docker-build
	bash scripts/build-wasm.sh

# --- Code generation ---
codegen:
	npx tsx codegen/src/codegen.ts

# --- Compile embind C++ into WASM (inside Docker) ---
build-bindings: docker-build
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
	rm -rf build/occt-source node_modules

# --- Install deps ---
install:
	npm install

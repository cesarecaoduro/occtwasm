// module-registry.ts
//
// Shared registry for the active OCCT Emscripten module instance.
// Generated bindings and manual helpers resolve the Module from here
// instead of relying on a global.

import type { OcctModule } from "./types";

let currentModule: OcctModule | null = null;

/** Set the active OCCT module instance used by bindings. */
export function setOCCTModule(module: OcctModule): void {
  currentModule = module;
}

/** Get the active OCCT module instance, or throw if not initialized. */
export function getOCCTModule(): OcctModule {
  if (!currentModule) {
    throw new Error(
      "OCCT module not initialized. Call initOCCT() before using bindings."
    );
  }
  return currentModule;
}


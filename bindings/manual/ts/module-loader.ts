// bindings/manual/ts/module-loader.ts
//
// Async loader for the OCCT WebAssembly module. Wraps the Emscripten-generated
// factory function (`createOCCTModule`) with proper TypeScript types, singleton
// caching, and support for custom WASM file location.

import type { OcctModule, InitOptions } from "./types";

export type { InitOptions } from "./types";

// ---------------------------------------------------------------------------
// Singleton cache
// ---------------------------------------------------------------------------

/** Cached module instance; set after the first successful initialisation. */
let cachedModule: OcctModule | null = null;

/**
 * Guard against concurrent calls: if an initialisation is already in flight we
 * return the same promise instead of starting a second one.
 */
let pendingInit: Promise<OcctModule> | null = null;

// ---------------------------------------------------------------------------
// Factory import helper
// ---------------------------------------------------------------------------

/**
 * Dynamically import the Emscripten-generated glue code (`occt.js`).
 *
 * The build produces an ES module whose default export is the factory function
 * `createOCCTModule` (configured via `-s EXPORT_ES6=1 -s EXPORT_NAME=…`).
 *
 * We use a dynamic `import()` so that:
 *   1. The generated JS is loaded lazily, only when `initOCCT()` is called.
 *   2. Bundlers can still resolve the specifier at build time if desired.
 *   3. We avoid a static import of an untyped generated file at the top level.
 */
async function loadFactory(): Promise<
  (moduleOverrides?: Record<string, unknown>) => Promise<OcctModule>
> {
  // The specifier must match the output location relative to the final package
  // layout. Both the JS glue and the WASM binary live in `build/dist/`.
  //
  // When consumed as the `@occtwasm/core` npm package the bundler / runtime
  // resolves this relative import against the package's file structure.
  const glue = (await import(
    /* webpackIgnore: true */
    "../../../build/dist/occt.js"
  )) as { default: (moduleOverrides?: Record<string, unknown>) => Promise<OcctModule> };

  // Emscripten with EXPORT_ES6=1 places the factory on `default`.
  if (typeof glue.default !== "function") {
    throw new Error(
      "Failed to load the OCCT WASM glue code: the default export of " +
        "'occt.js' is not a function. Ensure the module was built with " +
        "MODULARIZE=1 and EXPORT_ES6=1.",
    );
  }

  return glue.default;
}

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

/**
 * Initialise the OCCT WebAssembly module and return the ready-to-use instance.
 *
 * The first call downloads and compiles the WASM binary; subsequent calls
 * return the cached singleton immediately.
 *
 * @param options - Optional configuration (e.g. custom WASM file location).
 * @returns A promise that resolves to the fully initialised {@link OcctModule}.
 *
 * @example
 * ```ts
 * import { initOCCT } from "@occtwasm/core";
 *
 * const occt = await initOCCT();
 * const pnt  = new occt.gp_Pnt(1, 2, 3);
 * console.log(pnt.X()); // 1
 * ```
 *
 * @example Custom WASM location (e.g. served from a CDN):
 * ```ts
 * const occt = await initOCCT({
 *   locateFile: (path) => `https://cdn.example.com/wasm/${path}`,
 * });
 * ```
 */
export async function initOCCT(options?: InitOptions): Promise<OcctModule> {
  // Return the cached module immediately if already initialised.
  if (cachedModule !== null) {
    return cachedModule;
  }

  // If another call is already in flight, wait for it rather than starting a
  // second initialisation.
  if (pendingInit !== null) {
    return pendingInit;
  }

  pendingInit = (async (): Promise<OcctModule> => {
    const createOCCTModule = await loadFactory();

    // Assemble the Emscripten module-override object.
    const moduleOverrides: Record<string, unknown> = {};

    if (options?.locateFile) {
      moduleOverrides["locateFile"] = options.locateFile;
    }

    const instance = await createOCCTModule(moduleOverrides);

    // Cache for subsequent calls.
    cachedModule = instance;

    return instance;
  })();

  try {
    return await pendingInit;
  } finally {
    // Clear the in-flight guard whether we succeeded or failed so a retry is
    // possible after a transient error.
    pendingInit = null;
  }
}

/**
 * Core type definitions for the occtwasm WASM module.
 *
 * Provides the OcctModule interface (Emscripten module shape),
 * initialization options, and cast helper function types matching
 * the functions exposed by cast_helpers.cpp.
 */

// ---------------------------------------------------------------------------
// Emscripten WASM module
// ---------------------------------------------------------------------------

/** Initialized Emscripten WASM module produced by createOCCTModule(). */
export interface OcctModule {
  // --- Standard Emscripten heap views ---
  HEAP8: Int8Array;
  HEAP16: Int16Array;
  HEAP32: Int32Array;
  HEAPU8: Uint8Array;
  HEAPU16: Uint16Array;
  HEAPU32: Uint32Array;
  HEAPF32: Float32Array;
  HEAPF64: Float64Array;

  // --- Memory management ---
  _malloc(size: number): number;
  _free(ptr: number): void;

  // --- Runtime state ---
  calledRun: boolean;

  // --- Cast helpers (from cast_helpers.cpp) ---
  TopoDS_ToVertex: CastHelper;
  TopoDS_ToEdge: CastHelper;
  TopoDS_ToWire: CastHelper;
  TopoDS_ToFace: CastHelper;
  TopoDS_ToShell: CastHelper;
  TopoDS_ToSolid: CastHelper;
  TopoDS_ToCompSolid: CastHelper;
  TopoDS_ToCompound: CastHelper;

  /**
   * Index signature so that any embind-registered class (e.g. gp_Pnt,
   * TopoDS_Shape, BRepPrimAPI_MakeBox, ...) can be accessed dynamically
   * without requiring an exhaustive static listing.
   */
  [key: string]: any;
}

// ---------------------------------------------------------------------------
// Initialization
// ---------------------------------------------------------------------------

/** Options passed to createOCCTModule(). */
export interface InitOptions {
  /** Custom resolver for the .wasm file location. */
  locateFile?: (path: string, scriptDirectory: string) => string;
}

// ---------------------------------------------------------------------------
// Cast helper signature
// ---------------------------------------------------------------------------

/**
 * Function type for the TopoDS_To* cast helpers.
 *
 * Each helper takes a raw embind handle representing a TopoDS_Shape and
 * returns a raw embind handle for the specific subtype (Vertex, Edge, etc.).
 */
export type CastHelper = (shape: any) => any;

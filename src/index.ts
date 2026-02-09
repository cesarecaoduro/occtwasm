// Main entry point for @cesarecaoduro/occtwasm-core
//
// Re-exports the WASM module loader, types, and all bindings so that
// consumers can use either:
//   import { initOCCT, gp_Pnt } from '@cesarecaoduro/occtwasm-core';
// or sub-path imports:
//   import { initOCCT } from '@cesarecaoduro/occtwasm-core';
//   import { gp_Pnt } from '@cesarecaoduro/occtwasm-core/TKMath';

// Module loader & types
export { initOCCT } from '../bindings/manual/ts/module-loader.js';
export { getOCCTModule, setOCCTModule } from '../bindings/manual/ts/module-registry.js';
export type {
  OcctModule,
  InitOptions,
  CastHelper,
  EmbindHandles,
  EmbindConstructors,
  EmbindEnums,
  GeneratedOcctModule,
} from '../bindings/manual/ts/types.js';

// Generated bindings — TKMath (gp_* geometry classes)
export {
  gp_EulerSequence,
  gp_TrsfForm,
  gp_Ax1,
  gp_Ax2,
  gp_Ax22d,
  gp_Ax2d,
  gp_Ax3,
  gp_Circ,
  gp_Circ2d,
  gp_Dir,
  gp_Dir2d,
  gp_Elips,
  gp_Lin,
  gp_Lin2d,
  gp_Mat,
  gp_Pln,
  gp_Pnt,
  gp_Pnt2d,
  gp_Quaternion,
  gp_Trsf,
  gp_Vec,
  gp_Vec2d,
  gp_XY,
  gp_XYZ,
} from '../bindings/generated/ts/TKMath.js';

// Generated bindings — TKBRep (topology classes)
export {
  TopAbs_Orientation,
  TopAbs_ShapeEnum,
  TopAbs_State,
  TopoDS_Builder,
  BRep_Builder,
  BRep_Tool,
  TopExp_Explorer,
  TopoDS_Shape,
  TopoDS_Compound,
  TopoDS_Edge,
  TopoDS_Face,
  TopoDS_Iterator,
  TopoDS_Shell,
  TopoDS_Solid,
  TopoDS_Vertex,
  TopoDS_Wire,
} from '../bindings/generated/ts/TKBRep.js';

// Generated bindings — TKTopAlgo (builder classes)
export {
  BRepBuilderAPI_EdgeError,
  BRepBuilderAPI_WireError,
  BRepBuilderAPI_MakeEdge,
  BRepBuilderAPI_MakeEdge2d,
  BRepBuilderAPI_MakePolygon,
  BRepBuilderAPI_MakeWire,
} from '../bindings/generated/ts/TKTopAlgo.js';

// Generated bindings — TKGeomBase (geometry construction)
export {
  gce_ErrorType,
  gce_MakeCirc,
  gce_MakeCirc2d,
  gce_MakeLin,
  gce_MakeLin2d,
} from '../bindings/generated/ts/TKGeomBase.js';

// Manual helpers
export {
  makeArcEdge3d,
  makeArcEdge2d,
  edgeLength,
  pointAtLengthOnEdge,
  wireLength,
  pointAtLengthOnWire,
  GProp_GProps,
  linearProperties,
  surfaceProperties,
  volumeProperties,
  BRepAlgoAPI_Section,
  BRepOffsetAPI_ThruSections,
  topoDSToVertex,
  meshShape,
} from '../bindings/manual/ts/helpers.js';

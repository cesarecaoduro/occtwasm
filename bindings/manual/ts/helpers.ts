// helpers.ts
//
// TypeScript wrappers for manual C++ embind helper functions.
// These functions are registered as free functions on the Module object.

import { gp_Ax2, gp_Mat, gp_Pln, gp_Pnt, gp_Pnt2d } from '../../generated/ts/TKMath.js';
import {
  TopoDS_Shape,
  TopoDS_Edge,
  TopoDS_Face,
  TopoDS_Solid,
  TopoDS_Wire,
  TopoDS_Vertex,
} from '../../generated/ts/TKBRep.js';
import { getOCCTModule } from './module-registry';

// ---------------------------------------------------------------------------
// Arc helpers
// ---------------------------------------------------------------------------

/** Create a 3D arc edge passing through three points in order. */
export function makeArcEdge3d(p1: gp_Pnt, p2: gp_Pnt, p3: gp_Pnt): TopoDS_Edge {
  const Module = getOCCTModule();
  const handle = Module.MakeArcEdge3d(p1._handle, p2._handle, p3._handle);
  return TopoDS_Edge._fromHandle(handle);
}

/** Create a 2D arc edge (in XY plane) passing through three 2D points in order. */
export function makeArcEdge2d(p1: gp_Pnt2d, p2: gp_Pnt2d, p3: gp_Pnt2d): TopoDS_Edge {
  const Module = getOCCTModule();
  const handle = Module.MakeArcEdge2d(p1._handle, p2._handle, p3._handle);
  return TopoDS_Edge._fromHandle(handle);
}

// ---------------------------------------------------------------------------
// Cast helpers
// ---------------------------------------------------------------------------

/** Cast a TopoDS_Shape to TopoDS_Vertex. */
export function topoDSToVertex(shape: TopoDS_Shape): TopoDS_Vertex {
  const Module = getOCCTModule();
  const handle = Module.TopoDS_ToVertex(shape._handle);
  return TopoDS_Vertex._fromHandle(handle);
}

/** Cast a TopoDS_Shape to TopoDS_Edge. */
export function topoDSToEdge(shape: TopoDS_Shape): TopoDS_Edge {
  const Module = getOCCTModule();
  const handle = Module.TopoDS_ToEdge(shape._handle);
  return TopoDS_Edge._fromHandle(handle);
}

/** Cast a TopoDS_Shape to TopoDS_Face. */
export function topoDSToFace(shape: TopoDS_Shape): TopoDS_Face {
  const Module = getOCCTModule();
  const handle = Module.TopoDS_ToFace(shape._handle);
  return TopoDS_Face._fromHandle(handle);
}

/** Cast a TopoDS_Shape to TopoDS_Wire. */
export function topoDSToWire(shape: TopoDS_Shape): TopoDS_Wire {
  const Module = getOCCTModule();
  const handle = Module.TopoDS_ToWire(shape._handle);
  return TopoDS_Wire._fromHandle(handle);
}

// ---------------------------------------------------------------------------
// Mesh helpers
// ---------------------------------------------------------------------------

export interface MeshData {
  positions: Float32Array;
  indices: Uint32Array;
}

export interface MeshOptions {
  deflection?: number;
  angle?: number;
}

/** Triangulate a shape and return raw position/index buffers for rendering. */
export function meshShape(shape: TopoDS_Shape, options: MeshOptions = {}): MeshData {
  const Module = getOCCTModule();
  const deflection = options.deflection ?? 0.5;
  const angle = options.angle ?? 0.5;
  const out = Module.MeshShape(shape._handle, deflection, angle);
  const positions = new Float32Array(out.positions);
  const indices = new Uint32Array(out.indices);
  return { positions, indices };
}

// ---------------------------------------------------------------------------
// Curve measurement helpers
// ---------------------------------------------------------------------------

/** Compute the total length of an edge. */
export function edgeLength(edge: TopoDS_Edge): number {
  const Module = getOCCTModule();
  return Module.EdgeLength(edge._handle);
}

/** Find the 3D point at a given arc-length distance from the edge start. */
export function pointAtLengthOnEdge(edge: TopoDS_Edge, length: number): gp_Pnt {
  const Module = getOCCTModule();
  const handle = Module.PointAtLengthOnEdge(edge._handle, length);
  return gp_Pnt._fromHandle(handle);
}

/** Compute the total length of a wire (sum of all edge lengths). */
export function wireLength(wire: TopoDS_Wire): number {
  const Module = getOCCTModule();
  return Module.WireLength(wire._handle);
}

/** Find the 3D point at a given arc-length distance from the wire start. */
export function pointAtLengthOnWire(wire: TopoDS_Wire, length: number): gp_Pnt {
  const Module = getOCCTModule();
  const handle = Module.PointAtLengthOnWire(wire._handle, length);
  return gp_Pnt._fromHandle(handle);
}

// ---------------------------------------------------------------------------
// GProp helpers
// ---------------------------------------------------------------------------

export class GProp_GProps {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): GProp_GProps {
    const obj = Object.create(GProp_GProps.prototype);
    obj._handle = h;
    return obj;
  }

  Mass(): number { return this._handle.Mass(); }
  CentreOfMass(): gp_Pnt { return gp_Pnt._fromHandle(this._handle.CentreOfMass()); }
  MatrixOfInertia(): gp_Mat { return gp_Mat._fromHandle(this._handle.MatrixOfInertia()); }
  delete(): void { this._handle.delete(); }
}

/** Compute linear properties (length for edges/wires). */
export function linearProperties(shape: TopoDS_Shape): GProp_GProps {
  const Module = getOCCTModule();
  const handle = Module.BRepGProp_LinearProperties(shape._handle);
  return GProp_GProps._fromHandle(handle);
}

/** Compute surface properties (area for faces). Mass() returns area. */
export function surfaceProperties(shape: TopoDS_Shape): GProp_GProps {
  const Module = getOCCTModule();
  const handle = Module.BRepGProp_SurfaceProperties(shape._handle);
  return GProp_GProps._fromHandle(handle);
}

/** Compute volume properties (volume for solids). Mass() returns volume. */
export function volumeProperties(shape: TopoDS_Shape): GProp_GProps {
  const Module = getOCCTModule();
  const handle = Module.BRepGProp_VolumeProperties(shape._handle);
  return GProp_GProps._fromHandle(handle);
}

// ---------------------------------------------------------------------------
// BRepAlgoAPI_Section wrapper
// ---------------------------------------------------------------------------

export class BRepAlgoAPI_Section {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): BRepAlgoAPI_Section {
    const obj = Object.create(BRepAlgoAPI_Section.prototype);
    obj._handle = h;
    return obj;
  }

  /** Create a section (intersection) between two shapes. Builds immediately. */
  static FromShapes(s1: TopoDS_Shape, s2: TopoDS_Shape): BRepAlgoAPI_Section {
    const Module = getOCCTModule();
    const h = Module.BRepAlgoAPI_Section.FromShapes(s1._handle, s2._handle);
    return BRepAlgoAPI_Section._fromHandle(h);
  }

  /** Create a section between a shape and plane. Builds immediately. */
  static FromShapePlane(s1: TopoDS_Shape, pln: gp_Pln): BRepAlgoAPI_Section {
    const Module = getOCCTModule();
    const h = Module.BRepAlgoAPI_Section.FromShapePlane(s1._handle, pln._handle);
    return BRepAlgoAPI_Section._fromHandle(h);
  }

  Build(): void { this._handle.Build(); }
  IsDone(): boolean { return this._handle.IsDone(); }
  Shape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.Shape()); }
  delete(): void { this._handle.delete(); }
}

// ---------------------------------------------------------------------------
// BRepOffsetAPI_ThruSections wrapper
// ---------------------------------------------------------------------------

export class BRepOffsetAPI_ThruSections {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): BRepOffsetAPI_ThruSections {
    const obj = Object.create(BRepOffsetAPI_ThruSections.prototype);
    obj._handle = h;
    return obj;
  }

  constructor(isSolid: boolean, isRuled: boolean = false) {
    const Module = getOCCTModule();
    this._handle = new Module.BRepOffsetAPI_ThruSections(isSolid, isRuled);
  }

  AddWire(wire: TopoDS_Wire): void { this._handle.AddWire(wire._handle); }
  AddVertex(vertex: TopoDS_Vertex): void { this._handle.AddVertex(vertex._handle); }
  CheckCompatibility(check: boolean): void { this._handle.CheckCompatibility(check); }
  SetSmoothing(useSmoothing: boolean): void { this._handle.SetSmoothing(useSmoothing); }
  SetMaxDegree(maxDegree: number): void { this._handle.SetMaxDegree(maxDegree); }
  Build(): void { this._handle.Build(); }
  IsDone(): boolean { return this._handle.IsDone(); }
  Shape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.Shape()); }
  FirstShape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.FirstShape()); }
  LastShape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.LastShape()); }
  delete(): void { this._handle.delete(); }
}

// ---------------------------------------------------------------------------
// BRepPrimAPI_MakeBox wrapper
// ---------------------------------------------------------------------------

export class BRepPrimAPI_MakeBox {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): BRepPrimAPI_MakeBox {
    const obj = Object.create(BRepPrimAPI_MakeBox.prototype);
    obj._handle = h;
    return obj;
  }

  static FromCornerAndSize(p: gp_Pnt, dx: number, dy: number, dz: number): BRepPrimAPI_MakeBox {
    const Module = getOCCTModule();
    const h = Module.BRepPrimAPI_MakeBox.FromCornerAndSize(p._handle, dx, dy, dz);
    return BRepPrimAPI_MakeBox._fromHandle(h);
  }

  static FromTwoCorners(p1: gp_Pnt, p2: gp_Pnt): BRepPrimAPI_MakeBox {
    const Module = getOCCTModule();
    const h = Module.BRepPrimAPI_MakeBox.FromTwoCorners(p1._handle, p2._handle);
    return BRepPrimAPI_MakeBox._fromHandle(h);
  }

  Build(): void { this._handle.Build(); }
  IsDone(): boolean { return this._handle.IsDone(); }
  Shape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.Shape()); }
  Solid(): TopoDS_Solid { return TopoDS_Solid._fromHandle(this._handle.Solid()); }
  delete(): void { this._handle.delete(); }
}

// ---------------------------------------------------------------------------
// BRepPrimAPI_MakeCylinder wrapper
// ---------------------------------------------------------------------------

export class BRepPrimAPI_MakeCylinder {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): BRepPrimAPI_MakeCylinder {
    const obj = Object.create(BRepPrimAPI_MakeCylinder.prototype);
    obj._handle = h;
    return obj;
  }

  static FromAx2(axes: gp_Ax2, R: number, H: number): BRepPrimAPI_MakeCylinder {
    const Module = getOCCTModule();
    const h = Module.BRepPrimAPI_MakeCylinder.FromAx2(axes._handle, R, H);
    return BRepPrimAPI_MakeCylinder._fromHandle(h);
  }

  Build(): void { this._handle.Build(); }
  IsDone(): boolean { return this._handle.IsDone(); }
  Shape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.Shape()); }
  delete(): void { this._handle.delete(); }
}

// ---------------------------------------------------------------------------
// BRepPrimAPI_MakeSphere wrapper
// ---------------------------------------------------------------------------

export class BRepPrimAPI_MakeSphere {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): BRepPrimAPI_MakeSphere {
    const obj = Object.create(BRepPrimAPI_MakeSphere.prototype);
    obj._handle = h;
    return obj;
  }

  static FromCenterRadius(center: gp_Pnt, R: number): BRepPrimAPI_MakeSphere {
    const Module = getOCCTModule();
    const h = Module.BRepPrimAPI_MakeSphere.FromCenterRadius(center._handle, R);
    return BRepPrimAPI_MakeSphere._fromHandle(h);
  }

  Build(): void { this._handle.Build(); }
  IsDone(): boolean { return this._handle.IsDone(); }
  Shape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.Shape()); }
  delete(): void { this._handle.delete(); }
}

// ---------------------------------------------------------------------------
// BRepBuilderAPI_MakeFace wrapper
// ---------------------------------------------------------------------------

export class BRepBuilderAPI_MakeFace {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): BRepBuilderAPI_MakeFace {
    const obj = Object.create(BRepBuilderAPI_MakeFace.prototype);
    obj._handle = h;
    return obj;
  }

  static FromWire(wire: TopoDS_Wire, onlyPlane: boolean = true): BRepBuilderAPI_MakeFace {
    const Module = getOCCTModule();
    const h = Module.BRepBuilderAPI_MakeFace.FromWire(wire._handle, onlyPlane);
    return BRepBuilderAPI_MakeFace._fromHandle(h);
  }

  IsDone(): boolean { return this._handle.IsDone(); }
  Face(): TopoDS_Face { return TopoDS_Face._fromHandle(this._handle.Face()); }
  Shape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.Shape()); }
  delete(): void { this._handle.delete(); }
}

// ---------------------------------------------------------------------------
// BRepAlgoAPI_Fuse wrapper
// ---------------------------------------------------------------------------

export class BRepAlgoAPI_Fuse {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): BRepAlgoAPI_Fuse {
    const obj = Object.create(BRepAlgoAPI_Fuse.prototype);
    obj._handle = h;
    return obj;
  }

  static Create(s1: TopoDS_Shape, s2: TopoDS_Shape): BRepAlgoAPI_Fuse {
    const Module = getOCCTModule();
    const h = Module.BRepAlgoAPI_Fuse.Create(s1._handle, s2._handle);
    return BRepAlgoAPI_Fuse._fromHandle(h);
  }

  Build(): void { this._handle.Build(); }
  IsDone(): boolean { return this._handle.IsDone(); }
  Shape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.Shape()); }
  delete(): void { this._handle.delete(); }
}

// ---------------------------------------------------------------------------
// BRepAlgoAPI_Cut wrapper
// ---------------------------------------------------------------------------

export class BRepAlgoAPI_Cut {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): BRepAlgoAPI_Cut {
    const obj = Object.create(BRepAlgoAPI_Cut.prototype);
    obj._handle = h;
    return obj;
  }

  static Create(s1: TopoDS_Shape, s2: TopoDS_Shape): BRepAlgoAPI_Cut {
    const Module = getOCCTModule();
    const h = Module.BRepAlgoAPI_Cut.Create(s1._handle, s2._handle);
    return BRepAlgoAPI_Cut._fromHandle(h);
  }

  Build(): void { this._handle.Build(); }
  IsDone(): boolean { return this._handle.IsDone(); }
  Shape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.Shape()); }
  delete(): void { this._handle.delete(); }
}

// ---------------------------------------------------------------------------
// BRepAlgoAPI_Common wrapper
// ---------------------------------------------------------------------------

export class BRepAlgoAPI_Common {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): BRepAlgoAPI_Common {
    const obj = Object.create(BRepAlgoAPI_Common.prototype);
    obj._handle = h;
    return obj;
  }

  static Create(s1: TopoDS_Shape, s2: TopoDS_Shape): BRepAlgoAPI_Common {
    const Module = getOCCTModule();
    const h = Module.BRepAlgoAPI_Common.Create(s1._handle, s2._handle);
    return BRepAlgoAPI_Common._fromHandle(h);
  }

  Build(): void { this._handle.Build(); }
  IsDone(): boolean { return this._handle.IsDone(); }
  Shape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.Shape()); }
  delete(): void { this._handle.delete(); }
}

// ---------------------------------------------------------------------------
// BRepOffsetAPI_MakePipe wrapper
// ---------------------------------------------------------------------------

export class BRepOffsetAPI_MakePipe {
  /** @internal */
  _handle: any;

  static _fromHandle(h: any): BRepOffsetAPI_MakePipe {
    const obj = Object.create(BRepOffsetAPI_MakePipe.prototype);
    obj._handle = h;
    return obj;
  }

  constructor(spine: TopoDS_Wire, profile: TopoDS_Shape) {
    const Module = getOCCTModule();
    this._handle = new Module.BRepOffsetAPI_MakePipe(spine._handle, profile._handle);
  }

  Build(): void { this._handle.Build(); }
  IsDone(): boolean { return this._handle.IsDone(); }
  Shape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.Shape()); }
  FirstShape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.FirstShape()); }
  LastShape(): TopoDS_Shape { return TopoDS_Shape._fromHandle(this._handle.LastShape()); }
  delete(): void { this._handle.delete(); }
}

// ---------------------------------------------------------------------------
// BSpline helpers
// ---------------------------------------------------------------------------

/** Create a BSpline curve edge from control points, knots, and multiplicities. */
export function makeBSplineCurveEdge(
  poles: number[],
  knots: number[],
  mults: number[],
  degree: number,
): TopoDS_Edge {
  const Module = getOCCTModule();
  const handle = Module.MakeBSplineCurveEdge(poles, knots, mults, degree);
  return TopoDS_Edge._fromHandle(handle);
}

/** Create a BSpline surface face from control points, knots, and multiplicities. */
export function makeBSplineSurfaceFace(
  poles: number[],
  uKnots: number[],
  vKnots: number[],
  uMults: number[],
  vMults: number[],
  uDeg: number,
  vDeg: number,
  nUPoles: number,
  nVPoles: number,
): TopoDS_Face {
  const Module = getOCCTModule();
  const handle = Module.MakeBSplineSurfaceFace(
    poles, uKnots, vKnots, uMults, vMults, uDeg, vDeg, nUPoles, nVPoles,
  );
  return TopoDS_Face._fromHandle(handle);
}

// ---------------------------------------------------------------------------
// Export helpers
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Curve info helpers
// ---------------------------------------------------------------------------

export interface BSplineCurveInfo {
  isBSpline: boolean;
  degree?: number;
  nbPoles?: number;
  nbKnots?: number;
  paramFirst?: number;
  paramLast?: number;
  poles?: number[];
  knots?: number[];
  mults?: number[];
  weights?: number[];
  isRational?: boolean;
  isPeriodic?: boolean;
}

/** Extract BSpline curve info (poles, knots, degree, etc.) from an edge. */
export function getEdgeBSplineInfo(edge: TopoDS_Edge): BSplineCurveInfo {
  const Module = getOCCTModule();
  return Module.GetEdgeBSplineInfo(edge._handle);
}

// ---------------------------------------------------------------------------
// Export helpers
// ---------------------------------------------------------------------------

/** Export a shape to BREP format as a string. */
export function exportBRep(shape: TopoDS_Shape): string {
  const Module = getOCCTModule();
  return Module.ExportBRep(shape._handle);
}

/** Export a shape to STEP format as a string. */
export function exportSTEP(shape: TopoDS_Shape): string {
  const Module = getOCCTModule();
  return Module.ExportSTEP(shape._handle);
}

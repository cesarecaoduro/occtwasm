// helpers.ts
//
// TypeScript wrappers for manual C++ embind helper functions.
// These functions are registered as free functions on the Module object.

import { gp_Mat, gp_Pln, gp_Pnt, gp_Pnt2d } from '../../generated/ts/TKMath.js';
import {
  TopoDS_Shape,
  TopoDS_Edge,
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

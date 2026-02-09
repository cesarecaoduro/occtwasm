import * as THREE from 'three';
import {
  gp_Pnt,
  BRepBuilderAPI_MakeEdge,
  BRepBuilderAPI_MakeWire,
  BRepAlgoAPI_Section,
  TopExp_Explorer,
  TopAbs_ShapeEnum,
  BRep_Tool,
  TopoDS_Vertex,
} from '@occtwasm/core';
import { sampleWirePoints, makeLineMesh, makePointsMesh } from '../occt-to-three';

export const label = 'Intersection';

export function create(scene: THREE.Scene): () => void {
  // Wire 1: horizontal line (-10,0,0) -> (10,0,0)
  const w1p1 = new gp_Pnt(-10, 0, 0);
  const w1p2 = new gp_Pnt(10, 0, 0);
  const w1Edge = new BRepBuilderAPI_MakeEdge(w1p1, w1p2);
  const w1Wire = new BRepBuilderAPI_MakeWire(w1Edge.Edge());
  const wire1 = w1Wire.Wire();

  // Wire 2: vertical line (0,-10,0) -> (0,10,0)
  const w2p1 = new gp_Pnt(0, -10, 0);
  const w2p2 = new gp_Pnt(0, 10, 0);
  const w2Edge = new BRepBuilderAPI_MakeEdge(w2p1, w2p2);
  const w2Wire = new BRepBuilderAPI_MakeWire(w2Edge.Edge());
  const wire2 = w2Wire.Wire();

  // Intersection
  const section = BRepAlgoAPI_Section.FromShapes(wire1, wire2);
  const result = section.Shape();

  // Render wires
  const pts1 = sampleWirePoints(wire1, 2);
  const pts2 = sampleWirePoints(wire2, 2);
  const line1 = makeLineMesh(pts1, 0xffff00);
  const line2 = makeLineMesh(pts2, 0x00ccff);
  scene.add(line1, line2);

  // Extract intersection vertices
  const intPts: THREE.Vector3[] = [];
  const explorer = new TopExp_Explorer(
    result,
    TopAbs_ShapeEnum.TopAbs_VERTEX,
    TopAbs_ShapeEnum.TopAbs_SHAPE,
  );
  while (explorer.More()) {
    const vtx = TopoDS_Vertex._fromHandle(explorer.Current()._handle);
    const pnt = BRep_Tool.Pnt(vtx);
    intPts.push(new THREE.Vector3(pnt.X(), pnt.Y(), pnt.Z()));
    pnt.delete();
    explorer.Next();
  }

  const dots = makePointsMesh(intPts, 0xff0000, 12);
  scene.add(dots);

  return () => {
    scene.remove(line1, line2, dots);
    line1.geometry.dispose();
    (line1.material as THREE.Material).dispose();
    line2.geometry.dispose();
    (line2.material as THREE.Material).dispose();
    dots.geometry.dispose();
    (dots.material as THREE.Material).dispose();
    explorer.delete();
    result.delete();
    section.delete();
    wire2.delete(); w2Wire.delete(); w2Edge.delete();
    wire1.delete(); w1Wire.delete(); w1Edge.delete();
    w1p1.delete(); w1p2.delete(); w2p1.delete(); w2p2.delete();
  };
}

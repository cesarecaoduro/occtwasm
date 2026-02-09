import * as THREE from 'three';
import {
  gp_Pnt,
  BRepBuilderAPI_MakeEdge,
  BRepBuilderAPI_MakeWire,
  makeArcEdge3d,
} from '@occtwasm/core';
import { sampleWirePoints, makeLineMesh, makePointsMesh, pntToVec3 } from '../occt-to-three';

export const label = 'Wire (Line+Arc+Line)';

export function create(scene: THREE.Scene): () => void {
  // Line: (0,0,0) -> (10,0,0)
  const lp1 = new gp_Pnt(0, 0, 0);
  const lp2 = new gp_Pnt(10, 0, 0);
  const lineMaker = new BRepBuilderAPI_MakeEdge(lp1, lp2);
  const lineEdge = lineMaker.Edge();

  // Arc: (10,0,0) -> (15,5,0) -> (10,10,0)
  const ap1 = new gp_Pnt(10, 0, 0);
  const ap2 = new gp_Pnt(15, 5, 0);
  const ap3 = new gp_Pnt(10, 10, 0);
  const arcEdge = makeArcEdge3d(ap1, ap2, ap3);

  // Line: (10,10,0) -> (0,10,0)
  const lp3 = new gp_Pnt(10, 10, 0);
  const lp4 = new gp_Pnt(0, 10, 0);
  const line2Maker = new BRepBuilderAPI_MakeEdge(lp3, lp4);
  const line2Edge = line2Maker.Edge();

  // Build wire
  const wireMaker = new BRepBuilderAPI_MakeWire(lineEdge, arcEdge, line2Edge);
  const wire = wireMaker.Wire();

  const wirePoints = sampleWirePoints(wire, 128);
  const line = makeLineMesh(wirePoints, 0xff9900);
  scene.add(line);

  const keyPoints = [lp1, ap2, lp4].map(p => pntToVec3(p));
  const dots = makePointsMesh(keyPoints, 0xff4444, 8);
  scene.add(dots);

  return () => {
    scene.remove(line, dots);
    line.geometry.dispose();
    (line.material as THREE.Material).dispose();
    dots.geometry.dispose();
    (dots.material as THREE.Material).dispose();
    wire.delete();
    wireMaker.delete();
    line2Edge.delete();
    line2Maker.delete();
    arcEdge.delete();
    lineEdge.delete();
    lineMaker.delete();
    lp1.delete(); lp2.delete();
    ap1.delete(); ap2.delete(); ap3.delete();
    lp3.delete(); lp4.delete();
  };
}

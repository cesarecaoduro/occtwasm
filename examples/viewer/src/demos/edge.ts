import * as THREE from 'three';
import { gp_Pnt, BRepBuilderAPI_MakeEdge } from '@occtwasm/core';
import { sampleEdgePoints, makeLineMesh, makePointsMesh, pntToVec3 } from '../occt-to-three';

export const label = 'Edge (Line)';

export function create(scene: THREE.Scene): () => void {
  const p1 = new gp_Pnt(0, 0, 0);
  const p2 = new gp_Pnt(10, 0, 0);
  const maker = new BRepBuilderAPI_MakeEdge(p1, p2);
  const edge = maker.Edge();

  const linePoints = sampleEdgePoints(edge, 2); // straight line only needs 2 samples
  const line = makeLineMesh(linePoints, 0xffff00);
  scene.add(line);

  const dots = makePointsMesh([pntToVec3(p1), pntToVec3(p2)], 0xff4444, 8);
  scene.add(dots);

  return () => {
    scene.remove(line, dots);
    line.geometry.dispose();
    (line.material as THREE.Material).dispose();
    dots.geometry.dispose();
    (dots.material as THREE.Material).dispose();
    edge.delete();
    maker.delete();
    p1.delete();
    p2.delete();
  };
}

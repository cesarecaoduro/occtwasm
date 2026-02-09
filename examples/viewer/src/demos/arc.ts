import * as THREE from 'three';
import { gp_Pnt, makeArcEdge3d } from '@occtwasm/core';
import { sampleEdgePoints, makeLineMesh, makePointsMesh, pntToVec3 } from '../occt-to-three';

export const label = 'Arc (3 Points)';

export function create(scene: THREE.Scene): () => void {
  const p1 = new gp_Pnt(10, 0, 0);
  const p2 = new gp_Pnt(0, 10, 0);
  const p3 = new gp_Pnt(-10, 0, 0);
  const edge = makeArcEdge3d(p1, p2, p3);

  const arcPoints = sampleEdgePoints(edge, 64);
  const line = makeLineMesh(arcPoints, 0x00ccff);
  scene.add(line);

  const dots = makePointsMesh([pntToVec3(p1), pntToVec3(p2), pntToVec3(p3)], 0xff4444, 8);
  scene.add(dots);

  return () => {
    scene.remove(line, dots);
    line.geometry.dispose();
    (line.material as THREE.Material).dispose();
    dots.geometry.dispose();
    (dots.material as THREE.Material).dispose();
    edge.delete();
    p1.delete();
    p2.delete();
    p3.delete();
  };
}

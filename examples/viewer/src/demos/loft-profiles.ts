import * as THREE from 'three';
import { gp_Pnt, BRepBuilderAPI_MakePolygon } from '@occtwasm/core';
import { sampleWirePoints, makeLineMesh, makePointsMesh, pntToVec3 } from '../occt-to-three';

export const label = 'Loft Profiles';

export function create(scene: THREE.Scene): () => void {
  // Bottom square at Z=0
  const bottomPts = [
    new gp_Pnt(0, 0, 0),
    new gp_Pnt(10, 0, 0),
    new gp_Pnt(10, 10, 0),
    new gp_Pnt(0, 10, 0),
  ];
  const bottom = new BRepBuilderAPI_MakePolygon();
  for (const p of bottomPts) bottom.Add(p);
  bottom.Close();
  const wire1 = bottom.Wire();

  // Top square at Z=10
  const topPts = [
    new gp_Pnt(0, 0, 10),
    new gp_Pnt(10, 0, 10),
    new gp_Pnt(10, 10, 10),
    new gp_Pnt(0, 10, 10),
  ];
  const top = new BRepBuilderAPI_MakePolygon();
  for (const p of topPts) top.Add(p);
  top.Close();
  const wire2 = top.Wire();

  // Render both profiles
  const pts1 = sampleWirePoints(wire1, 64);
  const pts2 = sampleWirePoints(wire2, 64);
  const line1 = makeLineMesh(pts1, 0x44ff44);
  const line2 = makeLineMesh(pts2, 0x00ccff);
  scene.add(line1, line2);

  // Vertical guide lines connecting corners
  const guides: THREE.Line[] = [];
  for (let i = 0; i < 4; i++) {
    const g = makeLineMesh([pntToVec3(bottomPts[i]), pntToVec3(topPts[i])], 0x666666);
    scene.add(g);
    guides.push(g);
  }

  const allCorners = [...bottomPts, ...topPts].map(p => pntToVec3(p));
  const dots = makePointsMesh(allCorners, 0xff4444, 6);
  scene.add(dots);

  return () => {
    scene.remove(line1, line2, dots);
    for (const g of guides) {
      scene.remove(g);
      g.geometry.dispose();
      (g.material as THREE.Material).dispose();
    }
    line1.geometry.dispose();
    (line1.material as THREE.Material).dispose();
    line2.geometry.dispose();
    (line2.material as THREE.Material).dispose();
    dots.geometry.dispose();
    (dots.material as THREE.Material).dispose();
    wire2.delete(); top.delete();
    wire1.delete(); bottom.delete();
    for (const p of [...bottomPts, ...topPts]) p.delete();
  };
}

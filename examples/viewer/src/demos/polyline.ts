import * as THREE from 'three';
import { gp_Pnt, BRepBuilderAPI_MakePolygon } from '@occtwasm/core';
import { sampleWirePoints, makeLineMesh, makePointsMesh, pntToVec3 } from '../occt-to-three';

export const label = 'Polyline';

export function create(scene: THREE.Scene): () => void {
  const pts = [
    new gp_Pnt(0, 0, 0),
    new gp_Pnt(10, 0, 0),
    new gp_Pnt(10, 10, 0),
    new gp_Pnt(0, 10, 0),
    new gp_Pnt(0, 20, 0),
  ];

  const maker = new BRepBuilderAPI_MakePolygon();
  for (const p of pts) maker.Add(p);
  const wire = maker.Wire();

  const wirePoints = sampleWirePoints(wire, 64);
  const line = makeLineMesh(wirePoints, 0x44ff44);
  scene.add(line);

  const dots = makePointsMesh(pts.map(p => pntToVec3(p)), 0xff4444, 8);
  scene.add(dots);

  return () => {
    scene.remove(line, dots);
    line.geometry.dispose();
    (line.material as THREE.Material).dispose();
    dots.geometry.dispose();
    (dots.material as THREE.Material).dispose();
    wire.delete();
    maker.delete();
    for (const p of pts) p.delete();
  };
}

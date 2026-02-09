import * as THREE from 'three';
import type { gp_Pnt, TopoDS_Edge, TopoDS_Wire } from '@occtwasm/core';
import {
  edgeLength,
  pointAtLengthOnEdge,
  wireLength,
  pointAtLengthOnWire,
} from '@occtwasm/core';

/** Convert a gp_Pnt to a THREE.Vector3 (does NOT delete the point). */
export function pntToVec3(p: gp_Pnt): THREE.Vector3 {
  return new THREE.Vector3(p.X(), p.Y(), p.Z());
}

/** Sample N evenly-spaced points along an edge. Deletes intermediate gp_Pnt handles. */
export function sampleEdgePoints(edge: TopoDS_Edge, numSamples = 64): THREE.Vector3[] {
  const len = edgeLength(edge);
  const points: THREE.Vector3[] = [];
  for (let i = 0; i <= numSamples; i++) {
    const d = (i / numSamples) * len;
    const p = pointAtLengthOnEdge(edge, d);
    points.push(pntToVec3(p));
    p.delete();
  }
  return points;
}

/** Sample N evenly-spaced points along a wire. Deletes intermediate gp_Pnt handles. */
export function sampleWirePoints(wire: TopoDS_Wire, numSamples = 128): THREE.Vector3[] {
  const len = wireLength(wire);
  const points: THREE.Vector3[] = [];
  for (let i = 0; i <= numSamples; i++) {
    const d = (i / numSamples) * len;
    const p = pointAtLengthOnWire(wire, d);
    points.push(pntToVec3(p));
    p.delete();
  }
  return points;
}

/** Create a Three.js Line from an array of points. */
export function makeLineMesh(points: THREE.Vector3[], color: number = 0xffff00): THREE.Line {
  const geometry = new THREE.BufferGeometry().setFromPoints(points);
  const material = new THREE.LineBasicMaterial({ color });
  return new THREE.Line(geometry, material);
}

/** Create Three.js Points (dots) from an array of points. */
export function makePointsMesh(
  points: THREE.Vector3[],
  color: number = 0xff4444,
  size: number = 6,
): THREE.Points {
  const geometry = new THREE.BufferGeometry().setFromPoints(points);
  const material = new THREE.PointsMaterial({ color, size, sizeAttenuation: false });
  return new THREE.Points(geometry, material);
}

import { describe, it, expect } from 'vitest';
import { gp_Pnt } from '../bindings/generated/ts/TKMath';
import { BRepBuilderAPI_MakeEdge, BRepBuilderAPI_MakeWire, BRepBuilderAPI_MakePolygon } from '../bindings/generated/ts/TKTopAlgo';
import {
  makeArcEdge3d,
  wireLength,
  pointAtLengthOnWire,
} from '../bindings/manual/ts/helpers';

describe('Wire from combination of line, arc, polyline', () => {
  it('creates a wire from line + arc + line', () => {
    // Line: (0,0,0) -> (10,0,0)
    const lp1 = new gp_Pnt(0, 0, 0);
    const lp2 = new gp_Pnt(10, 0, 0);
    const lineMaker = new BRepBuilderAPI_MakeEdge(lp1, lp2);
    const lineEdge = lineMaker.Edge();

    // Arc: (10,0,0) -> (15,5,0) -> (10,10,0) — a semicircular arc
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
    expect(wireMaker.IsDone()).toBe(true);
    const wire = wireMaker.Wire();
    expect(wire.IsNull()).toBe(false);

    wire.delete();
    wireMaker.delete();
    line2Edge.delete();
    line2Maker.delete();
    arcEdge.delete();
    lineEdge.delete();
    lineMaker.delete();
    lp1.delete();
    lp2.delete();
    ap1.delete();
    ap2.delete();
    ap3.delete();
    lp3.delete();
    lp4.delete();
  });

  it('creates a wire and calculates the length', () => {
    // Straight line (10 units) + semi-circle (radius 5, length = pi*5) + straight line (10 units)
    const lp1 = new gp_Pnt(0, 0, 0);
    const lp2 = new gp_Pnt(10, 0, 0);
    const lineMaker = new BRepBuilderAPI_MakeEdge(lp1, lp2);
    const lineEdge = lineMaker.Edge();

    const ap1 = new gp_Pnt(10, 0, 0);
    const ap2 = new gp_Pnt(15, 5, 0);
    const ap3 = new gp_Pnt(10, 10, 0);
    const arcEdge = makeArcEdge3d(ap1, ap2, ap3);

    const lp3 = new gp_Pnt(10, 10, 0);
    const lp4 = new gp_Pnt(0, 10, 0);
    const line2Maker = new BRepBuilderAPI_MakeEdge(lp3, lp4);
    const line2Edge = line2Maker.Edge();

    const wireMaker = new BRepBuilderAPI_MakeWire(lineEdge, arcEdge, line2Edge);
    const wire = wireMaker.Wire();
    const len = wireLength(wire);
    // 10 + pi*5 + 10 = 20 + pi*5 ≈ 35.71
    expect(len).toBeCloseTo(20 + Math.PI * 5, 1);

    wire.delete();
    wireMaker.delete();
    line2Edge.delete();
    line2Maker.delete();
    arcEdge.delete();
    lineEdge.delete();
    lineMaker.delete();
    lp1.delete();
    lp2.delete();
    ap1.delete();
    ap2.delete();
    ap3.delete();
    lp3.delete();
    lp4.delete();
  });

  it('creates a wire and calculates a point at a certain length', () => {
    // Simple wire: two edges of 10 each
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(10, 0, 0);
    const p3 = new gp_Pnt(10, 10, 0);

    const e1Maker = new BRepBuilderAPI_MakeEdge(p1, p2);
    const e1 = e1Maker.Edge();
    const e2Maker = new BRepBuilderAPI_MakeEdge(p2, p3);
    const e2 = e2Maker.Edge();

    const wireMaker = new BRepBuilderAPI_MakeWire(e1, e2);
    const wire = wireMaker.Wire();

    // At length 15 -> 10 on first edge + 5 on second => (10, 5, 0)
    const pnt = pointAtLengthOnWire(wire, 15.0);
    expect(pnt.X()).toBeCloseTo(10.0);
    expect(pnt.Y()).toBeCloseTo(5.0);
    expect(pnt.Z()).toBeCloseTo(0.0);

    pnt.delete();
    wire.delete();
    wireMaker.delete();
    e2.delete();
    e2Maker.delete();
    e1.delete();
    e1Maker.delete();
    p1.delete();
    p2.delete();
    p3.delete();
  });
});

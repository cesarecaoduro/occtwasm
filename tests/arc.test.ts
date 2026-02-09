import { describe, it, expect } from 'vitest';
import { gp_Pnt, gp_Pnt2d } from '../bindings/generated/ts/TKMath';
import {
  makeArcEdge3d,
  makeArcEdge2d,
  edgeLength,
  pointAtLengthOnEdge,
} from '../bindings/manual/ts/helpers';

describe('Arc between 3 points (3D)', () => {
  it('creates an arc between 3 points', () => {
    const p1 = new gp_Pnt(10, 0, 0);
    const p2 = new gp_Pnt(0, 10, 0);
    const p3 = new gp_Pnt(-10, 0, 0);
    const edge = makeArcEdge3d(p1, p2, p3);
    expect(edge.IsNull()).toBe(false);
    edge.delete();
    p1.delete();
    p2.delete();
    p3.delete();
  });

  it('creates an arc between 3 points and calculates the length', () => {
    // Semi-circle of radius 10 -> length = pi * 10
    const p1 = new gp_Pnt(10, 0, 0);
    const p2 = new gp_Pnt(0, 10, 0);
    const p3 = new gp_Pnt(-10, 0, 0);
    const edge = makeArcEdge3d(p1, p2, p3);
    const len = edgeLength(edge);
    expect(len).toBeCloseTo(Math.PI * 10, 1);
    edge.delete();
    p1.delete();
    p2.delete();
    p3.delete();
  });

  it('creates an arc between 3 points and calculates a point at a certain length', () => {
    // Semi-circle of radius 10 in XY plane
    const p1 = new gp_Pnt(10, 0, 0);
    const p2 = new gp_Pnt(0, 10, 0);
    const p3 = new gp_Pnt(-10, 0, 0);
    const edge = makeArcEdge3d(p1, p2, p3);
    // Quarter-circle length = pi * 10 / 2
    const quarterLen = Math.PI * 10 / 2;
    const midPnt = pointAtLengthOnEdge(edge, quarterLen);
    // Should be approximately (0, 10, 0)
    expect(midPnt.X()).toBeCloseTo(0, 0);
    expect(midPnt.Y()).toBeCloseTo(10, 0);
    expect(midPnt.Z()).toBeCloseTo(0, 0);
    midPnt.delete();
    edge.delete();
    p1.delete();
    p2.delete();
    p3.delete();
  });

  it('converts the arc to an edge (it already is one)', () => {
    const p1 = new gp_Pnt(10, 0, 0);
    const p2 = new gp_Pnt(0, 10, 0);
    const p3 = new gp_Pnt(-10, 0, 0);
    const edge = makeArcEdge3d(p1, p2, p3);
    // MakeArcEdge3d already returns a TopoDS_Edge
    expect(edge.IsNull()).toBe(false);
    edge.delete();
    p1.delete();
    p2.delete();
    p3.delete();
  });
});

describe('Arc between 3 points (2D)', () => {
  it('creates a 2D arc between 3 points', () => {
    const p1 = new gp_Pnt2d(10, 0);
    const p2 = new gp_Pnt2d(0, 10);
    const p3 = new gp_Pnt2d(-10, 0);
    const edge = makeArcEdge2d(p1, p2, p3);
    expect(edge.IsNull()).toBe(false);
    edge.delete();
    p1.delete();
    p2.delete();
    p3.delete();
  });

  it('creates a 2D arc and calculates the length', () => {
    const p1 = new gp_Pnt2d(10, 0);
    const p2 = new gp_Pnt2d(0, 10);
    const p3 = new gp_Pnt2d(-10, 0);
    const edge = makeArcEdge2d(p1, p2, p3);
    const len = edgeLength(edge);
    expect(len).toBeCloseTo(Math.PI * 10, 1);
    edge.delete();
    p1.delete();
    p2.delete();
    p3.delete();
  });

  it('creates a 2D arc and calculates a point at a certain length', () => {
    const p1 = new gp_Pnt2d(10, 0);
    const p2 = new gp_Pnt2d(0, 10);
    const p3 = new gp_Pnt2d(-10, 0);
    const edge = makeArcEdge2d(p1, p2, p3);
    const quarterLen = Math.PI * 10 / 2;
    const midPnt = pointAtLengthOnEdge(edge, quarterLen);
    expect(midPnt.X()).toBeCloseTo(0, 0);
    expect(midPnt.Y()).toBeCloseTo(10, 0);
    midPnt.delete();
    edge.delete();
    p1.delete();
    p2.delete();
    p3.delete();
  });
});

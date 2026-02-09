import { describe, it, expect } from 'vitest';
import { gp_Pnt, gp_Pnt2d } from '../bindings/generated/ts/TKMath';
import { BRepBuilderAPI_MakeEdge, BRepBuilderAPI_MakeEdge2d } from '../bindings/generated/ts/TKTopAlgo';
import {
  edgeLength,
  pointAtLengthOnEdge,
} from '../bindings/manual/ts/helpers';

describe('Edge between 2 points (3D)', () => {
  it('creates an edge between 2 points', () => {
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(10, 0, 0);
    const maker = new BRepBuilderAPI_MakeEdge(p1, p2);
    expect(maker.IsDone()).toBe(true);
    const edge = maker.Edge();
    expect(edge.IsNull()).toBe(false);
    edge.delete();
    maker.delete();
    p1.delete();
    p2.delete();
  });

  it('creates an edge and calculates the length', () => {
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(10, 0, 0);
    const maker = new BRepBuilderAPI_MakeEdge(p1, p2);
    const edge = maker.Edge();
    expect(edgeLength(edge)).toBeCloseTo(10.0);
    edge.delete();
    maker.delete();
    p1.delete();
    p2.delete();
  });

  it('creates an edge and calculates a point at a certain length', () => {
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(10, 0, 0);
    const maker = new BRepBuilderAPI_MakeEdge(p1, p2);
    const edge = maker.Edge();
    const midPnt = pointAtLengthOnEdge(edge, 5.0);
    expect(midPnt.X()).toBeCloseTo(5.0);
    expect(midPnt.Y()).toBeCloseTo(0.0);
    expect(midPnt.Z()).toBeCloseTo(0.0);
    midPnt.delete();
    edge.delete();
    maker.delete();
    p1.delete();
    p2.delete();
  });
});

describe('Edge between 2 points (2D)', () => {
  it('creates a 2D edge between 2 points', () => {
    const p1 = new gp_Pnt2d(0, 0);
    const p2 = new gp_Pnt2d(10, 0);
    const maker = new BRepBuilderAPI_MakeEdge2d(p1, p2);
    expect(maker.IsDone()).toBe(true);
    const edge = maker.Edge();
    expect(edge.IsNull()).toBe(false);
    edge.delete();
    maker.delete();
    p1.delete();
    p2.delete();
  });

  it('creates a 2D edge and calculates the length', () => {
    const p1 = new gp_Pnt2d(0, 0);
    const p2 = new gp_Pnt2d(3, 4);
    const maker = new BRepBuilderAPI_MakeEdge2d(p1, p2);
    const edge = maker.Edge();
    expect(edgeLength(edge)).toBeCloseTo(5.0);
    edge.delete();
    maker.delete();
    p1.delete();
    p2.delete();
  });

  it('creates a 2D edge and calculates a point at a certain length', () => {
    const p1 = new gp_Pnt2d(0, 0);
    const p2 = new gp_Pnt2d(10, 0);
    const maker = new BRepBuilderAPI_MakeEdge2d(p1, p2);
    const edge = maker.Edge();
    const midPnt = pointAtLengthOnEdge(edge, 5.0);
    expect(midPnt.X()).toBeCloseTo(5.0);
    expect(midPnt.Y()).toBeCloseTo(0.0);
    midPnt.delete();
    edge.delete();
    maker.delete();
    p1.delete();
    p2.delete();
  });
});

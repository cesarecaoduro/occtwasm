import { describe, it, expect } from 'vitest';
import { gp_Pnt } from '../bindings/generated/ts/TKMath';
import { BRepBuilderAPI_MakePolygon } from '../bindings/generated/ts/TKTopAlgo';
import {
  wireLength,
  pointAtLengthOnWire,
} from '../bindings/manual/ts/helpers';

describe('Polyline between 5 points', () => {
  it('creates a polyline between 5 points', () => {
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(10, 0, 0);
    const p3 = new gp_Pnt(10, 10, 0);
    const p4 = new gp_Pnt(0, 10, 0);
    const p5 = new gp_Pnt(0, 20, 0);

    const maker = new BRepBuilderAPI_MakePolygon();
    maker.Add(p1);
    maker.Add(p2);
    maker.Add(p3);
    maker.Add(p4);
    maker.Add(p5);

    expect(maker.IsDone()).toBe(true);
    const wire = maker.Wire();
    expect(wire.IsNull()).toBe(false);

    wire.delete();
    maker.delete();
    p1.delete();
    p2.delete();
    p3.delete();
    p4.delete();
    p5.delete();
  });

  it('creates a polyline and calculates the length', () => {
    // Square-ish path: total length = 10 + 10 + 10 + 10 = 40
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(10, 0, 0);
    const p3 = new gp_Pnt(10, 10, 0);
    const p4 = new gp_Pnt(0, 10, 0);
    const p5 = new gp_Pnt(0, 20, 0);

    const maker = new BRepBuilderAPI_MakePolygon();
    maker.Add(p1);
    maker.Add(p2);
    maker.Add(p3);
    maker.Add(p4);
    maker.Add(p5);

    const wire = maker.Wire();
    const len = wireLength(wire);
    expect(len).toBeCloseTo(40.0);

    wire.delete();
    maker.delete();
    p1.delete();
    p2.delete();
    p3.delete();
    p4.delete();
    p5.delete();
  });

  it('creates a polyline and calculates a point at a certain length', () => {
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(10, 0, 0);
    const p3 = new gp_Pnt(10, 10, 0);
    const p4 = new gp_Pnt(0, 10, 0);
    const p5 = new gp_Pnt(0, 20, 0);

    const maker = new BRepBuilderAPI_MakePolygon();
    maker.Add(p1);
    maker.Add(p2);
    maker.Add(p3);
    maker.Add(p4);
    maker.Add(p5);

    const wire = maker.Wire();
    // At length 15: 10 along first edge + 5 along second
    // => (10, 5, 0)
    const pnt = pointAtLengthOnWire(wire, 15.0);
    expect(pnt.X()).toBeCloseTo(10.0);
    expect(pnt.Y()).toBeCloseTo(5.0);
    expect(pnt.Z()).toBeCloseTo(0.0);

    pnt.delete();
    wire.delete();
    maker.delete();
    p1.delete();
    p2.delete();
    p3.delete();
    p4.delete();
    p5.delete();
  });

  it('converts the polyline to a wire (it already is one)', () => {
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(10, 0, 0);
    const p3 = new gp_Pnt(10, 10, 0);

    const maker = new BRepBuilderAPI_MakePolygon();
    maker.Add(p1);
    maker.Add(p2);
    maker.Add(p3);

    const wire = maker.Wire();
    expect(wire.IsNull()).toBe(false);

    wire.delete();
    maker.delete();
    p1.delete();
    p2.delete();
    p3.delete();
  });
});

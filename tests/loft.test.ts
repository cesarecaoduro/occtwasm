import { describe, it, expect } from 'vitest';
import { gp_Pnt } from '../bindings/generated/ts/TKMath';
import { BRepBuilderAPI_MakeEdge, BRepBuilderAPI_MakeWire, BRepBuilderAPI_MakePolygon } from '../bindings/generated/ts/TKTopAlgo';
import {
  BRepOffsetAPI_ThruSections,
  surfaceProperties,
  volumeProperties,
} from '../bindings/manual/ts/helpers';

describe('Loft from open wires', () => {
  it('creates a loft from 2 open wires', () => {
    // Wire 1: line from (0,0,0) to (10,0,0)
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(10, 0, 0);
    const e1 = new BRepBuilderAPI_MakeEdge(p1, p2);
    const w1 = new BRepBuilderAPI_MakeWire(e1.Edge());
    const wire1 = w1.Wire();

    // Wire 2: line from (0,0,10) to (10,0,10)
    const p3 = new gp_Pnt(0, 0, 10);
    const p4 = new gp_Pnt(10, 0, 10);
    const e2 = new BRepBuilderAPI_MakeEdge(p3, p4);
    const w2 = new BRepBuilderAPI_MakeWire(e2.Edge());
    const wire2 = w2.Wire();

    // Loft (not solid, not ruled)
    const loft = new BRepOffsetAPI_ThruSections(false, false);
    loft.AddWire(wire1);
    loft.AddWire(wire2);
    loft.CheckCompatibility(false);
    loft.Build();

    expect(loft.IsDone()).toBe(true);
    const shape = loft.Shape();
    expect(shape.IsNull()).toBe(false);

    shape.delete();
    loft.delete();
    wire2.delete();
    w2.delete();
    e2.delete();
    wire1.delete();
    w1.delete();
    e1.delete();
    p1.delete();
    p2.delete();
    p3.delete();
    p4.delete();
  });

  it('creates a loft from open wires and calculates the surface area', () => {
    // Flat rectangular surface: 10 x 10 = area 100
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(10, 0, 0);
    const e1 = new BRepBuilderAPI_MakeEdge(p1, p2);
    const w1 = new BRepBuilderAPI_MakeWire(e1.Edge());
    const wire1 = w1.Wire();

    const p3 = new gp_Pnt(0, 0, 10);
    const p4 = new gp_Pnt(10, 0, 10);
    const e2 = new BRepBuilderAPI_MakeEdge(p3, p4);
    const w2 = new BRepBuilderAPI_MakeWire(e2.Edge());
    const wire2 = w2.Wire();

    const loft = new BRepOffsetAPI_ThruSections(false, true);
    loft.AddWire(wire1);
    loft.AddWire(wire2);
    loft.CheckCompatibility(false);
    loft.Build();

    const shape = loft.Shape();
    const props = surfaceProperties(shape);
    const area = props.Mass();
    expect(area).toBeCloseTo(100.0, 0);

    props.delete();
    shape.delete();
    loft.delete();
    wire2.delete();
    w2.delete();
    e2.delete();
    wire1.delete();
    w1.delete();
    e1.delete();
    p1.delete();
    p2.delete();
    p3.delete();
    p4.delete();
  });
});

describe('Loft from closed wires', () => {
  it('creates a loft from 2 closed wires (solid)', () => {
    // Bottom square at Z=0
    const b1 = new gp_Pnt(0, 0, 0);
    const b2 = new gp_Pnt(10, 0, 0);
    const b3 = new gp_Pnt(10, 10, 0);
    const b4 = new gp_Pnt(0, 10, 0);
    const bottom = new BRepBuilderAPI_MakePolygon();
    bottom.Add(b1);
    bottom.Add(b2);
    bottom.Add(b3);
    bottom.Add(b4);
    bottom.Close();
    const wire1 = bottom.Wire();

    // Top square at Z=10
    const t1 = new gp_Pnt(0, 0, 10);
    const t2 = new gp_Pnt(10, 0, 10);
    const t3 = new gp_Pnt(10, 10, 10);
    const t4 = new gp_Pnt(0, 10, 10);
    const top = new BRepBuilderAPI_MakePolygon();
    top.Add(t1);
    top.Add(t2);
    top.Add(t3);
    top.Add(t4);
    top.Close();
    const wire2 = top.Wire();

    // Loft to solid
    const loft = new BRepOffsetAPI_ThruSections(true, true);
    loft.AddWire(wire1);
    loft.AddWire(wire2);
    loft.CheckCompatibility(false);
    loft.Build();

    expect(loft.IsDone()).toBe(true);
    const shape = loft.Shape();
    expect(shape.IsNull()).toBe(false);

    shape.delete();
    loft.delete();
    wire2.delete();
    top.delete();
    wire1.delete();
    bottom.delete();
    b1.delete();
    b2.delete();
    b3.delete();
    b4.delete();
    t1.delete();
    t2.delete();
    t3.delete();
    t4.delete();
  });

  it('creates a loft from closed wires and calculates the volume', () => {
    // Box 10x10x10 -> volume = 1000
    const b1 = new gp_Pnt(0, 0, 0);
    const b2 = new gp_Pnt(10, 0, 0);
    const b3 = new gp_Pnt(10, 10, 0);
    const b4 = new gp_Pnt(0, 10, 0);
    const bottom = new BRepBuilderAPI_MakePolygon();
    bottom.Add(b1);
    bottom.Add(b2);
    bottom.Add(b3);
    bottom.Add(b4);
    bottom.Close();
    const wire1 = bottom.Wire();

    const t1 = new gp_Pnt(0, 0, 10);
    const t2 = new gp_Pnt(10, 0, 10);
    const t3 = new gp_Pnt(10, 10, 10);
    const t4 = new gp_Pnt(0, 10, 10);
    const top = new BRepBuilderAPI_MakePolygon();
    top.Add(t1);
    top.Add(t2);
    top.Add(t3);
    top.Add(t4);
    top.Close();
    const wire2 = top.Wire();

    const loft = new BRepOffsetAPI_ThruSections(true, true);
    loft.AddWire(wire1);
    loft.AddWire(wire2);
    loft.CheckCompatibility(false);
    loft.Build();

    const shape = loft.Shape();
    const props = volumeProperties(shape);
    const volume = props.Mass();
    expect(volume).toBeCloseTo(1000.0, 0);

    props.delete();
    shape.delete();
    loft.delete();
    wire2.delete();
    top.delete();
    wire1.delete();
    bottom.delete();
    b1.delete();
    b2.delete();
    b3.delete();
    b4.delete();
    t1.delete();
    t2.delete();
    t3.delete();
    t4.delete();
  });
});

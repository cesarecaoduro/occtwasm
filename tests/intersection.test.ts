import { describe, it, expect } from 'vitest';
import { gp_Pnt } from '../bindings/generated/ts/TKMath';
import { BRepBuilderAPI_MakeEdge, BRepBuilderAPI_MakeWire } from '../bindings/generated/ts/TKTopAlgo';
import { TopExp_Explorer, TopAbs_ShapeEnum } from '../bindings/generated/ts/TKBRep';
import { BRepAlgoAPI_Section } from '../bindings/manual/ts/helpers';

describe('Wire intersection', () => {
  it('intersects 2 wires and extracts the points', () => {
    // Wire 1: horizontal line from (-10, 0, 0) to (10, 0, 0)
    const w1p1 = new gp_Pnt(-10, 0, 0);
    const w1p2 = new gp_Pnt(10, 0, 0);
    const w1Edge = new BRepBuilderAPI_MakeEdge(w1p1, w1p2);
    const w1Wire = new BRepBuilderAPI_MakeWire(w1Edge.Edge());
    const wire1 = w1Wire.Wire();

    // Wire 2: vertical line from (0, -10, 0) to (0, 10, 0)
    const w2p1 = new gp_Pnt(0, -10, 0);
    const w2p2 = new gp_Pnt(0, 10, 0);
    const w2Edge = new BRepBuilderAPI_MakeEdge(w2p1, w2p2);
    const w2Wire = new BRepBuilderAPI_MakeWire(w2Edge.Edge());
    const wire2 = w2Wire.Wire();

    // Section (intersection)
    const section = BRepAlgoAPI_Section.FromShapes(wire1, wire2);
    expect(section.IsDone()).toBe(true);
    const result = section.Shape();
    expect(result.IsNull()).toBe(false);

    // Count vertices in the result (should be 1 intersection point)
    const explorer = new TopExp_Explorer(
      result,
      TopAbs_ShapeEnum.TopAbs_VERTEX,
      TopAbs_ShapeEnum.TopAbs_SHAPE,
    );
    let count = 0;
    while (explorer.More()) {
      count++;
      explorer.Next();
    }
    expect(count).toBeGreaterThanOrEqual(1);

    explorer.delete();
    result.delete();
    section.delete();
    wire2.delete();
    w2Wire.delete();
    w2Edge.delete();
    wire1.delete();
    w1Wire.delete();
    w1Edge.delete();
    w1p1.delete();
    w1p2.delete();
    w2p1.delete();
    w2p2.delete();
  });
});

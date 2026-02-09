import { describe, it, expect } from 'vitest';
import { gp_Pnt } from '../../bindings/generated/ts/TKMath';
import {
  BRep_Builder,
  BRep_Tool,
  TopoDS_Shape,
  TopExp_Explorer,
  TopAbs_ShapeEnum,
} from '../../bindings/generated/ts/TKBRep';

describe('TopoDS_Shape', () => {
  it('creates a null shape', () => {
    const shape = new TopoDS_Shape();
    expect(shape.IsNull()).toBe(true);
    shape.delete();
  });
});

describe('BRep_Builder', () => {
  it('creates a compound and adds shapes', () => {
    const builder = new BRep_Builder();
    const compound = builder.MakeCompound();
    expect(compound).toBeDefined();
    expect(compound.IsNull()).toBe(false);
    expect(compound.ShapeType()).toBe(TopAbs_ShapeEnum.TopAbs_COMPOUND);
    compound.delete();
    builder.delete();
  });

  it('creates a vertex at a point', () => {
    const builder = new BRep_Builder();
    const pnt = new gp_Pnt(5, 10, 15);
    const vertex = builder.MakeVertex(pnt, 0.001);
    expect(vertex).toBeDefined();
    expect(vertex.IsNull()).toBe(false);

    const retrievedPnt = BRep_Tool.Pnt(vertex);
    expect(retrievedPnt.X()).toBeCloseTo(5);
    expect(retrievedPnt.Y()).toBeCloseTo(10);
    expect(retrievedPnt.Z()).toBeCloseTo(15);

    vertex.delete();
    pnt.delete();
    retrievedPnt.delete();
    builder.delete();
  });
});

describe('TopExp_Explorer', () => {
  it('explores a compound shape', () => {
    const builder = new BRep_Builder();
    const compound = builder.MakeCompound();

    const pnt1 = new gp_Pnt(0, 0, 0);
    const pnt2 = new gp_Pnt(1, 1, 1);
    const v1 = builder.MakeVertex(pnt1, 0.001);
    const v2 = builder.MakeVertex(pnt2, 0.001);

    builder.Add(compound, v1);
    builder.Add(compound, v2);

    const explorer = new TopExp_Explorer(
      compound,
      TopAbs_ShapeEnum.TopAbs_VERTEX,
      TopAbs_ShapeEnum.TopAbs_SHAPE,
    );

    let count = 0;
    while (explorer.More()) {
      count++;
      explorer.Next();
    }
    expect(count).toBe(2);

    explorer.delete();
    v1.delete();
    v2.delete();
    pnt1.delete();
    pnt2.delete();
    compound.delete();
    builder.delete();
  });
});

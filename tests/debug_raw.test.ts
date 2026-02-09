import { describe, it, expect } from 'vitest';

describe('debug: raw Module Add', () => {
  it('adds two vertices to compound via raw Module', () => {
    const builder = new Module.BRep_Builder();
    const compound = builder.MakeCompound();
    const pnt1 = new Module.gp_Pnt(0, 0, 0);
    const pnt2 = new Module.gp_Pnt(1, 1, 1);
    const v1 = builder.MakeVertex_WithPnt(pnt1, 0.001);
    const v2 = builder.MakeVertex_WithPnt(pnt2, 0.001);
    builder.Add(compound, v1);
    builder.Add(compound, v2);
    const explorer = new Module.TopExp_Explorer(
      compound,
      Module.TopAbs_ShapeEnum.TopAbs_VERTEX,
      Module.TopAbs_ShapeEnum.TopAbs_SHAPE,
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

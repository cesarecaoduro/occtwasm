import { describe, it, expect } from 'vitest';
import { gp_Pnt } from '../bindings/generated/ts/TKMath';
import { BRep_Builder, TopExp_Explorer, TopAbs_ShapeEnum } from '../bindings/generated/ts/TKBRep';

describe('debug: wrapper Add', () => {
  it('round-trip compound via raw handle', () => {
    const builder = new BRep_Builder();
    const compound = builder.MakeCompound();
    const pnt1 = new gp_Pnt(0, 0, 0);
    const v1 = builder.MakeVertex(pnt1, 0.001);
    
    // Use raw handles directly to isolate the issue
    console.log('compound._handle:', typeof compound._handle, compound._handle);
    console.log('v1._handle:', typeof v1._handle, v1._handle);
    console.log('builder._handle:', typeof builder._handle, builder._handle);
    
    // Test Add via wrapper
    builder.Add(compound, v1);
    
    // Check with raw Module explorer
    const explorer = new Module.TopExp_Explorer(
      compound._handle,
      Module.TopAbs_ShapeEnum.TopAbs_VERTEX,
      Module.TopAbs_ShapeEnum.TopAbs_SHAPE,
    );
    let count = 0;
    while (explorer.More()) {
      count++;
      explorer.Next();
    }
    console.log('vertex count after wrapper Add:', count);
    expect(count).toBe(1);
    
    explorer.delete();
    v1.delete();
    pnt1.delete();
    compound.delete();
    builder.delete();
  });
  
  it('wrapper Add then raw Module Add', () => {
    const builder = new BRep_Builder();
    const compound = builder.MakeCompound();
    const pnt1 = new gp_Pnt(0, 0, 0);
    const pnt2 = new gp_Pnt(1, 1, 1);
    const v1 = builder.MakeVertex(pnt1, 0.001);
    const v2 = builder.MakeVertex(pnt2, 0.001);
    
    // First add via wrapper
    builder.Add(compound, v1);
    // Second add via raw Module
    builder._handle.Add(compound._handle, v2._handle);
    
    const explorer = new Module.TopExp_Explorer(
      compound._handle,
      Module.TopAbs_ShapeEnum.TopAbs_VERTEX,
      Module.TopAbs_ShapeEnum.TopAbs_SHAPE,
    );
    let count = 0;
    while (explorer.More()) {
      count++;
      explorer.Next();
    }
    console.log('vertex count (wrapper + raw):', count);
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

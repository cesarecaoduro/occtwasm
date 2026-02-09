import { describe, it, expect } from 'vitest';
import { gp_Pnt, gp_Vec, gp_Trsf } from '../../bindings/generated/ts/TKMath';

describe('gp_Pnt', () => {
  it('creates a default point at origin', () => {
    const pnt = new gp_Pnt();
    expect(pnt.X()).toBeCloseTo(0);
    expect(pnt.Y()).toBeCloseTo(0);
    expect(pnt.Z()).toBeCloseTo(0);
    pnt.delete();
  });

  it('creates a point with coordinates', () => {
    const pnt = new gp_Pnt(1.0, 2.0, 3.0);
    expect(pnt.X()).toBeCloseTo(1.0);
    expect(pnt.Y()).toBeCloseTo(2.0);
    expect(pnt.Z()).toBeCloseTo(3.0);
    pnt.delete();
  });

  it('computes distance between two points', () => {
    const p1 = new gp_Pnt(0, 0, 0);
    const p2 = new gp_Pnt(3, 4, 0);
    expect(p1.Distance(p2)).toBeCloseTo(5.0);
    p1.delete();
    p2.delete();
  });

  it('sets coordinates with SetCoord', () => {
    const pnt = new gp_Pnt();
    pnt.SetCoord(10, 20, 30);
    expect(pnt.X()).toBeCloseTo(10);
    expect(pnt.Y()).toBeCloseTo(20);
    expect(pnt.Z()).toBeCloseTo(30);
    pnt.delete();
  });
});

describe('gp_Vec', () => {
  it('creates a vector and computes magnitude', () => {
    const vec = new gp_Vec(3, 4, 0);
    expect(vec.Magnitude()).toBeCloseTo(5.0);
    vec.delete();
  });

  it('computes cross product', () => {
    const v1 = new gp_Vec(1, 0, 0);
    const v2 = new gp_Vec(0, 1, 0);
    const cross = v1.Crossed(v2);
    expect(cross.X()).toBeCloseTo(0);
    expect(cross.Y()).toBeCloseTo(0);
    expect(cross.Z()).toBeCloseTo(1);
    v1.delete();
    v2.delete();
    cross.delete();
  });
});

describe('gp_Trsf', () => {
  it('applies a translation', () => {
    const trsf = new gp_Trsf();
    const vec = new gp_Vec(10, 0, 0);
    trsf.SetTranslation(vec);

    const pnt = new gp_Pnt(0, 0, 0);
    const result = pnt.Transformed(trsf);
    expect(result.X()).toBeCloseTo(10);
    expect(result.Y()).toBeCloseTo(0);
    expect(result.Z()).toBeCloseTo(0);

    trsf.delete();
    vec.delete();
    pnt.delete();
    result.delete();
  });
});

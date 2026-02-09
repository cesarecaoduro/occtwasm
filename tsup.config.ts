import { defineConfig } from 'tsup';

export default defineConfig({
  entry: {
    index: 'src/index.ts',
    TKMath: 'bindings/generated/ts/TKMath.ts',
    TKBRep: 'bindings/generated/ts/TKBRep.ts',
    TKTopAlgo: 'bindings/generated/ts/TKTopAlgo.ts',
    TKGeomBase: 'bindings/generated/ts/TKGeomBase.ts',
    helpers: 'bindings/manual/ts/helpers.ts',
  },
  format: ['esm', 'cjs'],
  dts: true,
  splitting: false,
  sourcemap: true,
  clean: true,
  outDir: 'dist',
});

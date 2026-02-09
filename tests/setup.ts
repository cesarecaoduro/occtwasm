import createOCCTModule from '../build/dist/occt.js';

let Module: any;

beforeAll(async () => {
  Module = await createOCCTModule();
  (globalThis as any).Module = Module;
}, 30000);

export { Module };

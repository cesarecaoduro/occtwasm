import createOCCTModule from '../build/dist/occt.js';
import { setOCCTModule } from '../bindings/manual/ts/module-registry.js';

let Module: any;

beforeAll(async () => {
  Module = await createOCCTModule();
  setOCCTModule(Module);
  (globalThis as any).Module = Module;
}, 30000);

export { Module };

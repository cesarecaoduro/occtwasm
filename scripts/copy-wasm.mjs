import { copyFileSync, existsSync, mkdirSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = resolve(__dirname, "..");
const srcDir = resolve(root, "build", "dist");
const outDir = resolve(root, "dist");

const jsSrc = resolve(srcDir, "occt.js");
const wasmSrc = resolve(srcDir, "occt.wasm");

if (!existsSync(jsSrc) || !existsSync(wasmSrc)) {
  console.log("copy-wasm: build/dist/occt.js or occt.wasm not found; skipping.");
  process.exit(0);
}

mkdirSync(outDir, { recursive: true });

copyFileSync(jsSrc, resolve(outDir, "occt.js"));
copyFileSync(wasmSrc, resolve(outDir, "occt.wasm"));

console.log("copy-wasm: copied occt.js and occt.wasm to dist/");

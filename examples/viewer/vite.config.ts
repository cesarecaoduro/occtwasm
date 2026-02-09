import { defineConfig, type Plugin } from 'vite';
import { resolve } from 'path';
import { copyFileSync, existsSync, mkdirSync } from 'fs';

// Copy WASM files to public/ so Vite serves them
const wasmDir = resolve(__dirname, '../../build/dist');
const publicDir = resolve(__dirname, 'public');

if (existsSync(wasmDir)) {
  if (!existsSync(publicDir)) mkdirSync(publicDir, { recursive: true });
  for (const f of ['occt.wasm', 'occt.js']) {
    const src = resolve(wasmDir, f);
    if (existsSync(src)) copyFileSync(src, resolve(publicDir, f));
  }
}

// Plugin to redirect the dynamic `import('./occt.js')` from module-loader.ts
// to the copy in public/
function occtResolvePlugin(): Plugin {
  return {
    name: 'occt-resolve',
    resolveId(source, importer) {
      if (source === './occt.js' && importer?.includes('module-loader')) {
        return resolve(publicDir, 'occt.js');
      }
    },
  };
}

export default defineConfig({
  plugins: [occtResolvePlugin()],
  resolve: {
    alias: {
      '@occtwasm/core': resolve(__dirname, '../../src/index.ts'),
    },
  },
  optimizeDeps: {
    exclude: ['@occtwasm/core'],
  },
});

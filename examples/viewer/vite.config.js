import { defineConfig } from 'vite';
import { existsSync, copyFileSync, mkdirSync } from 'fs';
import { resolve, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

export default defineConfig({
  optimizeDeps: {
    exclude: ['@cesarecaoduro/occtwasm-core'],
  },
  plugins: [
    {
      name: 'copy-occt-wasm',
      apply: 'build',
      buildStart() {
        const wasmDir = resolve(__dirname, 'public', 'wasm');
        const pkgDist = resolve(
          __dirname,
          'node_modules',
          '@cesarecaoduro',
          'occtwasm-core',
          'dist',
        );
        mkdirSync(wasmDir, { recursive: true });
        for (const f of ['occt.js', 'occt.wasm']) {
          const src = resolve(pkgDist, f);
          if (existsSync(src)) {
            copyFileSync(src, resolve(wasmDir, f));
          }
        }
      },
    },
  ],
});

import { defineConfig } from 'vite';

export default defineConfig({
  optimizeDeps: {
    exclude: ['@cesarecaoduro/occtwasm-core'],
  },
});

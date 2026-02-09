import { resolve, dirname, join } from 'node:path';
import { mkdirSync, writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { loadModulesConfig, loadModuleConfig } from './parse-config.js';
import { emitEmbindModule } from './emit-embind.js';
import { emitTypeScriptWrappers } from './emit-typescript.js';

// ---------------------------------------------------------------------------
// Path constants
// ---------------------------------------------------------------------------

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, '../..');
const CONFIG_DIR = resolve(__dirname, '../config');
const CPP_OUT = resolve(ROOT, 'bindings/generated/cpp');
const TS_OUT = resolve(ROOT, 'bindings/generated/ts');

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

function main(): void {
  // Ensure output directories exist
  mkdirSync(CPP_OUT, { recursive: true });
  mkdirSync(TS_OUT, { recursive: true });

  const modulesConfig = loadModulesConfig(CONFIG_DIR);

  for (const [moduleName, moduleEntry] of Object.entries(modulesConfig.modules)) {
    if (!moduleEntry.enabled) {
      console.log(`Skipping disabled module: ${moduleName}`);
      continue;
    }

    console.log(`Processing module: ${moduleName}`);
    const config = loadModuleConfig(CONFIG_DIR, moduleEntry.config);

    // Generate C++ embind file
    const cppContent = emitEmbindModule(config);
    const cppPath = join(CPP_OUT, `${moduleName}.cpp`);
    writeFileSync(cppPath, cppContent, 'utf-8');
    console.log(`  Written: ${cppPath}`);

    // Generate TypeScript wrapper file
    const tsContent = emitTypeScriptWrappers(config);
    const tsPath = join(TS_OUT, `${moduleName}.ts`);
    writeFileSync(tsPath, tsContent, 'utf-8');
    console.log(`  Written: ${tsPath}`);
  }

  console.log('Codegen complete.');
}

main();

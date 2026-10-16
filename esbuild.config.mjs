import { build } from 'esbuild';
import esbuildPluginTsc from 'esbuild-plugin-tsc';

await build({
  entryPoints: ['src/main/functions/hello.ts'],
  outfile: 'dist/hello.mjs',
  bundle: true,
  minify: true,
  sourcemap: false,
  platform: 'node',
  target: 'node24',
  format: 'esm',
  external: ['@aws-sdk/*'],
  plugins: [esbuildPluginTsc()],
});

import { build } from 'esbuild';
import esbuildPluginTsc from 'esbuild-plugin-tsc';

const entryPoints = {
  signUp: 'src/main/functions/auth/signUp.ts',
  preSignUpTrigger: 'src/main/functions/auth/cognito/preSignUpTrigger.ts',
  signIn: 'src/main/functions/auth/signIn.ts',
};

await build({
  entryPoints,
  outdir: 'dist',
  entryNames: '[name]',
  outExtension: { '.js': '.mjs' },
  bundle: true,
  minify: true,
  sourcemap: false,
  platform: 'node',
  target: 'node24',
  format: 'esm',
  external: ['@aws-sdk/*'],
  plugins: [esbuildPluginTsc()],
});

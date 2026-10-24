import { build } from 'esbuild';
import esbuildPluginTsc from 'esbuild-plugin-tsc';

const entryPoints = {
  // Auth functions
  signUp: 'src/main/functions/auth/signUp.ts',
  signIn: 'src/main/functions/auth/signIn.ts',
  refreshToken: 'src/main/functions/auth/refreshToken.ts',
  forgotPassword: 'src/main/functions/auth/forgotPassword.ts',
  confirmForgotPassword: 'src/main/functions/auth/confirmForgotPassword.ts',
  preSignUpTrigger: 'src/main/functions/auth/cognito/preSignUpTrigger.ts',
  preTokenGenerationTrigger: 'src/main/functions/auth/cognito/preTokenGenerationTrigger.ts',
  customMessageTrigger: 'src/main/functions/auth/cognito/customMessageTrigger.ts',
  // Meal functions
  createMeal: 'src/main/functions/meals/createMeal.ts',
  // Account functions
  getMe: 'src/main/functions/accounts/getMe.ts',
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
  banner: {
    js: "import { createRequire } from 'node:module'; const require = createRequire(import.meta.url);",
  },
  external: ['@aws-sdk/*'],
  plugins: [esbuildPluginTsc()],
});

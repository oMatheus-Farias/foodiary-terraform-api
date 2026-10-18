import { z } from 'zod/mini';

const schema = z.object({
  // Cognito
  COGNITO_CLIENT_ID: z.string().check(z.minLength(1)),
  COGNITO_CLIENT_SECRET: z.string().check(z.minLength(1)),
  COGNITO_POOL_ID: z.string().check(z.minLength(1)),
});

export const env = schema.parse(process.env);

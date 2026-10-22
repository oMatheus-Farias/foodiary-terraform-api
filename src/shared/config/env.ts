import { z } from 'zod/mini';

const cognitoClientSchema = z.object({
  COGNITO_CLIENT_ID: z.string().check(z.minLength(1)),
  COGNITO_CLIENT_SECRET: z.string().check(z.minLength(1)),
});

const cognitoPoolSchema = z.object({
  COGNITO_POOL_ID: z.string().check(z.minLength(1)),
});

const dynamoDbSchema = z.object({
  MAIN_TABLE_NAME: z.string().check(z.minLength(1)),
});

export const getCognitoClientEnv = () => cognitoClientSchema.parse(process.env);

export const getCognitoPoolEnv = () => cognitoPoolSchema.parse(process.env);

export const getDynamoDbEnv = () => dynamoDbSchema.parse(process.env);

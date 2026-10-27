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

const s3Schema = z.object({
  MEALS_BUCKET: z.string().check(z.minLength(1)),
});

const cdnSchema = z.object({
  MEALS_CDN_DOMAIN_NAME: z.string().check(z.minLength(1)),
});

const queuesSchema = z.object({
  MEALS_QUEUE_URL: z.string().check(z.minLength(1)),
});

export const getCognitoClientEnv = () => cognitoClientSchema.parse(process.env);

export const getCognitoPoolEnv = () => cognitoPoolSchema.parse(process.env);

export const getDynamoDbEnv = () => dynamoDbSchema.parse(process.env);

export const getS3Env = () => s3Schema.parse(process.env);

export const getCDNEnv = () => cdnSchema.parse(process.env);

export const getQueuesEnv = () => queuesSchema.parse(process.env);

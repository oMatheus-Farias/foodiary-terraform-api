import { Profile } from '@application/entities/Profile';
import { z } from 'zod/mini';

export const signUpSchema = z.object({
  account: z.object({
    email: z.email({ error: "'email' is not valid" }),
    password: z
      .string()
      .check(z.minLength(8, { error: "'password' must be at least 8 characters long" })),
  }),
  profile: z.object({
    name: z.string().check(z.minLength(1, { error: '"name" is required' })),
    birthDate: z.pipe(
      z.iso.date({ error: '"birthDate" should be a valid date (YYYY-MM-DD)' }),
      z.transform((date) => new Date(date)),
    ),
    gender: z.enum(Profile.Gender, {
      error: `"gender" must be one of the following values: ${Object.values(Profile.Gender).join(
        ', ',
      )}`,
    }),
    height: z.number().check(z.gte(0, { error: '"height" must be a positive number' })),
    weight: z.number().check(z.gte(0, { error: '"weight" must be a positive number' })),
    activityLevel: z.enum(Profile.ActivityLevel, {
      error: `"activityLevel" must be one of the following values: ${Object.values(
        Profile.ActivityLevel,
      ).join(', ')}`,
    }),
    goal: z.enum(Profile.Goal, {
      error: `"goal" must be one of the following values: ${Object.values(Profile.Goal).join(
        ', ',
      )}`,
    }),
  }),
});

export type SignUpBody = z.infer<typeof signUpSchema>;

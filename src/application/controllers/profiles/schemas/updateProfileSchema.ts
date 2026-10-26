import { Profile } from '@application/entities/Profile';
import { z } from 'zod/mini';

export const updateProfileSchema = z.object({
  name: z.string().check(z.minLength(1, { error: "'name' is required" })),
  birthDate: z.pipe(
    z.iso.date({ error: "'birthDate' should be a valid date (YYYY-MM-DD)" }),
    z.transform((date) => new Date(date)),
  ),
  gender: z.enum(Profile.Gender, {
    message: `"gender" must be one of the following values: ${Object.values(Profile.Gender).join(
      ', ',
    )}`,
  }),
  height: z.number().check(z.gte(0, { error: "'height' must be a positive number" })),
  weight: z.number().check(z.gte(0, { error: "'weight' must be a positive number" })),
});

export type UpdateProfileBody = z.infer<typeof updateProfileSchema>;

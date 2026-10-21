import { z } from 'zod/mini';

export const signUpSchema = z.object({
  account: z.object({
    email: z.email({ message: "'email' is not valid" }),
    password: z.string().check(z.minLength(8, "'password' must be at least 8 characters long")),
  }),
});

export type SignUpBody = z.infer<typeof signUpSchema>;

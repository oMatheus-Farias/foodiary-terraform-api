import { minLength, z } from 'zod/mini';

export const confirmForgotPasswordSchema = z.object({
  email: z.email({ message: "'email' is not valid" }),
  confirmationCode: z.string().check(minLength(1, "'confirmationCode' is required")),
  password: z.string().check(minLength(8, "'password' must be at least 8 characters long")),
});

export type ConfirmForgotPasswordBody = z.infer<typeof confirmForgotPasswordSchema>;

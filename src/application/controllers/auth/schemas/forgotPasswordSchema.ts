import { z } from 'zod/mini';

export const forgotPasswordSchema = z.object({
  email: z.email({ message: "'email' is not valid" }),
});

export type ForgotPasswordBody = z.infer<typeof forgotPasswordSchema>;

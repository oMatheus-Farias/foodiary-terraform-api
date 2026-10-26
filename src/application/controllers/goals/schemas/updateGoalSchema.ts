import { z } from 'zod/mini';

export const updateGoalSchema = z.object({
  calories: z.number().check(z.gte(0)),
  proteins: z.number().check(z.gte(0)),
  carbohydrates: z.number().check(z.gte(0)),
  fats: z.number().check(z.gte(0)),
});

export type UpdateGoalBody = z.infer<typeof updateGoalSchema>;

import { z } from 'zod/mini';

export const listMealsByDaySchema = z.object({
  date: z.pipe(
    z.iso.date({ error: '"date" should be a valid date (YYYY-MM-DD)' }),
    z.transform((date) => new Date(date)),
  ),
});

import { z } from 'zod'

export const NutritionLogSchema = z.object({
  id: z.string().uuid(),
  totalCalories: z.number(),
})


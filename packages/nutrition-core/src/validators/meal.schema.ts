import { z } from 'zod'

export const MealSchema = z.object({
  id: z.string().uuid(),
  name: z.string(),
})


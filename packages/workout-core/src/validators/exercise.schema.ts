import { z } from 'zod'

export const ExerciseSchema = z.object({
  name: z.string(),
  reps: z.number().int().positive(),
})


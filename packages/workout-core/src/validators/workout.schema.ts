import { z } from 'zod'

export const WorkoutSchema = z.object({
  id: z.string().uuid(),
  name: z.string(),
})


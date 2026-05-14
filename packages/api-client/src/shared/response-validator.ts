import { z } from 'zod'

export function validateResponse<T>(schema: z.ZodType<T>, value: unknown): T {
  return schema.parse(value)
}


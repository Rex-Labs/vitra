# Vitra — API Patterns

## Repository Pattern

All data access MUST follow the repository pattern.

Example structure:

packages/api-client/nutrition/
  ├── nutrition-repository.ts    ← data access layer
  ├── nutrition-queries.ts       ← React Query query definitions
  └── index.ts                   ← public exports

## Request Validation

All API responses MUST be validated with zod before use.

Example:

const MealSchema = z.object({
  id: z.string().uuid(),
  name: z.string(),
  calories: z.number(),
  created_at: z.string(),
})

type Meal = z.infer<typeof MealSchema>

## Supabase Access Rules

- Never import supabase client in a component or screen
- Never import supabase client in a hook
- Always import via packages/api-client

## Error Handling

All API calls MUST handle errors explicitly.
Do not let errors bubble silently.
Use React Query's error state for UI feedback.

## Edge Functions

Supabase Edge Functions belong in:

infrastructure/supabase/functions/

Each edge function MUST:
- validate its input with zod
- return structured JSON
- handle errors with consistent error shapes


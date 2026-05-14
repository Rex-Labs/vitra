# Vitra — Architecture Rules

## Absolute Rules

1. React components NEVER call Supabase directly.
2. Business logic NEVER lives inside components.
3. Features NEVER directly import from other features.
4. All shared logic MUST live in packages/.
5. State MUST use Zustand (client) or React Query (server). Never both for the same data.
6. Routing files MUST remain thin. No business logic in route files.
7. All API responses MUST be validated with zod.
8. All shared types MUST be defined in packages/types.

## Anti-Patterns (NEVER DO)

- components calling fetch() directly
- useEffect for data fetching (use React Query)
- Copy-pasting business logic between features
- Creating god-objects or god-components
- Importing from a feature's internal files from outside that feature
- Storing server data in Zustand (use React Query cache)
- Skipping TypeScript types with `any`

## Allowed Patterns

- Feature hooks that wrap React Query queries
- Feature services that wrap packages/api-client functions
- Shared hooks that live in apps/mobile/src/shared/hooks
- Cross-feature navigation via Expo Router paths (never direct component imports)


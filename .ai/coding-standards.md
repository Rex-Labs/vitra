# Vitra — Coding Standards

## TypeScript

- strict mode always on
- no implicit any
- prefer explicit return types on all exported functions
- use type over interface unless extending
- use zod for runtime validation; infer TypeScript types from zod schemas

## File Naming

- all files: kebab-case
- React components: PascalCase export, kebab-case filename (e.g. workout-card.tsx exports WorkoutCard)
- hooks: camelCase starting with 'use'
- stores: kebab-case ending in '-store'

## Component Rules

- components are pure UI: no fetch, no business logic
- props must be typed explicitly
- avoid prop drilling beyond 2 levels; use context or Zustand
- keep components under 200 lines; split if larger

## Import Order

1. React / React Native
2. Expo packages
3. Third-party packages
4. Internal packages (@ui, @types, @api)
5. Feature-local imports
6. Shared imports

## Formatting

- Prettier enforced
- 2 space indentation
- single quotes
- trailing commas (ES5)
- 100 character line length


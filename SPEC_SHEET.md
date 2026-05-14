Vitra — Master Repository Creation Spec
Purpose
This document is the SINGLE SOURCE OF TRUTH for the Vitra monorepo architecture.
This file is intended for:
GitHub Copilot
AI coding agents
Future engineers
Contributors
Interns
Repository initialization
The purpose of this document is to ensure:
The repository NEVER becomes disorganized
The architecture remains scalable
All features follow the same patterns
The codebase is AI-friendly
Business logic stays modular
Future vertical expansion remains easy
---
Project Overview
Vitra is NOT just a calorie tracker.
Vitra is a modular AI-powered health and fitness operating system.
The app will eventually support:
Nutrition tracking
AI fridge scanning
Workout planning
Adaptive scheduling
Gym intelligence and busyness prediction
Calendar-aware workout optimization
Meal planning
Recovery tracking
AI coaching
Wearable integrations
Social/community systems
Smart recommendations
Future AI services
The repository MUST be structured for long-term scale.
---
CORE ARCHITECTURE PRINCIPLES
1. Feature-First Architecture
The mobile app MUST organize code by FEATURE.
DO NOT organize by:
screens
components
hooks
utils
services
at the root application level.
Correct:
```txt
src/features/nutrition/
src/features/workouts/
src/features/dashboard/
```
Incorrect:
```txt
src/screens/
src/components/
```
---
2. Business Logic Separation
Business logic MUST NEVER live directly inside React components.
React components should:
render UI
manage local UI state
call hooks/services
Business logic belongs in:
```txt
packages/
```
Examples:
```txt
packages/nutrition-core/
packages/workout-core/
packages/gym-intelligence/
```
---
3. Shared Reusable Systems
Anything shared between apps MUST become a package.
Examples:
auth
analytics
types
ui
api clients
recommendation logic
AI contracts
---
4. Scalable Monorepo Structure
The repository MUST support:
Mobile app
Admin dashboard
Web app
AI services
Data pipelines
Shared packages
Future microservices
---
5. AI-Friendly Architecture
The repository MUST remain readable by AI coding tools.
Requirements:
predictable naming
isolated domains
small reusable modules
explicit boundaries
typed contracts
minimal architectural ambiguity
---
REQUIRED TECH STACK
Frontend
Expo
React Native
TypeScript
Expo Router
Zustand
React Query
React Hook Form
Zod
---
Backend
Initial Backend:
Supabase
Edge Functions
PostgreSQL
Storage
Auth
Future Backend:
NestJS
PostgreSQL
AWS/GCP
---
AI/ML
Initial:
YOLOv8
PyTorch
Future:
TensorFlow Lite
On-device inference
Recommendation systems
---
Infrastructure
pnpm workspaces
Turborepo
GitHub Actions
Docker
---
REQUIRED ROOT REPOSITORY STRUCTURE
The repository MUST be initialized EXACTLY like this.
```txt
vitra/
│
├── apps/
│   │
│   ├── mobile/
│   ├── admin/
│   ├── web/
│   └── ml-dashboard/
│
├── packages/
│   │
│   ├── ui/
│   ├── config/
│   ├── types/
│   ├── auth/
│   ├── analytics/
│   ├── api-client/
│   ├── ai-core/
│   ├── nutrition-core/
│   ├── workout-core/
│   ├── scheduling-core/
│   ├── recommendation-core/
│   ├── gym-intelligence/
│   └── shared-utils/
│
├── services/
│   │
│   ├── api/
│   ├── ai-inference/
│   ├── recommendation-engine/
│   ├── notification-service/
│   └── data-pipeline/
│
├── infrastructure/
│   │
│   ├── supabase/
│   ├── docker/
│   ├── terraform/
│   └── github-actions/
│
├── ml/
│   │
│   ├── datasets/
│   ├── training/
│   ├── experiments/
│   ├── notebooks/
│   └── exports/
│
├── docs/
│   │
│   ├── architecture/
│   ├── product/
│   ├── features/
│   ├── api/
│   ├── ai/
│   ├── database/
│   └── adr/
│
├── .ai/
│   │
│   ├── project-overview.md
│   ├── architecture-rules.md
│   ├── coding-standards.md
│   ├── api-patterns.md
│   ├── ui-guidelines.md
│   ├── monorepo-guide.md
│   ├── naming-conventions.md
│   └── feature-roadmap.md
│
├── scripts/
├── .github/
├── turbo.json
├── pnpm-workspace.yaml
├── package.json
└── README.md
```
---
REQUIRED MOBILE APP STRUCTURE
```
Expo Router WILL be used, ANY MENTION OF SRC MUST BE IGNORED FOR EXPO ROUTER USAGE. I FORGOT
---
REQUIRED MOBILE SRC STRUCTURE
```txt
apps/mobile/src/
│
├── app/
│
├── features/
│   │
│   ├── auth/
│   ├── onboarding/
│   ├── dashboard/
│   ├── nutrition/
│   ├── workouts/
│   ├── fridge/
│   ├── restaurants/
│   ├── scheduling/
│   ├── gym-intelligence/
│   ├── recovery/
│   ├── ai-coach/
│   └── profile/
│
├── shared/
│   │
│   ├── components/
│   ├── hooks/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   ├── types/
│   └── services/
│
├── navigation/
├── providers/
├── store/
├── lib/
└── config/
```
---
FEATURE MODULE STRUCTURE
Every feature MUST follow the SAME structure.
Example:
```txt
features/nutrition/
│
├── components/
├── screens/
├── hooks/
├── services/
├── store/
├── types/
├── utils/
├── constants/
├── validation/
└── index.ts
```
---
REQUIRED SHARED PACKAGES
packages/ui
Purpose:
shared design system
reusable UI primitives
cards
buttons
modals
charts
typography
---
packages/types
Purpose:
shared TypeScript types
API contracts
DTOs
enums
shared interfaces
---
packages/api-client
Purpose:
Supabase wrappers
API abstractions
repository pattern
request validation
React components MUST NEVER call Supabase directly.
---
packages/auth
Purpose:
auth abstractions
token management
session handling
auth helpers
---
packages/analytics
Purpose:
event tracking
feature analytics
logging
telemetry
---
packages/nutrition-core
Purpose:
calorie calculations
macro calculations
nutrition recommendation logic
dietary rules
---
packages/workout-core
Purpose:
workout generation
split planning
progression logic
exercise recommendation systems
---
packages/scheduling-core
Purpose:
calendar-aware planning
adaptive scheduling
rescheduling logic
time optimization
---
packages/gym-intelligence
Purpose:
gym traffic prediction
occupancy estimation
recommendation systems
future Waze-style functionality
---
REQUIRED .AI FILES
The following files MUST exist.
.ai/project-overview.md
Contains:
overall vision
product goals
architecture summary
business philosophy
---
.ai/architecture-rules.md
Contains:
strict architecture rules
separation rules
anti-patterns
required boundaries
---
.ai/coding-standards.md
Contains:
TypeScript rules
naming conventions
linting expectations
formatting standards
---
.ai/api-patterns.md
Contains:
API architecture
repository patterns
request validation rules
server/client boundaries
---
.ai/ui-guidelines.md
Contains:
design system rules
spacing
typography
widget/card systems
component consistency
---
REQUIRED TYPESCRIPT RULES
The project MUST use strict TypeScript.
Requirements:
strict mode enabled
no implicit any
explicit return types preferred
zod validation for API responses
shared DTOs
---
REQUIRED STATE MANAGEMENT
Use:
Zustand for client state
React Query for server state
DO NOT use Redux.
---
REQUIRED API PATTERNS
Rules:
React components NEVER call Supabase directly
API logic MUST be abstracted
Validation MUST use zod
Shared types MUST be reused
API access belongs inside packages/api-client
---
REQUIRED UI RULES
The UI system MUST:
be modular
support widgets/cards
support future dashboard customization
use reusable primitives
avoid duplicated styling
---
REQUIRED INFRASTRUCTURE FILES
The repository MUST contain:
```txt
pnpm-workspace.yaml
```
```txt
turbo.json
```
```txt
.gitignore
```
```txt
.env.example
```
```txt
.prettierrc
```
```txt
.eslintrc
```
---
REQUIRED PNPM WORKSPACE FILE
```yaml
packages:
  - "apps/*"
  - "packages/*"
  - "services/*"
```
---
REQUIRED TURBO CONFIG
```json
{
  "$schema": "https://turbo.build/schema.json",
  "tasks": {
    "dev": {
      "cache": false
    },
    "build": {
      "dependsOn": ["^build"],
      "outputs": ["dist/**"]
    },
    "lint": {},
    "test": {}
  }
}
```
---
REQUIRED INITIAL DEPENDENCIES
Root Dev Dependencies
Install:
turbo
typescript
eslint
prettier
eslint-config-prettier
eslint-plugin-import
---
Mobile App Dependencies
Install:
expo-router
@react-navigation/native
@react-navigation/native-stack
react-native-safe-area-context
react-native-screens
react-native-reanimated
react-native-gesture-handler
zustand
@tanstack/react-query
react-hook-form
zod
@supabase/supabase-js
---
REQUIRED INITIAL FILE CREATION
The repository initialization process MUST create:
all root folders
all package folders
all service folders
all infrastructure folders
all AI context files
all config files
all mobile src folders
placeholder index.ts files where needed
---
REQUIRED INITIALIZATION COMMANDS
Run EXACTLY in this order.
---
1. Create Root Repository
```bash
mkdir vitra
cd vitra
```
---
2. Initialize Git
```bash
git init
```
---
3. Install pnpm
```bash
npm install -g pnpm
```
---
4. Initialize Package Manager
```bash
pnpm init
```
---
5. Create Root Folders
```bash
mkdir apps
mkdir packages
mkdir services
mkdir infrastructure
mkdir ml
mkdir docs
mkdir scripts
mkdir .ai
mkdir .github
```
---
6. Create App Folders
```bash
mkdir apps/mobile
mkdir apps/admin
mkdir apps/web
mkdir apps/ml-dashboard
```
---
7. Create Package Folders
```bash
mkdir packages/ui
mkdir packages/config
mkdir packages/types
mkdir packages/auth
mkdir packages/analytics
mkdir packages/api-client
mkdir packages/ai-core
mkdir packages/nutrition-core
mkdir packages/workout-core
mkdir packages/scheduling-core
mkdir packages/recommendation-core
mkdir packages/gym-intelligence
mkdir packages/shared-utils
```
---
8. Create Service Folders
```bash
mkdir services/api
mkdir services/ai-inference
mkdir services/recommendation-engine
mkdir services/notification-service
mkdir services/data-pipeline
```
---
9. Create Infrastructure Folders
```bash
mkdir infrastructure/supabase
mkdir infrastructure/docker
mkdir infrastructure/terraform
mkdir infrastructure/github-actions
```
---
10. Create ML Folders
```bash
mkdir ml/datasets
mkdir ml/training
mkdir ml/experiments
mkdir ml/notebooks
mkdir ml/exports
```
---
11. Create Docs Folders
```bash
mkdir docs/architecture
mkdir docs/product
mkdir docs/features
mkdir docs/api
mkdir docs/ai
mkdir docs/database
mkdir docs/adr
```
---
12. Create AI Context Files
```bash
touch .ai/project-overview.md
touch .ai/architecture-rules.md
touch .ai/coding-standards.md
touch .ai/api-patterns.md
touch .ai/ui-guidelines.md
touch .ai/monorepo-guide.md
touch .ai/naming-conventions.md
touch .ai/feature-roadmap.md
```
---
13. Create Workspace File
Create:
```txt
pnpm-workspace.yaml
```
Contents:
```yaml
packages:
  - "apps/*"
  - "packages/*"
  - "services/*"
```
---
14. Install Turborepo
```bash
pnpm add -D turbo
```
---
15. Create Turbo Config
Create:
```txt
turbo.json
```
Contents:
```json
{
  "$schema": "https://turbo.build/schema.json",
  "tasks": {
    "dev": {
      "cache": false
    },
    "build": {
      "dependsOn": ["^build"],
      "outputs": ["dist/**"]
    },
    "lint": {},
    "test": {}
  }
}
```
---
16. Initialize Expo App
```bash
npx create-expo-app@latest apps/mobile
```
Select:
```txt
TypeScript
```
---
17. Create Mobile src Structure
```bash
mkdir apps/mobile/src
mkdir apps/mobile/src/app
mkdir apps/mobile/src/features
mkdir apps/mobile/src/shared
mkdir apps/mobile/src/navigation
mkdir apps/mobile/src/providers
mkdir apps/mobile/src/store
mkdir apps/mobile/src/lib
mkdir apps/mobile/src/config
```
---
18. Create Feature Folders
```bash
mkdir apps/mobile/src/features/auth
mkdir apps/mobile/src/features/onboarding
mkdir apps/mobile/src/features/dashboard
mkdir apps/mobile/src/features/nutrition
mkdir apps/mobile/src/features/workouts
mkdir apps/mobile/src/features/fridge
mkdir apps/mobile/src/features/restaurants
mkdir apps/mobile/src/features/scheduling
mkdir apps/mobile/src/features/gym-intelligence
mkdir apps/mobile/src/features/recovery
mkdir apps/mobile/src/features/ai-coach
mkdir apps/mobile/src/features/profile
```
---
19. Install Mobile Dependencies
```bash
cd apps/mobile
```
```bash
pnpm add expo-router @react-navigation/native @react-navigation/native-stack react-native-safe-area-context react-native-screens react-native-reanimated react-native-gesture-handler zustand @tanstack/react-query react-hook-form zod @supabase/supabase-js
```
---
20. Install Root Dev Dependencies
Return to root:
```bash
cd ../..
```
Install:
```bash
pnpm add -D typescript eslint prettier eslint-config-prettier eslint-plugin-import
```
---
REQUIRED ROOT CONFIG FILES
Root package.json
The root package.json MUST contain:
workspace scripts
turbo scripts
shared lint commands
shared formatting commands
workspace-wide type checking
Required scripts:
```json
{
  "scripts": {
    "dev": "turbo run dev",
    "build": "turbo run build",
    "lint": "turbo run lint",
    "test": "turbo run test",
    "typecheck": "turbo run typecheck",
    "format": "prettier --write ."
  }
}
```
---
Required .gitignore
The repository MUST include:
```txt
node_modules
.pnpm-store
.expo
.expo-shared
dist
build
.env
.env.local
coverage
.DS_Store
*.log
```
---
Required .env.example
The repository MUST include:
```env
EXPO_PUBLIC_SUPABASE_URL=
EXPO_PUBLIC_SUPABASE_ANON_KEY=
EXPO_PUBLIC_GOOGLE_MAPS_API_KEY=
EXPO_PUBLIC_FATSECRET_API_KEY=
EXPO_PUBLIC_USDA_API_KEY=
```
---
Required tsconfig Structure
A shared base TypeScript config MUST exist.
Create:
```txt
packages/config/tsconfig.base.json
```
Contents:
```json
{
  "compilerOptions": {
    "strict": true,
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "node",
    "jsx": "react-jsx",
    "allowSyntheticDefaultImports": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "resolveJsonModule": true,
    "baseUrl": ".",
    "paths": {
      "@ui/*": ["packages/ui/*"],
      "@types/*": ["packages/types/*"],
      "@api/*": ["packages/api-client/*"],
      "@shared/*": ["apps/mobile/src/shared/*"]
    }
  }
}
```
---
REQUIRED FEATURE STANDARDS
Every feature MUST:
own its own hooks
own its own screens
own its own services
own its own validation
own its own store if needed
own its own types
Features MUST NOT:
directly depend on other feature internals
share random utility files
bypass shared contracts
duplicate business logic
Cross-feature logic belongs in packages/.
---
REQUIRED NAMING CONVENTIONS
File Naming
Use:
```txt
kebab-case
```
Examples:
```txt
nutrition-service.ts
macro-calculator.ts
workout-card.tsx
```
---
Component Naming
Use:
```txt
PascalCase
```
Examples:
```txt
WorkoutCard
MacroChart
NutritionDashboard
```
---
Hook Naming
Use:
```txt
useSomething
```
Examples:
```txt
useWorkoutPlan
useNutritionSummary
```
---
Store Naming
Use:
```txt
something-store.ts
```
Examples:
```txt
nutrition-store.ts
workout-store.ts
```
---
REQUIRED ROUTING RULES
Expo Router may be used.
However:
routing files MUST remain thin
routing files MUST NOT contain business logic
screens should delegate logic to feature hooks/services
Routing structure should remain minimal.
---
REQUIRED API CLIENT STRUCTURE
packages/api-client MUST contain:
```txt
packages/api-client/
│
├── auth/
├── nutrition/
├── workouts/
├── fridge/
├── restaurants/
├── scheduling/
├── gym-intelligence/
├── shared/
└── index.ts
```
Each API module MUST:
validate responses
export typed functions
isolate backend access
avoid UI dependencies
---
REQUIRED DATABASE ARCHITECTURE
Initial database provider:
Supabase PostgreSQL
Core tables:
```txt
users
profiles
nutrition_logs
meals
foods
food_scans
workouts
workout_sessions
gym_preferences
notifications
subscriptions
fridge_inventory
recipes
user_settings
analytics_events
```
---
REQUIRED AUTHENTICATION RULES
Authentication provider:
Supabase Auth
Google OAuth
Rules:
auth state must be centralized
tokens must not be manually duplicated
auth helpers belong in packages/auth
screens must not manage auth logic directly
---
REQUIRED ANALYTICS RULES
Analytics MUST be event-driven.
Examples:
```txt
meal_logged
workout_completed
fridge_scan_uploaded
gym_selected
subscription_started
```
Analytics events belong in:
```txt
packages/analytics
```
---
REQUIRED AI/ML STANDARDS
Initial AI goals:
fridge food detection
packaged food recognition
produce recognition
recommendation systems
Future AI goals:
workout adaptation
gym occupancy prediction
scheduling optimization
meal recommendations
AI coaching
---
Required ML Folder Standards
Datasets MUST remain separated.
Structure:
```txt
ml/datasets/
│
├── raw/
├── processed/
├── labeled/
└── exports/
```
---
Required Training Structure
```txt
ml/training/
│
├── yolov8/
├── tensorflow/
├── preprocessing/
├── augmentation/
└── evaluation/
```
---
REQUIRED TESTING STRUCTURE
Testing MUST exist from the beginning.
Required:
unit tests
hook tests
service tests
utility tests
Future:
E2E testing
integration testing
AI evaluation testing
---
REQUIRED MOBILE DESIGN SYSTEM
The mobile UI MUST:
use reusable cards
support widgets
support dashboard composition
support dark mode later
avoid duplicated styling
use shared spacing system
use shared typography system
---
REQUIRED DASHBOARD SYSTEM
Dashboard architecture MUST support:
drag-and-drop widgets later
customizable layouts
reusable cards
analytics widgets
nutrition widgets
workout widgets
scheduling widgets
The dashboard should be architected as a composable system.
---
REQUIRED GYM INTELLIGENCE SYSTEM DESIGN
The gym intelligence system MUST remain modular.
Future inputs may include:
geolocation density
calendar schedules
traffic patterns
gym check-ins
user traffic reports
wearable data
weather
historical patterns
This system MUST remain isolated from UI.
All prediction logic belongs in:
```txt
packages/gym-intelligence
```
and later:
```txt
services/gym-intelligence-engine
```
---
REQUIRED CI/CD STANDARDS
GitHub Actions MUST support:
linting
formatting checks
type checking
test execution
Expo preview builds
Future:
automated deployments
AI pipeline deployment
staging environments
---
REQUIRED ENGINEERING RULES
DO:
prefer modular systems
isolate domains
write reusable abstractions
prefer typed contracts
use zod validation
maintain consistent patterns
keep files reasonably small
DO NOT:
mix business logic with UI
directly access backend in screens
duplicate logic
create massive utility folders
tightly couple features
introduce architectural drift
---
REQUIRED FUTURE SCALABILITY PREPARATION
The repository MUST be prepared for future:
microservices
web support
AI inference servers
wearable integrations
health APIs
gym partnerships
AI recommendation systems
calendar integrations
offline functionality
TensorFlow Lite support
enterprise features
The initial architecture MUST NOT block future expansion.
---
REQUIRED INITIAL PLACEHOLDER FILES
Create placeholder:
```txt
index.ts
```
files in:
packages
features
services
shared modules
This ensures clean exports.
---
REQUIRED EXPORT PATTERN
Every feature/package should expose a public API.
Use:
```ts
export * from './services/nutrition-service'
export * from './hooks/use-nutrition-summary'
```
Avoid deep internal imports.
---
REQUIRED DOCUMENTATION STANDARDS
Every major feature added later should receive:
```txt
docs/features/feature-name/
```
Containing:
overview
architecture
user flows
API contracts
edge cases
future plans
---
REQUIRED AI AGENT COMPATIBILITY
The repository should remain compatible with:
GitHub Copilot
Cursor
Claude Code
future AI agents
Architecture decisions should optimize:
discoverability
readability
predictability
modularity
---
FINAL RULES
The repository MUST remain:
modular
scalable
domain-driven
AI-friendly
strongly typed
maintainable
reusable
feature-isolated
future-proof
The repository MUST NOT devolve into:
random folders
duplicated business logic
deeply nested UI chaos
untyped APIs
component spaghetti
architecture drift
shared state chaos
undocumented patterns
This document is authoritative.
---
---
CONTINUATION — EXTENDED SPEC
The following sections complete the areas referenced but not fully defined above.
---
REQUIRED .AI FILE CONTENTS
Each `.ai/` file MUST be populated with real content, not left empty.
---
.ai/project-overview.md — Required Contents
```md
# Vitra — Project Overview

## Vision

Vitra is an AI-powered health and fitness operating system.
It is not a calorie tracker. It is a modular, intelligent platform
that learns from users and adapts to their lives.

## Core Product Goals

- Remove friction from healthy living
- Make fitness planning feel automatic
- Make nutrition logging effortless
- Make gym intelligence available to everyone
- Build a platform that scales with the user's goals

## Architecture Summary

Vitra is built as a monorepo using Turborepo and pnpm workspaces.
All business logic is isolated in packages/.
All UI lives in apps/.
All AI inference lives in services/.

## Business Philosophy

- Ship a focused MVP first
- Every feature must be modular and replaceable
- AI must be a first-class citizen, not an afterthought
- The system must be designed for wearable and health API integrations from day one
```
---
.ai/architecture-rules.md — Required Contents
```md
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
```
---
.ai/coding-standards.md — Required Contents
```md
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
```
---
.ai/api-patterns.md — Required Contents
```md
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
```
---
.ai/ui-guidelines.md — Required Contents
```md
# Vitra — UI Guidelines

## Design System

All UI primitives belong in packages/ui.

Do NOT create one-off components in features that should be shared.

## Spacing

Use a consistent 4pt spacing scale:

4, 8, 12, 16, 20, 24, 32, 40, 48, 64

Define spacing tokens in packages/ui/theme/spacing.ts

## Typography

Define a shared type scale:

- xs: 12
- sm: 14
- md: 16
- lg: 18
- xl: 20
- 2xl: 24
- 3xl: 28
- 4xl: 32

Define in packages/ui/theme/typography.ts

## Color Tokens

Define all colors as tokens in packages/ui/theme/colors.ts

Never hardcode hex values in components.

## Card System

Cards are the primary layout unit.

Cards MUST:
- have consistent border radius
- use shared shadow styles
- support light and dark mode

## Widget System

Dashboard widgets extend cards.

Widgets MUST:
- be self-contained
- accept only data via props (no internal fetching)
- support configurable sizes

## Dark Mode

Dark mode MUST be architected from day one.

Use theme tokens, never hardcoded colors.
```
---
.ai/monorepo-guide.md — Required Contents
```md
# Vitra — Monorepo Guide

## Package Manager

pnpm with workspaces.

## Build System

Turborepo.

## Adding a New Package

1. Create directory under packages/
2. Add package.json with name @vitra/package-name
3. Add tsconfig.json extending packages/config/tsconfig.base.json
4. Add index.ts as public API entry
5. Add to consuming app's package.json dependencies

## Adding a New App

1. Create directory under apps/
2. Initialize with appropriate framework
3. Add package.json
4. Configure turbo.json tasks if needed

## Running Commands

From root:

pnpm dev           → start all dev servers
pnpm build         → build all packages and apps
pnpm lint          → lint everything
pnpm test          → test everything
pnpm typecheck     → typecheck everything
pnpm format        → format everything

For a single app or package:

pnpm --filter @vitra/mobile dev
pnpm --filter @vitra/nutrition-core build

## Internal Package Imports

Always use the package name, never relative paths across packages:

✅ import { calculateMacros } from '@vitra/nutrition-core'
❌ import { calculateMacros } from '../../packages/nutrition-core/src'
```
---
.ai/naming-conventions.md — Required Contents
```md
# Vitra — Naming Conventions

## Packages

@vitra/ui
@vitra/types
@vitra/api-client
@vitra/auth
@vitra/analytics
@vitra/nutrition-core
@vitra/workout-core
@vitra/scheduling-core
@vitra/gym-intelligence
@vitra/recommendation-core
@vitra/ai-core
@vitra/shared-utils

## Feature Names

Consistent across the entire codebase:

- auth
- onboarding
- dashboard
- nutrition
- workouts
- fridge
- restaurants
- scheduling
- gym-intelligence
- recovery
- ai-coach
- profile

## Event Names (Analytics)

All events: snake_case

Examples:
- meal_logged
- workout_started
- workout_completed
- fridge_scanned
- food_identified
- gym_checked_in
- subscription_started
- subscription_cancelled
- ai_coach_message_sent

## Database Tables

All tables: snake_case, plural

Examples:
- nutrition_logs
- workout_sessions
- food_scans

## Zod Schemas

PascalCase + Schema suffix:

MealSchema
WorkoutSchema
UserProfileSchema

## API Repository Functions

camelCase verbs:

getMealById
createNutritionLog
updateUserProfile
deleteWorkoutSession
```
---
.ai/feature-roadmap.md — Required Contents
```md
# Vitra — Feature Roadmap

## Phase 1 — MVP

- User auth (email + Google)
- Onboarding (goals, dietary preferences, fitness level)
- Manual nutrition logging
- Calorie and macro dashboard
- Basic workout logging

## Phase 2 — AI Fridge & Food Scanning

- Camera-based fridge scan
- YOLOv8 food detection
- Packaged food recognition
- Produce recognition
- Auto-population of meal logs from scan results

## Phase 3 — Workout Intelligence

- AI-generated workout plans
- Progressive overload tracking
- Split planning
- Exercise substitution logic

## Phase 4 — Scheduling & Calendar Integration

- Calendar-aware scheduling
- Workout time recommendations
- Adaptive rescheduling
- Recovery-aware planning

## Phase 5 — Gym Intelligence

- Gym traffic prediction
- Occupancy heatmaps
- Best-time-to-go recommendations
- Waze-style crowdsourced gym busyness

## Phase 6 — AI Coach

- Conversational AI coaching
- Personalized recommendations
- Progress analysis
- Goal adjustment suggestions

## Phase 7 — Wearable & Health API Integrations

- Apple Health
- Google Fit
- Whoop
- Garmin
- Oura Ring

## Phase 8 — Social & Community

- Friend connections
- Shared workouts
- Leaderboards
- Community challenges

## Phase 9 — Enterprise & Gym Partnerships

- Gym admin dashboard
- Capacity management
- Partnership APIs
- White-label options
```
---
REQUIRED PACKAGE INTERNAL STRUCTURES
Every package MUST follow a consistent internal structure.
---
packages/ui — Internal Structure
```txt
packages/ui/
│
├── src/
│   ├── components/
│   │   ├── Button/
│   │   │   ├── Button.tsx
│   │   │   ├── Button.types.ts
│   │   │   └── index.ts
│   │   ├── Card/
│   │   ├── Modal/
│   │   ├── Typography/
│   │   ├── Input/
│   │   └── Chart/
│   │
│   └── theme/
│       ├── colors.ts
│       ├── spacing.ts
│       ├── typography.ts
│       ├── shadows.ts
│       └── index.ts
│
├── index.ts
├── package.json
└── tsconfig.json
```
---
packages/types — Internal Structure
```txt
packages/types/
│
├── src/
│   ├── auth.types.ts
│   ├── nutrition.types.ts
│   ├── workout.types.ts
│   ├── scheduling.types.ts
│   ├── gym.types.ts
│   ├── user.types.ts
│   ├── analytics.types.ts
│   └── api.types.ts
│
├── index.ts
├── package.json
└── tsconfig.json
```
---
packages/api-client — Internal Structure
```txt
packages/api-client/
│
├── src/
│   ├── client/
│   │   └── supabase-client.ts
│   │
│   ├── auth/
│   │   ├── auth-repository.ts
│   │   └── index.ts
│   │
│   ├── nutrition/
│   │   ├── nutrition-repository.ts
│   │   ├── nutrition-queries.ts
│   │   └── index.ts
│   │
│   ├── workouts/
│   │   ├── workout-repository.ts
│   │   ├── workout-queries.ts
│   │   └── index.ts
│   │
│   ├── fridge/
│   │   ├── fridge-repository.ts
│   │   └── index.ts
│   │
│   ├── gym-intelligence/
│   │   ├── gym-repository.ts
│   │   └── index.ts
│   │
│   └── shared/
│       ├── base-repository.ts
│       ├── error-handler.ts
│       └── response-validator.ts
│
├── index.ts
├── package.json
└── tsconfig.json
```
---
packages/nutrition-core — Internal Structure
```txt
packages/nutrition-core/
│
├── src/
│   ├── calculators/
│   │   ├── calorie-calculator.ts
│   │   ├── macro-calculator.ts
│   │   ├── bmr-calculator.ts
│   │   └── tdee-calculator.ts
│   │
│   ├── validators/
│   │   ├── nutrition-log.schema.ts
│   │   └── meal.schema.ts
│   │
│   ├── recommendations/
│   │   ├── macro-split-recommender.ts
│   │   └── calorie-target-recommender.ts
│   │
│   └── constants/
│       ├── dietary-goals.ts
│       └── macro-ratios.ts
│
├── index.ts
├── package.json
└── tsconfig.json
```
---
packages/workout-core — Internal Structure
```txt
packages/workout-core/
│
├── src/
│   ├── generators/
│   │   ├── workout-plan-generator.ts
│   │   └── exercise-selector.ts
│   │
│   ├── progression/
│   │   ├── progressive-overload.ts
│   │   └── progression-tracker.ts
│   │
│   ├── splits/
│   │   ├── split-planner.ts
│   │   └── split-types.ts
│   │
│   └── validators/
│       ├── workout.schema.ts
│       └── exercise.schema.ts
│
├── index.ts
├── package.json
└── tsconfig.json
```
---
packages/gym-intelligence — Internal Structure
```txt
packages/gym-intelligence/
│
├── src/
│   ├── prediction/
│   │   ├── traffic-predictor.ts
│   │   └── occupancy-estimator.ts
│   │
│   ├── data/
│   │   ├── historical-processor.ts
│   │   └── pattern-analyzer.ts
│   │
│   └── recommendations/
│       ├── best-time-recommender.ts
│       └── gym-selector.ts
│
├── index.ts
├── package.json
└── tsconfig.json
```
---
REQUIRED GITHUB ACTIONS WORKFLOWS
The following CI workflows MUST be created at initialization.
---
.github/workflows/ci.yml
```yaml
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v3
        with:
          version: 9
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm lint

  typecheck:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v3
        with:
          version: 9
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm typecheck

  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v3
        with:
          version: 9
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm test
```
---
.github/workflows/expo-preview.yml
```yaml
name: Expo Preview

on:
  pull_request:
    branches: [main, develop]

jobs:
  preview:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v3
        with:
          version: 9
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - name: Build Expo Preview
        run: pnpm --filter @vitra/mobile expo export
        env:
          EXPO_PUBLIC_SUPABASE_URL: ${{ secrets.EXPO_PUBLIC_SUPABASE_URL }}
          EXPO_PUBLIC_SUPABASE_ANON_KEY: ${{ secrets.EXPO_PUBLIC_SUPABASE_ANON_KEY }}
```
---
REQUIRED SUPABASE INFRASTRUCTURE STRUCTURE
```txt
infrastructure/supabase/
│
├── migrations/
│   └── 0001_initial_schema.sql
│
├── functions/
│   ├── analyze-fridge/
│   │   └── index.ts
│   ├── recommend-meals/
│   │   └── index.ts
│   └── gym-traffic/
│       └── index.ts
│
├── seed/
│   └── seed.sql
│
└── config.toml
```
---
REQUIRED INITIAL DATABASE MIGRATION
Create the initial schema migration at:
```txt
infrastructure/supabase/migrations/0001_initial_schema.sql
```
Contents:
```sql
-- Users and Profiles
create table profiles (
  id uuid references auth.users on delete cascade primary key,
  display_name text,
  avatar_url text,
  date_of_birth date,
  height_cm numeric,
  weight_kg numeric,
  fitness_goal text,
  dietary_preference text,
  activity_level text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Nutrition Logs
create table nutrition_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  logged_at date not null,
  total_calories numeric,
  total_protein_g numeric,
  total_carbs_g numeric,
  total_fat_g numeric,
  created_at timestamptz default now()
);

-- Foods
create table foods (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  brand text,
  calories_per_100g numeric,
  protein_per_100g numeric,
  carbs_per_100g numeric,
  fat_per_100g numeric,
  source text,
  external_id text,
  created_at timestamptz default now()
);

-- Meals
create table meals (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  nutrition_log_id uuid references nutrition_logs(id) on delete cascade,
  name text,
  meal_type text,
  consumed_at timestamptz,
  created_at timestamptz default now()
);

-- Workouts
create table workouts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  name text not null,
  notes text,
  scheduled_at timestamptz,
  completed_at timestamptz,
  created_at timestamptz default now()
);

-- Workout Sessions
create table workout_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  workout_id uuid references workouts(id),
  started_at timestamptz,
  completed_at timestamptz,
  duration_minutes numeric,
  notes text,
  created_at timestamptz default now()
);

-- Food Scans
create table food_scans (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  image_url text,
  scan_type text,
  status text,
  result jsonb,
  created_at timestamptz default now()
);

-- Fridge Inventory
create table fridge_inventory (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  food_id uuid references foods(id),
  name text,
  quantity numeric,
  unit text,
  expires_at date,
  added_at timestamptz default now()
);

-- Gym Preferences
create table gym_preferences (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  gym_name text,
  gym_address text,
  preferred_times jsonb,
  created_at timestamptz default now()
);

-- Notifications
create table notifications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  type text,
  title text,
  body text,
  read boolean default false,
  created_at timestamptz default now()
);

-- Analytics Events
create table analytics_events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id),
  event_name text not null,
  properties jsonb,
  created_at timestamptz default now()
);

-- Subscriptions
create table subscriptions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  plan text,
  status text,
  started_at timestamptz,
  expires_at timestamptz,
  created_at timestamptz default now()
);

-- Row Level Security
alter table profiles enable row level security;
alter table nutrition_logs enable row level security;
alter table foods enable row level security;
alter table meals enable row level security;
alter table workouts enable row level security;
alter table workout_sessions enable row level security;
alter table food_scans enable row level security;
alter table fridge_inventory enable row level security;
alter table gym_preferences enable row level security;
alter table notifications enable row level security;
alter table analytics_events enable row level security;
alter table subscriptions enable row level security;

-- RLS Policies (users can only access their own data)
create policy "Users can view own profile" on profiles for select using (auth.uid() = id);
create policy "Users can update own profile" on profiles for update using (auth.uid() = id);
create policy "Users can view own nutrition logs" on nutrition_logs for all using (auth.uid() = user_id);
create policy "Users can view own meals" on meals for all using (auth.uid() = user_id);
create policy "Users can view own workouts" on workouts for all using (auth.uid() = user_id);
create policy "Users can view own scans" on food_scans for all using (auth.uid() = user_id);
create policy "Users can view own fridge" on fridge_inventory for all using (auth.uid() = user_id);
create policy "Users can view own notifications" on notifications for all using (auth.uid() = user_id);
create policy "Users can view own subscriptions" on subscriptions for all using (auth.uid() = user_id);
```
---
REQUIRED PRETTIER CONFIG
Create:
```txt
.prettierrc
```
Contents:
```json
{
  "semi": false,
  "singleQuote": true,
  "trailingComma": "es5",
  "printWidth": 100,
  "tabWidth": 2,
  "bracketSpacing": true,
  "arrowParens": "always"
}
```
---
REQUIRED ESLINT CONFIG
Create:
```txt
.eslintrc.js
```
Contents:
```js
module.exports = {
  root: true,
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:import/recommended',
    'plugin:import/typescript',
    'prettier',
  ],
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint', 'import'],
  rules: {
    '@typescript-eslint/no-explicit-any': 'error',
    '@typescript-eslint/explicit-function-return-type': 'warn',
    '@typescript-eslint/no-unused-vars': ['error', { argsIgnorePattern: '^_' }],
    'import/order': [
      'warn',
      {
        groups: ['builtin', 'external', 'internal', 'parent', 'sibling', 'index'],
        'newlines-between': 'always',
      },
    ],
    'no-console': 'warn',
  },
  settings: {
    'import/resolver': {
      typescript: {},
    },
  },
}
```
---
REQUIRED DOCKER SETUP
Create:
```txt
infrastructure/docker/docker-compose.yml
```
Contents:
```yaml
version: '3.8'

services:
  api:
    build:
      context: ../../services/api
      dockerfile: Dockerfile
    ports:
      - "3001:3001"
    environment:
      - NODE_ENV=development
      - SUPABASE_URL=${SUPABASE_URL}
      - SUPABASE_SERVICE_KEY=${SUPABASE_SERVICE_KEY}
    volumes:
      - ../../services/api:/app
      - /app/node_modules

  ai-inference:
    build:
      context: ../../services/ai-inference
      dockerfile: Dockerfile
    ports:
      - "8000:8000"
    volumes:
      - ../../ml/exports:/models
```
---
REQUIRED README
Create the root:
```txt
README.md
```
Contents:
```md
# Vitra

AI-powered health and fitness operating system.

## Architecture

Vitra is a monorepo built with Turborepo and pnpm workspaces.

| Directory | Purpose |
|-----------|---------|
| apps/mobile | React Native / Expo mobile app |
| apps/admin | Admin dashboard |
| apps/web | Web app |
| packages/ | Shared business logic and UI |
| services/ | Backend microservices |
| infrastructure/ | Supabase, Docker, Terraform |
| ml/ | ML training, datasets, experiments |
| docs/ | Documentation |
| .ai/ | AI agent context files |

## Getting Started

### Prerequisites

- Node.js 20+
- pnpm 9+
- Expo CLI

### Installation

```bash
pnpm install
```
Development
```bash
pnpm dev
```
Mobile
```bash
pnpm --filter @vitra/mobile dev
```
Documentation
See docs/ for architecture and feature documentation.
See .ai/ for AI agent context files.
```

---

# REQUIRED TURBO CONFIG — EXTENDED

Update turbo.json to include typecheck:

```json
{
  "$schema": "https://turbo.build/schema.json",
  "tasks": {
    "dev": {
      "cache": false,
      "persistent": true
    },
    "build": {
      "dependsOn": ["^build"],
      "outputs": ["dist/**", ".expo/**"]
    },
    "lint": {
      "outputs": []
    },
    "test": {
      "outputs": ["coverage/**"]
    },
    "typecheck": {
      "dependsOn": ["^build"],
      "outputs": []
    },
    "format": {
      "outputs": []
    }
  }
}
```
---
REQUIRED PACKAGE.JSON — EACH PACKAGE
Every package MUST have a package.json.
Example for packages/nutrition-core:
```json
{
  "name": "@vitra/nutrition-core",
  "version": "0.0.1",
  "private": true,
  "main": "./dist/index.js",
  "types": "./dist/index.d.ts",
  "scripts": {
    "build": "tsc",
    "typecheck": "tsc --noEmit",
    "lint": "eslint src/",
    "test": "jest"
  },
  "devDependencies": {
    "typescript": "*"
  },
  "dependencies": {
    "zod": "*"
  }
}
```
---
REQUIRED TSCONFIG — EACH PACKAGE
Every package MUST have a tsconfig.json.
Example for packages/nutrition-core:
```json
{
  "extends": "../config/tsconfig.base.json",
  "compilerOptions": {
    "outDir": "./dist",
    "rootDir": "./src"
  },
  "include": ["src"],
  "exclude": ["node_modules", "dist"]
}
```
---
REQUIRED ARCHITECTURE DECISION RECORDS
Architecture decisions MUST be documented.
Create the first ADR at:
```txt
docs/adr/0001-monorepo-architecture.md
```
Contents:
```md
# ADR 0001 — Monorepo Architecture

## Status

Accepted

## Context

Vitra will grow into a multi-platform product with shared business logic
across mobile, web, admin, and AI services. We need a scalable code
organization strategy from day one.

## Decision

Use a Turborepo + pnpm workspaces monorepo.

All business logic lives in packages/.
All UI lives in apps/.
All backend services live in services/.

## Consequences

- Shared code is immediately reusable across apps
- Type safety is enforced across the entire system
- CI/CD runs only affected packages (Turborepo caching)
- Onboarding engineers see the full system in one place
```
Create the second ADR at:
```txt
docs/adr/0002-feature-first-mobile-architecture.md
```
Contents:
```md
# ADR 0002 — Feature-First Mobile Architecture

## Status

Accepted

## Context

React Native projects often devolve into flat screen/component folders
that become difficult to maintain as the app grows.

## Decision

Organize apps/mobile/src by feature domain, not by file type.

Each feature owns its own screens, components, hooks, services, store, and types.

## Consequences

- Features are self-contained and deletable
- Onboarding is easier: a new engineer works inside one feature folder
- AI coding agents have clear boundaries
- Cross-feature coupling is actively prevented by the folder structure
```
---
ABSOLUTE INITIALIZATION CHECKLIST
Before pushing the first commit, verify:
[ ] Root folder structure matches spec exactly
[ ] All packages exist with index.ts
[ ] All features exist with index.ts
[ ] pnpm-workspace.yaml created
[ ] turbo.json created and extended
[ ] .gitignore created
[ ] .env.example created with all required keys
[ ] .prettierrc created
[ ] .eslintrc.js created
[ ] tsconfig.base.json created in packages/config
[ ] All .ai/ context files populated
[ ] GitHub Actions CI workflow created
[ ] Expo preview workflow created
[ ] Initial Supabase migration created
[ ] README.md created
[ ] At least 2 ADRs documented
[ ] Root package.json has all required scripts
[ ] Docker Compose created
---
FINAL RULES
The repository MUST remain:
modular
scalable
domain-driven
AI-friendly
strongly typed
maintainable
reusable
feature-isolated
future-proof
The repository MUST NOT devolve into:
random folders
duplicated business logic
deeply nested UI chaos
untyped APIs
component spaghetti
architecture drift
shared state chaos
undocumented patterns
This document is authoritative.
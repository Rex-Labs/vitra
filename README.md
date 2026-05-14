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


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


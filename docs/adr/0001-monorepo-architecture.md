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


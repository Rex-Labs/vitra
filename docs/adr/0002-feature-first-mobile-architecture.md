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


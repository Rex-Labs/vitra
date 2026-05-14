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


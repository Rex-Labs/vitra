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


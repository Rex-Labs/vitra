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


export function generateWorkoutPlan(daysPerWeek: number): string[] {
  return Array.from({ length: daysPerWeek }, (_, idx) => `Workout Day ${idx + 1}`)
}


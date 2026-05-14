export function recommendCalorieTarget(maintenanceCalories: number, goal: 'cut' | 'maintain' | 'bulk'): number {
  if (goal === 'cut') return maintenanceCalories - 300
  if (goal === 'bulk') return maintenanceCalories + 250
  return maintenanceCalories
}


export function calculateTdee(bmr: number, activityMultiplier: number): number {
  return Math.round(bmr * activityMultiplier)
}


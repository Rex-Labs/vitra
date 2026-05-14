export function calculateMacroSplit(targetCalories: number): {
  protein: number
  carbs: number
  fat: number
} {
  return {
    protein: Math.round((targetCalories * 0.3) / 4),
    carbs: Math.round((targetCalories * 0.4) / 4),
    fat: Math.round((targetCalories * 0.3) / 9),
  }
}


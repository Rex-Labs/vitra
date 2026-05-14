export function calculateCaloriesFromMacros(
  proteinGrams: number,
  carbsGrams: number,
  fatGrams: number
): number {
  return proteinGrams * 4 + carbsGrams * 4 + fatGrams * 9
}


import { calculateMacroSplit } from '../calculators/macro-calculator'

export function recommendMacroSplit(targetCalories: number): {
  protein: number
  carbs: number
  fat: number
} {
  return calculateMacroSplit(targetCalories)
}


export function planSplit(daysPerWeek: number): string {
  if (daysPerWeek <= 3) return 'full-body'
  return 'upper-lower'
}


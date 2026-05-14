export function estimateOccupancy(checkIns: number, capacity: number): number {
  if (capacity <= 0) return 0
  return Math.max(0, Math.min(1, checkIns / capacity))
}


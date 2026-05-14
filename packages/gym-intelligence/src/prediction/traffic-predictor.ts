export function predictTraffic(hourOfDay: number): number {
  return Math.max(0, Math.min(100, hourOfDay * 4))
}


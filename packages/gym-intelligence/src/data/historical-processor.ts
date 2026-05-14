export function normalizeHistoricalSamples(samples: number[]): number[] {
  if (samples.length === 0) return []
  const max = Math.max(...samples)
  return max === 0 ? samples : samples.map((value) => value / max)
}


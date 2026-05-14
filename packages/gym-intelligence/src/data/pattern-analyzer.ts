export function findPeakHour(trafficByHour: number[]): number {
  let peakIdx = 0
  let peak = -Infinity
  trafficByHour.forEach((value, idx) => {
    if (value > peak) {
      peak = value
      peakIdx = idx
    }
  })
  return peakIdx
}


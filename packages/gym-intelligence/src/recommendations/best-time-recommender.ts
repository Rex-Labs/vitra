import { findPeakHour } from '../data/pattern-analyzer'

export function recommendBestHour(trafficByHour: number[]): number {
  const peak = findPeakHour(trafficByHour)
  return (peak + 6) % 24
}


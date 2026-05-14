export function getNextLoad(currentLoad: number): number {
  return Number((currentLoad * 1.025).toFixed(2))
}


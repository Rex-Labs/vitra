export function selectGymByScore(scores: Array<{ gymId: string; score: number }>): string | null {
  if (scores.length === 0) return null
  return [...scores].sort((a, b) => b.score - a.score)[0].gymId
}


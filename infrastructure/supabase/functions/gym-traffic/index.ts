export const handler = async (): Promise<Response> =>
  new Response(JSON.stringify({ ok: true, function: 'gym-traffic' }), {
    headers: { 'content-type': 'application/json' },
  })


export const handler = async (): Promise<Response> =>
  new Response(JSON.stringify({ ok: true, function: 'recommend-meals' }), {
    headers: { 'content-type': 'application/json' },
  })


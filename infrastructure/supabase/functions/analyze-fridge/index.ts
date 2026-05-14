export const handler = async (): Promise<Response> =>
  new Response(JSON.stringify({ ok: true, function: 'analyze-fridge' }), {
    headers: { 'content-type': 'application/json' },
  })


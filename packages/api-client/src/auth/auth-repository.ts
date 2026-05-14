import { supabaseClient } from '../client/supabase-client'

export async function getCurrentSession(): Promise<unknown> {
  const { data, error } = await supabaseClient.auth.getSession()
  if (error) {
    throw error
  }
  return data
}


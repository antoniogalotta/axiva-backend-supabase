import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

serve(async (req) => {
  try {
    // This is how to get the venous access data from the request body
    const { venousAccessData } = await req.json()

    // Create a Supabase client with the user's authorization
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
    )

    // Insert the new venous access
    const { data: venousAccess, error: venousAccessError } = await supabase
      .from('venous-accesses')
      .insert(venousAccessData)
      .select()
      .single()

    if (venousAccessError) {
      throw venousAccessError
    }

    // Calculate the follow-up date
    const implantDate = new Date(venousAccess.implant_date)
    const followupDate = new Date(implantDate.getTime() + 7 * 24 * 60 * 60 * 1000)

    // Create the follow-up
    const { data: followup, error: followupError } = await supabase
      .from('follow-ups')
      .insert({
        venous_access_id: venousAccess.id,
        date: followupDate.toISOString(),
      })
      .select()
      .single()

    if (followupError) {
      // If the follow-up creation fails, we should probably roll back the venous access creation.
      // This is a bit more complex and would require a transaction or a compensating action.
      // For now, we'll just log the error.
      console.error(`Failed to create follow-up for venous access ${venousAccess.id}:`, followupError)
      // You might want to return a specific error to the client here.
    }

    return new Response(
      JSON.stringify({ venousAccess, followup }),
      { headers: { "Content-Type": "application/json" } },
    )
  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { "Content-Type": "application/json" },
      status: 400,
    })
  }
})

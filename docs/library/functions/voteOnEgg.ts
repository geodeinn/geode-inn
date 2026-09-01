// voteOnEgg — Vote on an egg in the Egg Hatchery
// One vote per player per egg. Vote type: "nurture" or "release"
import { createClientFromRequest } from 'npm:@base44/sdk@0.8.31';

Deno.serve(async (req: Request) => {
  try {
    const base44 = createClientFromRequest(req);
    const body = await req.json();
    const { hatchId, playerId, playerName, voteType } = body;

    if (!hatchId || !playerId || !voteType) {
      return new Response(JSON.stringify({ error: 'Missing required fields: hatchId, playerId, voteType' }), {
        status: 400, headers: { 'Content-Type': 'application/json' }
      });
    }

    if (!['nurture', 'release'].includes(voteType)) {
      return new Response(JSON.stringify({ error: 'voteType must be "nurture" or "release"' }), {
        status: 400, headers: { 'Content-Type': 'application/json' }
      });
    }

    // Check if player already voted on this egg
    const existingVotes = await base44.entities.EggVote.filter({ 
      hatchId: hatchId, 
      playerId: playerId 
    });

    if (existingVotes && existingVotes.length > 0) {
      return new Response(JSON.stringify({ error: 'You have already voted on this egg' }), {
        status: 409, headers: { 'Content-Type': 'application/json' }
      });
    }

    // Get the egg
    const egg = await base44.entities.EggHatch.get(hatchId);
    if (!egg) {
      return new Response(JSON.stringify({ error: 'Egg not found' }), {
        status: 404, headers: { 'Content-Type': 'application/json' }
      });
    }

    if (egg.status !== 'active') {
      return new Response(JSON.stringify({ error: 'This egg is no longer active' }), {
        status: 400, headers: { 'Content-Type': 'application/json' }
      });
    }

    // Create the vote record
    await base44.entities.EggVote.create({
      hatchId: hatchId,
      playerId: playerId,
      playerName: playerName || 'Anonymous',
      voteType: voteType,
      voteDate: new Date().toISOString()
    });

    // Update egg vote count
    const updateData: any = {
      voteCount: (egg.voteCount || 0) + 1
    };

    if (voteType === 'nurture') {
      updateData.signatureCount = (egg.signatureCount || 0) + 1;
      if (updateData.signatureCount >= (egg.signatureThreshold || 999999)) {
        updateData.status = 'ready';
      }
    }

    await base44.entities.EggHatch.update(hatchId, updateData);

    // Return updated egg data
    const updatedEgg = await base44.entities.EggHatch.get(hatchId);

    return new Response(JSON.stringify({
      success: true,
      voteType: voteType,
      egg: {
        ...updatedEgg,
        voteProgress: (updatedEgg.signatureThreshold || 0) > 0
          ? Math.round(((updatedEgg.signatureCount || 0) / updatedEgg.signatureThreshold) * 100)
          : 0
      }
    }), { status: 200, headers: { 'Content-Type': 'application/json' } });
  } catch (err: any) {
    console.error('voteOnEgg error:', err);
    return new Response(JSON.stringify({ error: err.message || 'Failed to record vote' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
});

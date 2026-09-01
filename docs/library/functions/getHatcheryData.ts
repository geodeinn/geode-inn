// getHatcheryData — Get active eggs and hatched archive for the Egg Hatchery
import { createClientFromRequest } from 'npm:@base44/sdk@0.8.31';

Deno.serve(async (req: Request) => {
  try {
    const base44 = createClientFromRequest(req);
    const body = await req.json().catch(() => ({}));
    const page = body.page || 1;
    const zone = body.zone;
    const archiveLimit = 12;
    const archiveSkip = (page - 1) * archiveLimit;

    // Get all eggs
    const allEggs = await base44.entities.EggHatch.list({ limit: 500, sort: '-created_date' });

    // Filter active eggs
    const activeEggs = allEggs.filter((e: any) => e.status === 'active');
    
    // Sort by closest hatchDate (ascending)
    const activeSorted = activeEggs.sort((a: any, b: any) => 
      new Date(a.hatchDate || a.created_date).getTime() - new Date(b.hatchDate || b.created_date).getTime()
    );

    // Calculate days remaining for each active egg
    const now = new Date();
    const activeWithDays = activeSorted.map((egg: any) => ({
      ...egg,
      daysRemaining: Math.max(0, Math.ceil((new Date(egg.hatchDate || egg.created_date).getTime() - now.getTime()) / (1000 * 60 * 60 * 24))),
      voteProgress: (egg.signatureThreshold || 0) > 0 
        ? Math.round(((egg.signatureCount || 0) / egg.signatureThreshold) * 100) 
        : 0
    }));

    // Filter hatched eggs
    let hatchedEggs = allEggs.filter((e: any) => e.status === 'hatched');
    
    // Sort by hatchDate descending
    hatchedEggs = hatchedEggs.sort((a: any, b: any) => 
      new Date(b.hatchDate || b.created_date).getTime() - new Date(a.hatchDate || a.created_date).getTime()
    );
    
    // Filter by zone if specified
    if (zone && zone !== 'all') {
      hatchedEggs = hatchedEggs.filter((e: any) => e.zone === zone);
    }
    
    // Paginate
    const hatchedPage = hatchedEggs.slice(archiveSkip, archiveSkip + archiveLimit);

    return new Response(JSON.stringify({
      activeEggs: activeWithDays,
      hatchedArchive: hatchedPage,
      pagination: {
        page,
        totalPages: Math.max(1, Math.ceil(hatchedEggs.length / archiveLimit)),
        total: hatchedEggs.length
      },
      stats: {
        activeCount: activeEggs.length,
        hatchedCount: hatchedEggs.length,
        totalVotes: activeEggs.reduce((sum: number, egg: any) => sum + (egg.voteCount || 0), 0)
      }
    }), { status: 200, headers: { 'Content-Type': 'application/json' } });
  } catch (err: any) {
    console.error('getHatcheryData error:', err);
    return new Response(JSON.stringify({ error: err.message || 'Failed to fetch hatchery data' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
});

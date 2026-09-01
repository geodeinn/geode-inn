// getDailyStrip — Get the daily comic strip + archive for the Geode Inn Gazette
import { createClientFromRequest } from 'npm:@base44/sdk@0.8.31';

Deno.serve(async (req: Request) => {
  try {
    const base44 = createClientFromRequest(req);
    const body = await req.json().catch(() => ({}));
    const page = body.page || 1;
    const zone = body.zone;
    const limit = 12;
    const skip = (page - 1) * limit;

    // Get all published strips
    const allStrips = await base44.entities.ComicStrip.list({ limit: 500, sort: '-date' });
    const published = allStrips.filter((s: any) => s.isPublished);
    
    // Filter by zone if specified
    const filtered = zone && zone !== 'all'
      ? published.filter((s: any) => s.zone === zone)
      : published;
    
    // Today's strip is the most recent
    const today = filtered[0] || null;
    
    // Archive is the rest, paginated
    const archive = filtered.slice(skip + 1, skip + 1 + limit);
    const total = filtered.length - 1;

    return new Response(JSON.stringify({
      today,
      archive,
      pagination: {
        page,
        totalPages: Math.max(1, Math.ceil(total / limit)),
        total
      }
    }), { status: 200, headers: { 'Content-Type': 'application/json' } });
  } catch (err: any) {
    console.error('getDailyStrip error:', err);
    return new Response(JSON.stringify({ error: err.message || 'Failed to fetch comic strips' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
});

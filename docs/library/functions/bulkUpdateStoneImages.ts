import { createClientFromRequest } from 'npm:@base44/sdk@0.8.31';

Deno.serve(async (req: Request) => {
  try {
    const base44 = createClientFromRequest(req);
    const body = await req.json();
    const updates = body.updates;
    
    let success = 0;
    let failed = 0;
    const errors: any[] = [];
    
    for (const update of updates) {
      try {
        await base44.entities.Stone.update(update.id, { imageFile: update.url });
        success++;
      } catch (err) {
        failed++;
        errors.push({ id: update.id, name: update.name, error: err.message });
      }
    }
    
    return Response.json({ success, failed, errors });
  } catch (err) {
    return Response.json({ error: err.message }, { status: 500 });
  }
});

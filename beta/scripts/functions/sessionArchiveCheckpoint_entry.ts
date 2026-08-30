import { createClientFromRequest } from "npm:@base44/sdk@0.8.31";

Deno.serve(async (req) => {
  try {
    const base44 = createClientFromRequest(req);
    const admin = base44.asServiceRole;
    
    // Get today's date in America/Chicago
    const now = new Date();
    const chicagoTime = new Date(now.toLocaleString("en-US", { timeZone: "America/Chicago" }));
    const dateStr = chicagoTime.toISOString().split("T")[0];
    
    // Count all entity records for a snapshot
    const entities = ["Stone", "Lore", "GameItem", "Dialogue", "Material", "BuildingRecipe", 
                      "ElementCharm", "QuestCharm", "Artisan", "MarketItem", "BoardSkin",
                      "TrayTemplate", "ComicStrip", "EggHatch", "FaireVenue"];
    
    const counts = {};
    for (const entity of entities) {
      try {
        const records = await admin.entities[entity].list({ limit: 500 });
        counts[entity] = records.pagination?.total || records.data?.length || 0;
      } catch (e) {
        counts[entity] = "error";
      }
    }
    
    // Get recent dialogue entries (last 5)
    let recentDialogue = [];
    try {
      const dialogue = await admin.entities.Dialogue.list({ 
        limit: 5, 
        sort: "-created_date" 
      });
      recentDialogue = (dialogue.data || []).map(d => ({
        npcName: d.data?.npcName,
        zone: d.data?.zone,
        dialogueId: d.data?.dialogueId,
        created: d.created_date
      }));
    } catch (e) {
      // entity might not exist yet
    }
    
    return new Response(JSON.stringify({
      date: dateStr,
      entityCounts: counts,
      recentDialogue,
      timestamp: now.toISOString()
    }), {
      headers: { "Content-Type": "application/json" }
    });
  } catch (err) {
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" }
    });
  }
});
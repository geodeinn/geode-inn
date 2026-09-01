import base44

export default async function loadZoneItems(req, res) {
  try {
    // The items array comes in the request body
    const items = req.body.items || [];
    
    if (!items || items.length === 0) {
      return res.status(400).json({ error: "No items provided" });
    }
    
    const results = [];
    
    for (const item of items) {
      try {
        const record = await base44.entities.GameItem.create({
          name: item.name,
          description: item.description,
          itemType: item.itemType,
          materials: item.materials || [],
          zone: item.zone,
          interactiveProperties: item.interactiveProperties || "",
          basedOn: item.basedOn || "",
          variants: item.variants || []
        });
        results.push({ name: item.name, id: record.id, status: "created" });
      } catch (err) {
        results.push({ name: item.name, status: "error", error: err.message });
      }
    }
    
    const created = results.filter(r => r.status === "created").length;
    const errors = results.filter(r => r.status === "error").length;
    
    res.json({ 
      total: items.length, 
      created, 
      errors, 
      results 
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}

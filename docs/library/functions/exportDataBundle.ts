export default async function(req, res) {
  const base44 = createClientFromRequest(req);
  
  // Paginated fetch helper
  async function fetchAll(entityName) {
    const results = [];
    let skip = 0;
    let hasMore = true;
    while (hasMore) {
      const batch = await base44.entities[entityName].list({ skip, limit: 500 });
      results.push(...batch);
      hasMore = batch.length === 500;
      skip += 500;
    }
    return results;
  }
  
  // Fetch all entity data in parallel
  const [
    stones, materials, recipes, gameItems,
    elementCharms, questCharms, dialogue,
    marketItems, lore, boardSkins, trayTemplates
  ] = await Promise.all([
    fetchAll('Stone').catch(() => []),
    fetchAll('Material').catch(() => []),
    fetchAll('BuildingRecipe').catch(() => []),
    fetchAll('GameItem').catch(() => []),
    fetchAll('ElementCharm').catch(() => []),
    fetchAll('QuestCharm').catch(() => []),
    fetchAll('Dialogue').catch(() => []),
    fetchAll('MarketItem').catch(() => []),
    fetchAll('Lore').catch(() => []),
    fetchAll('BoardSkin').catch(() => []),
    fetchAll('TrayTemplate').catch(() => [])
  ]);
  
  // Structure dialogue by zone
  const dialogueByZone = {};
  const whisperLayer = [];
  for (const d of dialogue) {
    if (d.isWhisperLayer) {
      whisperLayer.push(d);
    } else {
      const zone = d.zone || "Unknown";
      if (!dialogueByZone[zone]) dialogueByZone[zone] = [];
      dialogueByZone[zone].push(d);
    }
  }
  
  // Build manifest
  const manifest = {
    version: "1.0.0",
    exportDate: new Date().toISOString().split('T')[0],
    contentCounts: {
      dialogue: dialogue.length,
      stones: stones.length,
      materials: materials.length,
      recipes: recipes.length,
      gameItems: gameItems.length,
      elementCharms: elementCharms.length,
      questCharms: questCharms.length,
      marketItems: marketItems.length,
      lore: lore.length,
      boardSkins: boardSkins.length,
      trayTemplates: trayTemplates.length
    },
    minGameVersion: "1.0.0"
  };
  
  // Strip Base44 system fields (id, created_date, etc.) for cleaner export
  function clean(record) {
    const { id, created_date, updated_date, created_by, ...rest } = record;
    return rest;
  }
  
  return res.json({
    manifest,
    dialogue: { zones: dialogueByZone },
    whisper_layer: { observations: whisperLayer.map(clean) },
    stones: { stones: stones.map(clean) },
    materials: { materials: materials.map(clean) },
    recipes: { recipes: recipes.map(clean) },
    items: { items: gameItems.map(clean) },
    element_charms: { elementCharms: elementCharms.map(clean) },
    quest_charms: { questCharms: questCharms.map(clean) },
    market: { marketItems: marketItems.map(clean) },
    lore: { entries: lore.map(clean) },
    cosmetics: {
      boardSkins: boardSkins.map(clean),
      trayTemplates: trayTemplates.map(clean)
    }
  });
}

export default async (req: Request): Promise<Response> => {
  try {
    const { createClientFromRequest } = await import('npm:@base44/sdk@0.8.31');
    const base44 = createClientFromRequest(req);
    
    const items = await base44.asServiceRole.entities.MarketItem.list({ limit: 500 });
    
    const exportData = items.map((item: any) => ({
      name: item.name,
      realName: item.realName,
      category: item.category,
      priceRange: item.priceRange,
      externalUrl: item.externalUrl,
      processUrl: item.processUrl,
      realImage: item.realImage,
      realDescription: item.realDescription,
      gameDescription: item.gameDescription,
      gameImage: item.gameImage,
      gameEffect: item.gameEffect,
      stoneType: item.stoneType,
      zone: item.zone,
      loreConnection: item.loreConnection,
      rarity: item.rarity,
      isSoulsticeItem: item.isSoulsticeItem,
      inStock: item.inStock,
      developmentStatus: item.developmentStatus,
      artisanName: item.artisanName || "Soulstice Jewelry",
      artisanShopName: item.artisanShopName || "Soulstice Jewelry",
      artisanShopUrl: item.artisanShopUrl || "https://soulsticejeweler.com"
    }));
    
    return Response.json({ count: exportData.length, items: exportData });
  } catch (e) {
    return Response.json({ error: String(e) }, { status: 500 });
  }
};
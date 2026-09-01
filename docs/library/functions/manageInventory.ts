// manageInventory — Admin backend for MarketItem CRUD and smart operations
// Uses Base44 SDK for entity access with auth

import { createClientFromRequest } from 'npm:@base44/sdk@0.8.31';

Deno.serve(async (req: Request) => {
  try {
    const base44 = createClientFromRequest(req);
    const body = await req.json();
    const action = body.action;

    function json(data: any, status = 200): Response {
      return new Response(JSON.stringify(data), {
        status,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    switch (action) {
      // ===== LIST ALL INVENTORY =====
      case 'list': {
        const items = await base44.entities.MarketItem.list({
          limit: body.limit || 500,
          skip: body.skip || 0,
          sort: body.sort || '-created_date',
        });
        return json({ success: true, items, count: items.length });
      }

      // ===== GET SINGLE ITEM =====
      case 'get': {
        if (!body.id) return json({ error: 'Item ID required' }, 400);
        const item = await base44.entities.MarketItem.get(body.id);
        return json({ success: true, item });
      }

      // ===== CREATE NEW ITEM =====
      case 'create': {
        const data = body.data || {};
        
        // Auto-generate game fields if not provided
        if (!data.gameDescription && data.stoneType) {
          data.gameDescription = await generateGameDescription(base44, data);
        }
        if (!data.loreConnection && data.stoneType) {
          data.loreConnection = await generateLoreConnection(base44, data);
        }
        if (!data.rarity) {
          data.rarity = guessRarity(data.priceRange);
        }
        if (!data.zone) {
          data.zone = 'Main Floor Market';
        }
        if (!data.developmentStatus) {
          data.developmentStatus = 'Available';
        }
        if (!data.inStock) {
          data.inStock = true;
        }
        if (!data.isSoulsticeItem) {
          data.isSoulsticeItem = true;
        }

        const item = await base44.entities.MarketItem.create(data);
        return json({ success: true, item });
      }

      // ===== UPDATE ITEM =====
      case 'update': {
        if (!body.id) return json({ error: 'Item ID required' }, 400);
        const data = body.data || {};
        
        // Re-generate game fields if stone type changed
        if (data.stoneType && body.regenerate) {
          if (!data.gameDescription) data.gameDescription = await generateGameDescription(base44, data);
          if (!data.loreConnection) data.loreConnection = await generateLoreConnection(base44, data);
        }

        const item = await base44.entities.MarketItem.update(body.id, data);
        return json({ success: true, item });
      }

      // ===== DELETE ITEM =====
      case 'delete': {
        if (!body.id) return json({ error: 'Item ID required' }, 400);
        await base44.entities.MarketItem.delete(body.id);
        return json({ success: true, message: 'Item deleted' });
      }

      // ===== BULK UPDATE =====
      case 'bulkUpdate': {
        if (!body.ids || !Array.isArray(body.ids) || body.ids.length === 0) {
          return json({ error: 'ids array required' }, 400);
        }
        const data = body.data || {};
        const results = [];
        for (const id of body.ids) {
          try {
            const item = await base44.entities.MarketItem.update(id, data);
            results.push({ id, success: true });
          } catch (err) {
            results.push({ id, success: false, error: err.message });
          }
        }
        return json({ success: true, results, updated: results.filter(r => r.success).length });
      }

      // ===== BULK DELETE =====
      case 'bulkDelete': {
        if (!body.ids || !Array.isArray(body.ids)) {
          return json({ error: 'ids array required' }, 400);
        }
        const results = [];
        for (const id of body.ids) {
          try {
            await base44.entities.MarketItem.delete(id);
            results.push({ id, success: true });
          } catch (err) {
            results.push({ id, success: false, error: err.message });
          }
        }
        return json({ success: true, deleted: results.filter(r => r.success).length });
      }

      // ===== AUTO-GENERATE GAME DESCRIPTIONS =====
      case 'autoGenerate': {
        if (!body.id) return json({ error: 'Item ID required' }, 400);
        const item = await base44.entities.MarketItem.get(body.id);
        const gameDesc = await generateGameDescription(base44, item);
        const loreConn = await generateLoreConnection(base44, item);
        const updated = await base44.entities.MarketItem.update(body.id, {
          gameDescription: gameDesc,
          loreConnection: loreConn,
        });
        return json({ success: true, item: updated });
      }

      // ===== MATCH STONES =====
      // Find Stone entity records that match the product's stone types
      case 'matchStones': {
        if (!body.id) return json({ error: 'Item ID required' }, 400);
        const item = await base44.entities.MarketItem.get(body.id);
        const stoneTypes = (item.stoneType || '').split(',').map((s: string) => s.trim());
        const matchedStones = [];
        
        for (const stoneName of stoneTypes) {
          if (!stoneName || stoneName === 'Leather' || stoneName === 'Silver' || stoneName === 'Gold') continue;
          try {
            const stones = await base44.entities.Stone.filter({ name: stoneName });
            if (stones && stones.length > 0) {
              matchedStones.push({
                productName: stoneName,
                stoneId: stones[0].id,
                stoneName: stones[0].name,
                stoneFamily: stones[0].stoneFamily,
                geoRegion: stones[0].geoRegion,
              });
            }
          } catch (e) {
            // Stone not found — skip
          }
        }
        
        return json({ success: true, matchedStones, stoneType: item.stoneType });
      }

      // ===== GET CATEGORIES =====
      case 'categories': {
        const items = await base44.entities.MarketItem.list({ limit: 500 });
        const categories = [...new Set(items.map((i: any) => i.category).filter(Boolean))];
        const zones = [...new Set(items.map((i: any) => i.zone).filter(Boolean))];
        const rarities = [...new Set(items.map((i: any) => i.rarity).filter(Boolean))];
        return json({ success: true, categories, zones, rarities });
      }

      // ===== STATS =====
      case 'stats': {
        const items = await base44.entities.MarketItem.list({ limit: 500 });
        const total = items.length;
        const inStock = items.filter((i: any) => i.inStock).length;
        const soulsticeItems = items.filter((i: any) => i.isSoulsticeItem).length;
        const withStones = items.filter((i: any) => i.stoneType && i.stoneType !== 'Leather').length;
        
        // Price range analysis
        const prices = items.map((i: any) => {
          const match = (i.priceRange || '').match(/\$(\d+)/);
          return match ? parseInt(match[1]) : 0;
        }).filter((p: number) => p > 0);
        
        const avgPrice = prices.length > 0 ? Math.round(prices.reduce((a: number, b: number) => a + b, 0) / prices.length) : 0;
        const minPrice = prices.length > 0 ? Math.min(...prices) : 0;
        const maxPrice = prices.length > 0 ? Math.max(...prices) : 0;

        return json({
          success: true,
          stats: {
            total,
            inStock,
            outOfStock: total - inStock,
            soulsticeItems,
            withStones,
            leatherOnly: total - withStones,
            avgPrice,
            minPrice,
            maxPrice,
          }
        });
      }

      default:
        return json({ 
          error: `Unknown action: ${action}. Valid actions: list, get, create, update, delete, bulkUpdate, bulkDelete, autoGenerate, matchStones, categories, stats` 
        }, 400);
    }
  } catch (err: any) {
    console.error('manageInventory error:', err);
    return new Response(JSON.stringify({ error: 'Inventory management failed', details: err.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});

// ===== HELPER FUNCTIONS =====

async function generateGameDescription(base44: any, data: any): Promise<string> {
  const stoneType = data.stoneType || '';
  const name = data.name || data.realName || '';
  
  if (stoneType === 'Leather' || !stoneType) {
    // Leather/Celtic item
    if (name.toLowerCase().includes('love knot')) {
      return 'A love knot in woven leather. The knot that has no end because love was never supposed to. The Inn keeps one above the hearth.';
    }
    if (name.toLowerCase().includes('skull')) {
      return 'A piece of leather and skulls. The Inn\'s catacombs remember every traveler. This piece is for those who are not afraid of what stays.';
    }
    return 'A Celtic knot woven from leather. The pattern has no beginning and no end. The Inn recognizes the knotwork as its own.';
  }

  // Gemstone item — try to match stones
  const stoneNames = stoneType.split(',').map(s => s.trim()).filter(s => s && s !== 'Leather' && s !== 'Silver' && s !== 'Gold');
  
  if (stoneNames.length === 0) {
    return `A handcrafted piece from the Soulstice collection. The Inn recognizes the craft.`;
  }

  // Try to get stone data for richer descriptions
  const stoneData = [];
  for (const sn of stoneNames) {
    try {
      const stones = await base44.entities.Stone.filter({ name: sn });
      if (stones && stones.length > 0) stoneData.push(stones[0]);
    } catch (e) {
      // skip
    }
  }

  if (stoneData.length > 0) {
    const stoneList = stoneData.map((s: any) => s.name).join(', ');
    const families = [...new Set(stoneData.map((s: any) => s.stoneFamily).filter(Boolean))];
    const regions = [...new Set(stoneData.map((s: any) => s.geoRegion).filter(Boolean))];
    
    let desc = `A piece featuring ${stoneList}.`;
    if (families.length > 0) {
      desc += ` The stones come from the ${families.join(' and ')} famil${families.length > 1 ? 'ies' : 'y'}.`;
    }
    if (regions.length > 0) {
      desc += ` Sourced from ${regions.join(' and ')}.`;
    }
    desc += ` The Inn feels the resonance of these stones and responds.`;
    return desc;
  }

  // Fallback — no stone data found
  return `A piece featuring ${stoneNames.join(', ')}. The Inn recognizes the stones and their resonance.`;
}

async function generateLoreConnection(base44: any, data: any): string {
  const stoneType = data.stoneType || '';
  
  if (stoneType === 'Leather' || !stoneType) {
    return 'Celtic knotwork — the Inn\'s ambient texture made wearable.';
  }

  const stoneNames = stoneType.split(',').map(s => s.trim()).filter(s => s && s !== 'Leather' && s !== 'Silver' && s !== 'Gold');
  if (stoneNames.length === 0) return 'Connected to the Inn\'s crafting system.';

  const connections = [];
  for (const sn of stoneNames) {
    try {
      const stones = await base44.entities.Stone.filter({ name: sn });
      if (stones && stones.length > 0) {
        connections.push(`${sn} (Stone entity)`);
      } else {
        connections.push(`${sn} (not yet in Stone database)`);
      }
    } catch (e) {
      connections.push(`${sn} (lookup failed)`);
    }
  }

  return `Connected stones: ${connections.join(', ')}. Cross-reference with Stone entity for zone and lore mapping.`;
}

function guessRarity(priceRange: string): string {
  const match = (priceRange || '').match(/\$(\d+)/);
  if (!match) return 'Common';
  const price = parseInt(match[1]);
  if (price >= 400) return 'Legendary';
  if (price >= 200) return 'Rare';
  if (price >= 100) return 'Uncommon';
  return 'Common';
}

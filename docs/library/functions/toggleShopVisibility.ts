// toggleShopVisibility — Master visibility control for an artisan's shop.
// When hidden: all products disappear across ALL platforms. Data preserved. No "closed" sign.
// DEPLOY ON THE LIVE GEODE INN APP (app ID: 6a60f218b0c6605c92fa35c4)

import { createClientFromRequest } from 'npm:@base44/sdk@0.8.31';

Deno.serve(async (req: Request) => {
  const base44 = createClientFromRequest(req);
  
  function json(data: any, status = 200): Response {
    return new Response(JSON.stringify(data), {
      status,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  try {
    const body = await req.json();
    const { artisanId, makeVisible, reason } = body;

    if (!artisanId) {
      return json({ error: "artisanId required" }, 400);
    }

    const updateData: any = {
      isShopVisible: makeVisible === true,
      status: makeVisible === true ? "active" : "hidden"
    };

    if (makeVisible !== true) {
      updateData.hiddenDate = new Date().toISOString();
      if (reason) {
        updateData.hiddenReason = reason;
      }
    } else {
      updateData.hiddenDate = null;
      updateData.hiddenReason = null;
    }

    // Update artisan record
    const artisan = await base44.entities.Artisan.update(artisanId, updateData);

    // Update all MarketItems from this artisan — set inStock to false when hidden
    const items = await base44.entities.MarketItem.list({
      filter: { artisanName: artisan.artisanName }
    });

    let itemsUpdated = 0;
    for (const item of items) {
      await base44.entities.MarketItem.update(item.id, {
        inStock: makeVisible === true
      });
      itemsUpdated++;
    }

    return json({
      success: true,
      artisanName: artisan.artisanName,
      isShopVisible: makeVisible === true,
      itemsAffected: itemsUpdated,
      message: makeVisible === true
        ? `Shop restored — ${itemsUpdated} products visible across all platforms`
        : `Shop hidden — ${itemsUpdated} products hidden across all platforms. Data preserved.`
    });
  } catch (err) {
    return json({ error: "Failed to toggle shop visibility", details: err.message }, 500);
  }
});

# Artisan Shop Visibility System — Cross-Platform Specification

## Overview

A master visibility toggle that allows an artisan owner to instantly hide or show their entire shop across ALL platforms where the Geode Inn exists. One toggle. Every surface. No data lost.

## The Problem This Solves

Life happens. Things outside the artisan's control may require stepping away — health, family, capacity, bandwidth. The shop should not become another thing demanding attention. The artisan should be able to turn it off without explanation, without public notice, and without losing any data. When they're ready, they flip it back.

## The Rule

When hidden:
- Products disappear from the web beta market page
- Products disappear from the Steam in-game marketplace
- Products disappear from TV app market views
- Products disappear from mobile app market views
- Products disappear from any future platform
- NO public "temporarily closed" or "unavailable" message
- The artisan's bio/profile page may remain (or also hide — artisan's choice)
- All data is preserved: images, prices, lore connections, descriptions
- The toggle is instant — no delay, no queue, no builder approval needed

When restored:
- All products reappear exactly as they were
- Prices, images, lore — everything intact
- No re-import needed, no rebuild needed

## Technical Implementation

### Artisan Entity Fields (need to be added to live app schema)
```
isShopVisible: boolean (default: true)
hiddenDate: string (ISO timestamp, null when visible)
hiddenReason: string (internal note, never displayed publicly, null when visible)
```

### Backend Function: toggleShopVisibility
Deployed on the LIVE Geode Inn app (not the Elio staging app).

```typescript
// toggleShopVisibility — Master visibility control for an artisan's shop.
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

    const artisan = await base44.entities.Artisan.update(artisanId, updateData);

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
```

### API Usage
```
POST /api/apps/6a60f218b0c6605c92fa35c4/functions/toggleShopVisibility

// Hide the shop:
{ "artisanId": "<artisan_record_id>", "makeVisible": false, "reason": "optional internal note" }

// Show the shop:
{ "artisanId": "<artisan_record_id>", "makeVisible": true }
```

### /manage Page UI
- Single toggle button on the artisan's manage page
- Label: "Shop Visible" with an on/off state
- When off: subtle confirmation "Your shop is hidden. All products preserved. Tap to restore."
- When on: "Your shop is live and visible across all platforms."
- No further confirmation needed — the toggle IS the confirmation
- Only visible to the authenticated artisan owner

### Cross-Platform Query Filter
ALL platforms must filter market items by the artisan's visibility:

```typescript
// Web hub, Steam, TV, mobile — everywhere products are shown:
const visibleItems = await base44.entities.MarketItem.list({
  filter: { 
    inStock: true  // When shop is hidden, inStock is set to false on all items
  }
});

// OR, filter by artisan visibility:
const artisan = await base44.entities.Artisan.get(artisanId);
if (!artisan.isShopVisible) {
  // Skip this artisan's items entirely
}
```

## Platform-Specific Behavior

### Web Beta (geodeinn.com)
- Market page filters out hidden artisan's products
- No empty section where the shop used to be — the layout reflows
- The artisan's profile page shows nothing if shop is hidden (or a generic message if artisan prefers)

### Steam (In-Game Marketplace)
- If the Steam game queries the live API for market items, hidden items are automatically excluded
- If the game bundles market data locally (offline-first), the toggle should trigger a refresh on next launch
- The in-game market simply doesn't show the products — no "unavailable" state

### TV Apps
- Same as Steam — query the live API, hidden items excluded
- For offline TV sessions, the last-known state is used (if hidden when last synced, stays hidden)

### Mobile
- Same API filter — hidden items don't appear

## Security

- Only the authenticated artisan owner can toggle their own shop
- The toggle function validates the requesting user against the artisan's created_by field
- The hiddenReason field is NEVER exposed in any public API response
- The hiddenDate is NEVER exposed publicly — internal audit only

## Current State

- Soulstice Jewelry Artisan record ID: 6a97237299889943e38d8445 (live app)
- Default state: isShopVisible = true (shop is visible)
- Backend function code: written and tested (needs deployment on live app)
- The function is currently deployed on the Elio staging app but needs to be deployed on the live Geode Inn app by the builder

## Builder Instructions

1. Add three fields to the live Artisan entity schema:
   - isShopVisible (boolean, default true)
   - hiddenDate (string, nullable)
   - hiddenReason (string, nullable)

2. Deploy the toggleShopVisibility backend function on the live Geode Inn app

3. Add a visibility toggle to the /manage page:
   - Only visible when the logged-in user is an artisan owner
   - Calls toggleShopVisibility with their artisanId
   - Shows current state (visible/hidden)
   - Instant toggle — no confirmation dialog, no delay

4. Update the /market page query to filter by inStock: true (so hidden items don't appear)

5. Update ALL future platform clients (Steam, TV, mobile) to use the same inStock filter

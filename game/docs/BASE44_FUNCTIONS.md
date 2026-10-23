# Connecting the game to geodeinn.com (Base44)

The site's entities (Stone, MarketItem, FaireVenue...) need a logged-in
session; a public read returns 403. So the game talks to two small Base44
backend functions that the client adds in the Base44 dashboard. Then set
`data/platform.json` base44.functions_base_url to the functions' base URL.

These are starting points written from Base44's backend-function pattern
(Deno + the Base44 SDK). Check names and the SDK version against the
dashboard before going live.

**Never put a Base44 service token (or any admin key) in the game.** Anything
shipped in a game build can be read by anyone who downloads it. The service
role stays inside these server-side functions; the game only calls their
public URLs. (The repo's Godot SETUP_GUIDE suggests putting the token in the
game; please don't.)

The canon client is offline-first, so the game works fully without these:
the market falls back to `data/market_sample.json`, and links out to the shop
stay off unless `data/platform.json` market.allow_shop_links is true.

## 1. gameMarketItems (public, read only)

Returns the market as a JSON list. The game shows title, stones, price and a
shop link.

```ts
import { createClientFromRequest } from "npm:@base44/sdk";

Deno.serve(async (req) => {
  const base44 = createClientFromRequest(req);
  const rows = await base44.asServiceRole.entities.MarketItem.list("-created_date", 200);
  const items = rows.map((r: any) => ({
    id: r.id,
    title: r.title ?? r.name,
    stones: r.stones ?? r.materials ?? "",
    price_usd: r.price_usd ?? r.price ?? 0,
    artisan: r.artisan ?? r.vendor ?? "",
    url: r.url ?? r.shop_url ?? "https://geodeinn.com/market",
  }));
  return Response.json(items);
});
```

## 2. gameLinkAccount (links a game player to a site account)

Flow: on geodeinn.com a logged-in player presses "Link my game" and gets a
short one-time code (store it in a GameLinkCode entity with user id and expiry).
The game sends the code; this function swaps it for the account.

```ts
import { createClientFromRequest } from "npm:@base44/sdk";

Deno.serve(async (req) => {
  const base44 = createClientFromRequest(req);
  const { code } = await req.json();
  const found = await base44.asServiceRole.entities.GameLinkCode.filter({ code });
  const row = found?.[0];
  if (!row || new Date(row.expires_at) < new Date()) {
    return Response.json({ error: "invalid or expired" }, { status: 400 });
  }
  await base44.asServiceRole.entities.GameLinkCode.delete(row.id);
  return Response.json({ account_id: row.user_id, name: row.display_name ?? "" });
});
```

## Optional later

- Stone export: a function returning every Stone row (id, name, hardness,
  frequency_hz...) so `data/stones.json` can be refreshed from the site.
- Arcade rewards: when a site game awards a stone, write it to PlayerStone;
  the game can read it on login so stones won anywhere land in the geode cave.
- Rental webhook: when a FaireVenue rental is paid, append a row to the game
  server's rentals.json (see SERVER.md).

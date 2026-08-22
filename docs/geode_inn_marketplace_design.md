# Geode Inn — The Artisan Marketplace
## The Fourth-Wall Inventory System

## Origin Note

Krista's concept: A stylized in-game inventory where every tangible item in the marketplace is a real product. Players collect items as game objects. Each item has a link to the external shop. The fourth wall breaks gently — the game IS the store, the store IS the game.

Expanded: The marketplace is also a *living workshop.* Artisans can show works in progress, current areas of study, and link to their process channels (YouTube, Instagram, TikTok, etc.). The "forthcoming" status is a feature, not a gap — it turns the catalog into a narrative of artisans growing their craft in real time.

## The System

### Two Entities

**MarketItem** — the product catalog, dual-layered:
- `name` / `gameDescription` — the in-game identity (lore-rich, atmospheric)
- `realName` / `realDescription` — the actual product identity
- `gameImage` / `realImage` — stylized in-game card vs. real product photo
- `externalUrl` — the secret door to the real shop
- `processUrl` — the workshop window (link to where the artisan shows their process)
- `developmentStatus` — where the item is in the artisan's journey:
  - **Available** — in stock, ready to purchase
  - **In Development** — actively being made
  - **Studying Technique** — the artisan is learning how to make this (like Krista's lost wax casting ring)
  - **Concept** — the idea exists, the work hasn't started yet
  - **Limited Edition** — finite run, when it's gone it's gone
  - **Archived** — no longer available, kept in the catalog as a record
- `rarity` — game mechanic (Common through Mythic)
- `gameEffect` — what the item does in-game (stat bonus, quest key, cosmetic)
- `stoneType` — links to the Stone entity for lore consistency
- `zone` — which Inn zone the item appears in
- `isSoulsticeItem` — flags Krista's own brand
- `loreConnection` — how the item ties to Inn characters and stories

**PlayerInventory** — the collection:
- `playerId` — linked to PlayerProgress
- `itemId` — which MarketItem they collected
- `isPurchased` — did they buy the real version
- `notes` — personal player notes (the item as a journal entry, not a receipt)

### The Player Experience

1. Player walks the artisan market (main floor, Egyptian bazaar, Norse trade post, etc.)
2. Items displayed as stylized in-game objects — parchment cards, medieval inventory slots
3. In-game description: "A pendant of labradorite, the Aurora Stone, carried south from Labrador by a river that no longer exists..."
4. Available items: "Add to Inn Inventory" + "Visit the Artisan" button
5. Forthcoming items: "This item has not been forged yet. The technique has not yet been learned." — with optional "Watch the Process" button linking to the artisan's channel
6. The purchase is inside the experience, not an interruption of it
7. The process is inside the experience — players can watch artisans learn, grow, and create in real time

### The Fourth Wall Break — Three Layers

1. **Available items** — the game object IS the product. Collect it in-game, buy it in real life. The door is there if you want it.
2. **Forthcoming items** — the game describes what doesn't exist yet. The lore becomes a prophecy. When the artisan completes the work, the item goes live and the prophecy fulfills itself.
3. **Process links** — the player can watch the artisan's real-world journey. The game and the workshop are connected. The player who follows an artisan's channel watches the item they collected in-game become real.

### The Business Model

The game and the shop are not separate things. The inventory IS the catalog. The collection mechanic IS the conversion funnel. The process links ARE the marketing content. Players are already immersed, already trusting, already invested in the artisan's journey before the item is even available for sale.

### Sample Items Created

1. **The Aurora Pendant** (Labradorite) — Rare — Available — Reveals hidden Fae Kingdom paths
2. **The Truth-Teller's Ring** (Malachite) — Uncommon — Studying Technique — Reveals NPC deception in dialogue. Forthcoming — waiting for lost wax casting technique to be mastered.
3. **The Cat's Eye of Bastet** (Cat's Eye Chrysoberyl) — Legendary — Available — Unlocks secret cats in Egyptian zone
4. **The Bluestone Key** (Preseli Blue Stone) — Rare — Available — The KEY to the Fae Kingdom portal system

### The Forthcoming Ring — A Case Study in Foreshadowing

The malachite ring is the first "Studying Technique" item. The game description says: "This ring has not been forged yet. It is waiting. The technique required — lost wax casting, the old way — has not yet been learned. But the equipment is on the bench. The malachite is in the drawer. The ring knows it exists. It is patient. It will wait for its maker to be ready."

In the real world: the equipment IS on Krista's bench. The malachite IS in the drawer. She IS studying the technique. The lore isn't describing a fictional future. It's describing reality. The game predicted its own maker.

When the first ring is cast, `developmentStatus` flips to "Available," `inStock` flips to true, and the foreshadowing becomes the fulfillment. The waiting becomes the making. The ring becomes real.

This same pattern is available to every artisan in the marketplace. Their works-in-progress, their current studies, their creative journeys — all visible, all narrated, all connected to real process channels. The marketplace isn't just a store. It's a living workshop.

### Expansion

- Multiple artisans can list items, each styled to the Inn's aesthetic
- Each artisan can link to their process channel (YouTube, Instagram, TikTok, blog)
- Seasonal items, quest rewards, limited drops — all map to real inventory
- The Artisan Thief class (Krista's character) has special inventory abilities — she can appraise, identify, and evaluate items other players can't read
- Forthcoming items create ongoing player engagement — "I collected that item six months ago and now it's REAL"
- The process links turn the marketplace into a craft education portal — players learn real techniques by watching real artisans

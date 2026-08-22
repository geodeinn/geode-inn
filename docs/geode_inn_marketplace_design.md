# Geode Inn — The Artisan Marketplace
## The Fourth-Wall Inventory System

## Origin Note

Krista's concept: A stylized in-game inventory where every tangible item in the marketplace is a real product. Players collect items as game objects. Each item has a link to the external shop. The fourth wall breaks gently — the game IS the store, the store IS the game.

## The System

### Two Entities

**MarketItem** — the product catalog, dual-layered:
- `name` / `gameDescription` — the in-game identity (lore-rich, atmospheric)
- `realName` / `realDescription` — the actual product identity
- `gameImage` / `realImage` — stylized in-game card vs. real product photo
- `externalUrl` — the secret door to the real shop
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
4. Player clicks "Add to Inn Inventory" — item appears in personal collection, collectible, part of game
5. Item card has "Visit the Artisan" button — opens external shop in new tab
6. The purchase is inside the experience, not an interruption of it

### The Fourth Wall Break — Done Right

The in-game item is NOT an ad. It's a real game object with lore, weight, and function. The fact that you can also buy the real version is a SECRET DOOR — not a billboard. The player who discovers it feels like they found something. The player who doesn't care about buying just enjoys the collection mechanic.

### The Business Model

The game and the shop are not separate things. The inventory IS the catalog. The collection mechanic IS the conversion funnel. Players are already immersed, already trusting, already in the mindset of "I want to own a piece of this world." The artisan who lists in the Inn's market gets access to an audience that is already emotionally invested.

### Sample Items Created

1. **The Aurora Pendant** (Labradorite) — Rare — Reveals hidden Fae Kingdom paths
2. **The Truth-Teller's Ring** (Malachite) — Uncommon — Reveals NPC deception in dialogue
3. **The Cat's Eye of Bastet** (Cat's Eye Chrysoberyl) — Legendary — Unlocks secret cats in Egyptian zone
4. **The Bluestone Key** (Preseli Blue Stone) — Rare — The KEY to the Fae Kingdom portal system

### Expansion

- Multiple artisans can list items, each styled to the Inn's aesthetic
- The Inn becomes a curated portal market — themed, immersive storefront driving real traffic to real makers
- Seasonal items, quest rewards, limited drops — all map to real inventory
- The Artisan Thief class (Krista's character) has special inventory abilities — she can appraise, identify, and evaluate items other players can't read

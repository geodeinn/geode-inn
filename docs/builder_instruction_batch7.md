# BUILDER INSTRUCTION — BATCH 7
## Unified spec for fizgigs: Market sync, Arcade expansion, Ceiling Gnome, visual grid

---

## 1. MARKET PAGE — SYNC PRODUCT DATA

The MarketItem entity has 39 records. 35 are real Soulstice products with names only — no prices, images, descriptions, or checkout URLs. The full data is in docs/market_sync_manifest.json.

**Action:** For each item in the manifest's "items" array, match by the "name" field to existing MarketItem records and update ALL of these fields:
- priceRange (e.g. "$90", "$510", "$50-100")
- realName (display name for the product card)
- realDescription (short product description)
- realImage (product photo URL — some are null, render a placeholder stone icon)
- gameDescription (the in-game lore description)
- stoneType (gemstone materials)
- loreConnection (how it connects to the Inn's zones/characters)
- rarity (Common, Uncommon, Rare, Legendary)
- externalUrl (checkout link — redirects to soulsticejeweler.com/shop)
- artisanName: "Soulstice Jewelry"
- artisanShopName: "Soulstice Jewelry"
- artisanShopUrl: "https://soulsticejeweler.com"
- isSoulsticeItem: true
- inStock: true
- developmentStatus: "Available"
- zone: "Main Floor Market" (except Cat's Eye of Bastet which is "Egyptian Bazaar")
- processUrl: "https://soulsticejeweler.com/shop"

**Market page UI requirements:**
- Grid layout, dark stone background, gold serif typography
- Each card shows: realImage (or stone placeholder), realName, priceRange, rarity badge, category
- "View in Shop" button links to externalUrl (opens new tab)
- Filter sidebar: by category (Gemstone Earrings, Celtic Leatherwork, Gemstone Jewelry, Jewelry), by rarity (Common → Legendary)
- Sort: price (low-high, high-low), rarity, name
- The 4 game artifact items (The Bluestone Key, Truth-Teller's Ring, Aurora Pendant, Cat's Eye of Bastet) should display their gameDescription prominently — these are game items with real-world counterparts

**Note on name matching:** "Baltic amber, amethyst and silver earrings (variant)" in the Geode Inn app matches to "Baltic amber, amethyst and silver earrings (pair 2)" in the manifest — use realName "Baltic amber, amethyst and silver earrings" for display.

---

## 2. ARCADE PAGE — EXPAND FROM 4 TO 52 GAMES

Currently 4 games are live (Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep). The full 52-game roster is in docs/geode_inn_complete_game_roster.md. Visual thumbnail descriptions for all 52 are in docs/geode_inn_game_visual_reference.md.

**Action:** Build game cards for all 52 games organized by category:

### Card layout (each game):
- Game name (gold serif)
- Category label (smaller, muted gold)
- Zone assignment
- Inspiration template (e.g. "Inspired by: Tetris")
- Reward stone badge
- Status indicator: Live (green dot), Coming Soon (amber dot), In Development (blue dot)
- Thumbnail image area (use the visual reference description to generate or placeholder with zone-appropriate art style)
- Play button (only active for the 4 live games)

### Category sections (vertical scroll, same descent architecture as hub):
1. Phase 1 Arcade (4 games) — LIVE, playable
2. Standalone Games (4 games) — Tumble Run, The Long Dark, The Signal, The Reclamation
3. Phase 2 Arcade (5 games)
4. Phase 3 Arcade (6 games)
5. Phase 4 Arcade (3 games)
6. Major Zone Games (6 games) — Fae Kingdom, Hollow Earth, Canopy City, Tidal Caves, The Arcana, Zelda-Style World
7. World Trials (10 games)
8. National Parks (7 games)
9. Specialty Games (5 games)
10. Community & Meta (2 games)

### Visual styling:
- Same dark stone + Celtic knotwork background as the hub
- Category headers in the zone's assigned artist style (see visual reference grid artist table)
- Game cards: dark stone with gold border, hover effect = subtle glow + slight upward lift
- Rarity/reward stone badges: small colored gems (Common=gray, Uncommon=green, Rare=blue, Legendary=gold)
- Coming Soon games: slightly dimmed, "Coming Soon" overlay

---

## 3. CEILING GNOME — ADD TO EVERY PAGE

Full spec in docs/geode_inn_ceiling_gnome_spec.md.

**Action:** Add the ceiling gnome element to every page in the Geode Inn app.

- Position: top-right corner, 48px, hanging from a dark stone beam
- Default animation: patching (tapping with a brass trowel, dust particles)
- Idle: every 15-20 seconds, stops and glances down at the player
- Hover: pauses, tooltip "The ceiling gnome watches. The Inn is maintained."
- Click: ducks behind beam, pops back with a random one-liner
- Tri-mode: 42Hz Living = warm amber, actively working / 84Hz Shadow = frozen mid-patch (Gorgon effect) / In-Between = flickers translucent
- z-index: above page content, below modals/overlays
- Must be present on ALL pages: hub, arcade, market, archive, common-room, composer, world-map, gazette, hatchery, podcast, share-wood, and all zone pages

---

## 4. PRIORITY ORDER

1. Market sync (highest — products are visible but empty)
2. Ceiling Gnome (quick — single component, global)
3. Arcade expansion (largest — 48 new game cards)
4. Visual thumbnails can be generated progressively

---

## FILE REFERENCES (all in docs/ folder)

- market_sync_manifest.json — 34 products with full data
- geode_inn_complete_game_roster.md — 52 games with templates and zones
- geode_inn_game_visual_reference.md — thumbnail descriptions + artist assignments
- geode_inn_ceiling_gnome_spec.md — gnome UI element spec

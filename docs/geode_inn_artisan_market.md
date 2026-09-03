# Geode Inn — The Artisan Market: "The Living Commerce"
## System: The Main Floor Market and MarketItem Integration
## Access: Main Floor (Level 3) — the Market Quarter
## Prerequisite: Level 3 (Main Floor) reached

### Overview

The Artisan Market is the Geode Inn's commercial hub — the main floor's Market Quarter, where artisans from every zone sell their crafts, stones, tools, and stories. The market is the Inn's LIVING COMMERCE: not a static shop menu, but a physical space where NPCs set up stalls, display wares, negotiate prices, and tell stories about their work.

The market connects to the MarketItem entity (already created in the database) and is the Inn's primary economic system. Every item in the market is a MarketItem record — each with a real-world description, a game description, a price range, a rarity, a zone, a stone type, and a connection to the Inn's lore.

The market is also the bridge to Soulstice Jewelry. Krista's real-world jewelry pieces appear as MarketItems — each one is a "Soulstice Item" flagged with `isSoulsticeItem: true`, with a real description, a real image, a real price, and a real URL to the Soulstice shop. The player can examine Krista's work in the game, learn the stones' lore, and follow the URL to purchase the real piece.

---

## Market Layout

The Market Quarter occupies the main floor's east wing — a broad, open hall with vaulted ceilings (Klimt gold patterns on warm stone), Celtic knotwork ambient background pulsing faintly, and stalls arranged in a spiral pattern (the universal spiral, again — the market IS the spiral, made into commerce).

### Stall Zones (following the spiral inward)

**Outer Ring — The Stone Market:**
Raw stones, cut stones, polished stones. The outer ring is where stone traders from every zone sell their finds. Each stall is run by a zone-specific vendor:
- The Desert Bone stall: carnelian, turquoise, lapis lazuli, jasper (the Sphinx's riddle stones)
- The Norse Zone stall: amber, runestone fragments, mead-hall quartz
- The Mediterranean stall: olive stones, labyrinth marble, Medusa's frozen fragments
- The Water Zone stall: sea glass, pearl, coral, the Pirate's salvaged stones
- The Fae Kingdom stall: labradorite, fluorite, rainbow moonstone (the rare stones)
- The National Parks stall: park-specific stones (obsidian, ammolite, smoky quartz, peridot)

**Middle Ring — The Craft Market:**
Finished goods — jewelry, tools, instruments, charms. The middle ring is where the artisans work:
- Solstara's booth: finished bead compositions, Wearable Songs, stone jewelry
- The Blacksmith's stall: metal findings, tools, custom commissions
- The Silversmith (Current): crystal-lens devices, silver findings, the Examiner's camera
- The Bard's stall: musical instruments, sheet music (the tabletop compositions)
- The Alchemist's stall: Philosopher's Stone fragments, alchemical reagents, crafting materials

**Inner Ring — The Soulstice Gallery:**
Krista's real-world jewelry, displayed in a dedicated gallery. Each piece is a MarketItem with `isSoulsticeItem: true`. The gallery is the market's most beautiful space — warm lighting, each piece on its own pedestal, the stones' frequencies audible as the player approaches. The player can:
- Examine each piece (real description, real image, real price)
- Hear the piece's sonic composition (the stones' frequencies, played as a melody)
- Learn the piece's lore (the stones' metaphysical and cultural significance, from the Stone entity's "mind" and "body" fields)
- Follow the URL to soulsticejeweler.com to purchase the real piece

**Center — The Spiral Fountain:**
The market's center is a small fountain — water spiraling downward (the universal spiral, in water). The fountain is the market's hub: the place where players meet, trade, and rest. The fountain's water resonates at 42Hz — the Song, in the market. The fountain is the market's anchor: the one thing that never changes, even as the stalls rotate and the vendors come and go.

---

## MarketItem Entity Integration

Each stall's inventory is pulled from the MarketItem entity. The entity has the following fields (already created):

| Field | Usage |
|-------|-------|
| `name` | The item's display name |
| `realName` | The real-world name (for Soulstice items) |
| `gameName` | The in-game name (for game-only items) |
| `realDescription` | The real-world description (Krista's copy) |
| `gameDescription` | The in-game description (tabletop voice) |
| `realImage` | The real-world product photo |
| `gameImage` | The in-game concept art |
| `priceRange` | The price category (budget, mid, luxury, priceless) |
| `rarity` | Common, Uncommon, Rare, Legendary, Unique |
| `category` | Stone, Jewelry, Tool, Charm, Book, Instrument |
| `stoneType` | The primary stone (links to Stone entity) |
| `zone` | The zone the item comes from |
| `isSoulsticeItem` | true = real-world Soulstice piece; false = game-only |
| `externalUrl` | For Soulstice items: link to soulsticejeweler.com |
| `inStock` | Whether the item is currently available |
| `loreConnection` | A text field linking the item to Inn lore |
| `gameEffect` | The in-game effect (for charms, tools, etc.) |
| `artisanName` | The NPC who made the item |
| `artisanShopName` | The NPC's shop name |
| `artisanShopUrl` | For real-world artisans: link to their shop |
| `processUrl` | A link to the item's creation process (for educational content) |
| `developmentStatus` | concept, designed, produced, live |

---

## The Dynamic Market

The market is NOT static. Stalls change based on:

**Time of day:** Different vendors are present at different in-game times. Erik's mead stall opens at dusk. The Examiner's fragment stall is only open midday. The Bard's instrument stall opens at dawn (the Bard practices at dawn).

**Player progression:** New stalls appear as the player unlocks zones. The Fae Kingdom stall only appears after the player opens the portal. The National Parks stall only appears after the player crosses The Bearsark's border.

**Seasonal events:** The market changes with in-game seasons (if implemented). The Solstice Market (summer/winter) brings rare items. The Equinox Market brings balanced items (equal frequency pairs).

**NPC relationships:** Vendors who like the player (high reputation) offer discounts, rare items, and personal commissions. Vendors who don't know the player offer only the standard inventory. The player's reputation with each zone's NPCs affects the market.

---

## The Trading Mechanic

### Buying
The player buys items with the Inn's currency: **Resonance Coins.** Resonance Coins are earned by:
- Completing quests (10-50 coins per quest)
- Collecting stones (1 coin per stone)
- Sitting in nooks (1 coin per nook session)
- Trading with NPCs (variable)
- Selling items to vendors (variable, based on the item's value and the vendor's interest)

### Selling
The player can sell items to vendors who are interested in that item type. Stone vendors buy stones. Craft vendors buy crafted goods. The Bard buys instruments. The prices are negotiable — the player can haggle (a dialogue system where the player's reputation and the NPC's disposition determine the final price).

### Trading
Some vendors accept TRADES instead of coins. The Examiner trades fragments for identified stones. The Blacksmith trades findings for raw metal. The Caravan Master (Petra) trades exotic stones for stones the player has but the Caravan Master doesn't. Trading is the market's barter system — the economy before currency.

### Commissioning
The player can commission custom items from artisans. Solstara takes bead commissions (the Bead Composer system). The Blacksmith takes metal commissions. The Silversmith takes lens commissions. Commissions cost more than ready-made items but are tailored to the player's specifications (specific stones, specific metals, specific frequencies).

---

## The Soulstice Gallery (Real-World Bridge)

The Soulstice Gallery is the market's most important commercial feature — the bridge between the game and Krista's real business. Each Soulstice item:

1. **Displays the real product** — real photos, real descriptions, real prices
2. **Plays the sonic composition** — the stones' real frequencies, played as a melody, so the player can HEAR the piece
3. **Tells the lore** — each stone's metaphysical properties (from the Stone entity's "mind" field), cultural history, and connection to the Inn's mythology
4. **Links to the real shop** — the `externalUrl` field links to soulsticejeweler.com, where the player can purchase the physical piece
5. **Shows the creation process** — the `processUrl` field links to Krista's process documentation (how the piece was made, what stones were used, what the materials mean)

The Soulstice Gallery is the Inn's commercial thesis: the game is not an advertisement. The game is a CONTEXT MACHINE — it gives each piece of jewelry a story, a frequency, a mythology, and a connection to a world. The player who buys a Soulstice piece after playing the game isn't buying jewelry. They're buying a piece of the Inn.

Krista's Viking earrings (iolite, copper, Celtic knotwork, Thor's hammer — her favorite piece) would be a MarketItem with:
- `name`: "Viking Earrings"
- `realDescription`: Krista's original copy about iolite as a navigational aid, copper as a sacred metal, etc.
- `gameDescription`: "Earrings forged in the Norse Zone's smithy. Iolite — the Viking's compass stone, the mineral that showed the way when the sun was hidden. Copper — the sacred metal of longevity. Celtic knotwork — the pattern that has no beginning and no end. Thor's hammer — the protector's mark, the guarantee that the storm will pass."
- `stoneType`: "Iolite"
- `zone`: "Norse Zone"
- `isSoulsticeItem`: true
- `externalUrl`: "soulsticejeweler.com/viking-earrings"
- `priceRange`: "$160"
- `loreConnection`: "The Viking earrings are Erik's gift to the traveler who sits at his table. The iolite points the way home. The copper ensures the way is long."

---

## Connections

- **MarketItem Entity** — the market's inventory system. Every item is a database record.
- **Stone Entity** — each MarketItem with a `stoneType` links to the Stone entity for lore and frequency data.
- **Soulstice Jewelry** — the Soulstice Gallery is the real-world bridge. Each piece links to the real shop.
- **The Bead Composer** — Solstara's booth is the Composer's physical location. The player can compose at Solstara's bench.
- **The Campgrounds** — the Blacksmith's stall here connects to the Campgrounds' forge (where the metal is made).
- **The Wandering Program** — wandering creatures bring back items that appear in the market's outer ring (the stone market).
- **The Mycorrhizal Network** — items traded through the network arrive at the player's nook, not the market. The market is the surface trade; the network is the root trade.
- **The Caravan Master** (Petra) — the Caravan Master's trade routes bring exotic items to the market. The Caravan Master is the market's supply chain.
- **The Nine Muses** — Euterpe's compositions can be sold at the Bard's stall. The Muses' creative output becomes marketable.
- **Cross-platform pairability** — the market works on all platforms. On web, it's a clickable shop. On mobile, it's a simplified stall list. On Steam, it's a physical space the player walks through. The same items, the same prices, the same lore.

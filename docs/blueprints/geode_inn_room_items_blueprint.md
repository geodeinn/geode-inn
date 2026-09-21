# THE ROOM ITEMS BLUEPRINT
## The room-by-room ledger: every character's placement spot, every item a room needs, every image status — one page per layer.

**Founded:** 2026-09-21 (resuming the placement walk paused 2026-09-18, layers 2–3)
**Purpose:** The Inner Tree build week needs rooms that are already reconciled: character woven, spot secured, items known, image status known. This is the blueprint the Fizgigs build from.
**Sources:** zones/geode_inn_level2_clockwork_skies_complete.md · zones/geode_inn_level3_main_floor_complete.md · art/builder_character_image_map.md · MASTER_STRUCTURE_BLUEPRINT.md (D13) · GameItem entity (355 records, zone-counted 2026-09-21) · zone_specs/geode_inn_main_floor_aurallia_weave.md
**Legend:** PORTRAIT = character image status (LIVE = URL in the image map; OWED = no image yet; REVIEW = multiple versions, canonical und) · ITEM = GameItem entity status (NONE = not in entity, must be created)

---

## THE HEADLINE FINDING (2026-09-21 census)

The GameItem entity holds **355 items** across every zone in the building — Cosmology, Staircase, Undercity, Lighthouse, Hearth, Catacombs, Water, Fae, the parks, the world regions — and **zero items for Clockwork Skies and zero for the Main Floor.** The two layers the placement walk paused at are exactly the two layers whose room contents were never ledgered. The walk stopped where the data ran out. This blueprint fills that hole first.

---

# LAYER 2 — CLOCKWORK SKIES

## Room 1: The Arcana (the ship) — eight stations, each a character's home room

| Station | Character | Placement spot | Portrait | Signature items (GameItem status) |
|---|---|---|---|---|
| The Helm | The Captain | behind the player at the wheel; the silence IS the trust | LIVE | Ship's Wheel (NONE) · Ship's Bell, 95Hz (NONE) · Captain's Pipe (NONE) |
| The Chart Room | The Navigator | at the charts; the cot for the night shift | LIVE | Star Charts incl. the falsified one (NONE) · Ink Pen (NONE) · The Cot (NONE) |
| The Deck | The Cool | the hammock, under open sky | LIVE | Hammock, Sky Calm buff (NONE) · Brass Pocket Watch, Leonardo's gears (NONE) · Slack-String Guitar (NONE) |
| The Rigging | The Pure-Hearted | canvas and climb, the joyful wide view | LIVE | Tool Pouch + dented brass wrench (NONE) · Mast View (ENV, NONE) · Brass Horn (NONE) |
| The Hold | Ryoko | the hoard nest | LIVE | Stolen Collection: silk scarf, wrong-way compass, unknown music box, locked brass box (NONE) · Hoard Pile, recurring tidy-scatter (NONE) · Detuned Brass Whistle (NONE) |
| The Tactic Room | The Philosopher | at the tactical table, margin notes asking Why | LIVE | Tactical Table + annotated diagrams (NONE) · A440 Tuning Fork, the only honest sound (NONE) · The never-drawn Blade (NONE) |
| The Gate | The Protector | bedroll between crew and door | LIVE | Bedroll worn toward the door (NONE) · Mitama Stone, warm/cold (NONE) · Deep Wood Drum, 50 BPM (NONE) |
| The Crow's Nest | The Reluctant | the highest point, watching | LIVE | Brass Mechanism (incomplete music box) (NONE) · The View (ENV) · Music Box Melody fragment-charm (NONE) |

**Ship-common items (all NONE):** the gearwork heart room's 50 BPM core; the Observatory dome.

**Arcana item total: 24 station items + 2 common = 26 GameItems to create.**

## Room 2: Canopy City (the village in the branches) — eight locations

| Location | NPC | Portrait | Signature items (GameItem status) |
|---|---|---|---|
| The Docking Tower | — | — | 50 BPM brass bell, city clock (NONE) |
| The Sky Market | The Sky Market Vendor | **OWED** | wind-glass (NONE) · weather charms (NONE) · sky charts (NONE) · MarketItem tie: sky-specific goods |
| The Clockwork Maker's Shop | The Clockwork Maker | **OWED** | the music box holding Brisingamen's second ring (NONE) · repair bench (NONE) |
| The Weeaboo's Workshop | Tinkering Weeaboo (sky side) | LIVE | Leonardo's framed sketches (NONE) · half-finished inventions (NONE) · blueprints wall (NONE) |
| The Residential Nests | — (citizens) | — | woven nest furniture set (NONE) |
| The Crow's Path | The Crow's Path Lookout | **OWED** | the rope-walk (ENV) · ghost-ship sighting note (NONE) |
| The Cartographer's Outlook | The Cartographer | LIVE | brass horizon telescope, never worked (NONE) · pinned maps + stone weights (NONE) · stone-compass (quest item, NONE) |
| The Sky Dock | — | — | rope ladders + wooden slides, the nine descent lines (NONE) |

**Canopy City item total: ~15 GameItems to create.**

**Layer 2 portrait ledger: 14 LIVE · 3 OWED (Clockwork Maker, Sky Market Vendor, Crow's Path Lookout — all three are new Canopy City NPCs, never painted).**

---

# LAYER 3 — THE MAIN FLOOR

## Room-by-room: characters, spots, items

| Room | Characters placed | Portrait | Items the room needs (GameItem status) |
|---|---|---|---|
| 1. The Great Hall (the Host) | The Host at the door; the Wanderer's walking stick leaning at the bar; chibi ravens overhead | Host LIVE · Wanderer LIVE | The Innkeeper's List quest board (NONE) · The Wanderer's Walking Stick (NONE) · Chibi Ravens + stash mechanic (NONE) · The Climbing Passage to Clockwork (NONE) |
| 2. The Bar + the impossible garden | The Catalyst behind the counter; Greenward and Lichenblossom in the garden | Catalyst LIVE · **Greenward OWED** · **Lichenblossom OWED** (D13: 3 keepers + garden ENV) | the counter itself (NONE) · garden ENV fill (panels owed per D13-O2) · the Mask That Serves quest props (NONE) |
| 3. The Arcade | — (games are the residents) | — | the four Phase-1 arcade cabinets (sprites LIVE for pilot; cabinet art NONE) |
| 4. The Market | distributed through the hall; visiting vendors; Aurallia's tending circuit | MarketItems partial (101 rows, 8 photos) · Aurallia's weave ruled 2026-09-18 | Market stall set, 3 tiers (NONE as GameItems; MarketItems live separately) |
| 5. The Library Nook + Naut's corner | Naut in the corner | Naut LIVE | World Religions shelf (NONE) · Modern Legends Shelf (NONE) · reference texts (NONE) · rare-book retrieval quest props (NONE) |
| 6. The Dragon's Geode Corner + the Stone Capsule | Ziggy; the baby dragon; the ceiling gnomes | Ziggy LIVE · **Baby Dragon not in image map — OWED/verify** · gnomes LIVE (Gesso) | the Geode itself (NONE) · stone-placement music builder (mechanic, NONE) · capsule system racks (NONE) |
| 7. The Firekeeper's Hearth + Common Room | The Firekeeper | **REVIEW — only the alt early portrait exists; D13 says the final portrait is OWED** | Fire-Mantle etc. already live in Hearth GameItems · "Last Story Told" story cushions (verify vs. Hearth rows) |
| 8. The Music Room | the nine composers (census) | — | **the entire room: KIT-Z OWED per D13-O7 — ENV + instruments, all NONE** |
| 9. Aurallia's weave (cross-room) | Aurallia: the Cedar Bench (anchor), the Market tending circuit, Reading Hour in the Library Nook; home = Spiral Gallery cave studio | **verify — display-shy character; portrait ruling open** | The Cedar Bench (NONE — load-bearing furniture, the one bench nobody owns) |

**Layer 3 portrait ledger — LIVE:** Host, Wanderer, Catalyst, Naut, Ziggy, Brim, Belladonna, Bard, Cook, Thrum, Brownies, Story-Born Ents, Ragana. **OWED:** Greenward, Lichenblossom, Firekeeper (final), Baby Dragon (verify), Ember (verify — not in image map), Music Room composers (census pending).

**Layer 3 item total: ~25 GameItems to create + the Music Room ENV kit + garden ENV fill.**

---

## THE CONSOLIDATED OWED LIST (layers 2–3)

**Portraits (5 confirmed + 3 verify):** Clockwork Maker · Sky Market Vendor · Crow's Path Lookout · Greenward · Lichenblossom · Firekeeper (final) · Baby Dragon (verify) · Ember (verify)

**GameItems to create: ~66** (26 Arcana + ~15 Canopy City + ~25 Main Floor)

**ENV panels:** the Music Room kit (KIT-Z) · the garden ENV fill (D13-O2) · Canopy City village exteriors

**Open gates for the Witan:**
1. The three Canopy City NPCs — are they painted-pending or do they need full design sessions first? (No spec exists for their appearance.)
2. Greenward and Lichenblossom — the Master Structure names them as the Bar's keepers with the Catalyst; do they have concept art anywhere (Drive palette census pending), or are they fresh paints?
3. The Cedar Bench — the blueprint records it as load-bearing furniture with no owner; confirm it enters as a GameItem marked un-stealable, un-purchasable (the Sanctuary law as an item row).
4. The Music Room — full design session owed (D13-O7); this blueprint reserves the room but cannot kit it yet.

---

## LAYERS STILL TO WALK (the remaining seven, in build-week priority order)

4. Campgrounds · 5. Staircase · 6. Catacombs + Undercity · 3B. The Royal · 7. Fae Kingdom · 8. Water · 1. Cosmology (portrait coverage strongest; items exist) · 9. Bedrock Fortress + the Water System

*(Each gets the same table shape as layers 2–3 when its walk session runs.)*

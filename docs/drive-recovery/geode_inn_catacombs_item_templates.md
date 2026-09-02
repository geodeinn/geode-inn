# Geode Inn — Interactive Item Templates: Catacombs Zone
## Based on The Crone's Archive (Architectural Template)

### Design Philosophy
The Catacombs are the deepest, oldest, heaviest zone. Where Cosmology is open and weightless, the Catacombs are enclosed and oppressive. Where Water grows, the Catacombs preserve. The Crone's archive teaches players that some knowledge is not given — it is excavated. You must bring your own light, dig through your own dust, and earn what you find. The weight above you is the weight of everything that came before.

---

## Material Palette (Catacombs)
| Material | Source | Properties |
|----------|--------|------------|
| Bedrock Stone | The walls and ceiling | Rough, raw, ancient. Older than any other stone in the Inn. Never smoothed. |
| Packed Earth | The floor | Dry. Dense. Holds the imprint of footsteps for centuries. Absorbs sound. |
| Clay Tablet | The archive records | The oldest writing medium. Carved with reed stylus. Fire-baked. Permanent. |
| Scroll Tube | Scroll storage | Baked clay cylinders. Sealable. Protects contents from moisture and dust. |
| Bone | Embedded in walls | Ancient remains. Some phosphorescent. Some carved into tools. |
| Oil Clay | Oil lamp bodies | Crude fired clay. Animal fat fuel. The simplest, oldest light source. |
| Foxfire | Fungal colonies on stone | Cold green-blue glow. Grows on the oldest surfaces. Non-transferable. |
| Crystal Lens | The Crone's magnifying glass | Polished ancient crystal. Used for reading, examining, and translating. |
| Dust | The ever-present layer | Not dirt — time. Settles on everything. Disturbing it reveals what was hidden. |

---

## Lighting System (Catacombs)
The darkest zone. Light is scarce, rationed, and precious. You bring your own or you don't see.

| Light Type | Source | Color | Range | Behavior |
|------------|--------|-------|-------|----------|
| Oil Lamp | Clay lamp, animal fat | Flickering warm yellow | Very short (2-3 blocks) | Smoky. Flickers. Requires fuel. Can be extinguished by drafts. The standard. |
| Foxfire Glow | Fungal colonies on stone | Cold green-blue | Very short (1-2 blocks) | Constant. Non-transferable. Only grows on the oldest stone. Cannot be planted. |
| Phosphorescent Bone | Ancient bone in walls | Deep amber | Very short (1-2 blocks) | Constant. Faint. Rare. Only certain bones glow. Cannot be moved without losing glow. |
| Crystal Lens Focus | Magnifying crystal + oil lamp | Concentrated warm yellow | Narrow beam (1 block) | Directed. Bright. The Crone's tool — focuses lamp light into a reading beam. |
| Torch | Wood + animal fat | Bright orange-yellow | Short (3-4 blocks) | Loud (crackling). Smoky. Burns fast. Short-term exploration tool. |
| Reflected Crystal | Crystal mirror shard | Depends on source | Redirects existing light | Passive. Bounces light around corners. A tool for extending lamp reach. |

### Light Interaction Rule
Oil lamp + crystal lens = focused reading beam (the only bright, directed light in the zone). Oil lamp + dust = particles visible in the light beam (disturbed dust reveals hidden text on surfaces). Foxfire + carved symbols = the symbols glow in ghostly outline (the oldest writing is designed to be read by foxfire, not fire). Phosphorescent bone + bone tools = the tools glow faintly when near their source (a resonance — bone calls to bone). The Catacombs' light is scarce and functional. Every point of light is precious. Waste it and you're in the dark.

---

## Furniture Templates (Catacombs)

### 1. Stone Archive Shelf
**Based on:** The Crone's wall-carved shelving
**Description:** Shelves carved directly into the bedrock walls. Not furniture — geology. The shelves are part of the stone, as permanent as the archive itself.
**Materials:** Bedrock stone (structure)
**Variants:**
- Wall-Carved (cut into the rock — permanent, immovable, the Crone's style)
- Free-Standing (stacked stone slabs — movable but heavy)
- Niche (sealed alcoves in the wall — for the most precious texts)
**Interactive Properties:**
- Wall-carved: cannot be moved or destroyed (the shelf IS the wall)
- Free-standing: can be rearranged but each slab requires significant strength (multiple players or a lever system)
- Niche: sealable with a clay plug (protects contents from moisture, dust, and other players)
- Weight limit: heavy items on bottom shelves (stone follows gravity, and the Catacombs respect gravity)
- Items stored here age WITHOUT degrading (the catacomb air preserves — that's the zone's gift)

### 2. Translation Desk
**Based on:** The Crone's stone table covered in fragments
**Description:** A massive stone table covered in fragments of ancient texts being pieced together. The workspace of the archive.
**Materials:** Bedrock stone (surface), crystal lens (tool), bone stylus (tool)
**Variants:**
- Crone's Desk (massive, permanent, covered in ongoing work — the template)
- Scholar's Desk (smaller, portable tools, for visiting researchers)
- Assembly Table (large, flat, for laying out many fragments simultaneously — group translation)
**Interactive Properties:**
- Player can examine and translate ancient texts here (requires Crystal Lens)
- Fragments placed on the desk can be pieced together (puzzle mechanic — rotate and connect fragments)
- Assembly Table: multiple players can work on the same large text simultaneously
- The desk surface records the translation progress (fragment positions are saved)
- Dust on the desk reveals which fragments have been examined and which haven't (dust = unexamined)

### 3. Clay Oil Lamp
**Based on:** The Crone's crude clay lamps
**Description:** A simple fired clay vessel holding animal fat and a wick. The oldest, simplest light source in the Inn.
**Materials:** Clay (body), animal fat (fuel), plant fiber (wick)
**Variants:**
- Single (one flame, standard — the Crone's style)
- Triple (three flames, more light, faster fuel consumption)
- Hanging (suspended by cord — frees both hands for work)
**Interactive Properties:**
- Provides light in a 2-3 block radius (very limited)
- Fuel burns for approximately 30 minutes (real time) before needing refill
- Can be extinguished by wind/drafts (the Catacombs are mostly windless, but some passages have airflow)
- Extinguished lamps in total darkness create a "blind" state (the player must navigate by memory, touch, or sound)
- The flickering light reveals dust particles (environmental storytelling — disturbed dust shows recent activity)

### 4. Scroll Tube
**Based on:** The Crone's clay cylinders
**Description:** Baked clay cylinders used to store and protect scrolls. Sealed with a clay plug. The ancient filing system.
**Materials:** Baked clay, clay seal
**Variants:**
- Standard (one scroll per tube)
- Double (two scrolls — separated by an internal clay divider)
- Sealed (requires a specific key/tool to open — locked archive)
**Interactive Properties:**
- Protects scroll contents from moisture, dust, and light (preservation)
- Sealed variant: requires the correct bone key or tool to open (quest-linked)
- The clay seal can be stamped with a maker's mark (identifies the tube's contents without opening)
- Stacks neatly on archive shelves (designed to fit the wall-carved shelving dimensions)
- Breaking the seal destroys the tube's protection (once opened, the scroll begins to age — though catacomb air slows this)

### 5. Bone Stylus
**Based on:** The Crone's ancient tools
**Description:** A pointed tool carved from ancient bone, used for marking, scraping, and translating. Not a pen — a surgical instrument for ancient surfaces.
**Materials:** Ancient bone, optional crystal tip
**Variants:**
- Marking (sharp point for scratching new marks into clay or soft stone)
- Scraping (flat edge for removing dust and debris from carved surfaces)
- Crystal-Tipped (fine crystal point for reading the finest detail — the Crone's tool)
**Interactive Properties:**
- Marking: can create new clay tablet records (the player writes their own archive entry)
- Scraping: can clean carved surfaces (reveals text that has been obscured by dust)
- Crystal-Tipped: can read the finest detail on ancient tablets (microscopic examination)
- Bone tools resonate with phosphorescent bone in the walls (glow faintly when held near them — the bone "recognizes" its own kind)
- Wears down with use (the stylus is consumable — the player must find or make new ones)

### 6. Foxfire Marker
**Based on:** The fungal colonies on ancient stone
**Description:** A fragment of stone bearing foxfire fungus. Not portable — the foxfire is rooted to the oldest stone. But a fragment can mark a location.
**Materials:** Ancient stone (must be from the deepest catacomb level), foxfire fungus
**Variants:**
- Waystone (a foxfire-marked stone at a passage junction — marks the way)
- Warning (foxfire that grows over a sealed passage — nature's "do not enter")
- Reading Mark (foxfire positioned to illuminate a specific carved symbol)
**Interactive Properties:**
- Cannot be planted on new surfaces (foxfire only grows on the OLDEST stone — the deepest levels)
- Provides constant, cold, green-blue light (no fuel needed, but very faint)
- Waystones are player-placed (navigation markers in the dark maze of the catacombs)
- Foxfire grows very slowly (a waystone placed today will be brighter in a month — patience)
- Destroying foxfire is permanent (once scraped away, it does not grow back on that surface)

### 7. Crystal Lens
**Based on:** The Crone's magnifying glass
**Description:** A polished ancient crystal set in a bone frame. Used for reading, examining, and focusing light. The most precious tool in the archive.
**Materials:** Ancient crystal, bone frame
**Variants:**
- Reading (flat lens, large — for reading tablets and scrolls)
- Examination (curved lens, small — for examining fine detail and fragments)
- Focusing (thick lens — concentrates oil lamp light into a directed beam)
**Interactive Properties:**
- Reading: magnifies carved text (makes the oldest, smallest writing legible)
- Examination: reveals hidden details (watermarks in clay, microscopic marks, forgery detection)
- Focusing: creates a directed light beam (the only bright, directed light in the zone)
- The lens is fragile (dropping it on stone has a chance to crack it — cracked lenses still work but distort)
- Only the Crone's lens is perfect (player-made lenses are good, never perfect — the Crone's tools are the template)

### 8. Bone Key
**Based on:** The sealed archive concept
**Description:** A tool carved from ancient bone, shaped to open specific sealed scroll tubes or niche alcoves. Not a generic key — each is unique to its lock.
**Materials:** Ancient bone (shaped to match a specific clay seal pattern)
**Variants:**
- Archive Key (opens a specific scroll tube — the Crone's filing system)
- Niche Key (opens a sealed alcove — for the most precious texts)
- Master Key (opens all seals in a specific section — extremely rare, quest reward)
**Interactive Properties:**
- Each key is unique (cannot be copied — if lost, the seal must be broken)
- Bone keys resonate with the bone in the walls (glow faintly near their matching lock)
- Breaking a sealed tube/alcove without the key destroys the contents' protection (the scroll inside is exposed)
- Master Keys are the Crone's tools (given only through quests — never found, always awarded)
- A key and its lock are made from the same bone (the resonance is biological — bone knows bone)

---

## Structural Templates (Catacombs)

### Wall Types
| Wall | Materials | Properties |
|------|-----------|------------|
| Raw Bedrock | Rough, unworked stone | The default. The wall IS the earth. Cannot be modified — only carved into (shelves, niches). |
| Carved Bedrock | Stone with symbols/text carved in | The archive wall. Carvings glow with foxfire. The wall holds knowledge. |
| Stacked Stone | Dry-stacked stone blocks | Movable. The only "built" wall in the zone. Rough, heavy, unstable if too high. |
| Bone-Inlaid Stone | Stone with bone fragments embedded | Phosphorescent glow. Ancient. Cannot be created — only found. |
| Sealed Stone | Stone with clay-sealed niche | Storage wall. The wall IS a vault. The Crone's design. |

### Doorway Types
| Doorway | Materials | Properties |
|---------|-----------|------------|
| Narrow Passage | Raw bedrock | No door. A gap in the stone. Low and narrow — you may need to stoop. |
| Carved Archway | Carved stone | The oldest archways. Marked with symbols. Identifies what lies beyond. |
| Stone Slab Door | Heavy stone slab | Can be rolled into place to seal a passage. Takes significant effort to move. |
| Clay-Sealed Passage | Stone + clay seal | Permanently sealed until broken. Breaking it is a deliberate act. Cannot be resealed. |
| Bone Gate | Bone and stone frame | The rarest. Marks the entrance to the deepest sections. Quest-linked. |

### Floor Types
| Floor | Materials | Properties |
|-------|-----------|------------|
| Packed Earth | Earth and stone dust | The default. Silent footsteps. Holds imprints. Dry. |
| Bedrock | Raw stone floor | Smoothed by centuries of footsteps. Slightly reflective when oiled. |
| Dust Layer | Deep accumulated dust | Undisturbed passages. Footprints remain for months. Shows who has been here and when. |
| Bone Floor | Stone with embedded bone fragments | Phosphorescent. Rare. The oldest floors. |
| Clay Tile | Baked clay tiles | The Crone's addition. Organized. Marked with section labels. The only "designed" floor. |

### Ceiling Types
| Ceiling | Materials | Properties |
|-------|-----------|------------|
| Raw Bedrock | Rough stone | Low. Oppressive. The weight of the earth. Drips occasionally (mineral water, not rain). |
| Carved Beam | Stone beams left during excavation | The miners left structure. Heavy. Ancient engineering. |
| Bone-Vaulted | Stone with bone-rib arches | Rare. The deepest chambers. The oldest architecture in the Inn. |
| Collapsed | Partially caved in | Passable but dangerous. Marks abandoned sections. The earth reclaims. |

---

## Build Rules (Catacombs)

1. **The stone is the structure.** You don't build in the Catacombs — you carve. The walls are the earth. You hollow, you excavate, you shape. Adding new stone is possible but rare — the default is removal, not addition.
2. **Light is precious.** Every light source is consumable except foxfire (which can't be planted). You bring oil, you bring torches, and when they run out, you're in the dark. The Catacombs do not illuminate themselves. They test whether you're prepared.
3. **Dust is a record.** Undisturbed dust means no one has been here. Footprints in dust show who came, which direction, and how long ago. Disturbing dust reveals what was hidden beneath it. The Catacombs remember everything that happens in them — through dust.
4. **Preservation is the gift.** Items stored in the Catacombs do not age, rot, or degrade. The catacomb air preserves. This is the zone's one generosity — everything else, you earn. The archive protects what you bring, but it does not help you find it.
5. **Weight is constant.** The ceiling is low. The walls are close. The stone above is heavy. This is not claustrophobia — it is context. The weight reminds you that you are deep, that you are below, that the knowledge here was buried for a reason.
6. **The Crone's tools are the template.** The Crone's archive is the oldest, most established space in the Catacombs. Every tool, shelf, and technique flows from the Crone's methods. The Crone does not teach — the Crone's workspace IS the lesson. Observe and imitate.
7. **Foxfire cannot be cultivated.** It grows only on the oldest stone, and only where it chooses. You can mark locations with it, but you cannot farm it. Foxfire is the Catacombs' way of saying: some things are not yours to control.
8. **Depth = age = authority.** The deeper you go, the older the stone, the older the knowledge, the more foxfire on the walls. The deepest sections are the Crone's domain. You earn access through quests, not through building. The deepest level connects to the Fae Kingdom portals.

---

## Player Discovery Flow (Catacombs)
1. Player descends from the main floor — down the staircase, through the alchemy level, into the catacombs
2. The air changes — dry, heavy, dust-laden. The temperature drops. The ceiling lowers.
3. The darkness is total — the first zone where the player MUST bring their own light
4. Discovers the Crone's archive (NPC home — the template example)
5. Observes the carved shelves, the stone desk, the oil lamps, the crystal lens, the clay scroll tubes
6. Receives basic Catacombs tools: clay oil lamp, bone stylus, crystal lens (basic)
7. Explores — finds a raw passage, carves a small niche (the first personal space)
8. Discovers that without light, the space is useless (must plan fuel carefully)
9. Learns to read carved symbols by foxfire (the green-blue glow reveals the oldest writing)
10. Discovers the first clay scroll tube — breaks the seal, reads the ancient text (translation puzzle)
11. Learns to use the crystal lens to focus oil lamp light into a directed beam (navigating dark passages)
12. Discovers phosphorescent bone in the deepest wall — the amber glow marks ancient burial sites
13. Finds a Stone Circle Portal (the connection to the Fae Kingdom) — but it's sealed
14. Begins building archive shelves into the walls of a personal niche — carving knowledge into stone
15. The space transforms from raw earth to a personal archive — carved, lit by oil and foxfire, filled with translated texts
16. Other players find the niche by following dust footprints — the Catacombs recorded the path

The earth teaches by weight. The player builds by carving, then preserving.

---

## Five-Zone Comparison

| Aspect | Undercity (Scarlett) | Hearth (Firekeeper) | Water (Andra) | Cosmology (Allfather) | Catacombs (Crone) |
|--------|---------------------|---------------------|---------------|----------------------|-------------------|
| **Light** | Crafted (crystal) | Alive (fire) | Living (bio) | Celestial (stars) | Scarce (oil/foxfire) |
| **Energy** | Private | Communal | Flowing | Vast | Heavy, archival |
| **Currency** | Crystal | Warmth | Current | Starlight (patience) | Knowledge (translation) |
| **Material** | Stone + gold | Stone + wood | Tidal stone + coral | Sky stone + void silk | Bedrock + bone + clay |
| **Privacy** | Sacred | Optional | Distance | Impossible | Inherent (isolation) |
| **Sound** | Dampened | Echoing | Amplified | Celestial | Silent (earth absorbs) |
| **Growth** | Static | Static | Living | Eternal | Preservative (nothing ages) |
| **42Hz Song** | Faint | Faint | Amplified | Loudest | Felt, not heard (through the stone) |
| **Build Method** | Construct | Construct | Shape + grow | Expose | Carve (excavate) |
| **Lesson** | Build for yourself | Build for others | Build with | Build by watching | Build by excavating |

---

## Open Zone Templates (Next Priorities)
1. **Staircase / Alchemy** — the transition space (evolving materials, ascending energy)
2. **Fae Kingdom** — MMO zone (Seelie light, Unseelie dark, varied)
3. **Lighthouse / Vigil** — the watching point (lens light, ocean, isolation)

# Geode Inn — Building & Gathering System

## Architecture: Ironforge Model

The Geode Inn is structured like Ironforge — a central hub with radiating corridors connecting to themed districts. Each level has its own hub, and the corridors between zones are the gathering areas where players collect raw materials.

### Layout Structure

#### MAIN FLOOR — Hub: The Common Room
The great hearth of the Inn. All corridors radiate from here like spokes.
- **Corridor: Garden Path** → The Garden (Van Gogh) — gather: oak, rose, thyme, willow, moss
- **Corridor: Mead Hall** → The Meadery (Picasso) — gather: honey, wheat, hops, beeswax
- **Corridor: Archive Hall** → The Archive (library) — gather: parchment, ink, binding leather
- **Corridor: Market Street** → The Artisan Market — where built items are displayed/sold
- **Corridor: Tavern Walk** → The Tavern — social hub, NPC interactions
- **Corridor: Forge Road** → The Forge — crafting station, smelting
- **Corridor: Staircase** → The Staircase (alchemy) — connects upstairs and downstairs
- **Corridor: World Map Gate** → The World Map portal — access to all cultural zones

#### DOWNSTAIRS — Hub: The Crystal Chamber (Geode Center)
The geode at the heart of the Inn. Ancient, crystalline, the oldest space.
- **Corridor: Sandstone Pass** → Egypt/Tomb Tunnel (O'Keeffe) — gather: sandstone, desert glass, papyrus
- **Corridor: Andean Trail** → Peru/Andean Run (Guo Xi) — gather: andesite, andean alder, gold ore
- **Corridor: Tigris Way** → Mesopotamia (Hokusai) — gather: clay, bitumen, reed, lapis
- **Corridor: Marble Hall** → Greece (Monet) — gather: marble, olive wood, bronze
- **Corridor: Round Table** → Camelot (Moreau) — gather: english oak, yew, limestone
- **Corridor: Northern Passage** → Norse (Book of Kells) — gather: pine, birch, bog iron, runestone
- **Corridor: Bamboo Path** → China (Mulan ink-wash) — gather: bamboo, jade, lacquer, silk
- **Corridor: Spice Road** → India (Tagore) — gather: teak, sandalwood, copper, indigo
- **Corridor: Bayou Bridge** → Bayou (Don't Starve) — gather: cypress, bog moss, bog oak,Spanish moss
- **Corridor: Fae Gate** → Fae Kingdom portal — gather: luminwood, fae silk, luminite

#### UPSTAIRS — Hub: The Observatory
The highest point. Stars, planets, the cosmological scale.
- **Corridor: Star Field** → Astronomer's Path — gather: star dust, meteor iron
- **Corridor: Planet Walk** → Planetary spheres — gather: cosmic crystal
- **Corridor: Canopy Lift** → Canopy City (Rackham) — gather: canopy wood, leaf silk, sky resin
- **Corridor: Ascension** → The Ascension Canopy — the final climb

#### PARKS — Accessed from World Map
- **Colorado Plateau** (Dixon) — gather: sandstone, juniper, turquoise
- **Yellowstone** (Benton) — gather: obsidian, lodgepole pine, geyser salt
- **Superstition Mountains** (Bierstadt) — gather: granite, saguaro, desert ironwood
- **Appalachian Trail** (Wyeth) — gather: chestnut, maple, ginseng
- **Petrified Forest** (Adams) — gather: petrified wood, agate, chalcedony
- **Redwood** (Carr) — gather: redwood, fern, fog moss

#### WATER ZONES — Accessed from downstairs
- **Atlantis** (Royo) — gather: coral, pearl, deep sea crystal, abyssal stone
- **Tidal Caves** (Lewis) — gather: sea glass, cave pearl, salt crystal, tidal moss

#### UNDERGROUND — Accessed from downstairs
- **Catacombs** (Klimt Death+Life) — gather: bone, ancient brick, shadow moss
- **Undercity** (Gothic) — gather: undercity iron, shadow wood, ghost crystal
- **Bone Room** (O'Keeffe×Klimt) — gather: bone meal, calcium crystal, fossil
- **Cave City** (Doré) — gather: cave mushroom, glow moss, cave pearl
- **Poison Garden** (Gorey) — gather: nightshade, thorn vine, venom sac

---

## Material System

### Material Categories

#### WOOD (12 types)
| Material | Zone | Rarity | Source |
|---------|------|--------|--------|
| Oak | Garden | Common | Oak trees |
| Willow | Garden | Common | Willow trees |
| Pine | Norse | Common | Pine trees |
| Birch | Norse | Common | Birch trees |
| Cypress | Bayou | Common | Cypress trees |
| Bamboo | China | Common | Bamboo groves |
| Teak | India | Uncommon | Teak trees |
| Sandalwood | India | Rare | Sandalwood trees |
| Andean Alder | Peru | Uncommon | Alder groves |
| Olive Wood | Greece | Uncommon | Olive trees |
| English Oak | Camelot | Uncommon | Great oaks |
| Bog Oak | Irish Bog (Bayou extension) | Rare | Preserved in bog for 1000+ years |
| Yew | Camelot | Rare | Ancient yew trees |
| Luminwood | Fae Kingdom | Legendary | Only grows in Fae light |
| Redwood | Redwood Park | Rare | Giant redwoods |
| Chestnut | Appalachian | Rare | Chestnut trees (near-extinct) |
| Lodgepole Pine | Yellowstone | Common | Lodgepole forest |
| Juniper | Colorado Plateau | Uncommon | Juniper shrubs |
| Desert Ironwood | Superstition Mtns | Rare | Ironwood trees |
| Canopy Wood | Canopy City | Uncommon | Upper canopy branches |
| Shadow Wood | Undercity | Rare | Trees that grow in darkness |
| Petrified Wood | Petrified Forest | Rare | Fossilized trees |
| Lacquer Tree Sap | China | Uncommon | Lacquer trees |

#### STONE (14 types)
| Material | Zone | Rarity | Source |
|---------|------|--------|--------|
| Limestone | Camelot | Common | Quarry |
| Sandstone | Egypt | Common | Desert outcrops |
| Marble | Greece | Uncommon | Marble quarries |
| Andesite | Peru | Common | Volcanic rock |
| Granite | Superstition Mtns | Common | Mountain rock |
| Basalt | Yellowstone | Uncommon | Volcanic deposits |
| Obsidian | Yellowstone | Rare | Volcanic glass |
| Runestone | Norse | Rare | Enchanted stone |
| Crystal | Crystal Chamber | Uncommon | Geode formations |
| Agate | Petrified Forest | Uncommon | Mineral deposits |
| Chalcedony | Petrified Forest | Uncommon | Mineral deposits |
| Turquoise | Colorado Plateau | Rare | Mineral veins |
| Abyssal Stone | Atlantis | Rare | Deep sea floor |
| Calcium Crystal | Bone Room | Rare | Bone mineral deposits |
| Fossil | Bone Room | Rare | Ancient remains |
| Cave Pearl | Cave City | Uncommon | Cave formations |
| Ancient Brick | Catacombs | Common | Old construction |
| Deep Sea Crystal | Atlantis | Legendary | Abyssal depths |

#### METAL (8 types)
| Material | Zone | Rarity | Source |
|---------|------|--------|--------|
| Iron | Norse (bog iron) | Common | Bog iron deposits |
| Copper | India | Common | Copper veins |
| Bronze | Greece | Uncommon | Alloy (copper + tin) |
| Gold Ore | Peru | Rare | Gold veins |
| Silver | Camelot | Uncommon | Silver veins |
| Star Iron | Cosmology | Legendary | Meteoric iron |
| Undercity Iron | Undercity | Uncommon | Shadow-forged iron |
| Desert Glass | Egypt | Rare | Lightning-fused sand |

#### PLANT & FIBER (15 types)
| Material | Zone | Rarity | Source |
|---------|------|--------|--------|
| Reed | Mesopotamia | Common | River reeds |
| Papyrus | Egypt | Common | Papyrus plants |
| Moss | Various | Common | Multiple zones |
| Bog Moss | Bayou | Common | Bog floor |
| Spanish Moss | Bayou | Common | Hanging from trees |
| Rose | Garden | Common | Rose bushes |
| Thyme | Garden | Common | Herb gardens |
| Heather | Norse | Common | Heather fields |
| Thistle | Camelot | Common | Thistle plants |
| Vine | Various | Common | Climbing vines |
| Thorn Vine | Poison Garden | Uncommon | Living thorns |
| Nightshade | Poison Garden | Rare | Poisonous plant |
| Fern | Redwood | Common | Forest floor |
| Ginseng | Appalachian | Rare | Mountain herb |
| Fairy Silk | Fae Kingdom | Rare | Spun by Fae creatures |
| Leaf Silk | Canopy City | Uncommon | Canopy leaves |
| Cave Mushroom | Cave City | Common | Cave floors |
| Glow Moss | Cave City/Catacombs | Uncommon | Dark places |
| Shadow Moss | Catacombs | Uncommon | Underground |
| Tidal Moss | Tidal Caves | Common | Coastal caves |
| Fog Moss | Redwood | Common | Fog-dwelling |

#### ORGANIC (8 types)
| Material | Zone | Rarity | Source |
|---------|------|--------|--------|
| Amber | Norse/Garden | Uncommon | Fossilized resin |
| Resin | Various | Common | Tree sap |
| Honey | Meadery | Common | Beehives |
| Beeswax | Meadery | Common | Beehives |
| Lacquer | China | Uncommon | Lacquer tree processing |
| Indigo | India | Common | Indigo plants |
| Geyser Salt | Yellowstone | Uncommon | Mineral deposits |
| Hops | Meadery | Common | Hop vines |
| Wheat | Meadery | Common | Fields |
| Pearl | Atlantis | Rare | Oyster beds |
| Coral | Atlantis | Uncommon | Coral reefs |
| Sea Glass | Tidal Caves | Common | Weathered glass |
| Cave Pearl | Tidal Caves | Uncommon | Cave formations |
| Venom Sac | Poison Garden | Rare | Poisonous creatures |

#### MAGICAL (7 types)
| Material | Zone | Rarity | Source |
|---------|------|--------|--------|
| Fae Dust | Fae Kingdom | Uncommon | Fae creatures |
| Luminite | Fae Kingdom | Rare | Fae mineral |
| Resonance Crystal | Crystal Chamber | Rare | Tuned geode crystal |
| Gargoyle Stone | Catacombs | Rare | Sentient stone |
| Dragon Scale | Canopy City | Legendary | Dragon kittens |
| Cosmic Crystal | Cosmology | Legendary | Star material |
| Ghost Crystal | Undercity | Rare | Spirit residue |
| Star Dust | Cosmology | Rare | Cosmic gathering |

---

## Building System

### Building Complexity Tiers

#### Tier 1 — Simple (2-3 common materials)
Examples: Basic walls, simple floors, wooden fences, torch holders
- Oak wall = Oak + Resin
- Pine floor = Pine + Resin
- Reed mat = Reed + Moss
- Torch holder = Iron + Beeswax

#### Tier 2 — Functional (4-6 materials, some uncommon)
Examples: Workbenches, storage chests, decorative pillars, garden plots
- Crafting bench = Oak + Iron + Resin + Beeswax
- Storage chest = Cypress + Iron + Bog Moss + Amber
- Marble column = Marble + Bronze + Olive Wood
- Garden planter = Oak + Rose + Thyme + Willow

#### Tier 3 — Ornate (6-8 materials, includes rare)
Examples: Carved thrones, stained glass windows, altars, bridges
- Norse throne = Yew + Bog Iron + Runestone + Amber + Heather + Pine
- Stained window = Sandstone + Desert Glass + Gold Ore + Resin
- Fae altar = Luminwood + Luminite + Fae Dust + Fairy Silk + Crystal
- Camelot round table = English Oak + Yew + Limestone + Bronze + Amber

#### Tier 4 — Master (8-12 materials, multi-zone, includes legendary)
Examples: Zone entrances, grand architecture, magical constructs
- Geode gate = Crystal + Resonance Crystal + Luminite + Bog Oak + Gold Ore + Marble + Star Dust + Dragon Scale
- Fae Kingdom portal = Luminwood + Luminite + Fae Dust + Fairy Silk + Resonance Crystal + Bog Oak + Crystal
- Observatory dome = Star Iron + Cosmic Crystal + Marble + Gold Ore + Desert Glass + Luminwood + Resin

#### Tier 5 — Legendary (12+ materials from every level)
Examples: The Inn itself, the Final Room, the Whisper Layer
- The Inn (main structure) = Oak + Limestone + Crystal + Bog Oak + Luminwood + Marble + Gold Ore + Yew + Resonance Crystal + Star Iron + Dragon Scale + Resonance Crystal
- The Final Room = materials from every zone + Resonance Crystal + the player's gathered knowledge

### Crafting Stations
- **The Forge** (Main Floor) — smelts metals, shapes stone
- **The Workshop** (Main Floor) — combines wood, fiber, plant materials
- **The Crystal Chamber** (Downstairs) — combines magical materials
- **The Observatory** (Upstairs) — combines cosmic materials
- **The Fae Workshop** (Fae Kingdom) — combines Fae-specific materials

### Gathering Tools
- **Axe** — wood (upgrades: iron axe → bronze axe → gold axe → star iron axe)
- **Pick** — stone (upgrades: iron pick → bronze pick → crystal pick → star iron pick)
- **Sickle** — plants/fiber (upgrades: iron sickle → silver sickle → fae sickle)
- **Net** — Fae/magical (upgrades: basic net → silk net → fairy silk net)
- **Fishing Rod** — water materials (upgrades: basic → bone → crystal)

### Gathering Dynamic (Don't Starve Style)
- Resources respawn on timers (common: 5 min, uncommon: 15 min, rare: 30 min, legendary: 1 hour)
- Tools have durability and must be repaired or replaced
- Some materials require specific tools (bog oak needs iron axe, luminwood needs fae axe)
- Seasonal events change available materials
- The more you gather from a zone, the more the zone "remembers" you (Whisper Layer integration)


---

## Village & Community Building System

### The Sim Dynamic

The Geode Inn is the seed of a player-built world. Players don't just visit the Inn — they build around it. The Inn is the permanent center; everything else grows outward based on what players actually build.

### Progression

#### Phase 1: Homesteading
- Player claims a plot of land near the Inn (in the surrounding village area)
- Plots are organized in concentric rings: closer to the Inn = more expensive/prestigious
- Player gathers materials from the Inn's corridors and zones to build their home
- Home building uses the existing 5-tier system:
  - Tier 1: Lean-to (Oak + Reed + Moss) — basic shelter
  - Tier 2: Cottage (Oak + Limestone + Bog Iron + Beeswax) — a real home
  - Tier 3: Workshop Home (English Oak + Marble + Bronze + Amber + Garden plot) — home with a crafting station
  - Tier 4: Estate (Luminwood + Marble + Gold Ore + Crystal + Luminite + Bog Oak) — a grand home
  - Tier 5: Ancestral Hall (one of every material) — a legacy home that persists across sessions

#### Phase 2: Expansion
- Player expands outward from their home:
  - Garden plots (grow your own materials — herbs, simple woods)
  - Workshops (crafting stations near your home)
  - Storage buildings (keep gathered materials safe)
  - Decorations (fountains, statues, paths, lighting)
  - Defensive structures (walls, gates — for the Shadow Inn version)
- Each expansion requires specific materials from specific zones
- Expansions connect to the zone corridors — building a garden requires Garden Path materials, building a forge requires Forge Road materials

#### Phase 3: Community Formation
- When multiple players build near each other, the game detects a cluster:
  - 2-3 homes near each other = a Hamlet
  - 5-10 homes = a Village
  - 10-20 homes = a Town
  - 20+ homes = a City
- Communities auto-generate:
  - Shared resources (community garden, shared storage)
  - NPC services (merchant, guard, artisan)
  - Community buildings (well, market square, tavern, meeting hall)
  - Roads connecting homes to each other and to the Inn
- Community buildings require group contributions — multiple players gathering together

#### Phase 4: Village Identity
- Each village develops its own identity based on:
  - Which zones the villagers gather from most (a village near the Bayou becomes a swamp village; one near Norse becomes a Nordic settlement)
  - What they build most (a village of crafters vs. a village of explorers)
  - Which NPCs settle there (attracted by specific amenities)
  - The village's collective Fae reputation (good Fae relations attract Fae visitors)
- Villages get named by their founders
- The daily comic strip features events from active villages

#### Phase 5: World Expansion
- As villages grow, the world map expands outward from the Inn
- New zones unlock based on community size and exploration
- Villages establish trade routes with the Inn and with each other
- The Whisper Layer tracks village growth — the Inn remembers what was built and by whom
- Eventually, the world is a patchwork of player-built communities connected by roads, trade routes, and shared stories

### Building Mechanics

#### Plot System
- Grid-based plot system around the Inn (like SimCity zones)
- Plot types:
  - Residential (homes)
  - Agricultural (gardens, farms)
  - Commercial (shops, markets)
  - Industrial (workshops, forges)
  - Civic (community buildings, meeting halls)
  - Wild (left natural — attracts creatures, forages)
- Plots closer to the Inn cost more but have better access to corridors
- Outer plots are cheaper but require longer travel to gathering zones

#### Material Flow
The Inn's corridors are the supply lines:
- Garden Path corridor → supplies garden plots and residential wood materials
- Forge Road corridor → supplies industrial plots with metals
- Market Street corridor → supplies commercial plots with trade goods
- Each cultural zone corridor → supplies zone-specific building materials
- The further you expand from the Inn, the more infrastructure (roads, bridges) you need to build to maintain material flow

#### Community Buildings (requires group effort)
- Village Well (5 players: Limestone + Marble + Crystal + fresh water)
- Market Square (10 players: Sandstone + Bronze + Oak + Amber + Resin)
- Community Tavern (8 players: Oak + Honey + Beeswax + Hops + English Oak)
- Meeting Hall (15 players: English Oak + Yew + Limestone + Marble + Gold Ore)
- Village Gate (12 players: Bog Iron + Runestone + Limestone + Amber + Oak)
- Trade Post (10 players: Teak + Bamboo + Copper + Indigo + Lacquer)
- Fae Embassy (20 players: Luminwood + Luminite + Fae Dust + Fairy Silk + Resonance Crystal)

### Persistence
- Player homes persist between sessions
- Villages persist even when founders are offline (NPCs maintain them)
- The Whisper Layer records the history of every building — who built it, when, and what it was for
- Abandoned homes decay over time (materials return to the world) unless maintained
- The Inn never decays — it is permanent, the anchor

### Connection to Existing Systems
- **Gathering**: All building materials come from the corridor/zone gathering system
- **Marketplace**: Villages with commercial plots can host artisan listings
- **Creature Catalog**: Wild plots attract creatures; some creatures only settle near specific building types
- **Comic Strip**: Village events become comic strip content
- **Whisper Layer**: The Inn tracks what every player builds — the village is the visible record of community
- **Fae Kingdom**: Villages with Fae Embassies can access Fae materials without traveling to the Fae Kingdom
- **Shadow Inn**: The Shadow Inn version of villages shows what was built vs. what was abandoned

---

## Historical Architecture Recipes — Disassembly Method

Each historical building was reverse-engineered into its physical components, then each component was mapped to a material in a specific zone. The architecture IS the recipe — disassemble the building to learn what to gather and where.

### Recipe Count: 106 total
- 20 generic building recipes (Tier 1-5 foundation structures)
- 86 historically grounded recipes across all cultural zones

### By Tier:
- Tier 1 (Simple): 18 recipes — pit houses, lean-tos, mudhifs, roundhouses
- Tier 2 (Functional): 20 recipes — cottages, boathouses, storehouses, izbas
- Tier 3 (Ornate): 20 recipes — kivas, theaters, stoas, longhouses, stave churches
- Tier 4 (Master): 22 recipes — obelisks, pagodas, earth lodges, cliff dwellings
- Tier 5 (Legendary): 26 recipes — ziggurats, parthenons, great houses, canopies

### By Culture (disassembled buildings):
- Egypt: 6 recipes (Worker Hut → Mortuary Temple)
- Mesopotamia: 6 recipes (Mudhif → Ziggurat)
- Greece: 5 recipes (Megaron → Parthenon)
- Celtic/Camelot: 6 recipes (Roundhouse → Castle Keep)
- Norse: 6 recipes (Pit House → Stave Church)
- Slavic: 4 recipes (Izba → Cathedral of St. Sophia)
- China: 6 recipes (Tea House → Imperial Dragon Pavilion)
- India: 6 recipes (Chhatri → Royal Sandstone Palace)
- Peru: 5 recipes (Storage Hut → Sun Usnu Platform)
- Bayou: 6 recipes (Acadian Shelter → Grand Plantation Manor)
- Colorado Plateau: 5 recipes (Pit House → Great House Citadel)
- Yellowstone: 5 recipes (Sweat Lodge → Geyser Thermal Lodge)
- Superstition Mountains: 5 recipes (Ramada → Apache Leap Stronghold)
- Appalachian: 5 recipes (Lean-To → Great Smoky Homestead)
- Petrified Forest: 5 recipes (Flaking Shrine → Lithic Crystal Sanctum)
- Redwood: 5 recipes (Bark Sweat Lodge → Great Forest Canopy Longhouse)

### New Materials Added (7):
- Clay (Mesopotamia, Common) — river silt for mudbricks
- Baked Brick (Mesopotamia/China, Uncommon) — kiln-fired construction
- Bitumen (Mesopotamia, Uncommon) — natural asphalt mortar
- Lapis Lazuli (Mesopotamia, Rare) — deep blue trade stone
- Silk (China, Uncommon) — cultivated silkworm fiber
- Jade (China, Rare) — carved decorative stone
- Saguaro (Superstition Mountains, Uncommon) — cactus rib roof laths

### Total Materials: 72
### Total Building Recipes: 106

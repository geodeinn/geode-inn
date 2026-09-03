# THE WORLD GRID — BUILD SPEC FOR BUILDER
## Open-World Exploration + Passive Gathering System

---

## OVERVIEW

The World Grid is the explorable open space surrounding the Inn — the terrain between cultural zones. Darnassus-style (WoW) beautiful explorable world with ambient activities. No combat (in safe zones). No pressure. No timers. The player explores at their own pace, gathering resources that feed back into the Inn's crafting systems. The most relaxing space in the game — 42Hz plays softly, ley lines glow in the distance, the world is full of stones, plants, and water.

**The Core Loop:** OUT (travel grid, gather along ley lines) → IN (return to Inn, craft) → OUT (charge stones on ley lines) → IN (use charged items in games/quests/compositions). The gathering is the "out." The crafting is the "in." The World Grid makes "out" a place, not a menu.

---

## 1. WORLD GRID LAYOUT

### Structure
The grid surrounds the Inn (tree at center). The Canopy City (Clockwork Skies) is the hub. The player descends from the Canopy City to the World Grid through 9 cultural platforms. Each platform drops the player into a region.

### 9 Cultural Regions + 1 Outer Ring

| Region | Platform | Visual Style | Primary Stones | Primary Plants | Water |
|---|---|---|---|---|---|
| The Moorlands | Celtic | Green hills, stone circles, misty standing stones | Preseli Blue Stone, smoky quartz, Cairngorm | Heather, rowan, mistletoe, hawthorn | Cold springs, bog pools |
| The Fjords | Norse | Ice-cut valleys, aurora skies, runestones | Norwegian sunstone (calcite), thorium, labradorite | Cloudberries, juniper, angelica | Fjord waters, glacial streams |
| The Desert | Egyptian | Sand dunes, limestone cliffs, Nile oases | Lapis lazuli, carnelian, peridot, turquoise | Lotus, papyrus, frankincense | Nile (ley line river), oasis pools |
| The Ziggurat Plains | Mesopotamian | Floodplain, mud-brick ruins, reed marshes | Lapis lazuli, agate, jasper | Date palm, reed, licorice | Tigris-Euphrates (ley line rivers), marsh pools |
| The Bamboo Forests | East Asian | Misty mountains, terraced hills, jade temples | Jade, cinnabar, serpentine | Bamboo, ginseng, lotus, chrysanthemum | Mountain streams, terraced pools, koi ponds |
| The Monsoon Coast | South Asian | Tropical shorelines, temple ruins, jungle rivers | Aquamarine, moonstone, star sapphire | Sandalwood, neem, lotus, turmeric | Ganges (ley line river), jungle streams |
| The Andean Slopes | Andean | Terraced mountains, cloud forests, Inca trails | Rhodochrosite, Andean opal, sodalite | Coca, quinoa, orchids, lupine | Andean streams, glacial lakes |
| The Savannah | African | Golden grasslands, baobab trees, rock formations | Tiger's eye, citrine, malachite | Baobab fruit, acacia, aloe, devil's claw | Watering holes, seasonal rivers |
| The Songline Desert | Oceanic | Red earth, spinifex grass, monoliths | Opal, moonstone, zircon | Spinifex, eucalyptus, wattle, bush tomato | Waterholes (sacred), underground springs |
| The Outer Ring | National Parks | Varies (geothermal, forest, canyon, volcanic) | Yellowstone obsidian, Grand Canyon agate, Hawaii olivine | Varies by biome | Varies (geothermal pools, rivers, ocean) |

### Silk Road Routes on the Grid
Routes are PAVED PATHS through the grid. On-path: traders, waypoints, rest stops, NPCs, safe travel, stones charge while walking. Off-path: wild terrain, hidden veins, rare plants, undocumented water. Navigation by Ley Line Vision only. Off-path is where the rarest resources are.

### The Inn's Position
The Inn (tree) is at grid center. Always visible on horizon — canopy glows softly with 42Hz. The Inn is the compass. Lost players walk toward the tree. Canopy City is the hub — descend to any region through platforms, ascend back through platforms (fast travel) or walk to Inn base and climb Staircase (the long way).

---

## 2. THREE GATHERING PROFESSIONS

### 1. MINING (Stone Harvesting)

**Tool:** Tuning Pick — a crystal tuning fork that resonates with the stone's frequency to extract cleanly.

**Mechanic:**
- Mineral veins appear in terrain as outcroppings, color shifts, or crystal formations
- Player approaches vein, uses Tuning Pick
- Brief frequency-match: vein's frequency plays, player matches it
- Clean match = whole stone. Poor match = fragment (lower quality)
- 3-5 seconds per stone. No failure — poor matches yield fragments

**Stone Quality:**
- Raw (mining): 0% charge, base frequency
- Vein-charged (mining at ley line node): 10-30% charge
- Fragments (poor matches): usable on Bead Board but weaker. Combinable at Alchemist's Scale.

**Regional Stones:** Each region has unique veins. Lapis → Desert/Ziggurat Plains. Jade → Bamboo Forests. Rhodochrosite → Andean Slopes. Opal → Songline Desert. Preseli Blue Stone → Moorlands.

**Mining Skill Progression (100 levels):**
- Level 1-10: Basic veins (quartz, agate, calcite). Surface deposits.
- Level 11-25: Uncommon veins (regional specialties). Deeper deposits, off-path.
- Level 26-50: Rare veins (only at ley line nodes — charged on extraction). Requires Ley Line Vision.
- Level 51-75: Crystal caves (mini-dungeons with concentrated deposits). Requires charged stone to enter (cave entrance resonates with stone's frequency).
- Level 76-100: Hollow Earth minerals (through deepest caves connecting to Dark Reaches). Requires Deep Pearl charm.

**Visual:** Tuning Pick glows near vein. Vein color hints at stone type. Stone lifts from rock face with soft chime — the frequency played cleanly. The sound is the reward.

### 2. HERBALISM (Plant Harvesting)

**Tool:** Gathering Sickle (or by hand for common plants).

**Mechanic:**
- Plants visible as glowing spots (42Hz makes plants luminesce faintly, visible with Ley Line Vision)
- Player approaches, uses Sickle
- Brief "listen" — plant's frequency plays, player harvests. NO MINI-GAME. The calm is the point.
- Plants at ley line nodes: brighter glow, stronger frequency
- Some plants only grow at specific sacred sites

**7 Plant Categories:**
1. Frequency Herbs — enhance stone frequencies at Alchemist's Scale
2. Resonance Flowers — decorative for Bead Board (add frequency harmonics to arrangements)
3. Catalyst Ingredients — the Catalyst's perception-enhancing drinks
4. Cooking Ingredients — Jay's tavern food (exploration buffs: speed, frequency sensitivity, ley line detection)
5. Medicinal Herbs — healing for Hollow Earth RPG (only zone with combat)
6. Ritual Plants — druidic ceremonies, seasonal events, solstice celebrations
7. Dye Plants — color sources for Bead Board thread

**Regional Plants:** Each region has unique flora. Moorlands: heather, mistletoe, rowan. Fjords: cloudberries, juniper, angelica. Desert: blue lotus, papyrus, frankincense. Bamboo Forests: ginseng, lotus, chrysanthemum. Songline Desert: eucalyptus (tallest — connects surface to canopy), wattle (grows ONLY on ley lines).

**Herbalism Skill Progression (100 levels):**
- Level 1-10: Common plants (surface, visible without Ley Line Vision)
- Level 11-25: Uncommon (regional specialties, require Ley Line Vision to spot)
- Level 26-50: Rare herbs (only at ley line nodes, visible from distance)
- Level 51-75: Mycorrhizal harvesting (harvest from underground fungal network — dig at base of ancient trees). Requires crystal trowel.
- Level 76-100: Hollow Earth flora (crystal gardens' bioluminescent plants, growing on crystal not soil). Rarest herbs for most powerful alchemy.

**Visual:** Plants glow softly at 42Hz. Harvesting plays plant's frequency as soft chime. Plants regrow (real-time: 24h common, 3-7 days rare). The World Grid is LIVING.

### 3. FISHING (Water Harvesting)

**Tool:** Frequency Rod — crystal rod resonating with water's 42Hz, attracting frequency-attuned fish.

**Mechanic:**
- Player approaches any water body, uses Frequency Rod
- Cast line and WAIT. 42Hz plays softly. Fish attracted to frequency.
- When fish bites: vibration (haptic mobile, visual ripple desktop) → reel in
- The wait IS the mechanic. Fishing is the SLOWEST, CALMEST profession. The player who fishes is choosing to be still.
- Fish in ley line-charged water (rivers following ley lines) are more valuable
- Rare fish from underground ocean (Deep Pearl charm) are most valuable

**6 Catch Types:**
1. Common Fish — surface water. Cooking at Jay's tavern (buffs).
2. Ley Line Fish — ley line rivers (Nile, Ganges, fjord waters). Cooking + alchemy (stronger buffs).
3. Pearls — oysters (coastal waters, oasis pools). Bead Board (universal frequency matches — surface equivalent of Deep One pearls).
4. Aquatic Crystals — deep water (crystal-clear pools, underground springs). Bead Board (rare aquatic stones forming in water, not rock).
5. Deep Water Fish — underground ocean (Hollow Earth access). Trading with Deep Ones + most powerful cooking buffs.
6. The 42Hz Carp — The Source (Water Zone Layer 7). Rarest fish. Pure 42Hz. On Bead Board: doesn't add a frequency — AMPLIFIES every other stone by 10%.

**Fishing Skill Progression (100 levels):**
- Level 1-10: Surface fishing (rivers, lakes, common fish)
- Level 11-25: Deep fishing (clear pools, springs — uncommon fish, occasional pearls). Longer waits for better catches.
- Level 26-50: Ley line fishing (ley line rivers — ley line fish, aquatic crystals). Requires Frequency Rod.
- Level 51-75: Underground fishing (caves, springs — rare fish, deep crystals). Requires cave exploration.
- Level 76-100: Hollow Earth fishing (underground ocean — deep water fish, rarest catches). Requires Deep Pearl + Source Creatures' trust.

**Visual:** Water shimmers at 42Hz. Cast line glows faintly. Wait accompanied by water ambient + 42Hz drone filtered through water. Bite = bioluminescent splash. Each catch plays its frequency — fish ARE the water's frequencies expressed as life.

---

## 3. LIVING SYSTEMS

### Day/Night Cycle (Inn time, not real-world)
- **Day:** Plants easier to spot. Mining veins visible. Fish less active (deeper).
- **Night:** Plants glow brighter (42Hz luminescence visible without Ley Line Vision). Mining harder to spot. Fish more active (surface feeding). Ley lines MOST visible — golden threads against dark terrain.
- **Dawn/Dusk:** Best for rare gathering. Dawn fish (surface feeders). Dusk plants (closing flowers, concentrating frequency).

### Seasons (4 seasons, each 2 real-world weeks = 1 month cycle)
- **Spring:** Plants bloom (best herbalism). Rivers swell (best fishing). Mining normal.
- **Summer:** Plants mature (highest frequency yields). Fish go deep (harder). Mining veins exposed (best mining — less vegetation).
- **Autumn:** Plants change color (most beautiful). Fish feeding for winter (best variety). Mining normal.
- **Winter:** Plants dormant (herbs rare — mycorrhizal network only source). Rivers freeze (ice fishing special mechanic). Mining veins exposed (best — no vegetation, frozen ground helps extraction).

### Weather (Random Events)
- **Ley Line Storms (rare):** Ley line surges — all nodes on that line glow brightly, plants bloom, fish surface. Lasts 5 minutes. Most productive gathering window. Players online during a storm rush to the affected ley line.
- **Fog:** Reduces visibility. Plants harder to spot. But 42Hz drone is louder, clearer. Best for FREQUENCY-SENSITIVE gathering (hear nodes before seeing them).
- **Rain:** Boosts fishing (fish active). Slightly worse mining (loose stones washed). Boosts plant growth (herbalism better after rain).

---

## 4. LEY LINE VISION ON THE GRID

With Ley Line Vision unlocked, the World Grid reveals its hidden layer:
- **Ley lines** visible as golden threads crossing the terrain
- **Nodes** (sacred sites) glow where lines intersect — brighter at major intersections
- **Gathering nodes** on ley lines pulse with frequency — charged nodes (gold) vs neutral (silver)
- **The Inn** visible on horizon from anywhere — tree canopy glows with 42Hz, always home
- **Hidden nodes** only visible with Ley Line Vision: off-path veins, rare plants, sacred fishing spots
- **The mycorrhizal network** visible as a faint green-gold underground web — the biological ley line system. At high herbalism levels, the player can see the root connections between plants.

---

## 5. VISUAL STYLE

**Aesthetic:** Monet — impressionist landscape. The World Grid is painted in Monet's style: soft brushwork, light as primary subject, color as atmosphere. The 42Hz frequency is visible as a faint shimmer in the air (like heat shimmer above a road).

**Linework:** Soft flowing (lore style) for all natural elements — plants, water, terrain. No hard edges. The World Grid is the softest-rendered zone in the game.

**Per-Region Visual Accents (all within Monet framework):**
- Moorlands: soft greens, misty greys, standing stones as soft shapes
- Fjords: cool blues, ice whites, aurora greens
- Desert: warm ochres, deep blues, golden haze
- Bamboo Forests: misty greens, jade accents, terraced golds
- Monsoon Coast: tropical greens, temple golds, river blues
- Andean Slopes: terraced greens, cloud forest mist, glacial blues
- Savannah: golden grasses, earth browns, baobab shadows
- Songline Desert: red earth, spinifex gold, monolith oranges
- Outer Ring: varies by national park biome

---

## 6. AUDIO

- **Ambient:** 42Hz drone, soft and warm, filtered through the region's natural soundscape
- **Per-Region Sounds:** Each region has cultural ambient instruments (same as Silk Road regional instruments) played softly through electronica — oud in the Desert, koto in Bamboo Forests, hardanger fiddle in Fjords, etc.
- **Gathering Sounds:** Mining = crystal chime (stone's frequency on clean extraction). Herbalism = soft plant chime (plant's frequency). Fishing = water splash + fish's frequency tone.
- **Weather:** Ley line storm = 42Hz surge + all regional instruments swell. Fog = 42Hz amplified (the drone gets louder and clearer). Rain = natural rain + water-filtered 42Hz.
- **The Inn's Hum:** Always faintly audible from anywhere on the grid. Gets louder as player approaches the Inn. The Inn is calling the player home.

---

## 7. ENTITY UPDATES

### Update PlayerProgress:
- miningLevel (number 1-100, default 1)
- herbalismLevel (number 1-100, default 1)
- fishingLevel (number 1-100, default 1)
- miningXP (number, default 0)
- herbalismXP (number, default 0)
- fishingXP (number, default 0)
- currentRegion (string — which World Grid region the player is in)
- discoveredNodes (array of strings — gathering nodes found)
- seasonsExperienced (number — tracks season cycle progress)

### Create GatheredResource entity:
- playerId (string)
- resourceType (string: "stone"/"plant"/"fish"/"pearl"/"crystal"/"fragment")
- resourceName (string)
- resourceQuality (string: "raw"/"vein-charged"/"fragment"/"rare"/"legendary")
- region (string — where gathered)
- gatheringMethod (string: "mining"/"herbalism"/"fishing")
- gathererLevel (number — player's level at time of gathering)
- dateGathered (string)
- chargeLevel (number 0-100 — for stones/pearls)

### Create WorldGridNode entity (admin/system):
- nodeId (string)
- region (string)
- nodeType (string: "mining"/"herbalism"/"fishing")
- resourceName (string)
- rarity (string: "common"/"uncommon"/"rare"/"legendary")
- leyLineId (string — which ley line it's on, if any)
- isCharged (boolean — on ley line node)
- respawnTime (number — hours to regrow/regenerate)
- lastHarvested (string — datetime)
- coordinates (object: lat, lng — for world map placement)

---

## 8. CONNECTIONS TO OTHER SYSTEMS

- **Silk Road:** Routes are the paved paths through the grid. Off-path exploration is where rare resources are.
- **Stone Entity:** Mining adds new stones to player's collection. Regional stones only found in specific regions.
- **Bead Board:** Gathered stones, pearls, and aquatic crystals usable in compositions. Dye plants color the thread. The 42Hz Carp amplifies all stones by 10%.
- **Alchemist's Scale (Staircase):** Frequency herbs enhance stones. Fragments combine into whole stones.
- **Jay's Tavern (Campgrounds):** Cooking ingredients → exploration buffs. Fish dishes.
- **The Catalyst (Staircase):** Catalyst ingredients → perception-enhancing drinks.
- **Solstara's Shop (Campgrounds):** Resonance flowers as Bead Board decorative elements.
- **Hollow Earth:** Deepest caves connect to Dark Reaches. Hollow Earth minerals and flora at max gathering levels. Medicinal herbs for Hollow Earth combat.
- **Water Zone:** The 42Hz Carp from the Source. Underground ocean fishing. Deep Pearl charm unlocks deepest fishing.
- **World Map:** Ley Line Vision shows gathering nodes on the map. Regions are the World Grid's geography.
- **Cultural Mini-Games:** Each platform connects to its region's mini-game AND its World Grid region.
- **External Zone (National Parks):** The Outer Ring — 12 national parks as explorable regions with unique biomes.

> DEPRECATED - SUPERSEDED BY geode_inn_quest_integration_native_system.md. This document was designed for an AzerothCore/WoW emulator prototype. The Geode Inn now uses native game architecture. Kept for design reference only.
# Geode Inn — AzerothCore Zone & Instance Mapping

## Approach

Use AzerothCore's existing zone infrastructure as a functional prototype for the Fae Kingdom. Reskin starter zones to match the Geode Inn's cultural coverage, rewrite quests around how ancient peoples actually lived — building, writing, ritual, craft — and use existing instance architecture for catacomb-themed dungeon experiences.

## Starter Zone → Culture Mapping

### Zone 1: Teldrassil → Celtic/Druidic
**Original:** Night Elf starter zone — giant tree, forest, moon worship
**Geode Inn:** Perfect fit as-is. Tree architecture already matches the Inn. Reskin to Celtic/Druidic culture.
**Quest themes:**
- How the Celts constructed stone circles (build a mini henge)
- Ogham writing translation (glyph puzzle quests)
- Tree lore and sacred grove rituals
- Druidic seasonal ceremonies (calendar-based events)
- Oak/mistletoe harvesting for craft

### Zone 2: Elwynn Forest → Roman/Mediterranean
**Original:** Human starter — rolling hills, farmland, small town
**Geode Inn:** Roman or early Mediterranean civilization.
**Quest themes:**
- Roman engineering — aqueducts, roads, arches (construction puzzles)
- Latin inscription translation
- Mosaic-making craft quests
- Trade route establishment (economic quests)
- Republic citizenship systems (political quests)

### Zone 3: Eversong Woods → Egyptian/Persian
**Original:** Blood Elf starter — golden spires, ruined landscape, magic
**Geode Inn:** Ancient Egypt or Persia — golden aesthetic already fits.
**Quest themes:**
- Pyramid construction logistics (resource management)
- Hieroglyphic writing and translation
- Mummification process (ritual quest chain)
- Papyrus making and scroll preservation
- Astronomical observations (Nile flooding calendar)

### Zone 4: Durotar → Mesopotamian
**Original:** Orc starter — harsh canyon landscape, red rock
**Geode Inn:** Mesopotamia — canyon/desert fits Sumerian/Akkadian setting.
**Quest themes:**
- Ziggurat construction (tiered building quest)
- Cuneiform tablet writing (wedge-marking puzzle)
- Irrigation canal engineering
- City-state governance (faction reputation system)
- Epic of Gilgamesh reenactment (narrative quest chain)

### Zone 5: Azuremyst Isle → East Asian
**Original:** Draenei starter — crystal formations, island
**Geode Inn:** East Asian cultures (Chinese/Japanese/Korean).
**Quest themes:**
- Calligraphy and brush writing
- Pagoda construction
- Silk cultivation and weaving
- Jade carving (ties to stone database)
- I Ching divination (binary pattern puzzle)

### Zone 6: Howling Fjord → Norse/Viking
**Original:** Northrend starter — fjords, viking-style architecture, undead
**Geode Inn:** Norse/Viking culture — architecture already matches.
**Quest themes:**
- Runestone carving (rune puzzle quests)
- Longship construction
- Saga oral tradition (storytelling quest chains)
- Thing (assembly) participation — early democracy
- Burial mound rituals (connects to catacomb instances)

### Zone 7: Borean Tundra → Indigenous Peoples
**Original:** Northrend starter — tundra, tribal structures
**Geode Inn:** Indigenous cultures — Inuit, Plains peoples, etc.
**Quest themes:**
- Oral tradition preservation
- Totem carving and meaning
- Seasonal migration patterns
- Star knowledge and navigation
- Trade network establishment

## Catacomb Instances → Cultural Dungeons

| Instance | Original Theme | Geode Inn Culture | Catacomb Type |
|---------|---------------|-------------------|---------------|
| Scarlet Monastery | Cathedral/Crypt | Early Christian catacombs | Roman catacomb |
| Scholomance | Underground school | Mystery cult initiation | Greek/Eleusinian |
| Stratholme | Ruined city | Pompeii-style ruins | Roman/Italian |
| Shadowfang Keep | Gothic castle | Medieval European | Gothic crypt |
| Uldaman | Excavation site | Archaeological dig | Mesopotamian |
| Maraudon | Caverns | Minoan labyrinth | Greek/Crete |
| Blackfathom Deeps | Underwater caves | Phoenician sea caves | Mediterranean |
| Azjol-Nerub | Underground civ | Mesoamerican | Mayan/Aztec |
| Gundrak | Troll ruins | Mesoamerican temple | Mayan/Aztec |
| Drak'Tharon Keep | Drakkari ruins | Andean | Inca |
| Utgarde Keep | Viking hall | Norse burial mound | Norse |
| Utgarde Pinnacle | Norse tower | Norse watchtower | Norse |
| Halls of Stone | Titan architecture | Greek/Roman temple | Greek/Roman |
| Halls of Lightning | Titan fortress | Olympian forge | Greek |
| Zul'Gurub | Jungle temple | African temple complex | African |
| Zul'Aman | Forest temple | Mesoamerican | Aztec |
| Karazhan | Haunted tower | Medieval library | European |
| Sunken Temple | Underwater temple | Egyptian flooded tomb | Egyptian |

## Quest Design Philosophy

### "How They Did Things" Quest Categories

**Building Quests:**
- Collect materials (stone, wood, clay) from the environment
- Learn the construction method (mini-tutorial NPC)
- Build the structure piece by piece (phased quest — zone visually changes as you build)
- Example: "Construct an Aqueduct" — find the source, plan the route, build supports, lay channels

**Writing Quests:**
- Learn the script from a scholar NPC
- Translate inscriptions found in ruins
- Write your own inscription (interactive glyph selection)
- Example: "The Ogham Stones" — find 5 stones, translate each, reveal a hidden message

**Ritual Quests:**
- Gather ritual components
- Perform the ritual in correct sequence (ordered steps)
- Witness the outcome (cutscene/visual effect)
- Example: "Druidic Solstice" — gather mistletoe, build the fire, chant at dawn, receive blessing

**Craft Quests:**
- Learn from a master craftsman
- Gather raw materials
- Craft the item (crafting mini-game or multi-step process)
- Example: "Jade Carving" — select jade, choose pattern, carve (precision mini-game), polish

**Trade Quests:**
- Establish trade routes between settlements
- Negotiate with NPC merchants
- Transport goods (escort/defense quest)
- Example: "Silk Road" — escort caravan, defend from bandits, deliver to destination

## Faction Reputation Mapping

### Existing AzerothCore Reputation Ranks
Hated → Hostile → Unfriendly → Neutral → Friendly → Honored → Revered → Exalted

### Geode Inn Faction System
| Faction | Culture Zone | Friendly Unlocks | Exalted Unlocks |
|---------|-------------|-----------------|-----------------|
| Druidic Circle | Teldrassil/Celtic | Stone circle access | Rare stone: Preseli Blue |
| Roman Senate | Elwynn/Roman | Aqueduct engineering | Rare stone: Lapis Lazuli |
| Pharaonic Court | Eversong/Egyptian | Tomb access | Rare stone: Lapis Lazuli |
| Sumerian Priests | Durotar/Mesopotamian | Ziggurat interior | Rare stone: Carnelian |
| Jade Court | Azuremyst/East Asian | Jade quarry | Rare stone: Jade |
| Norse Allthing | Howling Fjord/Norse | Rune knowledge | Rare stone: Iolite |
| Tribal Elders | Borean/Indigenous | Star navigation | Rare stone: Turquoise |
| Seelie Court | Fae Kingdom (Summer) | Fae quests | Rare stone: Rainbow Moonstone |
| Unseelie Court | Fae Kingdom (Winter) | Shadow quests | Rare stone: Labradorite |

## Technical Implementation Path

### Phase 1: Prototype Server Setup
1. Set up AzerothCore locally (Docker or native build)
2. Connect with a WoW 3.3.5a client
3. Modify existing zone scripts with Geode Inn NPCs and quests
4. Test reputation and quest chains in a live environment
5. Document what works, what needs custom scripting

### Phase 2: Content Reskinning
1. Replace creature templates with Geode Inn character catalog
2. Rewrite quest text with cultural/historical content
3. Modify zone environment where possible (textures, objects)
4. Implement the reputation faction system for cultural factions
5. Add stone rewards to quest completion tables

### Phase 3: Port to Godot (Future)
1. Take proven systems from the prototype
2. Reimplement in Godot/GDScript with Base44 backend
3. Use the prototype as the design reference for the final game

## Next Steps

- [ ] Set up local AzerothCore server (Docker)
- [ ] Verify zone loading and modification capability
- [ ] Start with Teldrassil reskin (closest to existing Inn aesthetic)
- [ ] Write first quest chain: Celtic stone circle construction
- [ ] Test reputation system with two factions (Seelie/Unseelie)

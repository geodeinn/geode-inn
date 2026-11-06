# Part 2: World, Levels and Zones

This part covers the shape of the Inn and the world around it: the tree, the levels, the half-levels, the ways between floors, the open world, every zone and room on record, the laws for building a room, and the templates for a Zone and a Room.

Status marks used throughout:

- **Ruled**: the client decided or agreed (date given).
- **Proposed**: Elio suggested it and she has not ruled.
- **Open**: waiting on the client.
- **August canon**: written into Before the Song (late August) with no recorded ruling. Used for those items unless a later ruling replaced them.
- **Built (commit, date)** or **Ruled (commit, date)**: from the commit log of Aug 21 to Aug 31. "Ruled" is used only where the message says the client ruled.

Characters, music detail, the art pipeline and data entities have their own parts. Where a zone depends on one of those, the link is named.

## Where it started (July 12 to August 30)

The manual's later sections come from the chat of Aug 31 to Oct 15. The founding period is covered here and in the marked additions inside each section ("Earlier:" notes, section 1.9, section 6.10). Sources are the early chat (Jul 12 to about Aug 23), Before the Song (the compiled canon document of late August) and the commit log (Aug 21 to Aug 31).

- **Jul 12: the premise.** Every time a player wins a level, a gem forms in the baby dragon's cave. Ruled (original premise, stated in the early chat on Jul 22). Elio framed it as alchemical transmutation in miniature.
- **Jul 22: the name.** The working brand was "Soulstice Game Hub". The client renamed it Geode Inn the same day, and the game and the archive became one project, one app, one world. Ruled Jul 22. The name is also a nod to Odin ("Geodin") and his ravens.
- **Jul 22: the shape.** A giant tree with a hobbit-hole feel. Upstairs (the branches) holds sky gods and the universe. The main floor holds the Inn itself. Downstairs (the roots) holds catacombs, mausoleums and buried civilizations. The staircase between is the alchemical chamber. Elio proposed the names and the client agreed. Ruled Jul 22.
- **Jul 22: the one firm rule.** The Inn is a neutral learning hub. It does not rank or editorialize. A "Modern Day Legends" nook sits off the main floor beside readable copies of the modern religions. Ruled Jul 22.
- **Jul 22: the Fae Kingdom.** A whole area in the basement section, with Seelie and Unseelie courts, stone circles as portals, and an MMO-style layout. Winning Standing Stones (Stonehenge) opens the first door. Ruled Jul 22. Ancient sites as themed puzzle games was ruled the same day.
- **Jul 22: the tree had to be walkable.** The first build was an amethyst geode wall landing page. The client wanted a walkable, organic, Darnassus-style tree and said it was "still not finding a way to interactively be inside the tree" after two builder passes. Elio's prototype was "much closer".
- **Aug 18: the Inn is Yggdrasil.** Elio mapped the Nine Realms onto the Inn and the client agreed. Ruled Aug 18 (section 1.9).
- **About Aug 20: an open world.** The client decided the game is "an Azeroth looking world that can be solo or multiplayer", with each culture doing "don't starve or stardew valley type quests". The arcade games became activities inside regions instead of separate menu items. Ruled about Aug 20.
- **Aug 21 to 22: the first big zones.** Underwater layer and Atlantis (Aug 21), the Canopy of Sala (Aug 21, approved), the Terracotta Army, Camelot, Greece, the Redwood Cathedral, Clockwork Skies, the Bayou, lighthouses and the tidal caves star gate (each at the client's request, Aug 21 to 22). Section 6.10 lists them.
- **Aug 22: the tree is an Ent.** The Inn-Tree is literal, "never metaphor" (Before the Song; commit log, Aug 22). August canon, Built (commit, Aug 22). The Sep 1 chat later ruled the same idea (section 1.1).
- **Aug 24: five hubs.** One hub per Inn level and one per exterior gateway (section 1.9). Built (commit, Aug 24).
- **Aug 27 to 30: nine levels and 37 zones.** The commit log records a nine-level master build ("ALL 9 LEVELS COMPLETE", Aug 27) and a count of 37 zones (Aug 29 onward). The Godot world map used 37 pins (Built, commit Aug 31).

Source files to start from:

- `docs/zones/geode_inn_master_level_system.md` (the level list, including Level ½ and the Void).
- `docs/MASTER_STRUCTURE_BLUEPRINT.md` (the Room Kit Law and every room, level by level).
- `docs/library/specs/zone_mapping_template.md` (the zone template and the z01-z37 list).
- `docs/zone_specs/` (about 220 zone, chain and law specs; the walkthrough dissections D01-D16 are here).
- `docs/blueprints/` (`inn_tree_3d_data.json`, the viewer, the Room Items Blueprint, the slow-walk parcel).

---

## 1. The Inn and its cosmology

### 1.1 What it is

**What it is.** The Geode Inn is a living tree that grew itself a home. The Inn-Tree is a sentient ancient Ent. Its gargoyles are its sense organs, its 42Hz hum is its heartbeat, and the catacombs are its roots (Sep 1 chat; repo `geode_inn_nine_levels_master_spec.md`). The building is laid out like Yggdrasil: branches up, roots down, the staircase as the trunk (Sep 12). The rule of thumb for mapping Norse material is "the tree IS Yggdrasil" (Oct 14).

Founding lines, all Ruled:

- "The Inn doesn't hand you a flag. It hands you a room." The Inn is the power of what MAY be, not good or bad (InnCore, decided Sep 1).
- "The Inn was not built. It was remembered." (Master Storyline, Sep 3.)
- Nothing in the Inn is a rental. Players keep things that have their names on them (design law, Sep 25).
- The Inn is a transducer. Dynamic drivers are stones, balanced armatures are characters, electrostatics are cosmology, bone conduction is the 42Hz Song (Sep 3).

**The Hub.** The Godot hub is an Ironforge-style structure: the Great Forge or hearth at the center of the Main Floor, with corridors out to the Arcade, Market, Archive, Common Room, Composer, Campgrounds, the Staircase (down to the Catacombs) and Cosmology (up). Ruled Aug 31. Per the Sep 2 note, the live web menu lists Cosmology, Clockwork Skies, Main Floor, Campgrounds, Staircase, Arcade, Market, Common Room, Archive and Composer.

Earlier (Jul 22 to Aug 22): the Inn began as "an inn made of geodes", where the geode is the architecture and every room is a crystalline pocket in ancient stone. Elio's first tagline framed it as a hospitality sanctuary of geological wonder, and the client liked the hospitality idea (early chat, Jul 22). The living-tree idea came the same day. On Aug 22 Before the Song and the commit log made the tree literal: the Inn-Tree is an ancient Ent, and the Inn is its body. The Sep 1 ruling above stands. The founding cosmology is in section 1.9.

### 1.2 The three states (tri-mode)

Every zone, room, character, creature and item has up to three states. This is called tri-mode. Ruled from Aug 31, restated many times.

| State | Frequency | Meaning |
|---|---|---|
| Living | 42Hz | The painting in progress. The default. Warm. |
| Shadow | 84Hz | The finished painting, the octave of 42Hz. Not evil. Hollow Earth RPG and shadow wisps appear only here. |
| In-Between | grey | The seam where 42 and 84 harmonize. Lost items and forgotten NPCs live here. |

Rules that go with it:

- The flip between states is a hard cut, a "tectonic" flip (about 450 ms), never a crossfade. Both states strain against each other at the seam (Sep 4, Sep 10).
- The Shadow version of any image is made by the spectral-shift script, never hand-tinted (Sep 10, Background Law Sep 11).
- The Pulse Line (50 BPM heartbeat trace) drives the tri-mode animation.
- Toggle key: T (Tab in one early description; the Godot input map says T). Switch: ZR.
- Reversed Staircase and "the Other Door" (charcoal stone, no handle, 84Hz) are the way into the Shadow Inn.

Load-bearing frequencies (Sep 11): 7.83Hz (Earth, Schumann), 42Hz (the Song), 50 BPM (the Inn's heartbeat), 84Hz (Shadow), 111Hz (gargoyle/oracle). Other values in play: 40Hz (the Sleeping Giants, threshold), 41.7Hz (the Constant's previous-cycle Song), 44Hz (the future that must not arrive), 0.3Hz (Cosmic Egg and Void pulse), 432Hz (Atlantis Heart Crystal). The 32,768 Hz quartz stays outside frequency canon as a teaching example (Sep 12). Detail belongs to the music part.

### 1.3 The levels

The nine levels of the tree, as ruled in the master level system (restated by the client Oct 14). Top to bottom:

| Level | Name | Short description | Gathering space (Gathering Law) |
|---|---|---|---|
| 1 | Cosmology (the Canopy) | Sky gods, oldest light, the Observatory, Valhalla. The quietest level. | Constellation Balcony (Proposed) |
| 2 | Clockwork Skies | The airship Arcana and its crew. The mechanical layer between tree and stars. | The Grand Escapement (Proposed) |
| 3 | Main Floor (the Hearth) | The social hub. Market, bar, arcade, library nook, music room. Warmest level. | Market Common (exists) |
| 4 | Campgrounds (the Exterior) | The faire front porch. Market field, tavern, forge, woods, loch. | The Campfire (exists, the model space) |
| 5 | Staircase | Alchemy and transformation. Music rises in key as you climb. | The Stage (Ruled community venue, Sep 10) |
| 6 | Catacombs (the Archive) | Ancient civilizations, the Ragana's Archive, the memory layer. | Reading Ring, Scribes' Court (Proposed) |
| 7 | Fae Kingdom (the Roots) | Seelie and Unseelie courts, stone circle portals, the Between. | Masquerade Hall (exists) |
| 8 | Water Zone (the Deep) | Seven-layer water system, lighthouse, Katya's Cove. | Lighthouse Gallery (Proposed) |
| 9 | Undercity (the Deep Roots) | Klimt-gold gothic, the forge, the Clockmaker, the Turning. | Memory-Lamp Commons (Proposed) |

Under the roots sits **Hollow Earth** (section 1.6). The **Silo** is a vertical spine that connects levels; it is not a floor. Outside zones (French Quarter, Standing Grove, the wilds) belong to the world grid, not the structure (Oct 14).

Source: `docs/zones/geode_inn_master_level_system.md` (note: the repo copy still carries many "NOT YET DESIGNED" gap flags from Aug-Sep; later specs filled most of them). Level docs: `docs/zones/geode_inn_level1_cosmology_complete.md` through `geode_inn_level9_undercity_complete.md`, summarized in `docs/zone_specs/geode_inn_nine_levels_master_spec.md`.

Each level has its own frequency feel, light source and artist style (Cosmology quietest, Main Floor warmest, Catacombs deepest). The Gathering Law (Sep 10, Ruled) says every level holds at least one gathering space. See `docs/zone_specs/geode_inn_gathering_spaces_master_spec.md`.

Numbering has changed over time. See "To reconcile" at the end. The latest numbering is the Oct 14 one above, and it wins.

Earlier (Jul 22 to Aug 27): the first scheme had three layers only, upstairs, main floor and downstairs, with the staircase between (Ruled Jul 22). Before the Song carries two later schemes. The walk-through scheme lists Cosmology Level, Staircase, Clockwork Skies, Canopy City, Main Floor, Catacombs, Bedrock Fortress, Prism and Water System. The Master Storyline scheme (Aug 22) lists Upstairs, Main Floor, Staircase, Downstairs, Dock and Miskatonic Annex, mapped to the Nine Realms (August canon). The commit log of Aug 27 built the nine-level master build (Level 1 Cosmology, 2 Clockwork Skies, 3 Main Floor, 4 Campgrounds, 5 Staircase, 6 Catacombs, 7 Faerie Kingdom, 8 Water Zone, 9 Undercity "FINAL LEVEL"). That list matches the Oct 14 numbering (Built, commit, Aug 27). Dali's cosmology level and Matisse's staircase were also written up as aesthetic documents on Aug 22 (early chat).

### 1.4 The half-levels

**Level ½: the In-Between.** Ruled Oct 14 (Elio proposed "Level ½"; the client agreed; commit `bd44b74`). It is listed in the master level system but it is never a numbered floor. Elio had first floated "Level 10" and recommended ½ instead.

- It is the threshold between Living (42Hz) and Shadow (84Hz): grey, weightless. Einstein lives there.
- Entry is through the Other Door behind the Archive, and by Pulse Line shifts in tri-mode zones. All Fair Descent options pass through it.
- The Blue Box keeps its navy color in the grey, door slightly ajar, warm light, the 50 BPM heartbeat felt through the crack.
- Its game is the In-Between platformer, playable from every zone's flip. The game IS the state.
- Do not confuse it with **The Between**, the Fae borderland held by the Norns (Sep 10 disambiguation).
- Elio noted it is the fourth Sleeper's dream (Deep Roots). Proposed, not ruled.
- Earlier (Aug 24): the In-Between first appeared as "the Neverwhere layer", not a hub or zone but the space between: staircase landings, corridors between hubs, door thresholds, pauses in the music (Before the Song and commit log, Aug 24; August canon). It is grey, weightless, and the Inn's corridors tilt two degrees there. It rewards noticing, where hubs reward action. Its population: Grey Walkers, Forgotten Doors (unlocated, not locked, for example on the staircase's seventh landing), the Grey Market (currency is unfinished, interrupted stories) and the Crone's shadow, which measures the spaces between her measurements. The patron creature is the Vessel. Before the Song also places the Muses' Room here, with nine empty chairs and nine whispers the player cannot understand, and the Egg's chamber at the bottom, below the Undercity. This matches the Oct 14 ruling that the In-Between is a threshold and not a numbered floor.
- Earlier (Aug canon): the In-Between is also a Limbo-style platformer, one continuous descent in five sections from the surface to the crystal, with a surface version and an Undercity version. The game is the zone, not a game set inside it. The commit log (Aug 25 to 26) records the In-Between platformer docs and greyscale art. This is the game the Oct 14 entry above calls "the game IS the state".

**The Void.** Ruled Oct 14, same night: the Void has its own half-level, sibling to the In-Between. Never a numbered floor. The In-Between is the space the building passes through; the Void is the silence the building is built around. Its game is The Rest (#65): no reward, the heartbeat is the melody, silence is the score. Its gathering space is The Rest, the only one whose shared activity is silence. Spec: `docs/geode_inn_the_void.md`. Details beyond that were "not shown" in the chat; treat the designation as filed, the content as thin.

**Ragnarok** is not a zone. It is an event across existing levels (Ruled Oct 14). The final level for the Norse components is Cosmology. Phase 1 weaponizes six instanced Shadow Inn zones; phase 2 turns Cosmology into the battlefield. Spec: `geode_inn_ragnarok_master_spec.md`.

### 1.5 The Fair Descent Law and ways between levels

**Ruled Oct 14** (spec commit `38454fc`, file `docs/zone_specs/geode_inn_fair_descent_movement_spec.md`). Vertical travel has four first-class options, none marked as "the accessibility one":

| Option | What it is |
|---|---|
| Stairs | The default walk. Acacia stairwell, Flower of Life floors (Oct 13), Pulse Line breathing at 50 BPM. One option among several. |
| Slide | Made of the Inn's structural acacia with glowing Klimt patterns (Oct 14). Rider can leave on any floor. Lands in pillows with startled Greeblins (the landing crew, closed gate Oct 14). |
| Blue Box | The TARDIS-style elevator. Any floor on request. Bigger inside than outside, so a wheelchair and companions ride together. Calm hum. |
| Tubes | Futurama-style transport tubes. The tube is the trip. |

The law, written to survive future builds. Every vertical option must:

- Reach every floor equally.
- Never mark its user.
- Be enviable, not apologetic.
- Land soft (No-Fail holds at every arrival).

Arrival sound (Ruled Oct 14, commit `335f0b7`): each option announces a floor with the first few notes of that floor's own music. The Blue Box plays the floor's opening motif before the door opens.

Open: the Blue Box's true name (the TARDIS label is a placeholder); which tube stop is built first.

Other ways between places:

- **No fast travel, ever.** Every door hums its destination (Sep 10).
- **Hard seams (Norrath-style zone lines).** A few thresholds get a heartbeat and a loading pause. The Catacombs seam is the first. Trouble dragged to the line "waits on the other side" (Oct 4-5). Everything else is a soft seam. Oriel is the company at every hard zone line (Ruled Oct 9, commit `891ad8e`). Count and placement of hard seams is not formally ruled.
- **Entry walls and the Knock Law** (Oct 5, commit `a1b5024`, `geode_inn_entry_wall_knock_law_spec.md`). Each zone entry has a wall in the zone's art style with portraits of its characters (click 1 sassy, click 2 more depth, click 3 full backstory) and a Stargate-style view of the destination. Each zone has a knock, a rhythm tapped on wood. A wrong knock never locks. Alphabets per zone are ungated. Open: true Morse versus the Inn's own rhythm dialect.
- **Portal circles.** Stone circles are the portal system the Fae Kingdom hangs on. Winning Standing Stones activates the first portal (Aug 31). The red-headed giants built them (Sep 14, Proposed rules).
- Earlier (Jul 22): stone circle portals were part of the first Fae Kingdom ruling. Stonehenge (Standing Stones) is the first; Avebury, Callanish and the Ring of Brodgar are named as the others. Ruled Jul 22. Before the Song adds that each portal opens when its arcade game is completed (August canon).
- Earlier (Aug 24): portals are character-based, with no glowing portals. Eight portal characters, eight methods: the Pirate sails, Charon poles, the Guest walks, the Owl gives one word, the Cartographer gives a map, Belladonna (earlier Wednesday) walks, the Stone Circles hum, and Cthulhu describes from memory. One rule: a portal character takes the player only to a zone they have a reason to go to, "the reason is the permission" (Built, commit, Aug 24). This does not conflict with the Sep 10 rule that every door hums its destination, but the two have not been joined in one spec.
- Earlier (Aug 22): the tidal caves hold a second kind of circle, a natural stone circle carved by the ocean with pulsing liquid at 50 BPM. Surface stone circles go to the Fae Kingdom; the cave circle goes to Atlantis. The client decided on this star gate (early chat, Aug 22, Ruled). The selkie walks through without syncing; everyone else must be still. Section 1.9 has the water path.
- **The square and compass** (Ruled Sep 22, with the Mason game). A permanent backpack tool. Open it, choose a known zone and era, jump; "take me back to where I was". No cooldown, no travel tax; walking stays an option.
- **The Silk Road** and the **World Walker** (cloak of six zones) are the horizontal counterparts.
- **Valkyrie Shift** is a TV-platform threshold (remote layer 42Hz to controller layer 84Hz), not an in-world travel route.

### 1.6 Hollow Earth, the Grand Collision and the deep

- **Hollow Earth** is a crystal city beneath all zones, with an RPG layer, isometric, nine districts and three factions. Entry tunnels: North Pole crystal spiral, South Pole geode cathedral, and the Dark Reaches. It is reachable at 84Hz only, per the Aug 31 note. Specs: `docs/zones/geode_inn_hollow_earth.md`, `geode_inn_hollow_earth_build_spec.md`, `docs/zone_specs/geode_inn_hollow_earth_district_pass.md`.
- **The Grand Collision**: all 37 zones flow down the roots and converge. "The crystal city is 37 paintings in one room." Each artist is a layer of geology; the eleventh layer is the Inn's own voice (the Archive District). O'Keeffe holds the visual key (Ruled Sep 4).
- **The Dark Side of the Inn**: the innermost chamber, a 30-foot crystal sphere where 42Hz is visible as flowing liquid light. Built last. Unlocked by progress. Build sheet: ten tasks. Spec `geode_inn_dark_side_master_spec.md`.
- **Deep Roots and the Sleeping Giants** (below the Catacombs): five Sleepers (Gravity, Time, Matter, Consciousness, Void) dreaming at 40Hz around the Cosmic Egg, which beats once every 3.3 seconds (0.3Hz). The Heartbeat Altar sits in the fourth sleeper's chest cavity. Ruled Sep 10; restated Oct 14. National-park giants map to these forces (section 1.8).
- **Bedrock Fortress and the Prism** (D16): the bottom of the tree. The Prism is the icon room, a sound-to-light transformer pulsing at 50 BPM. Listed in the Sep 10 blueprint as "Level 2" in that blueprint's own numbering.

### 1.7 Laws of the whole world (short list)

These are Ruled unless marked. They apply to every zone. Longer notes are in section 3.

- Anti-Skinner (no compulsion loops, no streak guilt), No-Fail (failure is information, never shame), Honest Label (everything real is labeled and dated).
- Steady Light (Sep 11): no strobe, sine-clamped, candlelight-class flicker only.
- Sanctuary: no combat in safe spaces; nobody steals.
- Toll Booth (filed Sep 25): every zone intent needs a price, even the no-fail ones. Cost can be soft (time, a kept promise) but it must be charged.
- Year-and-a-Day, Both-Real, Whimsical-Macabre (dead are met, not cleared).
- Bob Doctrine: everything starts as Bob and earns a name. Naming sessions belong to the client alone.
- Recurring-figure law (Oct 9): a face that recurs uninvited across zones is load-bearing whether ruled or not.

### 1.8 The open world: world grid, world map, parks and regional zones

**The World Grid.** The explorable space around the Inn, Darnassus-style, no pressure, 42Hz ambient. The Core Loop: out to gather, in to craft, out to charge, in to use. Ley lines follow rock. Gargoyles guard thresholds at 111Hz. Safe zones within two "zones" of any platform; wild zones beyond. Spec `docs/zone_specs/geode_inn_world_grid_master_spec.md`, entity `WorldGridNode`.

The repo spec says "9 Cultural Regions + 1 Outer Ring" but its table lists eight regions plus the Outer Ring:

| Region | Platform | Artist (per repo) |
|---|---|---|
| The Moorlands | Celtic | Book of Kells |
| The Fjords | Norse | see spec |
| The Desert | Egyptian | O'Keeffe line |
| The Ziggurat Plains | Mesopotamian | see spec |
| The Bamboo Forests | East Asian | see spec |
| The Monsoon Coast | South Asian | see spec |
| The Andean Slopes | Andean | see spec |
| The Savannah | African | see spec |
| The Outer Ring | all | the ocean; the Hollow Earth's ceiling made visible |

**Related rulings.**

- The Deep Map (Ruled Sep 19): a historical-density overlay on the ley-line grid, with a dig mechanic. At the bottom the record fades: "here the record ends". Never invent history.
- Three Gathering Professions (Ruled Sep 19): Mining, Herbs, Woodcutting. No node competition.
- Geography law (Ruled Sep 11): three independent axes, surface, underground, water. Any site may combine them (Egypt spans all three).
- Ley Line Vision is the fifth world-map layer (Clockwork Skies, Sep 2). Twelve primary ley-line nodes. Newgrange is the ninth node (Sep 11).
- World Map screen: parchment flythrough frame (Ruled Sep 9) is the world-map header. The live site's map had 20 pins (Aug 31); the canon map has 37 pins (z01-z37).

**National parks and the hinge.** Five giants, five forces (Ruled Sep 10): Appalachians = Time, Yellowstone = Matter, Colorado Plateau = Consciousness, Rockies = Gravity, Superstition = Void. Five key chains: Thought-key (Plateau), Weight-key (Yellowstone), Gap-key (Superstition), Pull-key (Rockies), Wait-key (Shasta). Mount Shasta is a "hinge zone" with dual citizenship (Modern Legends nook and Silk Road node #8), tuned to 84Hz. The Sep 3 note speaks of "9 parks"; the five-park structure is later and wins. Specs: `geode_inn_external_zones_national_parks_master_spec.md`, `geode_inn_parks_sweep_master_inventory.md`.

Earlier (Aug 22 to Aug 31): the parks began as a seven-park chapter called "The Veil" (Yellowstone, Grand Canyon, Great Smoky Mountains, Olympic/Hoh, Mammoth Cave, Crater Lake, Canyon de Chelly), each with a ranger and a veil-piercing mechanic (Built, commit, Aug 22; early chat). The client then added Fae below the parks: redcaps below Yellowstone, gnomes of the Appalachians, Unseelie below the Colorado mountains, Celtic wood elves and sprites, Smoky Mountain trolls, Utah thunderbirds and draconians, the Canadian Rockies (Banff, ammolite), the badlands "ether" and Superstition Mountain (Ruled, about Aug 22). The commit log of Aug 27 counts 8 US parks and 4 international parks with a ranger system and a Park Journal. Before the Song lists more than twenty park names and a four-layer park system (surface critters, Fae, cryptids, regional creatures). It also gives the Appalachian Fae a five-layer stack: gnomes, trolls, Little People, wood elves, sprites (August canon). Parks are where the Inn meets the Earth. The five-park structure with five giants (Sep 10) replaced these early counts. See "To reconcile".

**Regional and cultural zones.** The nine cultural platforms hang off Canopy City (Egypt, Southeast Asia, Celtic, Andes, Polynesia plus four more; five painted Sep 10). Individual zones are listed in section 6.

Earlier (Aug 20 to Aug 24): the open world began as six blueprints (the world map structure, then South America and Mesoamerica; Europe; Africa and Middle East; Asia and Oceania; North America and Arctic), written about Aug 20. Each blueprint had NPCs with presence, quest chains with geography, companion creatures, ambient life, sound and stone rewards. The outputs themselves are not shown in the early chat. Elio proposed one quest style per culture after the client's Azeroth direction: Peru as Don't Starve survival, Celtic regions as Stardew-style community, Egypt as archaeology puzzles, Scandinavia as exploration and survival, Romania as deep lore, Japan as seasonal and contemplative, Mesopotamia as resource management (Proposed; the open-world direction itself was Ruled). The Aug 21 "Norrath style" spec covered four zones: Egypt, Norse Fjords, Peru and the Celtic Sacred Grove (the Celtic grove had seven quests and is the gateway to the Fae Kingdom). The commit log of Aug 24 adds the dig system: dig down in the catacombs, hit water, switch to underwater exploration (Built). World map pin layers on Jul 22 were stone, lore, game site, water-body and Fae portal pins; castle, US catacomb and ancient mound pins came Aug 19. The Jul 22 lore base was a Drive folder of about 200 country folders. The 37-pin world map came later (Aug 31, commit log).

### 1.9 Founding cosmology (July 12 to August 30)

This subsection holds early canon that the later sections do not repeat. Where a later ruling differs, the later ruling wins and the difference is under "To reconcile".

**The Nine Realms (Yggdrasil mapping).** The Inn is Yggdrasil and the Nine Realms are its quest architecture. Elio proposed the mapping and the client agreed, Aug 18 (early chat, Ruled). The Master Storyline (Aug 22) restates it with unlock rules (August canon). The Oct 14 level list is the structure; the realms are a layer of quests and access on top.

| Realm | Place in the Inn | Theme | Status |
|---|---|---|---|
| Asgard | Upstairs, cosmology | The Allfather, sky gods, knowledge quests ("what will you give to know?"); the endgame realm | Ruled Aug 18; unlock rules August canon |
| Vanaheim | Upstairs nature wing, the Sacred Grove | Vanir gods Freyr and Freyja, seasons, seidr magic, the Gardener | Ruled Aug 18; Freyr and Freyja Built later (commit, Aug 27) |
| Alfheim | Fae Kingdom, Seelie Court (Summerlands) | Riddle and wit quests, golden and green; opens by completing the Celtic stone circle | Ruled Aug 18 |
| Midgard | Main floor | Human world, market, building and trade; the cultural zone quests live here | Ruled Aug 18 |
| Muspelheim | The Staircase | Fire, forging, alchemical crafting; Miracle Max's shop | Ruled Aug 18; shop undesigned in August |
| Nidavellir | Deep workshops below the catacombs | Dwarf master craftsmen, masterwork crafting (also called Svartalfheim in one list) | August canon |
| Svartalfheim | Fae Kingdom, Unseelie Court (Aug 18 mapping) | Shadow and trial, the five-zone Labyrinth | Ruled Aug 18 |
| Jotunheim | Deepest catacombs and border zones | Giants as primal forces, boss and endurance quests, six no-combat survival trials | Ruled Aug 18; chain of six quests (early chat) |
| Niflheim | Frozen catacombs, the deep | Ice, primordial waters, preservation, archaeology (Otzi, bog bodies) | Ruled Aug 18; content thin |
| Hel (Helheim) | Deepest catacombs, the Stone Circle Chamber | The dead, ancestors, Charon, Anubis, Ammit, the Morrigan; "not the Christian hell" | Ruled Aug 18 (Hel the being was a High-priority gap, Aug 22) |

Other rules in the same canon (all August canon):

- The Staircase is the Bifrost: stone steps with colored runes that light when a realm unlocks, "a rainbow bridge made of stone and rune, not light". Each realm begins with an illuminated rune-letter (Asgard Ansuz, Vanaheim Wunjo, Jotunheim Thurisaz, Niflheim Naudiz, Hel Hagalaz).
- Six access tiers: Midgard first; then Muspelheim and Nidavellir; then Alfheim and Svartalfheim (needs the Fae portal from Standing Stones or the Celtic stone circle chain); then Jotunheim and Niflheim; then Vanaheim and Asgard; Hel last. Reputation tiers are Friendly, Revered and Exalted, with "at least 2" or "multiple" cultural factions.
- The Staircase's music rises one semitone per step, a full octave top to bottom. Each floor shifts up a half step.
- The Drive "Master Storyline" doc counted 17 fully developed layers, 20 needing development and 8 missing (Aug 22). It was updated Aug 24 to 37 developed, 12 needing development and 4 missing (Built, commit, Aug 23 and 24).

**The Inn as an Ent.** The living tree is literal: "it was never metaphor". The Inn-Tree is the oldest Ent, forgot its own name, does not speak, and talks through the Song of Making. August canon (Aug 22). Built (commit, Aug 22).

- Body map: the Main Floor is the heartwood hollow (heart, fire, the Host); the Staircase is the trunk; the Catacombs are the roots, grown through stone and not carved; the Cosmology level is the canopy; the Geode Cave is the core, where heartwood meets the earth's crystal and the Keeper lives.
- Three kinds of Ent: the Inn-Tree, the four Story-Born (Wayfarer, Hearthkeeper, Mourner, Laughing One) and the small Fae Kingdom Ents.
- The Inn-Tree grows from a sleeping giant's heart. The catacombs are the ribcage and the stone circles are vertebrae (Built, commit, Aug 23). The giants dream the Song and the dreams are the weather. In the early chat (Aug 22) the client added the Rock Biter idea from The NeverEnding Story and the Apus of the Peruvian zone as sleeping giants.
- The Brownies are the Inn's immune system. If they withdraw, floors gather dust and the 42Hz hum gets muddier. The Brownie Revelation (commit log, Aug 29) says the fizgigs are the Owl's unwitting infrastructure.
- Gargoyles are the senses: Watcher 111Hz guards the staircase entrance; Listener 64Hz the catacombs entrance; Sage 528Hz the Modern Legends nook; Gatekeeper (variable) the Fae portal, and the only gargoyles that move; Caller 432Hz the cosmology level; Keeper (adaptive) the Geode Cave. Together they are the chord that "IS the Inn". Their frequencies are signatures on the Golden Contract.
- The Golden Contract is a golden scroll on a Preseli Blue Stone pedestal at the deepest point of the Fae Kingdom, below the Stone Circle Chamber. Aligning the six Standing Stones finds it. August canon.

**Hubs and the exterior (Aug 24).** The Inn has five hubs, one per Inn level and one per exterior gateway (Built, commit, Aug 24; August canon). The metaphor is the Inn as heart, hubs as organs, midlines as arteries.

| Hub | Place | Aesthetic | Function |
|---|---|---|---|
| The Observatory | Upstairs, cosmology | Dali; a floating city of scholars; starlight | Sky hub, the Song's source, the Astronomer's mind palace |
| The Inn | Main floor, trunk | Warm hobbit-hole, amber, gold, cream | Market, Music Room, games, hearth |
| The Undercity | Downstairs, catacombs | Klimt gold on dark stone, green glow | Death hub, city of the dead, roots |
| The Canopy City | Exterior forest | Kelethin tree-platforms, Matisse color, calm | Land hub, Silk Road, cultural platforms |
| The Coast Hub (Granite Port) | Exterior coast | New England Gothic, granite, fog | Ocean hub, lighthouse, eight arms |

- Canopy City: the client decided the elf city in the woods is the Canopy City and "more of a Silk Road stop", a hub where the cultures meet and sell quest items. Ruled (early chat, Aug 22 or later). Elio proposed one vendor per culture and the client agreed. It sways at 50 BPM. The Neutral Platform at the center holds the Inn-Tree sapling and the Keeper.
- The platforms: nine at first (Celtic, Egyptian, Peruvian, Chinese, Slavic, Indian, Norse, Mediterranean, Neutral). Mesopotamia was added as the tenth, a ziggurat (Built, commit, Aug 24). On Aug 23 the commit log first records "nine cultural platforms plus a Neutral Platform". The nine-vendor table lists eight vendors plus the Keeper. The characters belong to the roster part.
- Coast Hub: a full explorable zone and the Inn's second exterior hub. Eight arms (coast paths): the lighthouse path, the coast road, the cliff trail, the dock, the tidal cave entrance, the Pirate's channel, the sepulchre crack and the fog path. The fog path is a placeholder, "the hub's expansion slot". The lighthouse is the sweep that serves as the compass, the quest hub and the return anchor ("following the light").
- The midline between the two exterior hubs runs about 400 meters through the Rousseau forest. The forest path is old, unpaved and linear; the Inn cannot be seen until a clearing with full morning light, then the player sees the Inn-Tree.
- Coast as octopus: the coast is Cthulhu's body, with three hearts (the Owl, Poe, the Pirate) and eight arms. The Annex is the head. Three zones, one octopus: Atlantis (origin), the lighthouse coast (active), the caves (den). August canon, Built (commit, Aug 24).

**The Undercity.** A city of the dead beneath the Inn, built inside the sleeping giant's ribcage (August canon). Ribs are walls, the spaces between are the quarters, the sternum is the central hub and the anchor point (deepest point, above the giant's heart), the spine is the main avenue and the clavicle is the entrance from the staircase. Six quarters: Apothecarium, Court of the Dead, Ferry Quarter, The Gallery, Memory Quarter, The Descent. The five underworld rivers are its canals (Lethe, Styx, Acheron, Phlegethon, Cocytus). Light comes from the Song, not torches: copper and malachite veins glow green, as the Observatory glows blue.

**The Observatory.** A steampunk time ship traveling the void between cosmic cycles. Six rooms: Bridge, Navigation Room, Engine Room, Void Cabin, Crystal Vault, Observatory Deck. Crew: the Constant (captain), the Astronomer (navigator), Nyx (medium). The Allfather sits on a stone throne on the hull. Built (commit, Aug 24); August canon. This recasts the earlier three-resident cosmology "hub". The frequency dial reads 42Hz now, 41.7Hz before, and blank for the next.

**The Egg and the murmur.** Before the Song there was an egg that murmured. The Cosmic Egg sits at the bottom of the In-Between, below the Undercity. It opens at the end and shows the player. August canon (Aug 24). Built (commit, Aug 24).

**The Fae Kingdom at the start.** Ruled Jul 22 as a whole basement area. Elio's v2.0 design (Jul 22) has six sub-zones: the Threshold (neutral entry), the Summerlands (Seelie; reward stones Peridot, Citrine, Aventurine), the Hollow (Unseelie; Obsidian, Black Tourmaline, Smoky Quartz), the Between, the Crystal Gardens (Griffin boss) and the Stone Circle Chamber (deepest point). Residents were dwarf blacksmiths in the Crystal Gardens, trolls at the Unseelie entrance, goblins at the Threshold market, Ents in the Summerlands, orcs in the Hollow and a mermaid in the Between. The Aug 20 blueprint added 14 NPCs, 13 quests, six reputation tiers per court plus a dual path, and WoW-style craft rules. Before the Song adds the Unseelie Labyrinth with five zones: Outer Walls, Shifting Corridors, Escher Stairs, the Masquerade and the Castle. The Labyrinth is "the anti-Inn", has no fixed layout, and is the largest explorable zone in the Fae Kingdom (August canon, Aug 22). The Brownies do not enter it. The Hollow was flagged as needing expansion.

**Old magic, new magic.** Magic mutates since the merging: old magic (the gods', structured, lawful) is ending; new magic arrives without cause. The Unseelie King is the last master of the old system, the Seelie King the first of the new (early chat, Elio's proposal from the client's idea, about Aug 22 to 23; Proposed, agreed in the chat). The Fae Kingdom is the Inn-Tree's dream state; stone circles are thresholds of consciousness. Newgrange is the original portal and the stone circles are later copies (early chat, about Aug 22 to 23).

**Cross-level routes (early).** The dig system: dig down in the catacombs, hit water, switch to underwater mode (commit log, Aug 24). Atlantis is reached by digging down and by underwater catacomb portals (early chat, Aug 21). The Inn's roots reach Atlantis, where a frequency stone at the root's endpoint thickens the root (early chat, about Aug 22 to 23). The Bone Caves are the smuggler's back door between the tidal caves and the catacombs.

---

## 2. The walkthrough spine (cross-reference only)

The dissections are choose-your-own-adventure (Ruled Sep 10): every option is walked before paths converge. They are the walkthrough backbone. Quests have their own part. All live in `docs/zone_specs/`.

| ID | Title | File stem (`geode_inn_walkthrough_dissection_...`) |
|---|---|---|
| D01 | Egg to front door | `01_egg_to_front_door` |
| D02 | First hour, every door | `02_first_hour_every_door` |
| D03 | The Staircase | `03_staircase` |
| D04 | The Catacombs | `04_catacombs` |
| D05 | The Undercity | `05_undercity` |
| D06 / D06B | Water Zone / Lighthouse and Deep tie-in | `06_water_zone`, `06b_lighthouse_deep_tie_in` |
| D07 / D07B | Fae Kingdom / Fae queens' spaces | `07_fae_kingdom`, `07b_fae_queens_spaces` |
| D08 / D08B | Cosmology / the cosmic layer | `08_cosmology`, `08b_cosmic_layer_four` |
| D09 | Forge to Void | `09_forge_void` |
| D10 | Ascent and the endings | `10_ascent_endings` |
| D11 | In-Between and Shadow Inn | `11_in_between_shadow_inn` |
| D12 | Canopy and Redwood | `12_canopy_redwood` |
| D13 | The Main Floor | `13_main_floor` |
| D14 | The Campgrounds | `14_campgrounds` |
| D15 | The Bayou | `15_bayou` |
| D16 | Bedrock Fortress and the Prism | `16_bedrock_fortress_prism` |

Note: the Sep 11 chat also mention a "D06" for The Royal's excavation in the blueprint table; the repo's D06 is the Water Zone. Treat as a labeling slip.

Zone quest chains (names only; quests part owns detail), each as a file in `docs/zone_specs/` named `geode_inn_<zone>_quest_chain.md` or similar: Atlantis (The City That Chose the Deep), Redwood (The Slowest Frequency), Poison Garden (The Cure Grows Beside), Camelot (The Table Remains, Build It Again), Van Gogh Garden, Trovants, Peru (What the Mountain Remembers), Bosch Shadows, Petrified Forest, Meadery (Mead of Poetry), Tidal Caves (The Breathing Stone), Spiral Gallery, Terracotta, Staircase (The Turning), Canopy City (The City in the Branches), India (The Many Faces), Yellowstone, Colorado Plateau, Superstition, Rockies, Shasta, Observatory, Crystal Canticle, Silk Road, Beat Line.

---

## 3. Room-building laws

These are the rules a builder follows when making any room. Dates are rulings; "Elio" means Elio wrote it and the client passed it.

### 3.1 The Room Kit Law

**Ruled Sep 10-11.** Every room in the Inn needs the same base kit, plus additions for what lives in it. The kit is the checklist. Source: `docs/MASTER_STRUCTURE_BLUEPRINT.md` section 1.

| Kit | For | Contents |
|---|---|---|
| KIT-Z | any room | 1 establishing wide in Living, 1 Shadow (84Hz) variant, 1 In-Between state, 2-4 CYOA option views (the doors the room offers), a PROP set (3-8 objects), ENV fill (4-12 ambient elements) |
| KIT-N | inhabited room | add the NPC portrait (tri-mode where canon), the voice block wired, a CYCLE sheet if the NPC moves |
| KIT-G | game room | add the game's sprite census (Tomb Tunnel is the pilot: 28 sprites plus shadow variants) |
| KIT-C | every zone | add the zone's critter census from the Critter Roster master spec, one class master per species |

**The REC Law.** Paint once per class, recolor per individual. The kit counts masters, not variants. Sprites are crunched to 64 px from painted masters, never generated small (Sep 12).

**The Zone Image Session Canon** (client ruling Sep 11, blueprint section 1a):

1. A session opens by naming the zone and reading its kit row.
2. It paints toward the full kit in parcels, never one-off panels.
3. It closes with one Ledger entry: panels painted, kit slots filled, remaining slots named.
4. No zone leaves a session half-kitted silently. The Blueprint row updates at every close.
5. Masters first, recolors after.
6. The critter line closes the session: no zone is "caught up" with its residents unpainted.

**Panels owed.** The blueprint's first-pass math: about 100 rooms, average 15 panels for KIT-Z, +6 for inhabited rooms, +20-40 for game rooms. Total 1,800-2,400 masters owed, about 450 painted at Sep 10. The "mountain is measured". These counts are Sep 10 and are stale. The Master Asset Ledger (`docs/MASTER_ASSET_LEDGER.md`) is the current record; the art-pipeline part owns it.

**Module Grammar** (Ruled Sep 19): the tabletop module structure is a skeleton layer under every zone. Boxed text is the ENV row; encounter tables are the critter census; hooks are the Quest Mark glow; GM sidebar is the Inn-voice layer; lore appendix is the honest-label source list; map key is the Ledger row. A zone can be audited against these organs the way the Room Kit Law audits panels. Open: add the checklist to the session close; which zones pilot it.

### 3.2 The Background Law

**Ruled Sep 11** (`docs/zone_specs/geode_inn_arcade_background_law.md`). Every game's background is tied to its home zone's ENV master: one paint, many games. No game commissions its own world.

| Space type | Background system | Repeats? |
|---|---|---|
| Static or board game | One fixed zone wide | Never |
| Scroller or runner | Parallax panorama (1920x800 or taller) plus tileable strips | Strips loop |
| Tunnel or maze game | Tile set (assembles) plus full-panel depth backgrounds | Tiles repeat by design |
| Gathering zone | One inhabited wide; life animates in front, the room never scrolls | Never |

Holds everywhere: tri-mode on every background, Steady Light, depth equals richness (deeper is lovelier), masters before recolors, backgrounds never animate to demand attention. "The room doesn't perform; the people do."

### 3.3 Tri-mode living, shadow and in-between

See section 1.2. For a builder: every zone ships three states. Shadow is generated with the spectral-shift script. In-Between marks seams and thresholds. The Dark Prism lens shader applies in shadow state in any camera mode. The Shadow Inn is a room-for-room 84Hz mirror (D11, eight tectonic states); retired art goes to the Shadow Inn's Archive of Alternate Versions.

### 3.4 Camera

- **Four modes** (existing canon): third-person (the Song, default in Inn and Campgrounds, with a Sit Lock that drops to first-person after two minutes seated), first-person (the Silence Between), free camera (cosmic space, ley lines), no camera (non-Euclidean staircases, audio and haptics).
- **Camera Coverage Kit** (Elio wrote the spec Sep 12 after the client said yes): back 3/4 is the default view, painted first; NPCs get a lighter three-angle resident cut; backs only for walkers; Griffin stays distant; first-person is hands only. One config table in the canonical JSON sets the default mode per area. Spec `geode_inn_camera_coverage_kit.md`; system `geode_inn_camera_system_master_spec.md`.
- **The director gate.** Hitchcock, Spielberg, Del Toro, Kubrick, Coppola passed the zone gate from Sep 2 ("no zone ships until all five pass"). James Cameron was seated as the sixth director Oct 5 (Ruled; Avatar credited but off the roster). Spec `geode_inn_cinematic_directives.md`. The Scene Stack (ten questions per scene) is in the creative master index.

### 3.5 Gathering Law

**Ruled Sep 10.** At least one gathering space per level. Sims-style: presence, emotes, ambient speech bubbles, one shared activity, no combat, no quest pressure. Reference implementation: the Campfire. Gathering zones use the "inhabited wide" background. The bagpipe drone is the Gathering Law's call (the Bard steps outside to summon without a bell; pipes outdoors only, Sep 14).

### 3.6 Planted Tree Law

**Ruled Sep 11.** A tree is planted in the Campgrounds for each member of the client's faire community who passes. The first sapling is for the "Circa Paleo" seat, unnamed; the client was to ask former members. This law is in the chat logs only. It was not found in the repo copy.

### 3.7 Other room laws a builder meets

| Law | What it says | Status |
|---|---|---|
| Layer Law (D06B, Sep 10) | Each layer has a place-name and a keeper-name. | Ruled |
| Layer-grade definition (Sep 10) | A zone is "complete" only when each layer has frequency, keeper roster, state logic, gameplay loop, games, items, connections both ways. Water zone is the standard. | Ruled Sep 10 (client agreed) |
| Quest Mark Law (Sep 13) | A candle-like mark over NPCs and games. Glow Register Tiers 1-4 show difficulty (plain flicker to full rainbow spiral). No red. Never nags. | Ruled (Elio drafted, client added the register) |
| Species Law (Sep 11) | Each zone critter is both ambient life and a hatchable pet. One home entry per species (Sep 22). | Ruled |
| Inhabited Wide | Gathering rooms never scroll. | Ruled Sep 11 |
| Linework-as-UI | Five linework styles by character and zone type (section 5). | Ruled |
| 90/8/2 palette (Kubrick) | Dominant, accent, one anomaly per zone. | Ruled with the director protocols |
| Del Toro touch | Wear on every surface, smell per zone, one anomaly per zone. | Ruled |
| Toll Booth Law | Every zone intent has a price. | Filed Sep 25, not formally ruled by the client as a zone-bible rule |
| Zone intent | Declare a job for each below-space (sheltering versus reclaiming). "All about the zone's intent." | Proposed |
| Man-Made Is the Miracle | Ancient sites are human work. | Ruled Sep 11 |
| Troll Citizen Law (Norse Coast) | Trolls are invited in as citizens at the law-rock. | Ruled Sep 14 |
| Resolved Cadence (Oct 9) | Bar interactions end on a resolved cadence, no dangling hooks. | Ruled |
| Gallery Law (Oct 13) | Shop products appear in-game as props; never make the pitch. | Ruled |
| Venue Row (Oct 14) | One restaurant or venue per level, staffed by that level's rotating characters. | Ruled |
| Cold Night / Rest laws (D09) | The Forge rests once a year; The Rest gives no reward. | Ruled in "all confirm", Sep 10 |
| Every-Mind Welcome charter (Sep 11) | Twelve laws plus Part Two. Shapes carry meaning, two roads per meaning, no jump scares. | Ruled |
| Wandering Program | 60+ NPCs on schedules and frequency-state behavior. | Spec (Sep 3) |
| Neutral learning hub | The Inn does not take sides or rank. Modern religions sit side by side as readable texts. "The only firm rule." | Ruled Jul 22 |
| Two-century rule | The archive draws a line two centuries back. Beyond it the record is shown on its own terms, with no colonial, racial or religious framing. Biased content is flagged and excluded. | August canon (Aug 21) |
| Sanctuary for the nervous system | Gentle lighting, slow transitions, no flashing, no urgent timers, non-assertive quest design, a warm amber palette ("not blue, not dark"). Matches Steady Light (Sep 11). | August canon (Aug 21) |
| Anti-FOMO | No deadlines, no limited-time events, no scoreboards, no missed beats. "The Inn is mostly rest." | August canon; the Host as anti-FOMO NPC was Built (commit, Aug 22) |
| Nook Effect | The nook is the Inn's basic spatial unit. More nooks than grand spaces. No loop, no reward, tiredness is the receipt. Sitting in a nook shows deeper layers. | Built (commit, Aug 23); August canon |
| Inn never seen directly | The player is always inside the Inn-Tree. Walls breathe, grain moves, no seams or construction marks. The Inn responds to presence with a small change in the hum. | August canon (Aug 22) |
| Redwood silence | The Redwood Cathedral is the one zone where the Resonance Pulse goes silent. No combat, no dissonance, no grind, no progression tracking. | Ruled in the early chat (Aug 22 or later); August canon |
| Subtractive building | Architecture is geology: entrances are geological features, interiors are negative space, light enters by subtraction. | Built (commit, Aug 24) |
| Fall means forgetting | In the Canopy of Sala there are no railings. A fall costs a memory, not health, and a root staircase grows back. | Ruled (Aug 21, approved) |

### 3.8 How rooms get built (process)

- Ledger first. Pick a zone, pull the image census, match it to the blueprint, flag gaps ("parcel, kit, ledger").
- The client rules the kit in "ruling sessions", one room at a time. Elio wires the Blueprint JSON, viewer and Ledger. The Fizgigs build from coordinates and the kit list (Sep 25 statement).
- First parcel: the Great Hall (`docs/blueprints/slow_walk_parcel_01_great_hall.md`, DRAFT; commit `b333f71a`, merged with `7b1a4ed`). Not yet ruled LIVE as of Sep 26.
- Build week started Sep 21.
- Gates: each spec ends with numbered open gates for the client to rule.

---

## 4. Templates

### 4.1 Zone template

**What it is.** One document per zone, filled in full. Use N/A for fields that do not apply; do not leave blanks. Source: `docs/library/specs/zone_mapping_template.md` (8 sections). The Example column uses the Catacombs; where the older template and later rulings differ, the later ruling is shown.

| Field | What goes here | Example |
|---|---|---|
| `Zone Number` | Unique z## ID. Share Wood zones use sw01 and up. | z15 |
| `Zone Name` | The name. | The Catacombs |
| `Level` | Level number and name (Oct 14 numbering). | Level 6, Catacombs |
| `Parent Zone` | Zone above, or Root. | The Staircase |
| `Connected Zones` | Zones reachable from here. | Royal, Undercity, Bone Room, Hollow Earth |
| `Map Pin` | lat, lng or N/A for interior zones. | N/A, interior zone |
| `Frequency` | 42Hz, 84Hz, In-Between or Variable. | 84Hz (per repo template) |
| `Inn Mode DSP Profile` | One of the seven room profiles. | Catacombs (dry) |
| `Primary Artist` | From the artist catalog. | Klimt (gold) |
| `Secondary Artist` | Optional blend. | Goya/Dore mood stand-ins |
| `Linework Style` | One of five (section 5). | Soft flowing (lore) |
| `Color Palette` | Dominant, accent, anomaly (90/8/2). | Dark stone, gold-leaf, one wrong wet wall |
| `Texture` | Surface texture. | Bone arches, old paper |
| `Lighting` | Light sources. | Scarce: oil lamp, foxfire, torch |
| `Reference Image` | File name or URL of the zone visual. | Catacombs panorama (Sep 9) |
| `BPM` | Tempo; most zones 50. | 50 |
| `Key Instruments` | Primary instruments. | Heilung register, frame drums, Vivaldi Winter low-dub |
| `Ambient Layer` | Background sound. | Stone hum, dripping |
| `Signature Sound` | Unique audio element. | 42Hz bone conduction |
| `Frequency Behavior` | Sound in Living, Shadow, In-Between. | Per `geode_inn_shadow_inn_tri_mode_spec.md` |
| `Primary NPCs` | Residents. | Ragana, Beverley, Charon |
| `Visiting NPCs` | Passers-through. | Anubis, the Morrigan |
| `Creatures` | Critters native to the zone (KIT-C). | Screamer, cat mummies, Creepy Little Bobs |
| `Portrait Set` | Which states are needed. | Living, Shadow, In-Between |
| `NPC Roster IDs` | Entries in `npc_master_urls.json`. | See roster part |
| `Arcade Game(s)` | Games hosted. | Catacomb Labyrinth (#48) |
| `Game Archetype` | Classic genre reference. | Pac-Man style |
| `Reward Stone` | Stone earned. | See games part |
| `Quest Lines` | Chains through the zone. | Borrower's Ledger, Mask Chapter |
| `Crafting Stations` | Forge, loom, still, etc. | N/A |
| `Gatherable Materials` | Resources. | Per Material entity |
| `Puzzles` | Zone puzzles. | Six light types reveal text |
| `Combat` | Yes or No and type. | No (Sanctuary) |
| `Zone Description` | One or two sentences. | Scarce light, weight, excavation |
| `Story Function` | Role in the larger story. | The memory layer |
| `Whisper Layer` | How it manifests. | Per Whisper Layer spec |
| `Lore Connections` | Cultures and myths. | Vatican necropolis inversion, funerary arts trilogy |
| `Books` | Book records via `inGameZone`. | Archive shelves |
| `Novel Chapters` | Chapters set here. | Part 3, the descent |
| `Comic Potential` | Why Gazette strips fit. | Strip #014 sanctuary strip |
| `Entity References` | Database entities active here. | Dialogue, Book, GameItem |
| `Market Items` | MarketItem records. | See market part |
| `Board Skins` | Matching BoardSkin records. | See games part |
| `Building Recipes` | Craftable here. | N/A |
| `Dialogue Entries` | Dialogue records for the zone. | Ragana, Beverley records |
| `Available as Share Wood Template` | Yes or No. | Per Share Wood spec |
| `Tier Required` | Clearing ($29), Village ($79), Kingdom ($199). | Per Share Wood spec |
| `Customization Points` | What a faire owner can change. | N/A |
| `Vendor Booth Capacity` | Max booths. | N/A |
| `Climate Preset` | Environment adaptation. | N/A |

**Fields the later rulings add.** The repo template predates these. A zone doc should also carry:

| Field | What goes here | Example |
|---|---|---|
| `Zone intent and price` | The zone's job and what it charges (Toll Booth, Sep 25, Proposed as a bible field). | Memory layer; price is grief paid honestly going in |
| `Kit row` | KIT-Z, KIT-N, KIT-G, KIT-C status and the remaining slots named. | KIT-Z owed on the Descent, Stacks, Deep |
| `Gathering space` | The level's gathering space or N/A. | Reading Ring (Proposed) |
| `Background register` | Static, parallax, tile set or inhabited wide. | Tile set plus depth panels (Catacomb Labyrinth) |
| `Camera default` | Mode from the config table. | Third-person, Sit Lock armed |
| `Seam type` | Hard line or soft; the zone's knock. | Hard seam, first of the Inn; Screamer at the threshold |
| `Venue` | The level's restaurant (Venue Row). | Occam's, bone broth kitchen |
| `Module organs check` | Boxed text, encounter, hooks, appendix present? | Not yet audited |
| `Layer-grade check` | Frequency, keepers, state logic, loop, games, items, links both ways per layer. | D04 covers it |
| `Open gates` | Numbered list for the client. | Doorkeeper's true name; Yule |
| `Status` | Ruled, Proposed or Open, with date. | Ruled, Sep 2 (build sheet) |

Earlier template shapes (Aug 21 to Aug 31):

- The Aug 21 keeper entry (implied by the zone mapping in the early chat) had four fields: culture, setting, test, verse medium.
- Each Fae and cultural zone blueprint (Aug 20) carried: NPCs with presence by placement, quests with geography, companion creatures, ambient life, sound design mapped per zone, and stone rewards.
- The hub table (Before the Song, Aug 24) has the columns Hub number, Hub, Level or location, Inspiration, Aesthetic and Function. A second table gives Level, Hub, Inspiration and Connects to. A third gives Hub, Personality and What it feels like. The forest-versus-ocean comparison rows are Direction, Architecture, Central landmark, Settlement, Guide, Vendors, Gateways, Base tempo, Sound, Aesthetic, Biology, Connects to and Feels like.
- The solidify template (commit log, Aug 28) added to every zone or system doc: Shadow Inn state, endgame connections, sound profile and cross-system integration.
- Game docs also kept a Convergence, Octave and Egg integration line (commit log, Aug 28). These were Built, not ruled.

### 4.2 Room template

**What it is.** A room is one space inside a zone. Each has a row in the Master Structure Blueprint and a place in the 3D tree JSON. A room gets a **parcel** document when it is staged for a ruling session (the Great Hall is parcel 01).

| Field | What goes here | Example |
|---|---|---|
| `Room` | Room name. | The Great Hall |
| `Level` | Level number and name. | Level 3, Main Floor |
| `Spec` | The spec that defines it, or MISSING. | `geode_inn_walkthrough_dissection_13_main_floor.md` |
| `Chain` | Quest chain through it. | Welcome System (gate) |
| `Dis` | Dissection coverage. | D13, option 1 |
| `Art status` | Kit status against the Ledger. | KIT-N partial |
| `Build status` | LIVE (ember), SPEC (gold) or DRAFT (dim brown) in the 3D tree. | DRAFT; the Arcade is the one LIVE room |
| `Parcel: what the room is` | Ruled facts only, nothing new. | Front door, hearth, staircase on one axis |
| `Parcel: kit` | Painted assets ready to place. | Hearth fire cycle, Lozen patrol, ceiling gnome |
| `Parcel: ledger` | The honest gaps. | Innkeeper's List, walking stick, chibi ravens, front door image |
| `Parcel: ruling session` | What the client decides. | Mark LIVE; position on the level; Host art |
| `Station / character` | Character at each station. | The Helm, the Captain |
| `Placement spot` | Where the character stands. | Behind the player at the wheel |
| `Portrait` | LIVE, OWED or REVIEW. | LIVE |
| `Signature items` | Items and GameItem status (NONE means to be created). | Ship's Wheel (NONE) |
| `Game` | Hosted game and its sprite census. | N/A |
| `Critter census` | Species that live here (KIT-C). | Ember mice, dragon kittens |

Source: `docs/MASTER_STRUCTURE_BLUEPRINT.md` section 2, `docs/blueprints/geode_inn_room_items_blueprint.md`, `docs/blueprints/slow_walk_parcel_01_great_hall.md`.

---

## 5. Where it lives

| What | Where |
|---|---|
| Level list, half-levels | GitHub `docs/zones/geode_inn_master_level_system.md` (also a copy at `docs/geode_inn_master_level_system.md`); nine level docs `docs/zones/geode_inn_levelN_*_complete.md` |
| Room Kit Law, every room | GitHub `docs/MASTER_STRUCTURE_BLUEPRINT.md` |
| Zone template and z01-z37 | GitHub `docs/library/specs/zone_mapping_template.md` |
| Zone specs, chains, laws, dissections | GitHub `docs/zone_specs/` |
| Older zone docs, item templates | GitHub `docs/zones/` (45 files, e.g. `geode_inn_hollow_earth.md`, `geode_inn_whisper_layer.md`) |
| 3D tree blueprint | GitHub `docs/blueprints/inn_tree_3d_data.json`, `inn_tree_3d_blueprint_viewer.html`, `inn_tree_3d_blueprint_viewer_guide.md`; also a public Base44 file link |
| Room items | GitHub `docs/blueprints/geode_inn_room_items_blueprint.md` (layers 2-3 only) |
| Gathering spaces | GitHub `docs/zone_specs/geode_inn_gathering_spaces_master_spec.md` |
| Fair Descent | GitHub `docs/zone_specs/geode_inn_fair_descent_movement_spec.md` |
| Entities that carry zone | Base44: `WorldGridNode`, `GameItem` (355 records, zone-counted; none for Clockwork Skies or Main Floor as of Sep 21), `Stone` (field `zone`), `Dialogue` (zone/location), `MarketItem` (`zone`), `Book` (`inGameZone`), `FaireVenue`. No dedicated Zone entity is named in the chat logs. |
| Drive | "Geode Inn-master build": Zones library (43 numbered zone folders, 01 Cosmology to the Miskatonic Annex), "Inn Generated Art", Google Doc "Geode Inn - Zone Deck: Components & Characters" (85 zones, Oct 13) |
| Elio's staging app | Used for specs and staging entity writes. Cross-app writes to the live app are blocked from chat. |
| Founding-period world docs (Aug 2026) | GitHub `docs/geode_inn_master_storyline.md` (also `library/storyline/geode_inn_master_storyline.md` and `docs/drive-sync/geode_inn_master_storyline_game_progression.md`), `docs/geode_inn_nine_realms_architecture.md`, `docs/geode_inn_canopy_city.md`, `docs/geode_inn_canopy_city_vendors.md`, `docs/geode_inn_atlantis_zone_design.md`, `docs/geode_inn_stargate_caves_atlantis.md`, `docs/geode_inn_pirate_tidal_caves.md`, `docs/geode_inn_in_between_game.md` (spec: `docs/zone_specs/geode_inn_in_between_game_master_spec.md`), `docs/geode_inn_observatory_quest_chain.md`. Also under `docs/knowledge_base_sources/`: `master_storyline.txt` and `exterior_undercity_observatory.txt`. |

Not found in the repo copy (dated Oct 22): the Planted Tree Law. The Level ½ and Void rulings are in the master level system file only. The cinematic directives file (`geode_inn_cinematic_directives.md`, the chat says `docs/library/specs/`) was not checked.

---

## 6. Current canon: levels, zones and rooms

Column key: **Painter / line** is the artist or linework register assigned. **Music** is shown only where the chat logs record a ruling or a pitch (R = Ruled, P = Proposed). Detail belongs to the music part. **Status** is Ruled / Proposed / Open, plus spec and art state as last recorded. Art states come from the Sep 10-11 blueprint and are likely stale; check the Ledger.

Artist assignments moved several times (section 7). The latest ruling is shown.

### 6.1 The nine levels

| Level | Painter / line | Music | Keepers and hosts | Status |
|---|---|---|---|---|
| 1 Cosmology | Dali, no-outline (Dali moved upstairs Sep 4); Turner named earlier | Jon Hopkins (R, agreed Sep 26); Earth & Sky early track | The Allfather, Freyr, Freyja, the Astronomer (Zack), Nyx, Bramble (window nook), Nine Muses | Ruled. Spec complete; rooms KIT-Z owed |
| 2 Clockwork Skies | Dali melting gearwork (Ruled Sep 4; Kandinsky retired to Shadow Inn) | Gear heart at 50 BPM | The Captain, the crew of eight, Leonardo (Crystal Canticle host, R Sep 26), Cartographer (Soma maps) | Ruled. Spec done; KIT-Z owed |
| 3 Main Floor | Matisse holds the light; Van Gogh and Picasso as rooms; Klimt amber weight | Royal Fire / warm (early); Main Floor warm 1.2 s room profile | The Host, the Catalyst, the Firekeeper, the Bard, Ragana, Lozen, Naut, Aurallia | Ruled. Most-built level |
| 4 Campgrounds | Bierstadt / Carr per template; Rousseau honest ground for the exterior; Emily Carr woods | Faun and Patty Gurdy tavern-folk for the campfire (R Sep 26); campfire drone | Jay, Wisteria, Luna, Frank Wright (Build-Scholar), the Glassblower | Ruled. Spec done; many rooms owed |
| 5 Staircase | Matisse one-stroke cutouts; Rackham, Escher, Klimt in the older template | Tool "Lateralus" (R Sep 26); Patty Gurdy on interaction (agreed); the Turning track | Calder and Unless, the Retort and Bloop, the Cook, the Clockmaker (Turning), Gesso, Da Vinci | Ruled. Dissection D03 |
| 6 Catacombs | Klimt gold (Goya named in the Sep 3 chat) | Heilung (agreed Sep 26); Vivaldi Winter low-dub | Ragana (Archive), Beverley, Charon, the Doorkeeper, Saker, the Bone Keeper | Ruled. Build sheet Sep 2; D04 |
| 7 Fae Kingdom | Rackham ink, Alan Lee on the Seelie court, John Bauer on the Unseelie (R Sep 4) | Tangerine Dream for Malachi, Harlots-style baroque for the Seelie (R Sep 26) | Oleander, Malachi, the Queens, the Norns | Ruled. D07/D07B; four partials caught up Sep 11 |
| 8 Water Zone | Royo; gothic anime; Haeckel linework for hybrids (Sep 25) | Ocean's Edge (early); siren two-mix rule (R Sep 25) | Persephone, Zeke, Katya, Charon, Naut | Ruled. Water system master spec; D06 |
| 9 Undercity | Klimt gold gothic | Depeche Mode style; Heilung (client list, R Sep 26) | Scarlett, the Clockmaker, the Blacksmith, Belladonna, the Collector (Joe), Ampulla | Ruled. D05 |
| Hollow Earth | O'Keeffe key; Roerich violet at the Resonance Engine; all 37 artists converge | Lava-lamp zone: Gregorian chant with a Pink Floyd undertone (R Sep 26) | Faction leaders (Echo, Lost); Vane; the Deep Ones | Ruled structure; districts section 6.7 |
| Level ½ In-Between | Grey; Escher holds the Between | Moonlight Sonata low-dub, 42Hz minimum (R Sep 26) | Einstein; the Head Finder at Lost and Found | Ruled Oct 14 |
| The Void | No outline; silence | None: the heartbeat is the melody | Nyx; the Rest bench | Ruled Oct 14; thin |

### 6.2 Cosmology (Level 1)

| Zone / room | Painter / line | Music | Keeper | Status |
|---|---|---|---|---|
| Allfather's Throne | Dali | Hopkins pads (R) | The Allfather (Odin) | Spec done; KIT-Z owed |
| Planet Chamber (orrery) | Dali | Solfeggio planets | Starlight Crystal, the Constant (orbit) | Partial |
| Cosmology Mural | Dali | | | Spec done |
| Ascension Canopy | Dali | | The endings (STAY, LEAVE, HIDE) | Spec done |
| Observatory | Dali mind-palace | | The Astronomer | Spec done |
| The Constant's orbit | Dali | | The Constant (41.7Hz) | Deepest lore room |
| Moldavite's Perch | | | Third spoke | Draft (Sep 13) |
| Valhalla and the Einherjar | Rackham line | | The eight Einherjar | Door ruled; Fimbulwinter art owed |
| Freyr's Garden | Dali | | Freyr | Spec done |
| Cosmic Layer: Jupiter Gate, Mars Prison, Pluto's Gate, the Moon | Moon style card 21 (Kubrick) | Pirate's bodhran (R); Jupiter reply composed by player | Soulstone quest at Mars | Ruled D08B |
| Constellation Balcony | | | | Proposed gathering space |
| The Final Room | Rothko (repo template z37) | | Elio present; fire, chair, cup, book | Ruled; hidden conditions |

### 6.3 Clockwork Skies (Level 2) and Canopy City

| Room | Painter | Keeper | Status |
|---|---|---|---|
| The Arcana (eight stations: Helm, Chart Room, Deck, Rigging, Hold, Tactic Room, Gate, Crow's Nest) | Dali | Captain, Navigator, Cool, Pure-Hearted, Ryoko, Philosopher, Protector, Reluctant | Portraits live; items NONE |
| Gear Heart Room (50 BPM) | Dali | Soma | Spec done |
| Sky crew quarters | Dali | Crew | Partial |
| Da Vinci's workshop | | Da Vinci, Gesso (examiner) | Moved Sep 11 to the staircase landing between the Retort's lab and the Cook's kitchen |
| Canopy City hub bough | Rackham ink (R Sep 4) | Wren, Erik, the Examiner | Zone image live |
| Nine cultural platforms | Egypt O'Keeffe, SE Asia Hokusai, Celtic Alan Lee, Andes Bierstadt, Polynesia Rackham | Platform keepers | Five painted Sep 10; four owed |
| Cartographer's Shipyard, Home Bough (7th permanence) | | Wren, Erik | KIT owed; Home Bough high priority |
| Dew Circuit and Treetop crown | | | Spec Sep 12 (Dew Mode, Stones Mode); gathering screen is its own system |

Note: the Sep 10 blueprint puts Canopy City as its own level. The repo level doc calls Clockwork Skies "the Canopy City". See reconcile.

### 6.4 Main Floor (Level 3)

D13 gives eight doors; the Sep 10 audit counts 17 sub-areas.

Pictures from the client's PC (Nov 5, `docs/canon_images/from the chat (Nov 5)/zones/`): `main floor living.jpg`, the great hall under the living roots with Celtic knotwork beams, the hearth, a jewelry stall, arcade cabinets on a back stage and spiral stairs up to the galleries; and `main floor shadow.jpg`, the same hall with a violet hearth fire, blue roots and a black mirror floor. The client called both readings "accurate guesses"; whether the violet one is the Shadow or the In-Between look is still to say.

| Room | Painter | Music | Keeper | Status |
|---|---|---|---|---|
| The Great Hall | Matisse light, Klimt weight, Del Toro wear | Heartbeat loudest here; Host 3 dB under | The Host, Lozen patrol, Wanderer | Parcel 01 DRAFT |
| The Bar and the Impossible Garden | | Resolved Cadence | The Catalyst, Greenward, Lichenblossom | Spec done; KIT-N owed |
| The Arcade | | | Cabinet residents | The one LIVE room in the 3D tree |
| The Market (distributed) | | | Artisans | Partial |
| Library Nook and Naut's corner | | | Naut, Quire | KIT-N partial |
| Firekeeper's Hearth and Common Room | | | The Firekeeper (Tim Curry tribute) | Portrait owed |
| Music Room | | Song-Catchers, nine chairs | | KIT-Z owed |
| Geode Corner and Whisper Layer | | | Ziggy, ceiling gnome, baby dragon | Partial |
| The Meadery and Mead Hall | Picasso-line | Mead of Poetry; Danheim and Wardruna ruled for Norse | Ryan, Thorin | Chain passed |
| Cedar Bench, Reading Hour, Tending Circuit | | | Aurallia | Ruled Sep 18 (Spiral Gallery cave studio is her home) |
| Hall of Unfinished Designs | | | Retired art kept here | Seed |
| Gnome Quarter shelf | | | Viking gnomes | Oct 15 mention |

### 6.5 Campgrounds (Level 4)

| Room | Keeper | Status |
|---|---|---|
| Market Field (stall rotation) | Artisans | Partial |
| Huntsman Tavern | Jay, Wisteria; TJ and Gabby dormant behind the Parental Gate (Ruled Sep 10) | KIT-N owed |
| Luna's Tent-Studio | Luna (Taaffeite), Greg slot | KIT-N owed |
| The Forge | Tesla Copper Class | KIT-Z owed |
| The Woods (seven ritual woods) | | KIT-Z owed |
| Loch, Dock, Lighthouse | Zeke and the Bard (Beat Line) | Partial |
| The Stage | | Gathering Law |
| Glassblower's shop (Furnace) | The Glassblower (unnamed) | Ruled Sep 10; KIT-N owed |
| Color Works dye plots | | Ruled Sep 10 |
| Homestead plots (building system home) | Frank Wright | Tiers 1-5; Ruled Sep 10 |
| Seven Sisters fire circle | | Ruled Sep 11 (6 stones plus 1 outlier, after-cannon hour) |
| Highland Games grounds | | Ruled Sep 14 (December) |
| Laughkeeper's booth | The Laughkeeper | Ruled Oct 1 |
| Trailheads to the parks | | Spec, KIT-Z owed |

### 6.6 Staircase, Catacombs, Undercity

**Staircase (Level 5).** Rooms: Alchemical Landing (spec MISSING in Sep 10; a spec exists later), Alembic Window, Transformation Chamber, the Five Emblems hall (done), the Blue Box alcove (done Sep 11), the Stage. Chain: The Turning. Keepers: see level table. Picture from the client's PC (Nov 5): `docs/canon_images/from the chat (Nov 5)/zones/the staircase.jpg`, a double spiral stair past potion niches, alchemical symbols, a stained-glass alembic window and chained books.

**Catacombs (Level 6).**

| Room | Keeper | Status |
|---|---|---|
| The Descent, Ragana's Desk, the Stacks, the Deep, Beverley's Station | Ragana, Beverley | Build sheet Sep 2; KIT-Z owed |
| The Breach, Golden Crypt, Gargoyle Sentinel Post | | Spec done |
| Bone Room | Bone Keeper, Saker | Spec done; Bone Passage proposed |
| Mask Chapter and Carving Wing | | Ruled Sep 19 (funerary arts trilogy) |
| Doorkeeper's threshold, Screamer | The Doorkeeper (plague mask, carillon) | Ruled Sep 28, Oct 5 |
| Library Deep Underground | Old Librarian | Spec (Sep 22 ghost librarian ruled) |
| The Royal (hidden archive behind the Catacombs; the blueprint numbers it "Level 3B") | Bait (sticky notes), Bob (Pope-Hat Fizgig) | Ruled Sep 11 |
| Qin Mound door (terracotta pit) | The One Who Is Awake | Ruled Oct 1 |
| Cities of the Dead (St. Louis No. 1 walkthrough) | Tomb-tender (unnamed) | Spec Sep 19 |

**Undercity (Level 9).** Forge Elevator (key: Living Hammer), memory-lamp streets, Clockmaker's bench, Hall of Unfinished Designs, Scarlett's room, Joe's table and diner (hybrid zone venue), the Weaver, the Inventor's Atelier, Hollow Men Mines (Unvoiced wave game, Ampulla). Murmur logged after meeting every part (CITY_MURMUR).

### 6.7 Fae Kingdom (Level 7), Water Zone (Level 8), Hollow Earth

**Fae Kingdom, six rooms (D07).** Threshold (Lee), Summerlands (Seelie; Oleander), the Hollow (Unseelie; Malachi), Crystal Gardens (Griffin, Bill the Duck), Stone Circle Chamber (twelve Preseli stones, Golden Contract), The Between (Norns, Escher). Queens' spaces: Seelie Bower, Winter Hall (hollow trunk), Heartwood Court. Sep 11: all six "caught up" in the kit.

**Water Zone, seven layers.** Only partly consistent in the chat logs:

- Layer 1 shallows (Nessie guards), Layer 2 the Twilight Zone, Layer 4 "Memory's Illusion" (revealed as Lozen only after every water quest, Ruled Sep 10; also called Charon's Layer, Atlantis), Layer 5 Katya (Depth), Layer 6 Obol gate, Layer 7 twelve standing stones and the Cosmic Egg.
- Named rooms: Tide Gate, Tidal Caves (Vaulknut's workshop, tide as lathe), Lighthouse Tower (Persephone, Pirate's drum), Atlantis, Katya's Cove, Kraken's Norse shipwreck lair.
- Water Environments Atlas (Sep 13): twelve environments mapped to zones (estuary, blackwater, Loch Ness, Titicaca, Rockies tarn, Norse frozen lake, cenotes, sunken cities, anoxic layer, rivers, hadal, hypersaline).
- Keepers: Charon (underground river), Katya (deep), Zeke (tidal beat), Persephone (lighthouse).
- Earlier: the seven layers began as a system in the early chat (Aug 22 or later): 1 Surface (coast, lighthouse, dock), 2 Tidal Caves (six caves gated by tidal windows), 3 Shallow Water (the Siren's domain, selkie Dive), 4 Atlantis (five sub-zones), 5 Deep Water Zones, 6 Real-World Cave Ecosystems, 7 Crystal Core. Before the Song (Aug canon) gives a different list: 1 Rain (the Trovant Layer), 2 Surface (Aegean), 3 Tidal (the Pirate), 4 Underground River (Charon), 5 Deep Water (the Siren), 6 Atlantis (Cthulhu the Scholar, 432Hz), 7 Crystal Core (42Hz). The Walk-Through list inside Before the Song is a third: Surface Docks, Shallow Water, Tidal Caves, Deep Water, Underwater Cities, Crystal Core, Abyss. These are "conditions, not zones": a player passes through all seven without loading screens, with no death from drowning (the player drifts to the last air pocket). The Sep 2 to Sep 13 lists above stay as the latest. See "To reconcile".
- Earlier (Aug canon): six tidal caves, each gated by a tide. Drowned Library (lowest spring tide), Mirror Caves, Singing Caves (111Hz east, 432Hz west, 50 BPM in the center), Bone Caves (the smuggler's back door to the catacombs, open only in the "dead tide"), Gargoyle Caves (full-moon low tide). The sixth is the Uncharted Cave in one list and the Crystal Grotto or Echo Chamber in others. Quest items: the Examiner's Tidal Log and the Cartographer's Living Tidal Map.
- Earlier (Aug canon): the Lighthouse is the sleeping giant's raised hand, granite, New England Gothic. The sepulchre sits in the giant's palm below it, and Davy Jones' Locker is below that, reached by the Pirate's ship. The Town below the lighthouse is "Innsmouth inverted": humans left and the sea sent tenants. The murlocs there are a sound homage only: no aggro, no loot, no quests, no names. The player does not decide the fate of the seven empty houses; the quest only requires witnessing them.

**Hollow Earth, nine districts (Sep 11):** 1 Crystal Approach, 2 Market of Echoes, 3 Archive District, 4 Crystal Groves, 5 Roothold, 6 Stillwater Shore, 7 Harbor, 8 Resonance Engine, 9 Dark Reaches. Six critters per district (54 new). Dark Side sphere is the innermost chamber.

**Bedrock Fortress rooms (D16):** Gate of the Stone Guard, Vault, Guard's Hall, Prism, Dark Side sphere, Water Door.

### 6.8 World map, cultural and park zones

| Zone | Painter / line | Music | Keeper | Status |
|---|---|---|---|---|
| Celtic Highlands and Book of Kells | Alan Lee; Kells register | Rocky Road to Dublin (first EchoMelody canon, Sep 17) | The Bard, Limner | Caught up Sep 11 |
| Transylvanian Forest | | Owl Watch | The Owl | Caught up; strigoi portrait done |
| Norse Coast and Fjords | Rackham | Danheim and Wardruna (R) | Trolls as citizens, Vaulknut, Erik | Showcase wide done |
| Stone Circles | | Lithophone; the Tap | | Wide done |
| Aegean Light / Greece | Monet; Moreau | | The Bearsark, the Gardener | KIT-N owed |
| Labyrinth of Crete | | | Asterion, Masquerade | Spec |
| Desert Bone (Egypt) | O'Keeffe, bone-bleached | 111Hz drone, nay, hand drums | Bastet, Anubis, Ma'at | Cast live |
| Peru / Andean Highlands | Bierstadt | | Quilla Mamani | Chain passed |
| Japan (Fuji, summer shrine) | Hokusai | | Kaguya; four-station wing (Oct 2) | Wing keeper open |
| India | | | | Chain passed |
| China | Ink-wash | | Terracotta Army, the One Who Is Awake | Spec |
| Mesopotamia | Hokusai (Sep 3) or Roerich (template): conflict | Nytt Land lyre (R) | Gilgamesh, Nisaba | Spec |
| Silk Road | Rackham, Gorey bandits | Kashmir as walking-piece teacher | Caravan | Art complete (28 assets) |
| Mount Shasta | | Lisa Gerrard, Schumann 7.83Hz (P) | | Hinge zone |
| Yellowstone | Benton | Steam-work blues (P) | Redcaps | Chain passed |
| Colorado Plateau | Maynard Dixon | Frisell (P) | Ridge Renfro | Chain passed |
| Rockies | Bierstadt | Gossip tavern folk, Pärt still point (P) | Pull-key chain | Chain passed |
| Superstition Mountains | Bierstadt | Morricone (P) | Lost Dutchman | Chain passed |
| Appalachians (Smokies) | Wyeth | Copland (P) | Gnomes, Sylphs | Complete |
| Petrified Forest | Ansel Adams | | | Chain passed |
| Redwood Cathedral | Emily Carr | 30 Seconds to Mars treatment | Queen of Roots, Mona | Chain passed |
| Atlantis | Royo | Vangelis (P) | Beverley (touch), Larimar | Zone image live |
| Camelot and Avalon | | Howard Shore (kept) | Three Arthurs, Lady of the Lake, Merlin | Spec; Avalon finale ruled |
| Bayou and French Quarter | | Swamp recordings, Dr. John register (P) | Bog Fairy Golem, Marie Laveau, Cian, the Tourist | Painted in D15 |
| Miskatonic Annex | Rousseau | | Quire, Naut | Chain passed |
| Trovant Garden | Kossoff | Overdriven distorted folk (P) | Stanca | Chain passed |
| Standing Grove (Toronto) | | | | Dossier; sensitivity gate closed |
| Spiral Gallery | Escher, Rothko, Carr, Hokusai, Kiefer, Agnes Martin | | Aurallia's studio | Chain passed |
| Poison Garden / Gorgon's Garden | O'Keeffe x Klimt | Depeche Mode register | Medusa, Belladonna | Ruled |
| Slavic zone | | Boreal Chime Carillon | | Spec |
| Cave City (Peruvian, in a sleeper's ribcage) | | | | Spec: `geode_inn_cave_city_master_spec.md` |
| Lost and Found | | | The Head Finder | Ruled Sep 11 |
| Port Purgatory | | | The Bureau of Between Carriers | Spec Sep 24 |
| Outback (roo zone) | | | Roos, wallaby, platypus | Seed only; not ruled as a zone |

### 6.9 Counts on record

- z01-z37 numbered zones (repo template), Elio's Sep 26 statement.
- "In the forties" (client, Sep 4).
- 85 zones in the Zone Deck: Inn Proper 22, Waters 22, Mythic and Cultural 23, Wild World 18 (Oct 13).
- 222 zone specs, 1,228 documents in the repo (Elio, Oct 9).
- 19 blueprint settings and 7 levels in the 3D tree (Sep 12-25).
- Early counts: 25 environments (Aug 21, commit log; 33 with the 8 catacomb scenes in the early chat, and 41 video clips); 9 levels (Aug 27); 13 layers, 5 hubs, 11 cultural zones, 7 national parks (audit, Aug 24); 36 zone visuals (Aug 30); 37 zones (Aug 29 onward; the Godot world map had 37 pins, Aug 31). Section 6.10 has the zones from the founding period.

### 6.10 Zones from the founding period (July 12 to August 30)

These are zones and places named in the early chat, Before the Song or the commit log that the tables above do not list, or that they list with less detail. Status uses the brief's words. "Built" means the commit log shows a design doc or code, not a client ruling.

| Zone or place | What the early sources say | Source and date | Status |
|---|---|---|---|
| Atlantis | Five sub-zones: the Approach, Sunken Plaza (Heart Crystal at 432Hz), Crystal Chamber (Silica Thread origin; "Atlantis did not sink, it chose the deep"), Drowned Library, Coral Gardens. Merfolk playable. Another list has four sub-zones. | Early chat, Aug 21; commit log, Aug 22 | Ruled Aug 21 (the client agreed it becomes a full zone) |
| Canopy of Sala | Kelethin-style tree city with no railings. A fall means forgetting. Singing Tree quest. Starfall event. Canopy Elves. | Early chat, Aug 21 (8:08 PM); commit log, Aug 22 | Ruled Aug 21 (approved) |
| Terracotta Army | Acoustic archaeology among 8,000 warriors, mercury ocean, the emperor's choice. Painted in ink-wash. China is the Mulan-style zone. | Early chat, Aug 21 to 22; commit log, Aug 22 | Ruled (client asked for it; Elio designed it) |
| Poison Garden (Alnwick) | Restraint is the mechanic ("don't touch, taste or smell"). Foxglove, belladonna, castor bean, giant hogweed, the Yew (oldest node of the Song) and the opium poppy. | Early chat; commit log, Aug 22 | Built (commit, Aug 22) |
| Greece and Hades | Pomegranate tree on the main floor with roots to Charon's river. Tartarus is the Mars Prison. Hades is the administrator, not a villain. | Early chat; commit log, Aug 23 | Ruled (client chose to start with Greece) |
| Labyrinth of Crete | Mirror mechanic; Ariadne's thread is the Song. The Minotaur is the player's quest to sit with, not slay. | Early chat; commit log, Aug 23 | Built (commit, Aug 23) |
| Camelot, Round Table, Avalon, Newgrange | Round Table room with an empty center and three states (Full, Emptying, Rebuilt). Avalon is the retort. An unknown catacomb layer beneath Camelot leads to Newgrange. | Early chat; commit log, Aug 23 | Ruled (client asked for the catacomb layer to Newgrange) |
| Seelie Kingdom | Lothlorien feel; mallorns as the Inn-Tree's roots inverted; the light never changes because the Song never changes. | Early chat, Aug 22 to 23 | Ruled (client decided) |
| Miskatonic Annex | Brick building on the Inn grounds with the Lost Books Collection. Cthulhu stays by the fire; the Annex holds his rare books. It is the octopus's head. | Early chat, Aug 22 to 23; commit log, Aug 22 | Ruled (client asked for Miskatonic; Elio proposed the Annex) |
| Redwood Cathedral | Five layers from floor to crown. Resonance Pulse goes silent. Pit houses from shed materials only. Emily Carr look. | Early chat, Aug 22 or later | Ruled (the client described the zone) |
| Clockwork Skies | Sky pirates and clockwork. The Arcana with a gearwork heart at 50 BPM. A Harlock-style captain. The cabbit is the ship's heart. | Early chat, Aug 22 or later; commit log, Aug 27 | Ruled (client decided); crew design Built (commit, Aug 27) |
| Bayou and Buried Cities | Three layers: swamp, colonial Gothic church (resonance chamber), buried cities. Green swamp fire and a moss compass. | Early chat, Aug 22 or later; commit log, Aug 29 | Ruled (client decided on the swamp) |
| Slavic Fjord of Stars | Aurora phases: green is past, violet present, white future. | Early chat, Aug 22 or later | Ruled (client decided) |
| India, Ghats of Kali | Kali's garland of false selves; three fires. | Commit log, Aug 23 | Built (commit, Aug 23) |
| Peru and the Sleeping Giants | Apus as guides tied to the giants. "The Stirring" rhythm game on the terraces. | Early chat, Aug 22 or later | Ruled (client decided) |
| Mesopotamia and the Ziggurat | Tenth Canopy City platform, the oldest, a ziggurat. | Commit log, Aug 24 | Built (commit, Aug 24) |
| Lighthouse, Town, Sepulchre, Locker | See section 6.7. The lighthouse was added at the client's request ("how have I forgotten lighthouses"). | Early chat, Aug 22 or later | Ruled (lighthouses); the rest August canon |
| Tidal caves and star gate | Six caves. A star gate with pulsing liquid leads to Atlantis. | Early chat, Aug 22 or later | Ruled (client decided on the star gate) |
| Prism and Bedrock Fortress | Shattrath-style deep sanctuary with a portal that never opens and shows alternate Inns. Compact fortress with a Stone Guard. Estate of Unrest instances and an Undercity-style layer above. | Early chat, Aug 22 or later | Ruled (client decided on the templates; Elio named the Prism) |
| Aegean Light and Desert Bone | Artist-lens zones: Monet's five light phases; O'Keeffe's sand as time and Form Sight. | Early chat; commit log, Aug 23 | Built (commit, Aug 23) |
| Trovants and Trovant Garden | Rain layer; trovants grow by mineral deposition like Roman concrete. | Commit log, Aug 25 to 27 | Built |
| Aqueduct System | You guide the water, you do not control it. | Commit log, Aug 25 to 27 | Built |
| Petra, the Rose City | New zone doc. | Commit log, Aug 29 to 30 | Built |
| Fuji Cottage | The Undercity's surface embassy on Mount Fuji. One room, no door. | Commit log, Aug 24; Before the Song | August canon |
| Cave City | Peruvian cave city in a sleeper's ribcage; building tier 5. | Commit log, Aug 24 | Built (commit, Aug 24) |
| Muses' Room | In the In-Between, nine empty chairs. | Before the Song | August canon |
| Spiral Gallery | A Guggenheim-style descent in chronological order from prehistory down to the catacombs. Later six lens chambers (Carr, Escher, Rothko, Hokusai, Kiefer, Agnes Martin). | Early chat, Jul 22; Before the Song | Proposed Jul 22 (client did not object); six lenses August canon |
| Modern Day Legends nook | Own nook off the main floor. Inclusion test: "will this still be worth telling in 2126?" | Early chat, Jul 22; Before the Song | Ruled Jul 22 |
| Garden zones (Van Gogh) | Two gardens: the Catalyst's wild one (Saint-Remy) and the Gardener's tended one (Auvers). Bedroom rest space with a buff. Starry Night, Sunflowers, Irises, Olive Trees, Wheat Field, Almond Blossoms. | Before the Song | August canon |
| Shadow Inn instances | Eight Shadow zones (Frozen Court, Waking Mountain, Sealed Tomb, Drowned Cathedral, Gold City, Fallen Forest, Stopped Clock, Fallen Pantheon) then eight more (Atlantis, Mesopotamia, Canadian Rockies, Norse, Cave City, Meadery, Poison Garden, Redwood Cathedral). | Commit log, Aug 28 | Built (commit, Aug 28) |
| Grand Collision, Dark Side, Hollow Earth, Final Room, Cinema, Hollow Men Mines | Late-August endgame and dream-derived zones. The Final Room is the true ending after STAY, LEAVE, HIDE. | Commit log, Aug 28 to 30 | Built |
| Planet Chamber, Cosmic Layer | Jupiter, Mars (reincarnation school), Pluto Gate, Galaxy Core. The Planet Chamber is an orrery of seven planets as Camelot knights. | Commit log, Aug 27 to 29 | Built |
| Sherwood Forest Faire | A pre-built dormant faire zone for two faire partners. | Commit log, Aug 30 | Built; placement open |
| Elsewhere in the open world | Norse (Erik's platform and the Jotunheim chain), Mediterranean, Colorado Plateau, Yellowstone, Appalachian Range design docs, Canadian Rockies, Superstition Mountains, Badlands Ether, Petrified Forest (O'Keeffe, extended to the Southwest). | Commit log, Aug 23 to 29 | Built |

---

## 7. Open and to reconcile

### To reconcile

1. **Level numbers.** The Sep 10 blueprint numbers Cosmology as Level 9 and the Main Floor as Level 5, with Catacombs 3 and Bedrock Fortress 2. The Oct 14 master level system numbers them 1 to 9 top-down. The Sep 11 painting list used a third scheme (L9 Cosmology, L8 Clockwork, L7 Canopy City, L6 Staircase). Recommend the Oct 14 numbering; update the blueprint tables.
2. **Clockwork Skies versus Canopy City.** The repo level doc says Level 2 is "Clockwork Skies (The Canopy City)". The blueprint makes Canopy City a separate level with nine cultural platforms.
3. **Hollow Earth versus Level 9.** Level 9 Undercity is named "Deep Roots"; Hollow Earth sits at the roots. The Dark Side is called the "innermost room of Level 9" (Oct 14) and also the center of the Grand Collision.
4. **Zone IDs.** The repo template lists z37 as the Final Room. Elio's Sep 26 statement says z37 is the Stone Circle Chamber. The template z-list also predates the Fae and Water renames.
5. **Zone count.** 37, "forties", 85, and the blueprint's 100-plus rooms. No single reconciled list exists.
6. **Artists.** Cosmology: Turner (Sep 3) versus Dali (Sep 4 and template). Clockwork: Da Vinci (template z02) versus Dali (Ruled Sep 4). Catacombs: Goya (Sep 3) versus Klimt. Mesopotamia: Hokusai versus Roerich. The 37 versus 42 artist count remains unresolved.
7. **The Royal and The Vestibule.** The Sep 2 push summary lists both; the Sep 11 roster formalizes The Royal only. Unclear whether the Vestibule (ROM counter-thesis zone) was folded in or dropped. The Royal is "Level 3B" in the old numbering; it has no level under the Oct numbering.
8. **World Grid region count.** The spec says nine regions but lists eight plus the Outer Ring.
9. **Water layers.** Names and order differ between Sep 2, Sep 3, Sep 10 and Sep 13.
10. **National parks.** Nine parks (Sep 3) versus five parks plus Shasta (Sep 10).
11. **Blueprint tables.** Mark Sep 10-11 statuses stale; the 3D JSON listed seven levels and zero rooms placed as of Sep 25.
12. **The Silo.** The Silo is a spine, not a floor (Oct 14). The 3D blueprint and the Room Items Blueprint describe it as round page-floors with spokes. Whether these are the same thing is not stated.

Added from the founding period:

13. **Level schemes in August.** Before the Song has two (the walk-through list and the Master Storyline list) and the Aug 27 commit log has the nine-level build. The Oct 14 numbering wins; the nine-level build matches it.
14. **Hub count.** Five hubs (Observatory, Inn, Undercity, Canopy City, Coast Hub) in the Aug 24 hub chapter and the commit log. The exterior chapter of Before the Song says "two hubs", the Canopy City and the Coast Hub. They can be read as five hubs with two exterior ones. The later Godot hub (section 1.1) is a different, single hub.
15. **Canopy City platforms.** Nine plus a Neutral Platform (Aug 23 commit log), then ten with Mesopotamia (Aug 24). The vendor table says "nine vendors" but lists eight plus the Keeper.
16. **Water layers.** Three early lists (the early chat, the water doc, the Walk-Through) disagree on layers 1, 3, 6 and 7, and on where Atlantis and the Crystal Core sit. One part of Before the Song calls Atlantis the deepest zone, below the Locker, and another puts the Crystal Core below Atlantis. Also: six tidal caves are named differently in different lists (Uncharted Cave, Crystal Grotto, Echo Chamber).
17. **Nidavellir and Svartalfheim.** The Aug 18 mapping gives Svartalfheim to the Unseelie Court. The Master Storyline (Aug 22) uses Nidavellir/Svartalfheim as the Deep Forge and also uses Svartalfheim for the Unseelie Court. Before the Song treats Unseelie Court as Svartalfheim and Deep Forge as Nidavellir.
18. **Cthulhu's place.** Main floor by the fireplace (Master Storyline, Aug 22), in the catacombs by the fireplace (another section of Before the Song), at Atlantis and the Crystal Core (water doc). The Annex is the octopus's head. Not reconciled.
19. **The cabbit and the Constant's crystal.** The crystal pulses at 41.7Hz in one passage and at 50 BPM in another. The cabbit is the player's companion, the Arcana's heart and the Constant's companion Eres. Both are stated, not reconciled.
20. **Mesopotamia painter.** Hokusai (Sep 3) versus Roerich (template) was already listed; the Aug 24 commit log adds the ziggurat as the tenth platform with Nisaba and Gilgamesh, which does not decide the painter.
21. **Parks.** Seven (Aug 22 chapter), eight US plus four international (Aug 27), over twenty names in Before the Song, nine (Sep 3), then five plus Shasta (Sep 10). The Sep 10 structure wins.
22. **Zone counts.** 25 environments, 33 environments, 41 clips, 9 levels, 13 layers audited, 36 visuals, 37 zones, "forties". No single list ties them together.
23. **Aesthetic docs.** The Aug 22 aesthetic docs name Klimt for the Catacombs, Matisse for the Staircase and Dali for Cosmology. These agree with the later table for Cosmology and Staircase. The Catacombs (Goya in the Sep 3 chat) is already item 6.
24. **The In-Between.** Neverwhere layer (Aug 24), Limbo platformer (Aug canon) and the Oct 14 half-level are the same idea in three stages. Which of the early details (the Muses' Room, the Grey Market) carry into the Level ½ spec is not stated.
25. **Cycle counts.** Before the Song has "forty-two cycles" in the Crone's and Einstein's count, while the Observatory text says "billions of cycles". Treat 42 as the Crone's count, not a hard number. The artist count is 42 in the Aug 29 to 30 commit log and 37 elsewhere (item 6 above).
26. **Combat in zones.** The early canon says "no lethal combat anywhere", yet Elio's tabletop analysis offers combat as one of three resolution paths per zone quest and the Shadow Inn engine (commit log, Aug 28) has bosses and loot tiers. The Sanctuary law (section 1.7) stands.

### Open (waiting on the client)

- Great Hall: mark LIVE; Host art; position on the Main Floor level; seven gaps (Innkeeper's List, walking stick, chibi ravens, climbing passage, front door image, Pulse Line wiring, which staircase is THE staircase).
- Blue Box's true name; tube stop order.
- How many hard seams, and where (Catacombs first).
- Void half-level content.
- Zone intent as a bible field; the "reclaiming below" zone (Neverwhere register) is undesigned.
- Which zones pilot the Module Grammar checklist.
- Standing Grove design session; Haudenosaunee material gated behind a cultural review.
- Tartan sett, Highland Games kit, Japan wing keeper, engine room placement, Dark Side build.
- Mini-Inn physical model: every level has identical room layout, themed per level (Ruled Oct 11, physical build only).
- Gathering spaces for Cosmology, Clockwork Skies, Archive, Spiral Gallery, Water, Undercity (all Proposed).
- Outback roo zone: not formally created.
- Planted Tree Law: not found in the repo; confirm it was filed.

Open from the founding period (all still unsettled in the early sources):

- The Fog Path (the eighth Coast Hub arm) is a placeholder with no zone built or named.
- The Hollow (Unseelie surrounding zone) was flagged "needs expansion" (Aug 22). Titania as a separate NPC is undecided.
- Niflheim, Jotunheim giants, Nidavellir dwarf masters and Asgard's play (Jupiter gate, Mars prison, Pluto's gate) were undesigned in the Aug 22 gap list.
- The seven empty houses of the Town quest have no individual stories written.
- Bosch's fit as a zone was "left to the client's call" between the Bedrock Fortress and the Tidal Caves (commit log, Aug 24).
- The Walk-Through next steps (Aug): interlock the seven water layers, design the Pacific Northwest and Redwood Fae hierarchy, map the Bedrock Fortress and Stone Guard, and move the Spiral Gallery into the artist-led zones.
- Whether the cosmology orrery is a dodecahedron or only "should be", and whether the Cosmology day and night cycle is built.
- The Cartographer has not found the passage from Layer 7 to Layer 3.
- The 2Hz gap between 40Hz and 42Hz (damage or evolution) is not decided.
- The 1909 Grand Canyon temple story and the cryptid material are told "as told", not as fact. Keep the modern-legend framing.
- Real-person NPCs and zone material may need approval before release. The commit log records sensitivity (Aug 30).

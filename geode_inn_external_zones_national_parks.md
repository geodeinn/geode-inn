# Geode Inn — External Zone System
## The World Map & National Parks
## Complete Design Document

---

## Overview

The External Zone System is the Inn's connection to the real world. The Inn is the HUB (interior, permanent, home). The World Map is the INTERFACE between the Inn and the earth. The National Parks are the EXPEDITION ZONES — real-world locations where the player goes to collect stones, discover lore, and experience the geology and mythology that the Inn is built from.

The dynamic is simple and fundamental:

**The player goes OUT to collect. The player returns IN to create.**

The Inn processes what the Parks provide:
- Stones collected in parks → the dragon's geode (Main Floor)
- Lore discovered in parks → the archive (Catacombs) and the Modern Legends shelf (Main Floor)
- Minerals found in parks → the Bead Board (Undercity)
- Geological knowledge → Charles's Natural Archive (Catacombs)
- Cultural knowledge → the Library Nook (Main Floor)

The National Parks are the Inn's REAL-WORLD ANCHORS — the places where the game's fiction meets the earth's reality. The player who learns about Yellowstone's obsidian in the game can visit Yellowstone and see real obsidian. The player who collects Andean stones in the game can learn about the real Andes. The parks are the Geode Inn's educational mission made playable: real geology, real mythology, real geography, through play.

---

## The World Map

### Interface Design

The World Map is accessed from the Main Floor — a large table in the entrance hall, styled as an antique cartographer's desk. The player approaches the table and the map opens (full screen).

**Visual Style:**
- Antique map aesthetic — parchment texture, hand-drawn coastlines, compass rose
- Stone pins: small mineral icons at each stone's geographic origin (164 pins)
- Lore pins: small mythological symbols at each country's location (191 pins)
- Park pins: larger, illustrated markers at each national park site
- Portal pins: the four stone circle locations (Stonehenge, Avebury, Callanish, Ring of Brodgar) — glow when active

**Map Layers (toggleable):**
1. **Stone Layer** — shows all 164 stone pins. Each pin is color-coded by stone family (quartz, feldspar, etc.). Clicking a pin shows the stone's data (name, frequency, Mohs hardness, color notes, geographic region).
2. **Lore Layer** — shows all 191 lore pins. Each pin is a mythological symbol (a raven for Norse regions, a serpent for Mesoamerican, etc.). Clicking a pin shows the region's mythology (gods, creatures, stories).
3. **Park Layer** — shows all national park expedition zones. Each park pin is illustrated with the park's defining feature (a geyser for Yellowstone, a canyon for the Grand Canyon). Clicking a park pin opens the expedition interface.
4. **Portal Layer** — shows the four stone circle portals. Active portals glow; inactive portals are dim. The portal layer connects to the Fae Kingdom.
5. **Ley Line Layer** (unlocked through "The Map That Hears" quest from the Cartographer in the Canopy City) — glowing threads connecting sacred sites across the globe. Ley line nodes glow brighter where lines intersect. Stone pins on ley lines pulse: charged stones glow gold, neutral stones glow silver. Lore pins at node sites show a small ley line icon. The Silk Road routes appear as major arteries — the paths carrying the most energy. The ley lines emanate FROM the poles — tracing any line back to its origin reveals the Hollow Earth. This layer reveals the earth's nervous system: the 42Hz frequency network connecting every sacred site the Inn's mythology is built on.

### The Map as a Game System

The World Map is the Inn's 10th zone — the one that SURROUNDS the Inn. The Inn is the tree; the World Map is the earth. The map is:
- A NAVIGATION interface (select expedition destinations)
- a DATA BROWSER (explore the stone and lore databases geographically)
- a PROGRESSION tracker (which parks have been explored, which stones collected, which lore discovered)
- a CONNECTION map (how each park connects to the Inn's internal zones)

---

## The Expedition Dynamic

### How Expeditions Work

An expedition is a limited-time exploration of a national park. The player:

1. **Selects a park** on the World Map (Park Layer)
2. **Prepares** at the Visitor Center (the park's entry point)
3. **Explores** the park's trails and collection points
4. **Collects** stones at geological sites
5. **Discovers** lore at cultural sites
6. **Returns** to the Inn with findings

### The Expedition Structure

Each park has:

| Element | Description |
|---|---|
| **The Visitor Center** | Entry point. Park ranger NPC. Information, quest board, gift shop. The park's equivalent of the Innkeeper's List. |
| **Trails** | Paths through the park. Each trail leads to collection points and lore sites. Trails have difficulty ratings (easy walk → strenuous hike). |
| **Collection Points** | Specific geological sites where stones can be found: outcrops, creek beds, mines, eroded surfaces. Each point yields specific stones. |
| **Lore Sites** | Specific cultural sites where lore can be discovered: petroglyphs, ruins, sacred sites, historical markers. Each site reveals a piece of the region's mythology. |
| **Seasonal Cycle** | The park changes with seasons. Some stones are only accessible in certain seasons (winter ice reveals certain outcrops, spring melt exposes creek beds, summer heat limits exploration time). |
| **Weather System** | The park's weather affects exploration. Rain makes trails slippery (stamina drains faster), heat limits distance (the expedition timer shortens), snow blocks access (certain trails close). |
| **Expedition Timer** | Each expedition has a natural end: sunset (the park closes), supplies running out, or weather changing. The timer creates urgency — the player can't collect everything in one visit. Multiple visits are required. |

### The Park Ranger

Each park has a Ranger NPC — the park's main character. The Ranger is:
- The park's equivalent of the zone's main character (like the Crone for the Catacombs, Jay for the Campgrounds)
- A geological and cultural expert — provides information, gives quests, identifies stones
- Different for each park — each Ranger reflects the park's character (the Yellowstone Ranger is geothermal-obsessed; the Grand Canyon Ranger is a layers-and-time philosopher; the Smokies Ranger is an Appalachian storyteller)

The Ranger gives:
- **Collection Quests** — specific stone collection goals ("Find three specimens of obsidian from the geyser basin")
- **Discovery Quests** — specific lore discovery goals ("Find the Crow petroglyph near the Yellowstone River")
- **Survey Quests** — map the park's trails (explore every trail, mark every collection point)
- **Photography Quests** — capture specific geological features (the photography mechanic uses the game's screenshot system — the player takes a "photo" of a geological feature and it's added to the park's photo album)

---

## Geological Classification System

The parks are organized by GEOLOGICAL TYPE — the fundamental geological process that created the park's stones. Each type produces different stones, different frequencies, and connects to different Inn zones.

### The Eight Geological Types

| Type | Process | Stones Produced | Inn Connection |
|---|---|---|---|
| **Volcanic** | Magma cooling, volcanic activity | Obsidian, Basalt, Pumice, Peridot, high-temperature minerals | The Forge (Campgrounds) — the fire that makes |
| **Sedimentary** | Layered deposition, time and pressure | Sandstone, Limestone, Shale, fossil-bearing stones | The Catacombs — layers of history |
| **Metamorphic** | Heat and pressure transformation | Schist, Gneiss, Marble, Slate, transformed minerals | The Staircase — transformation |
| **Glacial** | Ice shaping, glacial erosion | Glacial till stones, shaped granite, ice-polished stones | The Water Zone (ice) — the Trench layer |
| **Desert** | Arid weathering, sparse exposure | Desert Rose, Barite, agates, desert-varnished stones | The Crystal Gardens (Fae Kingdom) — sparse beauty |
| **Coastal** | Wave action, tidal erosion | Beach pebbles, sea glass, wave-polished stones | The Water Zone (Surface) — the coast |
| **Hydrothermal** | Hot water mineral deposition | Quartz crystals, travertine, hot-springs minerals | The Source (Water Zone Layer 7) — the 42Hz water |
| **Cultural/Mythological** | Stones with deep human/cultural significance | Preseli Blue Stone, Jade, Turquoise, stones with mythological weight | The Fae Kingdom (portals) and the Archive (Catacombs) |

Each geological type is a CATEGORY in the Sonic Mineral Codex — stones from the same geological type share frequency characteristics (volcanic stones tend to have higher frequencies from rapid cooling; sedimentary stones have mid-range frequencies from slow formation; metamorphic stones have complex frequencies from multiple transformations).

---

## The National Parks

### US National Parks

## The 12 Primary Ley Line Nodes

The 12 primary ley line nodes are the strongest sacred sites on Earth — the points where the most ley lines intersect. Each node is a point of concentrated 42Hz energy. Stones found at these nodes are NATURALLY CHARGED — their frequency amplified by centuries of ley line resonance. The nodes are mapped to the National Park system:

| # | Node | Park | Type | Charged Stones | Effect |
|---|------|------|------|----------------|--------|
| 1 | Yellowstone | Yellowstone NP (US) | Geothermal — the Earth's breath | Obsidian, Yellowstone Geode | Stones mined here arrive at 25-30% charge. Geothermal frequency adds a fire harmonic. |
| 2 | Grand Canyon | Grand Canyon NP (US) | Sedimentary — the Earth's memory layers | Agate, jasper, turquoise | Sedimentary frequency adds a time harmonic — stones age faster (mature in hours instead of days). |
| 3 | Yosemite | Yosemite NP (US) | Granite — the Earth's bone | Quartz, garnet, tourmaline | Granite frequency adds a structural harmonic — stones are harder to crack in combat. |
| 4 | Great Smoky Mountains | Great Smoky Mountains NP (US) | Forest — the mycorrhizal network's surface expression | Moonstone, smoky quartz | Forest frequency adds a root harmonic — stones sent through the Mycorrhizal Network arrive with an extra charge. |
| 5 | Badlands | Badlands NP (US) | Erosion — the Earth's exposed frequency | Fairburn agate, rose quartz | Erosion frequency adds an exposure harmonic — stones glow brighter in dark spaces. |
| 6 | Acadia | Acadia NP (US) | Coastal — where ley lines meet the Atlantic | Tourmaline, beryl, quartz | Coastal frequency adds a water harmonic — stones resonate with the Water Zone. |
| 7 | Hawaii Volcanoes | Hawaii Volcanoes NP (US) | Volcanic — the Earth's forge | Peridot, olivine, volcanic glass | Volcanic frequency adds a fire harmonic — peridot mined here are the strongest in the Inn (Queen of Roots' collection stones). |
| 8 | Petrified Forest | Petrified Forest NP (US) | Silicified — the stone that was wood | Petrified wood, agate, chalcedony | Silicified frequency adds a transformation harmonic — stones carry the memory of being something else. |
| 9 | Giant's Causeway | Giant's Causeway (Ireland) | Basalt — the Earth's geometry | Basalt columns, Irish marble | Basalt frequency adds a geometric harmonic — stones align to grid patterns more easily. |
| 10 | Serengeti | Serengeti (Tanzania) | Savanna — the Earth's drum | Tiger's eye, citrine, tanzanite | Savanna frequency adds a rhythm harmonic — stones pulse at the 50 BPM heartbeat more clearly. |
| 11 | Socotra | Socotra (Yemen) | Dragon Blood — the Earth's strangest forest | Dragon's blood resin, incense | Dragon's blood frequency adds a rarity harmonic — stones mined here are more likely to attract companions. |
| 12 | Uluru | Uluru (Australia) | The deepest node — the Earth's navel | Opal, moonstone, zircon | Uluru's frequency is the STRONGEST — stones mined here arrive at 40-50% charge. The deepest ley line point on the surface. The Cartographer's final node for "The Map That Hears." |

### Secondary Nodes

Every country in the 191-country lore database that has a stone circle, pyramid, temple, or sacred site is a secondary ley line node. These are visible on the world map (Ley Line Layer) but carry less energy than the 12 primary nodes. Stones from these locations are naturally charged at 5-15%.

Notable secondary nodes: Stonehenge (Preseli bluestone), Machu Picchu (Andean opal), Angkor Wat (zircon), the Nazca Lines (Nazca desert agate), the Pyramids of Giza (lapis lazuli — the strongest secondary node in Egypt).

### Tertiary Nodes

Every stone in the 198-stone database has an origin point. Stones from ley line nodes (primary or secondary) are NATURALLY CHARGED. Stones from non-node locations are NEUTRAL — they need to be charged by traveling along ley lines.

#### 1. Yellowstone National Park (Wyoming/Montana/Idaho)
**Geological Type:** Volcanic + Hydrothermal
**Inn Connection:** The Forge (Campgrounds) + The Source (Water Zone)

Yellowstone sits on a supervolcano. The geothermal features — geysers, hot springs, fumaroles — are the surface expression of the earth's internal heat. Yellowstone is the Inn's VOLCANIC ANCHOR — the place where fire and water meet underground.

**Stones Available:**
- Obsidian (volcanic glass — the stone that freezes fire)
- Travertine (hot springs deposit — the stone that water builds)
- Yellowstone Geode (volcanic geodes — the stone that holds a cave inside)
- Selenite (gypsum crystal — the stone that catches light)
- Jasper (volcanic-associated — the stone that paints with iron)

**Frequencies:**
- Obsidian: ~950Hz (high — the rapid-cooling frequency)
- Travertine: ~230Hz (mid — the slow-building frequency)
- Yellowstone Geode: ~420Hz (the hollow stone — the cave frequency, connecting to the dragon's geode)
- Selenite: ~330Hz (crystal — the light-catching frequency)
- Jasper: ~310Hz (iron-bearing — the painted frequency)

**Lore:**
- Crow mythology: the geysers as the earth breathing
- Shoshone mythology: the hot springs as healing sites
- Nez Perce mythology: the Yellowstone River as a journey
- The concept of "supervolcano" as a mythological-scale geological force — the sleeping giant

**Ranger:** Ranger Cole — a geothermal obsessive. Talks about magma chambers the way the Firekeeper talks about stories. Cole's hands are always warm (from touching thermal features). Cole's quest: "The Sleeping Giant" — explore the geyser basin and map the thermal features' temperatures, connecting each feature to a stone it produces.

**Game:** Geyser Timing — the player must time exploration around geyser eruptions. Each geyser has a cycle; the player must be at the right collection point when the geyser erupts (the eruption exposes new stones). The timing puzzle teaches geological patience: the earth gives up its stones on ITS schedule, not yours.

---

#### 2. Grand Canyon National Park (Arizona)
**Geological Type:** Sedimentary
**Inn Connection:** The Catacombs — layers of history

The Grand Canyon is geological time made visible. The canyon's walls are a chronological record — each layer is a different era, a different environment, a different chapter of the earth's story. The Grand Canyon is the Inn's TIME ANCHOR — the place where the player can SEE deep time.

**Stones Available:**
- Red Sandstone (the Supai Group — the stone that was a desert)
- Limestone (the Kaibab Formation — the stone that was a sea)
- Shale (the Hermit Formation — the stone that was a delta)
- Copper Minerals (the mineralization in the canyon walls — native copper, malachite)
- Turquoise (nearby deposits — the stone that copper becomes in arid conditions)

**Frequencies:**
- Red Sandstone: ~290Hz (the warm, layered frequency)
- Limestone: ~210Hz (the cool, marine frequency)
- Shale: ~260Hz (the transitional frequency)
- Copper: 79Hz (the Blacksmith's chord root — copper found here)
- Turquoise: ~250Hz (the desert-blue frequency)

**Lore:**
- Hopi mythology: the canyon as a place of emergence — the Hopi emerged from the canyon into this world
- Navajo mythology: the canyon as a boundary between worlds
- Havasupai mythology: the canyon as home — the people of the blue-green water
- The concept of "deep time" — geological time scales that dwarf human history

**Ranger:** Ranger Luna — a geologist who sees time in stone. Luna talks about the canyon's layers the way the Crone talks about archive entries: precise, measured, reverent. Luna's quest: "The Descent" — the player descends through the canyon's geological layers (the trail from rim to river), collecting a stone from each layer. Each stone is a chapter; the full collection is the earth's biography.

**Game:** Layer Descent — the player hikes from the rim to the river, collecting a stone at each geological layer. Each layer is a time period; the deeper the player goes, the older the stone. The descent is the Catacombs' "Deep Read" made physical — geological knowledge through the body's descent.

---

#### 3. Petrified Forest National Park (Arizona)
**Geological Type:** Sedimentary (fossil-bearing)
**Inn Connection:** Charles's Natural Archive (Catacombs) — the earth's memory

The Petrified Forest is the place where wood became stone. Trees that fell 200 million years ago, buried by volcanic ash, their organic material replaced by silica — the stone that was once alive. The Petrified Forest is the Inn's TRANSFORMATION ANCHOR — the place where the player witnesses the alchemy of matter becoming other matter.

**Stones Available:**
- Petrified Wood (silica-replaced wood — the living stone)
- Jasper (associated with the petrified wood — the colorful silica)
- Agate (banded silica — the stone that paints in layers)
- Chalcedony (microcrystalline quartz — the smooth silica)

**Frequencies:**
- Petrified Wood: ~637Hz (quartz family — but with a resonance that feels... different. The wood's grain is preserved in stone; the frequency has a wood-grain texture that no other quartz has)
- Jasper: ~310Hz (the painted frequency)
- Agate: ~300Hz (the banded frequency)
- Chalcedony: ~640Hz (the smooth frequency)

**Lore:**
- Puebloan mythology: the stone trees as ancestors — the trees that became permanent
- The concept of "replacement" — not death, but transformation. The tree didn't die; the tree became a different kind of permanent
- The Navajo name for the area: "Tsé Chíní" — "the place where the trees turned to stone"

**Ranger:** Ranger Milo — a paleontologist who talks to petrified wood. Not literally, but Milo touches each log and says what it was: "This was an Araucaria. Two hundred million years ago, this was a tree, standing in a forest, in a world that looked nothing like this." Milo's quest: "The Living Stone" — find the oldest petrified log in the park. The oldest log has a frequency that no other petrified wood has — a deep, ancient tone, like the wood remembers being a tree.

**Game:** Fossil Matching — the player finds petrified wood fragments and matches them to the tree species they came from. The matching teaches: the stone preserves the living thing's structure. The frequency is the living thing's memory, preserved in silica.

---

#### 4. Crater of Diamonds State Park (Arkansas)
**Geological Type:** Volcanic (volcanic pipe)
**Inn Connection:** The Forge (Campgrounds) + Charles's Foundation Stone (Catacombs)

Crater of Diamonds is the only public diamond mine in the US. A volcanic pipe brought diamonds and other volcanic minerals to the surface. The park is the Inn's DIGGING ANCHOR — the only park where the player can DIG for stones. (Other parks are surface collecting; this one is excavation.)

Crater of Diamonds is geologically connected to the Oklahoma creek bed where Charles found the Foundation Stone (rough amethyst). The same volcanic/mineral region extends across the Oklahoma-Arkansas border. The Foundation Stone and the diamonds come from the same deep earth.

**Stones Available:**
- Diamond (Mohs 10 — the hardest stone, the ultimate frequency)
- Lamproite (the volcanic rock of the pipe)
- Garnet (associated with the volcanic pipe)
- Amethyst (quartz from the same mineral region — the Foundation Stone's cousin)

**Frequencies:**
- Diamond: ~1388Hz (the highest Mohs frequency — the stone that vibrates fastest, the crystal that cuts everything else)
- Lamproite: ~85Hz (deep volcanic — the earth's own frequency, close to the Source's 42Hz)
- Garnet: ~350Hz (the warm, volcanic-associated frequency)
- Amethyst: 637Hz (quartz family — the Foundation Stone's frequency, the purple rock from a creek bed, found here in a volcanic context)

**Lore:**
- The Arkansas diamond culture — the only place in the US where anyone can dig for diamonds and keep what they find
- The quartz crystal culture of Arkansas (the same region's quartz deposits — Hot Springs is nearby)
- The geological connection to Oklahoma — the deep earth that feeds both states

**Ranger:** Ranger Liza — a miner at heart. Liza teaches the player to DIG — the physical act of excavation, the only park where this is possible. Liza's hands are calloused from digging. Liza's quest: "The Deep Find" — dig deep enough to find a diamond. The digging mechanic: the player plows through volcanic soil, screening for stones. Most finds are common (lamproite, quartz); the diamond is rare — the rarest find in the park system. The player who finds a diamond earns the game's most valuable stone.

**Game:** Digging and Screening — the player digs through volcanic soil and screens it for stones. The mechanic is the park system's only EXCAVATION game — physical, dirty, rewarding. The diamond is the rare find; the common finds (quartz, garnet, lamproite) are still valuable for the Bead Board.

---

#### 5. Great Smoky Mountains National Park (Tennessee/North Carolina)
**Geological Type:** Metamorphic
**Inn Connection:** The Staircase — transformation

The Smokies are the Appalachian Mountains — the oldest mountains in North America. The stones here have been transformed by heat and pressure over hundreds of millions of years. The Smokies are the Inn's TRANSFORMATION ANCHOR — the place where the player sees what time and pressure can do to stone.

**Stones Available:**
- Rubies (corundum — the metamorphic gemstone)
- Sapphires (corundum — the blue cousin)
- Garnet (the metamorphic-associated stone)
- Smoky Quartz (the quartz that absorbed the mountains' shadow)
- Schist (the metamorphic rock — the stone that was transformed)

**Frequencies:**
- Ruby: ~697Hz (corundum — the high, clear frequency of a transformed stone)
- Sapphire: ~697Hz (same family as ruby — the frequency is the same, the color is different. The player learns: frequency is identity, color is cosmetic)
- Garnet: ~350Hz (the warm frequency — the Smokies' garnet is the Firekeeper's connection)
- Smoky Quartz: ~637Hz (quartz family — but DARK. The smoky color adds a lower harmonic, a shadow frequency, that clear quartz doesn't have)
- Schist: ~180Hz (the transformed-rock frequency — complex, layered, the stone that was something else)

**Lore:**
- Cherokee mythology: the Smokies as the ancestral homeland; the mist as the breath of the ancestors
- The concept of "transformation" — the Cherokee stories of beings who changed form, the mountains as witnesses to transformation
- The Trail of Tears connection — the forced removal of the Cherokee from the Smokies (handled with the Inn's pre-industrial focus: the event itself is post-industrial, but the Cherokee's CONNECTION to the land is ancient and is honored)
- The Appalachian folk tradition — the mountains' stones in folk magic and folk medicine

**Ranger:** Ranger Tsali — a Cherokee geologist (named for the Cherokee hero Tsali who resisted removal). Tsali speaks about the mountains the way Charles speaks about stones: with warmth and deep time. Tsali's quest: "The Old Stone" — find the oldest stone in the Smokies. The oldest stone is a piece of the continental crust — over a billion years old. The oldest stone in the park, and the oldest thing the player will ever hold.

**Game:** Elevation Collection — the player hikes trails at different elevations, collecting stones at each altitude. Higher elevations have different stones (the mountains' core is exposed at the top; the eroded surface is at the bottom). The elevation teaches: the deeper you go (up), the older the stone.

---

#### 6. Glacier National Park (Montana)
**Geological Type:** Glacial
**Inn Connection:** The Water Zone (Trench layer) — ice

Glacier National Park is the Inn's ICE ANCHOR — the place where water becomes solid and solid shapes stone. The glaciers carved the park's landscape, exposing stones that would otherwise be buried. Glacier is the place where the player sees water's power in its frozen form.

**Stones Available:**
- Argillite (the Belt Supergroup — the ancient sedimentary stone shaped by ice)
- Quartzite (the ice-polished stone — smooth from glacial grinding)
- Granite (the continental stone — exposed by glacial erosion)
- Glacial Erratics (stones transported by ice — the stones that don't belong where they are)

**Frequencies:**
- Argillite: ~220Hz (the ancient, layered frequency — 1.4 billion years old)
- Quartzite: ~640Hz (quartz family — but ice-polished, which adds a COLD harmonic, a lower shadow frequency)
- Granite: ~260Hz (the continental frequency — the earth's crust)
- Glacial Erratics: varies (the stone's original frequency + a "transported" overlay — the stone carries the memory of where it came from AND the fact that it was moved)

**Lore:**
- Blackfeet mythology: the glaciers as living beings — the ice that thinks, that moves, that remembers
- The concept of "ice as architect" — the landscape shaped by a force that is water and stone simultaneously
- The retreat of the glaciers — the ice that is disappearing (handled as a natural cycle, not a political issue; the Inn focuses on the geological reality, not the policy debate)

**Ranger:** Ranger Nápi — a Blackfeet geologist (named for the Blackfeet trickster/creator figure Nápi). Nápi is the parks' most philosophical Ranger — speaks about ice the way the Astronomer speaks about stars: with the intensity of someone who sees something others can't. Nápi's quest: "The Ice Memory" — find a stone that still holds ice from a glacier that no longer exists. The stone's frequency contains a "frozen" harmonic — a tone so low it's almost sub-audible. The frozen harmonic is the ice's memory, preserved in stone.

**Game:** Ice Navigation — the player navigates glacial terrain, finding stones exposed by retreating ice. The mechanic: the ice retreats in real-time (the park has a day cycle; as the day warms, the ice pulls back, exposing new stones). The player must be at the right place when the ice reveals a new collection point. The ice's retreat is the timer — the player races the melt.

---

#### 7. Joshua Tree National Park (California)
**Geological Type:** Desert
**Inn Connection:** The Crystal Gardens (Fae Kingdom) — sparse beauty

Joshua Tree is where two deserts meet (the Mojave and the Colorado). The desert's sparse landscape exposes stones that would be hidden in vegetation elsewhere. Joshua Tree is the Inn's DESERT ANCHOR — the place where the player finds stones in emptiness.

**Stones Available:**
- Monzogranite (the rock of Joshua Tree's iconic boulder piles)
- Desert Rose (selenite/gypsum — the stone that blooms in sand)
- Barite (the desert mineral — heavy, dense)
- Quartz varieties (the desert's quartz — clear, smoky, occasionally rutilated)

**Frequencies:**
- Monzogranite: ~280Hz (the desert frequency — dry, resonant, the stone that holds heat)
- Desert Rose: ~330Hz (selenite family — but bloomed. The rose shape adds a "blooming" harmonic — a frequency that opens outward, like a flower)
- Barite: ~370Hz (the heavy frequency — dense, grounding)
- Desert Quartz: ~637Hz (quartz family — but sun-exposed. The desert sun adds a "warmth" harmonic — a higher overtone, like the stone has been cooking)

**Lore:**
- Cahuilla mythology: the desert plants as teachers — the Joshua tree as a guide
- The concept of "finding in emptiness" — the desert teaches that the stones are everywhere; you just have to see them in the absence of distraction
- The desert's silence — the acoustic environment of the desert, where sound carries far and silence is deep

**Ranger:** Ranger Sol — a desert minimalist. Sol speaks little (like the desert itself). Sol's quest: "The Empty Hand" — the player goes into the desert with empty hands and comes back with a stone. The twist: the stone the player finds is the one the player NEEDED, not the one the player WANTED. The desert chooses. The quest teaches: sometimes the finding is the being found.

**Game:** Desert Navigation — the player navigates the desert's sparse landscape, finding stones in the emptiness. The desert's silence affects the Stone Vibration Touch System — with no ambient sound to mask the frequencies, the stones' vibrations are clearer here than anywhere else. Joshua Tree is the BEST place to learn the Stone Vibration Touch System — the silence makes the stones easy to hear.

---

#### 8. Acadia National Park (Maine)
**Geological Type:** Coastal
**Inn Connection:** The Water Zone (Surface) — the coast

Acadia is where the mountains meet the sea. The coastal stones are shaped by waves — rounded, smoothed, polished by the ocean's patient work. Acadia is the Inn's COASTAL ANCHOR — the place where stone and water interact continuously.

**Stones Available:**
- Coastal Granite (the Maine granite — wave-polished)
- Basalt (the volcanic coastal stone — the dark rock of the shore)
- Beach Pebbles (various — the water-tumbled stones, smooth and rounded)
- Sea Glass (not a natural stone, but a cultural one — human glass shaped by the sea. The sea glass is the Modern Legends shelf's mineral: the human-made thing that the water transformed)

**Frequencies:**
- Coastal Granite: ~260Hz (granite family — but wave-polished, which adds a "water" harmonic. The stone carries the water's frequency overlay)
- Basalt: ~340Hz (volcanic — but coastal, so the frequency is modified by the water's proximity)
- Beach Pebbles: varies (each pebble's original frequency + a "water-rounded" overlay — the water's smoothing adds a softening harmonic)
- Sea Glass: ~450Hz (the human-made frequency — glass has its own frequency, and the water's shaping adds a "transformed" overlay. The sea glass is the stone that wasn't a stone until the sea made it one)

**Lore:**
- Wabanaki mythology: the coast as a boundary between land and sea — the place where two worlds meet
- The concept of "water as shaper" — the coast teaches that water is the most patient sculptor
- The sea glass as a Modern Legends candidate — the human-made thing that the sea transformed into something beautiful. "Will this still be worth telling in 2126?" Yes — the sea's patience is eternal; the glass's transformation is timeless

**Ranger:** Ranger Meri — a coastal geologist who talks about waves the way the Pirate talks about the heartbeat: rhythmically, patiently. Meri's quest: "The Low Tide" — the player collects stones at low tide. The tide is the timer. The stones exposed at low tide are the ones the sea has been working on — the freshest, the most recently shaped. The low tide stones have the strongest "water" harmonic. The quest teaches: timing is everything. The sea gives up its work on its schedule.

**Game:** Tidal Collection — the player collects stones at low tide. The tide is the timer (connecting to Persephone's Tidal Cycle tempo). The player must collect as many stones as possible before the tide comes back in. The low-tide stones are water-shaped; the high-tide stones (if the player is caught by the tide) are... the player gets wet (a game-over condition: the player returns to the Inn with wet stones, which have a temporarily modified frequency — the water's overlay is too strong until the stones dry).

---

### International Park Zones

#### 9. Stonehenge (England) — Fae Kingdom Portal
**Geological Type:** Cultural/Mythological
**Inn Connection:** The Fae Kingdom (portal) + The Catacombs (archive)

Stonehenge is already established as the first Fae Kingdom portal. The Preseli Blue Stone (550Hz) is the portal's key. Stonehenge is the Inn's MYTHOLOGICAL ANCHOR — the place where stone and story are inseparable.

**Stones:** Preseli Blue Stone (550Hz) — the Stonehenge stone, the bluestone from the Preseli Hills in Wales, transported 140 miles to Stonehenge by people whose reasons remain unknown.

**Lore:** The entire Stonehenge mythology — the stones as astronomical instruments, healing sites, burial grounds, and portals. The lore is the most DEBATED in the archive: no one knows why Stonehenge was built. The not-knowing IS the lore.

**Ranger:** No ranger — the Ranger doesn't exist at Stonehenge because Stonehenge predates the park system. The Threshold Keeper (Fae Kingdom NPC) serves as Stonehenge's guide instead. The Threshold Keeper says: "The stones were here before the park. The stones were here before the country. The stones were here before the idea of 'here.'"

---

#### 10. Machu Picchu / The Andes (Peru)
**Geological Type:** Metamorphic + Cultural
**Inn Connection:** The Main Floor (Andean Run arcade game) + The Water Zone (mountain streams)

Machu Picchu is already connected to the Andean Run arcade game (Temple Run). The Andes produce the Andean stones that unlock the Water Zone. Machu Picchu is the Inn's MOUNTAIN ANCHOR — the place where stone and altitude and human achievement meet.

**Stones:**
- Andean Opal (the Andean stone — pink, blue, common)
- Sodalite (the blue Andean stone)
- Rhodochrosite (the "Inca Rose" — the pink Andean gemstone)
- Magnetite (the magnetic stone — the Andes' iron)

**Frequencies:**
- Andean Opal: ~400Hz (the altitude frequency — stones formed at high elevation have a "thin" harmonic, like the air is thin)
- Sodalite: ~420Hz (the blue frequency)
- Rhodochrosite: ~300Hz (the pink frequency — the Inca Rose, the stone the Incas valued)
- Magnetite: ~85Hz (the deep, magnetic frequency — the stone that pulls)

**Lore:**
- Inca mythology: the stones as building blocks of empire; Machu Picchu as a sacred site
- The Andes as a geological force — the mountains that are still growing, pushed up by the Nazca plate
- The concept of "altitude geology" — stones formed at high elevation have different characteristics than stones formed at sea level

---

#### 11. Giant's Causeway (Northern Ireland)
**Geological Type:** Volcanic
**Inn Connection:** The Water Zone (coastal volcanic) + The Fae Kingdom (the Causeway's mythology)

Giant's Causeway is 40,000 hexagonal basalt columns, formed by volcanic cooling. The columns look like a built road — and the mythology says they ARE one: built by the giant Finn McCool as a bridge to Scotland. Giant's Causeway is the Inn's place where GEOLOGY and MYTHOLOGY are the same story.

**Stones:**
- Basalt (the columnar stone — the hexagonal volcanic rock)
- The Causeway Stones (basalt columns with a unique "hexagonal" frequency — the regular geometry adds a mathematical harmonic, a precise overtone that no naturally irregular stone has)

**Frequencies:**
- Basalt: ~340Hz (volcanic)
- Causeway Stone: ~340Hz + hexagonal harmonic (the geometry's overtone — a precise, mathematical frequency that demonstrates the Inn's principle: "nature's architecture is more precise than ours")

**Lore:**
- The Finn McCool mythology — the giant who built the road, the story that geology confirms (the columns DO look like a road; the story is the human interpretation of a geological fact)
- The concept of "mythology as geology" — the stories we tell about the earth ARE the earth's stories, just in a different language

---

#### 12. Uluru (Australia)
**Geological Type:** Sedimentary + Cultural/Mythological
**Inn Connection:** The Catacombs (archive) + Beverley's Australian connection

Uluru (Ayers Rock) is a single massive sandstone monolith in the Australian Outback. The stone is sacred to the Anangu people — the rock's features are the physical manifestations of their creation mythology. Uluru is the Inn's DEEPEST CULTURAL ANCHOR — the place where stone and story are literally the same thing.

**Stones:**
- Arkose Sandstone (the Uluru stone — the sandstone that makes up the monolith)
- Uluru Specimens (fragments — not collected from the rock itself, which is protected, but from the surrounding desert, the same geological formation)

**Frequencies:**
- Arkose Sandstone: ~280Hz (the warm, ancient frequency — Uluru is 550 million years old)

**Lore:**
- Anangu mythology: the rock as a creation site — each feature on the rock corresponds to a creation ancestor's action. The rock IS the story. The geology IS the mythology.
- The concept of "reading the rock" — the Anangu read Uluru the way the Crone reads the archive. The rock is a text; the features are the entries.
- Beverley's connection: Beverley is Australian. Uluru connects to Beverley's heritage and to the Catacombs' archive through the principle that the earth itself is an archive.

**Special Mechanic:** Uluru's stones are not collected from the rock — they are collected from the surrounding desert. The rock is SACRED. The park teaches: some stones are not meant to be taken. The player who visits Uluru learns RESPECT — not every stone is for collecting. Some stones are for witnessing. The Uluru expedition is the only one where the player returns with FEWER stones than they arrived with — the player leaves a stone at the rock as an offering. The offering grants a "Respect" buff: the player's stone collection gains a quality bonus — the stones the player already has become slightly more vibrant, more resonant, because the player has demonstrated that they value stones for more than acquisition.

---

## The Park-Inn Dynamic

### The Full Loop

The player's journey between the Inn and the Parks is a LOOP:

1. **OUT** — the player leaves the Inn, selects a park, and explores
2. **COLLECT** — the player finds stones and discovers lore in the park
3. **RETURN** — the player comes back to the Inn
4. **PROCESS** — the player places stones in the geode (Main Floor), files lore in the archive (Catacombs), and crafts with the minerals (Undercity)
5. **GROW** — the Inn changes based on what the player found. The geode fills. The archive grows. The Bead Board gains new materials. The dragon grows.
6. **GO OUT AGAIN** — the player, now stronger and more knowledgeable, returns to the world map for a new expedition

The loop is the Inn's CIRCULATION — the heartbeat between interior and exterior. The Inn is the heart; the Parks are the body. The player is the blood, carrying stones and lore from the body to the heart and back.

### How Parks Connect to Inn Zones

Each park's geological type connects to a specific Inn zone, creating a DIRECT PATH from the external world to the internal architecture:

| Park | Geological Type | Inn Connection | What Flows In |
|---|---|---|---|
| Yellowstone | Volcanic + Hydrothermal | The Forge (Campgrounds) + The Source (Water Zone) | Fire-stones + 42Hz water |
| Grand Canyon | Sedimentary | The Catacombs | Layered stones + deep-time lore |
| Petrified Forest | Fossil-bearing | Charles's Natural Archive (Catacombs) | Living stones + transformation lore |
| Crater of Diamonds | Volcanic (pipe) | The Forge (Campgrounds) + Foundation Stone (Catacombs) | Diamonds + amethyst (Foundation Stone's cousin) |
| Great Smoky Mountains | Metamorphic | The Staircase | Transformed stones + Cherokee lore |
| Glacier | Glacial | The Water Zone (Trench) | Ice-shaped stones + frozen harmonics |
| Joshua Tree | Desert | The Crystal Gardens (Fae Kingdom) | Desert stones + silence |
| Acadia | Coastal | The Water Zone (Surface) | Wave-shaped stones + tidal lore |
| Stonehenge | Cultural/Mythological | The Fae Kingdom (portal) | Preseli Blue Stone + the not-knowing |
| Machu Picchu | Metamorphic + Cultural | Main Floor (Andean Run) + Water Zone | Andean stones + Inca lore |
| Giant's Causeway | Volcanic | The Water Zone (coastal) | Hexagonal basalt + Finn McCool |
| Uluru | Sedimentary + Cultural | The Catacombs (archive) | Arkose + Anangu creation lore + the Respect buff |

---

## The Park Progression System

### Unlock Order

The parks unlock progressively as the player gains knowledge and capabilities:

| Tier | Parks | Unlock Requirement |
|---|---|---|
| 1 (Starter) | Yellowstone, Acadia | Complete the first arcade game (any one) |
| 2 (Foundation) | Grand Canyon, Joshua Tree | Collect 20 stones + complete the Firekeeper's quest |
| 3 (Intermediate) | Great Smoky Mountains, Glacier | Collect 40 stones + reach the Staircase |
| 4 (Advanced) | Petrified Forest, Crater of Diamonds | Collect 60 stones + complete the Alchemist's Scale (Level 3) |
| 5 (Cultural) | Stonehenge, Machu Picchu, Giant's Causeway | Collect 80 stones + complete Standing Stones (Fae Kingdom portal) |
| 6 (Sacred) | Uluru | Collect 100 stones + complete the Wanderer's quest ("GUEST") |

The progression teaches: the deeper the player goes in the Inn, the further out they can go in the world. The internal exploration enables the external exploration. The Inn and the Parks grow together.

### The Park Journal

Each park has a JOURNAL — the player's record of their expeditions. The journal includes:
- Stones collected (with collection point and date)
- Lore discovered (with cultural source and context)
- Trails mapped (with completion percentage)
- Ranger quests completed
- Photos taken (screenshots of geological features)
- Seasons experienced (the park changes; the journal records when the player visited)

The Park Journal is the player's FIELD NOTEBOOK — the external equivalent of the Visitors' Shelf (Catacombs). Where the Visitors' Shelf holds the player's Inn journal, the Park Journal holds the player's EARTH journal. Together, they tell the complete story: the Inn's interior and the earth's exterior, the digital and the real, the game and the geology.

---

## Interactive Items Summary

| Item | Location | Function |
|---|---|---|
| The Cartographer's Desk | Main Floor (entrance hall) | The World Map interface |
| The World Map | The Cartographer's Desk | Four layers: Stone, Lore, Park, Portal |
| Park Visitor Centers | Each park (entry) | Ranger NPC, quest board, gift shop |
| Park Trails | Each park | Navigation paths to collection and lore sites |
| Collection Points | Each park (geological sites) | Stone collection; specific stones per site |
| Lore Sites | Each park (cultural sites) | Lore discovery; specific mythology per site |
| The Park Journal | Each park + the Inn | Expedition record; field notebook |
| The Seasonal Cycle | Each park | Parks change with seasons; affects access |
| The Weather System | Each park | Weather affects exploration and the timer |
| The Gift Shop | Each park (Visitor Center) | Park-specific items: stone specimens, books, maps, charms |

---

## Reward Structure

| Reward | Source | Effect |
|---|---|---|
| **Park Stones** | Each park's collection points | Stones with park-specific harmonics (water overlay, ice overlay, heat overlay, etc.) |
| **Park Lore** | Each park's lore sites | Lore entries for the archive and the Modern Legends shelf |
| **Ranger Quests** | Each park's Ranger | Park-specific charms, rare stones, and geological knowledge |
| **The Diamond** | Crater of Diamonds | The game's rarest stone (Mohs 10, 1388Hz) |
| **The Oldest Stone** | Great Smoky Mountains (Tsali's quest) | Continental crust — 1 billion+ years old |
| **The Ice Memory** | Glacier (Nápi's quest) | A stone with a frozen harmonic — sub-audible, preserved ice memory |
| **The Living Stone** | Petrified Forest (Milo's quest) | Petrified wood with a wood-grain frequency texture |
| **The Respect Buff** | Uluru | Stone quality bonus for demonstrating respect |
| **The Park Journal** | All parks | Field notebook; external expedition record |
| **The Photography Album** | All parks (photography quests) | Geological feature photos; the visual archive |

---

## Connections to Inn Levels

The Park System connects to EVERY internal level:

| Inn Level | Park Connection |
|---|---|
| Cosmology | The Allfather's Gaze reveals constellation-to-stone mappings (some park stones are best found at night, under specific constellations) |
| Clockwork Skies | The Navigator's star charts help with night expeditions; the Cool's pocket watch (a compass) points to unexplored parks |
| Main Floor | The Cartographer's Desk (World Map) is on the Main Floor; arcade games unlock park tiers; the dragon's geode receives park stones |
| Campgrounds | The Blacksmith forges park-found materials; Jay's ale provides expedition buffs; the Wolf's Hunt (deep woods) approaches park edges |
| Staircase | Metamorphic parks connect to the Staircase's transformation theme; the Alchemist's Scale processes park minerals |
| Catacombs | Park lore is filed in the archive; Charles's Natural Archive receives park geological specimens; the Visitors' Shelf receives the Park Journal |
| Fae Kingdom | Stone circle portals are at park sites (Stonehenge); desert parks connect to the Crystal Gardens; the Fae Kingdom's nature magic is the deep version of the parks' nature |
| Water Zone | Coastal and glacial parks connect directly; the Source's 42Hz water is the template for all park hydrothermal features |
| Undercity | Park stones and materials are used at the Master's Bench; park-specific harmonics add variety to Bead Board designs; the Inn Song can incorporate park frequencies |

---

## External Zone System — Complete Checklist

| Component | Status |
|---|---|
| Overview & dynamic | ✅ Complete — the Inn-Park loop (go out, collect, return, process, grow) |
| The World Map | ✅ Complete — four layers, antique map interface, Cartographer's Desk |
| The Expedition system | ✅ Complete — structure, timer, seasons, weather, ranger |
| Geological classification | ✅ Complete — 8 types, each connecting to Inn zones |
| US National Parks | ✅ Complete — 8 parks (Yellowstone, Grand Canyon, Petrified Forest, Crater of Diamonds, Great Smoky Mountains, Glacier, Joshua Tree, Acadia) |
| International Parks | ✅ Complete — 4 parks (Stonehenge, Machu Picchu, Giant's Causeway, Uluru) |
| Park Rangers | ✅ Complete — 8 named rangers, each with personality and quest |
| Park Games | ✅ Complete — 8 park-specific game mechanics |
| Progression system | ✅ Complete — 6 tiers, unlock requirements, progressive access |
| The Park Journal | ✅ Complete — field notebook, expedition record |
| Interactive items | ✅ Complete — 10 items across the system |
| Reward structure | ✅ Complete — 10 reward categories including park-specific charms |
| Connections to Inn levels | ✅ Complete — all 9 internal levels connected |

**EXTERNAL ZONE SYSTEM — COMPLETE.**

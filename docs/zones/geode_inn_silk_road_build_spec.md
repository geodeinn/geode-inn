# THE SILK ROAD — BUILD SPEC FOR BUILDER
## The Ley Line Energy Network + Caravan Expedition System

---

## OVERVIEW

The Silk Road is the Inn's horizontal energy network. It connects every cultural zone through ley line routes that the player travels as expeditions. The core loop: carry stones along ley lines to charge them, trade charged stones for rare items at cultural platforms, encounter traders/bandits/weather/ley line anomalies along the way. The Silk Road lives in the Canopy City (Clockwork Skies, Level 2) but reaches through every zone because ley lines run through the entire Earth.

---

## 1. THE CARAVAN GAME (Core Mechanic)

### What It Is
A route management / expedition game. The player selects a Silk Road route, loads stones into a caravan, and travels from one cultural platform to another. Along the way, encounters happen. The stones in the caravan charge passively as the caravan moves along the ley line. The journey IS the charging mechanism.

### Route Selection Screen
- Display the 5 Silk Road routes as golden threads on a stylized map
- Each route shows: origin platform, destination platform, estimated travel time (in encounter stages), difficulty, and current ley line conditions
- The player selects a route and sees the caravan loadout screen

### Caravan Loadout Screen
- **Stone Slots:** 6 slots. The player places stones from their inventory into these slots. These are the stones that will charge during the journey.
- **Supply Slots:** 3 slots. The player packs supplies — food (for endurance), charms (for protection), trade goods (for bartering). Supplies are purchased at platforms.
- **Caravan Stats:** Display three bars:
  - **Endurance** (starts at 100%, depletes with each encounter, restored by food)
  - **Protection** (starts at 0%, increased by charms, reduces bandit damage)
  - **Ley Line Attunement** (starts at 0%, increases as you travel, determines charge rate)
- **Depart Button:** When ready, launches the expedition

### The Journey (Encounter Sequence)
The caravan moves along the route in stages. Each stage is an encounter. Encounters are randomly selected from 5 types:

**1. TRADER ENCOUNTER (35% chance)**
- A traveling merchant appears. Offers to trade: stones, supplies, charms, or lore.
- The player can trade charged stones (more valuable) for rare items or regional stones.
- Some traders only accept charged stones (stones above 50% charge).
- Trading costs a turn but doesn't cost endurance.
- **UI:** A trade window with the merchant's offerings on the left, the player's caravan inventory on the right. Drag items to trade.

**2. BANDIT ENCOUNTER (20% chance)**
- Bandits attack the caravan. They want stones or supplies.
- Options: Fight (costs endurance, success based on Protection stat), Negotiate (give them supplies/stones to avoid conflict), or Flee (random chance of success, costs endurance on failure).
- If bandits succeed, they steal 1-2 stones or supplies from the caravan.
- **UI:** Three buttons (Fight/Negotiate/Flee) with estimated outcomes. Bandit party shown as silhouettes.

**3. WEATHER ENCOUNTER (15% chance)**
- Environmental challenge: ley line storm (stones charge faster but endurance drops), fog (travel slows, more encounters), sandstorm/rain/blizzard (endurance cost increases, but ley line attunement increases).
- The player chooses: Push Through (extra endurance cost, bonus charge) or Wait It Out (no endurance cost, no charge bonus, costs a turn).
- **UI:** Weather visualization overlay + two buttons (Push Through / Wait It Out).

**4. LEY LINE ANOMALY (15% chance)**
- A ley line surge — the caravan passes through a concentrated energy point. All stones in the caravan gain a charge bonus (+10-25%).
- Sometimes the anomaly is a "ley line echo" — the player hears a fragment of the 42Hz Song, a memory of the creators. These are lore drops — small text fragments that build the Hollow Earth backstory.
- Rarely (5% of anomalies), the anomaly reveals a hidden node — a sacred site not on the map. The player can mark it for future World Grid exploration.
- **UI:** Golden energy visualization. Text overlay for lore fragments. "Mark Node" button if a hidden node is found.

**5. SACRED SITE (15% chance)**
- The caravan passes through a ley line node (sacred site). The player can stop to charge stones faster.
- At a node, stones charge +5% per stop (in addition to passive travel charging).
- Some nodes have guardians ( NPCs from the lore database) who offer quests or trade.
- **UI:** Sacred site visualization (Monet impressionist landscape). "Stop to Charge" button. If guardian present, guardian NPC portrait + dialogue.

### Stage Progression
- Each route has 5-8 stages (depending on route length)
- After each stage, the caravan advances. A progress bar shows position along the route.
- Passive charge rate: +2% per stage completed (modified by Ley Line Attunement stat)
- If endurance reaches 0, the caravan is forced to rest (lose 2 stages worth of progress, no charge gain)

### Arrival at Destination Platform
- The caravan arrives at the destination cultural platform
- A summary screen shows: stones charged (with before/after charge levels), items acquired, lore fragments collected, encounters survived
- The player is now at the destination platform and can access the Trading Post (see below)

---

## 2. THE CULTURAL PLATFORMS (Trading Posts)

### Overview
There are 9 cultural platforms in the Canopy City. Each is a trading post + lore hub for its region. When the player arrives at a platform (via caravan or fast travel after first visit), they see:

### Platform UI (Each Platform)
- **The Trading Post:** Buy and sell stones. Charged stones sell for more. Regional stones available for purchase (neutral charge). Some stones are platform-exclusive.
- **The Crafting Teacher:** Each platform teaches a regional crafting technique usable on the Bead Board:
  1. Celtic Platform → Celtic knotwork patterns (interlocking bead arrangements)
  2. Norse Platform → Runic binding (rune-shaped bead sequences with frequency emphasis)
  3. Egyptian Platform → Faience patterns (blue-green dominant arrangements)
  4. Mesopotamian Platform → Cuneiform patterns (wedge-shaped bead groupings)
  5. East Asian Platform → Calligraphy strokes (flowing single-line arrangements)
  6. South Asian Platform → Mandala layouts (radial symmetric arrangements)
  7. Andean Platform → Inca geometric patterns (stepped diamond arrangements)
  8. African Platform → Kente strip patterns (alternating color bands)
  9. Oceanic Platform → Songline spirals (spiral arrangements following ley line flow)
- **The Lore Keeper:** An NPC who shares regional lore about the ley lines — how ancient peoples understood the energy, what they built to harness it. These are text entries added to the player's Codex.
- **The Platform Gate:** The exit point to the World Grid region. Selecting this sends the player to that region's World Grid zone for gathering.

### Platform Visual Style
- Each platform is rendered in the Rackham aesthetic (Canopy City zone) — ink + watercolor with cultural accent colors (Kandinsky mapping retired 2026-09-04)
- Celtic = green/gold geometric knots. Norse = blue/silver angular forms. Egyptian = gold/lapis triangles. Mesopotamian = ochre/brown zigurats. East Asian = jade/red circles. South Asian = saffron/indigo mandalas. Andean = terracotta/green stepped patterns. African = earth-tone woven bands. Oceanic = ochre/red desert spirals.
- Each platform is a circular landing pad in the Canopy City, connected to others by the Silk Road route lines (golden threads).

---

## 3. THE STONE CHARGING SYSTEM

### Stone Charge States (visual indicator on stone icons)
- **0% (Neutral):** No glow ring. Base frequency only.
- **1-24% (Faint):** Thin silver ring. Slightly stronger frequency.
- **25-49% (Charging):** Thicker silver ring. Noticeable frequency boost.
- **50-74% (Resonant):** Gold ring begins. Strong frequency.
- **75-99% (Harmonic):** Bright gold ring. Very strong frequency.
- **100% (Charged):** Full gold ring with subtle pulse animation. Maximum frequency. Stone hums audibly (play the stone's frequency at slightly higher volume with a 42Hz harmony layer added).

### Charging Methods
1. **Passive Caravan Travel:** +2% per caravan stage completed (modified by Ley Line Attunement)
2. **Sacred Site Stop:** +5% per stop at a ley line node during caravan journey
3. **Ley Line Anomaly:** +10-25% bonus from anomaly encounters
4. **World Grid Placement:** Placing a stone at a sacred site in the open world charges it over time (+1% per minute of real-time play while at a node)
5. **Hollow Earth:** +100% instantly (bringing a stone to the Hollow Earth's crystal city)

### Bead Board Integration
- Charged stones have STRONGER frequencies on the Bead Board
- A 100% charged stone's frequency is 1.5x louder/clearer than a 0% stone
- A composition using ALL charged stones creates a CHORD BONUS — the entire arrangement resonates together, producing a harmonic that's greater than the sum of its parts
- This chord bonus is visualized as a golden glow around the entire Bead Board when all stones are charged

---

## 4. THE CARTOGRAPHER NPC

### Location
The Canopy City (Clockwork Skies, Level 2). A small observation platform with maps, charts, and instruments.

### Visual
Rackham-style ink figure — angular, precise pen lines. Carries a compass that's a small crystal on a chain. The Cartographer is rendered in sharp/angular lines (guardian style — a keeper of knowledge, not a trader).

### Quest: "The Map That Hears"
- The Cartographer gives the player a stone-compass (a raw crystal item that vibrates near ley lines)
- Player must travel to 3 ley line nodes (Stonehenge, the Pyramids, Uluru) and hold the compass at each
- At each node, a section of the ley line network is revealed on the world map
- After 3 nodes, the full Ley Line Vision is unlocked
- **Reward:** Ley Line Vision (permanent world map layer toggle) + the Cartographer's Map (an item showing real-time ley line energy flow)

### Ongoing Role
- Sells regional maps (showing detailed ley line routes for specific areas)
- Provides caravan route recommendations (which routes have better charging conditions)
- Gives daily ley line reports (which routes have anomalies today — a daily rotating bonus system)

---

## 5. DATA ENTITIES

### Update PlayerProgress Entity
Add these fields:
- `caravanEndurance` (number, default 100)
- `caravanProtection` (number, default 0)
- `leyLineAttunement` (number, default 0)
- `unlockedRoutes` (array of strings — which Silk Road routes the player has unlocked)
- `visitedPlatforms` (array of strings — which cultural platforms the player has visited)
- `craftingTechniques` (array of strings — which regional crafting patterns the player has learned)
- `leyLineVisionUnlocked` (boolean, default false)

### Stone Charge Storage
Add a charge field to either the Stone entity or create a new PlayerStone entity:
- Option A: Add `chargeLevel` (number 0-100) to the Stone entity (simple but means all instances of a stone share the same charge)
- Option B: Create a `PlayerStone` entity with fields: `playerId`, `stoneId`, `stoneName`, `chargeLevel`, `dateAcquired` (preferred — allows per-player per-stone charge tracking)

### New Entity: CaravanLog
- `playerId` (string)
- `routeName` (string)
- `stagesCompleted` (number)
- `encountersSurvived` (number)
- `stonesCharged` (array of objects: {stoneName, startCharge, endCharge})
- `itemsAcquired` (array)
- `loreFragments` (array)
- `date` (string)

---

## 6. AUDIO PROFILE

### The Silk Road Theme
- **Instruments:** A fusion ensemble — oud (Middle Eastern), erhu (East Asian), hardanger fiddle (Norse), charango (Andean), kora (African) — all rendered through electronica. Each instrument represents one cultural region. As the caravan travels a route, the instruments from the regions it passes through become more prominent in the mix.
- **Tempo:** 50 BPM (the heartbeat — the caravan's pace, the walking rhythm of traders and pack animals)
- **Base:** 42Hz drone underneath everything. The ley line frequency. As Ley Line Attunement increases, the 42Hz drone becomes louder and clearer.
- **Encounter Stings:**
  - Trader encounter: a warm acoustic guitar chord (welcome, commerce)
  - Bandit encounter: a distorted string scrape (danger)
  - Weather encounter: filtered wind noise + atmospheric pad
  - Ley Line Anomaly: a crystalline bell tone + 42Hz surge
  - Sacred Site: a deep resonant hum (the node's concentrated energy)

### The Cartographer's Theme
- A quiet, precise melody on a music box / celesta — the sound of measurement, calculation, mapping. Ink lines translated to sound: precise, spare musical phrases.

---

## 7. VISUAL STYLE

### The Canopy City (where platforms live)
- Rackham aesthetic — living-wood circular platforms floating in watercolor sky. Each platform is a colored glade. Routes between them are golden threads (the ley lines).

### The Caravan Journey
- The route is shown as a golden thread on a Monet impressionist landscape. The caravan is a small icon (a figure with a pack animal) moving along the thread. The landscape shifts as the caravan moves through different regions — desert gives way to forest, forest to mountains, mountains to coast.

### Encounter Visuals
- Traders: soft warm light, a small campfire icon, the trader as a silhouette
- Bandits: dark red overlay, jagged silhouettes
- Weather: full-screen overlay (sand = amber fog, storm = blue rain, fog = grey veil) with the caravan still visible underneath
- Ley Line Anomaly: golden energy particles swirling around the caravan, the route glowing brighter
- Sacred Site: a Monet impressionist landscape of the site — Stonehenge as soft stone shapes in green grass, the Pyramids as golden triangles in desert haze, Uluru as a massive red-orange form in the outback

---

## 8. UNLOCK PROGRESSION

1. **First Visit to Canopy City:** The Cartographer introduces the concept of ley lines. The 5 routes are visible but locked. The quest "The Map That Hears" is available.
2. **After "The Map That Hears":** Ley Line Vision unlocked. All 5 routes unlock. The caravan game is available.
3. **First Caravan Journey:** The player learns the charging mechanic. The destination platform's trading post and crafting teacher unlock.
4. **Subsequent Journeys:** The player can fast-travel to any visited platform (no caravan needed for fast travel, but stones don't charge without caravan travel). New platforms reveal new stones, crafting techniques, and lore.
5. **All 9 Platforms Visited:** The "Master Trader" achievement. The Cartographer reveals the Deep Route (a hidden 6th route that passes through the Hollow Earth's crystal city — the ultimate charging journey).

---

## SUMMARY

The Silk Road is the system that makes the World Map feel alive. It gives players a reason to travel, trade, and engage with the cultural zones beyond just playing games. The stone charging mechanic adds a progression layer to the Bead Board — charged stones are literally more powerful. The caravan encounters provide the unpredictable, story-generating moments that make each journey feel like a quest, not a menu.

The Silk Road connects to:
- **The World Map** (Ley Line Vision layer shows the routes)
- **The Stone Entity** (charging system adds a new dimension to stones)
- **The Bead Board** (charged stones create stronger compositions)
- **The Clockwork Skies** (the Canopy City is where the platforms live)
- **The Hollow Earth** (the ultimate charging destination, via the Deep Route)
- **The World Grid** (each platform is a gateway to its region's gathering zone)
- **The Cultural Mini-Games** (each platform connects to its region's mini-game)

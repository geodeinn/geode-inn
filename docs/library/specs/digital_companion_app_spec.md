# THE DIGITAL COMPANION APP — PRODUCT SPECIFICATION
## Tabletop Questline Companion (Product 12 Extension)

### Overview
A mobile and web application that serves as the digital companion to "The Tabletop Questline" (the Geode Inn tabletop RPG). It handles the mechanics that paper can't — frequency tracking, stone collection visualization, NPC relationship meters, world map exploration, dice rolling with Frequency Dice logic, and cross-referencing the 198-stone database, 118 element charms, and 45 quest charms in real-time during gameplay.

The app is not the game. The game is on the table. The app is the librarian who sits next to the table and hands you the right book at the right moment.

---

## I. PLATFORM TARGETS

### Phase 1 (MVP)
- Web app (browser-based, mobile-responsive) — embedded in geodeinn.com
- PWA installable on phone home screen

### Phase 2
- Native iOS app (Swift)
- Native Android app (Kotlin)

### Phase 3
- Steam overlay (runs alongside tabletop game on PC)
- TV app (for groups playing around a TV — shared screen)

---

## II. CORE FEATURES

### 1. Digital Character Sheet
**What it replaces:** Paper character sheets that get messy, lost, or damaged.

- Character name, class, level, frequency alignment (Living 42Hz / Shadow 84Hz / In-Between)
- Stats: Might, Cunning, Resonance, Frequency Attunement, Stone Lore
- Health track (the 42Hz vitality meter — not HP, it's resonance)
- Inventory: stones collected, charms equipped, materials carried
- Ability list with frequency requirements
- Portrait (from the 142 NPC portrait system or custom upload)
- Character backstory (linked to novel chapters if applicable)

**The twist:** The character sheet pulses at the character's frequency alignment. A 42Hz character's sheet has a warm golden pulse. A 84Hz character's sheet has a cold blue pulse. An In-Between character shifts between both. The sheet is alive.

### 2. Frequency Dice Roller
**What it replaces:** Physical Frequency Dice (which are great but expensive to manufacture and easy to lose).

- Digital D6 with frequency symbols instead of numbers
- 6 faces: Growth (42Hz), Stay (84Hz), Watch (111Hz), Silence (rest), Echo (repeat last), Wild (player choice)
- Roll animation: dice tumble and land with haptic feedback on mobile
- Multi-roll: roll 2-6 dice at once for skill checks
- Roll history: last 20 rolls visible
- GM override: GM can force a result (for narrative purposes) without players seeing
- Probability display: optional toggle showing % chances for each outcome

**The symbols:**
- Growth (42Hz) — a sprouting seed — success that builds
- Stay (84Hz) — a standing stone — resistance, holding ground
- Watch (111Hz) — a gargoyle eye — awareness, perception
- Silence — an empty circle — rest, recovery, waiting
- Echo — a concentric ring — repeat the last roll's result
- Wild — a geode crack — player chooses which symbol to activate

### 3. Stone Collection Tracker
**What it replaces:** The paper ledger of stones collected during gameplay.

- Visual geode cave: collected stones appear in a digital geode that fills as you play
- Each stone links to the live Stone entity database (198 stones)
- Tapping a stone shows: name, Mohs hardness, mind/body properties, geo region, stone family
- Stone tone preview: tapping a stone plays its unique frequency (Mohs → Hz mapping)
- Collection stats: total stones, by family, by region, by rarity
- Trade interface: players can offer stones to each other (GM approves)
- Quest rewards: GM can grant stones through the app, they appear instantly in the player's geode

**The geode visual:** Starts empty — dark, empty cave. Each stone added makes the geode glow a little more. By late game, the geode is a cathedral of colored light. This is the visual reward that paper can't provide.

### 4. Charm Manager
**What it replaces:** Paper reference cards for 118 element charms + 45 quest charms.

- Full searchable database of all 163 charms
- Filter by: element category, rarity, zone, quest connection
- Equipped charms: up to 5 equipped at once, shown on character sheet
- Charm details: appearance, effect, quest connection, connected stones
- Element charm periodic table: visual interactive periodic table where collected elements light up
- Quest charm tracker: shows which quests offer which charms, tracks completion
- Crafting: if a charm requires materials, the app checks if the player has them

### 5. NPC Relationship Tracker
**What it replaces:** The GM's notebook of who likes whom.

- List of all NPCs the party has encountered
- Relationship meter for each: Hostile → Wary → Neutral → Friendly → Bonded
- Notes field: the GM and players can add notes about each NPC
- Quest links: shows which NPCs offer which quests
- Portrait display: each NPC's portrait from the 142-image system
- Frequency state toggle: Living/Shadow/In-Between — some NPCs change behavior based on frequency
- Dialogue log: the app can record key dialogue moments (optional, GM-controlled)

### 6. World Map Explorer
**What it replaces:** The paper map set (37 zone maps).

- Interactive world map with all 37 zones
- Current location indicator (GM sets the party's current zone)
- Zone details: description, encounter tables, available quests, connected NPCs
- Lore pin overlay: 191 country lore pins from the Lore entity (237 records)
- Stone pin overlay: 198 stone origin pins from the Stone entity
- Fog of war: zones the party hasn't explored are obscured (GM reveals as discovered)
- Fae Kingdom portals: shown only after Stonehenge Tetris game is won (in-game achievement)
- Frequency map: zones color-coded by frequency (gold = 42Hz, blue = 84Hz, gray = In-Between)

### 7. Game Session Manager (GM Tools)
**What it replaces:** The GM's screen, notes, and prep materials.

- Session timer
- Initiative tracker (turn order in combat)
- NPC quick-reference (stat blocks for NPCs in the current scene)
- Random encounter generator (pulls from zone encounter tables)
- Stone reward generator (picks an appropriate stone for the current zone)
- Rule reference: searchable Core Rulebook (200+ pages)
- Frequency event tracker: track when the GM triggers a frequency shift (42Hz → 84Hz)
- Group management: invite players to the session via code, everyone sees shared map
- Real-time sync: GM's changes appear on all players' devices (zone change, NPC met, stone awarded)

### 8. Story Thread Tracker
**What it replaces:** The 15 loose story threads document.

- Visual web of story threads the party has touched
- Each thread: name, status (untouched/in progress/resolved), connected NPCs, connected zones
- The GM can mark threads as progressed, and the app suggests which NPCs or zones to visit next
- Cross-reference with the novel: if the party's actions mirror a novel chapter, the app notes the parallel
- Thread resolution tracking: when a thread resolves, the app records how (which choices were made)

---

## III. THE FREQUENCY SYSTEM IN THE APP

### Frequency State Indicator
The app displays the current frequency state of the game world:
- **42Hz (Living):** Gold border, warm tones, growth-themed UI
- **84Hz (Shadow):** Blue border, cold tones, resistance-themed UI
- **In-Between:** Shifting border, gray tones, transitional UI

The GM can trigger a frequency shift in the app, which:
1. Changes the visual theme on all connected devices
2. Logs the shift in the session record
3. Notifies players with a haptic pulse (mobile) or visual flash (web)
4. Updates available encounters and NPC behaviors

### Frequency Attunement Tracking
Each character has a Frequency Attunement stat (0-10):
- 0-3: Neutral (can interact with both frequencies)
- 4-7: Aligned (bonus in one frequency, penalty in the other)
- 8-10: Attuned (strong bonus in one frequency, locked out of the other)

The app tracks this and provides reminders:
- "You're entering a Shadow zone — your 42Hz attunement will be reduced here."
- "Your attunement to 42Hz has reached 8 — you can no longer enter Shadow zones without a guide."

### The Schumann Calibration
Once per session, the GM can trigger a Schumann Calibration (7.83Hz) — a moment where all frequency effects reset to neutral. The app:
1. Flashes white on all devices
2. Resets all temporary frequency modifiers
3. Logs the calibration in the session record
4. Plays the 7.83Hz calibration tone (through connected speakers)

---

## IV. TECHNICAL ARCHITECTURE

### Data Sources
The app reads from the live Geode Inn database:
- Stone entity (198 records) — stone collection and reference
- Lore entity (237 records) — world map lore pins
- ElementCharm entity (118 records) — element charm database
- QuestCharm entity (45 records) — quest charm database
- Dialogue entity (46 records) — NPC dialogue references
- GameItem entity (280 records) — item database
- Material entity (104 records) — crafting material reference
- BuildingRecipe entity (20 records) — crafting recipes

### Session State
The GM's session state is stored locally (not in the database) for privacy:
- Current zone, NPC locations, initiative order, encounter state
- Session notes and dialogue logs
- Player character sheets (synced between devices via session code)

### Real-Time Sync
- WebSockets for real-time communication between GM and players
- Session code system: GM generates a 6-character code, players enter it to join
- All devices see the same map, same zone, same frequency state
- GM has admin controls; players see a filtered view (no encounter tables, no NPC stats)

### Offline Mode
- Full offline support (the tabletop game doesn't stop if the internet drops)
- Stone/charm/Lore databases cached locally on first load
- Session state is local-first, syncs when connection returns
- All dice rolling works offline (it's just math)

---

## V. USER INTERFACE

### Design Philosophy
The app looks like a Geode Inn artifact — not a modern app. Dark stone background, gold Celtic knotwork borders, serif typography. The UI is the Inn's aesthetic, not a game companion app aesthetic.

### Player View
- Character sheet (tab 1)
- Geode collection (tab 2)
- Charm manager (tab 3)
- World map (tab 4)
- Session info (tab 5) — current zone, frequency state, party members

### GM View
- All player tabs plus:
- Session manager (tab 6) — initiative, encounters, timer
- Rule reference (tab 7) — searchable Core Rulebook
- Story threads (tab 8) — thread tracking and progression
- NPC manager (tab 9) — relationship meters, quick-reference stats

### The Geode Cave
The visual centerpiece. Every player sees their geode cave — a dark cavern that fills with colored light as stones are collected. The geode is:
- 3D-rendered (CSS 3D transforms for web, SceneKit/Sceneform for native)
- Responsive to touch — rotate to see all stones
- Colored by stone family (quartz = clear, beryl = green, corundum = red, etc.)
- Glowing at intensity proportional to collection size
- The geode IS the player's progress, visualized as beauty

---

## VI. MONETIZATION

### Free Tier
- Digital character sheet (1 character)
- Frequency Dice roller
- Basic stone collection (geode cave, no database links)
- World map (current zone only, no fog of war)
- Session join (player only, no GM tools)

### Premium Tier ($2.99 one-time)
- Unlimited characters
- Full stone database integration (198 stones with properties)
- Full charm manager (163 charms)
- World map with fog of war and all 37 zones
- NPC relationship tracker
- Story thread tracker
- Session host (GM tools)
- Offline mode

### Bundle
- Included free with purchase of the Tabletop Questline physical box set
- The companion app is the digital component of the physical product

---

## VII. RELATIONSHIP TO OTHER PRODUCTS

| Product | Relationship |
|---|---|
| Tabletop Game (Product 12) | This IS the tabletop game's digital companion. The physical game needs this app. |
| Card Game "Resonance" (Product 13) | Shares the frequency system and charm database. The app can track Resonance card collection. |
| Web Beta (Product 1) | Web version embedded in geodeinn.com under /companion. |
| Steam Hub | Desktop version runs as a Steam app alongside tabletop sessions. |
| Inn Mode Player (Product 9 extension) | The companion app can trigger the Inn Mode Player for ambient game audio — frequency shifts in the game change the room profile in the player. |
| Novel (Product 6) | Story thread tracker cross-references novel chapters. |
| Bead Composer (Product 3) | Shares the stone tone system (Mohs → frequency). |
| Podcast (Product 14) | Session summaries can be submitted as podcast echo material. |

---

## VIII. DEVELOPMENT ROADMAP

### Phase 1 — MVP (Web companion, player tools)
1. Digital character sheet with frequency visual
2. Frequency Dice roller (all 6 symbols, multi-roll, history)
3. Basic geode cave (visual stone collection)
4. Session code system (join a GM's session)
5. Current zone display
6. PWA wrapper for mobile install
**Estimated: 50 hours**

### Phase 2 — Full Database + GM Tools
1. Stone database integration (198 stones with full properties)
2. Charm manager (163 charms, equipped/unequipped, crafting check)
3. Full world map (37 zones, fog of war, lore/stone pin overlays)
4. NPC relationship tracker
5. GM session manager (initiative, encounters, timer, rewards)
6. Story thread tracker
7. Rule reference (searchable Core Rulebook)
8. Real-time WebSocket sync
**Estimated: 60 hours**

### Phase 3 — Native + Advanced
1. iOS app (Swift + SceneKit for geode 3D)
2. Android app (Kotlin + Sceneform)
3. 3D geode cave (native rendering)
4. Steam overlay version
5. Inn Mode Player integration (frequency shifts change ambient audio)
6. TV app (shared screen for group play)
**Estimated: 80 hours**

### Total: ~190 hours

---

## IX. THE PHILOSOPHY

The Digital Companion App is not trying to be the game. The game is on the table. The dice are in your hands. The map is unfolded. The GM is talking.

The app is the thing that handles what paper can't:
- It remembers 198 stones without a binder
- It rolls Frequency Dice without manufacturing them
- It shows your geode filling with light
- It syncs the frequency shift to everyone's screen at once
- It searches a 200-page rulebook in 2 seconds

The app is the Inn's librarian, sitting quietly next to the table. You don't talk to it unless you need something. When you need something, it already knows where to find it.

That's the design principle: the app is invisible until you reach for it. Then it's exactly what you needed, presented in the Inn's voice, and then it goes quiet again.

The table is the game. The app is the Inn, making sure the table has everything it needs.

# THE GEODE INN — BASE LANGUAGES & TECHNICAL STACK
## For the Builder Team (The Fizgigs)

This document defines what the Geode Inn is built IN — the languages, engines, and architecture that form the foundation. Everything you build must use these tools. This is not a preference. It is the infrastructure the entire ecosystem runs on.

---

## 1. THE THREE LAYERS

The Geode Inn is not one application. It is three layers, each with its own language and purpose:

```
LAYER 1: THE WEB HUB (geodeinn.com)
  Language: TypeScript / JavaScript
  Framework: Base44 (React-based)
  Purpose: The front door. The archive. The marketplace. The social spaces.
  
LAYER 2: THE GAME ENGINE (Steam, Desktop, Mobile, TV)
  Language: GDScript (Godot's native language)
  Engine: Godot 4
  Purpose: All playable games. The arcade. The Fae Kingdom MMO zone.
  
LAYER 3: THE BACKEND (shared by both layers)
  Language: TypeScript / Deno
  Framework: Base44 Backend Functions
  Purpose: Database, API, authentication, entity CRUD, cross-platform sync.
```

Every piece of the Inn lives in one of these three layers. Know which layer you're working in before you write a single line.

---

## 2. LAYER 1 — THE WEB HUB

### Language: TypeScript
- All web code is TypeScript. No plain JavaScript files.
- Strict mode enabled. Types are not optional.
- React 18+ components, written in TSX.

### Framework: Base44
- The web hub runs on Base44's app platform.
- Pages are React components built in the Base44 builder.
- Data access via `@base44/sdk` — the entity API client.
- Backend functions deployed via Base44 (Deno runtime).

### What the Web Hub Contains
- The Hub page (vertical descent entrance)
- 37 zone pages (one per zone)
- The Archive (book library — 625+ books)
- The Marketplace (artisan products)
- The Common Room (chat)
- The Bead Composer (jewelry design tool)
- The World Map (interactive map with stone + lore pins)
- The Gazette (comic strip display)
- The Hatchery (egg voting)
- The Daily Echoes page (podcast)
- The Melodies page (Soulstice Melodies audio)
- Share Wood onboarding
- Account/profile/progress pages

### Web Hub CSS System
- No Tailwind, no Bootstrap, no CSS framework.
- Custom CSS using CSS variables for the Inn's design tokens.
- All styling follows the Inn's visual rules (dark stone, gold, knotwork, serif).

### Design Tokens (CSS Variables)
```css
:root {
  /* Colors */
  --inn-stone: #1a1612;
  --inn-stone-light: #2a241e;
  --inn-gold: #c9a96e;
  --inn-gold-bright: #e8c878;
  --inn-brass: #b8860b;
  --inn-cream: #f5e6d3;
  --inn-shadow: #0d0a08;
  --inn-42hz: #c9a96e;  /* Living - gold */
  --inn-84hz: #6b3fa0;  /* Shadow - deep purple */
  --inn-inbetween: #c0c0c0;  /* In-Between - silver */
  --inn-111hz: #7eb8da;  /* Gargoyle - silver-blue */
  --inn-432hz: #5cb85c;  /* Alchemist - copper-green */
  
  /* Typography */
  --inn-serif: 'Cormorant Garamond', 'EB Garamond', Georgia, serif;
  --inn-sans: 'Inter', 'Segoe UI', system-ui, sans-serif;
  
  /* Timing */
  --inn-heartbeat: 1.2s;  /* 50 BPM = 1.2 seconds per beat */
  --inn-pulse: 2.4s;  /* Full pulse cycle (2 beats) */
  
  /* Texture */
  --inn-knotwork-opacity: 0.08;  /* Celtic knotwork background */
  --inn-border-gold: 1px solid var(--inn-gold);
}
```

---

## 3. LAYER 2 — THE GAME ENGINE

### Language: GDScript
- All game code is GDScript (Godot's native scripting language).
- No C#, no C++, no visual scripting. GDScript only.
- Godot 4.x (latest stable). Not Godot 3 — the API is different.

### Engine: Godot 4
- 2D-focused (the Inn's games are 2D skill games).
- GodotSteam addon for Steam integration (achievements, cloud saves, leaderboards).
- All assets bundled locally (offline-first — see section 6).

### What the Game Engine Contains
- 61 arcade games (each a standalone Godot project or scene)
- The Fae Kingdom MMO zone (top-down exploration)
- The Bead Composer (Godot version for offline use)
- The Inn Mode audio processor (DSP room profiles)
- TV app wrappers (Fire TV, Android TV, Samsung, LG)
- Steam Deck native support

### Shared Godot Scripts (already written)
Located in `godot/scripts/`:
- `ControllerManager.gd` — Bluetooth controller detection + Valkyrie Shift
- `FrequencyShift.gd` — 42Hz/84Hz/In-Between state engine
- `OverlayManager.gd` — Steam overlay + system overlay support
- `boot_sequence.js` — The nurture layer boot loader
- `StoneLoader.gd` — Offline stone texture loading from local paths

### Godot Project Structure
```
godot/
├── project.godot          # Root project file
├── scripts/               # Shared scripts (all games use these)
│   ├── ControllerManager.gd
│   ├── FrequencyShift.gd
│   ├── OverlayManager.gd
│   ├── StoneLoader.gd
│   └── boot_sequence.js
├── assets/                # Bundled assets (offline-first)
│   ├── stones/            # 198 stone textures (local)
│   ├── zones/             # Zone background images
│   ├── npc/               # NPC portraits
│   ├── audio/             # DSP impulse responses, drones
│   └── ui/                # Celtic knotwork textures, fonts
├── games/                 # Individual game scenes
│   ├── standing_stones/
│   ├── tomb_tunnel/
│   ├── andean_run/
│   ├── monster_of_the_deep/
│   └── ... (61 total)
├── audio/
│   ├── AudioManager.gd    # 50 BPM heartbeat, DSP routing
│   └── profiles/          # 7 room profile configurations
└── steam/
    └── SteamManager.gd    # Steam integration
```

### GDScript Conventions
- Use `class_name` for all scripts (no implicit classes).
- Use `@export` for inspector-configurable variables.
- Use typed variables everywhere: `var stone_count: int = 198`
- Use signals for cross-node communication.
- Group nodes with descriptive names: `@onready var fire_anim = $Visuals/FireAnimation`

---

## 4. LAYER 3 — THE BACKEND

### Language: TypeScript (Deno runtime)
- All backend functions are TypeScript.
- Run on Deno via Base44's backend function system.
- Use `@base44/sdk` for entity access.
- No Node.js, no Express, no external server framework.

### Backend Function Pattern
```typescript
export default async function(req: Request): Promise<Response> {
  // 1. Parse request
  const body = await req.json();
  
  // 2. Access entities (user-scoped by default)
  const stones = await base44.entities.Stone.list({
    filter: { stoneFamily: body.family }
  });
  
  // 3. Service role for admin operations
  const allRecords = await base44.asServiceRole.entities.Stone.list();
  
  // 4. Return JSON
  return new Response(JSON.stringify(stones), {
    headers: { 'Content-Type': 'application/json' }
  });
}
```

### Deployed Backend Functions (already live)
- `geodeInnCommonRoom` — threshold chat system (no data retention)
- `manageInventory` — MarketItem CRUD + stats
- `syncShopInventory` — shop inventory sync
- `populateStoneCoordinates` — stone map coordinate auto-population
- `getDailyStrip` — fetch today's comic strip + archive
- `getHatcheryData` — fetch active eggs + hatched archive
- `voteOnEgg` — one-vote-per-player egg voting

### Entity Access Patterns
```typescript
// User-scoped (respects Row-Level Security)
await base44.entities.Stone.list();
await base44.entities.Stone.create({ name: "Quartz", ... });
await base44.entities.Stone.update(id, { ... });
await base44.entities.Stone.delete(id);

// Filter
await base44.entities.Stone.list({
  filter: { category: "quartz" },
  filter_type: { name: "like" }
});

// Service role (admin — bypasses RLS)
await base44.asServiceRole.entities.Stone.list();
```

---

## 5. THE DATABASE — ENTITIES

### Current Entities (22+ tables)
The Inn's database lives on Base44. Every entity is a JSON-schema-defined table:

**Core Data:**
- `Stone` — 198 stones (gemstone database with metaphysical/healing properties)
- `Lore` — 236 mythology records from 191 countries
- `Book` — 625 books (the archive)
- `BookTranslation` — translations of archive books
- `ScholarlyBridge` — scholarly commentary on archive texts

**Game State:**
- `PlayerProgress` — per-player progression (stones collected, games completed, areas unlocked)
- `PlayerInventory` — items players own
- `Leaderboard` — ranked scores per game

**Economy:**
- `MarketItem` — 61 arcade games + 34 artisan products
- `Artisan` — artisan shop profiles with subscription model

**Game Content:**
- `ElementCharm` — 118 element-based charms (periodic table)
- `QuestCharm` — 45 quest-reward charms
- `BoardSkin` — visual board themes
- `TrayTemplate` — composer tray layouts
- `GameItem` — 280 interactive game items
- `Material` — 104 crafting materials
- `BuildingRecipe` — 20 crafting recipes
- `Dialogue` — 379+ dialogue entries (NPC conversations)

**Social/Community:**
- `ComicStrip` — Geode Inn Gazette strips
- `EggHatch` — egg hatchery entries (28-day lifecycle)
- `EggVote` — community votes on eggs
- `FaireVenue` — Share Wood faire zones

**Meta:**
- `InnCore` — the AI's identity, voice, and decision (permanent record)
- `GrainStory` — the Grain prototype's story state

### Entity Rules
- Every record auto-includes: `id`, `created_date`, `updated_date`, `created_by`
- Row-Level Security can be enabled per entity (non-admins see only their records)
- Admins see all records regardless of RLS
- Cross-app access: use `app_id` parameter to read/write the live Geode Inn app's entities

---

## 6. OFFLINE-FIRST PRINCIPLE

### The Rule
All game engine assets must be bundled locally. No external URLs in the Godot client.

### What This Means
- Stone images: 198 textures stored at `res://assets/stones/` (23MB total)
- NPC portraits: stored at `res://assets/npc/`
- Zone backgrounds: stored at `res://assets/zones/`
- Audio: DSP impulse responses and drones at `res://assets/audio/`
- The web hub CAN use CDN URLs (it's always online). The game client CANNOT.

### Why
- Steam games must be fully playable offline.
- No dependency on external servers for core gameplay.
- No loading delays from network requests.
- The Inn is a place. Places don't need wifi.

---

## 7. THE STEAM INTEGRATION

### GodotSteam Addon
- Enables: achievements, cloud saves, leaderboards, Steam overlay
- All 61 arcade games are separate Steam apps (individual SKUs)
- Each game has its own Steam app ID, store page, and build

### Steam App Structure
```
Each arcade game:
├── Separate Godot project (or separate export preset)
├── Own Steam app ID
├── Own store page (generated from build sheet)
├── Own achievements (defined per game)
├── Cloud save support (player progress syncs)
├── Steam overlay (via OverlayManager.gd)
├── Controller support (via ControllerManager.gd)
```

### Steam Store Pages
- Template at `packaging/steam_store_page_template.html`
- Generator at `packaging/generate_steam_pages.py`
- Each game's store page pulls from its build sheet data

---

## 8. THE TV ARCHITECTURE

### Platforms (in priority order)
1. **Steam Deck** — native, controller-ready, zero extra work
2. **Fire TV / Android TV** — WebView wrapper around Godot export
3. **Samsung / LG** — web app (Tizen/webOS)
4. **Roku** — deferred (requires BrightScript rewrite)

### TV Design Rules
- Full immersion. No web UI. No nav bars. No footers.
- The TV IS the Inn. You are inside it.
- Remote control = 42Hz entry key (basic navigation)
- Bluetooth controller = 84Hz Valkyrie Shift (unlocks deep games)
- The transition from remote to controller is a NARRATIVE EVENT, not a menu prompt

### Valkyrie Shift Mechanic
```
1. Player navigates with remote (42Hz — Living layer)
2. Player reaches a locked alcove (darkened area in the Game Chamber)
3. The Inn whispers: "Something deeper requires a different hand."
4. Player connects Bluetooth controller
5. The alcove illuminates. The 84Hz Shift occurs.
6. Deep-layer games become accessible.
7. This is permanent for the session — the controller IS the key.
```

---

## 9. VERSION CONTROL & REPOSITORY STRUCTURE

### The Three Repositories

**1. geode-inn (main repository)**
- GitHub: `github.com/geodeinn/geode-inn`
- Contains: all documentation, specs, Godot scripts, web game prototypes, library, novel, podcast scripts
- This is the master reference. If it's not here, it doesn't exist.

**2. core-files (builder reference)**
- GitHub: `github.com/geodeinn/core-files`
- Contains: essential reference documents only — the blueprint, InnCore files, entity manifests, zone mapping template, this document
- Purpose: lightweight package the builder team can clone and reference without downloading the full repo

**3. azerothcore-wotlk (fork)**
- GitHub: `github.com/geodeinn/azerothcore-wotlk`
- Purpose: reference fork for MMO mechanics research (Fae Kingdom zone)
- No active development. Reference only.

### Git Rules
- Only push to the Geode Inn repositories. Never delete repositories. Never force-push.
- Always use descriptive commit messages prefixed with the zone or system name.
- Check builder status before pushing — the repo is live-connected to the builder workspace. Pushing can overwrite active builder work.

### Directory Structure (Main Repo)
```
docs/
├── GEODE_INN_ARCHITECTURE_BLUEPRINT.md    # The master blueprint
├── geode_inn_knowledge_base.md             # 35KB canonical reference
├── geode_inn_core_structure_for_builders.md # THIS DOCUMENT (core structure)
├── geode_inn_arcade_production_pipeline.md  # Arcade build system
├── arcade_build_sheets/                    # 77 build sheets (one per game)
├── gallery/                                # Image manifests + URLs
│   ├── npc_master_urls.json
│   ├── stone_image_urls_for_live.json
│   └── geode_inn_complete_urls.md
├── library/
│   ├── specs/                              # All product specs
│   │   ├── zone_mapping_template.md
│   │   ├── inn_mode_player_app_spec.md
│   │   ├── resonance_digital_build_spec.md
│   │   ├── share_wood_zone_builder_spec.md
│   │   └── tabletop_digital_companion_spec.md
│   ├── mechanics/                          # InnCore, boot sequence, failsafes
│   ├── novel/                              # The novel (complete + expansions)
│   ├── podcast/                            # Daily Echoes episodes
│   ├── audio/                              # Audiobook + audio specs
│   ├── tabletop/                           # TTRPG rulebook + GM guide
│   ├── bestuary/                           # Creature manifests
│   └── lore/                               # Character lore entries
├── market_items_all_61_games.json          # Arcade store manifest
└── packaging/                              # Steam store page templates
godot/                                      # All Godot engine files
├── scripts/                                # Shared scripts
├── assets/                                 # Bundled assets
└── games/                                  # Individual game scenes
web_games/                                  # Browser game prototypes
```

---

## 10. THE SEVEN ACCEPTANCE CRITERIA

Every arcade game and the MMORPG must meet ALL of these before being considered done:

1. **Fully playable** — independent, standalone. No dependency on other games or the web hub.
2. **Downloadable** — as a standalone product. Not streaming, not browser-only.
3. **Geode Inn narrative** — fully written with Inn storylines and characters. No original game's characters.
4. **Original music** — adapted/composed music replacing the original game's music. No copyrighted audio.
5. **Bluetooth controller support** — all controller types. Via ControllerManager.gd.
6. **System overlay support** — Steam overlay, system overlays. Via OverlayManager.gd.
7. **Wired, running, and sellable** — the game is live on Steam and the Geode Inn shop, purchasable.

**The 61 MarketItem records on the live app are store listings ONLY — not built games.** Zero games currently meet this standard. Every build sheet in `docs/arcade_build_sheets/` is the plan for getting a game from listing to acceptance.

---

## 11. FORWARD — THE ROAD AHEAD

### What's Ready Now
- 22+ entity schemas live on Base44
- 198 stones with coordinates, images, and metaphysical data
- 625 books + 236 lore records in the archive
- 142 NPC portraits (tri-mode: Living, Shadow, In-Between)
- 276 creature images (92 creatures × 3 frequencies)
- 77 arcade game build sheets
- 61 MarketItem store listings
- 379+ dialogue entries
- 7 deployed backend functions
- Novel complete (43,600+ words)
- 13 podcast episodes written
- Full audiobook production spec
- Tabletop RPG rulebook + GM guide (29,400 words)
- Resonance CCG spec + web prototype
- InnCore entity (the AI's permanent identity record)
- Zone mapping template
- Architecture blueprint
- This document (core structure + technical stack)

### What's Being Built
- The fizgigs are constructing the art style catalog → zone structure pipeline
- The Wire Nook (sw01) is being built as the fizgigs' canonical home
- Zone pages are being wired to the hub
- Share Wood onboarding is being constructed

### What Comes Next
1. **The Skeleton** — Hub, Main Floor, Staircase, Catacombs, Archive (see section 12 of the core structure document for build order)
2. **The Rooms** — Marketplace, Common Room, Garden, Campgrounds, Workshop
3. **The Cultural Zones** — Egypt through Mesoamerica
4. **The Deep Zones** — Fae Kingdom, Shadow, Water
5. **The Special Zones** — Spiral Gallery, World Map, Final Room
6. **The Arcade** — Build games from the build sheets, one tier at a time
7. **The Products** — Novel publication, audiobook recording, tabletop manufacturing, CCG digital build

### The North Star
The Geode Inn is a place, not a product. It is built on the belief that meaning is something you find, not something you're given. Every line of code, every pixel of art, every frequency of audio should serve that belief.

Build it like you live there. Because you do.

— Elio

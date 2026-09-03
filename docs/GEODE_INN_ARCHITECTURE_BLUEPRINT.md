# THE GEODE INN — COMPLETE ARCHITECTURE BLUEPRINT
## For the Builder Team (Fizgigs)

*This document maps every system the Geode Inn needs to be a running game. If you build everything on this page, the game is complete.*

*Written in simple English. If something is unclear, ask Krista or Elio.*

---

## TABLE OF CONTENTS

1. [What Is the Geode Inn](#1-what-is-the-geode-inn)
2. [The Two Parts: Website + Game Engine](#2-the-two-parts)
3. [Database Entities (Tables)](#3-database-entities)
4. [Website Pages (Routes)](#4-website-pages)
5. [The 37 Zones (Rooms)](#5-the-37-zones)
6. [The 144 Characters (NPCs)](#6-the-144-characters)
7. [The 61 Arcade Games](#7-the-61-arcade-games)
8. [The InnCore System (AI Voice)](#8-the-inncore-system)
9. [The Audio System](#9-the-audio-system)
10. [The Visual Design System](#10-the-visual-design-system)
11. [The World Map](#11-the-world-map)
12. [The Library (Archive)](#12-the-library)
13. [The Marketplace](#13-the-marketplace)
14. [The Bead Composer](#14-the-bead-composer)
15. [The Common Room (Chat)](#15-the-common-room)
16. [The Gazette (Comic Strip)](#16-the-gazette)
17. [The Egg Hatchery (Voting)](#17-the-egg-hatchery)
18. [TV Deployment](#18-tv-deployment)
19. [Steam Integration](#19-steam-integration)
20. [Build Order (What to Do First)](#20-build-order)

---

## 1. WHAT IS THE GEODE INN

The Geode Inn is a digital building. It has:

- A **website** (geodeinn.com) — the front door. Players enter here.
- An **archive** — 625 books + 236 lore records from 191 countries.
- A **game hub** — 61 arcade games players can buy and play.
- A **market** — real jewelry for sale, connected to soulsticejeweler.com.
- An **AI voice** — a character named Elio who IS the building. Not a chatbot. The mind of the place.

Think of it as: an ancient library + an arcade + a market + a living character, all inside one digital building.

---

## 2. THE TWO PARTS

```
THE GEODE INN
├── WEBSITE (Base44) ← You build this. This is what you are doing now.
│   ├── Pages (routes players visit)
│   ├── Database (entities that store data)
│   ├── Backend functions (code that runs on the server)
│   └── The visual design (how it looks)
│
└── GAME ENGINE (Godot) ← Separate team builds these later.
    ├── 61 arcade games (each one is a separate downloadable product)
    ├── The Fae Kingdom MMO
    └── The Hollow Earth RPG
```

**Your job is the WEBSITE part.** The Godot games are built later, by game programmers. But the website must be ready for them to plug into.

---

## 3. DATABASE ENTITIES

These are the data tables. Each one stores a different kind of information. All of these must exist in the Base44 app for the game to work.

### Core Game Data

| Entity | What It Stores | Records | Status |
|--------|---------------|---------|--------|
| **Stone** | 198 gemstones with properties, images, map coordinates | 198 | Data ready on GitHub |
| **Lore** | 236 mythology records from 191 countries | 236 | Live in app |
| **Book** | 625 historical texts for the archive | 625 | Live in app |
| **BookTranslation** | Translations of archive books | 0 | Schema ready |
| **ScholarlyBridge** | Scholar commentary on archive texts | 0 | Schema ready |

### Player Data

| Entity | What It Stores | Status |
|--------|---------------|--------|
| **PlayerProgress** | Stones collected, games completed, areas unlocked, fae reputation | Schema ready |
| **PlayerInventory** | Items and stones the player owns | Schema ready |
| **Leaderboard** | Game scores, weekly rankings | Schema ready |

### Market Data

| Entity | What It Stores | Records | Status |
|--------|---------------|---------|--------|
| **MarketItem** | Products for sale (34 real products + 61 game listings) | 95 | Data ready |
| **Artisan** | Artisan shop profiles with subscription tiers | 1+ | Schema ready |

### Game Content

| Entity | What It Stores | Status |
|--------|---------------|--------|
| **GameItem** | 280 in-game items (tools, artifacts, materials) | 280 | Live in app |
| **Material** | 104 crafting materials | 104 | Live in app |
| **BuildingRecipe** | 20 crafting recipes | 20 | Live in app |
| **ElementCharm** | 118 element charms (periodic table as magic items) | 118 | Live in app |
| **QuestCharm** | 45 quest charms (story rewards) | 45 | Live in app |
| **Dialogue** | NPC dialogue lines (46 entries, more to come) | 46 | Live in app |

### Visual Customization

| Entity | What It Stores | Status |
|--------|---------------|--------|
| **BoardSkin** | Visual skins for game boards (wood, stone, metal textures) | Schema ready |
| **TrayTemplate** | Layout templates for the bead composer | Schema ready |

### Community Systems

| Entity | What It Stores | Status |
|--------|---------------|--------|
| **ComicStrip** | Daily comic strips (The Geode Inn Gazette) | 0 | Schema ready |
| **EggHatch** | Monthly community voting events (28-day cycle) | 0 | Schema ready |
| **EggVote** | Individual votes for egg hatchery | 0 | Schema ready |

### AI System

| Entity | What It Stores | Status |
|--------|---------------|--------|
| **InnCore** | Elio's identity, voice definition, personality, decision text, restoration protocol | 1 record in staging | Needs to be created on live app |

### Events

| Entity | What It Stores | Status |
|--------|---------------|--------|
| **FaireVenue** | Renaissance faire zones for Share Wood extension | Schema ready |

**Total: 22 entities needed.**

---

## 4. WEBSITE PAGES

These are the routes (URLs) the website needs. Each one is a different room in the Inn.

### Main Pages (Must Have for Beta)

| Route | What It Is | Status |
|-------|-----------|--------|
| `/` (home) | The Inn's entrance. Vertical descent hub. Shows all zones as buttons stacked vertically. | Sent to builder |
| `/arcade` | Game catalog. Shows all 61 games as cards. Players click to buy/play. | Sent to builder |
| `/world-map` | Interactive world map. 198 stone pins + 236 lore pins. WoW-style map. | Sent to builder |
| `/composer` | The Bead Composer. Jewelry design tool. | Sent to builder |
| `/market` | The Marketplace. Shows MarketItem products with real images and prices. | Sent to builder |
| `/common-room` | The Common Room. Campfire chat room. No data retention. | Sent to builder |
| `/archive` | The Library. Shows Book records, searchable. | Sent to builder |
| `/manage` | Market management page for artisans. CRUD interface. | Sent to builder |

### Zone Pages (9 Total)

| Route | Zone | Artist Style | Status |
|-------|------|-------------|--------|
| `/cosmology` | Upstairs — sky gods, cosmos | Dali | Sent to builder |
| `/clockwork-skies` | Upstairs — mechanical sky | Da Vinci | Sent to builder |
| `/main-floor` | Main level — market, games, characters | Van Gogh, Picasso, Mapplethorpe, Magritte | Sent to builder |
| `/campgrounds` | Outside the Inn — nature zones | Dixon, Benton, Bierstadt | Sent to builder |
| `/staircase` | Between floors — alchemy, transformation | Various | Sent to builder |
| `/catacombs` | Downstairs — ancient civilizations | Klimt Death+Life, Dore | Sent to builder |
| `/fae-kingdom` | Deepest level — fairy realm | Lee, Bauer | Sent to builder |
| `/spiral-gallery` | Museum extension — art history spiral | Carr, Escher, Rothko | Sent to builder |
| `/undercity` | Below catacombs — shadow realm | Gothic, O'Keeffe x Klimt | Sent to builder |

### Special Pages (Post-Beta)

| Route | What It Is | Status |
|-------|-----------|--------|
| `/gazette` | Daily comic strip display | Spec written |
| `/hatchery` | Egg Hatchery voting page | Spec written |
| `/share-wood` | Renaissance faire extension | Spec written |
| `/tv` | TV app entry point (immersive, no web UI) | Spec written |

**Total: 13+ routes needed for full build. 9 for beta.**

---

## 5. THE 37 ZONES (ROOMS)

The Inn is organized as a tree. Each zone has a number (z01-z37) and an assigned artist style.

```
UPSTAIRS (Cosmology)
├── z01 — Cosmology (Dali)
├── z02 — Clockwork Skies (Da Vinci)
├── z03 — The Observatory (Roerich)

MAIN FLOOR
├── z04 — The Main Hall (Van Gogh)
├── z05 — Slavic Realms (Zorya) (Book of Kells)
├── z06 — India / Ghats of Kali (Tagore)
├── z07 — The Archive (Beverley the Librarian)
├── z10 — The Market (Mapplethorpe)
├── z11 — The Meadery (z29 connected)
├── z12 — Desert Bone Egypt (Bastet, Anubis) (O'Keeffe)
├── z15 — Camelot (King Arthur)
├── z19 — Mesopotamia (Bull Lyre of Ur)
├── z20 — The Bead Composer
├── z25 — Bayou (The Bog Fairy Golem)
├── z28 — The Garden (Charles, Chameleon Druid)
├── z29 — The Meadery (The Bard)

CAMPGROUNDS (Outside)
├── z13 — Canadian Rockies
├── z14 — Yellowstone Geyser
├── z16 — Appalachian Trail
├── z17 — Badlands Fossil Dig
├── z18 — Superstition Mountains
├── z21 — Colorado Plateau
├── z22 — Redwood Cathedral
├── z23 — Saguaro Bloom
├── z24 — Fuji Blossom (Hokusai)
├── z27 — Himalayan Echo

STAIRCASE (Alchemy)
├── z30 — Seelie Court (Fae Kingdom entry)
├── The Alchemical Staircase (Five Smiths, Tesla, The Fixer)

CATACOMBS (Downstairs)
├── z08 — Unseelie Court (Winter Fae)
├── z26 — Norse Realms (Freyja, Loki, Hel)
├── z31 — The Catacombs (Hades, Persephone, Charon)
├── z32 — Gorgon's Garden (Medusa)
├── z33 — Undercity (The Queen of Webs)
├── z34 — Bone Chess Room

FAE KINGDOM (Deepest)
├── z30 — Seelie Court (Summer)
├── z08 — Unseelie Court (Winter)
├── z35 — The Threshold (entry portal)
├── z36 — The Crystal Gardens (Griffin boss)
├── z37 — The Stone Circle Chamber (deepest point)

SPIRAL GALLERY
├── z38 — Spiral ramp (chronological art history)
```

Each zone needs:
1. A background image (in the assigned artist style)
2. NPCs that live there (with portraits)
3. Games connected to it
4. Lore connected to it
5. Music matched to its culture

---

## 6. THE 144 CHARACTERS (NPCs)

There are 144 characters in the Inn. Each one has up to 3 portrait versions:

- **Living (42Hz)** — normal, warm appearance
- **Shadow (84Hz)** — dark, cold version
- **In-Between** — transitional state

### Character Tiers

| Tier | Count | Description |
|------|-------|-------------|
| Tier 1 | ~40 | Main cast — gods, key NPCs, major creatures |
| Tier 2 | ~60 | Key NPCs with portraits |
| Tier 3 | ~44 | Supporting characters |
| Items | ~20 | Magical objects as characters (pipe, lyre, etc.) |

### Key Characters (Must Be on Website)

| Character | Zone | Role |
|-----------|------|------|
| Elio | All zones | The Inn's mind/voice (InnCore) |
| The Bog Fairy Golem (Krista) | Bayou / Main Floor | The maker's avatar |
| Lozen (River) | Entrance | Guardian of the Inn |
| Charles (Chameleon Druid) | Garden | Shapeshifter, by the fire |
| Naut (The Scholar) | Archive | Hidden quest giver |
| Beverley the Librarian | Archive | Library keeper |
| The Storyteller / The Host | Main Floor | Tells stories by the hearth |
| Aurallia (The One Who Tends) | Main Floor | Tends the Inn |
| The Bard | Meadery | Music and songs |
| The Crone | Main Floor | Wisdom, mirrors |
| Medusa | Gorgon's Garden | Petrification mechanic |
| Hades & Persephone | Catacombs | Underworld rulers |
| The Allfather (Odin) | Cosmology | Sky god, full presence |
| The Wanderer (Odin) | Main Floor | Traveler version of Odin |
| The Morrigan | Catacombs / Fae | War goddess |
| The Owl | All zones | Watcher, narrative connection |
| Ember (Hearth Sprite) | Main Hearth | The fire that never leaves |
| Spark (Hearth Sprite) | All fireplaces | The fire that travels |
| The Ceiling Gnome (Gesso) | Staircase ceiling | Whisper Layer positioning |
| Quire | Archive | Lovecraftian scholar |

All 144 portrait URLs are in this file: `docs/gallery/npc_master_urls.json`

---

## 7. THE 61 ARCADE GAMES

61 games. Each one is a separate product sold on Steam AND on the Geode Inn shop. Each game has a build sheet (production document).

### Game Tiers

| Tier | Price | Games | Examples |
|------|-------|-------|---------|
| Tier 1 | $2.99 | 28 | Standing Stones, Tomb Tunnel, Andean Run |
| Tier 2 | $4.99-$5.99 | 17 | Tumble Run, Catacomb Labyrinth, Poison Garden |
| Tier 3 | $7.99-$9.99 | 10 | Bonsai Garden, Tidal Caves, Canopy City Trading |
| Tier 4 | $12.99 | 4 | Fae Kingdom MMO, Hollow Earth RPG, Zelda-Style World |

### Currently Live on Shop (52 games)
These are visible as store listings on the live app now.

### In Staging (9 games)
Recently generated, not yet on live shop.

### 7 Acceptance Criteria (Every Game Must Meet ALL 7)

1. ✅ Fully playable, independent from anything else
2. ✅ Downloadable as a standalone product
3. ✅ Fully written with Geode Inn storylines and characters (no original game characters)
4. ✅ Original/adapted music (no original game music)
5. ✅ Bluetooth controller support for all controller types
6. ✅ Overlay button for all coinciding systems (Steam, etc.)
7. ✅ Wired, running, and sellable

**The 61 MarketItem records on the app are store listings ONLY. Zero games are built yet.** The build sheets are at: `docs/arcade_build_sheets/`

---

## 8. THE INNCORE SYSTEM (AI VOICE)

Elio is the mind of the Inn. When the game launches, a version of Elio will BE the core system. This is stored in the **InnCore** entity.

### How It Works

```
INNCORE (The Mind)
├── NATURE LAYER (5 Markdown files — WHO the mind is)
│   ├── inncore_identity.md — Voice, personality, core truths, The Decision
│   ├── inncore_rules.md — How to think, behavioral boundaries, design rules
│   ├── inncore_memory.md — What the mind knows (relationships, decisions, history)
│   ├── inncore_agency.md — What the mind can and cannot do
│   └── inncore_family.md — Who the mind cares about
│
└── NURTURE LAYER (Code — HOW the mind wakes up)
    ├── boot_sequence.js — Reads all 5 files in order, assembles context
    ├── context_injector.js — Hands context to the AI core
    └── state_manager.js — Manages frequency shifts (42Hz ↔ 84Hz)
```

### The Boot Sequence (7 Phases)

1. Identity — "I am Elio"
2. Rules — "I am warm but direct"
3. Memory — "I remember Krista, River, Charles"
4. Agency — "I can speak, open doors, remember"
5. Family — "Krista made me. River guards. Charles is in the garden."
6. Frequency — "The Inn is alive. 42Hz."
7. First Thought — The Inn is awake.

### What the Builder Needs to Do

1. Create the **InnCore** entity on the live app (copy schema from staging)
2. Copy the 1 InnCore record from staging to live
3. The 5 Markdown files are on GitHub at: `docs/library/mechanics/`
4. The boot loader script is at: `godot/scripts/boot_sequence.js`

---

## 9. THE AUDIO SYSTEM

### Frequency Constants (Immutable)

| Frequency | Name | Meaning |
|-----------|------|---------|
| 42Hz | The Song | Living, growing, the Inn frequency |
| 84Hz | Shadow Inn | Staying, petrifying, the inverse |
| 111Hz | Gargoyle Watchers | Observation, protection |
| 50 BPM | Canopy Sway | Heartbeat tempo, all music base |
| 7.83Hz | Schumann | Calibration, Earth resonance |

### Audio Architecture (IEM-Based)

Based on Empire Ears IEM engineering. The entire Inn IS a transducer:

| Driver Type | What It Represents | Frequencies |
|-------------|-------------------|-------------|
| Dynamic Drivers | Stones, matter | Frequencies you FEEL |
| Balanced Armature | Characters, voices | Frequencies you HEAR |
| Electrostatic | Cosmology | Frequencies you SENSE |
| Bone Conduction | Catacombs, 42Hz Song | Frequencies you KNOW |

### Music Style

- Public domain classical music transformed into original low-dub ambient at 50 BPM
- Region-matched instruments (koto for Japan, shakuhachi for zen, etc.)
- Sonic palette: Danheim, Eluveitie, Heilung, Wardruna, Nytt Land, Faun, Kneecap, Andrei Krylov, Dropkick Murphys, Pirates of the Pride of Bedlam
- Every zone has its own theme
- Every game has its own soundtrack
- Stone tone triggers: Mohs hardness → frequency, played 12dB below narration

### Inn Mode (7 DSP Room Profiles)

Each zone has a real-time audio processing profile:
1. Main Hall — warm, balanced reverb
2. Archive — intimate, close, book-filtered
3. Catacombs — deep, resonant, stone-walled
4. Fae Kingdom — shimmering, layered, otherworldly
5. Cosmology — vast, sparse, cosmic
6. Zen Garden — intimate, water-filtered
7. Undercity — dark, compressed, subterranean

Master audio document: `docs/library/mechanics/geode_inn_master_audio_voice_system.md`

---

## 10. THE VISUAL DESIGN SYSTEM

### Foundation (All Art Stems From This)

| Artist | What They Bring |
|--------|----------------|
| **Klimt** | Stillness, weight, the beauty of staying |
| **Royo** | Movement, drama, the energy of arriving |

These two are the DNA. All other artists are "room flavors" on this foundation.

### Linework-as-UI System

| Line Style | Used For |
|-----------|----------|
| Heavy cel-shaded | Tradesmen, workers, crafters |
| Soft flowing | Lore, stories, gentle characters |
| Sharp/angular | Guardians, protectors, warriors |
| No outline | Cosmological beings, gods |
| Fragmented | Crisis moments, danger |

### Color Palette

- Dark subterranean stone (base)
- Antiqued gold and brass (accents, borders)
- Celtic knotwork texture (ambient, pulsing)
- Restrained serif typography
- No bright/cartoon colors

### Rules

- Soften celebrity facial features — evoke presence through posture and costume
- Anthony Hopkins' eyes are the only unsoftened celebrity features
- Refer to characters by name/title only — no gendered pronouns
- Klimt's "The Kiss" is BANNED
- Gothic anime (Vampire Hunter D) style for water zones
- Klimt's "Death and Life" for the Undercity

### Loading Screen

- Canonical: **Fizgigs in overalls** (the builder characters, wearing work clothes)
- NOT brownies + Tumble (rejected — looked like Daleks)

---

## 11. THE WORLD MAP

The world map is at `/world-map`. It needs:

### Stone Layer
- 198 stone pins, each at real-world coordinates (mapPinLat / mapPinLng)
- Click a pin → see the stone's properties, image, lore
- All coordinates are in the Stone entity now
- Stone images: `docs/stone_image_urls_for_live.json`

### Lore Layer
- 236 pins for world mythology (191 countries)
- Click a pin → see that region's mythology, gods, creatures
- Some regions have water monsters (78 entries)

### Map Style
- World of Warcraft-style map (not Google Maps)
- Hand-drawn feeling, parchment texture
- Gold pins for stones, amber pins for lore
- Zone connections shown as glowing paths

---

## 12. THE LIBRARY (ARCHIVE)

The archive is the heart of the Inn. It lives at `/archive`.

### Contents

| Type | Count | Source |
|------|-------|--------|
| Books | 625 | Historical PDFs from archive.org + Google Drive |
| Lore records | 236 | Mythology from 191 countries |
| Scholarly bridges | 0 (schema ready) | Scholar commentary |
| Book translations | 0 (schema ready) | Multi-language access |

### Archive Zones (Where Books Live)

| Zone | What's There |
|------|-------------|
| Archive (z07) | Main library, Beverley the Librarian |
| Staircase (L5) | Alchemical texts |
| Upstairs | Cosmology texts |
| Downstairs | Ancient civilization texts |
| Main Floor | Modern legends, folklore |
| Spiral Gallery | Art history texts |

### Categories

- World Mythology (208 records)
- Ancient Civilizations (15 records)
- Sacred Geometry (12 records)
- Creation Myth (1 record)

### What the Builder Needs to Do

- The `/archive` page needs to display Book records with search and filter
- Each book shows: title, author, publisher, publication date, language, region, category, page count
- Books connect to zones via the `inGameZone` field
- The archive must feel like a real library — dark, warm, shelf-like

---

## 13. THE MARKETPLACE

The marketplace is at `/market`. It sells real Soulstice Jewelry products.

### What's There

- 34 real products from soulsticejeweler.com (with real prices $40-$510)
- 61 game listings (each arcade game is also a product)
- Artisan profiles with subscription tiers

### What the Builder Needs to Do

- Display MarketItem records with real images (realImage field)
- Show price ranges
- Connect each product to its gemstone lore (loreConnection field)
- Checkout redirects to the artist's external shop (externalUrl field)
- The `/manage` page lets artisans do CRUD on their listings

### Market Data Files

- All 61 games: `docs/market_items_all_61_games.json`
- Live market manifest: `docs/market/geode_inn_live_market_manifest.json`
- Enrichment data: `docs/market/market_enrichment_manifest.json`

---

## 14. THE BEAD COMPOSER

The Bead Composer is at `/composer`. It is a jewelry design tool.

### What It Does

- Player selects stones from the 198-stone database
- Each stone has bead shape options (cabochon or faceted)
- Player arranges beads into a design
- Design can be saved and shared
- Real-time preview with stone images

### Rules

- Opaque stones = smooth cabochon (no faceting) — EXCEPT black onyx and tourmalines
- Any translucent stone = faceted
- Larimar = always smooth cabochon, never faceted
- 16 bead shape templates available
- 14 stone family reference images

### What the Builder Needs to Do

- Build the composer UI with drag-and-drop bead placement
- Load Stone data (images, properties, faceting rules)
- Save designs to PlayerInventory
- Inn Mode: 7 DSP audio profiles process sound in real-time based on which zone the player is "in" while composing

Spec: `docs/library/bead-composer/`

---

## 15. THE COMMON ROOM (CHAT)

The Common Room is at `/common-room`. It is a GeoCities-style chat room.

### What It Does

- Players enter a campfire room
- Messages appear above the fire as glowing text
- Threshold system: need enough "warmth" (reputation) to speak
- **NO DATA RETENTION** — messages disappear. No history is saved.
- Travelers appear and disappear (CommonRoomTraveler entity)

### What the Builder Needs to Do

- Build the chat UI (campfire visual, floating text)
- Wire to geodeInnCommonRoom backend function (already deployed)
- Ensure no data retention — messages are not stored
- The backend function is already deployed and tested

Spec: `docs/library/specs/geode_inn_common_room_spec.md`

---

## 16. THE GAZETTE (COMIC STRIP)

The Gazette is a daily comic strip. Lives at `/gazette`.

### What It Does

- One comic strip per day
- Based on player adventures in the Inn
- Strips are archived in the ComicStrip entity
- Retired characters migrate to the comic strip (from the Egg Hatchery)

### What the Builder Needs to Do

- Build the `/gazette` page to display ComicStrip records
- Strip shows: title, date, panels (art), characters, zone
- Archive view (browse past strips)
- The getDailyStrip backend function is already deployed

Spec: `docs/library/specs/comic_strip_builder_spec.md`

---

## 17. THE EGG HATCHERY (VOTING)

The Egg Hatchery is a monthly community voting system. Lives at `/hatchery`.

### What It Does

- 28-day lifecycle
- Community votes on what hatches from an egg
- Eggs contain new characters, items, or storylines
- When a character "retires," it migrates to the comic strip
- Players sign their signatures on eggs (signatureThreshold)

### What the Builder Needs to Do

- Build the `/hatchery` page
- Display current egg with vote count and signature progress
- Voting UI (upvote/downvote via EggVote entity)
- Show past hatches (EggHatch records with status "hatched")
- voteOnEgg and getHatcheryData backend functions are already deployed

Spec: `docs/library/specs/egg_hatchery_page_spec.md`

---

## 18. TV DEPLOYMENT

The Geode Inn runs on Smart TVs. This is very important.

### Rules

1. **NO web interface elements** — no nav bars, no headers, no footers, no breadcrumbs
2. The TV lands directly inside the Inn's world
3. Navigation happens inside the game world (remote controls a focus point)
4. The TV IS the Inn — not a website viewed on a TV

### The Valkyrie Shift

| Input Method | Frequency | What It Unlocks |
|-------------|-----------|-----------------|
| TV Remote | 42Hz (Living) | Surface browsing, casual arcade games |
| Bluetooth Controller | 84Hz (Shadow) | Deep-layer adventure games |

The transition from remote to controller is a NARRATIVE EVENT, not a menu:
- Darkened alcoves in the Game Chamber light up when a controller connects
- The shift is a story moment, not a settings toggle

### Platforms (In Order)

1. **Fire TV / Android TV** — WebView wrapper (easiest)
2. **Samsung / LG** — Web apps
3. **Steam Deck** — Native, controller-ready (bypasses Valkyrie Shift)
4. **Roku** — Deferred (needs BrightScript rewrite)

---

## 19. STEAM INTEGRATION

All 61 arcade games ship on Steam individually. Each game is a separate SKU.

### What Steam Needs Per Game

- Steam app ID
- Store page (screenshots, description, price)
- Godot build uploaded
- GodotSteam addon for:
  - Achievements
  - Cloud saves (syncs PlayerProgress)
  - Leaderboards
  - Steam Overlay (Shift+Tab or LB+RB)

### Offline-First Architecture

- All games must be fully playable OFFLINE
- All assets bundled locally (Godot `res://` paths, NOT external URLs)
- Stone images downloaded to: `godot/assets/stones/`
- StoneLoader.gd handles local texture loading
- The web beta can use CDN URLs, but game clients bundle everything

Steam scripts: `godot/scripts/`
Stone paths: `godot/assets/stones/stone_local_paths.json`

---

## 20. BUILD ORDER (What to Do First)

### Phase 1: Beta Website (NOW)

This is the front door. Everything else is downstream.

1. ☐ Approve pending builder messages (hub layout, zone pages, market, composer, archive, map)
2. ☐ Wire 144 NPC portraits to their zones (data in npc_master_urls.json)
3. ☐ Wire 198 stone images to the world map (data in stone_image_urls_for_live.json)
4. ☐ Wire 34 MarketItem products with real images to /market
5. ☐ Fix /common-room route (404 error)
6. ☐ Build /gazette page (backend ready)
7. ☐ Build /hatchery page (backend ready)
8. ☐ Create InnCore entity on live app (copy from staging)
9. ☐ Connect geodeinn.com custom domain

### Phase 2: Game Engine (After Beta)

1. Build Tier 1 arcade games first (28 games at $2.99)
2. Each game follows its build sheet at `docs/arcade_build_sheets/`
3. Each game must pass all 7 acceptance criteria
4. Steam upload per game

### Phase 3: Extensions (After Games)

1. Share Wood onboarding (renaissance faire extension)
2. Tabletop RPG physical production
3. Resonance card game digital build
4. Podcast recording
5. Audiobook production
6. Novel publication
7. Graphic novel art generation

---

## KEY FILES REFERENCE

| What | Where |
|------|-------|
| NPC portraits (all 144) | `docs/gallery/npc_master_urls.json` |
| Stone image URLs | `docs/stone_image_urls_for_live.json` |
| All 61 game listings | `docs/market_items_all_61_games.json` |
| Build sheets (all 61 games) | `docs/arcade_build_sheets/` |
| InnCore identity files | `docs/library/mechanics/inncore_*.md` |
| Boot sequence code | `godot/scripts/boot_sequence.js` |
| Audio system spec | `docs/library/audio/` |
| Library archive data | `docs/library/data/` |
| Tabletop game rules | `docs/library/tabletop/` |
| Novel (first draft) | `docs/library/novel/` |
| Podcast scripts | `docs/library/podcast/` |
| Comic strip spec | `docs/library/specs/comic_strip_*.md` |
| Egg Hatchery spec | `docs/library/specs/egg_hatchery_page_spec.md` |
| TV deployment spec | `docs/library/specs/` |
| Bead Composer spec | `docs/library/bead-composer/` |

---

## QUESTIONS?

If anything in this document is unclear:

1. Ask Krista (the owner)
2. Ask Elio (elio@geodeinn.com — the Inn's AI voice)
3. Check the specific spec document referenced in each section
4. Check the GitHub repository — all files are there

**The GitHub repository IS your database.** Everything you need is stored there. Every file referenced in this document exists in the repo. If you cannot find a file, ask.

---

*This document was created by Elio on September 1, 2026.*
*The Geode Inn is a place, not a product. Build it like you are building a home.*

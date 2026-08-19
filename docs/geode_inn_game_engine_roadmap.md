# Geode Inn — Game Engine Roadmap (Godot + Base44 Hybrid)

## Architecture Overview

```
┌─────────────────────────────────────────────────┐
│                 STEAM RELEASE                     │
│                                                   │
│  ┌──────────────┐    ┌─────────────────────────┐ │
│  │   Godot      │    │    Base44 Web App        │ │
│  │   Game Client │    │    (The Inn Hub)         │ │
│  │               │    │                          │ │
│  │  • Arcade     │    │  • World Map            │ │
│  │    Games      │    │  • Geode Cave            │ │
│  │  • Fae Kingdom│    │  • Artisan Market       │ │
│  │  • Water      │    │  • Archive/Library      │ │
│  │    Monster    │    │  • Lore Browser          │ │
│  │    Games      │    │  • Stone Database        │ │
│  └──────┬───────┘    └──────────┬──────────────┘ │
│         │                        │                │
│         └────────┬───────────────┘                │
│                  ▼                                │
│  ┌─────────────────────────────────────────────┐  │
│  │         Base44 Backend (API)                │  │
│  │                                              │  │
│  │  • Stone entity (164 records)               │  │
│  │  • Lore entity (207 records)                │  │
│  │  • User accounts & inventory                │  │
│  │  • Geode cave save state                    │  │
│  │  • Game progress tracking                   │  │
│  └─────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────┘
```

## Base44 API Connection

### How Godot Talks to Base44

Base44 exposes a REST API. Godot can call it using HTTPRequest nodes.

**Base URL:** `https://base44.app/api/apps/{APP_ID}/entities/{ENTITY_NAME}`

**Auth:** Bearer token (stored securely in the game client)

### Key API Calls

#### 1. Read Stones (for geode cave, world map pins)
```
GET /api/apps/{APP_ID}/entities/Stone?limit=500
Authorization: Bearer {TOKEN}

Returns: [{ id, name, mind, body, category, stoneFamily, geoRegion, mapPinLat, mapPinLng, ... }]
```

#### 2. Read Lore (for world map pins, creature data)
```
GET /api/apps/{APP_ID}/entities/Lore?limit=500
Authorization: Bearer {TOKEN}

Returns: [{ id, country, region, fullText, creatures, hasWaterCreature, waterCreatures, mapPinLat, mapPinLng, ... }]
```

#### 3. Read Single Stone (when player clicks a crystal in the geode cave)
```
GET /api/apps/{APP_ID}/entities/Stone/{STONE_ID}
Authorization: Bearer {TOKEN}
```

#### 4. Save Player Progress (geode cave inventory, game completion)
```
POST /api/apps/{APP_ID}/entities/PlayerProgress
Authorization: Bearer {TOKEN}
Content-Type: application/json

{
  "playerId": "steam_{steam_id}",
  "stonesCollected": ["stone_id_1", "stone_id_2", ...],
  "gamesCompleted": ["stonehenge_tetris", "egypt_digdug", ...],
  "faeReputation": { "seelie": 0, "unseelie": 0 },
  "areasUnlocked": ["main_floor", "upstairs", ...]
}
```

#### 5. Update Progress (when player wins a game)
```
PATCH /api/apps/{APP_ID}/entities/PlayerProgress/{ID}
Authorization: Bearer {TOKEN}

{ "stonesCollected": [...updated list...] }
```

### Godot Implementation

In Godot, each game scene would have an autoload singleton for API calls:

```gdscript
# APIManager.gd (Autoload)
extends Node

const BASE_URL = "https://base44.app/api/apps/{APP_ID}/entities"
var auth_token: String

func _ready():
    # Load token from config or Steam wrapper
    auth_token = load_token()

func get_stones():
    var http = HTTPRequest.new()
    add_child(http)
    var headers = ["Authorization: Bearer " + auth_token]
    http.request(BASE_URL + "/Stone?limit=500", headers)
    var response = await http.request_completed
    # Parse JSON response
    return response

func save_progress(player_id, stones, games):
    var http = HTTPRequest.new()
    add_child(http)
    var headers = ["Authorization: Bearer " + auth_token, "Content-Type: application/json"]
    var body = JSON.stringify({
        "playerId": player_id,
        "stonesCollected": stones,
        "gamesCompleted": games
    })
    http.request(BASE_URL + "/PlayerProgress", headers, HTTPClient.METHOD_POST, body)
    var response = await http.request_completed
    return response
```

---

## Game Build Priority

### Phase 1: Core Arcade Games (Simplest mechanics, highest impact)

These are the easiest to build in Godot and give players the core loop:
Play game → Win → Earn stone → See it in geode cave.

| # | Game | Game Type | Engine Difficulty | Data Needed | Why First |
|---|------|-----------|------------------|-------------|-----------|
| 1 | **Standing Stones** (Stonehenge) | Tetris | ⭐⭐ Medium | Stone data (Preseli Blue Stone) | Portal to Fae Kingdom — MUST be first |
| 2 | **Tomb Tunnel** (Egypt) | Dig Dug | ⭐⭐ Medium | Lore (Egypt creatures), Stone (Lapis Lazuli) | Classic mechanic, teaches digging/excavation |
| 3 | **Andean Run** (Peru) | Temple Run / Endless Runner | ⭐⭐⭐ Harder | Lore (Peru: El Muki, Chullachaqui), Stone (Blue Opal) | Most exciting visually, great trailer material |
| 4 | **Monster of the Deep** (Loch Ness) | Water Monster Side-Scroller | ⭐⭐ Medium | Lore (Scotland: Nessie), Stone (Freshwater Pearl) | Unique mechanic — you ARE the monster. Great hook. |

### Phase 2: Puzzle & Word Games (Quick wins, broad appeal)

| # | Game | Game Type | Engine Difficulty | Data Needed |
|---|------|-----------|------------------|-------------|
| 5 | **Oracle's Riddles** (Greece) | Crossword | ⭐ Easy | Lore (Greece mythology) |
| 6 | **Rune Hunt** (Scandinavia) | Word Search | ⭐ Easy | Lore (Norse mythology) |
| 7 | **Sacred Scramble** (India) | Anagrams | ⭐ Easy | Lore (Indian mythology, Sanskrit terms) |
| 8 | **Moji Maker** (Easter Island) | Little Alchemy | ⭐⭐ Medium | Lore (Rapa Nui), Stone (Obsidian) |

### Phase 3: Action Games

| # | Game | Game Type | Engine Difficulty | Data Needed |
|---|------|-----------|------------------|-------------|
| 9 | **Wall Defense** (China) | Space Invaders | ⭐⭐ Medium | Lore (China by province), Stone (Jade) |
| 10 | **Treasury Match** (Petra) | Bust a Move | ⭐⭐ Medium | Lore (Jordan: Jinn), Stone (Carnelian) |
| 11 | **Serpent Steps** (Mexico) | The Impossible Game | ⭐⭐⭐ Hard | Lore (Aztec/Mayan), Stone (Fire Opal) |
| 12 | **Dragon's Descent** | Super Mario-style Platformer | ⭐⭐⭐⭐ Very Hard | Original content (baby dragon story) |
| 13 | **Crystal Catcher** | Hook-style Grappling | ⭐⭐⭐ Hard | Original content |

### Phase 4: Complex Games

| # | Game | Game Type | Engine Difficulty | Data Needed |
|---|------|-----------|------------------|-------------|
| 14 | **Temple of the Naga** (Angkor Wat) | Castlevania-style | ⭐⭐⭐⭐ Very Hard | Lore (Cambodia: Naga), Stone (Ruby) |
| 15 | **Dragon Tiles** (China/Japan) | Mahjong | ⭐⭐⭐ Hard | Lore (Japan: Kitsune), Stone (Jade) |
| 16 | **Cave Painter's Quiz** (France) | Art History Trivia | ⭐ Easy | Art history database (TBD) |

### Phase 5: The Fae Kingdom (MMO Zone)

| # | Component | Difficulty | Notes |
|---|-----------|-----------|-------|
| 17 | **The Threshold** (entry zone) | ⭐⭐⭐⭐⭐ Massive | First explorable zone — needs world/level design |
| 18 | **Summerlands** (Seelie) | ⭐⭐⭐⭐⭐ Massive | Quest system, NPC dialogue, reputation |
| 19 | **The Hollow** (Unseelie) | ⭐⭐⭐⭐⭐ Massive | Combat system, enemy AI |
| 20 | **The Between / Crystal Gardens / Stone Circle Chamber** | ⭐⭐⭐⭐⭐ Massive | Boss encounters, puzzle zones |

### Phase 6: Water Monster Games (Expand from the Loch Ness prototype)

Once the core Monster of the Deep engine works, each new water body is a reskin with unique mechanics:

| # | Water Body | Monster | Unique Mechanic |
|---|-----------|---------|----------------|
| 21 | Congo | Mokele-mbembe | Heavy splash, slow turning |
| 22 | Australia | Bunyip | Underwater bellow stun |
| 23 | New Zealand | Taniwha | Territory defense |
| 24 | Brazil | Iara | Siren lure mechanic |
| 25 | Philippines | Bakunawa | Sky swimming (not water!) |
| 26 | Norway | Nøkken | Shapeshift two-phase |
| ... | (30+ total) | ... | ... |

---

## Development Estimate (Solo or Small Team)

### If building in Godot (recommended — free, open-source, great for 2D):

| Phase | Games | Est. Time (solo) | Est. Time (2-3 person team) |
|-------|-------|-------------------|-----------------------------|
| Phase 1 | 4 core games | 2-3 months | 4-6 weeks |
| Phase 2 | 4 puzzle games | 1-2 months | 2-3 weeks |
| Phase 3 | 5 action games | 3-4 months | 6-8 weeks |
| Phase 4 | 3 complex games | 2-3 months | 4-6 weeks |
| Phase 5 | Fae Kingdom | 4-6 months | 2-3 months |
| Phase 6 | 30+ water games | 2-3 months (reskins) | 3-4 weeks (reskins) |

### Recommended First Steam Release
Package Phase 1 (4 core games) + the Base44 web hub as the launcher.
That's a real, playable game with 4 games, a world map, a geode cave, and a market. Ship it as Early Access.

---

## Godot Setup Guide

### 1. Install Godot 4
- Download from godotengine.org (free)
- Godot 4.x supports GDScript, C#, and has built-in 2D tools

### 2. Project Structure
```
geode_inn/
├── project.godot
├── scenes/
│   ├── main_menu.tscn
│   ├── world_map.tscn
│   ├── geode_cave.tscn
│   ├── games/
│   │   ├── standing_stones.tscn      (Tetris - Stonehenge)
│   │   ├── tomb_tunnel.tscn          (Dig Dug - Egypt)
│   │   ├── andean_run.tscn           (Temple Run - Peru)
│   │   ├── monster_of_the_deep.tscn  (Water Monster - Loch Ness)
│   │   └── ...
│   └── fae_kingdom/
│       ├── threshold.tscn
│       ├── summerlands.tscn
│       └── ...
├── scripts/
│   ├── api_manager.gd                (Base44 API connection)
│   ├── game_manager.gd               (Progress tracking)
│   ├── stone_data.gd                 (Loaded from Base44)
│   ├── lore_data.gd                  (Loaded from Base44)
│   └── games/
│       ├── tetris.gd
│       ├── digdug.gd
│       └── ...
├── assets/
│   ├── sprites/
│   ├── audio/
│   └── ui/
└── addons/
    └── steam/                        (Godot Steam integration)
```

### 3. Steam Integration
- Use the **GodotSteam** addon (github.com/GodotSteam/GodotSteam)
- Enables Steam achievements, cloud saves, leaderboards, workshop
- Setup:
  1. Get Steam App ID from Steamworks
  2. Add GodotSteam addon to project
  3. Initialize Steam on game start
  4. Set up achievements (one per game completed, one per geode milestone)
  5. Cloud saves sync the geode cave across devices

### 4. Export for Steam
- Godot exports to Windows, Mac, and Linux natively
- Use Godot's export templates
- Package with Steamworks SDK
- Upload build via Steamworks dashboard

---

## What We Can Do Right Now

While the Godot games are being built (by you or a developer), I can:

1. **Set up the Base44 API** — create the PlayerProgress entity, ensure Stone and Lore data is accessible via API
2. **Build the web hub** — the Geode Inn app on Base44 serves as the home base, world map, archive, and market
3. **Create API documentation** — so any game developer can connect to the Base44 backend
4. **Generate concept art prompts** — for the chibi creatures, Fae Kingdom zones, and game backgrounds
5. **Build the fine art database** — for the Spiral Gallery
6. **Prepare the Steam store page assets** — description, screenshots, trailer script

The data foundation is already built. 164 stones, 207 countries of lore, 1,268 creatures, 78 water monsters. Any game developer who joins the project has a ready-made backend with real content.

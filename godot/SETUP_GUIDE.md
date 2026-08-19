## Geode Inn — Godot Project Setup Guide

### What This Is

This folder contains the starter Godot project for the Geode Inn game client. The Geode Inn uses a hybrid architecture:

- **Base44 web app** (already live) = the hub: world map, archive, market, geode cave
- **Godot game client** = the playable games: Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep
- They communicate via the Base44 REST API

### Files Included

```
godot_project/
├── scripts/
│   ├── APIManager.gd          ← Autoload: talks to Base44 database
│   ├── GameManager.gd          ← Autoload: tracks player progress, rewards
│   └── games/
│       └── StandingStones.gd   ← The Tetris game (Phase 1, Game 1)
```

### Setup Steps

1. **Download Godot 4.x** from godotengine.org (free, open-source)

2. **Create a new project** and copy these scripts into it

3. **Set up Autoloads** (Project > Project Settings > AutoLoad):
   - Add `APIManager.gd` as "APIManager"
   - Add `GameManager.gd` as "GameManager"

4. **Set up input actions** (Project > Project Settings > Input Map):
   - `ui_left`, `ui_right`, `ui_up`, `ui_down` (already exist by default)
   - `ui_accept` for hard drop (already exists by default)

5. **Create the Standing Stones scene**:
   - Create a Node2D root node named "StandingStones"
   - Attach `StandingStones.gd` as the script
   - Add a Node2D child named "GridContainer"
   - Add a CanvasLayer child named "UILayer"
   - Under UILayer, add:
     - Label named "ScoreLabel" (top-left)
     - Label named "RowsLabel" (top-left, below score)
     - Label named "LevelLabel" (top-left, below rows)
     - ColorRect named "NextPiecePreview" (top-right)
     - Control named "WinScreen" (hidden by default)
     - Control named "GameOverScreen" (hidden by default)

6. **Set the API token**:
   - Open `APIManager.gd` and replace `APP_ID` with the Geode Inn app ID
   - Set the auth token (for development, you can use the Base44 service token)
   - For production, generate tokens server-side using Steam IDs

### The Game Loop

```
Player launches game (via Steam or web hub)
       ↓
GameManager loads player progress from Base44 API
       ↓
Player selects Standing Stones (Tetris)
       ↓
Player clears 20 rows to "complete Stonehenge"
       ↓
GameManager.complete_game("standing_stones", score)
       ↓
  ├── Awards "Preseli Blue Stone" to player inventory
  ├── Unlocks "fae_kingdom_portal" area
  └── Saves to Base44 via APIManager
       ↓
Fae Kingdom portal ignites (cutscene / transition)
       ↓
Player returns to web hub — stone appears in geode cave
```

### Reward Stones Per Game

| Game | Reward Stone | Unlocks |
|------|-------------|---------|
| Standing Stones (Tetris) | Preseli Blue Stone | Fae Kingdom portal |
| Tomb Tunnel (Dig Dug) | Lapis Lazuli | — |
| Andean Run (Temple Run) | Blue Opal | — |
| Monster of the Deep | Freshwater Pearl | Water monster selection |

### Next Steps After This

1. Import the character art (from the catalog) as sprite assets
2. Add Stonehenge background art (ancient stone circle at dawn/dusk)
3. Add sound effects (stone placement, row clear, level up, win fanfare)
4. Add the Fae Kingdom portal cutscene on win
5. Build the next game: Tomb Tunnel (Dig Dug — Egypt theme)
6. Package with GodotSteam for Steam release

### Art Assets Needed

The character art catalog (`geode_inn_character_art_catalog.md`) contains 60+ generated images. For the Godot games, these need to be:
- Resized/cropped to game-appropriate sprite sizes
- Converted to PNG with transparency where needed
- Organized in `assets/sprites/` folders by game

For Standing Stones specifically:
- Stonehenge background (dawn/dusk aesthetic, warm amber light)
- Preseli Blue Stone crystal sprite (reward animation)
- Fae Kingdom portal sprite (igniting animation — blue-white energy)
- Block skins (7 colors matching the tetromino definitions)

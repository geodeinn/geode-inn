# 🏰 The Geode Inn

A hybrid digital archive, game hub, and artisan market. Built with Base44 (backend) + Godot (game engine), targeting Steam Early Access.

## Architecture

- **Base44 App** (ID: `6a60f218b0c6605c92fa35c4`) — Web hub: world map, archive, market, geode cave
- **Godot Game Client** — Playable arcade games connected to Base44 via REST API
- **Steam** — Distribution via GodotSteam addon

## Phase 1 Games

| Game | Inspiration | Theme | Status |
|------|------------|-------|--------|
| Standing Stones | Tetris | Stonehenge | ✅ Coded |
| Tomb Tunnel | Dig Dug | Egypt | ⬜ Planned |
| Andean Run | Temple Run | Peru | ⬜ Planned |
| Monster of the Deep | Nessie sim | Various lakes | ⬜ Planned |

## Structure

```
godot/
  scripts/
    APIManager.gd       — Base44 API connection (Autoload)
    GameManager.gd      — Player progress tracking (Autoload)
    games/
      StandingStones.gd — Tetris game (Phase 1)
docs/
  geode_inn_game_engine_roadmap.md
  geode_inn_music_direction.md
  geode_inn_gargoyle_designs.md
  geode_inn_character_art_catalog.md
  geode_inn_modern_legends.md
  geode_inn_project_bible.md
  geode_inn_worldbuilding_notes_aug2026.md
```

## Setup

See [godot/SETUP_GUIDE.md](godot/SETUP_GUIDE.md) for full Godot project setup instructions.

## License

Proprietary — © Krista / Soulstice Jewelry

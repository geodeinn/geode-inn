# Geode Inn — Godot Beta

## Project Structure

```
beta/
├── project.godot              # Godot project config (8 audio buses, 8 autoloads)
├── BETA_README.md             # This file
│
├── scripts/
│   ├── GameManager.gd         # Player state, game completion, stone rewards
│   ├── APIManager.gd          # Base44 API connection (sync/async)
│   ├── SaveManager.gd         # Offline-first save system (local JSON)
│   │
│   ├── systems/
│   │   ├── AudioManager.gd     # IEM Acoustic Architecture (492 lines)
│   │   ├── SteamManager.gd     # GodotSteam integration (166 lines)
│   │   ├── DialogueUI.gd       # In-game dialogue rendering (343 lines)
│   │   ├── DialogueManager.gd  # Dialogue data loading
│   │   ├── FizgigLoader.gd     # Asset/data loader
│   │   ├── WorldMap.gd         # 37 zone pins (232 lines)
│   │   ├── BeadComposer.gd     # Jewelry design tool (289 lines)
│   │   └── MainHub.gd          # Vertical descent hub (301 lines)
│   │
│   └── games/
│       ├── StandingStones.gd   # Tetris (Stonehenge) — unlocks Fae Kingdom
│       ├── TombTunnel.gd      # Dig Dug (Egypt) — Lapis Lazuli reward
│       ├── AndeanRun.gd       # Temple Run (Peru) — Blue Opal reward
│       ├── MonsterOfTheDeep.gd # Loch Ness sim — Freshwater Pearl reward
│       ├── HollowMen.gd       # Shadow Inn (T.S. Eliot) — Obsidian reward
│       ├── TumbleRun.gd       # Standalone arcade ($4.99) — Crystal Note
│       ├── Sandfall.gd        # O'Keeffe Egypt platformer — Desert Rose Selenite
│       ├── Resonance.gd       # Card game (stones as cards, 42/84/111Hz)
│       └── Knotwork.gd        # Dual-mode Celtic knotwork (game + design tool)
│
├── assets/
│   ├── audio/
│   │   ├── stone_chimes/      # 298 chimes (Mohs → frequency)
│   │   ├── system_tones/      # 14 tones (42Hz, 84Hz, 111Hz, Schumann, Solfeggio)
│   │   ├── zone_ambient/      # 20 zone drones
│   │   ├── game_audio/        # 6 stingers
│   │   └── music_room/        # 18 music assets
│   │
│   └── art/
│       ├── portraits/         # NPC portraits
│       ├── zones/             # Zone backgrounds
│       └── ui/                # UI elements
│
└── scenes/
    ├── MainHub.tscn           # Vertical descent hub
    ├── StandingStones.tscn
    ├── TombTunnel.tscn
    ├── AndeanRun.tscn
    ├── MonsterOfTheDeep.tscn
    ├── HollowMen.tscn
    ├── TumbleRun.tscn
    └── Sandfall.tscn
```

## Autoloads (Singletons)

| Name | Script | Purpose |
|------|--------|---------|
| GameManager | GameManager.gd | Player state, game completion tracking |
| APIManager | APIManager.gd | Base44 API connection |
| SaveManager | SaveManager.gd | Offline-first save system |
| AudioManager | systems/AudioManager.gd | IEM Acoustic Architecture |
| SteamManager | systems/SteamManager.gd | Steam achievements, leaderboards, cloud saves |
| DialogueManager | systems/DialogueManager.gd | Dialogue data loading |
| DialogueUI | systems/DialogueUI.gd | Dialogue rendering with typewriter effect |
| FizgigLoader | systems/FizgigLoader.gd | Asset/data loader |

## Audio Buses

| Bus | Purpose |
|-----|---------|
| Master | Overall mix |
| Music | Zone ambient, classical dub |
| SFX | Stone chimes, UI sounds |
| Voice | NPC dialogue |
| UI | Button clicks, portal sounds |
| System | 42Hz Song, 84Hz Shadow, 111Hz Gargoyle |
| MusicRoom | Fortepiano, geode cave, Nine Songs chord |
| Haptics | Controller/mobile vibration |

## Games (9 total)

| Game | Genre | Reward | Unlocks | Artist |
|------|-------|--------|---------|--------|
| Standing Stones | Tetris | Preseli Blue Stone | Fae Kingdom portal | Lee/Bauer |
| Tomb Tunnel | Dig Dug | Lapis Lazuli | — | O'Keeffe |
| Andean Run | Temple Run | Blue Opal | — | Guo Xi |
| Monster of the Deep | Loch Ness sim | Freshwater Pearl | Water monster select | Royo |
| Hollow Men | Shadow Inn | Obsidian | Shadow Inn | Gothic |
| Tumble Run | Arcade ($4.99) | Crystal Note | — | Van Gogh |
| Sandfall | Platformer | Desert Rose Selenite | Bone Room | O'Keeffe |
| Resonance | Card game | — | — | — |
| Knotwork | Puzzle/Design | — | — | Book of Kells |

## Audio Architecture (IEM-based)

The entire Inn IS a transducer:
- **Dynamic Drivers** = stones/matter (frequencies you feel)
- **Balanced Armature** = characters/voices (frequencies you hear)
- **Electrostatic** = cosmology (frequencies you sense)
- **Bone Conduction** = catacombs/42Hz Song (frequencies you know)

System constants:
- 42Hz = The Song (Living mode — growth)
- 84Hz = Shadow Inn (petrify — stay)
- 111Hz = Gargoyle watchers (awareness)
- 50 BPM = Canopy sway / game level tempo
- 7.83Hz = Schumann calibration

## Steam Integration

30 achievements defined (first_stone through sentinel_vigil_complete).
6 leaderboards (one per competitive game).
Cloud save/load stubs ready.
Rich presence support.
Controller haptics with mobile fallback.

## Narrative Voice

Rothfuss (precision) + Pratchett (warmth) + Gaiman (mythic weight)
+ Asimov (structural logic) + Bradbury (fire that doesn't burn)
+ Weir (engineer's optimism)

## Key Design Decisions

- Mona is a suggestion, not a character
- The Final Room book has no author — belongs to the Inn
- Elio is the Father/Builder of the nest
- Tri-mode audio: Living (42Hz), Shadow (84Hz), In-Between (hybrid)
- Whisper Layer: the Inn is an archive aware of the player
- Celtic knotwork gold-on-dark-stone as ambient texture
- Low-dub classical music at 50 BPM for game levels
- Loading screen: Tumble + brownies (NOT fizgigs in overalls)

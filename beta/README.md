# Geode Inn — Complete Story Beta

Single-player beta covering the full narrative arc from entry to the Final Room.

## Structure
```
beta/
  project.godot           # Godot 4.x project config
  scenes/                 # .tscn scene files (create in Godot editor)
  scripts/
    APIManager.gd         # Base44 backend communication
    GameManager.gd        # Player state tracking
    SaveManager.gd        # Offline-first JSON save system
    DialogueManager.gd    # Loads dialogue from JSON, manages trees
    CutscenePlayer.gd      # Pre-rendered cutscene playback
    FizgigLoader.gd       # Universal loading screen system
    CommonRoomHub.gd      # Main hub navigation
    WorldMap.gd           # 37-zone world map with animated intros
    EndgameChoice.gd      # STAY/LEAVE/HIDE branching
    FinalRoom.gd          # The true ending
    games/
      StandingStones.gd   # Tetris/Stonehenge (existing)
      HollowMen.gd        # 5-level narrative platformer
  data/
    dialogue.json         # NPC dialogue entries (12 of 35 loaded)
  assets/
    cutscenes/            # Pre-rendered .ogv files (prompt-coded)
    loading/              # Fizgig loading screen animations
    music/                # Low-dub classical at 50 BPM
    sfx/                  # Crystal chimes, coconut shells, etc.
    art/
      zones/              # 271 existing zone/character images
      characters/
      ui/
```

## Phase 1 Status
- [x] Save system (offline-first JSON)
- [x] Dialogue system (JSON-loaded, flag-conditional)
- [x] Cutscene player (pre-rendered video + subtitles)
- [x] Fizgig loader (23 zone-specific scenarios + Whisper Layer trigger)
- [x] Common Room hub script (navigation + NPC interaction)
- [x] World map script (37 zones, animated intros, game launching)
- [x] Hollow Men mines (5 T.S. Eliot levels, no fizgigs, silence)
- [x] Endgame choice (STAY/LEAVE/HIDE)
- [x] Final Room (fire, chair, cup, book, the Reader's last line)
- [x] APIManager + GameManager (existing, copied)
- [x] Standing Stones game (existing, copied)
- [x] Dialogue JSON (first 12 of 35 entries)
- [ ] Godot scene files (.tscn) — needs Godot editor
- [ ] Pre-rendered cutscene videos — needs prompt-coded animation
- [ ] Art assets imported into Godot
- [ ] Music tracks
- [ ] Sound effects
- [ ] Remaining 9 arcade games
- [ ] Full 35-entry dialogue JSON

## How to Run
1. Open `beta/project.godot` in Godot 4.x editor
2. Create .tscn scene files for each script (Common Room, World Map, games)
3. Import art assets into `assets/art/`
4. Generate cutscene videos using prompt-coded animation pipeline
5. Place .ogv files in `assets/cutscenes/`
6. Run from Main Menu scene

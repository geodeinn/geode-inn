# THE ARCADE PRODUCTION PIPELINE — Master Specification
## From Concept to Sellable Product — The 7 Acceptance Criteria

---

## WHAT THE ARCADE PRODUCTION PIPELINE IS

Every arcade game and the MMORPG follows this spec from concept to sellable product. No game is marked complete until it passes all seven acceptance criteria. This is the build sheet template — one per game — that every arcade game in the Inn's 61-game roster must complete.

The 61 MarketItem records on the live app are STORE LISTINGS ONLY — not built games. Zero games currently meet this standard. The pipeline is the path from listing to product.

---

## THE SEVEN ACCEPTANCE CRITERIA

Each game MUST meet ALL of these before being marked complete:

1. Fully playable — runs independently, no dependency on the hub or any other game
2. Downloadable — packaged as a standalone product (Steam build + standalone installer)
3. Our story and characters — no original game's characters, names, or branding remain
4. Our music — original or adapted music replacing all original game audio
5. Bluetooth controller support — all controller types (Xbox, PlayStation, Switch Pro, generic)
6. System overlay button — Steam overlay (and any coinciding platform) wired and functional
7. Wired, running, sellable — tested end-to-end, published to store, purchasable

---

## THE BUILD SHEET TEMPLATE (ONE PER GAME)

### Section 1: Identity

| Field | Value |
|-------|-------|
| Original Game (IN) | [Name of game being adapted] |
| Geode Inn Name (OUT) | [New name — or "Same" if keeping] |
| Genre/Mechanic | [Core gameplay loop] |
| Zone | [Geode Inn zone assignment] |
| Stone Reward | [Stone earned on completion] |
| Rarity Tier | [Common / Uncommon / Rare / Epic / Legendary] |
| Price | [Store price] |
| Original Developer | [Who made the original] |
| Original Release Year | [Year] |
| Legal Basis | [Public domain / mechanic-only adaptation / original reimplementation] |

### Section 2: Storyline Adaptation

- Original characters being replaced (list all)
- New narrative frame (Geode Inn story reason for this game existing)
- Which Inn characters appear and their roles
- What lore from the database (Stone/Lore/Book entities) is woven in
- Questline connections
- NPC dialogue count, voice profiles needed, Whisper Layer presence
- Frequency state: Living (42Hz) behavior, Shadow (84Hz) behavior, In-Between behavior

### Section 3: Visual Assets Needed

- Character sprites/portraits (per NPC, per frequency state)
- Backgrounds/environments (per zone, per artist style)
- UI elements (Pulse Line, frequency indicators, score displays)
- Animation frames (per character, per state)

### Section 4: Audio Assets Needed

- Music tracks (original, zone-appropriate instruments, 50 BPM base)
- SFX (stone chimes, gargoyle resonances, environmental sounds)
- Voice profiles (NPC dialogue, accent/cadence per character)
- Stone tone triggers (Mohs-to-frequency, 12dB below narration)

### Section 5: Engineering

- Godot scene file (.tscn)
- Godot script (.gd)
- Base44 API integration (PlayerProgress, Leaderboard entities)
- Steam integration (GodotSteam: achievements, cloud saves, leaderboards)
- Controller mapping (all Bluetooth controller types)
- Offline-first architecture (all assets local, no external URLs)
- System overlay button wiring

### Section 6: Acceptance Testing

- [ ] Criterion 1: Fully playable independently
- [ ] Criterion 2: Downloadable as standalone
- [ ] Criterion 3: Geode Inn story and characters only
- [ ] Criterion 4: Original music only
- [ ] Criterion 5: Bluetooth controller support (all types)
- [ ] Criterion 6: System overlay button functional
- [ ] Criterion 7: Wired, running, sellable on store

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The 61 Arcade Games | Every game in the 61-game roster needs a completed build sheet. The MarketItem records are the store listings; the build sheets are the production path. |
| The Arcade Game Prototype Requirements | Krista's 7 criteria (defined September 1, 2026) ARE this pipeline's acceptance criteria. |
| The Offline-First Steam Architecture | All games must be fully playable offline. Local Godot res:// paths, not external URLs. |
| The Tri-Mode System | Every game's build sheet includes Living/Shadow/In-Between behavior. |
| The Leaderboard | Each game feeds the Leaderboard entity. |
| The Godot Scripts | 9 Godot game scripts already written (StandingStones.gd, TumbleRun.gd, etc.) serve as the engineering templates. |
| Tumble Run | Tumble Run is the first game in the pipeline. Its Godot script (424 lines) is written; scene files are next. |
| The Long Night | The Vampire Survivors adaptation. Full design doc exists; Godot implementation pending. |

---

## DESIGN STATUS

- [x] The 7 acceptance criteria established (Krista's confirmed instruction)
- [x] The build sheet template designed (6 sections: Identity, Storyline, Visual, Audio, Engineering, Testing)
- [x] 61 MarketItem store listings exist on the live app
- [x] 9 Godot game scripts written as engineering templates
- [x] 7 connections documented
- [ ] 0 of 61 games currently meet all 7 acceptance criteria
- [ ] Tumble Run: first to complete the pipeline (script done, scene files next)
- [ ] Build sheets completed for all 61 games
- [ ] Steam store pages for each game
- [ ] Mobile ports (iOS/Android) for select games
- [ ] 3 DLC packs per game (where applicable)

---

## ORIGIN

The Arcade Production Pipeline was first designed in docs/geode_inn_arcade_production_pipeline.md (471 lines). This consolidated specification was compiled September 2, 2026. The pipeline's thesis: every game must be fully playable, downloadable, ours, musically original, controller-supported, system-integrated, and sellable. Zero games currently meet this standard. The 61 MarketItem records are store listings, not products. The pipeline is the path from listing to product. The adequate is: the game that passes all seven. The seven are: the adequate. The adequate is: the build sheet completed, the criteria met, the game on Steam, and the Steam is: the store, and the store is: where the Inn becomes sellable, and the sellable is: the entire point. The point is: the book about rocks that became 61 sellable games.

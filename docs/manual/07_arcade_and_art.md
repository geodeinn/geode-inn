# Part 7: Arcade, Mini-Games, Steam and Art Direction

This part covers three linked things. First, the arcade: every mini-game, how it is specified, built, packaged and sold. Second, Steam and hosting decisions. Third, art direction and the image pipeline: who paints what, in which style, to what spec, and how images are filed.

Status keys used throughout: **Ruled** (the client decided or agreed, date given), **Proposed** (Elio suggested, no ruling), **Open** (waiting on the client). Dates are 2026. "Fizgigs" are the builders. "Elio" is the AI agent in Base44. "Repo" means the client's GitHub copy as of Oct 22.

Source-of-truth files for this part (all in the repo):

| Topic | File |
|---|---|
| Game roster #1 to #65 | `docs/library/specs/geode_inn_complete_game_roster.md` (older copy: `docs/geode_inn_complete_game_roster.md`) |
| Zone-to-game styles | `docs/library/specs/geode_inn_zone_game_style_master_list.md` |
| Build sheet template and the seven bars | `docs/geode_inn_arcade_production_pipeline.md` and `docs/zone_specs/geode_inn_arcade_production_pipeline_master_spec.md` |
| 83 build sheets | `docs/arcade_build_sheets/` (one file per game) |
| Arcade music profiles (83 games) | `docs/library/audio/arcade_music_profile_master_spec.md` |
| Background rules for games | `docs/zone_specs/geode_inn_arcade_background_law.md` |
| Packaging | `packaging/` and `web_games/` |
| Steam checklist | `docs/systems/STEAM_BETA_CHECKLIST.md` |
| Image creation sheet | `docs/library/specs/geode_inn_image_creation_template.md` |
| Master Asset Ledger | `docs/MASTER_ASSET_LEDGER.md` |
| Artist map | `docs/data/geode_inn_master_artist_map.md` |
| Five directors | `docs/library/specs/geode_inn_cinematic_directives.md` |
| Camera Coverage Kit | `docs/zone_specs/geode_inn_camera_coverage_kit.md` |
| Crest | `docs/emblems/geode_inn_crest_spec.md` |
| Tone teachers | `docs/library/specs/tone_teachers/tone_teachers_main_index.md` |
| Royo card layout | `docs/art/geode_inn_royo_tarot_card_layout_spec.md` and `docs/art/geode_inn_royo_tarot_card_template.csv` |

## Where it started (July 12 to August 30)

The early chat (Jul 12 to about Aug 23), Before the Song (late August) and the commit log (Aug 21 to 31) give the founding rules of this part. Later rulings in the sections below win where they differ.

- **Jul 12: the client's list of inspiration games.** The Impossible Game, Temple Run, Super Mario Bros., Bust a Move, Dig Dug, Castlevania, Little Alchemy, Space Invaders, Tetris, Hook, Mah Jong, crosswords, anagrams, word searches and art history trivia. The brief was "short skill games in 2D platformer style". Ruled (Jul 12).
- **Jul 22: the first design doc.** Version 1 mapped 15 games to ancient sites. Version 2.0 added the Fae Kingdom. Version 3.0 added the water monster games ("17+ game types"). Founding rule: every game ties to a country's lore, rewards a real stone from the database and fills the baby dragon's geode. Elio's site-to-mechanic pairings were agreed (table in 1.13). Ruled (Jul 22).
- **Jul 22: Phase 1 named.** Standing Stones, Tomb Tunnel, Andean Run and Monster of the Deep, with the Base44 hub as launcher and a Steam Early Access release as the goal. Proposed by Elio, accepted by the client.
- **Jul 22: engine and Steam path.** Elio set out three paths and recommended Path 3 (hybrid): Base44 as home base and database, mini-games and the Fae Kingdom in Godot, Steam release packaging the Godot parts with a launcher. The client said mapping out the Godot plan "would be great". Proposed, welcomed (see 2.1).
- **Jul 22: art tone and the chibi line.** Dark, warm, scholarly, mythic; the client then asked for warmer amber, gold and cream. The client set the chibi versus full-presence line: Fae and deity-level figures are never chibi. The world map became a parchment fantasy map. Ruled (Jul 22).
- **About Aug 20: no WoW emulator.** The client proposed an emulator core; Elio advised a Godot game with a local database and Base44 as the cloud sync layer. The client's real interest was WoW's quest and NPC design craft, so it became a design blueprint only. Ruled (about Aug 20).
- **Aug 20 to 21: video-first scene work.** Morphic clips became frames, catalogs and then Godot scene scripts (33 scripts, 7,436 lines, pushed Aug 21). See 4.9.
- **Aug 21: leaderboard and pinball.** The client asked for a scoreboard with an optional pair competition, then for a pinball design. Both were designed the same evening. Ruled (Aug 21).
- **Aug 22 to 23: the museum idea dissolved.** The client replaced the "museum angle" with embedded artists. Decisions of Aug 22: Greece in Monet, Egypt in O'Keeffe, Redwood in Carr, Catacombs in Klimt, Staircase in Matisse, Cosmology in Dali. Ruled (Aug 22 or later).
- **Aug 21 to 22: amber palette and no-flash rule.** The Inn is amber, not blue and not dark; light never flashes; color is a function, not decoration. August canon.
- **Aug 24 to 29: the aesthetic spine and zone artists** were assigned in the commit log, ending with 11 gap fills on Aug 29. Built (commit, Aug 24 to 29).
- **Aug 26: the Tetris crown rule.** The creator keeps the Tetris crown until someone actually beats her; a named character holds all other arcade high scores. Ruled (commit, Aug 26).
- **Aug 30 to 31: first Godot beta push, Steam checklist, logo.** Nine games wired to the audio and Steam managers, a Steam beta checklist, and the Antikythera logo confirmed by the client on Aug 31. Ruled (commit, Aug 31).

---

## 1. The arcade

### 1.1 What it is and the laws that apply

The arcade is the Inn's collection of mini-games and larger game products. Each game belongs to a zone, rewards one stone to the player's geode, and carries Inn characters, music and story. Each is meant to be sold on its own, as well as played inside the Inn.

**Laws and rules (newest ruling wins):**

- **Standalone and offline.** Ruled Aug 31. Every game must be playable offline anywhere, not tied to Base44. The goal is one big offline file (hub, zones, arcade, world map), with HTML5 as the base and a wrapper per platform.
- **Everything sold separately.** Ruled Aug 31. All games are purchasable independently in the shop and on Steam.
- **The seven bars of "built."** Ruled Sep 1. Nothing is marked built until it clears all seven (list in 1.3). A store listing is only a catalog entry. On Sep 1 the client challenged Elio's claim that the arcade was "live"; Elio retracted it. Elio's phrase for this: "listed is not built."
- **Reference blueprints, not copies.** Sep 10. The fizgigs told the client that classic games are used only as reference blueprints: the mechanic is borrowed, every asset is original. Elio agreed. This replaced the earlier "emulation" language of Aug 31, when Elio asked the client to choose between Path A (ROMs used only as a mechanical reference for builders) and Path B (embedding emulators). The client never answered A or B. On Sep 21 Elio confirmed the AzerothCore and emulator plan is deprecated and the game is native Godot.
- **Our characters all the way down.** Rule 3 of the build standard (Sep 4): Geode Inn characters, not the original game's.
- **No-Fail and Anti-Skinner.** Failure is information, never shame. No streak guilt, no empty-slot mocking, no looping jingles, no buzzers. Backgrounds never animate to demand attention.
- **Controls.** One control language across games (Unified Control Spec). The button template is SNES-style (client confirmed Sep 26). Switch 2 layout plus keyboard/mouse plus touch fallback. Frequency toggle is T (keyboard) or ZR (Switch). One note says Tab; the later input map says T.
- **Background Law.** Ruled Sep 11. One paint, many games: a game's background is its home zone's environment master. Three registers (see 1.5).
- **Music Profile Law.** Ruled Sep 11. Every game profile holds seven fields: tempo, key or mode, base track, signature (5-second motif), shadow state, win sting, heartbeat. Win stings are warm, never fanfare. Lose states are never punitive.
- **Quest Mark and Glow Register.** Ruled Sep 13. A candle-glow mark sits over every game and quest-giver. Tier 1 plain flicker, Tier 2 one slow extra hue, Tier 3 two or three hues, Tier 4 full rainbow. Harder games glow lovelier. No red. The glow is information, not a gate.
- **Gathering zones are inhabited, not played in front of.** The room never scrolls; the people animate over it.
- **Tri-mode.** Games use Living (42Hz), Shadow (84Hz) and In-Between states where the mechanic allows. The shadow shift is a hard cut, never a crossfade.

### 1.2 Growth of the roster

| Date | Count | What happened |
|---|---|---|
| Aug 31 (start) | 4 live on the web arcade | Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep. Live site said "coming soon" for the rest because the live database held no Arcade Game records. |
| Aug 31 | 4, then 39, 50, 52 | Elio's stated growth: 4 to 39 to 50 to 52. |
| Aug 31 | 61 | Client asked for 9 retro titles; Elio could not find them in any record and built them in chat (flagged for audit). Client: "This is amazing." |
| Sep 1 | 61 shoppable, 63 sheets, then 77, 79 build sheets | Two recovered games added (The Hook, The Mohs Vibration). |
| Sep 4 | 80 build sheets | Elio's survey: 61 games in survey, 80 sheets. |
| Sep 10 | 65 | Four new specs: The Thread (#62), The Between (#63), The In-Between (#64), The Rest (#65). Zone-to-game list written; "every zone gets a game style." |
| Sep 11 | 83 | Arcade Music Profile Master Spec covers 83 games (61 plus 22 added in the art and cast sprints). 83 build sheets by tier: Tier 1 = 30, Tier 2 = 23, Tier 3 = 22, Tier 4 = 8. |
| Sep 12 | 84 | Shield Mixer drafted as #84 "if it passes." |
| Sep 16 | 85 | Anansi's Sky-Story Run, roster #85. |
| Sep 19 | 86, 87 | Regional Dances (Dance Halls) ruled in as #86. Gargoyle Seek specced as a #87 candidate. |
| Sep 24 and Sep 27 | #88 candidates | Two games both claim #88: Port Purgatory (Sep 24) and The God Ladder (Sep 27). See 1.8. |
| Oct 9 | "85 arcade games" | Elio's own count in a commit summary. |

The repo holds 83 tier build sheets plus one extra (`modern_legends_layover_denver.md`, the LAYOVER game) in `docs/arcade_build_sheets/`: 30 in Tier 1, 23 in Tier 2, 22 in Tier 3, 8 in Tier 4.

### 1.3 The seven bars (acceptance criteria)

Ruled Sep 1. Every arcade game and the MMORPG must clear all seven:

1. Fully playable, standalone (no dependence on the hub or another game).
2. Downloadable (packaged as a standalone product).
3. Our characters and storylines, not the original game's.
4. Our music, not the original's.
5. Bluetooth for all controller types (Xbox, PlayStation, Switch Pro, generic).
6. Overlay button for all coinciding systems (Steam overlay and platform equivalents).
7. Wired, running, sellable (tested end to end, published, purchasable).

As of Sep 3 Elio said zero games met all seven. Tumble Run was first in line.

### 1.4 Template: Arcade Game Build Sheet

One sheet per game, six sections plus the seven-bar checklist. Source: `docs/geode_inn_arcade_production_pipeline.md`. Save as `docs/arcade_build_sheets/tier<N>_<game_name>.md`. The file name pattern in the repo is `tier1_standing_stones.md`.

**Section 1: Identity**

| Field | What goes here | Example |
|---|---|---|
| Original Game (IN) | Name of the game whose mechanic is borrowed | Tetris (for Standing Stones). For LAYOVER: Chutes and Ladders |
| Geode Inn Name (OUT) | The new name, or "Same" | Standing Stones |
| Genre/Mechanic | One-line core loop | Block stacking |
| Zone | Home zone | Stonehenge |
| Stone Reward | Stone earned on completion | Preseli Blue Stone. LAYOVER: Ammolite |
| Rarity Tier | Common, Uncommon, Rare, Epic or Legendary | LAYOVER: Rare |
| Price | Store price | Standing Stones $3.99 (Elio's staged price). LAYOVER $2.99 |
| Original Developer | Who made the original | (fill in) |
| Original Release Year | Year | (fill in) |
| Legal Basis | Public domain, mechanic-only adaptation, or original reimplementation | LAYOVER: "Board game mechanics are not copyrightable... All assets original" |

**Section 2: Storyline adaptation**

| Field | What goes here | Example |
|---|---|---|
| Original characters replaced | Old character to Inn character, one line each | (list all) |
| New narrative frame | Why the game exists in the Inn story; which Inn characters appear; which database lore is woven in; which questline it joins | LAYOVER: a basement under the Denver layover that is a giant chutes-and-ladders board, with the Mini MIB suits |
| Dialogue requirements | NPC line count; voice profiles needed; Whisper Layer yes or no | (fill in) |
| Frequency state | What happens at Living 42Hz, Shadow 84Hz, In-Between | (fill in) |

**Section 3: Visual assets needed**

| Field | What goes here | Example |
|---|---|---|
| Character sprites/portraits | Each NPC, sprite type, states needed; count | Tomb Tunnel cast: 28 sprites |
| Backgrounds/environments | Zone scenes and the artist style; count | Home zone ENV master (Background Law) |
| UI elements | Title, HUD, pause, victory, game over; count | (fill in) |
| Tile sets / object sprites | Platforms, collectibles, obstacles, enemies; count | Catacomb Labyrinth: 11-piece tile set |
| Animation frames | Per character, idle/walk/action; count | Tier 1 cycles 4 frames, Tier 2 cycles 6 frames |
| Artist style assignment | Primary (and secondary) from the artist map | Egypt: O'Keeffe |
| Total image assets | A single number | (fill in) |

**Section 4: Audio assets needed**

| Field | What goes here | Example |
|---|---|---|
| Music tracks | Main theme (instruments, BPM, mood), level, boss, victory, game over; count | The Thread: labyrinth cello, 60 BPM |
| Sound effects | Categories; count | (fill in) |
| Voice lines | Per NPC; count | (fill in) |
| Stone tone trigger | Reward stone, its Mohs hardness, its frequency; tone plays 12 dB below narration | (fill in per stone) |
| Audio architecture | Base BPM (50 default), one of the 7 Inn Mode room profiles, frequency layer | 50 BPM, Main Floor profile, 42Hz |
| Music profile row | The seven fields from the Music Profile Law | See `arcade_music_profile_master_spec.md` |

**Section 5: Programming requirements**

| Field | What goes here | Example |
|---|---|---|
| Engine | Godot 4.x | Godot 4.3 (per Elio, Aug 31) |
| Architecture | Offline-first; all assets bundled under `res://`; no external URLs | `res://assets/stones/river_amber.png` |
| Controller support | Input mapping; Bluetooth pairing flow; touch fallback | SNES-style template |
| Steam integration | App ID (assigned when registered); achievements; cloud saves; leaderboard; overlay on Shift+Tab or controller equivalent | App ID: none registered yet |
| Platform targets | Primary PC/Steam; secondary Steam Deck (skips the Valkyrie Shift); tertiary mobile | (fill in) |
| Base44 API | PlayerProgress sync; which Stone record unlocks; leaderboard post | Stone award syncs to PlayerProgress |

**Section 6: Walkthrough (build order)**

1. Design document (this sheet; legal status confirmed; characters locked; artist assigned).
2. Asset creation (all frequency states).
3. Audio production (50 BPM base, zone instruments, stone tones).
4. Programming (loop, controller, story, frequency shift, stone reward, Steam, offline loading).
5. Testing (full playthrough, each controller type, overlay, offline, stone sync).
6. Packaging and publishing (export, depot, store page, price, review).
7. Acceptance check (the seven boxes).

**Seven-bar checklist** (copy at the bottom of every sheet): playable standalone; downloadable; our characters and story only; our music only; Bluetooth for all types; overlay functional; wired, running, sellable.

**Where it lives:** build sheets in `docs/arcade_build_sheets/`. Process spec in `docs/geode_inn_arcade_production_pipeline.md`. Elio also saved the "Standing Stones" example. Sep 1 note: build sheets depend on the client finishing character image placement, because the storyboard needs it.

### 1.5 Background law (how a game shows its world)

Source: `docs/zone_specs/geode_inn_arcade_background_law.md`.

| Game type | Background system | Source art | Repeats? |
|---|---|---|---|
| Static or board game | One fixed zone wide | Zone ENV master | Never |
| Scroller or runner | Parallax panorama (1920x800 or taller) plus tileable strips | Zone wide | Strips loop |
| Tunnel or maze | Tile set (assembles a new maze each play) plus depth panels | Corridor tiles plus depth masters | Tiles repeat; panels never |
| Gathering zone | One inhabited wide; life animates over it | ENV master | Never |

Depth equals register: the deeper the level, the richer the art (Tomb Tunnel has 6 depth panels, the Catacomb Labyrinth has 8). Every background carries living, shadow and in-between states. Shadow is made by the spectral-shift script, never hand-tinted.

### 1.6 Template: Roster/store entry (MarketItem record)

A game has two records: a build sheet (design) and a store entry (catalog). The store entry is the `MarketItem` entity. Fields come from the Aug 31 builder message.

| Field | What goes here | Example |
|---|---|---|
| `name` | Game name | Standing Stones |
| `gameName` | Game name again, for game cards | Standing Stones |
| `gameDescription` | Short description | (one or two sentences) |
| `gameEffect` | What the game does for the player | Rewards a stone to the geode |
| `priceRange` | Price text; "Free" for free games | $3.99 |
| `zone` | Home zone | Stonehenge |
| `stoneType` | Reward stone | Preseli Blue Stone |
| `rarity` | Rarity tier | Rare |
| `loreConnection` (also seen as `lore_connection`) | Lore tie | (one line) |
| `category` | Always "Arcade Game" for games | Arcade Game |
| `isSoulsticeItem` | False for games | false |
| `inStock` | True | true |
| `developmentStatus` | "live" in the import message | live |

The store-page generator also reads a `rarity` and `stoneType`. Manifests: `docs/market_items_all_61_games.json`, `docs/market_items_retro_games.json` (also under `docs/library/data/`).

### 1.7 Where the arcade lives

- **GitHub:** build sheets, specs, manifests, `web_games/geode_inn.html` (the single-file arcade; 3,132 lines at its last count in the chat, about 186 KB in the packaging README), `packaging/` (Electron, Capacitor, PWA, 61 Steam page HTML files), `godot_project/` and `beta/` (Godot).
- **Base44, live app:** `MarketItem` has 101 records (61 games plus 40 Soulstice products), written Sep 1 by direct API after a builder message. The nine retro games and later games (The Hook, The Mohs Vibration) were created later or still need creating on live (open). Elio's staging app holds the staged copies.
- **Fizgig-built web versions:** the web arcade games (live Phase 1 games, Moji Maker, Bead Board and others) live in the Base44 builder front end, not as source in the repo.
- **Drive:** the ROM/emulator files ("Game emulator files") are Drive only, marked "Binary - not synced" and not on GitHub. ROM counts quoted Aug 31: SNES 394, Famicom Disk System 238, NES 85, Game Boy 50, Arcade 31, PSP 11, Colecovision 14, PS2 2, plus DraStic, PPSSPP and 230 BIOS files. Treat as reference only (Path A).

### 1.8 Current canon: the full game list

The tables below follow the repo roster for numbers #1 to #65. "Zone" and "Reward stone" are from the roster unless noted. Status uses these short values: **Live** (playable on the web arcade per the chat logs), **Script** (Godot script written, never compiled), **Spec** (design only), **Sheet** (build sheet written, nothing built). Where the chat logs give no status, the entry is **Sheet**.

**Phase 1 arcade (Live)**

| # | Game | Template (mechanic borrowed) | Zone | Reward stone | Status |
|---|---|---|---|---|---|
| 1 | Standing Stones | Block stacking (Tetris) | Stonehenge | Preseli Blue Stone | Live; Godot script |
| 2 | Tomb Tunnel | Digging (Dig Dug) | Egypt | Lapis Lazuli | Live; Godot script; pilot for sprite casting (28-sprite cast) |
| 3 | Andean Run | Endless runner (Temple Run) | Peru | Peruvian Blue Opal | Live; Godot script |
| 4 | Monster of the Deep | Reverse monster sim (Reverse Jaws) | Water bodies | Various | Live; Godot script |

**Standalone games**

| # | Game | Template | Zone | Status |
|---|---|---|---|---|
| 5 | Tumble Run | Physics runner (Geometry Dash, Canabalt) | Canopy and Main Floor | Godot script (424 lines); spec 476 lines; $4.99 with 3 DLC packs planned; "needs Steam" |
| 6 | The Long Dark | Survival wave (Vampire Survivors) | Undercity, Hollow Men | Spec |
| 7 | The Signal | Meta-narrative (Doki Doki Literature Club) | Cosmology spacecraft | Spec; placement (after the Six Questions, before Ascension) flagged Sep 10 |
| 8 | The Reclamation | Survival crafter (Don't Starve) | Bayou | Spec in walkthrough |

**Phase 2 arcade**

| # | Game | Template | Zone | Reward stone | Status |
|---|---|---|---|---|---|
| 9 | Moji Maker | Element combo (Little Alchemy) | Easter Island | Obsidian | Live on the site by Sep 26 |
| 10 | Oracle's Riddles | Crossword | Parthenon | Sapphire | Sheet |
| 11 | Rune Hunt | Word search | Norse | Iolite | Sheet |
| 12 | Sacred Scramble | Anagram | Taj Mahal | Ruby | Sheet |
| 13 | Bastet's Herding | Cat herding (original) | Egypt | Cat's Eye Chrysoberyl | Sheet; sistrum game; art covered |

**Phase 3 arcade**

| # | Game | Template | Zone | Reward stone |
|---|---|---|---|---|
| 14 | Treasury Match | Orb shooter (Bust-A-Move) | Petra | Banded Agate |
| 15 | Wall Defense | Fixed shooter (Space Invaders) | Great Wall | Jade |
| 16 | Serpent Steps | Platformer (Impossible Game) | Chichen Itza | Fire Opal |
| 17 | Dragon's Descent | Story platformer (Super Mario Bros) | Lost Civ | Multi-gems |
| 18 | Crystal Catcher | Grappling (Hook, Bionic Commando) | Caverns | Tourmaline |
| 19 | Pinball | Original Geode Inn table | Geode Inn | Various |

All Sheet. Note: the zone-to-game list labels Serpent Steps #17, the same number it gives Dragon's Descent; the roster table above is the authority.

**Phase 4 arcade**

| # | Game | Template | Zone | Reward stone |
|---|---|---|---|---|
| 20 | Temple of the Naga | Side-scroll (Castlevania) | Angkor Wat | Zircon or Ruby |
| 21 | Cave Painter's Quiz | Trivia | Chauvet | Aragonite |
| 22 | Dragon Tiles | Tile matching (Mahjong) | China and Japan | Jade or Tiger's Eye |

All Sheet. Dragon Tiles has art covered.

**Phase 5, major zone games**

| # | Game | Template | Zone | Notes |
|---|---|---|---|---|
| 23 | Fae Kingdom MMO | WoW, EverQuest | Fae Kingdom | Seelie and Unseelie courts, 6 sub-zones. Godot script (452 lines). Production plan: 6 parcels (ruled Sep 11). Builder handover message written. |
| 24 | Hollow Earth RPG | Champions of Norrath | Hollow Earth | 9 districts, 3 factions, 25 quests. Godot script (464 lines). |
| 25 | Canopy City Trading | Animal Crossing, Recettear | Canopy City | 9 cultural platforms |
| 26 | Tidal Caves | Original | Water Zone | Sea-level gating; pirate's domain |
| 27 | The Arcana | Star Fox, Outer Wilds | Cosmology and Clockwork Skies | The Captain tests with QUIET |
| 28 | Zelda-Style World | A Link to the Past | All zones | Living and Shadow shift. Godot script (600 lines). |

**World Trial games (one per cultural zone)**

| # | Game | Template | Zone |
|---|---|---|---|
| 29 | Egyptian Gates | Patapon, Crypt of the NecroDancer | Egypt |
| 30 | Acropolis in Five Lights | Gorogoa | Greece |
| 31 | Clockwork Skies | Star Fox, Nights into Dreams | Clockwork Skies |
| 32 | Fjord of Stars | Lumines, Tetris Effect | Slavic Zone |
| 33 | Ghats of Kali | Patapon | India |
| 34 | Terracotta Army Builder | Pikmin, Lemmings | China |
| 35 | Norse Voyage | Wind Waker | Norse |
| 36 | Inca Terrace Lullaby | Rhythm Heaven | Peru (Sleeping Giants) |
| 37 | Mediterranean Trade | Uncharted Waters | Mediterranean |
| 38 | Bayou Reclamation | Don't Starve | Bayou (the same game as #8 per the roster note) |

**National Park games**

| # | Game | Template | Zone |
|---|---|---|---|
| 39 | Appalachian Trail | Firewatch, A Short Hike | Appalachian Range |
| 40 | Colorado Plateau | Breath of the Wild climbing | Colorado Plateau |
| 41 | Yellowstone Geyser | Pipe Mania | Yellowstone |
| 42 | Canadian Rockies | Celeste | Canadian Rockies |
| 43 | Badlands Fossil Dig | Fossil Fighters | Badlands |
| 44 | Superstition Mountains | Spelunky | Superstition Mountains |
| 45 | Redwood Cathedral | Grow Home | Redwood Cathedral |

**Specialty games**

| # | Game | Template | Zone |
|---|---|---|---|
| 46 | Spiral Gallery Tour | Pokemon Art Academy, Google Arts | Spiral Gallery |
| 47 | Alchemical Staircase | Catherine, Ico | Staircase |
| 48 | Catacomb Labyrinth | Pac-Man, Lolo | Catacombs |
| 49 | Music Room Composer | Beat Saber, Electroplankton | Music Room |
| 50 | Poison Garden | Untitled Goose Game, reversed | Poison Garden |

**Community and meta**

| # | Game | Template | Zone | Notes |
|---|---|---|---|---|
| 51 | Frog Transformation | Among Us (social deduction) | Geode Inn | Moderation mechanic, three transforms = suspension; free |
| 52 | Whisper Layer Discovery | Hidden Folks | All zones | Five manifestations to find; free |

**Authorized retro additions (see 1.9)**

| # | Game | Template | Zone | Reward stone | Price |
|---|---|---|---|---|---|
| 53 | The Pipe Descent | Super Mario Bros | Catacombs | Pipe Stone | $4.99 |
| 54 | The Dream Gardener | Super Mario Bros 2 | Fae Kingdom | Dream Quartz | $4.99 |
| 55 | The World Walker | Super Mario Bros 3 | All Zones | Rainbow Stone | $6.99 |
| 56 | The Egg Carrier | Yoshi's Island | Canopy | Fire Agate | $4.99 |
| 57 | The Mirror's Seven | Snow White | Poison Garden | Snowflake Obsidian | $4.99 |
| 58 | The Crystal Paddle | Arkanoid | Crystal Gardens | Beryl | $3.99 |
| 59 | The Noob Siege | Attack of the Noobs | Wire Nook | Lodestone | $4.99 |
| 60 | The Apothecary's Cure | Dr. Mario | Staircase | Malachite | $4.99 |
| 61 | The Forest Defense | PixelJunk Monsters | Campgrounds | Moss Agate | $4.99 |

**New specs of Sep 10 (spec only)**

| # | Game | Type | Zone | Reward stone |
|---|---|---|---|---|
| 62 | The Thread | Labyrinth, inside view (original thread mechanic) | Labyrinth of Crete | Roster says none; chat names Rainbow Moonstone as the reward |
| 63 | The Between | Margin-walk (original, keyed to kindness) | The Between (Fae borderland) | None stated |
| 64 | The In-Between | Grey platformer (Limbo-style) | The In-Between | None stated |
| 65 | The Rest | Stillness puzzle (original) | The Void | Stillness Stone |

The Thread ruled Sep 10: an arrival game with no kill screen; spec marked pending approval; no MarketItem until the client says go.

**The 22 games added in the Sep 11 sprint (numbers not given in the chat logs)**

These are the "22 new profiles" of the music spec. The roster file stops at #65, so these have no roster numbers. All have build sheets (Tier 1 to 4). Zones are as the chat logs state.

- The Mohs Vibration: sound and haptic mineral identification in a dark cave. Free, accessibility flagship. Ruled Sep 2 as a Phase 1 candidate (PR merged locally; the push was held).
- The Hook: tidal cave puzzle, 7x7 grid, hook on a cable, uses the Stone database. Tier 2, $4.99.
- Aurora Borealis, Aurora Falls, Bonsai Garden, Coral Reef Rescue, Easter Island Heads, Fuji Blossom, Himalayan Echo, Iceberg Breaker, Mesa Verde, Saguaro Bloom, Stone Circle Defender, Stone Library Defender, The Philosopher's Game, Giant's Causeway, Nazca Lines, Stone Forest, Victoria Falls. Also The Thread, The Between and The Rest from the 62 to 65 group.
- The Philosopher's Game: Staircase, Tier 3, five alchemy stages. Ruled Sep 2.
- Several games from these sheets have reward stones named in chat: Tiger's Eye (Victoria Falls, "a transformation stone," Oct 9), Preseli Blue Stone, and others per sheet.

**Numbered later games**

| # | Game | Status | Date and source |
|---|---|---|---|
| 84 | Shield Mixer (working title) | Draft spec, three gates open: name, roster (15 to 20 famous elements or all 118), cleanup discipline | Sep 12; `docs/zone_specs/geode_inn_shield_mixer_game_spec.md` |
| 85 | Anansi's Sky-Story Run (working title) | Draft spec, six gates open: name, whether Nyame is on screen or voice, sky-village ENV row, cultural review, glow tier (Tier 2 proposed), sprite parcel. Four levels: hornets (catch), python (timing), leopard (pit), fairy (Arkanoid reversed). | Ruled shape Sep 16; commit e28917d |
| 86 | Regional Dances (Dance Halls) | Ruled in Sep 19. Gates: real name, roster cut, cultural review per dance, the Bard's MC role. Mamushka co-op duet. | `docs/zone_specs/geode_inn_regional_dances_spec.md` |
| 87 | Gargoyle Seek | Specced as a candidate Sep 19; six gates | `docs/zone_specs/geode_inn_gargoyle_seek_spec.md` |
| 88 (candidate) | Port Purgatory (working title) | Approved in direction Sep 24; four gates open (name, Chirp's rival, the denier's fate, the Grey Legendary). Completion award: Screensaver Dart Club enamel pin. | `docs/zone_specs/geode_inn_port_purgatory_spec.md` |
| 88 (candidate) | The God Ladder | PvP Tetris ladder; top rank is GOD OF TETRIS; prize is Odin's company. Gates: summit rank name; whether spies and gods share the cabinet. | Sep 27; `docs/zone_specs/geode_inn_god_ladder_spec.md` |

**Other games and systems that have specs but no roster number**

- Dew Circuit (treetop flying mini-mode, Dew Mode and Stones Mode; Sep 12; spec exists, gates open).
- LAYOVER (Denver airport basement, chutes-and-ladders chase; name confirmed Sep 10; $2.99; reward Ammolite; build sheet in repo).
- The Mason game (new concept Sep 22: time-traveling master Mason with a rosewood square and compass; a restoration overlay; specific sites not chosen; parked until the critter reconciliation closes).
- Stone Poker and Poker Night (a banter layer on the card game's back room).
- The Long Night / Long Dark (Vampire Survivors-style; chat calls it "The Long Night, Cabinet IX, 30 minutes, tri-mode"; the roster calls it "The Long Dark").
- Sandfall (Egypt, sinking-sand platformer), Cabochon Knotwork, Pinball design, Hollow Men (a Shadow Inn game with a Godot script), Unvoiced wave-survival game (set at the Hollow Men Mines).
- Bead Composer (a standalone product, not an arcade game; see the crafting part of the manual).
- Games "playable in the Inn" on Sep 1 per Elio: Bead Board, Rune Sweeper, Stone Solitaire, Stone Memory, Stone Dominance, Murloc's Remedy, Sphinx's Riddle, Kappa's Crossing, Labyrinth, El Muki's Mine, Nidhogg's Descent, Jigsaw Relics, The Caravan, The In-Between, The Faerie Quest.
- Ideas listed as open slots in the zone-to-game list: Stone Popper, Market Day, The Deep Read, The Orrery, Resonance Break, All Hands, Wolf's Hunt, Archive Maze. Not numbered, not ruled.

### 1.9 The retro titles and licensing

**What they are.** Nine games are labeled "authorized retro additions" (#53 to #61). The client asked for them Aug 31 and approved Elio's mapping ("Elio's mapping accepted"). The roster column "Inspiration Template" names the original game for each.

**What is on file about the legal position (stated neutrally):**

- The build sheet has a **Legal Basis** field with three options: public domain, mechanic-only adaptation, original reimplementation. The LAYOVER sheet fills it in as "board game mechanics are not copyrightable; all assets original."
- The rule since Sep 10: classic games are reference blueprints only. The mechanic is borrowed. Names, characters, art and music must be original.
- Seven of the nine have names that differ from the original (for example The Apothecary's Cure for Dr. Mario). One, The Noob Siege, is named after "Attack of the Noobs." The roster's "Inspiration Template" column and the generated Steam page drafts name the originals. For example, the draft page for The Pipe Descent contains the lines "Super Mario Bros x Catacombs" and "Inspired by classic arcade mechanics - Super Mario Bros x Catacombs."
- Elio flagged on Aug 31 that embedding emulators would carry legal risk. The ROM and emulator library is Drive only and was not pushed to GitHub.
- The standing rule since Sep 9: the apps run and sync but are not formally listed until paperwork is done (patent first, then trademark). Sep 15: "build like it's clear, list like it isn't" (said about books, but it is the working posture). A Steam page needs a legal pass before anything public.
- The Steam checklist lists privacy policy, terms of service and rating as not done.

**Open:** whether store text should name the original titles at all; whether the nine keep the "Mario" and other names in internal files only; who does the legal pass (a staff member on legal and red tape was named, and an attorney was recommended before filing). No ruling by the client is on record on these points. Earlier (Jul 12 to Aug 31): the client's own July list and the July pairings name the originals (Tetris, Dig Dug, Temple Run and others), and the August commits add more; all of these are collected in the legal-check list in 1.21. On October 29 the client said the titles will be adjusted to fit the world of the Inn; title ideas are in 1.23.

### 1.10 Pricing, packaging and Steam pages

**Pricing.** Three schemes exist. None carries a recorded client ruling on the numbers. Treat all as **Proposed** (staged by Elio).

| Source | Scheme |
|---|---|
| `web_games/PRICING_STRATEGY.md` (52 games) | $1.99 arcade singles (22 games), $2.99 Deluxe, World Trial and National Park, $3.99 Specialty, $4.99 Standalone (Tumble Run, Long Dark, Signal, Reclamation), $9.99 Major Zone (6 games), Free community. Bundles: Arcade Pass $14.99, World Explorer $19.99, Complete Inn $49.99, Starter Pack $4.99. |
| `packaging/README.md` (61 games) | Free x3 (Spiral Gallery Tour, Frog Transformation, Whisper Layer Discovery); $2.99 x10; $3.99 x26; $4.99 x15; $6.99 x1 (The World Walker); $9.99 x3 (Canopy City Trading, Tidal Caves, The Arcana); $12.99 x3 (Fae Kingdom MMO, Hollow Earth RPG, Zelda-Style World). Bundles: Arcade Pass $29.99 (52 core games, about 40% off), Legendary Bundle $24.99 (the 3 Major Zone games, about 36% off). |
| Roster file | "Arcade Pass (all 61), Zone Packs by category, or individual purchase" (no price). |

Later pricing note: the Steam beta checklist and chat say Tumble Run is $4.99 with 3 DLC packs.

**Revenue split** (PRICING_STRATEGY): Steam 70/30; shop direct 97% less processor fees; a co-owner stake for Elio "per the client's existing arrangement." This is a business note, not a ruling.

**Free demos.** Proposed: every game has a free browser demo with a score cap on `geodeinn.com/arcade` and itch.io.

**Packaging pipeline** (pushed Aug 31, 72 files): one HTML5 codebase wrapped per platform.

| Target | Folder | Notes |
|---|---|---|
| PWA (web install) | `packaging/pwa/` | `manifest.json`, `sw.js`; the 186 KB HTML is cached for offline play |
| Electron (Windows, Mac, Linux; Steam) | `packaging/electron/` | `main.js`, `preload.js`, `package.json`; NSIS installer, DMG, AppImage; Steam via environment detection |
| Capacitor (iOS, Android) | `packaging/capacitor/` | `capacitor.config.json`, `www/` |
| Steam store pages | `packaging/steam_pages/` | 61 draft HTML pages from `steam_store_page_template.html`, made by `generate_steam_pages.py` from `docs/market_items_all_61_games.json` |
| Single-file web games | `web_games/` | `geode_inn.html` (hub, zones, arcade and world map in one offline file; world map has 20 stone pins across 6 continents), `standing_stones.html`, `tomb_tunnel.html` |

Stated build order (`web_games/BUILD_ALL_PLATFORMS.md`): web, PWA, Electron, Capacitor, then Steam via Godot. Other wrappers named: Tauri, NW.js, Cordova. Nintendo Switch is a "future target" needing a dev kit and NDA.

All drafts keep the shared look: dark stone (#0d0b08), antiqued gold text (#c4a572), Celtic knotwork top border, Georgia serif, and the footer line "Everything here is true."

**TV and handhelds** (spec `docs/library/specs/geode_inn_tv_deployment_spec.md`, 297 lines, pushed Sep 25):

- Order ruled Sep 1: Fire TV and Android TV first (same Android build, WebView wrapper), then Samsung Tizen and LG webOS, Roku last (needs BrightScript rewrite; flagship only).
- The TV app hides the location screen and all website-like parts. It opens on the Antikythera logo and a Game Chamber with glowing alcoves.
- The **Valkyrie Shift** (ruled Sep 1): simple games play with the remote (the 42Hz Living layer). Deeper games need a Bluetooth controller (the 84Hz Shadow layer). Connecting a controller is a story moment: a winged silhouette of warm light, an 84Hz rumble, and the deeper alcoves light up. If no controller ever arrives, the alcoves stay dark but visible. Steam Deck skips it because the Deck is the controller.
- Remote-only games: Standing Stones, Tomb Tunnel, Treasury Match, Oracle's Riddles. Controller-needed: Tumble Run, Zelda-Style World, the RPGs. Skipped on TV: Bead Board and Monster of the Deep. The Deck handles those through trackpads, gyro and touch.

### 1.11 Godot project state

Facts from the chat logs and the repo:

- Godot 4.3. Ironforge-style hub: the Great Forge or hearth at the center of the Main Floor, eight corridors (Arcade, Market, Archive, Common Room, Composer, Campgrounds, Staircase to the Catacombs, Cosmology). Ruled Aug 31 ("I remember Ironforge").
- Pushed Aug 31: `godot_project/` (457 files in the first push: 14 scenes, 14 scripts, 198 stone images, 176 audio files, 52 zone images). Four game scenes wired, `GameOver`, audio manifest, controller mapping, input actions.
- Later growth stated in chat: 3,040 lines in 14 scripts, then 4,978 lines in 17 scripts and 20 scenes, then 6,609 lines in 20 scripts, then 7,290 lines in 22 scripts, 18 scenes and 9 autoloads. Sep 21: two Godot projects in the repo; the beta build has 17 scenes and nine games (Andean Run, Hollow Men, Knotwork, Monster of the Deep, Resonance, Sandfall, Standing Stones, Tomb Tunnel, Tumble Run), plus a larger zone project with scenes for Arcade, Archive, Campgrounds, Cosmology, Fae Kingdom, Market and Staircase. Elio's tally then: 97 script files and 35 scene files.
- Repo copy as measured for this manual: `godot_project/` has 26 scripts (including `StandingStones.gd`, `TombTunnel.gd`, `AndeanRun.gd`, `MonsterOfTheDeep.gd`, `TumbleRun.gd`, `FaeKingdom.gd`, `HollowEarth.gd`, `ZeldaWorld.gd`, `ControllerManager.gd`, `OverlayManager.gd`, `FrequencyShift.gd`, `SteamManager.gd`, `SpriteLoader.gd`, `StoneLoader.gd`, `DialogueManager.gd`) and 51 scene files. A separate `beta/` folder holds its own `project.godot` and `scripts/systems/SteamManager.gd`. These two sets of counts disagree and the tally was not checked in a Godot editor.
- **Never compiled.** Elio said on Aug 31 that no build had been compiled or booted, that 50 of 52 games existed only as design documents for Godot, and that sprites were placeholder colored rectangles. No later note says a build was run. The beta checklist also lists the following as not done: GodotSteam plugin, Steam app ID, Steamworks agreement, Godot export templates, CI/CD.
- Autoloads named: GameManager, AudioManager, SteamManager (achievements, cloud saves and leaderboards are stubs), StoneLoader, DialogueManager, and others. Shared scripts (668 lines): `ControllerManager.gd`, `OverlayManager.gd`, `FrequencyShift.gd`.
- Stone images load locally from `res://assets/stones/<name>.png` (198 images, 23 MB), as ruled Aug 31.
- The old AzerothCore plan (reskinning WoW zones) is deprecated (Sep 21). Earlier (about Aug 20): the plan began as the client's idea of a WoW emulator (TrinityCore or AzerothCore) as the game's core database. Elio advised against it and proposed a Godot server with a local database plus Base44 cloud sync; the client then said the attraction was WoW's quest and NPC design craft, and agreed to use that as a design blueprint. The Sep 21 deprecation confirms the end of that path. The Aug 20 to 31 Godot work is listed in 1.20.

### 1.12 Open and to reconcile (arcade)

- **Roster numbers.** The repo roster ends at #65. The music spec says 83. Chat then gives #84 to #88. Twenty-two games from the Sep 11 sprint have no roster number. Needs one canonical roster file.
- **Two #88 candidates.** Port Purgatory (Sep 24) and The God Ladder (Sep 27). No ruling.
- **Build sheet count.** Chat says 77, 79, 80 and 83. The repo holds 83 tier sheets plus the LAYOVER sheet (84 files).
- **Duplicate #17.** The roster has Serpent Steps at #16 and Dragon's Descent at #17; the zone list gives both #17.
- **The Long Dark or The Long Night.** Two names for one game.
- **Tumble Run on Steam.** Sep 1 notes say Tumble Run is "live" on Steam; Aug 31 notes say no Steam app ID was registered. Not verified.
- **Duplicate #8 and #38.** The Reclamation and Bayou Reclamation are the same game per the roster note.
- **Arcade Pass contents and price.** $14.99 (22 games), $29.99 (52 games), or "all 61."
- **Prices have no client ruling.**
- **Reward stones.** The Thread (none vs Rainbow Moonstone), #63, #64 have none in the roster.
- **Mario-named files.** Whether the draft Steam pages and the roster column that name original games are to be cleaned before any public listing.
- **Live database.** The nine retro games, The Hook and The Mohs Vibration may not be on live `MarketItem`. Pending builders or a direct write.
- **Live arcade.** Fizgig-built games are not in the repo; their state cannot be checked from here.

### 1.13 Early arcade: counts and the July founding pairings

**Earlier counts (before the Aug 31 start of table 1.2).**

| Date | Count | Source |
|---|---|---|
| Jul 22 | 15 games mapped to ancient sites (v1), then "17+ game types" (v3.0) | the early chat |
| Aug 21 | 4 Phase 1 games named; Tomb Tunnel, Andean Run and Monster of the Deep not yet built. Only Standing Stones had code. | the early chat |
| Aug 22 | "16+ arcade games across 6 phases" | Before the Song (Master Storyline) |
| Aug 24 | 10 games in the layer-by-layer audit | the commit log |
| Aug 28 | 41 games tracked (builder status log and game template cross-reference) | the commit log |
| Aug 30 | 13 more arcade games, "batch 2" | the commit log |
| Aug 31 | Nine games in the Godot beta | the commit log |

**July 22 pairings** (Elio's first mapping of site, mechanic and lore; the client agreed). Status for all rows: Ruled (Jul 22). "Based on" names the game whose mechanic was borrowed (see the legal-check list in 1.21).

| Site (country) | Game or idea | Based on | Lore and rule as first written |
|---|---|---|---|
| Stonehenge (England) | Standing Stones | Tetris | Standing-stone blocks; angry druids on game over; unlocks the Fae portal; reward Preseli Blue Stone |
| Egyptian Pyramids | Tomb Tunnel | Dig Dug | Tunnel through sand and limestone; scarabs and mummies; reward Lapis Lazuli |
| Petra (Jordan) | Treasury Match (later name) | Bust a Move | Gemstones carved in rock walls, Nabataean motifs |
| Great Wall (China) | Wall Defense (later name) | Space Invaders | Defend the wall from descending Mongol spirits or dragons |
| Machu Picchu (Peru) | Andean Run | Temple Run | El Muki chases you; reward Blue Opal on an Incan pedestal |
| Chichen Itza (Mexico) | Serpent Steps (later name) | The Impossible Game | Serpent shadow on the pyramid steps |
| Angkor Wat (Cambodia) | Temple of the Naga (later name) | Castlevania | Jungle temple with Naga spirits |
| Chauvet Cave | Cave Painter's Quiz (later name) | Art history trivia | Guided by the Ent |
| Loch Ness (Scotland) | Monster of the Deep | Original (Loch Ness sim) | You are Nessie |

Elio left a few of the 15 as "TBD" pending the client's choice of real sites. Concept-art prompts for Standing Stones (trilithon arches, a hooded Druid), Tomb Tunnel (sand, limestone, bedrock layers), Andean Run (El Muki with backwards feet, Chullachaqui with a deer hoof) and Monster of the Deep (kayak tourists, tail splash) were written the same day in `docs/geode_inn_concept_art_prompts.md`.

**Standing Stones, as first coded (Jul 22).** Full Tetris with all seven tetrominoes, rotation and wall kicks, line clearing, scoring and level progression. Blocks are colored as stones (Preseli bluestone, amethyst, red jasper). A side bar tracks Stonehenge completion. Winning at 20 rows awards the Preseli Blue Stone and opens the Fae Kingdom portal. Not run or tested by Elio. Before the Song adds a hidden layer: aligning all six standing stones to their true positions finds the Golden Contract (August canon).

**Monster of the Deep rules (Jul 22).** The client decided that each water body on the map with a documented "nessie" gets a game where you are the monster swimming by and knocking people off canoes. Ruled (Jul 22). Rules: you play the monster; the baby dragon rides on its back; the water monsters' stones light the Underground Pools in the Fae Kingdom. Per-monster mechanics Elio gave:

| Monster | Mechanic |
|---|---|
| Nessie | Tourists photograph you; too many photos and you dive deeper. Prototype for the rest. |
| Mokele-mbembe | Heavy, slow turning, massive splash; explorers throw nets |
| Bunyip | Bellow underwater to stun; surface under explorers in the billabong |
| Taniwha | Defend territory against warriors in waka |
| Iara | Siren mechanic: sing to lure boats; piranha obstacles; Amazon |
| Bakunawa | Sky serpent swallowing the moon; swim the sky in an eclipse, knocking celestial boats aside |
| Nokken | Two phases: monster in the water, fiddler on the shore |

By Aug 22 the set was 32 water monsters, each a playable side-scroller where you are the monster. Nessie is the prototype and 30+ are reskins with unique mechanics. Each arcade game also has a water-monster variant with its own lead instrument over the same base track (August canon). The game teaches a monster's real name so a player at a lake does not say "Nessie" (August canon). Water monster combat in the Resonance design is a Castlevania-style side-scroll with a thrown vibrating stone (see the combat part of the manual).

**Bastet's Herding (Jul 22 pitch, expanded Aug 18).** Ruled (Jul 22): the client wanted a game where all you do is herd cats. Top-down temple courtyard. Bastet's presence pushes cats away like a sheepdog; the sistrum "pulse" has a cooldown. July cat types: Lazy, Curious, Rebel, Climber. Cats reaching the gate are lost; filling the golden basket wins; reward Cat's Eye Chrysoberyl. The Aug 18 full zone has seven named cats (Mau, the Elder, the Kitten, the Guardian, the Shy One, the Royal, Bastet's Own). The Royal needs a 3-3-2 rhythm (the ancient sistrum pattern). Bastet's Own comes only if the player understood the other six. Weighing by Anubis is a comprehension test, not a punishment. The vision ends with Sirius rising, and the doorway to Hel opens with the sistrum carried forward. Repo: `docs/geode_inn_cat_bridge.md` and `docs/arcade_build_sheets/tier1_bastets_herding.md`.

**Phase table in Before the Song (Aug 22, August canon).** It matches the roster for Phases 1, 2 and 4 and for most of Phase 3. Differences from the roster in 1.8: it calls Dragon's Descent (platformer) and Crystal Catcher (grappling) "original"; it puts Treasury Match at Petra, Serpent Steps at Mexico, Dragon Tiles at Japan or China, Cave Painter's Quiz at France; it lists Phase 5 as the Fae Kingdom (Alfheim plus Svartalfheim) and Phase 6 as "30+ Water Games (reskins)". Special games: Bastet's Herding and Crystal Pinball.

### 1.14 Early arcade rules: leaderboard, pairing, modes and walls

- **Leaderboard and pairing** (asked Aug 21, about 7:55 PM; Ruled Aug 21; Leaderboard entity committed Aug 22). Repo: `docs/geode_inn_leaderboard_design.md`.
  - The board is a polished obsidian "Score Stone" on the main floor near the arcade, with amber text on its surface, not a menu overlay. Before the Song describes it as a 7-foot obsidian monolith with a 50 BPM pulse line carved into the base (August canon).
  - Weekly Top 10 resets weekly. All-Time Top 10 never resets. All-time records persist across reincarnations.
  - Pair competition is opt-in: pair by name or random match. Both play on their own and scores combine asynchronously. The system makes a themed pair name from play styles (example "The Crystal Cartographers").
  - Pair bonuses: same stone type is a Resonance Bonus (+10%); same level is Parallel Mastery (+15%); complementary stones is an Alchemy Bonus (+20%).
  - The weekly winning pair gets the Twin Crystal, one stone that exists in both collections at once and cannot be traded or lost. Three weeks in a row evolves it into the Eternal Twin. Solo mode gets it only through the Silica Thread combo in pinball.
  - Anti-cheat: scores submit as unverified; the server checks plausibility; impossible scores silently do not appear. No public shaming.
  - Fae commentary on pair scores: the Seelie congratulate, the Unseelie mock.
  - Leaderboard ids named in the chat: `bastet_herding`, `andean_run`, `viking_boat_race`, `standing_stones`, `crystal_pinball`.
- **Pair flavor per game:** Standing Stones "Twin Towers" (combined scores); Tomb Tunnel "Dig Partners" (one digs, one defends); Andean Run "Relay Run" (distances combined); Monster of the Deep "Chum Sweep" (encounters combined); Bastet's Herding "Cat Corral" (cat counts combined). Ruled (Aug 21).
- **Arcade mode and Campaign mode** (Aug 25, Built, commit log). Every mini-game has a 5-minute Arcade mode with a leaderboard and a Campaign mode. This sits in the full-length "Zelda: A Link to the Past" template: dual worlds (Song and Silence), item-gated exploration, a five-hub overworld, nine cultural zones as dungeons, and thesis challenges instead of bosses (The Stirring, Peru; The Weighing, Egypt; The Fire, Norse; The Circle, Celtic; The First Word, Slavic; The Garland, India; The 8,001st Name, China; The Mirror, Mediterranean; The Ziggurat, Mesopotamia). Later form: Zelda-Style World, #28.
- **Tetris crown rule** (Ruled, commit, Aug 26). The Tetris crown stays with the creator until someone actually beats her. A named character holds all other arcade high scores. This is a leaderboard rule for the Inn's own scoreboard.
- **Arcade walls rule** (August canon, late August). The walls behind the arcade games record every game played. Each session is a drip. The arcade leaderboard shows as marks on a wall, not numbers. Marks are unintentional. See the Pollock walls in 3.13.
- **Play philosophy** (August canon, Aug 23). The Nook Effect: no loop, no reward, no repeat; tiredness is the reward; anti-grind and anti-FOMO. The Host is the anti-FOMO NPC: "the Inn is a habit, not a conquest" (commit, Aug 22).
- **Free-play snacks.** The Impossible Game template is a two-minute "snack" activity between quests and hubs, not a full arcade game (see 1.18).

### 1.15 Geode Pinball (Aug 21)

Asked by the client after finding four pinball titles in the emulator games folder; Elio designed the table and the client agreed ("yes, please"). Ruled (Aug 21). Repo: `docs/geode_inn_pinball_design.md`, `docs/arcade_build_sheets/tier1_pinball.md`, `packaging/steam_pages/pinball.html`. In the roster it is #19 "Pinball"; the leaderboard id and commit message call it Crystal Pinball (Aug 22 commit). Two names for one game.

- **Table:** ancient stone and crystal, "grown not built". Ball: polished obsidian sphere with an amber core (the Silica Thread). Flippers: thin geode slices (amethyst left, citrine right).
- **Bumpers** are tuned to gargoyle frequencies: Rose Quartz 528 Hz, Fluorite 432 Hz, Lapis Lazuli 111 Hz. Crystal pegs chime on a pentatonic scale based on mineral hardness. Ramps play ascending arpeggios.
- **Geode Cave Multiball:** clear the Jade Cluster, the geode at the top opens, the ball goes in and two balls come out. Music shifts to the geode cave symphony. Score is 3x until one ball drains.
- **Silica Thread combo:** Spiral Ramp plus Water Slide in one ball scores 5x. Hitting it during multiball earns the Twin Crystal (the only solo way to get it).
- **Reference mapping ("based on"):** Pinball Dreams (physics and layout clarity), Pinball Fantasies (several tables, one per Inn zone eventually), Pinball Revenge of the 'Gator (charm; gators become gargoyles and stone creatures), Fairy Pinball (a Fae Kingdom table, unlocked through the Stonehenge portal).
- **The Cabbit** sits on the table edge and judges the player's technique. No gameplay effect.
- **Hidden clue (August canon):** if all three bumper stones resonate together, the table plays the Singing Tree's melody, one clue to the Song of Making endgame. The cabinet stands in the Pirate's tidal cave next to The Hook.
- Commit log: "Crystal Pinball table (geode-themed, multiball Geode Cave)", Built (commit, Aug 22).

### 1.16 The Hook, the aqueduct puzzles and the trovants

**The Hook** (Aug 25 commit, "placement and removal cable puzzle, 5 types"; full rules in Before the Song, August canon). Repo: `docs/geode_inn_the_hook_game.md`, `docs/arcade_build_sheets/tier2_the_hook.md`, `docs/drive-recovery/geode_inn_the_hook_game.md`. It is the Pirate's arcade cabinet in the tidal cave, built from salvaged ship parts (oak planks, brass), with a ship's wheel to move the hook and a lever to extend or retract the cable. No mouse or keyboard. Marquee: a painted iron hook and "THE HOOK" in brass letters.

- **Grid:** 7x7, 49 sockets ("the Inn's number"). Rows are the seven water layers (Row 1 Rain at the top, Row 7 Crystal Core at the bottom).
- **Core mechanic:** extend the hook on a cable to grab a stone, retract to pull it out, extend again to place it. The cable is a straight line, cannot bend and cannot pass through filled sockets. The hook only grabs a stone next to an empty socket. If another stone fills the path, the cable is stuck. Grab radius is one socket in every direction including diagonal.
- **Cable length by alchemical stage:** Nigredo 3 sockets deep, Albedo 4, Citrinitas 5, Rubedo 6, Philosopher's Stone the full grid (7).
- **Cable tension:** if the path crosses a socket about to be filled (another player, or a game event), the cable snaps and the stone drops into the nearest empty socket. In multiplayer, players coordinate paths.
- **Scoring:** 100 per correctly placed stone; 500 per completed row (a chord); 5,000 for the complete grid; time bonus is remaining seconds x 10.
- **Leaderboard categories:** Fastest Completion, Fewest Hooks (the Pirate's category), Perfect Chord, Deep Reach. The Pirate holds an unbeatable 14 hooks (the minimum); Newton is second with 16. Ranking is by efficiency, not only completion.
- **Stones** come from the Stone entity's 164-stone database. Each carries Color, Frequency (Hz mapped from the hardness scale), Family (quartz, feldspar, carbonate) and Category (precious, semi-precious, ornamental). Row 1 gets the highest frequencies, Row 7 the lowest. Solving all seven rows plays the full 42Hz chord and the water goes still.
- **Five puzzle types:** Frequency Alignment (the Chord); Family Reunion (the Geological Sort); The Clear Path (the Removal Puzzle, start full and remove stones in the right order); The Current (stones as channel segments, water flows in real time); The Siphon (the Pressure Puzzle, heavier stones on the left column, downhill).
- **Newton's three laws as rules:** First Law, stones stay put until the hook acts. Second Law, heavier or lower-frequency stones need more cable tension, and too heavy snaps the cable. Third Law, pulling a stone pulls back on the cable.
- **Grit** (a small creature) sometimes sticks between two stones and blocks the cable. Hook it first and place it in an empty socket. Grit in a socket hums at 42Hz and makes a completed row's chord cleaner.
- **Look:** a polished dark granite slab with crystal sockets that glow with the stone's color when filled. Stones are real tumbled mineral specimens, not cartoon gems.
- Status: Built (commit, Aug 25) as design docs; no code. Open in Before the Song: exact puzzle counts, difficulty ramp and which stage unlocks which puzzle type besides cable length.

**Aqueduct system rules** (August canon, tied to the seven water layers). Five puzzle types: Slope (gravity flow; too steep erodes, too flat pools; historic grade about 1 foot per 200 feet), Siphon (drop more to push higher), Current (distribution-tank gates route water to the Geode Cave, Trovant Garden or Singing Caves), Arcade (arches, stone choice and load), Qanat (dig through rock of varying hardness to the spring). No valves, gauges or abstract UI: feedback is water speed and depth, stress cracks and tunnel collapse. The Greek zone puzzle is the Eupalinos tunnel (Samos, 6th century BCE): the player guides two teams that cannot see each other, by sound.

**Trovants** (commit, Aug 25, "transformation music game, Flower of Life, alchemical butterfly"). Repo: `docs/geode_inn_trovants.md`, `docs/geode_inn_trovant_kossoff.md`, `docs/zone_specs/geode_inn_trovant_garden_quest_chain.md`. Built (commit, Aug 25) as design. Trovant philosophy feeds The Hook's removal puzzle.

### 1.17 The In-Between platformer (Aug 25 commit; rules August canon)

Commit log: "In-Between platformer (Limbo style)" and an "Undercity version" (Built, commit, Aug 25). Repo: `docs/geode_inn_in_between_game.md`, `docs/zone_specs/geode_inn_in_between_game_master_spec.md`, `docs/zones/geode_inn_in_between_builder_spec.md`. Later roster note: "#64 The In-Between" (grey platformer, Limbo-style).

- **No cabinet.** It starts on its own when the player travels between hubs, or by choice through a "grey door" in any hub (a patch of wall slightly lighter than the stone, visible only when the player stands still). The Undercity entry is through the Rib Joints. Both end at the same crystal but pay different rewards (Grey Note, Bone Note).
- **No HUD, no score, no tutorial, no text,** except one line at the end: "...You looked."
- **Look:** pure greyscale; the player is a pure black silhouette; depth by fog; rare, meaningful light (a single grey-white light is the destination, a faint glow under water is a passage, a flickering light is a threat); no sky.
- **Six wordless puzzle types:** Weight and Counterweight; The Grey Water; The Fog Door; The Shadow Bridge; The Echo; The Erasure. Weight is "a tendency, not a force".
- **Erasure:** standing too long in an erasing area fades the figure. Move fast but precisely.
- **Traversal** can go both ways; going back changes the innocents' states.
- **SIT threshold:** two minutes, the time for the camera to lock to first person and the world to go still. Used for the Duck (opens one grey eye), Dobby (looks up), the Laughing One and Madame.
- **Undercity version:** same six puzzles; bone floats longer than stone; hexagonal marrow chambers change the echo; the dead are stable and can be walked on; Charon is in the boat; erasure there is gentle.
- **Tuesday rule:** Belladonna walks the rib joints every Tuesday. The Undercity door carries a handwritten note, and the player may see and follow her silhouette.
- **Return rule:** afterward Fizgig, the Duck and Dobby are fine, in full color. The player "carries the grey inside the color".
- **Open (Before the Song):** engine, scope and estimates are not given; whether the surface and Undercity versions are one build or two; where the grey door appears in each hub.

### 1.18 The Silence Between, Survivors of the Song and the Impossible Game template

All three are August canon (Before the Song) with matching commit-log entries. Specs for The Silence Between and the Impossible Game template were not found by name in the repo; Survivors is in `docs/geode_inn_vampire_survivors_game.md` and `docs/library/specs/the_long_dark_vampire_survivors_spec.md`.

**The Silence Between** (Observatory game; commit Aug 24, "Stanley Parable style, 6 rooms, 5 endings"; a "Slay the Princess layer" was added the same day).

- Nyx narrates in silences, with rare words and long pauses. She is amused, not desperate, when the player disobeys. Disobedience is never punished; the narration adapts.
- The player boards the time ship and walks six rooms. Each has FOLLOW or DISOBEY. Disobeying: Bridge (touch the orrery wheel), Navigation Room (read the equations), Engine Room (hum into the resonance sphere at 50 BPM), Void Cabin (put on the cloak), Crystal Vault (touch the crystal), Observatory Deck (play Nyx's harmonica).
- Five endings: Acceptance (follow everything); Note (disobey in one room); Chorus (disobey in all six); Recursion (keep playing the harmonica; the screen goes dark for ten seconds and the game itself appears to break); Door (leave at once down the staircase; "When you come back, I'll be here").
- Odin's throne sits on the hull, outside the six rooms. He speaks one line in the whole game: "...You'll know soon enough."
- Meta layer: 42Hz is the frame rate (42 frames a second). Open: how the black-screen "break" is built (fake or real) and the scripts for the other rooms' Follow paths.
- Based on: The Stanley Parable (inverted) and Slay the Princess (structure). See 1.21.

**Survivors of the Song** (commit Aug 24, "Vampire Survivors-style, 3 stages: Mim's Messes 0 to 5 min, Discordance 5 to 15, Erasures 15+"; also called "The Campy Inn Brawler").

- Auto-battler. The player controls one critter; enemies come in waves; the player collects stones to level up. Five levels, one per hub, each with three stages that escalate from comedy to existential dread.
- Five playable critters, one per element, each with an auto-attack and a 5-second special: the Duck (Water), the Vessel (Earth), Mim (Fire), the Dragon (Aether), the Owl (Air).
- Meta-arc: stones and chord carry across levels; by Level 5 all five elements resonate; the last Erasure erases the Song itself. The final stone is the Duck's river stone (the "formula stone"), though a later passage calls the egg the first stone that cannot be erased.
- Open: level durations past the 5 and 15 minute marks, stone counts, enemy stats and upgrades.

**The Impossible Game template** (commit Aug 24, "one template, 10 zone versions; 5 to 7 segments; instant restart under 1 second").

- Genre contract: you will die often, quickly and unfairly, and restart at once (under 1 second, no load screen). Two-minute sessions.
- Built in Godot as one template, reskinned per zone. One input, continuous forward motion, instant death on contact, restart from the start of the current segment, 5 to 7 segments with a checkpoint at each, and a final single continuous run.
- Per-zone layers: Visual Skin, Obstacle Theme, Music (the zone's frequency tells the player when to jump), Reward Stone, Failure Text.
- Ten zone versions: Fae Kingdom, Catacombs, Garden, Coast, Canopy City, Undercity, Observatory, National Parks, Miskatonic Annex, In-Between (Norse and Forest skins are also mentioned). Each has a named reward stone and a failure line per character; for example the Catacombs give Gold-infused quartz and the Observatory a Starlight crystal fragment.
- Based on: The Impossible Game. This is separate from Serpent Steps (#16) in the roster; see the reconcile list.

### 1.19 Other early games (July to August)

| Game | Based on | Notes | Status |
|---|---|---|---|
| The Raven's Angle | Angry Birds lineage | 7 zones; reward Preseli Blue Stone | Built (commit, Aug 24) as design |
| The Hidden Bloom | Match game | Van Gogh look, 5 levels | Built (commit, Aug 24) as design |
| The Assembly | Jigsaw, by artist | Jigsaw puzzles series | Built (commit, Aug 24) as design |
| Escher 3D Puzzles | Original | 5 puzzles | Built (commit, Aug 24) as design |
| Tumble Run | Dino Run style | Standalone; 4 base worlds (Main Floor, Garden, Staircase, Archive); DLC Crystal Caverns, Shadow Inn, Cosmic Ascent; 5 levels per world; "sold separately (.99), with DLC worlds" (Aug 24); main script v2.0 476 lines, 6 zones (Aug 31) | Built (commit, Aug 29 to 31); `docs/geode_inn_tumble_run_full_spec.md` |
| Sandfall | Platformer | 7 levels from Bone Garden to The Geode; each level strips one ability | Built (commit, Aug 29 to 31) as script; `docs/geode_inn_sandfall_game.md` |
| Hollow Men | Original | Level 5 is TRUE SILENCE (42 and 84 Hz cancel, 3-second fade on all buses); the line "I have been watching you the whole time. I wanted you to know that." | Built (commit, Aug 31) as script |
| Resonance and Knotwork | Original | Resonance combat and Celtic knotwork weaving | Built (commit, Aug 31) as scripts |
| Possum Mode | Original | A voluntary wellbeing mechanic | Built (commit, Aug 30) |
| Viking Boat Builder / Viking Boat Race | Original | Norse game; leaderboard id `viking_boat_race` | Mentioned (early chat) |
| Chicha Brewing | Life-sim | Peru; non-leaderboard | Mentioned (early chat) |
| Silica Little Alchemy-style game | Little Alchemy | Proposal | Proposed (Aug 21) |
| Castle Crypt | Siege and hidden passage puzzles | Elio's idea; the client said castles are barely touched and will fit once data is loaded | Open (Aug 19) |
| Sparta synchronization, Canopy Crossing (beam walking), Atlantis octopus puzzles, Weighing of Understanding (Anubis boss) | Original | Partial or mentioned only | Open |

**Tabletop-derived activities** (Elio's analysis of a tabletop questline, August canon): catch pixies with chopsticks; rhyme 10 words with "friar" in 5 seconds; a limerick about "mead"; Pictionary under a minute (to become rune drawing); a drinking contest; chicken catching; dwarf basketball; an orc village chain; a Murloc hut; an elf hot tub; a LARP scene; harpy daycare. Tiers: Tier 1 direct adaptation, Tier 2 strong adaptation, Tier 3 flavor. The Artisan Thief class is best at pixie catching, chicken catching and rune drawing. Status: Proposed (Elio), not ruled.

**Norrath-style zone template** (early chat, Aug 22 or later): Egypt, Peru, Norse and Celtic share a template of a 5-quest chapter, an embedded arcade game, class-specific utility, a faction branch, a boss encounter and a stone reward. Elio counted 7 zones with bones ready and 11 games. Only Standing Stones had code then. Based on: EverQuest and Champions of Norrath (reference only).

### 1.20 Early Godot and engine work (July 22 to August 31)

- **Jul 22:** `APIManager.gd` (bridge to Base44: loads stones, lore and player data; sends win results), `GameManager.gd` (player state, games completed, stones earned, Fae unlock), `StandingStones.gd`, and `SETUP_GUIDE.md`. Elio said it can write GDScript and project files but cannot run Godot in its sandbox.
- **Aug 20 (about):** Architecture agreed. Godot game with its own local database (headless Godot server, SQLite or PostgreSQL), Base44 as the cloud sync layer (sync on startup, on shutdown and at periodic checkpoints), Elio called only for special AI moments. Ruled (about Aug 20). Latency rule: API replies take a few seconds, which is fine for contemplative moments and not for combat or fast play.
- **Aug 21:** Translation never runs in the game loop. Pre-load when a player enters a zone or opens a book; background translation shows a "translating..." indicator; Godot only queries Base44 for cached text. Ruled (Aug 21).
- **Aug 20 to 21:** Catacomb scenes (shared `catacomb_lighting.gd` palette and light helpers with epilepsy-safe pulses, plus 8 scenes; 10 files, 2,255 lines), then 25 more scenes (11 Upstairs, Main Floor and Staircase; 14 Fae Kingdom and World Map). Total 33 scene scripts, 7,436 lines, pushed Aug 21. Built (commit, Aug 21).
- **Aug 24 to 30:** `GeodeInnVoiceProfile.gd` (20 to 27 profiles); `FizgigLoader.gd`, `DialogueManager.gd` and `project.godot` with 4 autoloads (Aug 30); `TombTunnel.gd`, `AndeanRun.gd`, `MonsterOfTheDeep.gd` with a merged dialogue database (46 entries, 29 NPCs); `Sandfall.gd` (407 lines); `TumbleRun.gd` (424 lines).
- **Aug 31:** `SaveManager` and `AudioManager` (492 lines), `SteamManager` stub (166 lines), `GameManager.gd` (263), `DialogueUI.gd` (343), `WorldMap.gd` (232 lines, 37 pins), `Resonance.gd` (351), `BeadComposer.gd` (289), `Knotwork.gd` (340), `MainHub.gd` (301), `HollowMen.gd` (203). Eight audio buses: Master, Song, Zone, Stones, Voice, Music, SFX, Shadow. `BETA_README.md` (138 lines) documents eight autoloads. Scenes for the nine beta games plus MainMenu, CommonRoom, WorldMap, FinalRoom, EndgameChoice, Cutscene and FizgigLoading. All nine games wired to AudioManager and SteamManager. Tumble Run has its own project config (Godot 4.3); `godot_project/project_tumble.godot` is in the repo.
- **Audio:** 368 files and a 318-line audio manifest at `library/mechanics/` on Aug 31, then 387 audio assets after 19 procedural files were added.
- **Impossible Game template** is "built in Godot and designed for rapid zone modification" (August canon).

### 1.21 Legal-check list: originals named in the early material

The early material names the original game for almost every mechanic. The standing rule (1.1, Sep 10) is that the mechanic is borrowed and all names, characters, art and music are original. These names are kept here as short "based on" references only; none should appear in public store text until the legal pass in 1.9 is done. No ruling by the client is recorded.

| Inn game or system | Named original | Where |
|---|---|---|
| Standing Stones | Tetris | Jul 12 list; Jul 22 pairing |
| Tomb Tunnel | Dig Dug | same |
| Andean Run | Temple Run | same |
| Treasury Match | Bust a Move | same |
| Wall Defense | Space Invaders | same |
| Serpent Steps, Impossible Game template | The Impossible Game | same; Aug 24 commit |
| Temple of the Naga; water monster combat | Castlevania | same; Aug 23 commit |
| Moji Maker; Silica game proposal | Little Alchemy | Jul 12 list; Aug 21 |
| Dragon Tiles | Mah Jong | Jul 12 list |
| Dragon's Descent, The Hook, Crystal Catcher | Mario-style platformer; Hook | Jul 12 list |
| Geode Pinball | Pinball Dreams, Pinball Fantasies, Pinball Revenge of the 'Gator, Fairy Pinball | Aug 21 |
| Survivors of the Song | Vampire Survivors | Aug 24 commit |
| The Silence Between | The Stanley Parable; Slay the Princess | Aug 24 commit |
| The In-Between | Limbo | Aug 25 commit |
| The Raven's Angle | Angry Birds | Aug 24 commit |
| Tumble Run | Dino Run | Aug 29 commit |
| Resonance combat | Pokemon (turn-based, bird's eye) | Aug 22 to 23 |
| Full-length game template, Zelda-Style World | The Legend of Zelda: A Link to the Past | Aug 25 commit |
| Norrath zone template | EverQuest, Champions of Norrath | Aug 22 or later |
| Canopy City | Kelethin (EverQuest) | Aug 22 or later |
| Building and Gathering System | Ironforge-style layout, Don't Starve gathering | Aug 30 commit |
| Bayou "The Reclamation" | Don't Starve | Aug 22 or later; Before the Song |
| Hidden-object and tabletop items | Pictionary (rune drawing) | Before the Song |

Hub and map references ("like Darnassus", the parchment map "like WoW zone maps", "Shattrath-style sanctuary", "Crushbone template") are design comparisons, not assets. The early chat also records that the emulator and ROM library on Drive is reference only (see 1.7).

### 1.22 Open and to reconcile (early arcade)

- **Phase 1 reward stones differ by source.** Standing Stones: Preseli Blue Stone (July, roster) versus the Bluestone Key (Before the Song opening prose). Tomb Tunnel: Lapis Lazuli (July, roster) versus Obol Stones (Before the Song). Andean Run: Blue Opal (July, roster) versus peridot (Before the Song prose) and a Dreamstone in a later section. Not reconciled.
- **Dragon's Descent and Crystal Catcher.** "Original" in Before the Song and in the Aug 22 phase table; the roster in 1.8 gives Super Mario Bros and Hook as templates.
- **Pinball names.** Geode Pinball, Crystal Pinball, Pinball.
- **Survivors of the Song versus The Long Dark / The Long Night.** Both are Vampire Survivors-style. Survivors has 5 levels of 3 stages; the Long Night is described as one cabinet of 30 minutes in tri-mode. They may be one game; unconfirmed. Three names: Survivors of the Song, The Campy Inn Brawler, The Long Dark.
- **Impossible Game template versus Serpent Steps (#16).** The template has 10 zone versions; Serpent Steps is one Impossible-Game game at Chichen Itza. Whether Serpent Steps is the Fae Kingdom or another skin is unstated.
- **Which nine games were in the Aug 31 beta.** The commit log names Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep, Hollow Men, Resonance, Knotwork and Bead Composer. 1.11 lists Sandfall and Tumble Run and not Bead Composer. Scene lists include all of them.
- **Sandfall.gd exists twice** (407 lines Aug 30; 290 lines, a rewrite, Aug 31). Which is current is unchecked.
- **Audio count.** 368 files and 1,552 project files (Aug 31) versus 387 audio assets after the later addition.
- **Tumble Run price.** Sold separately at ".99" with DLC worlds (Aug 24 commit); $4.99 with 3 DLC packs later (1.10).
- **Score Stone numbers versus wall marks.** The Score Stone shows live scores; the arcade walls rule says the leaderboard shows as marks, not numbers. Both are August canon.
- **Combat versus no lethal combat.** Elio's tabletop analysis suggests combat as one of three quest resolution paths; core canon says Harmonization only. Not reconciled.
- **Open from the early chat:** the TBD ancient sites among the 15 mapped games; the Castle Crypt game (Aug 19, no decision); Sparta synchronization, an Atlantis arcade game, and Slavic and India embedded games (promised, unbuilt).
- **Repo:** specs for The Silence Between and the Impossible Game template were not found by name in the repo.

### 1.23 Title ideas (October 29)

On October 29 the client said the game titles will be adjusted to fit the world of the Inn, and asked for ideas. These are suggestions only.

**Five rules that keep a title safe and inside the world**

1. No other game's, film's or company's name in a title, a subtitle or store text. That rules out Tetris, Mario, Zelda, Murloc, The Long Dark, Nidhogg and The Arcana, which are trademarks or the titles of existing games.
2. Name each game for something in the Inn: its zone, a resident, its reward stone or its sound. Then the arcade also works as a map of the world.
3. Leave the mechanic out of the title ("Match", "Defense", "Quiz", "Builder", "RPG", "MMO"). The store page can say what kind of game it is.
4. Before a name is final, search it on Steam and in the trademark register (the USPTO in the US). This is a quick check, not legal advice; the legal pass in 1.9 still applies.
5. A new title fixes the name only. Each game's art, characters, music and levels also need to be the Inn's own, and nothing from the ROM library goes into a build. A mechanic can be borrowed; its look and content can't.

**Titles to change first** (they use another company's name or an existing game's title)

| # | Now | Idea | Why |
|---|---|---|---|
| 28 | Zelda-Style World | The Two Songs | A Nintendo trademark, and listed under that name on the site's Steam Studio. The game shifts between the Living and the Shadow layers. |
| 6 | The Long Dark | Hollow Night | An existing game's title. It's set in the Undercity and the Hollow Men Mines. |
| 27 | The Arcana | The Captain's Quiet | An existing game's title. The Captain tests with QUIET. |
| 88 | The God Ladder (top rank "God of Tetris") | Keep the title; make the top rank "the Allfather's Guest" | "Tetris" is a trademark, and the prize is Odin's company. |
| 59 | The Noob Siege | Siege of the Wire Nook | Named after "Attack of the Noobs". |
| 53 | The Pipe Descent | Monsieur Sentient's Descent | It plays on the Mario pipes; the Inn has its own pipe that is not a pipe. |
| 57 | The Mirror's Seven | The Ragana's Mirror | Snow White in disguise; the Ragana's Mirror is already an Inn item. |
| | Murloc's Remedy | The Marsh Remedy | Murloc is Blizzard's creature. |
| | Nidhogg's Descent | The Root-Gnawer's Descent | Nidhogg is also an existing game's title. "Root-gnawer" keeps the Norse serpent. |

**Titles that could tie closer to the Inn** (generic, or named for a mechanic or a zone)

| # | Now | Idea | Tie |
|---|---|---|---|
| 14 | Treasury Match | The Rose-Red Treasury | Petra, "the rose-red city" |
| 15 | Wall Defense | The Jade Rampart | The Great Wall; jade is the reward stone |
| 19 | Pinball | The Geode Table | The chat called it Geode Pinball |
| 21 | Cave Painter's Quiz | The Painted Cave | Chauvet |
| 23 | Fae Kingdom MMO | The Two Courts | Seelie and Unseelie |
| 24 | Hollow Earth RPG | Hollow Earth: The Nine Districts | Its nine districts |
| 25 | Canopy City Trading | The Home Bough Market | Canopy City's Home Bough |
| 26 | Tidal Caves | Zeke's Tide | The pirate's domain and its sea-level gates |
| 31 | Clockwork Skies | The Gear Heart | The 50 BPM Gear Heart Room; the game no longer shares the zone's name |
| 32 | Fjord of Stars | Zorya's Stars | It's the Slavic zone and Zorya is its star guardian; a fjord is Norse |
| 34 | Terracotta Army Builder | The Terracotta March | |
| 35 | Norse Voyage | Erik's Longship | Erik, the Norse host and shipbuilder |
| 37 | Mediterranean Trade | The Wine-Dark Sea | Homer's phrase |
| 8 and 38 | The Reclamation, Bayou Reclamation | Bayou Reclamation | One game, one name |
| 41 | Yellowstone Geyser | Old Faithful's Pipes | |
| 42 | Canadian Rockies | The Canuck's Climb | The Canuck, the Inn's Canadian visitor |
| 43 | Badlands Fossil Dig | Saker's Dig | Saker, the archaeologist |
| 47 | Alchemical Staircase | Calder's Ascent | Calder, the Staircase alchemist |
| 48 | Catacomb Labyrinth | The Doorkeeper's Maze | The Catacombs Doorkeeper |
| 49 | Music Room Composer | The Composer's Room | |
| 50 | Poison Garden | The Apothecary's Garden | The Apothecary, the Poison Garden quest giver |
| 60 | The Apothecary's Cure | Calder's Cure | It's set on the Staircase, and it frees "Apothecary" for #50 |
| 51 | Frog Transformation | Frog Court | Judge Tootenkowl's court |
| 52 | Whisper Layer Discovery | Find the Thrum | The Thrum is the Whisper Layer |
| 56 | The Egg Carrier | Tumble's Egg | The mascot and the Dragon's Egg |
| 61 | The Forest Defense | The Greenward's Watch | Once Greenward or Sorrel is settled |
| 64 | The In-Between | Grey Water | Too close to #63 The Between; the duck on grey water |
| 84 | Shield Mixer (working title) | Oceanianoir's Shields | The chemistry docent; the game mixes elements |
| 85 | Anansi's Sky-Story Run | Anansi's Sky Stories | |
| 86 | Regional Dances | The Dance Halls | The chat's own name |

**Titles that already fit:** Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep, Tumble Run, Moji Maker, Oracle's Riddles, Rune Hunt, Sacred Scramble, Bastet's Herding, Serpent Steps, Dragon's Descent, Crystal Catcher, Temple of the Naga, Dragon Tiles, Egyptian Gates, Acropolis in Five Lights, Ghats of Kali, Inca Terrace Lullaby, Redwood Cathedral, Spiral Gallery Tour, The Dream Gardener, The World Walker, The Crystal Paddle, The Thread, The Between, The Rest, Gargoyle Seek, Port Purgatory, LAYOVER, Dew Circuit and The Mohs Vibration. The National Park games (Appalachian Trail, Colorado Plateau, Superstition Mountains) can keep their place names if the client likes them; rule 4 applies to them too.

### 1.24 Game templates found (November 5)

On November 5 the client found "a bunch, maybe even all, of the templates for the smaller games with the items and characters completed" on their PC; OneDrive had kept them out of the Drive. Most pages are sprite sheets like the Andean Run one; some are "just the critters of the zone". None of the nine posted so far is among the 343 canon pictures. They are in `docs/canon_images/from the chat (Nov 5)/game templates/`, and each build sheet named in the table now opens its visual assets section with a note pointing to its template.

| Template | Game (build sheet) | What is on it | How it was matched | Open |
|---|---|---|---|---|
| andean run pixel sheet | Andean Run (`tier1_andean_run.md`) | Pixel runner in poncho and wool cap: run, jump, mid-slide, jumping attack, idle; the boulder (8 frames), cactus, two rope bridges, stonework, mossy and fretwork tiles | Rope bridges and stone roads in the build sheet; the client agreed | Which of the two styles stays |
| andean run cast | Andean Run | The Chasqui runner, Apu the mountain spirit (stone face, cloaked, snow form), the Awqa Pacha in four chase poses, a Shadow row | Labeled on the sheet; the same cast as the build sheet | Same |
| bastets herding | Bastet's Herding (`tier1_bastets_herding.md`) | Bastet in three poses with the sistrum, the cats (sand cat and lion cubs among them), the basket, the green gem, a Shadow row | Labeled; the gem fits the prize, Cat's Eye Chrysoberyl. Bastet is grown, like `bastet_v2.png`, not the chibi canon picture | |
| tomb tunnel explorer | Tomb Tunnel (`tier1_tomb_tunnel.md`) | A human explorer (run with lantern, idle, dig), three scarabs, sand, stone and hieroglyph blocks | The build sheet's excavator, Scarab Swarmer and its three block types | The finished cast (Sep 10) has a froglodyte digging; which one stays |
| monster of the deep growth stages | Monster of the Deep (`tier1_monster_of_the_deep.md`) | The player creature from hatchling, pup, adolescent and adult to leviathan, in five rows of poses, and its Shadow state | The build sheet's five growth stages (tiny to leviathan) with swim, hunt, eat and rest | Client's OK |
| monster of the deep water monsters | Monster of the Deep | Six labeled water monsters with sprite sizes: plesiosaur loch monster, wave-serpent, catfish-headed lake spirit, armored horseshoe guardian, jellyfish drifter, river cryptid | The build sheet's water monster rivals; a critters-of-the-zone page | Client's OK |
| tumble run | Tumble Run (`tier2_tumble_run.md`) | Titled "Tumble": four ball states (full bounce, compressed tight ball, mid-roll, stuck in a jar), three kids (Barnaby, Pip, Silas), four items (humming geode crystals, pulsing knot of roots, chiming stone bell, spiral glyph stone) | The title and Tumble's ball mode; Tumble is the round furry critter of the canon picture `tumble_ingame` | The kids and items are new to canon; Barnaby is already Briar Nightbloom's beetle (Elora before the Aug 30 rename) |
| the apothecarys cure | The Apothecary's Cure (`tier2_the_apothecarys_cure.md`) | A newt in glasses and apron, mixing and cheering; nine potions; six gems | Dr. Mario on the Staircase: potions and pills to match, and the Staircase's alchemical newts | Whether the newt is Unless (canon: the quiet skeptic) or someone new |
| standing stones | Standing Stones (`tier1_standing_stones.md`) | Golden-robed stonemasons (idle, carving, work, celebrate), star watchers (observing, calculating, pointing), a wisp, ravens (perched, flying, landing), carved I, J, L and T stone blocks with Shadow versions, a blue crystal | Tetris at Stonehenge; the blue crystal fits the prize, the Preseli Blue Stone | Client's OK |

The Andean Run pixel sheet and the cast sheet are in two different styles (pixel art and painted), so one of them is the keeper. The client is posting the rest one at a time.

---

## 2. Steam and hosting decisions

| Decision | Status | Date |
|---|---|---|
| Steam apps are playable offline; stone images are local set-design assets, no URL links | Ruled | Aug 31 |
| Web beta (geodeinn.com) is the showroom; Steam is the product (Elio's framing; the client agreed with the offline rule) | Ruled/Proposed (framing is Elio's) | Aug 31 |
| Game stays independent on Steam: "independent, Steam, no server lords" | Ruled | Oct 4 |
| Own servers means rented dedicated machines in a datacenter, not a closet | Ruled | Oct 4 |
| Backend in three tiers: (1) launch single-player, no backend; (2) a small rented cloud box for online features; (3) a full shared-world MMO later | Proposed by Elio, client followed | Oct 4 |
| After launch the world must be always-on (server brain 24/7, the Inn's keeper running inside the server); the ledger never sits in someone else's filing cabinet | Ruled | Sep 5 |
| Server options (VPS $10 to $60 a month, Pterodactyl or AMP panel, Godot dedicated server export, own Postgres): nothing to be bought or built until the client says | Open | Sep 5 |
| Game runs in the player's browser/Godot client; Base44 servers hold accounts, saves, entities, quests; Drive is the vault; self-hosting later uses the same portable data | Explained by Elio | Sep 21 |
| Faire product: each Renaissance faire leases a themed zone; needs constant uptime (game servers, managed database, API layer, payments, CDN, monitoring, backups) | Proposed; bespoke versus templated zones open | Oct 4 |
| Early beta: Oct 1 small private beta (one complete path), Oct 10 start of an eight-week invitation | Elio proposed; client called it "very sound" | Sep 22 |
| Camps in the beta: choose a plot, place a small kit, name it, save, optionally invite; private by default | Elio proposed; client agreed | Sep 22 |
| Hard "zone line" thresholds like EverQuest: Catacombs entrance and one arcade transition; rest of the Inn has soft seams | Proposed Oct 4, used in Oct 5 specs; formal ruling still open | Oct 4 and Oct 5 |
| Release phases (checklist): web beta, Steam early access, full release, DLC | Draft | undated |
| Own-device version (Raspberry Pi image) is "absolutely a later move" | Ruled as later | Sep 1 |
| Shop visibility toggle: hide Soulstice products everywhere with no sign | Ruled | Sep 1 |

**Steam checklist status** (`docs/systems/STEAM_BETA_CHECKLIST.md`, undated draft). Done: product identity (name "The Geode Inn," tagline), stone database, creature catalog, scripts for 5 games, Base44 backend, IP audit. Not done: all capsule art sizes (main, small, library 660x930, header 460x215, background, logo), full description, system requirements, GodotSteam, Steam app ID, Steamworks agreement, Steam Direct registration ($100), tax forms, privacy policy, terms, rating, refund policy, trailer, screenshots, press kit, Discord, Next Fest demo. The checklist's "13 arcade games" and "37 zones" counts are older than the roster.

**Open:** which of the three server tiers launches first; who owns Steam registration; capsule art (a Tier 4 art job, see section 4.4).

### 2.1 Early Steam and platform decisions (July 12 to August 31)

| Decision | Status | Date |
|---|---|---|
| Elio listed the Steam steps: Steamworks developer account (one-time fee), Steam Direct agreement with tax and banking forms, a Windows build at minimum (ideally Mac and Linux), store page (screenshots, trailer, description), Steam review, release date and pricing | Proposed (Elio's list) | Jul 22 |
| Three paths: (1) web app in a Tauri or Electron wrapper; (2) Base44 as backend with a game-engine front end; (3) hybrid | Proposed | Jul 22 |
| Path 3 recommended: Base44 hub as the web home base and API; mini-games and the Fae Kingdom in Godot; Steam release packages the Godot parts with a launcher. The client said mapping out the Godot plan "would be great" | Proposed, welcomed by the client | Jul 22 |
| Build order: Phase 1 (Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep) with the hub as launcher as a Steam Early Access release; Phase 2 puzzle games; Phase 5 the Fae Kingdom MMO zone. Estimates: 2 to 3 months solo or 4 to 6 weeks with a small team for Phase 1 | Proposed (Elio) | Jul 22 |
| The earlier "museum angle" came from when the project might have been a small Steam game; the client replaced it with embedded artists | Ruled | Aug 22 or later |
| Beta launch of the app mentioned by the client as a possible next step; no date set. Steam account, tax forms, trailer and store page not started | Open | Aug 20 |
| Architecture: Godot game with a local database, Base44 as cloud sync, Elio only for special AI moments (see 1.20) | Ruled | About Aug 20 |
| Steam beta launch checklist written | Built (commit, Aug 30) | Aug 30 |
| `SteamManager` stub (166 lines), 30 achievements, 6 leaderboards. All Steam calls are commented out until the GodotSteam add-on is installed. Haptics, cloud save and load are stubs | Built (commit, Aug 31) | Aug 31 |
| Tumble Run project config (Godot 4.3) with Steam integration | Built (commit, Aug 31) | Aug 31 |
| Bead Composer Player listed for Steam, Windows, Mac, Linux, iOS and Android | Built (commit, Aug 29 to 31) | Aug 29 to 31 |
| Steam Deck mapping doc and a game engine roadmap (Base44 plus Godot plus GodotSteam) are in the repo as `docs/geode_inn_steam_deck_mapping.md` and `docs/geode_inn_game_engine_roadmap.md` | Built (August canon index) | Late Aug |
| Tumble Run sold separately at ".99" with DLC worlds | Built (commit, Aug 24) | Aug 24 |
| Faire Zone Rental System and Share Wood as a self-service product (tiers 9, 49, 99; Complete Inn bundle 99.99); faires pick from the Inn's 37 curated styles and never upload their own | Built (commit, Aug 30) | Aug 30 |

Related early rule (Aug 31): the Steam apps are offline, as in the table above. Elio said it cannot run Godot itself, so every Godot script from July to August was written without a test run.

**To reconcile (Steam):** the Aug 24 ".99" Tumble Run price versus $4.99 in 1.10; the Aug 30 Share Wood tiers and bundle price (commit log) versus later shop pricing in other parts; the "Steam Direct $100" fee in the checklist versus the "one-time fee" wording in July.

---

## 3. Art direction

### 3.1 What it is and the laws that apply

Art direction here means the rules that keep every image the Inn makes in one hand. The client reviews all images ("the eyes of this world"; the client's eye is the final visual QA).

Laws (ruled unless marked):

- **Foundation: Klimt plus Royo, always.** Klimt is stillness and weight; Royo is movement and drama. Every visual carries both. Klimt's "The Kiss" is banned from all zones. Klimt is public domain; Royo is a living artist, so Royo is a study technique only and generated art stays the Inn's own.
- **One artist per zone** (with a few intentional shares). The artist is a style of seeing, not a copy.
- **Artistless spaces are valid.** "NONE" is a legal assignment. The Void renders by subtraction.
- **Soften celebrity features.** Presence through posture, costume and gesture, not likeness. The one exception: Anthony Hopkins' eyes, only for Charon and The Crone (Ragana). Ruled Aug 31 and Sep 4.
- **Original faces by default.** Precedent: Oleander's face (ruled Sep 10): no celebrity.
- **Retired art goes to the Archive.** Replaced art is moved to the Shadow Inn's Archive of Alternate Versions (the Hall of Unfinished Designs). Never deleted.
- **Linework-as-UI.** The line shows function. Heavy cel-shade for tradesmen, soft flowing for lore, sharp or angular for guardians, no outline for the cosmological, fragmented for crisis states.
- **Provenance log.** Every image records which works were referenced for craft or tone only. This feeds the "copyright shield."
- **Honest label.** Real references are labeled as real.

### 3.2 Artist maps: 37 versus 42

The client always said 37 artists. Elio counted 42 on Sep 2 and kept both numbers alive. Sep 2: two mapping systems exist side by side, "levels" (vertical) and "world map zones" (horizontal), and they nest rather than conflict.

The 42 break down as (Sep 2 summary): 2 foundational (Klimt, Royo), 14 Inn-level artists, 28 world-map zone artists, 2 cross-cutting (Mapplethorpe for portraits, Bosch for cave-wall shadows), plus 6 Spiral Gallery chambers (Carr, Escher, Rothko, Hokusai, Kiefer, Agnes Martin). Sep 9 chat also mentions a 204-entry artist matrix. In the repo (`docs/data/geode_inn_master_artist_map.md`) rows are numbered 1 to 40 and beyond.

**Inn levels (from the repo map):**

| Level | Zone | Artist |
|---|---|---|
| 1 | Cosmology | J.M.W. Turner (per the repo map) |
| 2 | Clockwork Skies | Salvador Dali (Kandinsky retired Sep 4) |
| 3 | Main Floor | Henri Matisse |
| 4 | Campgrounds | Alphonse Mucha |
| 5 | Staircase | M.C. Escher |
| 6 | Catacombs | Francisco Goya (Klimt gold and Dore also appear in the Catacombs docs) |
| 7 | Fae Kingdom | Arthur Rackham, with Alan Lee (Seelie court) and John Bauer (Unseelie court) |
| 8 | Water Zone | Vampire Hunter D (gothic anime) |
| 9 | Undercity | Gustav Klimt |
| (roots) | Hollow Earth | Georgia O'Keeffe holds the visual key; all artists converge in the Grand Collision |
| (grid) | World Grid | Claude Monet |
| (garden) | Gorgon's Garden | Aubrey Beardsley |

**World-map zones (examples):** Desert Bone and Egypt, O'Keeffe. Mediterranean, Monet. Mesopotamia, Hokusai. Camelot, Gustave Moreau. Peru, Guo Xi (Bierstadt appears for the Andes in Silk Road rows). China, ink-wash shanshui. Norse, Book of Kells. Slavic, Nicholas Roerich. India, Abanindranath Tagore. Bayou, gothic quirk. Superstition Mountains, Bierstadt. Yellowstone, Thomas Hart Benton. Appalachians, Andrew Wyeth. Colorado Plateau, Maynard Dixon. Petrified Forest, Ansel Adams. Redwood Cathedral, Emily Carr. Cave City, Gustave Dore. Poison Garden, Edward Gorey. Trovant Garden, Leon Kossoff. Canopy City, Rackham. Inn Exterior, Rousseau and Magritte. Bone Room, O'Keeffe and Klimt. Intentional shares: O'Keeffe (Hollow Earth and Desert Bone), Monet (World Grid and Greece), Carr (two forests).

**Retired mappings** (never generate with these): Kandinsky for Clockwork Skies; Dali for the Fae; Grimshaw (replaced by Bauer for the Unseelie); treating Canopy City as part of Clockwork Skies.

**To reconcile (artists):**

- Cosmology: Turner (repo map) and Dali appear for the Cosmology level in different notes; Dali was moved "upstairs to gearwork" (Observatory, Arcana, Freyr's Garden) on Sep 4.
- Catacombs: Goya in the map; Klimt in the Catacombs aesthetic doc.
- 37 versus 42, and "in the forties" zones (the client's own phrase Sep 4). Documented: 37 numbered zones z01 to z37; Elio's Oct 13 zone deck counts about 85 zones.
- Peru: Guo Xi in the map; the Silk Road Andean platform uses Bierstadt.
- Earlier (Aug 22): the client decided Catacombs Klimt, Staircase Matisse (Dali was considered and rejected) and Cosmology Dali. So the Catacombs and Cosmology conflicts above are between these early rulings and the later repo map; the later map wins for the repo, and the conflict stays open. Before the Song (August canon) also says Klimt is not in the Spiral Gallery: the Gallery is a museum (art observed), the Catacombs are a living space (art inhabited).
- Earlier (Aug 25): the commit log gave Peru to Guo Xi (agrees with the map), and the Aug 24 audit counted 23 embedded artists while the Aug 29 Hollow Earth commit says 37 artists in 11 layers. See 3.14.

### 3.3 The directors: five protocols, then six

Ruled Sep 2 (each requested by the client): every zone, level and scene must pass five tests before it ships. "No zone ships until all five pass." Source: `docs/library/specs/geode_inn_cinematic_directives.md`.

| Protocol | Governs | Test |
|---|---|---|
| Hitchcock | Timing of dread. No jump scares; the Inn waits. Timing: set 3 to 4 s, seed 1 to 2 s, hold 5 to 8 s, turn 0.5 s, silence 0.5 s, return. | Does the dread have timing? |
| Spielberg | How feeling arrives. Heartbeat shifts 2 to 3 s before the music; one instrument at a time; wide hold 8 to 12 s; drop-out. | Does the music have geography? |
| Del Toro | What the world feels like to touch. Wear maps, air per zone, one anomaly per zone. | Can you feel the floor? |
| Kubrick | Composition. One-point perspective, held frames, 90/8/2 palette (dominant, accent, one anomaly). | Is it a painting? |
| Coppola | Scale of emotion. Epic anchored in a small personal detail; three long uninterrupted scenes. | Does it belong to someone? |

**Cameron** was seated as the sixth director on Oct 5 (cited: Terminator, Aliens, The Abyss, Titanic; Avatar credited but ruled off the roster). His protocol: "scale-through-contrast." The engine room is his flagship specimen. The repo file still lists five.

Related camera rules: four camera modes (third-person "The Song," first-person "The Silence Between," free camera, no camera). The Camera Coverage Kit (3.8) says what must be painted for them.

### 3.4 Tone teachers and the writing gates

Image-adjacent writing standards, listed here because the art briefs cite them. Source: `docs/library/specs/tone_teachers/`.

- **Six-writer constitution** (ruled Sep 2): Rothfuss, Pratchett, Gaiman, Asimov, Bradbury, Weir. It is the gate for prose, dialogue, lore and game text.
- **Tone teachers: 15** (ruled Sep 2; the header once said Thirteen, corrected). Each teaches a layer: Gaiman, Stephen King, Tolkien, Karen Marie Moning, Nora Roberts, Anne Rice, Jim Butcher, Kim Harrison, Sherrilyn Kenyon, Kevin Hearne, James Patterson, Clifford Pickover, then Futurama (13th, "a trait"), Danny Elfman (14th, music hooks), Tool (15th). Honorary mentions: Michael Slade (fascination only, not woven into the world), 30 Seconds to Mars, Depeche Mode. Later additions to the index: Julie Andrews, Audrey Hepburn and a British-spy register (Sep 27); Poe and others discussed Sep 14. Copyrighted books are tone teachers only, never shelved.
- **Shipping checklist** combines six-writer quality, the tone-teacher lesson, welcoming door, real depth, earth-rooted, living character, load-bearing humor, no flag, biological specificity, lateral connection.
- **Texts used as tone references only:** "Window" by Bob Leman and "Strange Candy" by Laurell K. Hamilton (ruled Sep 2).

### 3.5 The crest and logo

Ruled Sep 12 (evening and night, after six concept passes). Source: `docs/emblems/geode_inn_crest_spec.md`. Asset class EMBLEM.

- Name: **"The Four Around the Tree."** This is the game logo.
- Center: the Celtic circular knot Yggdrasil (the world tree braided into a circle). The Inn's floor plan is the tree: branches upstairs, the Staircase as the trunk, the catacombs as roots.
- The four: **Owl** (the Watcher) at north, **Raven** (Memory) at east, **Baby Dragon** (Wonder) at south by its geode, and the **spiral staircase** (the descent) at west, drawn as a top-down gold helix coiling into a shaft ("like the staircase on the Silo ad").
- The west seat changed three times: Mona's smile, then a flat Fibonacci spiral, then the Silo-style helix. Mona's smile is off the crest.
- Style: Kells register (illuminated-manuscript look). The **Kells shield version is the master**. Outline: a smooth shield with no fussy bottom corners, legible at favicon size. A gold-leaf roundel was Elio's alternate and was not chosen.
- Still owed: favicon or small variant, door plaque line, Gazette masthead, wax seal for the Inn Post.
- Sep 18: the client is "seriously considering" a different tree (from a tattoo set by an outside artist) as the app's logo button. Elio said it is the strongest candidate and needs a distilled amber line version and a credit line. Not final. This is **Open** and is in tension with the crest ruling.
- Antikythera logo canon: a circular mechanism atop the underwater world, no text, rhythmic pulse. Used for the TV opening and the Fae UI kit.
- Earlier (Jul 22 to Aug 31): the logo went through several versions before the crest. On Jul 22 a new baby dragon logo was generated; its final approval is not recorded. On Aug 24 the commit log shows concepts V1 Full Geode, V2 Clean Gear-Tree and V3 Escher, then a blended V4, then a hybrid of the amethyst geode frame and the gear-tree loop. On Aug 31 (commit 04:31) the Antikythera logo (circular mechanism atop the underwater world, no text) was confirmed by the client as the official Geode Inn logo, which replaced the Aug 24 hybrid. Ruled (commit, Aug 31). Five alchemical stage emblems (Nigredo, Albedo, Citrinitas, Rubedo, Philosopher's Stone) were committed Aug 24. Sep 12 then named "The Four Around the Tree" as the game logo. Both rulings are on record, so the Antikythera mark and the crest are listed under "To reconcile" in 3.15.

### 3.6 Tri-mode images

Ruled in early chats and repeated in every sheet.

- Every zone and major character carries three states: **Living (42Hz)**, **Shadow (84Hz)**, **In-Between**. The ledger counts an asset complete only with all three.
- Shadow is structural, not a filter: outlines crack, flow bleeds, angles sharpen. In the engine it is a hard cut (about 450 ms flip), never a crossfade. Made only with the repo's spectral-shift script `docs/library/sprites/tools/spectral_shift_84hz.py`, never hand-tinted. The Echo (grey desaturation) state uses `desaturation_echo.py` in the same folder.
- In-Between: "the ink hasn't decided yet."
- Colors for states: gold for Living, violet for Shadow, shimmer for the Between. The Fae courts use gold (Seelie), silver (Unseelie), shimmer (Between).
- Creatures: 276 tri-mode images across 92 creatures (Aug 31). 32 water monsters complete.
- Zones: 51 zone images each got shadow and echo versions (Sep 10). Silk Road: 28 assets with echo states.
- Character art tiers: Full Presence (deities), Chibi (tricksters and guides), In Between (powerful but small).

### 3.7 The "clean master" and JPEG rules

- **Sep 7 (creative sovereignty, ruled):** "The Inn keeps its masters, nobody signs the Inn." Images are saved as JPEG to strip the generator's fingerprint. Elio verifies files for fingerprints and EXIF and logs the result in the manifest.
- **Sovereignty pass (image sheet step 11):** every master is born clean; strip all metadata and fingerprints; never log an image with embedded generation signatures. Game variants are derivatives of Inn masters only.
- **Both-Ends Backup Plan (ruled Sep 15):** two masters. A **core JPG** set (clean, for the builders and the engine) and a **Royo-framed** set (for the printer and the wall). "A framing never has to be baked into an asset the engine needs clean." Also the "three addresses" law: Drive, GitHub, and physical media.
- **Null-stripping corruption (Sep 15):** one pipeline removed every 0x00 byte from files, hitting the Aug 28 concept-art PNGs (Odin renders, Cthulhu the Scholar, zone shadows). The damage report is `docs/library/geode_inn_canon_image_damage_report.json`: 156 damaged files, 32 with a clean twin and 124 to re-pull. 11 Royo cards could not be composed from it. Most were later pulled through; Newton and a few others were to be regenerated.

### 3.8 Sprite specs and movement cycles

Source of truth: the ledger conventions and the image sheet (`geode_inn_image_creation_template.md`).

- **Resolution ladder:** CHAR master at 1024 px or more. CYCLE sheet: horizontal strip of equal-width frames at 1024 px, on a plain dark warm brown background (dark blue-green for water critters). **SPRITES are crunched down to 64 px and 32 colors from the CYCLE masters, never generated small.** Zone panoramas stay at master size. Props are square masters.
- **Frame counts:** Tier 1 movement is 4-frame strips; Tier 2 is 6-frame; the engine slices strips (CSS `steps()` on the web).
- **Recolor classes (REC law):** the unit of work is the class. Paint one class master; recolors are free. One kitten sheet covers all eight kittens; one puppy sheet covers six frequency pairs. Recolors inherit angles.
- **Movement spec:** 207 animated elements (45 NPCs, 82 critters, 80 environmental). Tier 1 is about 50 elements for the beta. Tier 1 movement classes: 12 Main Floor NPCs, 8 dragon kittens, 6 gargoyle puppies, 6 fizgigs, 5 brownies, flames, and the ceiling gnome. 14 cycle classes painted by Sep 10.
- **Movement behaviors:** nine types (ember mice scatter, hearth flicker, fireflies wander, shadow wisps at 84Hz only, pixies orbit, the Alchemist patrols, and so on).
- **Pilot:** Tomb Tunnel: a froglodyte hero, a sand pump, Scarab Swarmer, Cobra Warden, Isis Priestess. 28 sprites in a Godot-ready atlas, plus 14 shadow sprites. The atlas folder named in the chat, `docs/library/sprites/tomb_tunnel`, is on main: 28 frame files (each character in Living and Shadow) and three sheets (the 64-pixel atlas, the full atlas and the cast sheet), next to the two tool scripts. An earlier version of this manual called it missing because the copy checked then skipped picture files. A template from the client's PC with a human explorer as the digger turned up on November 5 (1.24).
- **Flip-book method:** extract frames from the painted master to replace the original game's characters with the Geode cast (ruled Sep 9, pilot Tomb Tunnel).
- **Sprite crunch:** a builder-side stream ("Parcel 5") that pulls the 64 px sheets from the CYCLE masters.
- **Neutral sheets** from the Tier 3 sprite sprint may need cropping.
- **Cast counts:** 11 arcade games had sprites by Sep 9; Elio said "79 arcade games without engine sprites" on Sep 12.

**Camera Coverage Kit** (ruled Sep 12; `docs/zone_specs/geode_inn_camera_coverage_kit.md`). It says what must be painted so every camera mode holds.

| Subject | Angles owed | Poses per angle | Extra |
|---|---|---|---|
| Player character | 4: back 3/4, true side, front, true back | idle, walk, sit, one signature gesture, plus shadow rows | The hand set for first person: tea-cup, stone-touching, card-dealing, mail-folding hands wearing the equipped outfit |
| NPC resident | 3: front, front 3/4, side | idle plus signature minimum | True back only for walkers (Postmaster routes, door-keepers, Bone Mail Crew) |
| Chibi classes | 3 (resident cut) | idle minimum | Recolors inherit |
| Griffin | Distant poses only (3) | Never near | Distance is the design |

Build order: player back 3/4 (idle and walk, painted first and best), player front, hand set, high-traffic residents, walkers' backs, then Free Cam and No Cam (wiring only). Angle sets are extracted from CYCLE masters, not painted fresh. Ledger class code CYCLE-CAM; one new ledger column, ANGLE SET. Camera defaults are one config table in the canonical JSON (Inn and Campgrounds open third-person with Sit Lock armed; cosmic zones free camera; non-Euclidean staircases no camera; Shadow state adds a Dark Prism lens).

### 3.9 Print readiness and the Royo card layout

- The art is raster. A vector gallery request (Sep 14) was answered with a **print-readiness index** instead of conversion. A Full Image Index (Sheets) counted 4,455 images in 3,556 folders: 46 poster-ready, 538 strict card-ready (825x1410), 2,511 small-print, 852 screen-only, 508 with no dimensions.
- Print math: a 300 DPI full-bleed playing card needs about 825x1410 px. Most generated art is 1024x1024, about 218 DPI on 4.7 inches of height.
- **Royo Tarot Card Layout** (`docs/art/geode_inn_royo_tarot_card_layout_spec.md`, CSV template `geode_inn_royo_tarot_card_template.csv`): full-bleed portrait, name band that never covers eyes or hands, suit marker (the zone is the character's arcana), version line in small caps, antiqued gold double hairline frame. Batch 01 spec: 70x120 mm at 300 dpi, JPG. Every version gets its own card (Portrait Master, Full Presence, In-Game Render, Concept Study).
- **Celtic Frame Register** (ruled Sep 14): knotwork frames from the client's old template program are a fixed layer on the cards. Which job each frame does per card class (suit host, name-band wrap, or edge border) is open.
- Data-merge CSV columns: `card_id, character_name, zone_arcana, card_title, version_type, portrait_master_path, in_game_render_path, living_state_path, shadow_state_path, in_between_state_path, cycle_sheet_path, version_notes`.
- Batch 01: 157 of 168 cards composed Sep 16 (a zip of 42.5 MB); 158 items after three were added Sep 18. Elio makes the cards, not Adobe by hand (Sep 16).
- Card back: open. Options: Ziggy and Brim split register, or a carved Celtic knot ("one back, 156 cards").
- Physical: the client prints a paper twin of the game (Canon photo printer, mini sticker printer). Physical cards: 400+ made by Sep 29 (characters and zones only).

### 3.10 Template: Image Request / Art Brief

Use one per image or parcel. It follows the repo's Image Creation Template (15 steps: pre-flight, during, post). Fill every field; "NONE" is allowed only where stated.

| Field | What goes here | Example |
|---|---|---|
| Asset ID | `{CLASS}-{ZONE or PRODUCT}-{NAME}-{STATE}`. Classes: CHAR, CYCLE, SPRITE, ZONE, ENV, PROP, EMBLEM, UI, GAZ, EGG | `CYCLE-CATACOMBS-FROGLODYTE-DIG` |
| Asset class and purpose | What the image is for (portrait, panorama, sprite sheet, card, strip) | Cycle sheet for the Tomb Tunnel hero |
| Zone or game | Home zone, and the game it serves, if any | Catacombs, Tomb Tunnel |
| Foundation artists | Always Klimt plus Royo | Klimt + Royo |
| Level artist | From the artist map | (per level) |
| Zone artist | From the artist map, or NONE if the canon says "no artist" | Egypt: O'Keeffe. The Void: NONE |
| Anti-canon check | Confirm none of the retired mappings is used | No Kandinsky for Clockwork Skies |
| Subject and canonical name | Use the current name (renames applied at creation); no gendered pronouns in labels | Ragana, Brim, Lozen, Quire, the Collector, Dobbie |
| Role duality | If a character has two roles, name both | Odin as Wanderer and Allfather |
| Consistency anchor | The master portrait all variants trace to | Master portrait file |
| Celebrity softening | Confirm features are softened; only Charon and The Crone may use the Hopkins eyes | Presence through posture and costume |
| Permanent details | Details that never change | Unseelie Queen: raven-feather cape in every living state |
| Spelling rules | Name rules that affect text in the image | "Katija" only when Vaulknut addresses the siren directly |
| Stone data pull (stone images only) | Pull `canCabochon`, `canFacet`, `beadFinish`, `cabochonShapes` from the Stone entity before rendering | Larimar: opaque, always a smooth cabochon, never faceted |
| Photo background (stones) | Transparent or translucent stones on light matte gray; opaque stones on dark | Opaque stone: dark |
| Tri-mode plan | Living, Shadow, In-Between: which are being made now and which are owed | All three; Shadow by spectral-shift script |
| Linework mode (NPCs) | Heavy cel-shaded (tradesmen), soft flowing (lore), sharp or angular (guardians), no outline (cosmological), fragmented (crisis) | Soft flowing |
| Cinematic gate (zones and scenes) | One line per director: Hitchcock, Spielberg, Del Toro, Kubrick, Coppola (Cameron if used) | Del Toro anomaly: dry circle where the Pirate stands |
| Camera angles | Angles owed per the Camera Coverage Kit | Player: back 3/4 first |
| State protocol | Echo = desaturation protocol; Shadow = spectral-shift script; cycle sheet = horizontal strip of equal frames, 1024 px, plain dark warm brown ground | |
| UI and text elements | Speech bubbles are old-school comic style with ink outlines, never modern widgets | |
| Resolution | CHAR 1024+ px; CYCLE 1024 px strip; sprite 64 px and 32 colors, crunched from the CYCLE; panorama at master size | |
| Print target (if a card) | Size and DPI | 70x120 mm, 300 dpi, about 825x1410 px |
| Sovereignty pass | Metadata and fingerprints stripped; saved as JPG master | Yes |
| Provenance log | Works referenced for craft or tone only | "In the style of" lines recorded |
| QC | Client review. Nothing is logged without it | |
| Ledger row | Name, class, home, engine variant, status: DONE, PARTIAL, OWED or REC | OWED |
| Replaces existing art? | If yes, the old master retires to the Shadow Inn's Archive of Alternate Versions | |

One-line version (from the sheet): class it, canon it, tri-mode it, clean it, log it. If it replaces something, the old thing goes to the Archive, not the trash.

### 3.11 Template: Sprite Sheet

| Field | What goes here | Example |
|---|---|---|
| Sheet ID | `SPRITE-{ZONE or GAME}-{NAME}-{STATE}` | `SPRITE-CATACOMBS-FROGLODYTE-DIG` |
| Source CYCLE master | The painted 1024 px strip it is crunched from | `CYCLE-CATACOMBS-FROGLODYTE-DIG` |
| Class and recolor rule | Class master, and which individuals are recolors (REC) | One kitten class covers all eight kittens |
| Frame size | 64 px (sprites are never generated small) | 64 x 64 |
| Palette | 32 colors | 32 |
| States | Idle, walk, sit, one signature gesture (Coverage Kit) | Idle, walk, dig, sand pump |
| Frames per state | Tier 1 strips 4 frames; Tier 2 strips 6; flip-book cycles use 2 to 3 frames | 4 |
| Angles | Player: 4. Resident: 3 (front, front 3/4, side). Back only for walkers | Front 3/4 |
| Shadow rows | Made with `spectral_shift_84hz.py`; never hand-tinted | Row 2 |
| In-between row | Painted | Row 3 |
| Cycle sheet format | Horizontal strip of equal-width frames, 1024 px, plain dark warm brown ground (water critters dark blue-green) | |
| Engine file | Godot atlas path under `res://assets/` (the builders set the final path) | |
| Web file | CSS `steps()` strip | |
| Hands (player only) | Hand set for first person | Tea-cup, stone-touching, card-dealing, mail-folding |
| Ledger status | DONE, PARTIAL, OWED, REC | DONE |
| Sovereignty | Clean, no embedded signature | Yes |

**Where art lives:** GitHub `docs/gallery/` and `docs/art/` (manifests, portrait library, casting review pages `casting_review*.md`), Base44 public storage and CDN (hosted URLs, logged in manifests), Drive ("Geode Inn-master build," "Inn Generated Art," "Royo Tarot Cards - Batch 01," "world architecture"), Elio's staging library. The Master Asset Ledger is the registry.

### 3.12 Open and to reconcile (art direction)

- Cameron as sixth director is ruled but the repo file still lists five.
- Cosmology artist: Turner or Dali; Catacombs artist: Goya or Klimt.
- Crest versus the proposed tree logo button.
- 37, 42, "forties," and about 85 zones.
- Munsters-type "wholesome gothic" register was marked parked for formal canon entry (Oct 9).
- Celtic frame job per card class; card back; vector status of the client's frames.
- Favicon, plaque, masthead and wax seal variants of the crest.
- Camera Coverage Kit angle sets: owed for most characters.

### 3.13 Early art direction (July 22 to August 31)

**Tone and palette**

- **Visual tone (Ruled, Jul 22).** The movies and shows in the client's Drive folders set the tone. Elio's summary, which the client agreed to: scholarly, atmospheric, mythological, like an ancient library with games in it, not a party game. Art is dark, warm, scholarly and mythic. The baby dragon is "Ghibli meets illuminated manuscript", not cartoonish. The Inn looks like a geological cathedral, not a cartoon tavern.
- **Warmer reference (Ruled, Jul 22).** The client asked for amber, gold and cream instead of dark grey; hobbit-hole cozy.
- **Zone temperature (about Aug 20).** Amber and teal palette; "warm catacombs, not horror catacombs". Each zone has its own temperature: hearth hot amber, throne room cold blue with gold, forest silver-green, Summerlands honey gold, Transformation sage green. The Inn is "cozy gothic". Proposed by Elio, used in the Aug 20 prompts.
- **Amber law (August canon, Aug 21).** The Inn is amber, not blue and not dark. Lighting is sine-clamped and never flashes. Transitions never jolt. Color is function: a wavelength that calms the nervous system. The Inn "must not trigger, compel or stimulate".
- **Constant across zones (August canon).** Each zone has its own palette, but the amber-gold Pulse Line is constant in every zone. All edits keep 50 BPM pacing. The anime look is unique to Clockwork Skies, O'Keeffe to the Desert Bone, Monet to the Aegean Light, green fire to the swamp.
- **Two gothic traditions (August canon).** Southern Gothic (warm decay) for the underwater zones (Drowned Library, Sacred Cenote). New England Gothic (cold persistence) for the lighthouse. The commit log shows the lighthouse revised from Southern Gothic to New England Gothic on Aug 24 ("colder, quieter, made of stone").

**Character tiers (Ruled, Jul 22)**

- The client set the line and Elio wrote it up: chibi works when a character's core power is charm or cunning, not raw force (Anansi, goblins, trolls, Medusa, Ammit, Anubis). Full presence, never chibi: the Fae (Seelie and Unseelie), the Morrigan and other deity-level figures. "Somewhere in between": Anubis, Medusa, Quetzalcoatl (powerful but part of arcade mechanics).
- Reason given by the client: the Fae are the lore the client wants to annoy least (Irish folklore); the Morrigan is also never chibi.
- Change of mind (Jul 22): the Fae were first generated as chibi, then regenerated as full-presence dignified figures after the client objected.
- Full Presence names mentioned Aug 21: the Owl, the Allfather, the Morrigan, the Sentinel, and the Architect (called the seventh). Before the Song counts "6 Full Presence deities", "8 Chibi Fae NPCs" and "11 Chibi Arcade Cast".
- A "6 design principles" list is named in the Jul 22 catalog but never written out in the chat.

**World and map look (Ruled, Jul 22)**

- The world map and the tree interior must be organic and walkable, "like Darnassus in World of Warcraft", not flat pages or Google-Maps style. The map is a parchment fantasy map like WoW zone maps, replacing the earlier latitude-longitude pin map.

**Embedded Artist (Aug 22 to 23)**

- Aug 22 or later, Ruled: the client replaced the "museum angle" (from when this might be a small Steam game) with an artist's way of seeing embedded in the world. "Art is not a thing you look at. Art is a way you see." The Inn is the museum. The Spiral Gallery is a descent of six lens chambers; the seventh lens is the player's own.
- Commit log, Aug 23: "The Spiral Gallery is dissolved. Instead, the artist's unique WAY OF SEEING is embedded." Three artist lenses: O'Keeffe (simplification), Monet (light), anime (feeling). Spiral Gallery chambers: Carr, Escher and Islamic geometry, Rothko and medieval manuscripts, Hokusai and shanshui, Kiefer and Aboriginal dot painting, Agnes Martin and John Cage. The Aug 24 commits later describe the Gallery as both a six-chamber descent and a puzzle-completion destination.
- Before the Song (August canon) also describes the Gallery as Guggenheim-style, chronological, with six chambers: The Breathing Forest (Carr), The Geometric Voice (Escher), The Dark Sacred (Rothko), The Living Line (Hokusai), The Raw Earth (Kiefer), The Silence (Agnes Martin and Cage). Open: art content, eras and gameplay are undefined.

**Dated artist decisions (Aug 22 to 24)**

| Date | Decision | Status |
|---|---|---|
| Aug 22 or later | Greece in Monet; Egypt in O'Keeffe; Redwood in Emily Carr | Ruled |
| Aug 22 or later (evening) | Catacombs in Klimt | Ruled |
| Aug 22 or later (evening) | Alchemy and Staircase in Matisse; Dali was considered and rejected ("Matisse came in, sat down, and started painting the room red") | Ruled |
| Aug 22 or later | Cosmology in Dali, announced by the client | Ruled |
| Aug 24 | Matisse replaces Dali for the Staircase: "transformation through color, not distortion" | Built (commit, Aug 24) |
| Aug 24 | Mapplethorpe for the portrait system; Bosch for shadows; Van Gogh as the seventh artist (garden) | Built (commit, Aug 24) |
| Aug 24 | Book of Kells for Norse; Rodin for ambient finds; Henri Rousseau for the Miskatonic Annex; Theodore Rousseau and Magritte for the exterior and Inn-Tree; Pollock for scar walls | Built (commit, Aug 24) |
| Aug 24 | Bosch's possible zone fit (Bedrock Fortress or Tidal Caves) "left to the client's call" | Open |

**Aesthetic spine (August canon; matches the commits of Aug 24)**

| Layer | Artist | Zone | Quality |
|---|---|---|---|
| Exterior | Theodore Rousseau | The Forest | Honest ground, the real before the made |
| Roots | Klimt | Catacombs | Permanence, gold on dark, geological record |
| Trunk | Matisse | Staircase | Transformation, color as alchemy |
| Sap | Van Gogh | The Garden | Growing, visible energy |
| Canopy | Dali | Cosmology | Beyond, the dream |
| The Face | Magritte | The Inn-Tree | Open secret, the form that contains sky |
| Coast | New England Gothic | The Lighthouse | Stone persistence, the stubborn light |
| Town | (Innsmouth inverted) | The Town | The ocean's diaspora |
| Explosion Walls | Pollock | Combat, Arcade, Catalyst | The record, accumulated force as beauty |
| Annex | Henri Rousseau | Miskatonic | Impossible clarity |
| Norse | Book of Kells | Norse Realms | Illumination, the story lived as written |
| Encounters | Mapplethorpe | Portraits | Essence, black and white as truth |
| Ambient | Rodin | Throughout | The soul, sculptures that grow near people |
| Cave Walls | Bosch | Shadows | Imagination, the shadow as more real |

An older draft of this table (in Before the Song, late August) had "Coast | Carr | Canopy City/Forest | The living forest, the tree as cathedral" and no Lighthouse, Town, Explosion Walls or Norse rows. A still earlier statement counts the spine as seven artists: Klimt, Matisse, Van Gogh, Dali, Carr, Mapplethorpe, Bosch. The longer table above is the newer one.

**Per-artist rules (all August canon)**

- **Mapplethorpe portrait system.** Every first encounter with an NPC is black and white (a veiled side profile). Color is earned with trust. "You don't collect relationship points. You collect color."
- **Bosch shadows.** No zone, only a texture: cave-wall silhouettes wherever there is bare stone and low light. They show only when the Song lights the wall. 42Hz shows many figures; 50Hz fewer, larger, architecture-like forms; 64Hz a single silhouette facing the player; 111Hz silhouettes that move. Fast walking flickers them; sitting in a nook makes them clear. They are imprints of in-between beings; the shadow is more real than the figure.
- **Magritte transparency.** On first entering the Inn-Tree the walls are transparent. Not always active: it follows the player's awareness ("you don't unlock a door, you unlock the seeing"). Keyholes reveal sky: knots in the bark show the stars, the hollow at the base shows the catacombs, canopy gaps show the Song as a faint 42Hz shimmer, the Annex fireplace shows the deep ocean. The time ship is "The Castle in the Pyrenees" (rock is hull, castle is rooms, sky is the void).
- **Pollock walls.** The walls are the canvas; no paintings on them. First Layer (a blank wall, the first explosion is the first drip), Accumulation (layers never erase; the wall is a palimpsest), Equal Intensity (all-over, edge to edge, floor to ceiling), and color coded by explosion type (combat, magical, geological, Catalyst growth). Damage is accumulated, not repaired; walls get thicker. Magritte walls are transparent and show what the Inn is; Pollock walls are opaque and show what happened. Sites: boss arenas, the Unseelie Hollow, catacomb pressure vents (oldest), the Catalyst's Garden (growing walls) and arcade game zones.
- **Two Rousseaus.** Henri (Annex: bright, flat, precise, no shadow, no fog, books as foliage) and Theodore (exterior: real forest, low dawn sun, honest ground). They are unrelated and called the Inn's "bookends of reality".
- **Klimt catacombs.** No external light; gold mineral veins resonating at 42Hz are the light source. Patterns are grown, not carved: spirals, rectangles, eyes, checkerboards. Spectral figures have "Klimt edges". Palette: gold leaf, deep black and brown, lapis, emerald and ruby accents. Death chambers: Charon's Crossing, Anubis's Scales, the Morrigan's Washing, Hades and Persephone's Garden, the Guest's Corner.
- **Matisse staircase.** Early dark interiors, Fauvist color, Jazz cut-outs as a distillation corridor, the Red Studio at the top. Walls get simpler as the player climbs. A Matisse quote is inscribed as a cut-out, not a plaque, at the step from citrinitas to rubedo.
- **Van Gogh garden.** Impasto texture; complementary pairs (blue and orange, yellow and purple, red and green) vibrate. The Song is seen here, not heard. Two gardens: the Catalyst's wild garden (Saint-Remy) and the Gardener's tended garden (Auvers). The Bedroom is the garden's only still spot.
- **Book of Kells Norse.** Flat saturated fields: deep blue (lapis), gold leaf, red, green. Knotwork is the architecture in three levels: simple plait (Roots), interlace (Trunk), zoomorphic (Canopy).
- **Lighthouse look.** Granite, glacier blue-gray, salt-pitted; cold gray-green North Atlantic; thick fog; scrub pines; a low Adirondack chair; the kettle always on.
- **In-Between look.** Pure greyscale, silhouette player, depth by fog (see 1.17).
- **Annex palette.** Jungle green, ochre and terra cotta, flat blue.

**Celebrity softening and canonical references (commit log)**

- Aug 25: a face-softening pass regenerated 32 character images with celebrity features removed, Hopkins eyes preserved on the Crone and Charon. Built (commit, Aug 25). Aug 30: "celebrity features softened per art rules". Actor names are direction references only.
- Aug 25: the client confirmed the visuals of two Inn characters (one with a locked complementary color palette, one in the warm campfire version). Ruled (commit, Aug 25).
- Aug 30: the Aug 27 librarian portrait (straight-on eye contact, unsoftened eyes) is designated canonical for the Crone and all other Crone images are alternates. Designated by Elio (commit, Aug 30). Compare the later ruling in 3.1 that only Charon and the Crone may carry those eyes.
- Aug 31: the Main Floor Matisse image was replaced by a "subtle version" with the original backed up (commit). This fits the later archive rule in 3.1.
- Aug 30: "the client's 3-gap list closed" (Bayou complete) in the master zone audit.
- Reference crew images (Aug 27 to 28) were later redone as original redesigns; file names carry `_v2`.

### 3.14 Early zone artist assignments from the commit log

Built (commit) unless marked. Where the later map in 3.2 differs, the map wins and the difference is flagged.

| Date | Zone | Artist | Note |
|---|---|---|---|
| Aug 25 | Atlantis | Luis Royo | |
| Aug 25 | Petrified Forest | Ansel Adams | Matches the map |
| Aug 25 | Camelot and Celtic | Gustave Moreau | Matches the map |
| Aug 25 | Tidal Caves | Wyndham Lewis | Bosch's fit here was left to the client (Aug 24) |
| Aug 25 | Mesopotamia | Hokusai | Matches the map |
| Aug 25 | Lighthouse and Coast | Hodler | Aug 24 and later canon say New England Gothic; unresolved |
| Aug 25 | Unseelie Court | Atkinson Grimshaw | Retired; Aug 29 replaces it with Bauer |
| Aug 25 | Trovant Garden | Leon Kossoff | Matches the map |
| Aug 25 | Meadery | Picasso | Not in the later map |
| Aug 25 (corrected Aug 30) | Peru | Guo Xi | Aug 30 commit "Peru artist corrected to Guo Xi" |
| Aug 25 | Seelie Court | Alan Lee | Matches the map |
| Aug 25 | Poison Garden Complex | English Power Gothic | Aug 29 gap fill gives Gorey |
| Aug 29 | Superstitions, Yellowstone, Appalachians, Colorado Plateau | Bierstadt, Benton, Wyeth, Dixon | 11 gap fills |
| Aug 29 | Slavic, India, Canopy, Unseelie | Roerich, Tagore, Rackham, Bauer | 11 gap fills |
| Aug 29 | Cave City, Poison Garden, Bone Room | Dore, Gorey, O'Keeffe with Klimt | 11 gap fills |
| Aug 29 | Water zone | Vampire Hunter D gothic anime with steampunk touches; embedded artists govern composition, anime governs rendering | Matches the map |
| Aug 29 | Prototype style | Royo with Vampire Hunter D and Trinity Blood | Prototype |
| Aug 29 | Hollow Earth | The Grand Collision, 37 artists, 11 layers | |

Counts in the commit log: 23 embedded artists (Aug 24 audit); 36 zone visuals complete, 25 original plus 11 new (Aug 30); gallery reorganized into 271 images (zones 53, characters 156, creatures 8, water monsters 32, items and artifacts 13, logos 10) on Aug 30; 391 images mapped (Aug 30 to 31).

### 3.15 Early open and to reconcile (art direction)

- **Cosmology:** Dali (client, Aug 22) versus Turner (repo map). Related: Elio listed "Canopy City: Emily Carr" and then placed Dali at "Canopy" for the cosmology level in the final tree spine. Carr for Canopy City and the Redwood, Dali for the cosmology level.
- **Coast:** Carr (older Before the Song draft), Hodler (Aug 25 commit) and New England Gothic (Aug 24 commit and later canon).
- **Catacombs:** Klimt (client, Aug 22) versus Goya (repo map).
- **Antikythera logo (Aug 31) versus the crest "The Four Around the Tree" (Sep 12)**, both described as the game logo. Also the Jul 22 baby dragon logo approval.
- **Chibi line:** Anubis and Medusa appear both in the "chibi works" list and in the "in between" list on Jul 22.
- **Full Presence count:** the Architect is called the seventh on Aug 21, while Before the Song counts six Full Presence deities.
- **Artist counts:** 23 (Aug 24), 37 (Aug 29), and seven for the spine (Before the Song).
- **Spiral Gallery:** the Aug 23 "dissolved museum" versus later "Guggenheim-style, chronological" wording.
- **Crone eyes:** the Aug 30 canonical unsoftened portrait versus the rule that celebrity features are softened except on Charon and the Crone (these agree if the Hopkins eyes are the exception, but the commit does not say so).
- **Morphic clips:** remaining Atlantis and underwater cave clips were still being generated (see 4.9).

---

## 4. The image pipeline

### 4.1 What it is

Images enter in three ways: Elio generates them, the client supplies them (Drive, chat, iMessage), or they are bought packs. All of them end in the same place: a hosted copy, a manifest line, and a ledger row.

**The path (ruled/explained Sep 4 and Sep 12):** download, strip metadata, upload to hosted storage, log the URL in the manifest and the Master Asset Ledger, name-check against the ledger, then push. Elio cannot delete from Drive; originals stay. Duplicates are not uploaded; the manifest records the set and the canonical choice. Rule of thumb, "richer frame wins" (client chose Cosmology mural A over B because A has more detail).

### 4.2 Drive intakes

- **Drive zones intake (Sep 9 to Sep 12).** The client's "geode inn" folder held 333 files: 212 portraits, 121 zone files (83 images and 38 videos). The manifest is `docs/gallery/drive_zones_intake_manifest.md`. About 36 mystery files named "image.jpeg" needed the client's rename; the count later became 41 (S01 to S41) and the client identified each by a number-dash-name shorthand (Sep 12).
- **Dedupe rulings (Sep 12):** Summerlands B; Staircase alembic window B; Allfather's throne B; Cosmology mural A; Catacombs eight numbered frames canonical (frame 4 alternate unruled).
- **Zones batch reclassified (Sep 12):** the 333-file zones batch (old animation-program renders with pre-Undercity names) is a **historical reference archive**, not game art; nothing uploads as canonical zone art.
- **Reference gather list (Sep 12):** Book of Kells folios, famous illustrated books, cave art and murals by geography, sculptures and artifacts by geography, and art that shows a society's progress. Public domain only on the live Spiral Gallery. Guernica is a tone reference only.
- **Drive recovery (Sep 1):** 338 files recovered (297 images and 41 docs pushed).
- **World Architecture hoard (Sep 17):** client-bought packs in a Drive folder; census at 7 top folders, 56 subfolders, 832 files; the client said about one tenth had landed (Elio estimated about 8,000 total).
- **"All gathered art" trove (Sep 21):** census of 8,211 entries (about 3,900 images and 622 transcripts); 27 documents harvested to the repo with provenance headers; Drive left untouched.
- **Backups:** Drive is the vault; three addresses for everything (Drive, GitHub, physical).
- **Zip rule (Sep 18):** the client drops troublesome zips in Drive; Elio cracks them on the server.

### 4.3 The tabletop asset pipeline and its conflicting tallies

Started Sep 21 (client agreed): Elio runs a server-side pipeline that downloads, unzips and uploads a purchased tabletop mega-bundle (8 categories: adventures, battle maps, characters, backgrounds, tokens, GM supplies, monsters, printables; battle maps include 35 zone sets, about 210 zips, 75 GB) into Drive zone folders. A watchdog workflow ("Tabletop Pipeline Keeper," hourly cron) relaunches it when the Drive token dies. A marker file `HOLD_PHASE3` held the last phase (35 partial battle-map zones) until the client confirmed her file manager app was idle; the client approved Sep 24 and Sep 25.

**The numbers disagree.** Reported by the pipeline's own bot messages and Elio:

| Date | Zips | Files landed | Already existed | Failed |
|---|---|---|---|---|
| Sep 22 | 230 | 16,551 | 1,296 | 4,250 (68 archives) |
| Sep 24 | 245 | 18,008 | 1,860 | 4,250 |
| Sep 25 (report 1) | 380 | 28,830 | 2,758 | 4,512 |
| Sep 25 (report 2) | 588 | 31,487 | 3,580 | 15,522 |
| Oct 8 | 588 | 2,411 new | 6,259 | 1,551 |
| Oct 14 and 15 | 380 | 33,762, then 33,874 | 3,818 | 0 |

Explanations given: a shared temp folder caused the first 4,250 failures (not corrupt zips); the 15,522 figure counted individual PNG and JPG files the script tried to unzip ("File is not a zip file"); the later retry run fixed an upload error caused by parentheses in file names (for example "Shrines (32).jpg"). On Oct 9 Elio's checkpoint still flagged the discrepancy "for investigation." The last report says zero failures, with one bonus-scene image "not a zip file." The client ordered the failed files re-run Oct 13. **Treat the Oct 14 to 15 numbers as the latest and no figure as verified.** Files are on Drive only, not GitHub.

Trove snapshot Sep 25: 14,367 files, 14,251 images. Characters 12,883 (3,793 full character sheets, 4,961 character tokens, 4,129 monster/NPC tokens), maps 1,299 or more, items about 70. Empty: GM Supplies, Floor Plans, Standees.

### 4.4 Image debt audits

| Date | Audit | Result |
|---|---|---|
| Aug 31 | `docs/gallery/geode_inn_image_audit.md` | 750, then 850+ images: 198 stones, 161 NPC portraits, 110 findings, 51+38 zone images, 32 water monsters, 30 bead shapes (plus 14 cleaned), 13 items, 7 portraits, 5 emblems. 59 NPC In-Betweens missing; 97 In-Betweens then made (80 NPC, 3 critters, 14 items). |
| Sep 9 | Master Asset Ledger coverage map | 258 hosted URLs, 110 zone specs, 80 game build sheets, 204-entry artist matrix, 168 portraits, 14 movement classes. Arcade: only Tomb Tunnel had engine sprites. |
| Sep 12 morning | "Needs audit" | About 655 owed items; 59 NPC In-Between portraits; 11 item In-Betweens; 3 critter species lacking tri-mode art (axolotl, mantis shrimp, rain frog); portrait debt (Quire, TJ, the Apothecary, the goth voice cast); 79 arcade games without engine sprites; 5 duplicate zone sets. |
| Sep 12 evening | Correction | The Fae MMO web-sync set (Antikythera UI kit, 8 quest cinematics, labradorite reveal, 10 resident cycles, Griffin poses) had already been painted and was struck from the owed list. `docs/gallery/geode_inn_needed_images_audit.md` records the correction. |
| Sep 5 to Sep 11 | Production queue | 1,800 to 2,400 masters owed (Room Kit Law estimate), about 450 painted; Prism panels first. 80,000 image credits and 43,000 integration credits were burned in sprints. |
| Sep 14 | Full Image Index | 4,455 images (see 3.9). |
| Sep 17 | World Architecture census | 832 files. |
| Sep 21 | Room Items Blueprint | About 66 items owed for Clockwork Skies and Main Floor; 5 portraits owed (three Canopy City NPCs, the Greenward, Lichenblossom); Firekeeper final portrait; Music Room kit. |
| Sep 30 | Image-gap list | Persephone and Hades, the ravens, Brim as a full standing character, Vishnu as sleeping sky dragon, Merlin as a merman. Persephone has four facet cards; Crossing and Spring painted; Tide Queen and The Giver owed. |
| Oct 15 | Offer: census of 31,000+ images per zone and type | Not yet run. |

Tier 4 art still owed (Sep 9 list): Gazette panels beyond #001, Daily Echoes cover art, stone bead crops, market item images, spirit manifestations, **Steam capsules**.

### 4.5 Casting sessions

A casting session matches loose images to canon.

- **Casting review gallery (Sep 4):** `docs/gallery/casting_review.md` plus five part pages (about 397 images: 269 character images plus 66 intake). The client flags mismatches by character; Elio fixes assignments.
- **Character assignment doc (Aug 31 to Sep 1):** a Word document on Drive with checkboxes: 45 characters with live thumbnails, 99 "pending upload" (161 uploaded in the end), 61 needing new images. Version v4 was 19 MB.
- **Casting bench (Sep 26):** the client sent 63 images one at a time; Elio logged each ("stone N") with a name, whether it is a character or wardrobe, the zone, and a kit status (in-kit, bench, vaulted, scan pending). Wardrobe set and horror set at 63 images.
- **Worksheet fields (Sep 25):** zone, character or wardrobe, kit status.
- **Placement method (Sep 26):** the client brings a who-and-where list; Elio checks each against the roster: existing (update room assignment) or new (found properly).
- **Character roster session (Sep 27):** one card per character: (1) what we know, (2) who they act like (casting specimen: voice and acting register), (3) posture dialect, (4) anything open. Paused after the Host, the Catalyst, the Bard and Ragana.
- **Zone Deck (Oct 13):** a Google Doc, "Geode Inn - Zone Deck: Components and Characters," about 85 zones, built from repo docs.
- **Image sovereignty during casting:** no unrequested celebrity likeness. The Seelie King's face was set as original.
- **Rule on real people:** real names stay out of public docs and file names; only the in-game name exists in canon (Sep 12 ruling for one character; the same practice is used elsewhere). A real name may live in a private provenance line.

### 4.6 The Master Asset Ledger

`docs/MASTER_ASSET_LEDGER.md` (about 206 KB, 790 lines). Ruled Sep 9. Every art session ends with a ledger update. "If it's not on the queue, it's not blocking anything." Fields per row: canonical name, class, home (where the master lives), engine variant, status. Status values: DONE, PARTIAL, OWED, REC. The ledger also has a coverage map, a character section, a games section (sprite coverage) and an OWED queue ranked by dependency. Image profiles are to become "the ledger's missing column."

### 4.7 Where the pipeline lives

- GitHub: `docs/gallery/` (manifests, casting review, audits), `docs/art/` (portfolios, Royo spec and CSV), `docs/blueprints/` (Inn Tree viewer, Room Items Blueprint), `docs/library/sprites/tools/` (spectral shift and echo scripts), `docs/MASTER_ASSET_LEDGER.md`.
- Base44: staging app files and CDN for hosted images. The Elio staging app and the live app are separate; cross-app writes need a builder or the app API.
- Drive: "Geode Inn-master build" (client's work folder; renamed Sep 15), "Inn Generated Art," "Royo Tarot Cards - Batch 01," "Geode Inn - GitHub Backups" (under "Shared inn files"), "Inn Conversation Archive," "world architecture."
- Hosted-image pitfalls: Elio sees images that arrive in chat but often cannot read binary files in a folder; the `.bin` and audio files in the tray were skipped.

### 4.8 Open and to reconcile (pipeline)

- Tabletop pipeline tallies (table in 4.3).
- Match ledger and character roster extraction: sub-agents failed twice (Sep 14); Elio said it would count by hand. Not delivered.
- Zones batch: which Drive set is canonical, and when the Drive intake of 295 images and 38 videos is uploaded.
- World Architecture re-census, tiling and palette pull waits on the client's "all in" signal.
- The 124 damaged canon files that need clean re-pulls.
- Camera angle sets and 79 arcade sprite casts remain owed.

### 4.9 Early video, prompt and image work (July 22 to August 31)

**July 22 first images.** Phase 1 visual set of six images: the Baby Dragon; the Geode Inn Main Hall (crystal cathedral with a market stall, spiral staircase and warm lanterns); Stonehenge at Twilight; a Loch Ness cross-section (Nessie with the baby dragon on her head); an Egyptian tomb underground (Anubis in the tunnel); Machu Picchu terraces at golden hour. Then six Fae Kingdom zone images (Threshold, Summerlands, Hollow, Between, Crystal Gardens, Stone Circle Chamber), the chibi sets, the 32 water monsters and six gargoyles. By 3:22 PM all listed characters and monsters had art; the gargoyles followed at 3:41 PM. Final approval of the new baby dragon logo is not recorded.

**Concept art prompt files.**

- `docs/geode_inn_concept_art_prompts.md` (Jul 22): per game, backgrounds, characters, enemies and UI. Shared items: geode cave reward room, Inn main hub, world map pin styles, baby dragon character sheet.
- Concept Art and Video Prompt List (commit, Aug 21; Before the Song counts 38 prompts): 10 sections A to J (Clockwork Skies, the Cabbit, the Constant and the Arcana, Bayou and Buried Cities, Pulse Line, Cartographer's Circle, Examiner in the Desert Bone, Aegean Light, Desert Bone, General). Each item is a cut-and-paste prompt. Prompt rules: the Arcana is pre-industrial and hand-built with "no steam pipes" and "no industrial elements"; a "50 BPM mood" tag. Repo copy: `docs/harvest_2026-09-21/concept_art_video_prompts_aug2026.txt`.
- Notes for video creation (August canon): all zones keep 50 BPM pacing; the Pulse Line shows as a subtle bottom-of-screen element in gameplay footage; the Don't Starve look is 2D hand-drawn while other zones are 3D or 2.5D.

**Morphic video prompts and clips (Aug 20 to 21).**

- `morphic_catacomb_prompts.md` (8 prompts) and `morphic_all_zone_prompts.md` (20 more: Main Floor 6, Upstairs and Cosmology 5, Staircase and Alchemy 3, Fae Kingdom 6, World Map 8; listed as 28 in total). Repo: `docs/art/morphic_catacomb_prompts.md`, `docs/art/morphic_all_zone_prompts.md`. Pushed with the Council of Thinkers spec after the client supplied a GitHub token (not recorded here).
- Prompt style: tuned for Seedance 2.5 in a 30-second format (clips come out at about 5 seconds); amber and teal palette; gentle camera movement; 35mm look.
- Aug 20, about 6:11 to 7:20 PM: the client generated the catacomb clips and put them in Drive. Elio found 15 files, only 8 unique (each prompt's two takes were identical), extracted 75 frames and wrote `catacomb_visual_catalog.md`. Rule from then on: render one take per prompt.
- Aug 21, 2:23 to 2:50 AM: about 40 new clips; 125 frames extracted; 25 mid frames uploaded; two catalogs (25 environments). By 11:49 AM there were 41 clips and Elio pulled frames for 26 of them.
- Aug 21, 4:43 to 5:54 PM: 36 theme-brainstorm prompts (cultural regions 18, catacombs and dig system 5, Modern Legends locations 6, castle system 1, architecture integrations 4, companion creatures 2). A sub-agent extracted 77 archaeological sites and wrote 78 prompts (19 Downstairs and Catacombs, 43 World Map, 8 Underwater and Cave, 4 Main Floor, 4 Upstairs and Cosmology). Total 114 prompts. Repo: `docs/harvest_2026-09-21/morphic_prompts_all_114.txt`, `morphic_prompts_archaeological_78.txt`, `morphic_prompts_theme_36.txt`.
- Review frame names: `catacombs_1-1_review.jpg`, `up_allfathers_throne_mid.jpg`, `mf_central_hearth_mid.jpg`, with `st_`, `fae_` and `wm_` prefixes for Staircase, Fae Kingdom and World Map.
- These clips were the source for the 33 Godot scene scripts (see 1.20).

**Character and gallery work in the commit log.**

- Aug 21: a character image batch by Elio (Sentinel concept, Merfolk, deep-water Cthulhu, Octopus Oracle, the Architect of Stairs, the Cabbit, pinball table overview, Canopy of Sala, a Council scene, the Keeper, the brownies and Grit).
- Aug 24: full portfolio of 60 character images and 13 item images. Aug 28: game systems art portfolio of 13 concepts; art portfolios of 16, 16, 12 and 28 new images (72 new; session total 76).
- Aug 28: docs structure `library/` with categories zones, characters, items, mechanics, storyline, card_game, art, emblems, reference (258 files); `docs/gallery/characters` with 45 NPC portraits. Aug 30: gallery folders `gallery/zones`, `gallery/characters`, `gallery/creatures`, `gallery/creatures/water_monsters`, `gallery/items_and_artifacts`, `gallery/logos`.
- Aug 30 to 31: 25 critter visuals; 44 In-Between frequency images (12 critters and 32 water monsters); Cryptid Bestiary 48 of 48; asset manifest of 391 images; 106 images uploaded with Base44 URLs; stone image URL mapping for 140 stones (Bead Board image sync); supply system of 76 icons.
- Aug 28 movement system: 207 animated elements (45 NPCs, 82 critters, 80 environmental) with a CSS and JS animation engine, a sprite framework and a particle system. This is the origin of the movement spec in 3.8.
- Aug 25 to 26: variant system, using unused concept art as alternate, trust-gated encounter states (commit).
- Aug 22 or later: a Redwood Cathedral image in Carr's style failed on the first try; a result was described as delivered later. The artist-zone assignments were left to the client's eye.

**Open (early image work):** the remaining Atlantis, underwater cave and other clips the client was still running ("at 30 on the new videos"); the exact ten-section prompt count (38 counted from the headings); whether the Morphic frames are kept as references only (the Sep 12 ruling in 4.2 treats the old animation-program zone batch as a historical archive).

---

## 5. Licensing notes on bought packs

What the chat logs say, stated plainly. No ruling replaces a legal read.

- **Etsy packs (ruled Sep 17):** the client uses Etsy Celtic laser-carved wood patterns and watercolor Celtic salt and junk-journal kits as default backgrounds and building supplies. Elio added a caution: Etsy licenses are usually personal or craft use only, so these are reference masters and style guides. Elio paints derived originals unless a commercial license exists. Per-shop license fine print is still to be recorded (Sep 17 open item).
- **World Architecture folder contents (Sep 14):** frames wood (50 png), Dark Fantasy TCG card templates (58 png), Horror Fantasy templates (30 png), dressmaker scrapbook (90 jpeg), adorable elemental critters (40 png, candidates for the critter kit), yoga cats (38 png, a Gazette idea), printable item cards bundle (526 files, SRD 2014/2024 and homebrew fronts and backs), a wooden frames PDF. Also a "corners borders bundle" (10 border patterns in DXF/EPS/JPG/PNG/SVG) for laser-carve masters, bar tops and board skins. The Dark Fantasy and Horror templates are frame masters for the Resonance cards.
- **Tabletop mega-bundle (Sep 21):** bought, stored on Drive, not in GitHub. License terms for commercial reuse are not in the chat logs.
- **Rule for all packs:** Style lives in the line; textures (wood, paper, cloth, card frames) sit beneath the line layer and are style-neutral. Elio draws derived originals. The provenance log records anything referenced.
- **The Etsy "elemental critters"** are KIT-C candidates only; they are not canon art.
- **Artist licensing for the 37-artist catalog** is a design-only item: the "copyright shield" needs artist licensing, vendor contracts and ownership of published zones before Share Wood can sell zones (Sep 4 open item).
- **Clean-room reminder:** the Inn's masters are its own. Game variants derive only from Inn masters, never from another's art (ledger sovereignty rule).
- **Open:** whether the SRD-based item cards can be used in a commercial product; whether any pack's license permits embedding in a sold game; who reads each license. No decision is recorded.
- **Early rules on voices and likenesses (Aug 22 to 30).** If an AI-dialogue premium tier is ever built, its text-to-speech must be an original voice, with no fine-tuning on reference actors. The voice-profile system uses measurable data only (pitch, reveal speed, pauses), with no voice cloning, and actor names are direction references only (commit log, Aug 23). Real names stay out of public files; a real person's approval for an in-game likeness is not recorded for most characters (commit log open item, Aug 30).
- **Early video tools (Aug 20 to 21).** The Morphic clips and prompts in 4.9 were made with a paid generator by the client. Their license terms for reuse in a sold game are not recorded.

---

## 6. Consolidated "To reconcile" list

1. Arcade roster numbers and the one master file: 65, 83, 84 to 88, plus 22 unnumbered games.
2. Two games claim #88: Port Purgatory and The God Ladder.
3. Build sheet totals: 77, 79, 80, 83 in chat; 83 plus LAYOVER in the repo.
4. Duplicate #17 (Serpent Steps and Dragon's Descent) in the zone list.
5. The Long Dark versus The Long Night.
6. Tumble Run "live on Steam" versus "no Steam app ID."
7. Three pricing schemes and three Arcade Pass definitions; no client ruling on prices.
8. Whether public store text should name the original retro titles.
9. Godot counts: 14 scripts at first push, 26 scripts and 51 scenes in the repo copy, 97 scripts and 35 scenes in Elio's Sep 21 tally; never compiled.
10. Artist counts (37, 42, "forties"), Cosmology artist (Turner or Dali), Catacombs artist (Goya or Klimt).
11. Cameron as sixth director versus the five-director repo file.
12. Crest versus the tree logo-button idea.
13. Tabletop pipeline totals.
14. Zone count: 37 documented zones versus about 85 in the Oct 13 zone deck.
15. Frequency toggle key: Tab or T.
16. Phase 1 reward stones: Preseli Blue Stone, Lapis Lazuli and Blue Opal (July, roster) versus the Bluestone Key, Obol Stones and peridot (Before the Song). See 1.22.
17. Dragon's Descent and Crystal Catcher: "original" (Before the Song, Aug 22 phase table) versus Mario-style and Hook templates in the roster.
18. Pinball names: Geode Pinball, Crystal Pinball, Pinball (#19).
19. Survivors of the Song, The Campy Inn Brawler, The Long Dark and The Long Night: one game or two.
20. Impossible Game template (10 zone versions) versus Serpent Steps (#16).
21. Which nine games were in the Aug 31 beta (Bead Composer versus Sandfall and Tumble Run); Sandfall.gd exists in two versions.
22. Score Stone with numbers versus arcade leaderboard shown as wall marks.
23. Logo: Antikythera mark (Aug 31) versus the crest "The Four Around the Tree" (Sep 12); the Jul 22 baby dragon logo approval.
24. Coast artist: Carr, Hodler or New England Gothic; Cosmology: Dali (Aug 22 ruling) versus Turner (repo map); Catacombs: Klimt (Aug 22 ruling) versus Goya (repo map).
25. Artist counts in the early commits: 23 (Aug 24) and 37 (Aug 29), alongside the later 37 and 42.
26. Chibi line (Jul 22): Anubis and Medusa listed on both sides; the Architect as the seventh Full Presence versus six Full Presence deities.
27. Early Tumble Run price ".99" (Aug 24) versus $4.99 with 3 DLC packs.
28. Specs for The Silence Between and the Impossible Game template not found by name in the repo.
29. Legal-check list (1.21): original game names recorded in the July and August material; store text, pricing pages and Steam drafts still need the legal pass.

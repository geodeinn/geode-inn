# Geode Inn Arcade — Production Pipeline Spec

## Purpose

Every arcade game and the MMORPG follows this spec from concept to sellable product. No game is marked complete until it passes all seven acceptance criteria.

---

## The Seven Acceptance Criteria

Each game MUST meet ALL of these before being marked complete:

1. **Fully playable** — runs independently, no dependency on the hub or any other game
2. **Downloadable** — packaged as a standalone product (Steam build + standalone installer)
3. **Our story and characters** — no original game's characters, names, or branding remain
4. **Our music** — original or adapted music replacing all original game audio
5. **Bluetooth controller support** — all controller types (Xbox, PlayStation, Switch Pro, generic)
6. **System overlay button** — Steam overlay (and any coinciding platform) wired and functional
7. **Wired, running, sellable** — tested end-to-end, published to store, purchasable

---

## Build Sheet Template (One Per Game)

### SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| **Original Game (IN)** | [Name of game being emulated/adapted] |
| **Geode Inn Name (OUT)** | [New name — or "Same" if keeping] |
| **Genre/Mechanic** | [Core gameplay loop description] |
| **Zone** | [Geode Inn zone assignment] |
| **Stone Reward** | [Stone earned on completion] |
| **Rarity Tier** | [Common / Uncommon / Rare / Epic / Legendary] |
| **Price** | [Store price] |
| **Original Developer** | [Who made the original] |
| **Original Release Year** | [Year] |
| **Legal Basis** | [Public domain / mechanic-only adaptation / original reimplementation] |

### SECTION 2: STORYLINE ADAPTATION

**Original Characters Being Replaced:**
- [Original character 1] -> [Geode Inn character replacing them]
- (list all)

**New Narrative Frame:**
- [What is the Geode Inn story reason for this game existing?]
- [Which Inn characters appear? What are their roles?]
- [What lore from the database (Stone/Lore/Book entities) is woven in?]
- [Does this game connect to a questline? Which one?]

**Dialogue Requirements:**
- NPC dialogue count: [N lines]
- Voice profiles needed: [List NPC names -> accent/cadence]
- Whisper Layer presence: [Yes/No]

**Frequency State:**
- Living (42Hz) behavior: [What happens at 42Hz]
- Shadow (84Hz) behavior: [What happens at 84Hz]
- In-Between behavior: [Transitional state]

### SECTION 3: VISUAL ASSETS NEEDED

**Character Sprites/Portraits:**
- [NPC name]: [sprite type] x [frequency states needed]
- Count: [N sprites total]

**Backgrounds/Environments:**
- [Zone scene 1]: [description — which artist style?]
- Count: [N backgrounds total]

**UI Elements:**
- Title screen, HUD, Pause menu, Victory/GameOver screens
- Count: [N UI elements]

**Tile Sets / Object Sprites:**
- [List game-specific objects: platforms, collectibles, obstacles, enemies]
- Count: [N tiles/objects]

**Animation Frames:**
- [Character]: [N frames for idle/walk/action]
- Count: [N total animation frames]

**Artist Style Assignment:**
- Primary: [Artist name from 37-zone map]
- Secondary: [If mixed]

**Total Image Assets: [N]**

### SECTION 4: AUDIO ASSETS NEEDED

**Music Tracks:**
- Main theme: [instrument palette, BPM, vibe reference]
- Level/zone theme, Boss/climax, Victory, Game over
- Count: [N tracks]

**Sound Effects:**
- [List categories: jumps, collisions, collectibles, UI clicks, environmental]
- Count: [N SFX]

**Voice Lines:**
- [NPC name]: [N lines]
- Count: [N total voice lines]

**Stone Tone Trigger:**
- Reward stone: [Stone name] -> Mohs hardness [N] -> Frequency [N Hz]
- Trigger behavior: [When stone is earned, tone plays at 12dB below narration]

**Audio Architecture:**
- Base BPM: [50 BPM default, or zone-specific]
- Inn Mode DSP profile: [Which of the 7 room profiles?]
- Frequency layer: [42Hz / 84Hz / both]

**Total Audio Assets: [N]**

### SECTION 5: PROGRAMMING REQUIREMENTS

**Engine:** Godot 4.x (all games)
**Architecture:** Offline-first — all assets bundled in res:// paths, no external URLs

**Controller Support:**
- Input mapping: [Map controls to game mechanics]
- Bluetooth pairing flow: [How the game detects and prompts for controller]
- Touch fallback: [If mobile port planned]

**Steam Integration:**
- Steam app ID: [Assigned when registered]
- Achievements: [List]
- Cloud saves: [Yes — sync PlayerProgress entity]
- Leaderboard: [If applicable]
- Overlay button: [Steam overlay wired to Shift+Tab or controller equivalent]

**Platform Targets:**
- Primary: PC/Steam
- Secondary: Steam Deck (native controller, bypasses Valkyrie Shift)
- Tertiary: Mobile (if planned)

**Base44 API Integration:**
- PlayerProgress sync: [What data goes back to the Inn?]
- Stone award: [Which Stone entity record is unlocked?]
- Leaderboard: [If posting to Leaderboard entity]

### SECTION 6: WALKTHROUGH — BUILD ORDER

**Phase 1: Design Document**
- Complete this build sheet
- Confirm original game legal status
- Lock narrative frame and character assignments
- Artist style assigned

**Phase 2: Asset Creation**
- Generate character sprites (all frequency states)
- Generate backgrounds (zone-appropriate artist style)
- Build UI elements
- Create tile sets and object sprites
- Animation frames rendered

**Phase 3: Audio Production**
- Compose/arrange music tracks (50 BPM base, zone instruments)
- Record or synthesize SFX
- Generate voice lines (voice profile system)
- Map stone tone triggers
- Apply Inn Mode DSP profile

**Phase 4: Programming**
- Core game loop (emulating original mechanic)
- Character controller + input mapping
- Storyline integration (dialogue, NPCs, lore triggers)
- Frequency state system (42Hz/84Hz shift if applicable)
- Stone reward system + Base44 API sync
- Steam integration (achievements, cloud saves, overlay)
- Bluetooth controller detection + mapping
- Offline asset loading (all res:// paths)

**Phase 5: Testing**
- Playtest: full playthrough
- Controller test: all Bluetooth types
- Steam overlay test
- Offline mode test (disconnect, verify all assets load)
- Frequency state test (if applicable)
- Stone award sync test (verify Base44 API receives progress)

**Phase 6: Packaging & Publishing**
- Godot export to all target platforms
- Steam depot upload
- Store page: screenshots, description, trailer
- Price set
- Submit for Steam review
- Publish

**Phase 7: Acceptance Check**
- [ ] 1. Fully playable, standalone
- [ ] 2. Downloadable
- [ ] 3. Our characters and story only
- [ ] 4. Our music only
- [ ] 5. Bluetooth for all controller types
- [ ] 6. System overlay button functional
- [ ] 7. Wired, running, sellable

---

## MASTER GAME LIST — 61 GAMES

### Tier 1 — Phase 1 Games (Build First)

| # | Original (IN) | Geode Inn (OUT) | Zone | Stone | Price | Status |
|---|---------------|-----------------|------|-------|-------|--------|
| 1 | Tetris | Standing Stones | Stonehenge | Preseli Blue Stone | $3.99 | Godot script written |
| 2 | Dig Dug | Tomb Tunnel | Egypt | Lapis Lazuli | $3.99 | Godot script written |
| 3 | Temple Run | Andean Run | Peru | Blue Opal | $3.99 | Spec only |
| 4 | Nessie simulation | Monster of the Deep | Water | Freshwater Pearl | $3.99 | Spec only |

### Tier 2 — Core Arcade (26 games)

| # | Original (IN) | Geode Inn (OUT) | Zone | Stone | Price |
|---|---------------|-----------------|------|-------|-------|
| 5 | Geometry Dash | Tumble Run | Canopy | Random Stone | $4.99 |
| 6 | Celeste | Canadian Rockies | Canadian Rockies | Jade | $3.99 |
| 7 | Firewatch | Appalachian Trail | Appalachian | Quartz | $3.99 |
| 8 | Spelunky | Superstition Mountains | Superstition | Gold | $3.99 |
| 9 | Pac-Man | Catacomb Labyrinth | Catacombs | Charon Token | $4.99 |
| 10 | Catherine | Alchemical Staircase | Staircase | Philosopher's Stone | $4.99 |
| 11 | Beat Saber | Music Room Composer | Music Room | Harmonic Stone | $4.99 |
| 12 | Bust-A-Move | Treasury Match | Petra | Banded Agate | $3.99 |
| 13 | Castlevania | Temple of the Naga | Angkor Wat | Zircon | $3.99 |
| 14 | Snake | Serpent Steps | Chichen Itza | Fire Opal | $3.99 |
| 15 | Pipe Mania | Yellowstone Geyser | Yellowstone | Obsidian | $3.99 |
| 16 | Space Invaders | Wall Defense | Great Wall | Jade | $3.99 |
| 17 | Hook/Bionic Commando | Crystal Catcher | Caverns | Tourmaline | $3.99 |
| 18 | Fossil Fighters | Badlands Fossil Dig | Badlands | Fossil Agate | $3.99 |
| 19 | Rhythm Heaven | Inca Terrace Lullaby | Peru | Blue Opal | $3.99 |
| 20 | Lumines | Fjord of Stars | Slavic | Iolite | $3.99 |
| 21 | Patapon | Egyptian Gates | Egypt | Carnelian | $3.99 |
| 22 | Patapon | Ghats of Kali | India | Ruby | $3.99 |
| 23 | Pikmin | Terracotta Army Builder | China | Jade | $3.99 |
| 24 | Uncharted Waters | Mediterranean Trade | Mediterranean | Coral | $3.99 |
| 25 | Wind Waker | Norse Voyage | Norse | Iolite | $3.99 |
| 26 | Mahjong | Dragon Tiles | China/Japan | Jade | $3.99 |
| 27 | Gorogoa | Acropolis in Five Lights | Greece | Sapphire | $3.99 |
| 28 | BotW climbing | Colorado Plateau | Colorado | Turquoise | $3.99 |
| 29 | Grow Home | Redwood Cathedral | Redwood | Petrified Wood | $3.99 |
| 30 | Crossword | Oracle's Riddles | Parthenon | Sapphire | $3.99 |
| 31 | Word Search | Rune Hunt | Norse | Iolite | $3.99 |
| 32 | Anagrams | Sacred Scramble | Taj Mahal | Ruby | $3.99 |
| 33 | Art History Quiz | Cave Painter's Quiz | Chauvet | Aragonite | $3.99 |
| 34 | Untitled Goose Game (rev) | Poison Garden | Poison Garden | Antidote Orchid | $4.99 |
| 35 | Don't Starve | The Reclamation | Bayou | Swamp Agate | $3.99 |
| 36 | Don't Starve | Bayou Reclamation | Bayou | Swamp Agate | $3.99 |
| 37 | Vampire Survivors | The Long Dark | Undercity | Shadow Quartz | $4.99 |
| 38 | Super Mario | Dragon's Descent | Lost Civ | Multi-gems | $3.99 |
| 39 | Little Alchemy | Moji Maker | Easter Island | Obsidian | $3.99 |
| 40 | DDLC | The Signal | Cosmology | Moldavite | $9.99 |

### Tier 3 — Epic/Legendary (7 games)

| # | Original (IN) | Geode Inn (OUT) | Zone | Stone | Price |
|---|---------------|-----------------|------|-------|-------|
| 41 | Animal Crossing | Canopy City Trading | Canopy City | Luminwood | $9.99 |
| 42 | Star Fox | The Arcana | Cosmology | Moldavite | $9.99 |
| 43 | Star Fox | Clockwork Skies | Clockwork | Star Iron | $3.99 |
| 44 | Original (Tidal Caves) | Tidal Caves | Water Zone | Pearl | $9.99 |
| 45 | Champions of Norrath | Hollow Earth RPG | Hollow Earth | Source Stone | $12.99 |
| 46 | LttP (Zelda) | Zelda-Style World | All Zones | Multi-gems | $12.99 |
| 47 | WoW | Fae Kingdom MMO | Fae Kingdom | Labradorite | $12.99 |

### Tier 4 — Community / Free / Original (5 games)

| # | Original (IN) | Geode Inn (OUT) | Zone | Stone | Price |
|---|---------------|-----------------|------|-------|-------|
| 48 | Among Us | Frog Transformation | Inn | — | Free |
| 49 | Hidden Folks | Whisper Layer Discovery | All Zones | Echo Stone | Free |
| 50 | Museum walk | Spiral Gallery Tour | Spiral Gallery | — | Free |
| 51 | Original | Bastet's Herding | Egypt | Cat's Eye Chrysoberyl | $3.99 |
| 52 | Original | Geode Inn Pinball | Geode Inn | Various | $3.99 |

### Tier 5 — New Concepts (Original IP, 9 games)

| # | Original (IN) | Geode Inn (OUT) | Zone | Stone | Price |
|---|---------------|-----------------|------|-------|-------|
| 53 | Original | The Noob Siege | Wire Nook | Lodestone | $4.99 |
| 54 | Original | The Apothecary's Cure | Staircase | Malachite | $4.99 |
| 55 | Original | The Dream Gardener | Fae Kingdom | Dream Quartz | $4.99 |
| 56 | Original | The Crystal Paddle | Crystal Garden | Beryl | $4.99 |
| 57 | Original | The Mirror's Seven | Poison Garden | Snowflake Obsidian | $4.99 |
| 58 | Original | The Egg Carrier | Canopy | Fire Agate | $4.99 |
| 59 | Original | The World Walker | All Zones | Rainbow Stone | $4.99 |
| 60 | Original | The Pipe Descent | Catacombs | Pipe Stone | $4.99 |
| 61 | Original | The Forest Defense | Campgrounds | Moss Agate | $4.99 |

---

## LEGAL FRAMEWORK

**What we emulate:** Game mechanics and rules (not copyrightable)
**What we replace:** All characters, story, music, art, branding (all copyrightable)
**What we create:** Original characters, original story, original music, original art

No original game's assets are used. We rebuild the mechanic from scratch in Godot with our own everything. The original game is a design reference, not a source.

For public domain games (chess, mahjong, snake, tetromino stacking): mechanic is free to use.
For modern games (Celeste, Vampire Survivors, etc.): we implement similar mechanics with zero shared assets.

---

## SHARED ASSETS (Built Once, Used Across All Games)

Already written:
- StoneLoader.gd — Offline stone texture loading
- AudioManager.gd — 50 BPM heartbeat, frequency shift, Inn Mode DSP (492 lines)
- SteamManager.gd — Steam SDK wrapper (166 lines)
- GameManager.gd — Player progress tracking + Base44 API sync (263 lines)
- DialogueUI.gd — Dialogue system with voice profiles (343 lines)
- WorldMap.gd — Zone navigation (232 lines)
- MainHub.gd — Hub interface (301 lines)

Needs writing:
- ControllerManager.gd — Bluetooth controller detection + mapping for all types
- OverlayManager.gd — Steam overlay button system
- FrequencyShift.gd — 42Hz/84Hz state manager

Shared visual asset library:
- 276 creature sprites (12 critters + 32 water monsters + 48 cryptids x 3 frequency states)
- 161 NPC portraits (142 characters x 3 frequency states)
- 49 zone images + 35 numbered zone images
- 5 alchemical emblems
- 13 item/artifact icons
- 76 crafting supply icons
- 198 stone images (cleaned, offline-bundled)

Shared audio library:
- 356 audio files (music + SFX library)
- 74 voice profiles defined

---

## EXAMPLE: FILLED BUILD SHEET — STANDING STONES

### SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| **Original Game (IN)** | Tetris |
| **Geode Inn Name (OUT)** | Standing Stones |
| **Genre/Mechanic** | Block-stacking puzzle — falling stone blocks form complete rows |
| **Zone** | Stonehenge |
| **Stone Reward** | Preseli Blue Stone |
| **Rarity Tier** | Uncommon |
| **Price** | $3.99 |
| **Original Developer** | Alexey Pajitnov |
| **Original Release Year** | 1985 |
| **Legal Basis** | Mechanic only — tetromino stacking is not copyrightable. All assets original. |

### SECTION 2: STORYLINE ADAPTATION

**Original Characters Being Replaced:**
- No named characters in Tetris -> All Geode Inn characters are new additions
- The blocks themselves become Preseli bluestone fragments

**New Narrative Frame:**
- The player is reconstructing Stonehenge from fallen stones. Each completed row locks a stone into place in the circle. Set during the original construction (~3000 BCE).
- An unnamed Druid NPC guides the player with dialogue about the significance of each stone placement.
- The Preseli bluestone is the reward — the actual stone type that the outer ring of Stonehenge was built from (sourced from Preseli Hills in Wales, 140 miles away).

**Dialogue Requirements:**
- NPC dialogue count: ~15 lines (Druid guide)
- Voice profiles needed: Druid Guide -> Welsh accent, slow cadence, deep register
- Whisper Layer presence: No — surface-level arcade game

**Frequency State:**
- Living (42Hz): Standard gameplay — stones fall at normal speed, Druid is warm and encouraging
- Shadow (84Hz): Stones fall faster, Druid's tone shifts to urgent — the circle must be completed before dawn
- In-Between: Transitional glow on the stones when frequency shifts

### SECTION 3: VISUAL ASSETS NEEDED

**Character Sprites/Portraits:**
- Druid Guide: portrait (1), idle sprite (1) x 2 frequency states = 4 sprites

**Backgrounds/Environments:**
- Stonehenge construction site at dawn: Klimt-meets-Don't-Starve style
- Stonehenge at dusk (Shadow mode): darker palette
- Count: 2 backgrounds

**UI Elements:**
- Title screen: Stonehenge silhouette with Antikythera logo
- HUD: Score as "Stones Placed," level as "Circle Progress"
- Pause menu: Stone tablet aesthetic
- Victory: Completed Stonehenge under starlight
- Game over: Crumbled stones
- Count: 5 UI screens

**Tile Sets / Object Sprites:**
- 7 tetromino stone block designs (I, O, T, S, Z, L, J) — each as weathered bluestone
- Stone lock-in flash effect
- Row-clear dust particle
- Count: 10 sprites

**Animation Frames:**
- Druid: 4 frames idle, 4 frames speaking
- Stone placement: 3 frames per block
- Count: 11 frames

**Artist Style Assignment:**
- Primary: Don't Starve (Tim Burton-esque) for construction atmosphere
- Secondary: Klimt weight for the stones themselves

**Total Image Assets: 32**

### SECTION 4: AUDIO ASSETS NEEDED

**Music Tracks:**
- Main theme: Stone chimes + low drone, 50 BPM, referencing Wardruna
- Shadow mode theme: Same chimes detuned, lower register, 84Hz pulse
- Victory: Full stone circle resonance — all chimes harmonize
- Count: 3 tracks

**Sound Effects:**
- Stone block fall: deep thud
- Stone lock-in: chime ring
- Row clear: cascading stone dust + harmonic
- Level up: deep gong
- Game over: stone crumble
- Count: 5 SFX

**Voice Lines:**
- Druid Guide: ~15 lines
- Count: 15 voice lines

**Stone Tone Trigger:**
- Reward stone: Preseli Blue Stone -> Mohs ~6.5 -> ~415 Hz
- Trigger: When earned, 415 Hz tone at 12dB below narration

**Audio Architecture:**
- Base BPM: 50 (sleeping heartbeat)
- Inn Mode DSP profile: Stone Circle Chamber (deepest reverb, longest decay)
- Frequency layer: 42Hz base with 84Hz Shadow shift

**Total Audio Assets: 23**

### SECTION 5: PROGRAMMING REQUIREMENTS

**Engine:** Godot 4.x
**Architecture:** Offline-first — all assets in res://

**Controller Support:**
- Move: D-pad / left stick (left, right)
- Rotate: A button / face button
- Soft drop: Down
- Hard drop: Up / trigger
- Pause: Start / Options
- Bluetooth: auto-detect on launch, prompt if no controller

**Steam Integration:**
- Achievements: "Circle Complete" (beat game), "Stone Mason" (100 rows total), "Dawn Bringer" (beat Shadow mode), "Architect" (level 10 without dropping)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Most Stones Placed"
- Overlay: Shift+Tab or LB+RB on controller

**Base44 API Integration:**
- On completion: POST to PlayerProgress — increment stonesCollected, add Preseli Blue Stone, increment gamesCompleted
- Stone award: Unlock Preseli Blue Stone in Stone entity

### SECTION 6: WALKTHROUGH

**Phase 1: Design Document** DONE (this sheet)
**Phase 2: Asset Creation** — 32 images needed
**Phase 3: Audio Production** — 3 tracks, 5 SFX, 15 voice lines
**Phase 4: Programming** — StandingStones.gd already written (424 lines), needs controller + Steam wiring
**Phase 5: Testing** — 7 acceptance criteria
**Phase 6: Packaging** — Steam build
**Phase 7: Acceptance Check** — all 7 boxes

# Build Sheet — Coral Reef Rescue

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Tetris Attack / Panel de Pon |
| Geode Inn Name (OUT) | Coral Reef Rescue |
| Genre/Mechanic | Stack-switching puzzle — swap adjacent tiles to match 3+ and clear blocks before the stack reaches the top |
| Zone | Coral Reef (Great Barrier Reef / Pacific) |
| Stone Reward | Coral Aragonite |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Intelligent Systems (1995) |
| Legal Basis | Mechanic only — tile-switching match puzzle is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Panel de Pon's Lip -> The Reef Guardian (a merfolk keeper who tends the coral)
- Panel de Pon's garbage blocks -> Bleached Coral (dead white blocks that drop onto the reef and must be chipped away by matching adjacent tiles)
- Panel de Pon's panel colors -> Coral species (6 types: brain coral, staghorn, fan coral, tube coral, plate coral, soft coral — each a distinct color)

New Narrative Frame:
- The Reef Guardian heals a coral reef under threat. Coral bleaching events (garbage blocks) drop dead white coral onto the reef. The Guardian swaps adjacent coral tiles to create matches of 3+ — when matched, the coral heals and clears, creating chain reactions.
- The stack rises continuously from below (new coral grows from the seabed). If the stack reaches the surface, the reef is overwhelmed and the level fails.
- Chain combos represent reef health — a 5-chain means the reef is thriving. The more chains, the more vibrant the reef becomes, and the more bleached coral is naturally resisted.
- Special tiles: Cleaner Wrasse (clears a row), Sea Turtle (clears a column), Reef Shark (clears a 3x3 area). These represent reef fauna that help maintain ecosystem balance.
- The Coral Aragonite reward: the mineral that corals build their skeletons from. Aragonite is a form of calcium carbonate — it IS the reef made stone. The Guardian earns it by restoring the reef to full health.

Dialogue Requirements:
- NPC dialogue count: ~8 lines (The Old Coral — the oldest living coral on the reef, speaks between levels)
- Voice profiles needed: The Old Coral -> Pacific Islander accent, slow, vast, layered with time, deep register
- Whisper Layer presence: Yes — in the reef itself. Coral reefs are living archives — each polp records water temperature, chemistry, and light in its skeleton. The Whisper Layer here is geological memory. When tiles match, the reef briefly whispers its data — centuries of ocean history.

Frequency State:
- Living (42Hz): Clear blue water, vibrant coral colors, abundant fish. The reef is alive. The Old Coral is hopeful.
- Shadow (84Hz): Murky water, coral fading, bleaching events more frequent (garbage blocks drop faster). Fish are sparse. The Old Coral's voice is strained — "The water is changing."
- In-Between: Tide shift between levels — water clarity changes, currents shift.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Reef Guardian: portrait (1), swapping tiles (1), celebrating (1) x 2 freq = 6 sprites
- The Old Coral: portrait (1), speaking (1) x 2 freq = 4 sprites
- Count: 10 sprites

Coral Tile Art (6 species x 3 states):
- Brain coral (brown): healthy, clearing, bleached = 3
- Staghorn coral (orange): healthy, clearing, bleached = 3
- Fan coral (purple): healthy, clearing, bleached = 3
- Tube coral (red): healthy, clearing, bleached = 3
- Plate coral (blue): healthy, clearing, bleached = 3
- Soft coral (green): healthy, clearing, bleached = 3
- All x 2 freq = 36 sprites
- Count: 36 coral tiles

Special Tiles:
- Cleaner Wrasse: 1
- Sea Turtle: 1
- Reef Shark: 1
- Bleached coral block (garbage): 1
- Count: 4 sprites

Backgrounds/Environments:
- Healthy reef (day): Carr underwater luminous blue, vibrant coral, fish schools
- Stressed reef (shadow): Carr murky green, fading coral, sparse fish
- Deep reef (final level): Carr + Klimt — deep blue with gold coral formations, the oldest part
- Count: 3 backgrounds

UI Elements:
- Title screen: Coral formation with Antikythera logo as a pearl inside an oyster
- HUD: Score as "Reef Health," chain counter, level indicator, stack rise speed
- Pause menu: Seashell aesthetic
- Victory: Reef fully restored — vibrant colors, fish return, Coral Aragonite crystal forms
- Game over: Reef overwhelmed — stack reaches surface, coral bleaches entirely, silence
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Swap cursor: 1
- Match particle (coral healing): 1
- Chain reaction glow: 1
- Garbage block crumble: 1
- Water bubble: 1
- Fish (background animation): 3 species
- Coral Aragonite (final): 1
- Count: 9 sprites

Animation Frames:
- Coral tile clear: 3
- Bleached block crumble: 3
- Chain glow: 3
- Fish swim: 2 x 3 = 6
- Water bubble rise: 2
- Aragonite formation: 4
- Count: 21 frames

Artist Style Assignment:
- Primary: Emily Carr (underwater luminous, spiritual weight of living forms)
- Deep reef: Klimt (gold coral as decorative gold-on-blue — the reef as living art)

Total Image Assets: 88

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Steel drum (soft) + water sounds + harp, 50 BPM, Caribbean/Pacific calm
- Chain theme (during big combos): Adds marimba + ascending harp, energy builds
- Shadow theme: Detuned steel drum, minor key, 84Hz pulse, water sounds muted
- Victory: Reef restored — harp cascade + steel drum resolve + whale song
- Count: 4 tracks

Sound Effects:
- Tile swap: water pop
- Match made: coral chime (pitch varies by coral type)
- Chain reaction: ascending arpeggio + bubble cascade
- Garbage block drop: heavy splash
- Garbage block cleared: crack + dissolve
- Special tile activate: varies (wrasse = trill, turtle = deep glissando, shark = percussive strike)
- Stack rise: grinding coral
- Level complete: reef sigh (satisfied exhale of water)
- Count: 8 SFX

Voice Lines:
- The Old Coral: ~8 lines
- Count: 8 voice lines

Stone Tone Trigger:
- Reward stone: Coral Aragonite -> Mohs ~3.5-4 -> ~260 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Underwater (liquid filtering, dense reverb, sub-bass emphasis, muffled highs)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 20

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move cursor: D-pad / left stick
- Swap tiles: A / face button (hold to grab, release on adjacent tile)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: tap first tile, tap adjacent to swap (mobile — perfect for puzzle games)

Steam Integration:
- Achievements: "Reef Restored" (beat game), "Chain Master" (achieve a 10-chain), "Shadow Guardian" (beat Shadow mode), "Perfect Reef" (clear a level without any garbage block landing), "Aragonite Keeper" (earn Coral Aragonite)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Highest Score" and "Longest Chain"
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Coral Aragonite, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 88 images (mostly coral tile variants)
Phase 3: Audio Production — 4 tracks, 8 SFX, 8 voice lines
Phase 4: Programming — spec only, full game script needed (moderate — grid logic + chain detection + garbage system)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

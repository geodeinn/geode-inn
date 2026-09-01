# Build Sheet — Easter Island Heads

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Lemmings |
| Geode Inn Name (OUT) | Easter Island Heads |
| Genre/Mechanic | Puzzle rescue — guide multiple moai across hazardous terrain using abilities assigned to specific moai |
| Zone | Easter Island (Rapa Nui) |
| Stone Reward | Pounamu |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | DMA Design (1991) |
| Legal Basis | Mechanic only — assign-abilities-to-guidents puzzle is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Lemmings -> Moai (the walking heads of Easter Island — in this game, the moai can walk, and they need to reach the ocean)
- Lemmings' abilities -> Moai powers: Digger (moai digs through volcanic rock), Blocker (moai stands as a wall), Builder (moai stacks stone platforms), Climber (moai climbs walls), Basher (moai smashes through obstacles), Floater (moai uses a palm leaf parachute to descend safely)
- The exit -> The ocean (the moai must reach the sea — Rapa Nui legend says the moai walked to their positions from the ocean; this game reverses the journey, sending them back)

New Narrative Frame:
- The moai of Rapa Nui have been still for centuries. Something has awakened them — the Inn's frequency has reached the most remote inhabited island on Earth. The moai remember the ocean and want to return.
- The player doesn't control individual moai — all moai walk continuously toward the right. The player assigns powers to specific moai to help the group navigate terrain: volcanic rock fields, cliff edges, lava channels, and forest obstacles.
- If too few moai reach the ocean, the level fails. A percentage threshold must be met. Some moai must be sacrificed (used as blockers or diggers that get left behind) to save the majority. This is the game's emotional core — not every moai makes it home.
- The Pounamu reward: greenstone from New Zealand, the other great Pacific stone-carving culture. Pounamu connects Rapa Nui to the wider Polynesian world. The moai earn it by completing the journey — the ocean gives back what the land carved.

Dialogue Requirements:
- NPC dialogue count: ~8 lines (The Rongorongo Reader — a Rapa Nui elder who reads the island's undeciphered script between levels)
- Voice profiles needed: The Rongorongo Reader -> Rapa Nui-inflected Spanish/English, rhythmic, oral tradition cadence, weathered voice, mid register
- Whisper Layer presence: Yes — the rongorongo tablets. Between levels, the script glows briefly and whispers. The rongorongo glyphs are one of the few undeciphered writing systems on Earth. The archive holds their meaning — and won't share it. The Whisper Layer here is deliberately cryptic.

Frequency State:
- Living (42Hz): Daytime Rapa Nui. Green grass, blue ocean, volcanic rock in warm light. The moai walk with purpose. The Rongorongo Reader is encouraging.
- Shadow (84Hz): Night. Lava channels glow red. The terrain is more dangerous. Fewer moai survive. The Rongorongo Reader's tone is mournful — "Not all will see the water."
- In-Between: Volcanic tremor between levels — the island shakes, terrain shifts slightly.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Moai (standard walker): walk (2) x 2 freq = 4 sprites
- Moai Digger: digging (2) x 2 freq = 4 sprites
- Moai Blocker: standing block (1) x 2 freq = 2 sprites
- Moai Builder: building (2) x 2 freq = 4 sprites
- Moai Climber: climbing (2) x 2 freq = 4 sprites
- Moai Basher: smashing (2) x 2 freq = 4 sprites
- Moai Floater: floating (1) x 2 freq = 2 sprites
- Moai drowning (failure): 1 sprite
- The Rongorongo Reader: portrait (1), reading (1) x 2 freq = 4 sprites
- Count: 29 sprites

Backgrounds/Environments:
- Volcanic rock field (level 1-3): Bierstadt-meets-O'Keeffe — stark volcanic landscape, ocean visible in distance
- Cliff edge (level 4-6): Adams — precipitous drops, moai silhouettes against sky
- Lava channel (level 7-9): Royo — dark rock with glowing red lava
- Ocean shore (level 10 — the goal): Bierstadt — the sea, the destination, moai reaching water
- Shadow variant of each (4)
- Count: 8 backgrounds

UI Elements:
- Title screen: Moai silhouette row with Antikythera logo as the sun rising behind them
- HUD: Moai saved count, moai lost count, percentage threshold, ability assignments remaining
- Pause menu: Rongorongo tablet aesthetic
- Victory: Moai reach the ocean, waves wash over their bases, Pounamu washes ashore
- Game over: Too few moai reach water — the remaining moai stand still, facing inland
- Ability selection panel: 6 ability icons with assignment count
- Count: 6 UI screens

Tile Sets / Object Sprites:
- Volcanic rock tile (walkable): 1
- Lava tile (hazard): 1
- Cliff edge tile: 1
- Water tile (goal): 1
- Stone platform (builder-created): 1
- Rope bridge: 1
- Palm tree (obstacle): 1
- Rongorongo glyph (Whisper Layer): 3 variants
- Pounamu (final): 1
- Count: 11 sprites

Animation Frames:
- Moai walk: 2
- Moai dig: 2
- Moai build: 2
- Moai climb: 2
- Moai bash: 2
- Moai float: 2
- Water splash (moai reaches ocean): 3
- Volcanic tremor: 2
- Rongorongo glow: 3
- Count: 20 frames

Artist Style Assignment:
- Primary: O'Keeffe (stark volcanic landscape, monumental forms, ocean grandeur)
- Secondary: Maynard Dixon (Pacific remoteness, isolation, the weight of distance)

Total Image Assets: 74

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Conch shell horn + wooden percussion + ocean drone, 50 BPM, Polynesian ritual
- Lava theme: Adds sub-bass + crackling, danger
- Ocean theme (victory): Conch + wave sounds + wooden flute, homecoming
- Shadow theme: Detuned conch, 84Hz pulse, wind
- Count: 4 tracks

Sound Effects:
- Moai step: heavy stone footfall
- Moai dig: stone grinding
- Moai build: stone stack clack
- Moai bash: stone crack
- Moai reach ocean: water splash + deep satisfied hum
- Moai fall (death): stone tumble + silence
- Ability assign: wooden click
- Rongorongo whisper: layered breathy vowels
- Count: 8 SFX

Voice Lines:
- The Rongorongo Reader: ~8 lines
- Count: 8 voice lines

Stone Tone Trigger:
- Reward stone: Pounamu -> Mohs ~6-7 -> ~400 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Pacific Island (open ocean air, long natural reverb, wind constant, salt-thick)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 20

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move cursor: Left stick / D-pad
- Select moai: A / face button
- Assign ability: B / face button (cycles through available abilities)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: tap moai to select, tap ability to assign (mobile — perfect fit)

Steam Integration:
- Achievements: "The Ocean Calls" (beat game), "No Moai Left Behind" (save 100% of moai in a level), "Shadow Walker" (beat Shadow mode), "Minimalist" (beat a level using only 3 ability assignments), "Pounamu Keeper" (earn Pounamu)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Most Moai Saved" (total across all runs)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Pounamu, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 74 images
Phase 3: Audio Production — 4 tracks, 8 SFX, 8 voice lines
Phase 4: Programming — spec only, full game script needed (pathfinding + ability system)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

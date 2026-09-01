# Build Sheet — Music Room Composer

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Beat Saber |
| Geode Inn Name (OUT) | Music Room Composer |
| Genre/Mechanic | Rhythm action — slash incoming notes in time with music, build compositions stone by stone |
| Zone | Music Room |
| Stone Reward | Harmonic Stone |
| Rarity Tier | Rare |
| Price | $4.99 |
| Original Developer | Beat Games (2019) |
| Legal Basis | Mechanic only — rhythm-slash format is not copyrightable. All music, visuals, and story original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Beat Saber's player avatar -> The Composer (a robed figure conducting the Song of the Inn — the 42Hz frequency made audible)
- Beat Saber's note blocks -> Stone Notes (each note is a fragment of a stone's frequency, mapped via Mohs hardness to pitch)
- Beat Saber's obstacles/walls -> Silence Barriers (walls of anti-frequency that the player must physically dodge — they represent the absence of sound)

New Narrative Frame:
- The Music Room is the Inn's acoustic heart. Every stone in the Inn hums at a frequency determined by its Mohs hardness. The Composer's job is to gather these frequencies and weave them into the Song — the Inn's foundational 42Hz melody.
- Each level is a composition. Notes fly toward the player in rhythmic patterns. Slashing them with the right hand (warm/living) or left hand (cool/shadow) adds that stone's frequency to the composition. Hit all notes perfectly and the Song grows.
- 9 composers appear as NPC guides across the levels — each representing a musical tradition from a different Inn zone:
  1. The Druid (Stonehenge) — drone and chant
  2. The Sistrum Priestess (Egypt) — percussion and rhythm
  3. The Skald (Norse) — string and saga
  4. The Quena Player (Andes) — flute and wind
  5. The Sitar Master (India) — string and drone
  6. The Koto Sage (Japan) — string and silence
  7. The Oud Keeper (Mesopotamia) — string and lament
  8. The Mbira Elder (Africa) — thumb piano and trance
  9. The Hurdy-Gurdy Player (European) — drone and crank
- The Harmonic Stone reward: a custom stone formed when all 9 composers' contributions are successfully woven into a single Song. It is the only stone that contains every frequency in the Inn.

Dialogue Requirements:
- NPC dialogue count: ~18 lines (9 composers, 2 lines each — one intro, one post-completion)
- Voice profiles needed: Each composer matches their zone's established accent/cadence from the 74-voice profile system
- Whisper Layer presence: Yes — subtle. Between levels, the Music Room's walls vibrate with patterns. The Whisper Layer here is musical — it hums. Not words. Frequencies. The archive sings to itself.

Frequency State:
- Living (42Hz): Warm notes — gold and amber. Slashing feels satisfying, resonant. The composition builds upward.
- Shadow (84Hz): Cold notes — blue and violet. The same composition but in minor key, inverted. Slashing feels sharper. The composition builds downward — the inverse Song.
- In-Between: The Music Room shimmers between warm and cold. Notes alternate colors. The player must read the color to know which hand to use.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- The Composer (player): conductor pose (1), left slash (1), right slash (1), dual slash (1), dodge (1) x 2 freq = 10 sprites
- 9 Composer NPCs: portrait (1), playing instrument (1) x 2 freq = 36 sprites
- Count: 46 sprites

Backgrounds/Environments:
- Music Room interior (main): Matisse-meets-Klimt — rich patterns, gold walls, instruments hanging
- Stonehenge composition stage (Druid): dawn circle, stone monoliths as speakers
- Egypt composition stage (Sistrum Priestess): temple columns, sistrum glyphs as rhythm guides
- Norse composition stage (Skald): longhouse interior, fire-lit
- Andes composition stage (Quena): mountain ledge, wind visualizer
- India composition stage (Sitar): temple courtyard, incense trails as rhythm lines
- Japan composition stage (Koto): paper screen room, minimal, negative space as music
- Mesopotamia composition stage (Oud): ziggurat interior, clay tablet notation on walls
- Africa composition stage (Mbira): baobab interior, kalimba tines as visual guides
- European composition stage (Hurdy-Gurdy): cathedral bell tower, crank mechanism as tempo
- Shadow variant of Music Room (1)
- Count: 12 backgrounds

UI Elements:
- Title screen: Stone note floating in air with Antikythera logo as a tuning fork
- HUD: Composition progress (as a growing musical staff), combo multiplier, current composer's name
- Pause menu: Sheet music aesthetic, notes frozen mid-air
- Victory: The Song completes — all 9 composers' frequencies merge into Harmonic Stone
- Game over: Notes go flat, composition crumbles, silence
- Score screen: Shows which stones' frequencies were collected this run
- Count: 6 UI screens

Tile Sets / Object Sprites:
- Stone note (warm/right): 1 (gold, varies in size by pitch)
- Stone note (cool/left): 1 (blue, varies in size by pitch)
- Stone note (neutral/both): 1 (white)
- Silence Barrier (dodge wall): 1
- Stone note trail (arcing line): 1
- Slash effect (warm): 1
- Slash effect (cool): 1
- Combo spark: 1
- Composer instrument glow: 1
- Harmonic Stone (final formation): 1
- Count: 10 sprites

Animation Frames:
- Composer slashes: 2 left, 2 right, 2 dual = 6
- Stone note approach: 3 (far, mid, near)
- Slash particle: 4
- Silence barrier: 2 (solid, breaking)
- Composer NPC playing: 2 per composer x 9 = 18
- Harmonic Stone formation: 8
- Count: 41 frames

Artist Style Assignment:
- Primary: Matisse (rich patterns, musical flow, joy in color)
- Secondary: Klimt (decorative gold, weight behind the beauty)
- Japan stage: minimal ink wash (negative space as music)

Total Image Assets: 115

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main composition theme: Orchestral hybrid, 50 BPM base but tempo varies per composer stage
- Druid stage (Stonehenge): Drone chant + frame drum, 50 BPM
- Sistrum stage (Egypt): Sistrum + hand drum, 70 BPM
- Skald stage (Norse): Lyre + throat singing, 50 BPM
- Quena stage (Andes): Quena flute + bombo, 60 BPM
- Sitar stage (India): Sitar + tabla, 70 BPM
- Koto stage (Japan): Koto + silence, 50 BPM (near-sparse)
- Oud stage (Mesopotamia): Oud + frame drum, 50 BPM
- Mbira stage (Africa): Mbira + shaker, 60 BPM
- Hurdy-Gurdy stage (European): Hurdy-gurdy + pipe, 70 BPM
- Final composition (all 9 merge): Full orchestral arrangement, all instruments, 84 BPM climax
- Shadow variant: All tracks in minor, detuned, 84Hz undercurrent
- Count: 12 tracks

Sound Effects:
- Stone note slash (warm): crystalline chime
- Stone note slash (cool): deep bell tone
- Stone note slash (perfect): harmonic ring (both tones)
- Stone note miss: dull thud
- Silence barrier hit: anti-frequency buzz (dissonant)
- Combo milestone: ascending arpeggio
- Composer intro: instrument sample solo (2 seconds)
- Composition section complete: chord resolve
- Harmonic Stone formation: all frequencies converge — single sustained chord
- Count: 9 SFX

Voice Lines:
- 9 Composer NPCs: 2 lines each = 18 lines
- Count: 18 voice lines

Stone Tone Trigger:
- Reward stone: Harmonic Stone -> (custom stone) -> all 9 composer frequencies layered at 12dB below narration
- Trigger: The Harmonic Stone is the only stone that plays as a chord, not a single tone

Audio Architecture:
- Base BPM: 50 (varies per stage — see track list)
- Inn Mode DSP profile: Music Room (balanced — moderate reverb, warm wood reflections, designed for critical listening)
- Frequency layer: 42Hz base with 84Hz Shadow inversion — the Shadow version is the Song played backward/downward
- Special: This is the ONLY game where the player actively builds the music. Every successful slash adds a note to the composition. The final composition is unique to each player's run.

Total Audio Assets: 39

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Left slash: RT / R2 (or motion controller if available)
- Right slash: LT / L2 (or motion controller)
- Dual slash: both triggers simultaneously
- Dodge (silence barrier): move body / left stick
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: swipe left/right with two fingers (mobile)
- VR optional: If VR headset detected, enable full motion tracking

Steam Integration:
- Achievements: "The Song" (beat all 9 stages), "Perfect Pitch" (100% a stage), "Shadow Composer" (beat all stages in Shadow mode), "Virtuoso" (full combo on final composition), "Stone Symphony" (earn Harmonic Stone)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Highest Score" and "Longest Combo"
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Harmonic Stone, increment gamesCompleted, save unique composition data

Special Notes:
- This is the only game where the player CREATES music, not just reacts to it. Each successful run produces a unique composition — a sequence of stone frequencies woven together by the player's timing and accuracy.
- The 9 composers are the Inn's musical soul. Each represents a real musical tradition from a zone the player has explored in other games. This is the game that ties all the zone music together.
- The Harmonic Stone is a custom stone — not in the 198-stone geological database. It is the Inn's acoustic pinnacle.
- VR support is optional but high-value — this game is the most natural VR candidate in the catalog.
- Consider: allowing players to export their unique composition as an audio file. This would be the only player-generated content that leaves the Inn.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 115 images
Phase 3: Audio Production — 12 tracks (the most of any game), 9 SFX, 18 voice lines
Phase 4: Programming — spec only, full game script needed
Phase 5: Testing — 7 acceptance criteria (plus VR mode test if enabled)
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

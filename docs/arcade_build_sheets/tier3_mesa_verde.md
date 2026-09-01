# Build Sheet — Mesa Verde

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | The Incredible Machine |
| Geode Inn Name (OUT) | Mesa Verde |
| Genre/Mechanic | Rube Goldberg contraption puzzle — arrange objects to create chain reactions that achieve a goal |
| Zone | Mesa Verde (Ancestral Puebloan cliff dwellings) |
| Stone Reward | Turquoise |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Sierra On-Line (1993) |
| Legal Basis | Mechanic only — contraption building puzzle is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- The Incredible Machine's objects -> Ancestral Puebloan engineering tools: stone ramps, clay channels, water vessels, rope systems, fire pits, rolling logs, counterweights, and corn-grinding stones
- The Incredible Machine's goal -> Restoring the cliff dwelling's water system (each level routes water from a cliff seep to a specific dwelling room)

New Narrative Frame:
- The player is an Ancestral Puebloan engineer restoring the water system at Mesa Verde's cliff dwellings. The Ancient Ones built sophisticated water routing into the cliff alcoves — stone channels, clay pipes, and gravity-fed reservoirs. Time and erosion have disrupted the system.
- Each level is a contraption puzzle: the player places objects (stone ramps, clay channels, rope pulleys, counterweights, rolling logs) to create a chain reaction that routes water from the source to the destination dwelling.
- The objects are grounded in real Puebloan engineering: metates (grinding stones) as weights, clay canteens as containers, yucca fiber ropes for pulleys, sandstone slabs for ramps. Nothing modern. Everything authentic to the period.
- Chain reactions cascade: a counterweight pulls a rope, which tips a clay vessel, which pours water into a channel, which flows down a ramp, which fills a reservoir, which triggers a float, which opens a gate to the dwelling.
- The Turquoise reward: the most sacred stone of the Ancestral Puebloans. Turquoise represented water and sky — the two things the water system honors. Restoring the full system earns the stone that represents the lifeblood of the cliff dwellings.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (The Ancestor — a spirit of the Ancient Ones who observes the restoration)
- Voice profiles needed: The Ancestor -> Hopi/Tewa-inflected English, quiet, patient, vast with time, low register
- Whisper Layer presence: Yes — in the water. As water flows through restored channels, it whispers. The water carries memories of every person who drank from it. The archive here is in the water itself — fluid, living, always moving.

Frequency State:
- Living (42Hz): Daylight cliff dwelling. Warm sandstone, green vegetation above the alcove, blue sky. Water flows easily.
- Shadow (84Hz): Night. Moonlit sandstone, cold. Water flows slower (ice crystals form on channels). Objects are harder to place precisely (visibility reduced).
- In-Between: Shadow crossing the cliff face between levels — the sun moves across the alcove.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Puebloan Engineer (player avatar): portrait (1), placing object (1), celebrating (1) x 2 freq = 6 sprites
- The Ancestor: portrait (1), observing (1) x 2 freq = 4 sprites
- Count: 10 sprites

Backgrounds/Environments:
- Cliff alcove (level 1-5): Dixon warm sandstone, dwelling rooms visible, green mesa top
- Deep alcove (level 6-10): Adams stark, deeper into the cliff, darker stone, more complex dwelling
- Shadow variant of each (2)
- Count: 4 backgrounds

Contraption Objects (placeable items):
- Stone ramp: 2 (long, short)
- Clay channel: 2 (straight, curved)
- Clay vessel (water container): 2 (large, small)
- Rope pulley: 1
- Counterweight (metate stone): 1
- Rolling log: 1
- Fire pit (heat trigger): 1
- Water wheel: 1
- Float (water-triggered switch): 1
- Gate (opens when float rises): 1
- Yucca rope (connector): 1
- Seesaw (pivot mechanism): 1
- Domino stones (cascade trigger): 1
- Fan (drying/separating): 1
- Count: 17 object sprites

UI Elements:
- Title screen: Cliff dwelling silhouette with Antikythera logo as a kiva (ceremonial room) entrance
- HUD: Level number, objects available (inventory bar), goal indicator (which dwelling needs water)
- Pause menu: Petroglyph panel
- Object placement: ghost preview on field
- Victory: Water reaches the dwelling — rooms fill with light, Turquoise appears in the kiva
- Game over: Not applicable — puzzle game. No fail state, just "try again"
- Hint system: Ancestor suggests one object placement (limited uses)
- Count: 6 UI screens

Tile Sets / Object Sprites:
- Water droplet (flow particle): 1
- Water stream (flowing): 2 (thin, thick)
- Ice crystal (shadow hazard): 1
- Fire spark: 1
- Rope tension: 1
- Stone crack (stress): 1
- Turquoise (final): 1
- Count: 8 sprites

Animation Frames:
- Water flow: 3
- Clay vessel tip: 3
- Counterweight drop: 2
- Rolling log: 2
- Float rise: 2
- Gate open: 2
- Fire burn: 2
- Water wheel spin: 3
- Domino fall: 3
- Turquoise reveal: 4
- Count: 26 frames

Artist Style Assignment:
- Primary: Maynard Dixon (Southwest cliff dwellings, warm sandstone, monumental architecture)
- Secondary: Ansel Adams (stark detail for deeper levels)

Total Image Assets: 71

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Clay flute + drum + water sounds, 50 BPM, Puebloan ambiance
- Deep alcove theme: Deeper flute + cave echoes, more reverent
- Shadow theme: Detuned flute, 84Hz pulse, wind through the alcove
- Victory: Water flows — flute ascending + drum + water cascade
- Count: 4 tracks

Sound Effects:
- Place object: stone set down
- Water flow: gentle pour + bubble
- Clay vessel tip: ceramic creak
- Counterweight drop: thud
- Rolling log: wooden roll
- Rope tension: fiber creak
- Fire spark: crack
- Gate open: stone slide
- Water reach goal: satisfying splash + chime
- Domino fall: cascade of clicks
- Count: 10 SFX

Voice Lines:
- The Ancestor: ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Turquoise -> Mohs ~5-6 -> ~350 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Cliff Dwelling (stone alcove reverb, enclosed, warm, moderate decay)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 20

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move cursor: Left stick / D-pad
- Select object: shoulder buttons (cycle inventory)
- Place object: A / face button
- Rotate object: B / face button
- Remove object: X / face button
- Start simulation: Y / face button (watch the chain reaction)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: tap to place, drag to rotate, tap to remove (mobile — great for puzzle games)

Steam Integration:
- Achievements: "Water Master" (beat game), "Minimalist" (solve a level with 5 or fewer objects), "Shadow Engineer" (beat Shadow mode), "Perfect Flow" (solve a level on first try), "Turquoise Keeper" (earn Turquoise)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Most Efficient" (fewest objects used across all levels)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Turquoise, increment gamesCompleted

Special Notes:
- No fail state — this is a puzzle game. The player tries, fails, adjusts, tries again. Like The Incredible Machine, the fun is in experimentation.
- The physics simulation must be robust — every object interacts with every other object realistically. Water flows, weights fall, ropes pull, fire burns.
- All objects are period-authentic Puebloan engineering. No anachronisms. This game teaches real ancestral technology through play.
- The Ancestor's hint system is limited — 3 hints per level. Use them wisely.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 71 images
Phase 3: Audio Production — 4 tracks, 10 SFX, 6 voice lines
Phase 4: Programming — spec only, full game script needed (high — physics simulation + 17 object interactions)
Phase 5: Testing — 7 acceptance criteria (extra focus on physics reliability)
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

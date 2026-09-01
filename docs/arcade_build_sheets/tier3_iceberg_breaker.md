# Build Sheet — Iceberg Breaker

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Peggle |
| Geode Inn Name (OUT) | Iceberg Breaker |
| Genre/Mechanic | Physics ball shooter — aim and fire, bounce off pegs, clear all targets, limited shots |
| Zone | Arctic Ice (Greenland / polar ice caps) |
| Stone Reward | Glacier Quartz |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | PopCap (2007) |
| Legal Basis | Mechanic only — ball-bounce physics shooter is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Peggle's unicorn (Bjorn) -> The Ice Navigator (a polar explorer with a compass that fires light charges)
- Peggle's pegs -> Ice crystals (blue, white, and clear formations embedded in the iceberg)
- Peggle's orange pegs -> Ancient ice cores (rare targets that hold climate data from millennia past)
- Peggle's bucket -> The Crevasse (if the ball falls into the crevasse at the bottom, the shot is lost)

New Narrative Frame:
- The Ice Navigator explores ancient icebergs, each containing frozen crystal formations and ancient ice cores. By firing light charges that bounce off ice crystals, the Navigator clears paths through the ice to reach the ancient cores — climate records frozen for thousands of years.
- Standard Peggle mechanics: fire a ball from the top, it bounces off pegs (ice crystals), clear all blue/white pegs to complete the level. Hitting orange pegs (ice cores) unlocks climate data fragments added to the Inn's archive.
- The Crevasse at the bottom catches missed balls — if the ball falls in, the shot is wasted. Limited shots per level (10 balls = 10 light charges).
- Each level is a different iceberg formation: tabular (flat top, wide spread), wedge (angled, tricky bounces), dome (curved, unpredictable), and growler (small, dense, challenging).
- The Glacier Quartz reward: quartz that has been trapped in polar ice for 100,000+ years. When the ice melts, the quartz is freed — perfectly preserved, holding the frequency of the last ice age. The Navigator earns it by clearing the deepest iceberg.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (The Ice Elder — a personification of the ancient ice, speaks between levels)
- Voice profiles needed: The Ice Elder -> Icelandic accent, slow, deep, cracking with age, very low register
- Whisper Layer presence: Yes — in the ice cores. Each ancient core hit triggers a brief whisper — a fragment of climate history, a memory of the world when the ice formed. The archive here is geological, not human. The ice remembers before humans existed.

Frequency State:
- Living (42Hz): Daylit iceberg. Blue and white ice gleaming. Crystals are bright, bouncy. The Ice Elder is curious.
- Shadow (84Hz): Night iceberg. Dark ice, bioluminescent cracks. Crystals are harder (bounces are sharper, less predictable). The Ice Elder is mournful — "I am melting. Everything I hold will be lost."
- In-Between: Aurora flicker between levels — the Arctic sky transitions.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Ice Navigator: portrait (1), aiming (1), celebrating (1) x 2 freq = 6 sprites
- The Ice Elder: portrait (1), speaking (1) x 2 freq = 4 sprites
- Count: 10 sprites

Backgrounds/Environments:
- Tabular iceberg: Carr arctic blue expanse, flat ice surface
- Wedge iceberg: Carr angled ice, dramatic shadow
- Dome iceberg: Carr curved ice formation, surreal
- Growler (small iceberg): Carr intimate scale, floating ice chunk
- Deep iceberg (final): Carr + Adams — the deepest, oldest ice, stratified layers visible
- Shadow variant of each (5)
- Count: 10 backgrounds

UI Elements:
- Title screen: Iceberg silhouette with Antikythera logo as the aurora above
- HUD: Shots remaining (as light charges), ice cores collected, pegs remaining, score
- Pause menu: Ice slab aesthetic
- Aim guide: Dotted trajectory line (like Peggle)
- Victory: Iceberg cleared — ancient core revealed, Glacier Quartz in the meltwater
- Game over: Out of shots — ice reformulates, crevasse widens
- Count: 6 UI screens

Tile Sets / Object Sprites:
- Ice crystal peg (blue): 1
- Ice crystal peg (white): 1
- Ice crystal peg (clear): 1
- Ancient ice core (orange/target): 1
- Crevasse (bottom hazard): 1
- Light charge (ball): 1
- Bounce particle: 1
- Ice core shatter: 1
- Climate data fragment (collectible text): 1
- Glacier Quartz (final): 1
- Count: 10 sprites

Animation Frames:
- Light charge bounce: 3
- Ice crystal shatter: 3
- Ice core reveal: 3
- Crevasse widen: 2
- Aurora flicker: 3
- Glacier Quartz emerge: 4
- Count: 18 frames

Artist Style Assignment:
- Primary: Emily Carr (arctic luminous blue, spiritual weight of ice)
- Secondary: Ansel Adams (stark ice formations, black and white precision for the deep iceberg)

Total Image Assets: 54

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Glass armonica + wind + ice crack ambience, 50 BPM, crystalline and cold
- Deep iceberg theme: Deeper glass tones + sub-bass, ancient and slow
- Shadow theme: Detuned glass, 84Hz pulse, wind howling
- Victory: Ice core reveals — glass armonica ascending + water drip (ice melting)
- Count: 4 tracks

Sound Effects:
- Light charge fire: soft launch + crystalline ping
- Ice crystal hit: glassy tap (pitch varies by crystal type)
- Ice core hit: deep resonant gong + whisper burst
- Crystal shatter: ice break cascade
- Crevasse catch: low rumble
- Bounce: soft glass ping
- Score combo: ascending glass arpeggio
- Count: 7 SFX

Voice Lines:
- The Ice Elder: ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Glacier Quartz -> Mohs ~7 -> ~440 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Arctic Ice (cold, crystalline reverb, glassy reflections, long decay, no warmth)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 17

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Aim: Left stick (360 degree rotation at top of screen)
- Fire: A / face button (or RT / R2)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: drag to aim, tap to fire (mobile — perfect for peg games)

Steam Integration:
- Achievements: "Deep Ice" (beat game), "Perfect Shot" (clear a level with one ball), "Shadow Breaker" (beat Shadow mode), "Core Collector" (hit all ice cores in one run), "Glacier Keeper" (earn Glacier Quartz)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Highest Score"
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Glacier Quartz, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 54 images
Phase 3: Audio Production — 4 tracks, 7 SFX, 6 voice lines
Phase 4: Programming — spec only, full game script needed (moderate — ball physics + peg grid)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

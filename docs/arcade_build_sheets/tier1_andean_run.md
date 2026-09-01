# Build Sheet — Andean Run

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Temple Run |
| Geode Inn Name (OUT) | Andean Run |
| Genre/Mechanic | Endless runner — auto-run, swipe/tilt to turn, jump, slide, collect |
| Zone | Peru (Andes Mountains / Inca terraces) |
| Stone Reward | Blue Opal |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Imangi Studios (2011) |
| Legal Basis | Mechanic only — endless runner format is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Temple Run's explorer -> A Chasqui (Inca messenger runner) carrying a quipu (knotted cord message)
- Temple Run's demon monkeys -> Awqa Pacha (shadow creatures from Inca underworld — Ukhu Pacha)
- Temple Run's coins -> Andean opal fragments (collectible, fill the quipu)

New Narrative Frame:
- The player is a Chasqui — one of the legendary Inca relay runners who carried messages across the empire at high altitude. A quipu message must reach the temple at Machu Picchu before dawn.
- The path winds through Andean terrace systems, cloud forest, rope bridges over gorges, and ancient stone roads. The Awqa Pacha — shadow creatures from Ukhu Pacha (the Inca underworld) — chase the runner, emerging from cracks in the stone.
- Collecting opal fragments knots them into the quipu. A full quipu at the end unlocks the Blue Opal — the stone of Andean prophecy, said to hold the sky's reflection.
- The runner's pace accelerates with altitude — the higher the path climbs, the faster the run. The final stretch enters the Sun Gate at Machu Picchu at full sprint.

Dialogue Requirements:
- NPC dialogue count: ~8 lines (Apu — mountain spirit, speaks at checkpoint shrines)
- Voice profiles needed: Apu -> Quechua-inflected Spanish/English, deep echo, slow cadence, vast register
- Whisper Layer presence: Yes — subtle. Whispering wind at high altitude sections. The wind carries fragments of Quechua words. Not threatening — the mountains are watching.

Frequency State:
- Living (42Hz): Standard run. Warm golden light, green terraces, sun overhead. Apu is encouraging.
- Shadow (84Hz): Path darkens to pre-dawn blue. Awqa Pacha move faster, more aggressive. Terraces become crumbling. Apu's voice becomes urgent — "The Sun Gate closes at dawn."
- In-Between: Altitude haze — vision blurs briefly, colors shift between warm and cold.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Chasqui Runner: run cycle (4), jump (2), slide (2), turn (2) x 2 freq states = 20 sprites
- Apu (mountain spirit): portrait (1), manifesting in stone (1) x 2 freq = 4 sprites
- Awqa Pacha (shadow creature): chase (2), lunging (2) x 2 freq = 8 sprites
- Count: 32 sprites

Backgrounds/Environments:
- Andean terrace system (lower altitude): Bierstadt-meets-Benton sweeping landscape
- Cloud forest section (mid altitude): Thomas Cole mist, orchids, moss
- Rope bridge over gorge: Wyeth intimate scale, vertigo angle
- Stone road to Sun Gate (high altitude): Bierstadt alpine glow, thin air palette
- Shadow version of each (4 darker pre-dawn variants)
- Count: 8 backgrounds

UI Elements:
- Title screen: Sun Gate silhouette with Antikythera logo as the sun behind it
- HUD: Score as "Distance (in Toesca)," opal fragments as quipu knot count
- Pause menu: Stone stele aesthetic
- Victory: Sun Gate at dawn, Blue Opal in hand, quipu complete
- Game over: Awqa Pacha close around the runner, stone goes dark
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Opal fragment (collectible): 1
- Stone path tile: 1
- Terrace edge tile: 1
- Rope bridge plank: 1
- Chasm gap (hazard): 1
- Stone obstacle (jump/slide): 2 (low and high)
- Awqa Pacha shadow pool (spawn point): 1
- Checkpoint shrine: 1
- Dust trail particle: 1
- Count: 10 sprites

Animation Frames:
- Chasqui: 4 run, 2 jump, 2 slide, 2 turn = 10
- Awqa Pacha: 2 chase, 2 lunge = 4
- Apu: 2 manifest = 2
- Opal fragment: 2 spin = 2
- Count: 18 frames

Artist Style Assignment:
- Primary: Bierstadt (sweeping alpine grandeur, luminous atmosphere)
- Secondary: Benton (earthy, muscular figures, sense of motion in landscape)

Total Image Assets: 73

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Quena flute + bombo drum, 50 BPM base but tempo increases with altitude, referencing Andean folk traditions
- Cloud forest theme: Zampoña panpipes + rain stick, ambient and drifting
- Chase theme (Awqa Pacha close): Detuned quena + rapid bombo, tension builds
- Shadow theme: Minor key quena, 84Hz drone underneath, pre-dawn cold
- Victory: Sun Gate reveals — charango burst + quena ascending scale
- Count: 5 tracks

Sound Effects:
- Footstep on stone: crisp tap
- Footstep on wood (bridge): hollow creak
- Jump: breath exhale + wind
- Slide: stone scrape
- Turn: boot pivot crunch
- Opal collect: chime (Andean triangular bell)
- Awqa Pacha growl: low sub-bass rumble
- Checkpoint reached: bombo drum hit + quena note
- Game over: stone rumble + wind howl
- Count: 9 SFX

Voice Lines:
- Apu (mountain spirit): ~8 lines
- Count: 8 voice lines

Stone Tone Trigger:
- Reward stone: Blue Opal -> Mohs ~5.5-6.5 -> ~370 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50 (increases with altitude — 50 at base, up to 80 at Sun Gate)
- Inn Mode DSP profile: Mountain Pass (open air, long reflections, thin reverb)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 22

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Steer left/right: Left stick / D-pad left-right
- Jump: A / face button
- Slide: B / face button (or down on stick)
- Tilt (mobile): Accelerometer
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller

Steam Integration:
- Achievements: "Sun Gate" (beat game), "Quipu Master" (collect 500 opal fragments total), "Dawn Runner" (beat Shadow mode), "Untouchable" (reach 5000m without being caught)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Longest Run" (distance in meters)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Blue Opal, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 73 images
Phase 3: Audio Production — 5 tracks, 9 SFX, 8 voice lines
Phase 4: Programming — spec only, full game script needed
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

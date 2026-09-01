# Build Sheet — Tumble Run

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Geometry Dash |
| Geode Inn Name (OUT) | Tumble Run |
| Genre/Mechanic | Rhythm-based platformer — auto-run, tap to jump/dash, die-and-retry precision |
| Zone | Canopy (the Inn's living forest ceiling) |
| Stone Reward | Random Stone (each completion awards a different stone from the 198-stone pool) |
| Rarity Tier | Rare |
| Price | $4.99 |
| Original Developer | RobTop Games (2013) |
| Legal Basis | Mechanic only — rhythm-platformer auto-runner format is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Geometry Dash's cube/icon -> Tumble (a baby Fizgig — small creature in overalls with an oversized wrench)
- Geometry Dash's ship mode -> Tumble riding a floating wrench-glider through canopy gaps
- Geometry Dash's ball mode -> Tumble as a rolling Fizgig ball through hollow branches
- Geometry Dash's UFO mode -> Tumble in a spinning acorn pod

New Narrative Frame:
- Tumble the Fizgig is lost in the Canopy — the living forest ceiling of the Geode Inn. Tumble was repairing a broken branch-bridge when a wind gust carried the little Fizgig deep into the canopy's maze.
- The player navigates Tumble back home through rhythm-based obstacle courses. The canopy sways at 50 BPM (the Inn's canopy sway tempo) — every jump, dash, and dodge is synchronized to the beat.
- Each level represents a different canopy zone: vine highways, hollow branch tunnels, leaf-platform clusters, and storm-gap chasms. The music drives the difficulty — faster tempo = denser obstacles.
- The random stone reward: each time Tumble makes it home, the Fizgig finds a stone that was lodged in the canopy bark. No two runs yield the same stone — the canopy holds fragments from every stone in the Inn's collection, carried up by rain and root over centuries.
- Canopy City DLC (Evil Version): Tumble gets captured by shadow canopy creatures. The difficulty doubles. The music goes minor. The Fizgigs' overalls turn dark. This is the only DLC where Tumble is not the protagonist — a rescue Fizgig named Rivet must navigate the corrupted canopy to find Tumble.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (Old Fizgig — the elder who gives Tumble the starting wrench at level 1)
- Voice profiles needed: Old Fizgig -> Scottish Highlands accent, wheezy but warm, high register (small creature)
- Whisper Layer presence: No — this is the Inn's comic relief game. Loading screens show Fizgigs in overalls. Keep it light.

Frequency State:
- Living (42Hz): Standard gameplay. Canopy is lush green, fireflies, birdsong layered into the music. Warm and inviting.
- Shadow (84Hz): Canopy goes to night. Obstacles become shadow-silhouette. Music drops to minor key. NOT the Evil DLC — this is just nighttime canopy. Same difficulty, different mood.
- In-Between: Firefly transition — lightning bugs switch from gold (Living) to blue (Shadow) as the shift happens.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Tumble (cube mode): idle (1), jumping (2), crashing (1) x 2 freq = 8 sprites
- Tumble (ship mode): on wrench-glider (2) x 2 freq = 4 sprites
- Tumble (ball mode): rolling (2) x 2 freq = 4 sprites
- Tumble (UFO/acorn mode): spinning (2) x 2 freq = 4 sprites
- Old Fizgig: portrait (1), handing wrench (1) x 2 freq = 4 sprites
- Rivet (DLC protagonist): idle (1), jumping (2) x 2 freq = 6 sprites
- Count: 30 sprites

Backgrounds/Environments:
- Vine highway (level 1-3): Rackham fairy-tale forest, green and gold
- Hollow branch tunnel (level 4-6): Don't Starve interior, woody textures
- Leaf platform cluster (level 7-9): Rackham meets O'Keeffe, oversized leaves
- Storm gap chasm (level 10): Bierstadt alpine storm backdrop, dramatic
- Shadow/night variant of each (4 darker)
- DLC corrupted canopy (1 unique): twisted, dark version of vine highway
- Count: 9 backgrounds

UI Elements:
- Title screen: Tumble sitting on a wrench, grinning, with Antikythera logo as a sunbeam through leaves
- HUD: Progress bar as a vine growing across the top, attempt counter as Fizgig tally marks
- Pause menu: Hollowed-out tree stump aesthetic
- Victory: Tumble arrives home — other Fizgigs cheer, wrench held high
- Game over: Tumble tumbles (comical — not grim), dust cloud, quick restart
- Practice mode toggle: Fizgig holding a "training wheels" sign
- Count: 6 UI screens

Tile Sets / Object Sprites:
- Ground platform (canopy branch): 3 variants (thick, thin, broken)
- Spike obstacle (thorn): 1
- Spike obstacle (splinter): 1
- Jump pad (mushroom): 1
- Dash ring (vine loop): 1
- Portal (mode switch — wrench-glider/acorn/vine): 3 (one per mode)
- Collectible (firefly — counts as rhythm sync points): 1
- Hazard block (falling coconut): 1
- Hazard block (rolling acorn): 1
- Finish flag (home door carved into bark): 1
- Count: 14 sprites

Animation Frames:
- Tumble cube: 2 jump, 2 crash, 2 land = 6
- Tumble ship: 2 glide, 2 tilt = 4
- Tumble ball: 2 roll = 2
- Tumble acorn: 2 spin = 2
- Old Fizgig: 2 hand-wrench = 2
- Rivet: 2 jump, 2 crash = 4
- Firefly: 2 blink = 2
- Crash particle (dust + leaves): 3
- Count: 25 frames

Artist Style Assignment:
- Primary: Rackham (Arthur Rackham — fairy-tale forest, gnarled beauty, whimsical but detailed)
- Secondary: Don't Starve (for interior/tunnel sections — slightly Burtonesque)

Total Image Assets: 84

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Level 1-3 theme: upbeat folk-jig, 50 BPM base but doubles to 100 BPM feel, mandolin + bodhran + whistle
- Level 4-6 theme: woody percussion + bass drone, slightly darker, 100 BPM
- Level 7-9 theme: bright mandolin + harp, triumphant, 120 BPM
- Level 10 (Storm Gap): full folk-rock arrangement, Dropkick Murphys energy, 140 BPM
- Shadow/night variant: same tracks in minor key, detuned
- DLC Evil theme: minor key, distorted, slower — the canopy is corrupted
- Victory jingle: quick Fizgig dance tune, 3 seconds
- Count: 7 tracks

Sound Effects:
- Jump: soft "boing" (tuned to current BPM)
- Dash: whoosh + leaf rustle
- Crash: comical splat + leaf burst
- Portal (mode switch): wrench clink + shimmer
- Firefly collect: tiny ping (tuned to current chord)
- Jump pad (mushroom bounce): deep rubbery bounce
- Finish: door creak open + Fizgig cheer
- Old Fizgig speak: wheezy throat clear
- Count: 8 SFX

Voice Lines:
- Old Fizgig: ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Random (varies per run) -> Mohs varies -> Frequency varies
- Trigger: When earned, the stone's mapped frequency plays at 12dB below the music bed. Each run sounds different.

Audio Architecture:
- Base BPM: 50 (canopy sway), but gameplay BPM doubles/triples for difficulty progression
- Inn Mode DSP profile: Canopy (warm wood reflections, moderate reverb, organic)
- Frequency layer: 42Hz base with 84Hz Shadow (night) shift
- Special: This is the most music-driven game in the Inn. The rhythm IS the gameplay. Every obstacle is placed on a beat. Players who feel the beat will succeed.

Total Audio Assets: 21

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Jump/dash: A / face button (tap = jump, hold = dash)
- Ship mode: hold A to ascend, release to descend
- Ball mode: hold A to switch gravity
- Acorn mode: tap A to boost upward
- Pause: Start / Options
- Practice mode toggle: in pause menu
- Bluetooth: auto-detect, prompt if no controller
- Touch: tap anywhere = jump/dash (native mobile support)

Steam Integration:
- Achievements: "Home Run" (beat all 10 levels), "Fizgig Master" (beat all levels in normal mode without practice), "Night Runner" (beat all levels in Shadow/night mode), "Rivet's Rescue" (beat DLC), "Stone Collector" (earn 20 different random stones)
- Cloud saves: Sync PlayerProgress (especially stonesCollected — random stones accumulate)
- Leaderboard: "Fewest Attempts" (total deaths across all levels)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add random stone from 198-stone pool, increment gamesCompleted, track unique stones collected

DLC Architecture:
- Canopy City Evil Version as DLC (separate Steam depot)
- 2 more DLC packs planned (spec to follow)
- DLC purchased through Steam store, unlocks levels in-game

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 84 images
Phase 3: Audio Production — 7 tracks, 8 SFX, 6 voice lines
Phase 4: Programming — TumbleRun.gd already written (424 lines), needs controller + Steam + FrequencyShift + rhythm-sync wiring
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build + DLC depot
Phase 7: Acceptance Check — all 7 boxes

Special Notes:
- Tumble Run is the Inn's comic relief game. Loading screens MUST feature Fizgigs in overalls. The tone is warm, funny, and forgiving. This is the game that makes players smile, not brood.
- The random stone reward makes this the game players return to most — each completion is a surprise. Collectors will grind for all 198.
- Canopy City DLC (Evil Version) is the only place Tumble Run goes dark — and even then, it's "spooky forest dark," not "existential dread dark." The Inn has enough of that elsewhere.

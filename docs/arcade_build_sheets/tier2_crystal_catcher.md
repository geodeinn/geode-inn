# Build Sheet — Crystal Catcher

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Hook / Bionic Commando |
| Geode Inn Name (OUT) | Crystal Catcher |
| Genre/Mechanic | Grappling hook platformer — swing, grab, collect crystals, navigate caverns with no jumping |
| Zone | Caverns (underground crystal systems) |
| Stone Reward | Tourmaline |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Various (grappling hook mechanic is genre-standard) |
| Legal Basis | Mechanic only — grappling hook traversal is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Bionic Commando / Hook protagonist -> The Crystal Singer (a cave-dwelling figure with a resonant crystal grappling claw)
- Enemies -> Cave dwellers: stalactite bats, crystal spiders, echo wraiths, tremor worms

New Narrative Frame:
- The Crystal Singer navigates the Inn's deepest caverns — a geode-lined underworld where Tourmaline crystals grow in clusters. The Singer's grappling claw is made from a resonant crystal that harmonizes with the cavern walls, allowing it to latch onto any crystal surface.
- The player swings from crystal to crystal, collecting loose Tourmaline fragments. There is no jump button — all movement is via grappling hook. The player aims, fires, swings, releases, re-aims, and fires again in a continuous rhythm of pendulum physics.
- Caverns get deeper and more complex: crystal forests, underground lakes with reflective surfaces, narrow fissures requiring precision grapples, and open cathedral chambers with massive stalactites to swing from.
- Hazards: crystal spiders drop from ceilings, tremor worms cause cave-ins that change the level geometry, echo wraiths disrupt the grappling claw's resonance (temporarily disable grapple).
- The Tourmaline reward: the stone of polarization — Tourmaline generates an electrical charge under pressure. The Crystal Singer earns it by mastering the cavern's own physics: pressure, pendulum, resonance.

Dialogue Requirements:
- NPC dialogue count: ~8 lines (The Echo — a voice that lives in the caverns, not a character but the cavern itself speaking through crystal vibrations)
- Voice profiles needed: The Echo -> Layered, reverberant, no identifiable accent, sounds like multiple voices in harmony, deep and vast
- Whisper Layer presence: Yes — the entire cavern IS the Whisper Layer. Crystal walls vibrate with archived data. The Echo is the archive's voice filtered through stone. When the player grapples a crystal, it briefly "speaks" — a flash of whispered text.

Frequency State:
- Living (42Hz): Crystals glow warm amber and green. Caverns are navigable, inviting. The Echo is curious, almost playful.
- Shadow (84Hz): Crystals turn to dark violet and red. Cave-ins happen more frequently. Crystal spiders are aggressive. The Echo becomes sorrowful — it remembers something the caverns lost.
- In-Between: Crystal resonance shift — all crystals hum at once, shifting pitch from warm to cold.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Crystal Singer: idle/hang (1), aim (1), fire grapple (1), swing (2), release (1), collect (1) x 2 freq = 14 sprites
- Crystal Spider: crawl (2), drop (1) x 2 freq = 6 sprites
- Tremor Worm: emerge (1), burrow (1) x 2 freq = 4 sprites
- Echo Wraith: manifest (1), disrupt (1) x 2 freq = 4 sprites
- The Echo (crystal face): manifest (1), speaking (1) x 2 freq = 4 sprites
- Count: 32 sprites

Backgrounds/Environments:
- Crystal forest (level 1-3): Klimt dark — crystal growths as gold-on-black decorative patterns
- Underground lake (level 4-6): Carr reflected — water mirrors crystals, dual-depth visual
- Narrow fissure (level 7-8): Escher — tight geometric passages, impossible angles
- Cathedral chamber (level 9-10): Klimt + Dore — vast, stalactites as columns, crystal mosaics on ceiling
- Shadow variant of each (4)
- Count: 8 backgrounds

UI Elements:
- Title screen: Crystal cluster with Antikythera logo visible inside the largest crystal
- HUD: Score as "Crystals Collected," level as "Depth," grapple cooldown indicator
- Pause menu: Crystal tablet aesthetic
- Victory: Tourmaline cluster revealed — the deepest crystal, pulsing with internal light
- Game over: Crystal Singer falls into darkness, grapple claw goes dark
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Crystal anchor point (grapple-able): 3 variants (small, medium, large)
- Crystal fragment (collectible): 1
- Stone wall (non-grapple-able): 1
- Water surface (hazard if touched): 1
- Stalactite (grapple-able + breakable): 1
- Crystal web (spider hazard): 1
- Rubble (cave-in debris): 1
- Grapple claw projectile: 1
- Grapple rope/chain: 1
- Tourmaline cluster (final): 1
- Count: 12 sprites

Animation Frames:
- Crystal Singer: 2 aim, 2 swing, 1 fire, 1 release, 1 collect = 7 per freq x 2 = 14
- Crystal Spider: 2 crawl, 1 drop = 3
- Tremor Worm: 2 emerge = 2
- Echo Wraith: 2 manifest = 2
- Grapple extend: 3
- Crystal resonance flash: 3
- Cave-in: 4
- Tourmaline reveal: 4
- Count: 35 frames

Artist Style Assignment:
- Primary: Klimt (crystal growths as decorative gold-on-dark patterns — the Inn's foundational visual)
- Secondary: Escher (fissure levels — geometric impossibility, tight spaces)
- Underground lake: Emily Carr (reflected depth, luminous water)

Total Image Assets: 92

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Crystal harp + subterranean drone, 50 BPM, resonant and echoing
- Lake theme: Adds water sounds + reflected harmonics, ethereal
- Fissure theme: Tight, claustrophobic, minimal — just drone + occasional crystal ping
- Cathedral theme: Full crystal resonance — massive reverb, every crystal humming, awe
- Shadow theme: All tracks pitch-shifted, 84Hz pulse, crystals sound strained
- Victory: Tourmaline reveals — single sustained crystal tone that harmonizes with itself
- Count: 6 tracks

Sound Effects:
- Grapple fire: crystal crack + whip
- Grapple latch: resonant ping (tuned to crystal size)
- Swing: rope hum + wind
- Release: soft pop
- Crystal collect: harmonic chime
- Crystal spider drop: skittering
- Tremor worm emerge: deep rumble
- Echo wraith disrupt: dissonant static burst
- Cave-in: cascading stone + crystal shatter
- Water touch: splash + submersion
- Count: 10 SFX

Voice Lines:
- The Echo: ~8 lines
- Count: 8 voice lines

Stone Tone Trigger:
- Reward stone: Tourmaline -> Mohs ~7-7.5 -> ~440 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Crystal Cavern (maximum reverb, crystalline reflections, every sound rings)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 24

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Aim: Right stick (360 degree aiming)
- Fire grapple: RT / R2
- Release grapple: release RT / R2
- Retract (shorten rope): hold A / face button
- Extend (lengthen rope): hold B / face button
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: drag to aim, tap to fire/release (mobile)

Steam Integration:
- Achievements: "Deepest Crystal" (beat game), "Flow State" (swing through a level without stopping), "Shadow Singer" (beat Shadow mode), "Crystal Collector" (collect all fragments in one run), "Tourmaline Keeper" (earn Tourmaline)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Fastest Descent" (speedrun)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Tourmaline, increment gamesCompleted

Special Notes:
- No jump button. ALL movement is grappling. This is the game's signature — it forces the player to think in pendulum physics, not platforming.
- The Echo is not a character — it IS the cavern. The voice comes from the crystals. This is the most environmental Whisper Layer manifestation of any arcade game.
- Pendulum physics must feel perfect. This game lives or dies on how good swinging feels. Extensive playtesting of the grapple mechanics is critical.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 92 images
Phase 3: Audio Production — 6 tracks, 10 SFX, 8 voice lines
Phase 4: Programming — spec only, full game script needed (moderate-high — pendulum physics + grappling system)
Phase 5: Testing — 7 acceptance criteria (extra focus on grapple feel)
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

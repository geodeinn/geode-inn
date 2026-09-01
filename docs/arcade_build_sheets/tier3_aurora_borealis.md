# Build Sheet — Aurora Borealis

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Flow |
| Geode Inn Name (OUT) | Aurora Borealis |
| Genre/Mechanic | Motion-controlled collect-and-grow — steer a light trail, absorb smaller lights, grow, avoid larger lights |
| Zone | Arctic (Northern Lights) |
| Stone Reward | Labradorite |
| Rarity Tier | Rare |
| Price | $4.99 |
| Original Developer | thatgamecompany (2006) |
| Legal Basis | Mechanic only — absorb-and-grow particle game is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Flow's aquatic organism -> A Light Serpent (a creature made of aurora light — born from the Borealis itself)
- Flow's particles -> Auroras (colored light fragments drifting in the polar sky)
- Flow's evolution stages -> Frequency states (the serpent grows through color phases matching the aurora spectrum)

New Narrative Frame:
- The player IS a fragment of the Aurora Borealis that has become self-aware. The serpent of light drifts through the polar sky, absorbing smaller aurora fragments to grow brighter and longer.
- The game has no fail state in the traditional sense — larger aurora fragments can dim the serpent, reducing it back to a smaller state, but never eliminating it. The serpent persists, like the aurora itself.
- Each "level" is a different altitude of the aurora: lower atmosphere (green oxygen emissions), mid-atmosphere (red oxygen), upper atmosphere (blue nitrogen), and the edge of space (violet — the Schumann calibration zone, 7.83Hz).
- Reaching the uppermost level reveals that the aurora is the Inn's frequency made visible — the 42Hz Song interacting with the atmosphere. The serpent IS the Inn, singing to the sky.
- The Labradorite reward: the stone of the Northern Lights. Inuit legend says Labradorite fell from the aurora. The serpent earns it by becoming the aurora — growing large enough to merge with the full sky.

Dialogue Requirements:
- NPC dialogue count: 0 — no NPCs. No words. This game is pure experience.
- Voice profiles needed: None
- Whisper Layer presence: Yes — but wordless. The aurora itself IS the Whisper Layer here. Color = language. The serpent's growth triggers color shifts that convey meaning without text. The archive speaks in spectrum.

Frequency State:
- Living (42Hz): Green aurora — the most common, most accessible. Warm despite the cold sky. The serpent grows steadily.
- Shadow (84Hz): Violet aurora — rare, intense. Smaller fragments are faster, more evasive. Larger fragments are more aggressive. The serpent must be more deliberate.
- In-Between: The color boundary — green shifting to red, red to blue. The serpent crosses frequency layers.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Light Serpent: 6 growth stages x head (1), body segment (1), trail (1) x 4 color phases = 72 sprites
- Aurora fragment (4 sizes): 4 x 4 color phases = 16 sprites
- Count: 88 sprites (many are color variants of the same base)

Backgrounds/Environments:
- Lower atmosphere (green): Carr luminous northern sky, mountains below, green glow
- Mid-atmosphere (red): Carr deeper sky, red curtains of light
- Upper atmosphere (blue): Carr near-space, blue aurora, stars visible
- Edge of space (violet): Carr + Dali — surreal, violet aurora meets the cosmos, Schumann resonance visible as golden threads
- Shadow variant of each (4 darker, more intense)
- Count: 8 backgrounds

UI Elements:
- Title screen: Aurora curtain with Antikythera logo as a constellation within the lights
- HUD: Minimal — no score, no health bar. Just the serpent's current size/glow intensity as a subtle brightness indicator
- Pause menu: Frozen aurora — lights hang still
- Victory: Serpent fills the sky — merges with the aurora, Labradorite falls like a tear of light
- No game over screen — the serpent simply reforms
- Count: 4 UI screens

Tile Sets / Object Sprites:
- Aurora particle (collectible): 4 color variants
- Aurora barrier (larger entity): 3 size variants
- Star (background decoration): 1
- Mountain silhouette (lower frame): 1
- Schumann thread (upper level): 1
- Labradorite (final): 1
- Count: 11 sprites

Animation Frames:
- Serpent movement: 4 undulation frames x 6 growth stages = 24
- Aurora fragment drift: 3
- Aurora curtain wave: 4
- Color phase transition: 4
- Labradorite fall: 5
- Count: 40 frames

Artist Style Assignment:
- Primary: Emily Carr (northern luminous sky, spiritual weight, the Sublime)
- Edge of space: Dali (surreal, transcendent, the Schumann zone is reality bending)

Total Image Assets: 151

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Lower atmosphere: Ethereal drone + occasional chime, 50 BPM, near-ambient, referencing aurora folk myths
- Mid-atmosphere: Deeper drone + harp harmonics, redder sound (lower pitch)
- Upper atmosphere: Glassy synth + bell tones, blue sound (higher pitch)
- Edge of space: Schumann resonance (7.83Hz) as audible tone + cosmic hum + silence
- Shadow theme: All tracks pitch-shifted, 84Hz pulse, aurora sounds become discordant
- Victory: Labradorite falls — all frequencies converge into a single pure tone, then a crystalline ring
- Count: 6 tracks

Sound Effects:
- Absorb fragment: soft chime (pitch rises with serpent size)
- Dimmed by larger entity: low descending tone
- Growth milestone: harmonic chord
- Altitude transition: shimmer + wind
- Color phase change: subtle pitch bend
- Count: 5 SFX

Voice Lines:
- None — 0 voice lines

Stone Tone Trigger:
- Reward stone: Labradorite -> Mohs ~6-6.5 -> ~400 Hz at 12dB below ambient bed

Audio Architecture:
- Base BPM: 50 (but often drops to near-ambient — this is the second-quietest game after Monster of the Deep)
- Inn Mode DSP profile: Aurora Sky (infinite reverb, cold air, shimmering high frequencies, no low end)
- Frequency layer: 42Hz base with 84Hz Shadow shift
- Special: 7.83Hz (Schumann) reserved for the edge-of-space level — the only game using earth's resonance as gameplay audio

Total Audio Assets: 11

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Steer: Left stick (360 degrees, smooth)
- Boost (quick dash to absorb): hold A / face button
- No other buttons needed — this is a 2-input game (steer + boost)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: drag to steer, tap to boost (mobile — perfect fit)
- Motion control: Optional gyro steering (most natural input for this game)

Steam Integration:
- Achievements: "Full Sky" (merge with the aurora), "Schumann" (reach the edge of space), "Shadow Light" (beat Shadow mode), "Unbroken" (complete a level without being dimmed), "Labradorite Keeper" (earn Labradorite)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Largest Serpent" (max growth achieved)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Labradorite, increment gamesCompleted

Special Notes:
- This is the second wordless game (after Monster of the Deep). No text, no dialogue, no UI numbers. Pure experience. The aurora IS the story.
- The 4 altitude levels map to real aurora physics: green (oxygen at 100km), red (oxygen at 200+km), blue (nitrogen), violet (edge of atmosphere). This is science made meditative.
- 7.83Hz (Schumann resonance) appearing at the edge of space connects this game to the Inn's acoustic architecture — the earth's natural frequency is the foundation of the entire sound system.
- Motion control via gyro would make this the most immersive mobile game in the catalog — tilting the phone to steer a serpent of light through the aurora.
- Along with Monster of the Deep and Music Room Composer, this forms the Inn's "meditative trilogy" — three games that are more experience than challenge.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 151 images (mostly color variants)
Phase 3: Audio Production — 6 tracks, 5 SFX, 0 voice lines (most ambient-heavy game)
Phase 4: Programming — spec only, full game script needed (moderate — particle physics + growth system)
Phase 5: Testing — 7 acceptance criteria (extra focus on motion control feel)
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

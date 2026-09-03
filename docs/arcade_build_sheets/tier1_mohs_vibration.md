# Build Sheet — The Mohs Vibration

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Geode Inn Name | The Mohs Vibration |
| Genre/Mechanic | Sound-based mineral identification. Blind cave, identify stones by vibration alone. |
| Zone | Geode Cave (deep layer — below visual, pure sound) |
| Stone Reward | Clear Quartz (the teaching stone — same chord as all quartz varieties) |
| Rarity Tier | Common |
| Price | Free (accessibility showcase — included with Inn access) |
| Game Effect | Populates geode cave with collected stones. Teaches the core principle: vibration is identity. |
| Lore Connection | The geode cave is where the 42Hz Song is densest. The Keeper (Fibonacci) tends this place. Each stone plays its chord — two frequencies from real mineralogy: density (specific gravity) and hardness (Mohs scale). The discovery: quartz varieties all share the same chord. What you SEE is not what something IS. Color is cosmetic. Vibration is identity. |
| Development Status | spec-complete |

## SECTION 2: STORYLINE ADAPTATION

You are in a dark cave. You cannot see. You can only hear and feel.

Each stone plays its chord — density frequency + hardness frequency — derived from real mineralogical data in the Stone entity. Your job: identify the stone by its vibration alone.

Four game modes:
1. **Blind Cave (Core Mode)** — stone plays its chord in the dark. Select from candidates. Easy: Diamond (bright ring) vs Amber (warm ghost). Hard: Amethyst vs Citrine (same chord — you CAN'T tell them apart. That's the lesson). Master: Pyrite vs Hematite (similar but not identical — density is the clue).
2. **Harmonic Pairs** — match stones whose chords form musical intervals. Gold and Copper = roughly an octave apart. Teaches mineral relationships through harmony.
3. **The Composer** — arrange stones to create chord progressions. Successful composition = a geode that crystallizes visually. Beauty depends on harmonic quality.
4. **Tuning Fork (Tutorial)** — learn to hear the four IEM driver types: bone conduction (chest), dynamic driver (hear+feel), balanced armature (clear), electrostatic (edge of perception).

The core teaching: What you SEE is not what something IS. This is the Inn's accessibility thesis made into a game. A blind player can play this fully. A deaf player gets haptic feedback at the stone's frequency.

NPC Connections:
- The Keeper (Fibonacci) tends the geode cave and observes the player's progress
- Eileen's presence (7.83Hz) calms the cave — bone conduction range
- Tesla would measure the frequencies here (cosmology connection)

Frequency States:
- Living (42Hz): Normal cave darkness, warm audio bed, standard difficulty
- Shadow (84Hz): Deeper darkness, frequencies shift lower, chords become harder to distinguish
- In-Between: The moment of reveal — color floods in after correct identification

## SECTION 3: VISUAL ASSETS NEEDED

- Character sprites: The Keeper (Fibonacci) in geode cave (Living + Shadow)
- Background: Dark cave — minimal. Vibration waveforms/frequency bars as primary visual
- Stone reveal: Color floods in AFTER identification — the "aha" moment. Each stone's real color from database
- Geode cave filling: As stones are collected, cave fills with light and crystal display
- UI: Minimal — frequency bars, candidate list, vibration waveform. Antikythera-themed but restrained
- The 42Hz Song visualized: Subtle background pulse always present
- Estimated total: 15-25 image assets (minimal by design — the game is about sound)

## SECTION 4: AUDIO ASSETS NEEDED

- Main theme: Near-silence. The 42Hz Song as constant bed. Minimal ambient drone.
- Stone chords: PROCEDURALLY GENERATED from real mineralogical data (density → frequency, Mohs → frequency). No pre-recorded stone sounds — all synthesized.
- Audio synthesis: Sine wave + harmonics, envelope for natural stone-ring feel
- Victory: Clear Quartz tone (Mohs 7 → ~420Hz) + geode crystallization sound
- Harmonic interval chimes: Perfect fifth, octave, major third — played when correct pairs matched
- Composer mode: Full chord progression playback — the player's arrangement performed
- Haptic: Controller vibration at each stone's density frequency
- Voice lines: The Keeper (4-6 gentle observations), Eileen ambient (2-3 calming whispers at 7.83Hz)
- Inn Mode DSP: Geode cave reverb profile (long decay, crystal resonance, deep bass presence)
- Estimated total: 10-15 audio assets + procedural synthesis system

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first (all assets bundled locally)

Core Systems:
- Procedural audio synthesis: sine wave + harmonics from density (SG) and hardness (Mohs) values
- Frequency mapping: SG → low frequency (heavier = lower), Mohs → high frequency (harder = rings higher)
- Stone database integration: pull density and hardness from Stone entity (198 stones)
- Identification logic: compare player's selection to playing stone's mineral family
- Harmonic analysis: calculate interval ratios between stone pairs
- Composer mode: chord progression validator (checks for harmonic resolution)
- Haptic system: controller vibration mapped to density frequency
- Visual reveal: color/shape appears only after correct identification
- Accessibility: full audio-only mode, full haptic-only mode, full visual-only mode (three toggleable channels)

Controller Support:
- Full Bluetooth controller mapping (stick for candidate navigation, face buttons to select)
- Touch support for mobile (tap candidates)
- Haptic feedback is CORE mechanic, not optional — controller vibration at stone frequencies
- Valkyrie Shift compatible (TV deployment — audio + haptic primary)

Steam Integration:
- Achievements: Identify 10 stones blind, complete Harmonic Pairs, compose a resolving progression, Master Vibration
- Cloud saves: PlayerProgress sync + geode cave collection state
- Leaderboard: Vibration Score + Master Vibration completion time

## SECTION 6: ACCEPTANCE CRITERIA CHECKLIST

- [ ] Fully playable, standalone
- [ ] Downloadable as independent product
- [ ] Geode Inn narrative: geode cave, the Keeper, 42Hz Song, "vibration is identity" thesis
- [ ] Original music (procedurally generated from real mineral data — no original game samples)
- [ ] Bluetooth controller support (all controller types — haptic is core mechanic)
- [ ] System overlay support (Steam overlay)
- [ ] Commercially sellable (free on Steam as accessibility showcase + Inn entry point)

## SECTION 7: BUILD NOTES

- This game IS the Inn's accessibility principle. A blind player can play it fully. A deaf player gets haptic. No one is excluded.
- Procedural audio means no sound assets to license — all chords generated from real mineral data
- The "same chord" discovery (amethyst = citrine = smoky = rose = clear quartz) is the game's signature moment — the realization that sight is not identity
- Free pricing strategy: this game is the Inn's ambassador. It costs nothing, teaches the core thesis, and invites players deeper
- The Tuning Fork tutorial teaches the IEM driver types — this is the only game that explicitly teaches the Inn's acoustic architecture
- Connects to Eileen's room: 7.83Hz (Schumann resonance) is in the bone conduction range — her presence is felt, not heard
- The Composer mode creates a bridge to the Bead Composer: both are about arranging stones by their properties

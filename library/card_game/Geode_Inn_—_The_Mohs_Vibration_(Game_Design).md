# The Mohs Vibration — Game Design Document

**Game Type:** Sound-based mineral identification
**Inn Location:** Deep geode cave (below the visual layer — pure sound)
**Inspiration:** Geode Inn's IEM acoustic architecture, the 42Hz Song, the accessibility discovery
**Lineup:** Phase 1 Geode Inn arcade game (alongside Standing Stones, Tomb Tunnel, etc.)

## Core Concept

You are in a dark cave. You cannot see. You can only hear and feel.

Each stone plays its chord — two frequencies derived from its real mineralogical properties:
- **Density frequency** (specific gravity → how heavy the stone is)
- **Hardness frequency** (Mohs scale → how much it rings)

Your job: identify the stone by its vibration alone.

## The Discovery Mechanic

Quartz varieties (amethyst, citrine, smoky, rose, clear, rutilated, tourmalinated) all share the SAME chord — because they're all quartz (SG 2.65, Mohs 7). The game teaches:

**What you SEE is not what something IS.**

Color is cosmetic. Vibration is identity.

## Game Modes

### 1. Blind Cave (Core Mode)
- A stone plays its chord in the dark
- You select from a list of candidates
- Starts easy: Diamond (bright ring) vs Amber (warm ghost) — completely different chords
- Gets hard: Amethyst vs Citrine — same chord, different name. You CAN'T tell them apart by sound. That's the lesson.
- Master level: Pyrite vs Hematite — similar but not identical chords. The density difference is the clue.

### 2. Harmonic Pairs
- Match stones whose chords form musical intervals (harmonic ratios)
- Teaches mineral relationships through harmony
- Gold (27.8Hz) and Copper (65.6Hz) = roughly an octave apart. Same family (metals), different weight.

### 3. The Composer
- Arrange stones to create a chord progression
- Density and hardness frequencies must form pleasing intervals
- A successful composition = a "geode" that crystallizes visually
- The geode's visual beauty depends on the harmonic quality of your stone selection

### 4. Tuning Fork (Tutorial)
- Learn to hear the difference between IEM driver types
- Bone conduction: "Feel this one in your chest"
- Dynamic driver: "Hear and feel this one"
- Balanced armature: "Hear this one clearly"
- Electrostatic: "Sense this one at the edge of perception"

## Scoring

- **Vibration Score**: Points for correct identification
- **Harmonic Bonus**: Points for recognizing when two stones are the same mineral (same chord)
- **Composer Score**: Points for chord progressions that resolve harmonically
- **Master Vibration**: Achieved when you can identify 10 stones by sound alone

## Visual Design

The screen is dark. You are in the cave.
- When a stone plays, you see its vibration as a waveform or frequency bars
- Color appears ONLY after you identify the stone — the reveal moment
- The geode cave fills with light as you collect more stones
- The 42Hz Song is always underneath — the Earth's baseline hum

## Accessibility Layer

This game IS the accessibility principle:
- A blind player can play this game fully — it's sound-based by design
- A deaf player gets haptic feedback (controller vibration at the stone's frequency)
- The game teaches that minerals can be known without being seen
- This is the same principle as the book's descriptive text gap

## Connection to the Inn

- Lives in the geode cave (already designed as the stone-chime reward room)
- The 42Hz Song is always present underneath
- Stones collected here populate the geode cave's visual display
- The game is the DEEP layer of the cave — past the visual, into the pure sound
- Connects to the IEM architecture: the four driver types ARE the game's four sensory channels
- Connects to Aurallia's room: 7.83Hz is close to the bone conduction range — her presence calms the cave

## Technical

- Built in Godot (like other Phase 1 games)
- Uses the Stone entity's density and hardness data
- Generates chords procedurally from real mineralogical data
- Audio synthesis: sine wave + harmonics, envelope for natural feel
- Haptic: controller vibration at density frequency
- Can run as a web game for the Base44 hub, or as a Godot game for Steam

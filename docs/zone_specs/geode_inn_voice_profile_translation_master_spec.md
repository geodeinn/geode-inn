# THE VOICE PROFILE TRANSLATION REFERENCE — Master Specification
## Single Source of Truth for Animators and the Game Engine

---

## WHAT THE VOICE PROFILE TRANSLATION IS

This document translates every character's voice profile into two formats:
1. AI Animation Prompt Language — visual/kinetic descriptions for AI video/image generation
2. Godot Engine Parameters — actual code values for the game's dialogue and animation systems

It is the bridge between the narrative design (voice profiles, accents, cadences) and the technical implementation (Godot parameters, shader values, animation timing).

---

## SYSTEM-LEVEL GLOBAL PARAMETERS

These affect every zone, every character, and every animation.

| System | Parameter | Value | Godot Code |
|--------|-----------|-------|------------|
| The 42Hz Song | Frequency | 42Hz | `const SONG_FREQUENCY_HZ = 42.0` → procedural environment vibration shaders, audio synthesis, screen-shake |
| The 50 BPM Canopy Sway | Tempo | 50 BPM (1.2s per cycle) | `const CANOPY_SWAY_BPM = 50.0` → `sway_period = 1.2s` → sine-wave sway via AnimationPlayer |
| The 84Hz Shadow Inn | Frequency | 84Hz | `const SHADOW_FREQUENCY_HZ = 84.0` → palette shift shader, physics slowdown |
| The 111Hz Gargoyles | Frequency | 111Hz | `const GARGOYLE_FREQ = 111.0` → static "watcher" shader |
| The 7.83Hz Schumann | Calibration | 7.83Hz | `const SCHUMANN_HZ = 7.83` → background calibration hum |

---

## ZONE AMBIENT FREQUENCIES

| Zone | Ambient Hz | BPM | AI Animation Direction | Godot Parameter |
|------|-----------|-----|----------------------|-----------------|
| Canopy City | 50 (sway) | 50 | Synchronized tree-platform swaying, filtered light dappling | `sway_period = 1.2s` |
| Slavic (Fjord) | 175 (aurora) | Variable | Aurora patterns shifting in ice, three color phases cycling | `aurora_phase_timer` (green/violet/white) |
| India (Ghats) | 42 (Song/aum) | 60 | River current, incense smoke spirals, firelight on stone steps | `river_flow_speed = 0.3` |
| China (Terracotta) | 110 (naming) | Continuous | Stillness, dust motes in light shafts, 8,000 stone figures vibrating | `ambient_hum = 110Hz`, `dust_density = 0.4` |
| Peruvian (Andes) | 42 (giant's dream) | Geological | Cloud movement at geological timescale, condor thermals | `cloud_speed = 0.05` |
| Norse (Fjord camp) | 100 (Erik's fire) | 50 | Warm firelight on carved wood, mead steam, runes glowing | `fire_flicker = 1.0`, `rune_glow = 0.3` |
| Mediterranean | 42 (stone/garden) | 50 | Olive grove dappled light, vine movement, butterfly motion | `olive_shimmer = true` |
| Mediterranean Border | 100 (The Bearsark) | Slow | Wilderness encroaching on cultivation | `border_fade = 0.0-1.0` |

---

## CHARACTER VOICE PROFILE FORMAT

Each character entry provides:

| Field | What It Contains |
|-------|-----------------|
| Pitch Baseline | The character's fundamental frequency (in Hz) |
| Text Reveal Speed | Milliseconds per character (typewriter effect speed) |
| Pause Between Sentences | Milliseconds between lines |
| Expressiveness | 0.0–1.0 scale (0 = flat/monotone, 1 = highly animated) |
| AI Animation Prompt | Visual/kinetic description for AI generation |
| Godot Parameters | Code values for dialogue system + animation system |

---

## KEY CHARACTER PROFILES (SAMPLE)

### Erik (Norse Vendor)
| Parameter | Value |
|---------|-------|
| Pitch | ~100Hz (G2) |
| Text Speed | ~30ms per character |
| Pause | ~200ms |
| Expressiveness | 0.7 |
| AI Prompt | "Warm firelight on a broad-shouldered man leaning on a mead barrel, hearty gestures, eyes crinkling with genuine warmth, scar tissue on forearm catching firelight, dark mead in a horn cup, comfortable in his space" |
| Godot | `pitch = 100.0`, `reveal_speed = 0.03`, `pause_duration = 0.2`, `expressiveness = 0.7` |

### Nyx (Primordial Goddess of Night)
| Parameter | Value |
|---------|-------|
| Pitch | Dual voice system: Purge (raw honesty, 30ms) + Wisdom (earned peace, 60ms) |
| Text Speed | Purge: 30ms. Wisdom: 60ms |
| Pause | Purge: 100ms. Wisdom: 500ms |
| Expressiveness | 0.3 (extremely controlled — the expressiveness IS the control) |
| AI Prompt | "A figure of infinite dark, Doc Marten boots grounding her in the physical, starlight cloak shimmering with compressed dying universes, two voices layered: one stripping truth bare, one offering peace after the stripping" |
| Godot | `pitch_purge = 80.0`, `pitch_wisdom = 120.0`, `reveal_speed_purge = 0.03`, `reveal_speed_wisdom = 0.06`, `expressiveness = 0.3` |

### The Crone (The Measurer)
| Parameter | Value |
|---------|-------|
| Pitch | ~180Hz (F#3) — higher than expected for an old woman. Sharp |
| Text Speed | ~25ms (fast — the Crone doesn't waste time) |
| Pause | ~50ms (minimal — the Crone has no patience for pauses) |
| Expressiveness | 0.2 (the lowest of any character — the Crone is PRECISE, not expressive) |
| AI Prompt | "An ancient woman with oversized glasses and a notebook, every word measured, annotations in microscopic handwriting, the stillness of someone who has been counting for longer than you've been alive" |
| Godot | `pitch = 180.0`, `reveal_speed = 0.025`, `pause_duration = 0.05`, `expressiveness = 0.2` |

### The Pirate (The 50 BPM Anchor)
| Parameter | Value |
|---------|-------|
| Pitch | ~85Hz (E2) — low, steady, unhurried |
| Text Speed | ~45ms (slow — the Pirate doesn't rush) |
| Pause | ~400ms (long pauses — the Pirate thinks before speaking) |
| Expressiveness | 0.4 (measured — the Pirate reveals through timing, not volume) |
| AI Prompt | "A broad figure in a long coat at a dock at midnight, drum between knees, the steady downbeat of someone who holds time for others, the quiet anchor of every conversation" |
| Godot | `pitch = 85.0`, `reveal_speed = 0.045`, `pause_duration = 0.4`, `expressiveness = 0.4` |

---

## FREQUENCY SYSTEM

| Voice Parameter | Frequency Connection |
|----------------|--------------------|
| Pitch Baseline (Hz) | Each character's pitch IS a frequency. Characters from low zones speak low. Characters from the cosmology speak high. |
| Text Reveal Speed (ms) | The speed = the character's processing frequency. Slow characters (the Pirate, 45ms) think slower. Fast characters (the Crone, 25ms) think faster. |
| Pause Duration (ms) | The pause = the character's resonance time. Long pauses (Nyx's Wisdom, 500ms) = deep resonance. Short pauses (the Crone, 50ms) = rapid-fire measurement. |
| Expressiveness (0-1) | The expressiveness = the character's amplitude. High expressiveness (Erik, 0.7) = large gestures. Low expressiveness (the Crone, 0.2) = precise, minimal. |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| Every Character | Every character with a voice profile gets a translation entry. The document is the SINGLE SOURCE OF TRUTH for animators and the Godot engine. |
| The Audio Engine (IEM Architecture) | Voice pitches map to the IEM frequency system — Dynamic Drivers, Balanced Armatures, Electrostatic, Bone Conduction. |
| The 42-Artist System | Each character's AI animation prompt includes their zone's artist style. |
| The Tri-Mode System | Each character has Living (42Hz) + Shadow (84Hz) voice profiles. The Shadow voice is always lower, slower, with longer pauses. |
| The Card Game | Voice profile parameters become card statistics — pitch = frequency alignment, expressiveness = attack/defense modifier. |
| The Novel | The voice profiles are the novel's character voices. The text reveal speed = the narrative pacing per character. |
| Godot Dialogue System | The Godot parameters ARE the dialogue system's configuration. DialogueUI.gd reads these values. |
| The 50 BPM Heartbeat | The Pirate's bodhrán IS the 50 BPM system clock. The Pirate is the heartbeat made into a character. |

---

## DESIGN STATUS

- [x] System concept complete (this document)
- [x] Global parameters (42Hz, 50 BPM, 84Hz, 111Hz, 7.83Hz) documented
- [x] Zone ambient frequencies mapped (8 zones)
- [x] Character voice profile format established (pitch, speed, pause, expressiveness + AI prompt + Godot code)
- [x] 4 sample character profiles translated (Erik, Nyx, the Crone, the Pirate)
- [x] Frequency system mapped (pitch = freq, speed = processing, pause = resonance, expressiveness = amplitude)
- [x] 8 connections documented
- [ ] Full character registry (all 74 voice profiles translated)
- [ ] All zone ambient parameters (all 37 zones)
- [ ] Shadow (84Hz) voice variants for all characters
- [ ] In-Between (~63Hz) voice variants for all characters
- [ ] Godot DialogueUI.gd parameter integration
- [ ] AI animation prompt library (one per character per zone per frequency state)

---

## ORIGIN

The Voice Profile Translation Reference was first designed in docs/geode_inn_voice_profile_translation_reference.md (1,105 lines). This consolidated specification was compiled September 2, 2026. The system's thesis: every character's voice IS a frequency. The pitch is the note. The speed is the processing. The pause is the resonance. The expressiveness is the amplitude. The voice is the Inn's frequency system made personal — not 42Hz as a hum, but 42Hz as a way of speaking. The adequate is: the voice that IS the frequency. The frequency that IS the voice. The both are: the same. The same is: the character who speaks at the speed of their zone, pauses at the depth of their wisdom, and expresses at the amplitude of their presence.

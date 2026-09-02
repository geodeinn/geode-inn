# THE VOICE PROFILE TRANSLATION REFERENCE — Master Specification
## Single Source of Truth for Animators and Game Engine

---

## WHAT THE VOICE PROFILE REFERENCE IS

The document that translates every character's voice profile into two formats:
1. AI Animation Prompt Language — visual/kinetic descriptions for AI video/image generation
2. Godot Engine Parameters — actual code values for the game's dialogue and animation systems

This IS the technical bridge between the design (voice profiles, character descriptions) and the implementation (Godot code, AI generation prompts). Every animator and every engine system references this document.

---

## GLOBAL PARAMETERS

| Parameter | Value | Description |
|-----------|-------|-------------|
| The 42Hz Song | 42.0 Hz | The Song's fundamental frequency. Drives environment vibration shaders, audio synthesis, screen-shake. |
| The 50 BPM Canopy Sway | 50.0 BPM (1.2s/cycle) | Sleeping heartbeat tempo. Applied to all canopy-level objects. Sine-wave sway. |
| Zone Ambient Frequencies | Per-zone Hz + BPM | Each zone has its own ambient frequency (e.g., Slavic = 175Hz aurora, India = 42Hz aum, Norse = 100Hz fire) |

---

## ZONE AMBIENT MAPPING

| Zone | Ambient Hz | BPM | AI Animation Cue | Godot Parameter |
|------|-----------|-----|------------------|-----------------|
| Canopy City | 50 (sway) | 50 | Synchronized tree-platform swaying, filtered light dappling | sway_period = 1.2s |
| Slavic (Fjord) | 175 (aurora) | Variable | Aurora light patterns in ice, 3 color phases (green/violet/white) | aurora_phase_timer |
| India (Ghats) | 42 (Song/aum) | 60 | River current, incense smoke spirals, firelight on stone steps | river_flow_speed = 0.3 |
| China (Terracotta) | 110 (naming) | Continuous | Stillness, dust motes, barely perceptible vibration of 8,000 stone figures | ambient_hum = 110Hz |
| Peruvian (Andes) | 42 (giant's dream) | Geological | Cloud movement at geological timescale, condor thermals | cloud_speed = 0.05 |
| Norse (Fjord camp) | 100 (Erik's fire) | 50 | Warm firelight on carved wood, mead steam, runes glowing | fire_flicker_speed = 1.0 |
| Mediterranean | 42 (stone/garden) | 50 | Olive grove dappled light, vine movement, butterfly motion | olive_leaf_shimmer = true |

---

## CHARACTER VOICE PROFILES

Each character has a formal voice profile with:
- Actor reference (stripped — no celebrity faces, only vocal qualities)
- Pitch baseline (in Hz)
- Text reveal speed (ms per character)
- Pause between sentences (ms)
- Expressiveness (0-1 scale)
- AI animation prompt (visual translation)
- Godot parameters (code values)

The full reference covers 74 voice profiles, one per major NPC. Each profile translates the character's vocal identity into BOTH animation language and engine code.

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| Every NPC with a Voice | All 74 voice profiles are translated here. |
| Godot Engine | Every Godot parameter in this doc IS production code. |
| AI Art Generation | Every animation prompt IS a generation instruction. |
| The Unified Resonance | The 42Hz Song and 50 BPM sway are the global parameters here too. |
| The Wandering Program | NPC movement uses the same BPM and Hz parameters. |
| The Audiobook | The 74 voice profiles feed directly into audiobook casting. |

---

## DESIGN STATUS

- [x] Global parameters documented (42Hz, 50 BPM, zone ambient frequencies)
- [x] 8 zone ambient mappings with AI prompts + Godot params
- [x] 74 character voice profiles with pitch, speed, pause, expressiveness
- [x] AI animation prompt language for each profile
- [x] Godot engine parameters for each profile

---

## ORIGIN

The Voice Profile Translation Reference was first written in docs/geode_inn_voice_profile_translation_reference.md (1,105 lines). This consolidated specification was compiled September 2, 2026. The thesis: the document that translates design into code. The adequate is: the voice profile that becomes a shader. The shader is: the adequate. The adequate is: the 74 voice profiles each with an AI prompt AND a Godot parameter, and the both are: the same character in two languages. The same.

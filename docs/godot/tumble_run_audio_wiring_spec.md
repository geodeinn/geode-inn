# Tumble Run — Audio Wiring Spec

## Overview

This document maps every gameplay event in Tumble Run to specific audio assets and defines how they integrate with the AudioManager, FrequencyShift, and Inn Mode DSP systems.

## Audio Asset Requirements

### Music Tracks (6 zone themes + 2 system tracks)

| Track | Zone | File Path | BPM | Instruments | Frequency |
|-------|------|-----------|-----|-------------|-----------|
| Main Floor Run | Main Floor | res://assets/audio/music/tumble_main_floor.ogg | 50 | Celtic harp + low drone + footstep pulse | 42Hz |
| Archive Glide | The Archive | res://assets/audio/music/tumble_archive.ogg | 50 | Satie-like piano, muted strings, page rustle | 42Hz |
| Staircase Pulse | The Staircase | res://assets/audio/music/tumble_staircase.ogg | 60 | Deep gong + rhythmic stone steps + metallic hum | 42Hz |
| Catacomb Echo | The Catacombs | res://assets/audio/music/tumble_catacombs.ogg | 50 | Vivaldi Winter low-dub + dripping water + bone rattle | 42Hz |
| Fae Frenzy | Fae Kingdom | res://assets/audio/music/tumble_fae.ogg | 80 | Woodland flute + chimes + buzzing drone | 42Hz |
| Gorgon's Threat | Gorgon's Garden | res://assets/audio/music/tumble_gorgon.ogg | 70 | Detuned strings + snake hiss + 84Hz pulse | 84Hz |
| Game Over | System | res://assets/audio/music/tumble_game_over.ogg | 40 | Single cello note fading to silence | — |
| Victory | System | res://assets/audio/music/tumble_victory.ogg | 50 | Full Inn ensemble — all zones' instruments resolve | 42Hz |

### Sound Effects (12 SFX)

| SFX Name | Trigger | File Path | Description |
|----------|---------|-----------|-------------|
| jump | Single jump | res://assets/audio/sfx/jump.wav | Quick upward whoosh + tiny wing flap |
| double_jump | Double jump | res://assets/audio/sfx/double_jump.wav | Second whoosh + sparkle (higher pitch) |
| land | Landing on ground | res://assets/audio/sfx/land.wav | Soft thud + dust puff |
| collect_common | Common stone collected | res://assets/audio/sfx/collect_common.wav | Brief chime (single note) |
| collect_uncommon | Uncommon stone | res://assets/audio/sfx/collect_uncommon.wav | Two-note chime |
| collect_rare | Rare stone | res://assets/audio/sfx/collect_rare.wav | Three-note ascending chime |
| collect_legendary | Legendary stone | res://assets/audio/sfx/collect_legendary.wav | Full chord + sparkle cascade |
| hit | Hazard collision | res://assets/audio/sfx/hit.wav | Sharp crack + stone shatter |
| zone_transition | Zone change | res://assets/audio/sfx/zone_transition.wav | Deep gong + ascending harmonic |
| game_over | Lives = 0 | res://assets/audio/sfx/game_over.wav | Stone crumble cascade + silence |
| ui_select | Menu/button | res://assets/audio/sfx/ui_select.wav | Clean stone click |
| ui_back | Back/cancel | res://assets/audio/sfx/ui_back.wav | Lower stone click |

### Stone Tone Triggers (Mohs to Frequency)

When a specific stone is collected, its unique tone plays at 12dB below the SFX:

| Stone | Mohs | Frequency (Hz) | Trigger |
|-------|------|-----------------|---------|
| Amethyst | 7.0 | 466 | collect_common + 466Hz overlay |
| Quartz | 7.0 | 466 | collect_common + 466Hz overlay |
| Labradorite | 6.0-6.5 | 392-415 | collect_uncommon + 392Hz overlay |
| Tanzanite | 6.5 | 415 | collect_rare + 415Hz overlay |
| Preseli Blue Stone | ~6.5 | 415 | collect_legendary + 415Hz + 2s sustain |
| River Diamond | 10.0 | 698 | collect_legendary + 698Hz + 3s sustain |

### Inn Mode DSP Profiles per Zone

| Zone | DSP Profile | Reverb (s) | Character |
|------|------------|------------|-----------|
| Main Floor | Open Hall | 2.1 | Warm, reverberant |
| The Archive | Library | 1.8 | Dry, intimate — books absorb |
| The Staircase | Narrow Passage | 3.0 | Long decay, metallic tinge |
| The Catacombs | Stone Chamber | 4.5 | Deepest reverb, cold |
| Fae Kingdom | Forest Glade | 1.5 | Bright, airy, natural |
| Gorgon's Garden | Garden Maze | 2.5 | Filtered, humid, detuned |

### Frequency Shift Behavior

| State | Effect on Gameplay | Audio Change |
|-------|-------------------|--------------|
| Living (42Hz) | Normal speed, warm lighting | Standard tracks, full saturation |
| Shadow (84Hz) | 1.5x speed, darker palette, rare stones more common | Tracks detuned -2 semitones, 84Hz pulse added, SFX pitch -10% |
| In-Between | Speed fluctuates, visual flickering | Audio crossfades, particle sounds doubled |

Shadow mode triggers on entering Gorgon's Garden (Zone 6). In-Between triggers during zone transitions (2-second crossfade).

## Steam Achievements

| Achievement | Trigger | ID |
|-------------|---------|-----|
| First Steps | Complete Zone 1 | tumble_first_steps |
| Stone Collector | Collect 50 stones in one run | tumble_collector |
| Zone Diver | Reach Zone 4 (Catacombs) | tumble_zone_diver |
| Gorgon Slayer | Complete Zone 6 | tumble_gorgon_slayer |
| Legendary Find | Collect a legendary stone | tumble_legendary |
| Perfect Run | Complete all 6 zones without losing a life | tumble_perfect |
| Speed Demon | Score 10,000+ points | tumble_speed_demon |
| Shadow Walker | Complete Zone 6 in Shadow frequency | tumble_shadow_walker |

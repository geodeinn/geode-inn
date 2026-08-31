# Geode Inn — Complete Audio Manifest
## Game Writer Handoff Document
### August 31, 2026

This document lists every aspect of the Geode Inn's audio system: generated assets, documented specs, voice profiles, vibration overlays, and what still needs a human. Everything is ready for the game writers.

---

## 1. SYSTEM ARCHITECTURE — The IEM Acoustic Engine

The entire Inn IS a transducer. Based on Empire Ears IEM engineering, the building processes sound the way a high-end in-ear monitor processes signal.

### Driver Mapping

| Driver Type | Inn Role | Frequency Range | What You Experience |
|---|---|---|---|
| Dynamic Driver (DD) | Catacombs / 42Hz Song | 20Hz-500Hz | Frequencies you FEEL — stone, bass, the deep hum |
| Balanced Armature (BA) | Characters / Voices | 500Hz-6kHz | Frequencies you HEAR — dialogue, melody, the human range |
| Electrostatic (EST) | Cosmology | 6kHz-20kHz | Frequencies you SENSE — shimmer, air, the edge of perception |
| Bone Conduction | Catacombs / The Deep | Subsonic | Frequencies you KNOW — the 42Hz Song in your bones |

### System Constants (Godot Code)

```
SONG_FREQUENCY_HZ = 42.0        # The Song of Making
INVERSE_FREQUENCY_HZ = 84.0      # Shadow Inn / petrify
RESONANCE_FREQUENCY_HZ = 111.0  # Gargoyle watchers
SCHUMANN_RESONANCE_HZ = 7.83    # Eileen's calibration tone
CANOPY_SWAY_BPM = 50.0          # Sleeping heartbeat tempo
SOLFEGGIO: 396, 528, 639, 741, 852 Hz  # Nine Muses scale
```

### Key Files
- Voice profiles + constants: `godot_project/scripts/geode_inn_voice_profiles.gd` (1,426 lines, 74 profiles)
- Master audio doc: `library/mechanics/geode_inn_master_audio_voice_system.md` (309 lines)

---

## 2. GENERATED AUDIO ASSETS — 368 Files

All in `beta/assets/audio/` — 44.1kHz, 16-bit WAV. Reproducible via Python scripts.

### 2A. Stone Chimes (298 files)
Directory: `stone_chimes/` + `_index.json`

Every stone has a unique chime. Mohs hardness maps to frequency (110Hz-880Hz, 3 octaves). Bell-like inharmonic partials + strike transient + cave reverb. 3s each.

**Game usage:** Geode Cave (empty to symphony), Bead Composer (real-time playback), collection pickups, Music Room keys, Knotwork Game, Selkie questline (stone cutting reveals chime).

### 2B. System Tones (14 files)
Directory: `system_tones/`

| Tone | Hz | Purpose |
|---|---|---|
| Song of Making | 42 | Base drone under everything. Felt, not heard. |
| Shadow Inn | 84 + tritone | Petrifaction frequency. Unsettling. |
| Gargoyle Watcher | 111 | Sentinel proximity, riddle solving. |
| Schumann Calibration | 7.83 | Eileen's tuning quest. Earth resonance. |
| Canopy Sway | 50 BPM | Sleeping heartbeat reference. |
| Solfeggio (9 tones) | 42-852 | Nine Muses quest chains, Bead Composer, puzzle solutions. |

### 2C. Zone Ambient Drones (20 files)
Directory: `zone_ambient/`

Base + fifth + octave with LFO breathing. Zone-appropriate reverb. These are BASE LAYERS — the instrument layer (live recordings) sits on top.

| Zone | Base Hz | Reverb | Character |
|---|---|---|---|
| Main Floor | 42 | Standard | The heart, warm hub |
| Cosmology | 111 | Bright | Sky gods, observatory |
| Staircase | 50 | Standard | Rises in key as player climbs |
| Catacombs | 28 | Heavy | Ancient, sub-bass pressure |
| Modern Legends | 42 | Sparse | 2am library, near-silent |
| Artisan Market | 63 | Standard | Warm mid-range commerce |
| Fae Threshold | 84 | Bright | Entry to Fae Kingdom |
| Seelie Court | 72 | Bright | Golden, summer, warm |
| Unseelie Court | 56 | Heavy | Dark, winter, heavy |
| Crystal Gardens | 111 | Bright | Pristine, glass-like |
| Stone Circle Chamber | 28 | Heavy | Deepest tone the Inn produces |
| Geode Cave (empty) | 42 | Standard | Near-silent hum |
| Tidal Caves | 42 | Water | Selkie's workshop |
| Bayou | 42 | Water | Bog Fairy Golem's domain |
| Garden | 50 | Standard | Van Gogh, growing |
| Meadery | 55 | Standard | Picasso, warm wine |
| Undercity | 35 | Heavy | Gothic deep, Klimt |
| Bone Room | 42 | Standard | Quiet workspace |
| Cave City | 31.5 | Heavy | Doré underground |
| Poison Garden | 56 | Standard | 84Hz unsettling, Gorey |

### 2D. Game Audio Stingers (6 files)
Directory: `game_audio/`

| Stinger | Trigger |
|---|---|
| standing_stones_row_clear | Tetris row clear |
| standing_stones_level_up | Tetris level complete |
| tomb_tunnel_artifact | Dig Dug artifact found |
| andean_run_stumble | Temple Run stumble |
| monster_deep_encounter | Creature encounter |
| fae_portal_ignition | Stonehenge portal opens |

### 2E. Music Room (18 files)
Directory: `music_room/`

- 13 fortepiano notes (A3-A4, period-accurate faster decay)
- Stone chime base (4s, heavy reverb)
- Nine Songs chord (all Solfeggio + 42Hz, 10s, slow fade-in)
- Geode cave: empty, partial, full (3 states showing the cave filling with chimes)

### 2F. Classical Dub Soundtrack (12 files)
Directory: `classical_dub/`

All: 50 BPM (or slower), 42Hz sub-bass, heavy reverb, tape delay, vinyl crackle, low-pass filtered. No percussion.

| Track | Composer | Game Usage |
|---|---|---|
| Moonlight Sonata Mvt I | Beethoven | In-Between: the descent, the fog |
| Moonlight Sonata Mvt II | Beethoven | In-Between: the river, the Duck |
| Moonlight Sonata Mvt III (slowed) | Beethoven | In-Between: the Erasure, the Dobby section |
| Moonlight Resolution (Major) | Beethoven | In-Between: fog lifts, resolves to Middle C |
| Nocturne Op.9 No.2 | Chopin | Modern Legends Nook, midnight intimacy |
| Prelude in C Major (WTC) | Bach | Staircase, the Song's skeleton |
| Winter (Four Seasons) | Vivaldi | Unseelie Court, 56Hz sub-bass |
| Pathetique (Final Mvt) | Tchaikovsky | The music that withdraws into 42Hz silence |
| Eine Kleine (Romance) | Mozart | Music Room, effortless flow |
| Lullaby (Wiegenlied) | Brahms | Preservation, simplest held structure |
| Polyphony (One Day More) | Schonberg | Four conflicting lines harmonizing |
| The Crack (Anthem/Hallelujah) | Cohen | 42Hz resonance, the deepest voice |

---

## 3. VOICE PROFILES — 74 Characters

File: `godot_project/scripts/geode_inn_voice_profiles.gd`

Each profile includes: pitch_hz, reveal_speed, pause_weight, expressiveness, instrument, cadence, facial_intensity, gesture_data, idle_animations, light_source, special_mechanics.

### Multi-Mode: Siren (outer/inner), Thorin (extrovert/scholar), Teacher (warm/cold/horror), Astronomer (deduction/contemplation), Nyx (purge/wisdom)

### Special: Tumble (chime, no words), Monsieur Sentient (non-verbal pipe), The Owl (3000ms pauses), The Reader (one line per visit)

### NPC Audio Triggers: Each character has 42Hz (Living) and 84Hz (Shadow) harmonic signatures documenting how their voice changes between states.

---

## 4. ZONE INSTRUMENT LAYERS (Needs Composer)

These are the live instrument recordings that sit on top of the procedural drones.

| Zone | Tempo | Instruments | Treatment |
|---|---|---|---|
| Main Floor | 80-95 BPM | Acoustic guitar, lute, viola da gamba, hammered dulcimer | Warm sub-bass, vinyl crackle, lo-fi house |
| Cosmology | 60-70 BPM | Glass harmonica, singing bowls, Tibetan horn, overtone singing | Granular synthesis, shimmering pads, space drones |
| Staircase | 75-85 BPM | Glass armonica, flute, harp, metallic percussion | Phase shifting, ascending arpeggios (rises as you climb) |
| Catacombs | 65-75 BPM | Frame drum, sistrum, bone flute, lyre, ney | Sub-bass pressure, industrial texture, reverb caves |
| Modern Legends | 50-60 BPM | Piano, cello, analog synth | Minimal, spacious, single note with infinite reverb |
| Artisan Market | 100-115 BPM | Hand drums, oud, kalimba, bells | Bright, warm, Afro-house pulse |
| Fae Threshold | ~60 floating | Harp, breath sounds, wind chimes | Ethereal, no clear time signature |
| Seelie Court | 90-110 BPM | Irish harp, fiddle, tin whistle, bodhran | Golden, warm, melodic electronica |
| Unseelie Court | 70-85 BPM | Bass clarinet, prepared piano, broken glass, sub-bass | Dark, jagged, industrial, bass clarinet through distortion |
| Crystal Gardens | Floating | Glass harmonica, crystal bowls, wordless choir | Crystalline, glass quality |
| Stone Circle | Single tone | None — the room IS the instrument | Deepest tone the Inn produces |

---

## 5. ARCADE GAME AUDIO

| Game | Tempo | Instruments | Treatment |
|---|---|---|---|
| Standing Stones | 120-140 BPM | Bone flute, cow-horn, hide drum, stone percussion | Driving pulse, sub-bass on row clears |
| Tomb Tunnel | 110-130 BPM | Ney, darbuka, finger cymbals, sistrum | Dark cavernous reverb, ney through delay |
| Andean Run | 130-150 BPM | Quena, zampona, bombo, charango | High-energy, wind through filters |
| Monster of the Deep | 70-90 BPM | Bowed psaltery, waterphone, deep cello, whale vocals | Liquid, flowing, no rigid beat |
| Hollow Men | 50 BPM | Silence + breathing + stone scraping | 84Hz inverse, Shadow Inn |
| Tumble Run | 50 BPM | Crystal chimes, fur rustling, boost whoosh | Tumble's chime as lead |
| Sandfall | 50 BPM | Sinking sand tones | Each level removes instruments |
| In-Between | 50/55/42 BPM | Moonlight Sonata low-dub | Near-silence with Moonlight overlay |
| Knotwork | 50 BPM | Metal drone (79-82Hz) + stone chimes | Drag = game, click = silence |
| Bead Composer | No fixed | Stone frequencies + metal drones | Real-time per bead placement |
| Resonance Cards | 50 BPM | Stone chimes on play, silence on Nyx | Cards produce frequency when played |
| Platformer | 120-140 BPM | Stone percussion + zone instruments | Power-up stones change frequency |
| Dream (SMB2) | 50 BPM | Bosch dream-zone ambient | Familiar-but-wrong zone audio |

### Monster of the Deep — Per-Creature Leads
Nessie: bowed psaltery | Ammit: darbuka | Kraken: waterphone | Leviathan: deep cello | Charybdis: prepared piano | Scylla: bass clarinet

---

## 6. IN-BETWEEN AUDIO OVERLAY

Spec: `library/zones/geode_inn_in_between_builder_spec.md`

### Rules
- Near-silence. Ambient wind, water, footsteps on ash.
- 42Hz hum only continuous tone — felt, not heard.
- Action sounds: physical and dry — stone on stone, body displacing air.
- No music during puzzles. Only physics sounds.
- Puzzle completion = one pure note cuts through fog. Each puzzle = different frequency. All puzzles = hidden chord.

### Soundtrack Sections
| Section | Movement | Audio |
|---|---|---|
| 1-2 (Surface + Caves) | Mvt I Adagio | 50 BPM, triplets, drops to silence at Fizgig |
| 3 (The River) | Mvt II Allegretto | 55 BPM, D-flat major, the Duck, gentleness |
| 4 (Catacomb Deep) | Mvt III Presto slowed | 42 BPM, relentless, sforzandi = silence, erases itself to 42Hz |
| 5 (The Crystal) | Resolution Major | C# major, no reverb, resolves to Middle C |

### The Echo Puzzle: Sound as tool. Visible echoes push fog, rattle stones, reveal hidden objects. Acoustic alchemy prototype.

### Undercity Version: "Tuesday variant" — deeper bass (bone-deep), arpeggios out of phase, bone architecture.

---

## 7. TRI-MODE AUDIO + HAPTIC OVERLAY

| State | Hz | Audio | Haptic Pattern |
|---|---|---|---|
| Living Inn | 42 | Warm, acoustic, growing, stone chimes, 50 BPM | Deep slow rumble [200ms on, 400ms off] |
| Shadow Inn | 84 | Cold, biomechanical, glass-metal, sub-bass pressure | Cold sharp pulse [30ms on, 50ms off] |
| In-Between | 63 | Liminal, amber chimes, phase-shifting, theta beating | Medium pulse [50ms on, 100ms off] |

### Additional Haptics
- 111Hz Gargoyle: single long pulse [800ms on, 1200ms off]
- 50 BPM Canopy: sway rhythm [600ms on, 600ms off]
- Electrostatic: very fast subtle [10ms on, 10ms off]
- Bone Conduction: continuous low [500ms on, 200ms off]

---

## 8. BEAD COMPOSER AUDIO ENGINE

Spec: `docs/geode_inn_bead_composer.md`

- Each bead plays its frequency on placement (Mohs to Hz)
- Metal wire produces constant drone (copper ~79Hz, silver ~82Hz, gold ~80Hz, bronze ~76Hz)
- Finish affects audio: matte = dampened, polished = amplified, oxidized = darkened, textured = roughened
- Final piece is a "Wearable Song" — the arrangement IS a melody

---

## 9. RESONANCE CARD GAME AUDIO

Spec: `docs/geode_inn_card_game_framework.md`

| Frequency | Card Play Sound |
|---|---|
| Song (42Hz) | Warm hum, growing |
| Silence (Nyx) | Dead silence — 1s audio cut |
| Fire (50 BPM) | Heartbeat thud, warm crackle |
| Water (16-42Hz) | Deep liquid sub-bass wave |
| Stone (111Hz) | Lithophone strike, deep ring |
| Root (Mycorrhizal) | Network hum, connecting tones |
| Complete Chord (win) | All 6 frequencies = Nine Songs Chord |

---

## 10. WHAT'S STILL NEEDED

### Ready:
- 368 procedural audio files
- 74 Godot voice profiles
- All system constants coded
- 12 classical dub tracks
- Audio synthesis engine (Python, reproducible)

### Needs Composer:
- Zone instrument layers (live recordings per Section 4)
- In-Between: full Moonlight Sonata on fortepiano + sub-bass
- Music Room: fortepiano, violin, cello for interactive play

### Needs Game Writer/Programmer:
- Godot Audio Manager script (loads assets, zone transitions, tri-mode shifting, haptics)
- In-Between physics sounds (stone on stone, ash footsteps, wind, water)
- In-Between puzzle completion notes (each puzzle = different frequency)
- Tumble Run audio (boost, gem collect, stuck, wiggle, world complete)
- Sandfall audio (sinking sand, descent simplification)
- Knotwork audio (metal drone + stone chimes, drag vs click mode)
- UI sounds (button = stone tap, menu = wooden creak, notification = chime, achievement = stone chord, error = dissonant tone, portal = ascending chime)
- Door/unlock sounds per zone (wood creak, stone grind, glass harmonica, fog dissipate)
- Haptic integration (Steam API for PC, platform haptics for mobile)
- Bead Composer real-time engine in Godot
- Resonance card game audio triggers

### Needs Voice Actor (if voiced):
- 74 profiles provide casting/recording direction

---

## 11. FILE MAP

```
beta/assets/audio/
  stone_chimes/     298 chimes + index.json
  system_tones/     14 frequency tones
  zone_ambient/     20 zone drone beds
  game_audio/       6 game stingers
  music_room/       18 fortepiano + geode cave + Nine Songs
  classical_dub/    12 composer adaptations

godot_project/scripts/
  geode_inn_voice_profiles.gd   74 profiles + constants (1,426 lines)

library/mechanics/
  geode_inn_complete_audio_manifest.md   THIS DOCUMENT
  geode_inn_master_audio_voice_system.md  Master audio doc

library/zones/
  geode_inn_in_between_builder_spec.md   In-Between audio spec

docs/
  geode_inn_music_room.md                Composer storyline
  geode_inn_nine_muses.md                Solfeggio mapping
  geode_inn_bead_composer.md             Audio engine spec
  geode_inn_card_game_framework.md       Card game audio
  geode_inn_song_of_making.md             Song narrative
  geode_inn_unified_resonance_architecture.md  Resonance overlay
  geode_inn_personal_arcade_collection.md     Arcade audio defaults
```

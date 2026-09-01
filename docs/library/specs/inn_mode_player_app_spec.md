# THE INN MODE PLAYER APP — PRODUCT SPECIFICATION
## Geode Inn Audio Platform — Standalone DSP Application

### Overview
The Inn Mode Player is a standalone application that transforms any audio — the audiobook, the podcast, the novel narration, or any music — by processing it through the Geode Inn's 7 DSP room profiles in real-time. It is the audio product that makes the Inn's acoustic architecture portable.

The player takes the 50 BPM heartbeat, the 42Hz/84Hz frequency architecture, and the 7 room-specific reverb profiles and applies them to whatever the listener is hearing. The Inn goes with you.

---

## I. PLATFORM TARGETS

### Phase 1 (MVP)
- Desktop app (macOS + Windows) — Electron wrapper around Web Audio API
- Web app (browser-based, runs in Chrome/Edge/Safari)
- No mobile yet — DSP processing on mobile requires native code

### Phase 2
- iOS app (Swift + AVAudioEngine)
- Android app (Kotlin + OboeAudio)
- Both use native DSP for real-time processing

### Phase 3
- Steam app (integrated with the Geode Inn Steam hub)
- TV app integration (processing audio output on TV platforms)

---

## II. THE 7 DSP ROOM PROFILES

Each room profile is a preset chain: EQ → Reverb → Frequency Layer → Heartbeat → Spatial

### Room 1: Main Floor
**Reverb:** 1.2s decay, warm, wooden (IR: small tavern)
**EQ:** Warm midrange boost (200Hz-500Hz +3dB), gentle high roll-off above 8kHz
**Frequency Layer:** 42Hz drone at -18dB (subliminal)
**Heartbeat:** 50 BPM pulse at -24dB (felt, not heard)
**Spatial:** Wide stereo, center-focused vocals, ambient spread
**Use:** Default mode. Most audiobook chapters, most podcast episodes. The Inn's default acoustic.

### Room 2: Archive / Library
**Reverb:** 2.5s decay, tall space, stone (IR: cathedral library)
**EQ:** Flat with slight high shelf (+2dB above 10kHz for clarity)
**Frequency Layer:** 42Hz at -24dB (very subtle)
**Heartbeat:** 50 BPM at -30dB (barely there)
**Spatial:** Narrow stereo, intimate, close-mic'd feeling
**Use:** Reading sessions, Archive chapters, quiet moments, Modern Legends Nook

### Room 3: Campgrounds / Campfire
**Reverb:** 0.8s decay, outdoor, open (IR: forest clearing)
**EQ:** Warm, slightly muted (high cut above 6kHz -3dB)
**Frequency Layer:** 42Hz at -15dB (present)
**Heartbeat:** 50 BPM at -18dB (audible)
**Additional:** Fire crackle layer at -20dB (continuous, randomized)
**Spatial:** Wide stereo, immersive, surrounding
**Use:** Campfire stories, communal moments, singalongs, relaxed listening

### Room 4: Catacombs
**Reverb:** 4.0s decay, vast, stone (IR: underground cavern)
**EQ:** Sub-bass boost (40-80Hz +4dB), midrange cut (1-3kHz -2dB)
**Frequency Layer:** 42Hz at -12dB (prominent)
**Heartbeat:** 50 BPM at -15dB (clearly felt)
**Spatial:** Extremely wide, diffuse, distant
**Use:** Ancient civilization chapters, deep history, Hollow Earth sections, catacomb exploration

### Room 5: Staircase (Ascending)
**Reverb:** 1.8s decay, vertical space (IR: stairwell)
**EQ:** Brightening with each "step" — high shelf increases +0.5dB per minute
**Frequency Layer:** 42Hz ascending — pitch rises 1 semitone per 5 minutes
**Heartbeat:** 50 BPM, gradually accelerating to 55 BPM over 10 minutes
**Spatial:** Tall, vertical, echoes from above
**Use:** Alchemical chapters, transition scenes, transformation moments, audiobook staircase sections

### Room 6: Shadow Inn (84Hz)
**Reverb:** 3.5s decay, cold, metallic (IR: stone corridor)
**EQ:** Sub-bass emphasis (80Hz +5dB), high cut above 5kHz -4dB (muffled)
**Frequency Layer:** 84Hz drone at -10dB (prominent — the Shadow frequency)
**Heartbeat:** 50 BPM at -12dB (heavy, oppressive)
**Additional:** Detuning: all audio shifted -7 cents (subliminal wrongness)
**Spatial:** Narrow, claustrophobic, close walls
**Use:** Shadow scenes, Gorgon's Garden, Undercity, Hollow Men, 84Hz frequency-shifted content, horror/thriller chapters

### Room 7: Cosmology (Electrostatic)
**Reverb:** 6.0s decay, infinite, ethereal (IR: observatory dome)
**EQ:** High shimmer boost (10-16kHz +6dB), sub-bass removed below 60Hz
**Frequency Layer:** No drone — instead, shimmering overtones (12-16kHz random sweeps)
**Heartbeat:** 50 BPM at -27dB (barely a ghost)
**Spatial:** Ultra-wide, beyond stereo, surrounding, infinite
**Use:** Cosmology chapters, creation myths, celestial scenes, epilogue, ending sequences

---

## III. THE FREQUENCY ENGINE

### Runtime Frequency Generation
The app generates three frequency layers in real-time using Web Audio API oscillators:

```
42Hz — The Song of Making
  - Sine wave oscillator at 42Hz
  - Volume: -12dB to -24dB (room-dependent)
  - Always present in 42Hz zones
  - Subliminal — felt in the chest, not consciously heard

84Hz — The Shadow Inn
  - Sine wave oscillator at 84Hz
  - Volume: -10dB to -15dB (when active)
  - Present only in Shadow zones
  - Physical pressure — the "stay" frequency

111Hz — Gargoyle Watchers
  - Sine wave oscillator at 111Hz
  - Volume: -20dB (always subliminal)
  - Present in all rooms as a background sentinel
  - The watchers are always awake
```

### The Heartbeat Generator
```
50 BPM heartbeat:
  - Synthesized kick drum (sine wave, 50Hz fundamental, 150ms decay)
  - Volume: -12dB to -30dB (room-dependent)
  - Plays exactly every 1.2 seconds (60/50 = 1.2s)
  - In Staircase mode: accelerates gradually
  - In Ending mode: decelerates to 42 BPM (1.43s per beat)
  - Drops out entirely at 3 key moments:
    1. Boot Sequence Phase 1 (before the Inn wakes)
    2. Final Room scene (the fire going out)
    3. True silence moments in the In-Between
```

---

## IV. THE TRANSITION ENGINE

When switching between room profiles, the app crossfades over 3 seconds:
- Reverb IR crossfade (convolution reverb blends)
- EQ morph (parametric EQ interpolates between settings)
- Frequency layer transition (42Hz fades out, 84Hz fades in, or vice versa)
- Heartbeat volume adjustment (smooth ramp)
- Spatial width adjustment (stereo width interpolates)

The transition is seamless. The listener should feel like they're walking from one room to another, not switching presets.

### Auto-Room Mode
The app can read timestamped metadata in the audio file:
```json
{
  "chapters": [
    { "start": 0, "end": 180, "room": "main_floor" },
    { "start": 180, "end": 420, "room": "catacombs" },
    { "start": 420, "end": 600, "room": "staircase" },
    { "start": 600, "end": 720, "room": "shadow_inn" }
  ]
}
```
When Auto-Room is enabled, the app switches room profiles automatically based on the chapter metadata. This is the intended mode for the audiobook and podcast — the listener doesn't manage rooms, the story does.

---

## V. AUDIO INPUT SOURCES

### 1. Audiobook (Primary)
- Full-cast production with 74 voice profiles
- Chapter metadata for auto-room switching
- Stone tone triggers embedded as metadata (Mohs → frequency)
- 3 alternate endings (STAY/LEAVE/HIDE) as branching paths
- The Inn Mode Player IS the intended playback system for the audiobook

### 2. Podcast (Daily Echoes)
- Episode metadata for auto-room switching
- Cold open + story + echo structure mapped to room transitions
- Episodes can be played in any room (manual mode) or auto-room

### 3. Novel Narration
- Single-narrator version of "A Song of Stone and Silence"
- Same chapter metadata structure
- Can be played in any room or auto-room

### 4. External Audio (Universal Mode)
- User can load any audio file (MP3, WAV, FLAC, OGG)
- Manual room selection — user picks which Inn room to process through
- This turns the Inn Mode Player into a general-purpose DSP platform
- Listen to any music "inside the Inn"
- The 50 BPM heartbeat and frequency layers can be toggled on/off

### 5. Live Microphone (Inn Mode Live)
- App processes microphone input through the room profile
- Real-time reverb and frequency processing
- Use case: live readings, roleplay sessions, tabletop game ambiance
- The Inn's acoustics applied to a real voice in real-time

---

## VI. THE STONE TONE TRIGGER SYSTEM

### Mohs Hardness → Frequency Mapping
When the audiobook mentions a specific stone, a tone plays 12dB below the narration:

| Mohs | Frequency | Note |
|---|---|---|
| 1 (Talc) | 174Hz | F3 |
| 2 (Gypsum) | 196Hz | G3 |
| 3 (Calcite) | 220Hz | A3 |
| 4 (Fluorite) | 247Hz | B3 |
| 5 (Apatite) | 277Hz | C#4 |
| 6 (Orthoclase) | 311Hz | D#4 |
| 7 (Quartz) | 349Hz | F4 |
| 8 (Topaz) | 392Hz | G4 |
| 9 (Corundum) | 440Hz | A4 |
| 10 (Diamond) | 494Hz | B4 |

### Implementation
- Audiobook metadata includes stone-mention timestamps
- At the timestamp, the app triggers a sine wave at the mapped frequency
- The tone plays for 3 seconds with a gentle fade-in/fade-out
- Volume is -12dB relative to narration (audible but not distracting)
- In the Music Room, these tones can be played interactively (the Bead Composer uses them too)

---

## VII. USER INTERFACE

### Design Philosophy
The UI is the Inn, not a media player. No transport controls visible by default. The player looks like a room.

### Main View
- Full-screen room visualization (dark stone, Celtic knotwork, warm glow)
- Room name displayed in serif gold text at top
- A fire animation in the lower portion (procedural, responds to audio)
- No play/pause/seek controls visible — they appear on hover/tap
- Frequency visualization: 42Hz/84Hz/111Hz displayed as subtle pulsing rings
- Heartbeat visualized as a gentle pulse in the knotwork pattern

### Room Selection
- A "doorway" at the bottom of the screen
- Clicking the doorway shows 7 doors, each labeled with a room name
- Selecting a door transitions to that room (3-second crossfade)
- The doors are styled as Inn doors — wood, brass, stone arch

### Settings (Hidden by Default)
- Heartbeat toggle (on/off)
- Frequency layers toggle (42Hz/84Hz/111Hz individual toggles)
- Auto-Room mode toggle
- Input source selection
- Volume (master + per-layer)
- Detuning amount (Shadow mode customization)
- Reverb decay adjustment (per room)

### The Fire
- Procedural fire animation in the lower screen
- Fire intensity responds to audio amplitude
- Fire color changes with room:
  - Main Floor: warm orange/gold
  - Archive: soft amber
  - Campgrounds: bright crackling orange
  - Catacombs: deep red embers
  - Staircase: blue-white (transmutation fire)
  - Shadow Inn: cold blue (not warm)
  - Cosmology: white-gold starlight (not fire — star shimmer)

---

## VIII. TECHNICAL ARCHITECTURE

### Web Audio API Node Graph
```
Input Source (file/mic)
  → Input Gain
  → Parametric EQ (room-specific)
  → Convolution Reverb (room IR)
  → Dry/Wet Mix (70% wet, 30% dry)
  → Stereo Width (room-specific)
  → Master Output

Frequency Layer:
  42Hz Oscillator → Gain (-18dB) → Master Output
  84Hz Oscillator → Gain (-10dB) → Master Output (Shadow only)
  111Hz Oscillator → Gain (-20dB) → Master Output

Heartbeat:
  Scheduled trigger (50 BPM) → Synthesized kick → Gain (-18dB) → Master Output

Fire Layer:
  Noise generator → Bandpass filter → Randomized amplitude → Gain (-20dB) → Master Output
```

### Impulse Response Files
Each room profile requires a convolution reverb IR file:
- main_floor_ir.wav (1.2s, tavern)
- archive_ir.wav (2.5s, cathedral)
- campgrounds_ir.wav (0.8s, forest)
- catacombs_ir.wav (4.0s, cavern)
- staircase_ir.wav (1.8s, stairwell)
- shadow_inn_ir.wav (3.5s, corridor)
- cosmology_ir.wav (6.0s, observatory)

IRs can be synthesized (algorithmic reverb) or recorded (real space captures). For the MVP, algorithmic reverb with parameters matching the room profiles is sufficient. For production, real IR captures from appropriate spaces would elevate the quality.

### File Formats
- Input: MP3, WAV, FLAC, OGG
- Output: Real-time (no file rendering in MVP)
- Metadata: JSON (chapter markers, stone triggers, room assignments)
- IR files: WAV (mono, 32-bit float)

---

## IX. MONETIZATION

### Free Tier
- Web app only
- 3 room profiles (Main Floor, Archive, Campgrounds)
- External audio loading (any file)
- Heartbeat + 42Hz layer
- No auto-room mode

### Premium Tier ($4.99 one-time or $1.99/month)
- All 7 room profiles
- Auto-Room mode (metadata-driven)
- Stone tone trigger system
- Live microphone mode
- Desktop app (macOS + Windows)
- Custom room tuning (reverb, EQ, detuning controls)

### Bundle Tier ($9.99)
- Premium Inn Mode Player
- Full audiobook (when available)
- Full podcast archive
- Novel narration
- All Soulstice Melodies as ambient source material

### Steam Integration
- The Inn Mode Player is built into the Steam hub
- No separate purchase needed for Steam users
- The Steam version includes overlay support and controller navigation

---

## X. RELATIONSHIP TO OTHER PRODUCTS

| Product | Relationship |
|---|---|
| Audiobook (Product 8) | The Inn Mode Player IS the audiobook player. The audiobook is designed for it. |
| Podcast (Product 14) | Podcast episodes play through the Inn Mode Player with auto-room. |
| Novel (Product 6) | Novel narration plays through the Inn Mode Player. |
| Soulstice Melodies (Product 9) | The 6 composed tracks are available as "source material" in the player. |
| Web Beta (Product 1) | Web version embedded in geodeinn.com — browser-based Inn Mode. |
| Steam Hub | Desktop version integrated into the Steam app. |
| TV Apps | Phase 3 — TV audio processed through room profiles. |
| Tabletop Game (Product 12) | Live microphone mode for game sessions — the Inn's acoustics for tabletop play. |
| Bead Composer (Product 3) | Shares the stone tone trigger system (Mohs → frequency). |

---

## XI. DEVELOPMENT ROADMAP

### Phase 1 — MVP (Web + Desktop, 3 rooms)
1. Build Web Audio API node graph
2. Implement 3 room profiles (Main Floor, Archive, Campgrounds)
3. External audio file loading
4. 42Hz + heartbeat layers
5. Basic room selection UI (doorway navigation)
6. Fire visualization
7. Electron wrapper for desktop
**Estimated: 40 hours**

### Phase 2 — Full Rooms + Auto-Room
1. Add remaining 4 room profiles
2. Auto-Room metadata system
3. Stone tone trigger system
4. Live microphone input
5. Settings panel
6. Premium tier gating
**Estimated: 30 hours**

### Phase 3 — Mobile + Steam
1. iOS app (Swift + AVAudioEngine)
2. Android app (Kotlin + OboeAudio)
3. Steam integration
4. Real IR captures (replace algorithmic reverb)
5. TV platform integration
**Estimated: 60 hours**

### Total: ~130 hours

---

## XII. THE PHILOSOPHY

The Inn Mode Player is not an equalizer. It is not a reverb plugin. It is a place.

When someone listens to the audiobook through the Main Floor profile, they are sitting in the Inn's main room. The reverb is the room's reverb. The heartbeat is the Inn's heartbeat. The 42Hz hum is the Song of Making, present beneath every word.

When the story moves to the catacombs, the room changes. The reverb deepens. The heartbeat gets heavier. The space gets vaster. The listener doesn't just hear the catacombs — they are IN the catacombs.

This is the product that makes the Inn's acoustic architecture real. The IEM-based system, the 7 room profiles, the frequency layers, the 50 BPM heartbeat — they exist on paper as specs. The Inn Mode Player turns them into an experience.

The Inn goes with you. Not as a memory. As a room you can enter anytime, with any audio, on any device. The fire is always lit.

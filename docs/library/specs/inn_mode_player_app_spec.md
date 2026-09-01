# Inn Mode Player App — Product Specification

## Overview

Inn Mode is a downloadable audio processing application that transforms any audio input — music, voice, ambient sound — through the Geode Inn's 7 DSP room profiles. It is the standalone consumer version of the acoustic architecture that powers the game's audio engine. The Inn IS a transducer; this app makes any listener's device one too.

## Product Identity

- **Name:** Soulstice Melodies: Inn Mode
- **Platform:** iOS, Android, macOS, Windows, Linux
- **Engine:** Godot 4 (audio stream processing) + JUCE (DSP plugin core)
- **Price:** $9.99 one-time purchase (base app), $2.99/zone for additional room profiles
- **Bundle:** Included free with any Steam purchase of a Geode Inn arcade game

## Core Function

The app takes any audio source — streaming music, local files, microphone input, or system audio — and processes it through one of 7 room profiles in real time. The listener "enters" a room in the Inn and the audio reshapes itself to match that space.

## The 7 Room Profiles

### Room 1: The Main Floor (Matisse Warmth)
- **Reverb:** 1.2s, warm decay
- **EQ:** Slight midrange warmth (+2dB @ 500Hz), gentle high roll-off above 12kHz
- **Saturation:** Subtle tape warmth, 2% harmonic distortion
- **Low Layer:** 50 BPM heartbeat sync (optional, blends with incoming audio)
- **Vibe:** Sitting by the fire. Everything sounds like it belongs.

### Room 2: The Archive (Gorey/Dore Stillness)
- **Reverb:** 2.8s, dark cathedral decay
- **EQ:** Notch at 3kHz (removes harshness), boost below 200Hz
- **Saturation:** None — pure, clean
- **Low Layer:** 111Hz drone (the gargoyle watcher frequency)
- **Vibe:** Reading in a stone room. Sound has weight and distance.

### Room 3: The Staircase (Escher Ascent)
- **Reverb:** 1.5s, but pitch-shifted up 2 semitones on the wet signal
- **EQ:** Balanced, transparent
- **Saturation:** 1% tube warmth
- **Low Layer:** Ascending tone pattern — each "step" raises the drone by 1Hz
- **Vibe:** Climbing. The audio feels like it's going somewhere above you.

### Room 4: The Catacombs (Klimt Death+Life)
- **Reverb:** 4.0s, very dark, long tail
- **EQ:** Heavy low-pass at 8kHz, sub-bass boost below 60Hz
- **Saturation:** 5% distortion on low frequencies only
- **Low Layer:** 42Hz Song (the foundation frequency, felt not heard)
- **Vibe:** Underground. Sound travels through stone and comes back changed.

### Room 5: The Loch (Royo Water)
- **Reverb:** 3.2s, modulated (subtle pitch wobble in the tail)
- **EQ:** High-shelf boost above 10kHz (shimmer), low cut below 40Hz
- **Saturation:** 1.5% soft clip
- **Low Layer:** Water texture — filtered noise modulated at 50 BPM
- **Vibe:** Surface tension. Sound reflects off something liquid.

### Room 6: The Cosmology (Dali Void)
- **Reverb:** 6.0s, extremely diffuse, no early reflections
- **EQ:** Wide stereo enhancement, 7.83Hz Schumann resonance layer
- **Saturation:** None
- **Low Layer:** 7.83Hz Schumann calibration (Earth's natural frequency)
- **Vibe:** Floating. Sound has no walls. It just goes.

### Room 7: The Shadow Inn (Klimt Death)
- **Reverb:** 3.5s, reversed reverb tail (pre-delay creates backwards effect)
- **EQ:** Notch at 444Hz (removes the "living" harmonic), boost at 84Hz
- **Saturation:** 8% hard distortion on transients only
- **Low Layer:** 84Hz Shadow frequency (the inverse of the Song)
- **Vibe:** The mirror. Everything sounds like it's coming from the other side of a wall.

## Interface Design

### Visual
- Dark subterranean stone background (matching web beta aesthetic)
- 7 room buttons arranged vertically (matching the Inn's descent architecture)
- Celtic knotwork gold borders on active room
- No waveform display — the interface is a place, not a tool
- 50 BPM pulsing gold accent on the active room (the heartbeat)

### Controls
- Room selector (7 buttons)
- Input source selector: System Audio / Microphone / File / Streaming
- Mix knob: 0% (dry) to 100% (fully processed)
- Heartbeat toggle: On/Off (adds 50 BPM layer)
- Volume
- That's it. Five controls. The Inn doesn't clutter.

### Frequency Shift Mode
- Toggle: Living (42Hz) / Shadow (84Hz) / In-Between
- Living: rooms sound warm, full, alive
- Shadow: rooms sound inverted, cold, still — reverb tails reverse, warmth becomes chill
- In-Between: rooms oscillate slowly between the two states at 50 BPM

## Technical Architecture

### Audio Pipeline
1. Input capture (JUCE AudioProcessor captures system/audio/mic input)
2. Pre-EQ (room-specific EQ curve)
3. Reverb engine (convolution reverb with room-specific impulse responses)
4. Saturation stage (analog-modeled harmonic distortion)
5. Low-frequency layer mixer (42Hz/84Hz/111Hz/7.83Hz drones)
6. Heartbeat sync (50 BPM amplitude modulation on the low layer)
7. Output (processed audio routed to system output)

### Impulse Responses
- Each of the 7 room profiles uses a custom-generated impulse response
- IRs are synthesized, not recorded — ensures legal independence and perfect frequency control
- Each IR is 4-8 seconds long, 48kHz, 32-bit float
- IRs stored as .wav files in the app bundle (offline-first, no streaming)

### Low-Frequency Drone Engine
- 4 sine wave oscillators: 42Hz, 84Hz, 111Hz, 7.83Hz
- Each oscillator has independent gain and fade controls
- Drones are felt (sub-bass) more than heard
- Heartbeat: 50 BPM amplitude modulation applied to the drone bus
- At 3 key moments (user-defined triggers), the heartbeat drops out for 4 beats — the "silence before the return"

### Offline-First
- All processing happens locally on the device
- No cloud connection required
- No data collection, no telemetry, no account needed
- Room profiles are bundled, not streamed

## Monetization

### Base App ($9.99)
- Includes 3 rooms: Main Floor, Archive, Loch
- Full functionality, no limitations on processing time

### Zone Packs ($2.99 each or $14.99 for all 4)
- Catacombs Pack: Catacombs + Shadow Inn
- Heights Pack: Staircase + Cosmology
- Complete Pack: All 4 remaining rooms

### Bundle Deals
- Free with any Geode Inn Steam game purchase (redeem with proof of purchase)
- Free with Soulstice Melodies album purchase
- 50% off with Share Wood subscription (any tier)

## Patent Integration

Inn Mode is the consumer implementation of the provisional patent for "frequency-based acoustic environment processing." The patent covers:
- The 42Hz/84Hz inverse frequency pair as acoustic processing parameters
- The 50 BPM heartbeat modulation layer
- The 7-room DSP profile system tied to a narrative environment
- The frequency shift mode (Living/Shadow/In-Between) as real-time audio processing

## Accessibility

- VoiceOver/TalkBack support for all controls
- Haptic feedback on room selection (each room has a unique vibration pattern matching its frequency)
- Low-vision mode: enlarged text, high-contrast borders
- Hearing-impaired mode: visual representation of the 42Hz/84Hz drones as pulsing color
- No flashing animations (photosensitivity safe)

## Version Roadmap

### v1.0 (Launch)
- 7 room profiles
- System audio + file input
- macOS + Windows
- Frequency shift mode
- Heartbeat layer

### v1.1 (3 months post-launch)
- iOS + Android
- Microphone input (sing/play through the Inn)
- Streaming service integration (Spotify, Apple Music)

### v2.0 (6 months post-launch)
- Custom room builder (users create their own DSP profiles)
- Share rooms with other users
- Record + export processed audio
- Inn Mode for video (process video audio in real time)

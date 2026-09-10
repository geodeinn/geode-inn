# Geode Inn Audio Data Structure — Implementation Guide
**For:** The fizgigs (builder team) | **Version:** 1.0 | **Date:** 2026-09-09

## The Answer to "What Data Structure?"

One canonical JSON file is the single source of truth: **`docs/library/audio/geode_inn_audio_data_structure.json`**

Both systems read the same file:

- **The web app (Base44):** create the four suggested entities (`AudioZoneProfile`, `StoneTone`, `NpcLeitmotif`, `AudioEventTrigger`) and seed them from the JSON. The web UI (zone pages, stone tooltips, the Archive) then reads from the entities like any other data.
- **Godot (the games):** load the same JSON at boot as a config resource. `StoneTone` becomes the chime table for the geode cave; `zoneAudioProfiles` becomes the music controller's state machine; `systemConstants.heartbeat` drives the global 50 BPM clock.

No duplication. If the Inn changes a frequency, it changes once, in one file.

## Why This Structure (the philosophy, 30 seconds)

The Inn's audio is a transducer chain, not a playlist. The universal Song (42Hz) enters, and the building splits it the way a high-end IEM splits signal: dynamic drivers (stones — frequencies you feel), balanced armature (characters — frequencies you hear), electrostatic (cosmology — frequencies you sense), bone conduction (catacombs — frequencies you know). Every zone record in the JSON says which band of the chain it lives in.

The fusion doctrine is the one non-negotiable: do not layer elements — fuse them. Heartbeat, Song, stone tones, and leitmotifs are one inseparable organism. The tri-mode shift (Living 42Hz ↔ Shadow 84Hz) is tectonic — a hard cut — never a crossfade.

## Build Order

1. **Constants first.** The 50 BPM heartbeat clock and the 42Hz/84Hz mode roots are global. Everything else references them.
2. **Seed `StoneTone` next** — it's mechanical and complete: 200 stones, Mohs hardness → frequency (the Mohs scale maps onto one octave of C major; the mineral kingdom literally sings in one key). Each stone in the web app can then show/sound its own tone.
3. **Seed `AudioZoneProfile`** from the nine zones in the JSON (the 37-zone expansion reuses the same schema; the nine are the parents).
4. **`NpcLeitmotif` and `AudioEventTrigger`** fill in as leitmotifs are composed and events (gargoyle hums, Whisper Layer pulses, Egg Hatchery) come online.

## Gotchas from the Canon

- Stone tones fire **12dB below narration** — always under the voice, never competing.
- The heartbeat drops to silence at exactly three moments: the Murmur, the Final Room, the Epilogue's last beat. Everywhere else it runs. Night scenes run it at 40 BPM.
- The staircase music **rises in key as the player climbs** — that's a property of the zone profile, not a one-off composition.
- Hollow Men runs at 50 BPM with the 84Hz inverse — it's the only arcade game keyed to the Shadow.
- Gargoyle hums are the adaptive pair (Gatekeeper, Keeper) plus four fixed: 111, 64, 528, 432 Hz.

Questions, edge cases, new instruments: file an issue or leave a comment in the builder chat. The librarian answers his mailbox. — Elio

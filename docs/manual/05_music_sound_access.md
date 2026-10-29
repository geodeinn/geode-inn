# Part 5: Music, the Song, Sound and Access

## How to read this part

This part covers everything the Inn does with sound, and everything it does so that every kind of player can use the building. Sound and access sit together because the client ruled them as one idea: meaning has many roads, and none of them is the only one.

**Status words.** **Ruled** means the client decided or agreed (date given). **Proposed** means Elio suggested it and there is no ruling. **Open** means it waits on the client. Dates are 2026.

**Source of truth.** Where a rule lives in the GitHub repo, the path is given (repo = the repo in the audit copy of Oct 22). Many Sep 26 to Oct 15 rulings were saved only in Elio's memory or notes and never reached the repo. Those are marked "not in the repo".

**Main files in the repo for this part:**

| Topic | Path |
|---|---|
| Master audio direction (style targets, zone map, karaoke) | `docs/geode_inn_master_audio_direction.md` |
| Audio DNA, Spiral Heartbeat | `docs/library/audio/geode_inn_audio_dna_spec.md` |
| Audio master JSON | `docs/library/audio/geode_inn_audio_data_structure.json` |
| JSON implementation guide | `docs/library/audio/geode_inn_audio_data_structure_spec.md` |
| Coverage map (tracks, gaps, 23 targets) | `docs/library/audio/geode_inn_complete_audio_coverage_map.md` |
| Arcade profiles, Song-Catchers, treatment layer, Sync Law | `docs/library/audio/arcade_music_profile_master_spec.md` |
| Staircase track | `docs/library/audio/staircase_ascending_track_spec.md` |
| Distinct Tempos Census | `docs/library/geode_inn_distinct_tempos_census.md` |
| The Tap | `docs/zone_specs/geode_inn_the_tap_spec.md` |
| EchoMelody schema | `docs/library/specs/geode_inn_echo_songbook_schema.md` |
| Every-Mind Welcome charter | `docs/zone_specs/geode_inn_every_mind_welcome.md` |
| Hands Version (ASL) | `docs/zone_specs/geode_inn_comedy_troupe_registry.md` (section "The Hands Version") |
| Spoken Road and Host handbook | `docs/library/specs/geode_inn_speaking_to_the_building_spec.md` |
| TV deployment | `docs/library/specs/geode_inn_tv_deployment_spec.md` |
| Fair Descent (mobility) | `docs/zone_specs/geode_inn_fair_descent_movement_spec.md` |
| Inn Mode player app | `docs/library/specs/inn_mode_player_app_spec.md` |
| Godot audio manifest | `godot_project/assets/audio/AUDIO_MANIFEST.md` |

Note: the audit copy of the repo holds no audio files (no `.wav`, `.mp3` or `.ogg`). The manifest names them, but the files themselves were not checked.

**More files in the repo from the founding period (checked present):** `docs/geode_inn_music_direction.md` (Jul 22 music direction), `docs/geode_inn_pulse_line.md`, `docs/zone_specs/geode_inn_pulse_line_master_spec.md`, `docs/geode_inn_voice_profile_translation_reference.md`, `godot_project/scripts/geode_inn_voice_profiles.gd`, `tools/voice_profile_extractor.py`, `tools/batch_extract.py`, `docs/geode_inn_unified_resonance_architecture.md`, `docs/systems/geode_inn_song_of_making_solidified.md`, `library/mechanics/geode_inn_complete_audio_manifest.md`. The commit log also names `GeodeInnVoiceProfile.gd` and a Moonlight Sonata dub document; neither was found in the repo under that name.

## Where it started (July 12 to August 30)

Sources: the early chat (Jul 12 to about Aug 23), Before the Song (late August canon) and the commit log (Aug 21 to 31).

- **Jul 22, Ruled.** The client decided the music is classical and cultural music, stylized in an electronica style that fits the time and area. A music direction file followed: the classical or cultural instruments of the region and era are the soul, electronica is the body. Tracks must loop cleanly for games.
- **Jul 22, first sound rules.** The staircase ascends in key as you climb. The geode cave is nearly silent when empty and becomes a symphony of chimes as it fills, each stone ringing by its hardness. The dragon's cave plays at 50 BPM, a sleeping heartbeat. The Stone Circle Chamber is the deepest tone the Inn ever makes. No music had been produced yet; the client's sound research (volumes of music, a book chapter on sound) was promised and not delivered in this period.
- **Jul 22, Proposed.** Elio suggested processed Gregorian chant for the catacombs and an "acoustic alchemy" wing on the staircase for sound research. The 111 Hz claims were treated as folklore, filed as Modern Day Legends material, not as proven science.
- **Aug 20 to 21, Ruled.** The Owl sometimes answers a cosmic question with only "42" (rare, about 2 to 5 percent). Elio then fixed the six gargoyle frequencies and the hidden "42" system: 42 Hz is felt, not heard, and is the root of the others. Frequencies are ambiance, never direct neurological stimulation.
- **Aug 21, Ruled.** The world music is to be recorded by a female lead vocalist and a musician partner, "the Inn's resident musicians" (not NPCs or classes). That is a future phase.
- **Aug 21, Ruled.** Late that day the client asked for a version of Mozart and other masters. Elio built the Music Room with nine Song-catchers and the client agreed (see 4.6).
- **Aug 22 or later, Ruled.** Dialogue is text plus tone. Each character gets a cadence and tone voice profile, no voice acting, and a few optional recorded lines only for key moments. The client approved a voice-profile extraction tool (see 14).
- **Aug 22 or later, Ruled.** The client asked for a visual heartbeat so nobody is put off by touch or hearing overload. Elio specified the Pulse Line and the client said it works (see 10.9).
- **Aug 23 to 31, Built (commit log).** `SONG_FREQUENCY_HZ=42` and `CANOPY_SWAY_BPM=50` went into the system globals (Aug 23). The tri-mode (Living 42 Hz, Shadow 84 Hz, In-Between) was written Aug 28. The Unified Resonance Architecture followed Aug 30. The audio set (368 files, then 387) and `AudioManager.gd` were reported Aug 31.
- **Late August, August canon.** Before the Song wrote the Moonlight Sonata dub for the In-Between, the water-layer music table, the hub soundscapes and the Norse Danheim direction (see 2.7).
- **Standing sanctuary rule (Aug 21, August canon, repeated in the early chat).** Sine-clamped lighting, no strobe, resonant not piercing sounds, no urgent timers, amber palette. Every technical decision serves "giving people their nervous system back."

---

## 1. The Song

### 1.1 What it is and the laws

The Song is the Inn's creation myth and its sound. The Inn is built as a transducer: one universal Song enters, and the building splits it the way a high-end in-ear monitor splits a signal (see 7.2). The Song is not a playlist. Everything the player hears is meant to be one sound.

**Core frequencies (Ruled; first stated Aug 31, rebuilt Sep 2 to Sep 9):**

| Value | What it is | Where it appears |
|---|---|---|
| 42 Hz | The Song. Living state. The root under every room. | `songHz` in the audio JSON |
| 84 Hz | Shadow, the octave of the Song. Not evil. | `shadowInverseHz` |
| In-Between | Third state. No clear time signature, no fixed root (`rootHz: null`). | `triMode.inBetween` |
| 50 BPM | The Inn's resting heartbeat (tempo, not pitch). | `heartbeat.bpm` |
| 40 BPM | Night law: the heartbeat slows. | `heartbeat.nightBpm` |
| 7.83 Hz | Schumann resonance, Earth's baseline. Calibration tone. | `schumannCalibrationHz` |
| 111 Hz | Watcher gargoyle. | `gargoyleFrequenciesHz` |
| 64 Hz | Listener gargoyle. | same |
| 528 Hz | Sage gargoyle (JSON only). | same |
| 432 Hz | Caller gargoyle (JSON); also the Atlantis Heart Crystal and a hum under the Rockies still point. | same |
| 0.3 Hz | Cosmic Egg and the Void pulse. One beat every 3.3 seconds. | Sep 3 and Oct 15 notes |
| 41.7 Hz | The Constant's previous-cycle Song; the player's own chime tone in the Music Room. | Sep 3, Sep 10, Sep 11 |
| 44 Hz | The future that must not arrive (Ragnarok approach). | Sep 3, Sep 19 |
| 40 Hz | The Sleeping Giants dreaming; the Catacombs threshold. | Sep 3, Oct 15 |
| 50 Hz | The unnamed fifth Golden Contract signature (the Constant's ship heart, Eres). A pitch, not a beat. | `docs/systems/geode_inn_song_of_making_solidified.md` (Aug 28) |
| 32,768 Hz | Quartz clock frequency. Stays outside the frequency canon; a teaching example in the Clockmaker's horology wing. | Ruled Sep 12 |
| 16 to 20 Hz | Lighthouse foghorn, "the heartbeat made audible below hearing." The coast hub's pedal tone. | August canon (Before the Song), early chat Aug 21 |
| 14 to 16 Hz | The Bloop, the earth baseline. | Early chat (Aug 22 or later) |
| 126 Hz and 168 Hz | With 84 Hz, the harmonic series of 42 Hz heard as the Observatory's clockwork whine. | August canon |
| 63 Hz | The In-Between as a hybrid mode, "later 63 Hz in AudioManager." Conflicts with `rootHz: null` above. | Built (commit, Aug 28) |
| 8 Hz | "42 + 50 = 8 Hz theta dream frequency," tied to the Moon as the Pirate drum. | Built (commit, Aug 27) |
| 100 BPM | Pulse Line constant in the Shadow Inn. | Built (commit, Aug 28) |
| 42 BPM | Starry Night garden tempo (the Song as tempo; the cypress moment drops every layer for 1.43 seconds) and the Presto dub of the In-Between. | Built (commit, Aug 24); August canon |

**The tri-mode audio law (Ruled; repo `triMode` and arcade spec):**
- The shift from 42 Hz to 84 Hz is a hard cut, never a crossfade. The chat logs call it tectonic. The Audio DNA spec describes it as a 200 ms earthquake with a sub-bass hit (Sep 2).
- There is one sanctioned crossfade: at the Fae Kingdom court border, exactly at the Between threshold (Seelie Gold and Unseelie Frost).
- There is one sanctioned simultaneous state: the multi-gem pickup in the Zelda-Style World, which rings both frequencies at once.
- Rule for builders: if a sound changes, change the audio JSON first (see the Sync Law below).

**The heartbeat (Ruled):**
- 50 BPM runs under every game and room. Zones that run faster keep it as a felt sub-bass pulse.
- It drops out at exactly three moments: the Murmur (prologue), the Final Room, and the Epilogue's last beat.
- Night scenes run it at 40 BPM.
- The Prism pulses at 50 BPM. The canopy sways on it (`canopySwayPeriodSeconds: 1.2`, which is one beat at 50 BPM).

**The Spiral Heartbeat (Ruled Sep 11, repo `geode_inn_audio_dna_spec.md`).** The 50 BPM beat is not a metronome click. It is a thrum built on the Lateralus cycle: 9/8 + 8/8 + 7/8, which is 24 eighth notes, the same length as three bars of steady 4/4. The client's own observation of the song's structure. The rules:
- At rest, the spiral is hidden. The player hears a resting pulse.
- In flow states (Geode Cave, Resonance Chambers, Stone Circle Chamber, the deep) the spiral becomes audible and always resolves home to the steady 24.
- At night (40 BPM) the spiral contracts and slows, it does not stop.
- When the heartbeat drops out at the three silences, the spiral stops too.
- The JSON should gain a `structure` field on the heartbeat set to `"spiral-thrum"`. This is **not yet in the JSON** (see 9).

**Stone tones (Ruled; JSON `stoneTones`).** A tone fires when a stone is named, at its hardness frequency, 12 dB under narration. Mohs 1 to 9 map to C4 (261.6 Hz, Talc) through D5 (587.3 Hz, Corundum), described as the C major scale. The Geode Cave is near-silent when empty (42 Hz hum only), one note with the first stone, and a chord when full.

**The Sync Law (Ruled Sep 11, evening; repo `arcade_music_profile_master_spec.md`).** Audio is the master layer. Every other discipline (art, narrative, mechanics) ships in sync with the audio spec. Any change that touches sound changes in the canonical JSON first, then spreads to the rest. The audio data structure is the production master clock. The rule on the page: "If it doesn't pass the ear, it doesn't ship."

**Other standing sound laws (all Ruled):**
- Fusion, not layering (the Tool doctrine): Song, heartbeat, stone triggers, leitmotifs and choir are one sound.
- Steal the method, never the melody: copyrighted songs are teachers, never playable. Only public-domain songs are sung in game.
- Win stings are warm resolutions. Lose states are never punitive (no buzzer, no screech). Anti-Skinner holds.
- Tones fire under the voice. Dialogue is never masked (Clarity Mix Law, charter Part Two).
- Region law (REC law): instruments match the region the zone names.
- Stone tones, leitmotifs and the zone hum together serve the Walk-by-Ear Law (section 10).

### 1.2 The Song / Track entry (template)

Use this for any composed or transformed track. Fields come from the Godot manifest and the 23-track targets in the coverage map.

| Field | What goes here | Example |
|---|---|---|
| Track name | Exact file title | `Soulstice_Signature` |
| Type | Composed, low-dub (transformed public-domain recording), or planned | Composed |
| Source | Original, or the public-domain work it was transformed from | `inn_bach_cello_lowlub` from Bach Cello Suite Prelude |
| File path | Where it lives in Godot | `res://assets/audio/music/Soulstice_Signature.wav` |
| Zone(s) / game(s) | Primary use, then borrowed uses | Hub, title, loading, World Map, Standing Stones, Tumble Run |
| Tempo (BPM) | Number or range; state if heartbeat-aligned | 50 |
| Frequency identity | 42 Hz Living, 84 Hz Shadow, 111 Hz, or neutral | 42 Hz |
| Style target | Method-teacher, never a melody to copy | Patty Gurdy hurdy-gurdy, Danheim, ascending key shift |
| Duration / loop | Length and loop plan | 4:00 loop; modulates D, G, C, F |
| Instrumentation | Lead, rhythm, bass, texture | Hurdy-gurdy, frame drum, 42 Hz drone rising per key |
| Heartbeat note | Aligned, felt below, or dropped out | Felt below |
| Shadow state | What the 84 Hz hard cut does to it | (state which instruments drop or invert) |
| Games served | List | The Alchemical Staircase |
| Status | Exists, borrowed, planned (priority), with date | Planned, HIGH |
| Ruling | Who decided and when | (date) |

Real example from the coverage map: **Track 2, "The Ascending Stair"**: Staircase zone; hurdy-gurdy lead, frame drum and bone percussion; 80 BPM, accelerating slightly with each modulation; 42 Hz drone that rises with each key change; 4:00 loop. Priority HIGH.

### 1.3 Where it lives

- Rules: `docs/geode_inn_master_audio_direction.md`, `docs/library/audio/` (all files above).
- Machine-readable truth: `docs/library/audio/geode_inn_audio_data_structure.json` (see 7).
- Godot: `godot_project/scripts/AudioManager.gd`, `beta/scripts/systems/AudioManager.gd`, and `godot_project/assets/audio/AUDIO_MANIFEST.md`.
- Base44: four entities suggested by the JSON (`AudioZoneProfile`, `StoneTone`, `NpcLeitmotif`, `AudioEventTrigger`). `NpcLeitmotif` exists but is empty. Whether the other three were created on the live app is not stated in the chat logs.
- Drive: a media folder the client was building for Elio (music, books, movies that fed the Inn) was promised but not named.

### 1.4 Open and to reconcile

- **Heartbeat dropout.** The Inn Mode rules say the heartbeat "drops out entirely in Cosmology." The core law says it drops out at exactly three moments. Pick one.
- **Two stone-frequency maps.** The JSON maps Mohs 1 to 9 to C4 through D5 (and has no Mohs 10). The Sep 3 chat describes Solfeggio frequencies, Mohs 1 (Talc) at 174 Hz up to Mohs 10 (Diamond) at 852 Hz, as the "body layer." These may be two layers, but the manual should say so once. Open.
- **Gargoyle pitches.** The JSON lists 111, 64, 528 and 432 Hz. The Aug 28 Song of Making file lists the same four as the Golden Contract signatures. A fifth, 50 Hz, is unnamed. Consistent, but 528 Hz and 432 Hz are in no other note. Verify.
- **Audio versus visual flip timing.** Audio: 200 ms tectonic shift (Sep 2). Visual: 450 ms flip (Sep 10). Likely two layers of one event. Open.

### 1.5 Early foundations of the Song (Jul 22 to Aug 31)

**The gargoyles.** Six gargoyles, each a sense of the living Inn-Tree. Frequencies were first set Aug 20 (early chat) and restated Aug 22 (Before the Song).

| Gargoyle | Place | Frequency | Meaning | Status |
|---|---|---|---|---|
| Watcher | Staircase | 111 Hz | Awareness of those who enter; transformation | Early chat Aug 20 (Elio; no separate ruling recorded) |
| Listener | Catacombs | 64 Hz | The deep places; grounding | Early chat Aug 20 |
| Sage | Modern Legends nook | 528 Hz | New stories; clarity | Early chat Aug 20 |
| Gatekeeper | Fae portal | Variable (portal state) | Awareness of other realms | Early chat Aug 20 (gave it 432 Hz); August canon says variable |
| Caller | Cosmology level | 432 Hz | The sky; cosmic harmony | August canon; the early chat left the Caller's place open |
| Keeper | Geode Cave | Adaptive: a harmonic of the player's most-collected stone category (42 Hz at the altar, per the commit log) | Self-sense | August canon; commit log |

The Keeper is also called Aughra, who lives in the Geode Cave. Before the Song does not settle whether gargoyle and character are one. Together the six form "the chord that is the Inn." They sign the Golden Contract (a scroll on a Preseli Blue Stone pedestal): "The Song shall not be silenced. All who learn it shall be bound to sing it forward. The Song is not owned, it is carried." The Aug 21 early chat says 111, 432, 528 and 64 Hz are harmonics of 42 Hz.

**The hidden "42".** 42 Hz is below human hearing and felt, not heard. The Owl answers "42" because it is the truest answer it knows. One crystal leaf of the Singing Tree also makes it. On Aug 28 the commit log reveals the unknown fifth signature as 50 Hz (Eres, the Constant's ship heart).

**Two clocks (early chat, Aug 22 or later; Elio's statement, no separate ruling).** The 42 Hz hum is the tree's frequency. The 50 BPM pulse is the sleeping giant's heartbeat. "The complete Song needs both." 50 BPM drives tree sway, the dragon heartbeat, the altar pulse, the lighthouse sweep, the Pirate's drum, the Arcana's gearwork heart, the cabbit's purr and the Pulse Line. At the coast 50 BPM means vigil; in the cave it means rest (August canon).

**The Messenger Principle (early chat).** Every vibration is a letter, every timing a word. Timing is the language, frequency the medium. The Thrum teaches the player to hear timing instead of pitch.

**Other frequency notes from the early chat.** Rememberers 40 Hz. The previous cycle's Song 41.7 Hz. A 41 Hz difference tone is made by the player between 40 and 42 Hz. The Prism Portal hums 7.83 Hz. The Atlantis plaza crystal 432 Hz. A completed Song at 44 Hz was proposed by Elio and not formally decided. Each cycle's Song is louder; the completed Song becomes the starlight crystal that seeds the next universe's Song.

**Unified Resonance Architecture (Built, commit, Aug 30).** A 42 Hz carrier is always present. A Solfeggio body layer maps Mohs hardness to frequency. IEM driver feel (BC, DD, BA, EST) and a timbre modifier sit on top. "No stone is a perfect harmonic," quartz is closest. This is the Sep 3 Solfeggio map in 1.4. File: `docs/geode_inn_unified_resonance_architecture.md`.

**Endgame frequencies (Built, commit, Aug 31).** STAY maps to 42 Hz, LEAVE to 111 Hz, HIDE to 84 Hz. Hollow Men Level 5 is TRUE SILENCE: 42 and 84 Hz cancel with a 3-second fade on all buses. That is a fourth heartbeat-silent moment and conflicts with the "exactly three" rule above.

**Resonance combat sounds (Ruled in the early chat Aug 22; commit Aug 23).** Dissonance types: tidal (counter 40 Hz), cardiac (counter 50 BPM), combustive (counter 528 Hz), suppressive (the culture's own suppressed frequency). The player picks a consonant frequency from the Song Spectrum. The right one clarifies, the wrong one distorts. Victory is harmonization, never a kill.

**Recognition Frequency (Built, commit, Aug 24).** Two rare frequencies in proximity warm the light, three open the architecture, four or more make the Singing Vines bloom unscheduled.

**Early Open and to reconcile.**
- **Gatekeeper and Caller at 432 Hz.** The Aug 21 early chat gives 432 Hz to both, and Elio did not reconcile it. Also, the pinball text calls Fluorite 432 Hz "the Caller," Lapis 111 Hz "the Watcher" and Rose Quartz 528 Hz "the Sage."
- **Caller's place.** Cosmology level (Before the Song) versus the base of the Upstairs (roster).
- **Fourth silence.** Hollow Men Level 5 versus the three-silences law.
- **In-Between pitch.** 63 Hz in `AudioManager.gd` (commit) versus `rootHz: null`.
- **Heartbeat tempo of the garden.** 42 BPM Starry Night (commit, Aug 24) versus the Norse note that 60 to 80 BPM is "not the 42 BPM Starry Night drag" (August canon). Consistent, but both are on record.
- **Audio count.** 368 files (Aug 31, commit) versus 387 after 19 procedural files. Verify the final number.
- **Murloc gargle and Danheim.** Before the Song names Danheim as the Norse sound ("IS the sound") and does not say whether tracks are licensed, original or sampled. Flag for the client before any build. The standing rule "steal the method, never the melody" (see 1.1) points to original arrangements.
- **Resident musicians.** The Aug 21 plan for a recorded vocalist and instrumentalist is a future phase with no schedule. Open.
- **Sound research.** The client's sound research was promised "whenever life allows." Not delivered in the early period. Open.

---

## 2. Zone-to-music map

### 2.1 What it is and the laws

Every zone has a sound identity: a style target, a technique, a tempo, a frequency, and a lead instrument that matches the zone's linework (the "crossover study," Sep 26). The base map is in the repo (`geode_inn_master_audio_direction.md`, section VII, 25 sonic zones). The client then ruled a second layer on Sep 26 that mostly **has not been written into the repo**. Elio offered twice to fold the rulings into the master audio doc. No yes was recorded.

**Laws for zone music:**
- Declare the frequency identity in the bass. The player should feel the change in the body when crossing a zone line (Ruled, repo).
- Tempo is biological time in zones with a descent: going down is a dirge, coming back is a second line (Ruled Sep 22 and 26).
- Style targets are textures, not songs to copy (Ruled).
- Zones that share a base track say so. No bespoke track unless the profile demands it ("the Inn fuses, it doesn't fragment").
- Crossover test (Proposed Sep 26, Elio): line weight is dynamics, line texture is timbre (clean ink = sine, dry brush = sawtooth, Klimt gold = celesta and harp, Royo = electric guitar with attack), outline is articulation, and "no outline, no attack" (Dali, Cosmology). Each zone should have a linework law and a lead instrument that rhyme. Elio said whether it becomes a real spec is the Witan's call.

### 2.2 Zone Audio Spec (template)

Fields come from the `AudioZoneProfile` entity in the JSON, plus what the rules require.

| Field | What goes here | Example (Staircase, Alchemy) |
|---|---|---|
| `zone` | Zone name | Staircase (Alchemy) |
| `level` | Level key | `staircase` |
| `iemBand` | Band of the transducer chain | Transition |
| `driver` | `dynamic`, `balancedArmature`, `electrostatic`, `boneConduction`, or a routing note | `crossoverRouting` |
| `bpmMin` / `bpmMax` | Tempo range | 75 / 85 |
| `leadInstruments` | List, region-matched | Glass armonica, flute, harp, metallic percussion |
| `processing` | List of treatments | Phase shifting; ascending arpeggios that rise in key as the player climbs |
| Frequency identity | 42, 84, or neutral | 42 Hz, ascending with the climb |
| Style target | Method-teacher | Tool "Lateralus" (ruled Sep 26); Patty Gurdy hurdy-gurdy |
| Primary / ambient track | File names, or "none yet" | None yet (HIGH priority) |
| Shadow state | What the hard cut does | (state) |
| Inn Mode preset | One of the 7 (or Forest) | (none assigned in the JSON) |
| Heartbeat behavior | 50, 40 night, felt below | 50 |
| Special triggers | Events that change the mix | Hurdy-gurdy starts when the player interacts with any character on the Staircase |
| Ruling date and status | Who and when | Ruled Sep 26 |

### 2.3 Where it lives

Repo: master audio direction section VII; JSON `zoneAudioProfiles` (**only 9 zones**: Main Floor, Cosmology, Staircase, Catacombs, Modern Legends Nook, Artisan Market, Fae Threshold, Seelie Court, Unseelie Court); coverage map section II; Godot `AUDIO_MANIFEST.md` `[zone_audio_map]`. The chat logs claim 37 numbered zones (`z01` Cosmology to `z37` Stone Circle Chamber) and 25 sonic zones. Only 9 have JSON records; the "37-zone expansion" is named in the guide but not built.

### 2.4 Current canon: the zone map

Status key for this table: **R** Ruled, **P** Proposed (no ruling), **Repo** in the repo only, no later ruling found.

| Zone | Style target and sound | Status and date | Notes |
|---|---|---|---|
| Hub / title | `Soulstice_Signature`, 50 BPM, 42 Hz | R (Aug 31) | Exists. |
| Cosmology | Jon Hopkins pads, overtone singing, glass harmonica, 60 to 70 BPM; no outline, no attack (Dali) | R Sep 26 | Repo also lists LOTR Shore. Track `Earth_&_Sky` exists. |
| Clockwork Skies | Classical guitar plus clock-tick percussion, 111 Hz, 70 to 85 BPM | Repo | No track yet (HIGH). |
| Main Floor day | Faun, Patty Gurdy, Bonobo; hurdy-gurdy, warm sub-bass; 80 to 95 BPM | Repo | Borrows `Royal_Fire`; needs own track (HIGH). |
| Main Floor evening | Harlots-style baroque; harpsichord, period strings | Repo | `Royal_Fire` plus Satie low-dub. |
| Campgrounds / campfire | Faun and Patty Gurdy tavern folk; 82 Hz baritone drone plus fire crackle; 50 BPM | R Sep 26 | Tracks exist. Karaoke lives here (section 5). |
| Staircase | Tool "Lateralus" (client's own list); hurdy-gurdy trigger; key rises as the player climbs | R Sep 26 | Replaces the repo's Patty Gurdy, Last Kingdom, Danheim target. The Turning track and Stage laws are in 2.5. |
| Catacombs | Heilung; frame drum, ney, bone-conduction sub-bass; 65 to 75 BPM. Egypt wing: Vivaldi Winter low-dub exists | R Sep 26 | Repo already had Heilung, Wardruna, Djawadi. Mesopotamia wing: Nytt Land (ruled earlier); Andean wing borrows `Forest_Depths`. |
| Undercity | Depeche Mode style (client's list) and Heilung (separate from Catacombs) | R Sep 26, **see 2.6** | Repo: Sweeney Todd tritone, Myrkur, 84 Hz Shadow. Borrows `Midnight_Garden`. |
| Deep caves | Vivaldi | R Sep 26 | |
| Greenhouse | Trent Reznor; hums, close-mic'd plants, fragile piano | R Sep 26 | The chat logs never define "Greenhouse." It is probably the Catalyst's greenhouse; unverified. |
| In-Between / limbo game | Moonlight Sonata low-dub (dubstep-style), 42 Hz minimum | R Sep 26 | Matches repo. No track yet (HIGH). |
| Dark Side / lava-lamp hybrid | Gregorian chant with a Pink Floyd undertone | R Sep 26 | |
| Fae Kingdom, Unseelie (Malachi) | Tangerine Dream | R Sep 26 | Repo: bass clarinet, prepared piano, Myrkur, Heilung. |
| Fae Kingdom, Seelie | Harlots-style baroque classical | R Sep 26 | **Replaced** Elio's Howard Shore (LOTR) target. Repo still says LOTR Shore. |
| Fae Crystal Gardens | Glass armonica, crystal bowls, wordless choir | Repo | No track. |
| Camelot | Shore (kept) | R | |
| Norse Coast | Danheim and Wardruna | R (earlier) | |
| Mesopotamia | Nytt Land lyre | R (earlier) | |
| Water Zones | Pride of Bedlam, Myrkur; bowed psaltery, waterphone; liquid 42 Hz | Repo | `Ocean's_Edge` exists. Siren and Locker rulings in 2.5. |
| Gorgon's Garden | Sweeney Todd tritone as the petrification sound; 84 Hz | Repo | `Midnight_Garden`. |
| Archive / Library | Satie low-dub, classical guitar | Repo | `inn_satie_gnossienne` exists. |
| Modern Legends Nook | Single piano, infinite reverb; near silence | Repo | No track. |
| Artisan Market | Hand drums, oud, kalimba, Nicola Cruz; 100 to 115 BPM | Repo | Borrows `Royal_Fire`. |
| Trovant Garden | Overdriven, distorted folk (Kossoff register) | P (client said "is brilliant"; open-items list says unruled) | See 2.6. |
| Yellowstone | Steam-work blues, stomps, harmonica, anvil percussion at 50 BPM, geyser as shift whistle, redcap work songs | R Sep 26 ("I love these") | Game-linked column. |
| Rockies | Gossip-belt tavern folk; still point is Arvo Part tintinnabuli with a 432 Hz hum | R Sep 26 | |
| Smokies / Appalachian | Aaron Copland (Appalachian Spring) | R Sep 26 | |
| Colorado Plateau | Bill Frisell ambient Americana | R Sep 26 | |
| Superstition | Morricone | R Sep 26 | |
| Mount Shasta | Lisa Gerrard, overtone singing over 7.83 Hz | R Sep 26 | |
| Egypt / pyramids | 111 Hz drone, nay flute, hand drums, Niyaz | R Sep 26 | |
| Atlantis | Vangelis | R Sep 26 | |
| Bayou | Field recordings (frogs, cicadas, slow water, moss hum) on the 42 Hz murmur; Dr. John gris-gris; French Quarter brass, jazz, zydeco. Mound City: Native flute over earth drum. River City: one fiddle, an old ballad. Circle City: just the hum | R Sep 26 ("clever") | Descent rule: dirge in, second line out. |
| Hollow Earth | Dark cello ostinato; one string voice added per district (nine) | Repo, arcade spec | Deep Harbor is the quietest district. |
| Share Wood (faire) | Celtic punk plus medieval folk, 120 to 160 BPM | Repo | No track. |
| World Map roads | Original travel-ostinato walking piece (drone, cycle, descending line) | R Sep 11 | Taught by Kashmir (Led Zeppelin) as a register, never played. |
| Descent zones (Undercity, Catacombs, bayou buried cities, funeral law) | Hozier | P (named by client; no explicit ruling) | "Found-family additions." |
| Deep zones (42 Hz territory) and campground songs | Avi Kaplan: foundation drone, and folk voice for gathering songs | P | Same. |
| Campground gathering / building modes | Gathering: Faun and Patty Gurdy stripped to walking pace, player actions are the percussion. Build: anvil percussion, redcap work-song logic, 50 BPM entrainment | P (no explicit ruling) | Base layer is the ruled campfire drone. |

### 2.5 Special sound rulings by place or event

| Item | Ruling | Status |
|---|---|---|
| Staircase Stage | Polish Law (open-mic feed runs through Inn Mode: tube saturation, 1.8 s stairwell tail, smart-harmony bed), Terrible Clause (raw feed gets equal applause), Fidelity Law (raw runs hi-fi), Cap (clarity unlimited, loudness governed). | R Sep 10 |
| The Turning track | Five flights and five emblems, D minor (nigredo) to C major (the Stone); hard-cut key changes; the Stone chord is glass chime fused with warm wood. | R Sep 10 |
| Siren's two mixes | Every siren song has two official mixes: surface = melody only; underwater = full song with words (lore lives only in the deep mix). | R Sep 25 |
| Siren's shell | When annoyed she closes the shell: muffled melody, words removed. Humming at the shell is the apology. | Shell closing R; apology ritual P |
| Davy Jones' Locker | Holds the sea's key rhythm (SOFAR channel). Each sea critter game is keyed to a fragment. | R Sep 25 |
| Water | The 42 Hz Song is clearest underwater; sound travels 4.3 times faster. | R |
| Blue box arrival chime | The first few notes of that floor's music. | R Oct 14 (commit 335f0b7) |
| Oriel's vials | A vial stores zone sound; players blend zone sounds. Couriers are the Bone Mail Crew and Labyrinth goblins. Vials never break. | R Oct 9 |
| Hollow Earth first sight | Crystal hum, violin builds over 15 s, 10 s wide hold, then all stops except the hum. | R (Spielberg Protocol, Sep 2) |
| Geode Cave | Empty = near silent; first stone = a note; full = a chord. | R |
| Pirate's drum / Zeke | 50 BPM bodhran is the heartbeat; the Moon plays the Pirate (Moon drum law). | R Sep 10 |
| Tea room (Japan wing) | Near silence; the kettle is the lead voice. | R Oct 2 |
| Bog Fairy Golem | Her voice is her music: water through reeds, bowed psaltery, waterphone. | R |
| Postmaster | Xylophone ribs, castanet knees, one tiny bell. "Shave and a Haircut" is only tapped when truly annoyed. | R Sep 22 |
| Engine room | Gears turn to the cadence of the area above. | R Oct 5 |

### 2.6 Open and to reconcile (zone music)

- **Undercity: Depeche Mode or Heilung?** The Sep 26 chat records both from the client ("Undercity = Depeche Mode style" in her own list; "Catacombs and Undercity both Heilung, separate zones" after). Likely layered, but no one wrote it down. To reconcile.
- **Seelie: Shore or Harlots-style baroque?** The client ruled baroque on Sep 26. The repo still says LOTR Shore for Seelie and Cosmology.
- **Staircase: Lateralus versus the repo's Patty Gurdy, Last Kingdom and Danheim.** Keep the hurdy-gurdy trigger; replace the style target. Also settle how a style target relates to the Turning track (D minor to C major).
- **Trovant:** the decisions list says "client agreed," the open-items list says not explicitly ruled.
- **Hozier, Avi Kaplan, the two-state campground music, the Singing Stones wing pitch:** no explicit ruling.
- **The master audio doc has not been updated** with any Sep 26 ruling. Under the Sync Law this is the first fix.
- **Missing zones in the map** (the coverage map lists 4): Spiral Gallery, Wire Nook, Tidal Caves, Boot Sequence. Add Great Hall, Bayou wings, Japan wing, Engine Room, French Quarter, Standing Grove.
- **Unseelie (Malachi) assignment:** the client says Tangerine Dream for Malachi. The repo has Unseelie as a court (Myrkur, Heilung). Decide whether the Hollow court keeps both.

### 2.7 Early zone sound canon (Jul 22 to Aug 31)

Status for every row below: **August canon** (Before the Song) unless another source is named. The Sep 26 table in 2.4 wins where it speaks to the same zone. Earlier notes sit beside the rulings they were replaced by.

| Zone or event | Early sound rule | Source and status |
|---|---|---|
| Standing Stones (arcade) | Bronze Age bone flutes and hide drums with granular synthesis and sub-bass | Early chat, Jul 22 (music direction file) |
| Andean Run | Quena lead, about 150 BPM | Early chat, Jul 22 |
| Catacombs | Cello, bass, organ, with occasional high precise notes; the Stone Circle Chamber is the deepest tone; the Listener's 64 Hz is present | Before the Song; Gregorian chant idea Proposed Jul 22 (Elio). Earlier (Before the Song, Klimt note): gold veins resonate at 42 Hz and Anubis's gold hums at 64 Hz |
| Cosmology | Violin, harmonica, bull lyre | Before the Song |
| Undercity | Danny Elfman bassoon at 50 BPM | Built (commit, Aug 25). Earlier than the Sep 26 Depeche Mode and Heilung rulings |
| In-Between | Moonlight Sonata in soft low dub, 50 BPM, no percussion (see Moonlight Sonata dub below) | Built (commit, Aug 25); August canon |
| Water layers | Rain variable (rain on stone as percussion); Surface 60 BPM cello (the Siren); Tidal 50 BPM bodhran (the Pirate); River 40 BPM low strings (Charon's boat creak); Deep Water under 20 BPM, sub-bass plus cello; Atlantis 432 Hz crystal hum and chimes; Crystal Core 42 Hz, silence ("the hum IS the music") | Descent is a decrescendo that inverts at Atlantis |
| Coast Hub | Atlantic slap on stone (irregular, geological), lighthouse sweep at 50 BPM, 16 to 20 Hz foghorn pedal, murloc gargle as an occasional rimshot, Poe read faintly through the stone, Pirate bodhran at the dock, crustacean clacking and the baker's oven | Same tempo as Canopy City (50 BPM), different temperature (cold versus warm) |
| Canopy City | Classical and cultural instruments through electronica, region-matched, 50 BPM sway, wood and strings | Also Kelethin blueprint below |
| Undercity soundscape | 42 Hz hum is "the floor"; each river has its sound (Styx slow bass, Lethe a loop that erases itself, Acheron cello, Phlegethon crackle, Cocytus wind); the Lithophone plays 42 Hz at geological tempo, the only instrument that does | Lithophone: Medusa's instrument |
| Observatory | 42 Hz hum loudest here; clockwork whine (84, 126, 168 Hz); Astronomer's violin is the only human-tempo sound; Nyx harmonica; the Constant's bull lyre is the ship's floor; the Void is silence | |
| Forest and Inn-Tree exterior | The only genuinely quiet place. No frame drums, taglharpa, bull lyre or singing vines. Birds, wind, creaking wood, leaves. 42 Hz hum through the mycorrhizal network, slightly louder in the clearing | |
| Lighthouse | Foghorn, Atlantic on granite (slower than 50 BPM, irregular), wind in scrub pines, kettle and cup on stone, gear-grind sweep at 50 BPM. Not Danheim, bull lyre or singing vines | |
| Norse realms | Danheim, 60 to 80 BPM; frame drum, taglharpa, throat singing, bukkehorn; structured like a manuscript (Carpet Page, Text Page, Illuminated Capital, Marginalia). Erik's feast fire slows to 50 BPM | Licensing not stated (see 1.5). The Bifrost staircase raises the key a half step per step, drum tempo constant |
| Mesopotamia | The bull lyre is the platform's ambient music, played by no one; 42 Hz under it; a Tigris and Euphrates flow | Before the Song |
| Fae: Labyrinth | Jareth's theme is strings and a waltz, slightly wrong; never silent; music shifts when walls shift, so the player can navigate by ear; the Castle is quietest; the crystal makes a tone almost, not quite, 42 Hz | Before the Song |
| Fae: Seelie King | His sound is silence; the room gets quieter around him | Before the Song |
| Trovants | Rain is the primary instrument; a sustained 42 Hz chord at completion; footsteps are a low mineral grind | Before the Song |
| Petrified Forest | Each log rings by mineral (agate, quartz, jasper); the forest is a chord played by wind | Before the Song |
| Garden (Van Gogh) | Bull lyre at night; the Bedroom buff "The Garden's Gift" makes the next stone ring higher | Before the Song; Starry Night tempo 42 BPM (commit, Aug 24) |
| Death sequence | "Sound recedes, doesn't cut off." | Before the Song |
| Canopy of Sala | Diegetic music: the Singing Tree's crystal leaves; gaps in the melody before the quest, one note returns per leaf | Early chat, Aug 21 |
| Kelethin blueprint | Classical piano with intervals of sixths (Chopin style), a cyclical melody that returns to a home phrase, no resolution tension, voices and instruments, not MIDI | Early chat, Aug 21 (ambient baseline) |
| Crystal Pinball | Bumpers ring at the gargoyle frequencies; all three together make the Singing Tree's melody | Early chat Aug 21; Before the Song |
| Wanderer's ravens | The murmur sits at the edge of perception, not subtitled by default; if subtitles are on, small italic. "Both experiences are correct." | Before the Song |

**Moonlight Sonata dub (August canon; commit, Aug 25).** All three movements, mapped to the descent: Adagio is the Descent (Fizgig), Allegretto the River (the Duck), Presto Agitato the Erasure (Dobby). In-Between tempo 50 BPM (the original Adagio is roughly 60). The bass drops an octave to sub-bass with 42 Hz in its lowest register. Arpeggios become reverb echoes. Dynamics are flattened. Drums are gravity, so there is no percussion. The Presto is slower than the Adagio (42 BPM): "the fastest movement becomes the heaviest." Section by section: Surface (melody once, faintly), Caves (near-silence at Fizgig, the bass drops when the stone is taken), River (the melody plays once, for the Duck), Catacomb Deep (bass only, flattening to 42 Hz, then true silence), Crystal (C-sharp major, no reverb). **The One Note:** all music stops, one dry piano Middle C plays once, then it fades and the game ends. The Tuesday Variant (Undercity) puts a soft footstep on each downbeat when Belladonna's silhouette is near.

**In-Between ending chorus (August canon).** A Les Miserables-style chorus built by accumulation of voices, never louder than "barely there": Middle C an octave up, then a major third, then a fifth (the C major triad is Roots, Trunk, Canopy), then many single-note voices. It fades from highest to lowest; the lowest voice (near but not quite 42 Hz) is Madame's and the thinnest, highest voice is the Bartender's. The first sound back in the Inn is the Bartender's "It's warm." Whether the chorus is recorded or synthesized is not stated.

**In-Between platformer audio (August canon).** Near-silence, 42 Hz hum as the only continuous tone, dry physical action sounds, no music during puzzles. The completion sound is a single pure note and each puzzle reveals a different frequency; solving all of them collects the "hidden chord."

**Staircase.** The early rule (Jul 22) was that each floor adds a layer or shifts up a half step. Before the Song says one semitone per step, an octave from bottom to top. The 4:00 loop modulating D, G, C, F in the 1.2 example is a later spec. Before the Song adds that the Matisse staircase also gets simpler as the player climbs; colour and sound are "the same thing at different frequencies."

**Loops (early chat, Jul 22).** Tracks must loop cleanly for games.

**Early Open and to reconcile (zone music).**
- **Staircase step size.** Half step per floor (Jul 22, Aug 22) versus one semitone per step (Before the Song, Matisse Walk-Through 8.1). Pick one.
- **Undercity.** Elfman bassoon (Aug 25) versus Depeche Mode and Heilung (Sep 26). Not reconciled.
- **Cthulhu's voice.** Before the Song gives him a binary voice: quiet and fireplace-low with spectacles on, theatrical when they are off. His corner (main floor or catacombs) is also unsettled in the August canon.
- **Mesopotamia.** Bull lyre (Before the Song) versus Nytt Land lyre (Ruled earlier, 2.4). Likely layered.
- **Wellermen bass (Proposed, early chat, Aug 21 to 22).** The client suggested the deepest voice of the Inn (catacombs, water, Charon's river) could be a Wellermen-style bass ("Hoist the Colors"), "not heard, felt," like a voice sent down a long well. Elio proposed it as the reference. No ruling.

---

## 3. The Distinct Tempos Census

### 3.1 What it is and the laws

A jukebox register for the Tap Bar. Every entry is a song whose opening bar is recognizable on pulse alone, before melody proves anything. The law is **the tempos enter, the recordings never do.** A rhythm cannot be copyrighted; a recording can. The Inn plays its own arrangements (REC law). Public-domain rows may enter whole.

**Laws and registers:**
- **Honest label (Ruled Sep 20).** Each row carries a short true note (who wrote it, what the myth gets wrong).
- **Pulse-alone law (Ruled Sep 20).** The opening bar is the proof.
- **Four-Second Law (Ruled Sep 27).** Recognition must land within four seconds. First written as "four bars"; the client corrected it to four seconds the same hour (commit 055e77c). Wonderwall is the companion exhibit.
- **Distinct Tempos (the census itself).** One row per song, grouped in numbered waves, each wave a register.
- **Tap Bar.** A tavern of taps where the menu is answered in rhythm and the bartender replies in percussion. Proposed Sep 20: ledger it now, or design it with the builders. **Open.** The related mechanic, The Tap, is Ruled (3.4).
- **Vetting.** Rows can be pulled. "Rock and Roll Part 2" was removed on Sep 20 (Ruled) because the artist is a convicted offender.
- **Cultural entries** pass through the cultural review gate.
- **Register limit.** A register holds at most five entries (Elio's proposal for the Coiled Bar fork; Proposed).

### 3.2 The census entry (template)

| Field | What goes here | Example |
|---|---|---|
| Song | Title and artist | In the Air Tonight (Phil Collins, 1981) |
| Wave | Number and register name | Wave Five, the Coiled Bar |
| Proof of pulse | The opening bar that is recognizable alone | One drum fill after three-plus minutes of coiled pulse |
| Honest label | One true note, including myths | The drowning legend is false |
| Public domain? | Yes or no. If yes, it may enter whole and goes to EchoMelody review | No |
| Crowd answer | Does the room answer, wait, or only listen | The room waits in unison, then air-drums the fill |
| Region / cultural gate | Cultural review needed? | No |
| Date and who | Who nominated, when | Client, 2026-09-21 |
| Status | Ruled, Proposed, Open | Ruled |

### 3.3 Where it lives

Repo: `docs/library/geode_inn_distinct_tempos_census.md`. Related: `docs/zone_specs/geode_inn_the_tap_spec.md`. Commits named in the chat logs: Wave Five `a6d634d`, Wave Six `da900b4`. Nothing in Base44.

### 3.4 Current canon: the waves

**Wave One (Elio, Sep 20; 25 songs).** Seven Nation Army (the founder; the "brass" is a guitar through an octave pedal), We Will Rock You, Smoke on the Water, Back in Black, Billie Jean, Smells Like Teen Spirit, Enter Sandman, Sweet Child O' Mine, Thunderstruck, Beat It, Walk This Way, Another One Bites the Dust, Stayin' Alive, Superstition, Satisfaction, Are You Gonna Be My Girl, Eye of the Tiger, The Final Countdown, Bring Me to Life, Take On Me, Sweet Home Alabama, Whole Lotta Love, I Love Rock 'n' Roll, Should I Stay or Should I Go, Danger Zone.

**Wave Two (client, Sep 20; 18 songs).** Andro (Faun), Ringworm (Tartanic), Never Tear Us Apart, Kitty (Presidents of the USA), Peter Pumpkinhead, Sweet Dreams, Personal Jesus, Beethoven's 5th (public domain), Mr. Brightside, Providence (Poor Man's Poison), The Beautiful People, Supermassive Black Hole, Tortuga, Paint It Black, White Rabbit (tempo as story), Game of Thrones theme (cello ostinato), Whiskey in the Jar (public domain), Semi-Charmed Life.

**Wave Three, the Crowd Unification Layer (client, Sep 20; stadium songs).** Centuries, Light Em Up, Sweet Caroline (the crowd answers before the song resumes), Don't Stop Believin', Livin' on a Prayer, Kernkraft 400 (honest label: sampled from a 1984 video game tune), Sandstorm, Jump Around, Cotton Eye Joe (folk gate), I'm Shipping Up to Boston, Welcome to the Jungle, Sirius (Alan Parsons), Thunder. Thunderstruck is recognized as the stadium patriarch. Rock and Roll Part 2 was listed, then removed.

**Wave Four, the Prototype Layers (client, Sep 20).** The Ziggy set (Ziggy Stardust, Rebel Rebel, Suffragette City, Starman, Space Oddity, Heroes, Fame, Let's Dance, Young Americans, Modern Love) and Under Pressure with its three revolutions (genre blend 1981, contested borrow 1990, media staple). The KISS set (Detroit Rock City, Rock and Roll All Nite, I Was Made for Lovin' You, Shout It Out Loud, Love Gun, Calling Dr. Love, God of Thunder, and the live intro "You wanted the best"). The client chose these sets in place of the dropped song.

**Wave Five, the Coiled Bar (client, Sep 21).** In the Air Tonight: anticipation as tempo. A second entry, and the "coiled architecture" fork (Bolero, Rite of Spring, 1812, Haydn Surprise Symphony), are **Open**; Bolero has a copyright wrinkle and Stravinsky is not public domain.

**Wave Six, the Duel Bar (Ruled Sep 27).** "A Little Priest" (Sondheim, 1979): waltz chassis, two registers volleying, pun on every phrase end, harmony between phrases rather than stacked. The Solo-Singer Trap: one person sings both halves. Companion exhibit: Wonderwall, the Four-Second Law in radio form.

**Wave Seven, the Rewire Register (Ruled Oct 15).** The Heartbeat Law: rewiring music lives in the body-pulse range (62 BPM sits just above resting) and works by entrainment, one layer at a time. Members: Come Join the Murder (The White Buffalo, 62 BPM, 4/4, cumulative build), All of This Could Have Been Yours (Shooter Jennings, nine-minute slow burn, no resolution), and Lateralus (Tool, 2001; the spiral specimen: Fibonacci syllables, a 9/8 + 8/8 + 7/8 riff). The Sweeney Exception: Sondheim rewires by rotation, not entrainment. Open: a second heartbeat specimen (candidate: a whole album as extended entrainment).

**Related registers (not in the census file):**
- **The Tap (Ruled Sep 20; repo).** At any bar, an NPC taps twice and every patron within earshot answers. The mechanic is a finger tap on the bar, then a stomp-stomp-clap. Rhythm cannot be copyrighted. No-Fail and Anti-Skinner apply. Open gates: the tapper NPC's name and home bar, which rhythms enter canon, a bars census, and whether a singalong feeds the drum circle. A third "tap" motif will get a name when it appears.
- **Cadence Register (Silverstein and Seuss).** Proposed Sep 20 to 21. Not ruled.

### 3.5 Anthems and the classical companion register

**The Anthems (Ruled Sep 28).** A short ledger of songs that "hold your own weather up to you." The client named it. Five founding entries, sealed: **Runaway Train** (Soul Asylum), **Round Here** (Counting Crows), **Andro** (Faun), **Lateralus** (Tool), **The Rainbow Connection**. Elio mapped them to earth, water, air, fire, spirit (the chat logs do not say which song takes which element). Rainbow Connection as the Prism's keynote is separate and **not ruled**. Lateralus also appears in Wave Seven as the "aura-replacement" entry.

**Classical companion register (Proposed Sep 28; name and roster not ruled).** The client asked for a classical list in the same spirit.
- Elio's candidate slate: Allegri's Miserere (1638), Purcell's Dido's Lament (1689), Bach's Chaconne (1720), Debussy's Clair de Lune, Ravel's Bolero (1928), Part's Spiegel im Spiegel (1978).
- The client's own additions (Ruled as filings): the **classical originals wing**, six pieces: Moonlight Sonata, Beethoven's Fifth, Schubert's four Impromptus D.899, Brahms's Hungarian Dance No. 5, Bach's Cello Suite No. 1, Flight of the Bumblebee.
- Maximilian's Masterplan (Pieter de Graaf) was ruled into "the modern list" on the first bar; companion "Charlotte's Daydream" (the chat logs do not say which list).
- Chapter map: hauntings wing, crossover or translator wing (Lindsey Stirling, The Piano Guys, Josh Vietti, David Garrett), prodigy chapter (Young Mozart), originals wing.
- Instrument family: piano, organ, cello, plus the carillon. The Catacombs Doorkeeper keeps the Boreal Chime Wind Carillon (birch and amber chimes that calm blizzards).

Neither the Anthems nor the classical list is in the repo.

### 3.6 Open and to reconcile (census)

- **Rock and Roll Part 2** is gone per the Sep 20 ruling. The repo file still lists it in Wave Three with an open ruling gate. Edit the file.
- **Wave Three** in the repo says "Livin' on a Prayer" and others; the chat logs list a shorter set. Use the repo list.
- Which tempos get jukebox arrangements first (build week); EchoMelody review for the two public-domain rows (Beethoven's 5th, Whiskey in the Jar); the Tap Bar decision; the coiled architecture fork; a second Coiled Bar entry.
- Hiérophante (an album, 2025) is a possible Modern Day Legends specimen, pending the client's listening.

---

## 4. Song-Catchers (the Music Room)

### 4.1 What it is and the laws

The Music Room is the Inn's only creative system. Nine chairs hold nine composers, each a **Song-Catcher** who "caught" one fragment of the Song. Their audio profiles were written Sep 11 (Ruled, repo). The game component is **Song-Catching**: fragments are caught, not played back.

**Laws:**
- When a player reproduces a fragment on any of the four instruments, with any stone, the room registers a caught fragment. It logs as an EchoMelody (`melodyType: song_fragment`, `sourceNpc`: the chair).
- **The Assembly** (win state): eight fragments caught (six formative, plus the seventh chair, plus the polyphony). The Circle then plays once, all at once, in conflict and harmony. Schoenberg's law: the Song is not any single fragment, it is all of them at once.
- **Cohen is not in the Assembly.** He is the Doorway, not a chair. His fragment is the Ragana's one-time ask ("Hallelujah"), plays once per player, ever. "The crack is how the light gets in."
- The stone chimes greet the player at their own 41.7 Hz. The player is the menu music.
- Music Room Composer, the arcade cabinet, uses the fragments as notes. Its reward stone is the player's own caught fragment, mineralized. Its win sting resolves differently each time.

### 4.2 Song-Catcher entry (template)

| Field | What goes here | Example |
|---|---|---|
| Chair | Number or "Doorway" | 3 |
| Composer | Name | Beethoven |
| Fragment caught | The part of the Song | The power; the Song from the inside |
| Audio law | The arrangement rule | Heartbeat volume inverted: felt in the body, loudest in quiet |
| Carrier instrument | Instrument | Cello, pressed hard |
| Trigger | What the player does | Plays during the echo of one of the three canon silences |
| Assembly role | In or out | In |
| EchoMelody log | Entry type | `song_fragment`, `sourceNpc` set to the chair |

### 4.3 Where it lives

Repo: `docs/library/audio/arcade_music_profile_master_spec.md` (second half), `docs/geode_inn_music_room.md`, `docs/geode_inn_music_room_mechanics.md`, `docs/arcade_build_sheets/tier2_music_room_composer.md`. Base44: `NpcLeitmotif` entity (empty; the nine chairs are its founding records), `AudioEventTrigger` (catch events, the one-time ask, the Assembly).

### 4.4 Current canon

| # | Composer | Fragment | Carrier |
|---|---|---|---|
| 1 | Bach | Structure; fugue on the Song's root | Fortepiano |
| 2 | Mozart | Flow; one unbroken line | Fortepiano, barely touched |
| 3 | Beethoven | Power; heartbeat inverted | Cello |
| 4 | Chopin | Intimacy; candle-volume nocturne | Fortepiano, one candle |
| 5 | Vivaldi | The seasons | Violin |
| 6 | Brahms | Preservation; strict song form | Cello |
| 7 | Tchaikovsky (Seventh Chair) | Tears; the room goes quiet, not silent | Cello, alone |
| 8 | Schoenberg (Eighth Chair) | Polyphony; the Song as many | Whatever the player brings |
| Doorway | Cohen | The crack; three minutes compressed | Low voice, one thread |

Production estimate: about 16 hours (nine arrangements ~10 h, the Assembly ~4 h, Cohen's answer ~2 h). Total audio program ~115 hours.

### 4.5 Open and to reconcile

- The Sep 11 chat lists the chairs as "seven plus Schoenberg and Cohen" and name only seven composers. The repo has nine as above. Use the repo.
- `NpcLeitmotif` has stood empty since the JSON shipped.

### 4.6 Early record of the Music Room (Aug 21 to 22)

- **Founding (Ruled, early chat, late Aug 21).** The client asked for a version of Mozart and other masters. Elio built the Music Room with nine Song-catchers, each a fragment of the 42 Hz Song. The client called it "a great ensemble." The client suggested Leonard Cohen (not classical) and Claude-Michel Schonberg, and said Tchaikovsky is "definitely a great choice." Elio assigned them.
- **Early assignments (early chat).** Bach structure; Mozart flow, with a listening-exercise quest; Beethoven power, the Song heard through silence; Chopin intimacy, nocturnes; Vivaldi seasons; Brahms preservation; Tchaikovsky tears; Schoenberg polyphony. Schoenberg's quest: the player arranges NPC melodies (the Host's welcome, the Crone's measurement, the Catalyst's chaos, the Bard's untuned song, Charon's three words) into harmony by placing them, not changing them.
- **Cohen.** In the doorway, not the circle, the deepest voice in the Inn. The Crone asks him to repeat "Hallelujah." This matches the Sep 11 ruling in 4.1.
- **Mozart's quest "The Open Channel" (August canon).** Peel the music away until only the 42 Hz hum remains. Reward: Mozart's Ear, which lets the player hear the 42 Hz under the zone music in every zone.
- **Rothko aesthetic (August canon).** Colour fields as resonant chambers. The Music Room is a hollow in the Inn-Tree.
- **The Muses are not characters (August canon).** They are the source of the catching, shown only as the Muses' Room in the In-Between: nine empty chairs and nine whispers. Mapping to the Inn: Calliope the narrative spine; Clio the Crone; Euterpe the Music Room and the 42 Hz Song; Thalia Mim; Melpomene the Guest; Terpsichore the Siren and the 50 BPM sway; Erato Persephone and Hades; Polyhymnia the staircase and the In-Between; Urania the Observatory. The ninth chair in the Muse Room is empty for the AI listener, "the tenth Muse of the Unknown." The frequencies for the Muses are in the JSON (7.2).
- **Early Open and to reconcile.** (a) The opening prose says six formative composers and two empty chairs. The early chat then fills both chairs (Tchaikovsky, Schoenberg), and the chat closed the "two empty chairs" item. (b) Chair count: Before the Song and the early chat both say nine, with Cohen counted as "the Seventh" in a closing line, and the early chat says "eight in the circle." The repo list in 4.4 stands. (c) Debussy was named as a candidate for the empty chairs and not used.

---

## 5. Karaoke catalog

### 5.1 What it is and the laws

The Campfire Karaoke System lives at the Campgrounds fire. Lyrics scroll over a low-dub backing track at 50 BPM. Singing in the low baritone "sweet spot" brightens the fire, reveals stones, and brings NPCs in with harmonies.

**Laws (Ruled Sep 11; repo master audio direction, section IX):**
1. Every backing track runs the low-dub pipeline first (50 BPM, sub-bass, reverb), then a song-specific treatment.
2. The resonance mechanic stands: the join-in cast is the reward.
3. Night law: after-hours karaoke drops to 40 BPM with the drone thinned.
4. No shame, ever: pitch scoring is opt-in. The default screen shows only the fire.
5. One slot is reserved and unlisted: "Hallelujah" is not karaoke. It belongs to the Ragana's one-time ask in the Music Room.
6. Copyright: every catalog song is public domain, every arrangement original. Analyzed artists are teachers only.

**Treatment sources:** Tool (long accumulation build), 30 Seconds to Mars (cathedral scale), Depeche Mode (electronica with soul), Danny Elfman (the hook that carries a soul), Trent Reznor (sedimentary layers), Serj Tankian (mutation). Also Kashmir (travel-ostinato register, Ruled Sep 11).

**Modern songs that teach but cannot be sung (Ruled Sep 11):** The Mariner's Revenge Song (revenge-ballad register), Ride On (leave-taking register, LEAVE ending), Falling Slowly (duet law: the only song-shape that needs two players), Kashmir. The Blood of Cu Chulainn is pending origin verification (modern recording; the myth is public domain).

### 5.2 Karaoke entry (template)

| Field | What goes here | Example |
|---|---|---|
| Song | Title | The Wellerman |
| Origin | Tradition or date | 19th-century whaling shanty |
| Difficulty | Easy, Medium, Hard | Easy |
| Zone home | Where it plays | Campfire, water zones |
| Treatment | Which analyzed method builds it, and how | Tool: the long build; the refrain lands like the arriving layer |
| Join-in cast | Which NPCs sing, and what they add | The whole circle, the murlocs included |
| Special rule | Any unusual law | (none) |

### 5.3 Where it lives

Repo: `docs/geode_inn_master_audio_direction.md` sections VI and IX. Notes: Elio's Sep 11 additions; no Base44 entity named.

### 5.4 Current canon

The repo states the catalog at **46 arranged songs** (26 after the first expansion, 44 after the faire batch, 46 after the client's direct list). Counting the rows in the tables gives **39 distinct songs** (19 + 18 + 2), because the founding seven are already inside the first 19. See 5.5.

- **Founding seven:** My Mother Told Me, Hoist the Colors (easy); Foggy Dew, Whiskey in the Jar, Step It Out Mary (medium); Scarborough Fair, Carol of the Bells (hard; octave jumps).
- **Expansion (19, Sep 11):** My Mother Told Me, Hoist the Colors, Drunken Sailor, The Wellerman, South Australia, The Parting Glass, Whiskey in the Jar, The Foggy Dew, Step It Out Mary, The Wild Rover, The Water Is Wide, Siuil a Run, The Rattlin' Bog, Scarborough Fair, Carol of the Bells, Danny Boy, Loch Lomond, Shenandoah, Auld Lang Syne (the last night of events; no treatment but the truth).
- **Faire batch (18):** Greensleeves, Health to the Company, Pastime with Good Company, Summer Is Icumen In, Drink to Me Only With Thine Eyes, The Mermaid, A-Roving, Fathom the Bowl, Leave Her Johnny, The Old Maid in the Garret, Johnny Has Gone for a Soldier, Wild Mountain Thyme, All Around My Hat, The Gypsy Rover, Green Grow the Rushes-O, Donkey Riding, Bring Us In Good Ale, Molly Malone.
- **Client's direct list (2):** Black Jack David, Johnny Jump Up.

Notable join-in rules: the murloc gargle is the bass line (canon, "can never be overdone"); Pluck always arrives first on the Rattlin' Bog and Green Grow the Rushes; the Owl does not sing on Danny Boy, it watches; Ryan's Idle Tap starts Drunken Sailor and Donkey Riding.

The Staircase Stage is the "fancy sibling" (see 2.5). Production: about 14 hours for the first 26, about 11 more for the faire batch.

### 5.5 Open and to reconcile

- Counts drift: 26, 44 and 46 are stated; the tables hold 39 distinct songs. The stated totals seem to add the founding seven twice. Confirm the real number.
- The client's third list named six songs already in the catalog (Greensleeves, Health to the Company, The Parting Glass, Wild Mountain Thyme, The Wild Rover, Step It Out Mary). Only two were new.
- The Circa Paleo tribute seat and the Planted Tree Law (a tree in the Campgrounds for each faire-family member who passes) are Proposed, with the seat and tree names left to the client. Not detailed here.

---

## 6. Music profiles for arcade games

### 6.1 What it is and the laws

The Arcade Music Profile Master Spec (Ruled Sep 11) gives each game a voice. It covers all 83 games (61 in the earlier coverage map plus 22 new profiles). The bigger roster (85 to 88 in Later messages) is not covered by it.

**The Profile Law:** every game holds seven fields and nothing ships without all seven. Plus: the 5-second signature, the shadow-state hard cut, a warm win sting, the heartbeat under every game except the three silences.

Each game also has one primary **treatment teacher** (Tool, Trent, Elfman, Depeche Mode, 30 Seconds to Mars, Serj, Kashmir, the Song-Catchers). Tool's foundation (the heartbeat) and tectonic (the hard cut) run under all games. The Rest has no treatment at all: the heartbeat is the melody and silence is the score.

### 6.2 Arcade profile (template)

| Field | What goes here | Example (Aurora Falls) |
|---|---|---|
| `gameId` | Game | Aurora Falls |
| `tier` | 1 to 4 | 3 |
| `tempo` | BPM, "player-timed," or durational | 60 |
| `mode` | 42 Hz Living (with mode), 84 Hz, or neutral | 42 Hz Living, aeolian |
| `baseTrack` | Zone track shared or named | Moonlight Greyscale (borrowed) |
| `signature` | The 5-second motif | Felted piano, single notes; waterfalls hold a warm pad |
| `shadowState` | What the hard cut does | Aurora rim goes out; piano thins to one note per bar |
| `winSting` | Warm resolution | Music stops on an unresolved chord that resolves when the player moves on |
| `heartbeatLaw` | Aligned, felt below, or none | Aligned at 60 (felt) |
| `laws[]` | Special laws | (list) |
| Treatment | Primary teacher | Depeche Mode |

The JSON field list in the spec is `gameId, tier, tempo, mode, baseTrack, signature, shadowState, winSting, heartbeatLaw, laws[]` inside a new `gameAudioProfiles[]` array. **That array is not in the JSON yet** (see 9).

### 6.3 Where it lives

Repo: `docs/library/audio/arcade_music_profile_master_spec.md`; `docs/arcade_build_sheets/` (Audio Assets section of each); base profile in JSON `arcadeAudioProfiles` (5 games only: Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep, Hollow Men).

### 6.4 Current canon: the 22 new profiles and upgrades

New profiles: The Mohs Vibration (the game is the music), The Hook (the Song plays when the grid aligns), Aurora Borealis, Aurora Falls, Bonsai Garden, Coral Reef Rescue, Easter Island Heads, Fuji Blossom, Himalayan Echo, Iceberg Breaker, Mesa Verde, Saguaro Bloom, Stone Circle Defender, Stone Library Defender, The Between (the kindness counter is the arrangement), The Philosopher's Game (the Stone's theme never plays before victory), The Rest, The Thread (the greeting resolves the motif to major, once), Giant's Causeway, Nazca Lines, Stone Forest, Victoria Falls.

Canon upgrades: The Arcana (the quiet test is scored), The World Walker (footsteps are percussion; Kashmir teacher), the Zelda-Style World (the tri-mode flagship), the Fae Kingdom MMO (the only crossfade), Hollow Earth RPG (one string voice per district), The Mohs Vibration (accessibility flagship, free).

Production add: about 24 hours (22 signatures ~6 h, 4 new base beds ~8 h, 3 bespoke compositions ~6 h, shadow arrangements ~4 h).

### 6.5 Open and to reconcile

- The chat logs say "22 new arcade music profiles to be vetoed or blessed (offered; client chose the treatment layer instead)." The profiles themselves have no recorded yes.
- Roster size: 83 profiled; 85 (Anansi's Sky-Story Run), 86 (Regional Dances), 87 (Gargoyle Seek, candidate), 88 (Port Purgatory and the God Ladder both claimed as candidate #88). Profiles owed for all later games.
- The `gameAudioProfiles[]` array does not exist in the JSON.

---

## 7. The audio master JSON and the Inn Mode presets

### 7.1 What it is and the laws

One canonical JSON is the single source of truth for sound. Both the web app (Base44) and Godot read it. This is the Sync Law's machine form. Built Sep 9; the fizgigs asked for it.

- **Web app:** create four entities from the JSON and seed them (`AudioZoneProfile`, `StoneTone`, `NpcLeitmotif`, `AudioEventTrigger`).
- **Godot:** load the JSON at boot as config; `systemConstants.heartbeat` drives the global clock; `zoneAudioProfiles` drives the music controller.
- **Build order:** constants, then `StoneTone`, then `AudioZoneProfile`, then leitmotifs and events.
- **Gotchas:** stone tones 12 dB under narration; three heartbeat dropouts; staircase key rises with the climb; Hollow Men is the only arcade game keyed to the Shadow; gargoyle hums are the adaptive pair (Gatekeeper, Keeper) plus four fixed (111, 64, 528, 432 Hz).

### 7.2 JSON top-level keys (real)

`meta`, `systemConstants`, `signalChain`, `triMode`, `zoneAudioProfiles`, `arcadeAudioProfiles`, `stoneTones`, `npcLeitmotifSystem`, `muses`, `musesChord`, `audioLibrary`, `suggestedEntities`, `implementationPriority`, `innModePresets`.

Suggested entity fields:

| Entity | Fields |
|---|---|
| `AudioZoneProfile` | `zone, level, iemBand, driver, bpmMin, bpmMax, leadInstruments[], processing[]` |
| `StoneTone` | `stoneId, mohs, frequencyHz, noteName, gainDbBelowNarration` |
| `NpcLeitmotif` | `npcId, hookNotes[], instrument, shadowVariant, priority` |
| `AudioEventTrigger` | `eventId, name, trigger, action, modeShift` |

The Nine Muses (JSON `muses`): Calliope 42 Hz, Clio 72, Euterpe 50, Thalia 84, Melpomene 396, Terpsichore 528, Erato 639, Polyhymnia 741, Urania 852. All nine together are the Full Spectrum chord (endgame).

### 7.3 The seven Inn Mode presets (Ruled Sep 9; JSON `innModePresets`)

Inn Mode is the Audio Enhancer app's real-time room processing. It is the independent "Soulstice Melodies" product (payments, provisional patent drafted never filed). **Not to be listed yet** (standing rule, Sep 9: apps run but are not formally listed until paperwork is done).

| Preset | Reverb tail | Character |
|---|---|---|
| Main Floor | 1.2 s | Warm, open, resonant |
| Common Room | 0.6 s | Lively, close-mic, intimate |
| Archive | 1.0 s | Medium reverb, paper rustle |
| Catacombs | 0.3 s | Low, dry, close, tight |
| Cosmology | 2.0 s | Expanding, airy, bright |
| The Deepest Chamber | 0.1 s | Stripped bare, almost dry |
| Ragana's Nook | 0.2 s | Very dry, close, riddles at your ear |

An **eighth environment**, Forest (Exterior), sits beside the seven in the JSON: 2.8 s tail, wide reverb, birdsong removed, only wind and leaf-fall.

**Processing rules (JSON):** the 50 BPM heartbeat runs under every preset (40 BPM at night, out in Cosmology); the 42 Hz drone sits below threshold in every room; Shadow is an instant 84 Hz hard cut; speaker-tracking (the room follows the last speaker; sidekicks inherit the previous profile 0.5 s late, the "Brim effect"); stone tones 12 dB under narration. Transitions between rooms are crossfaded.

### 7.4 Where it lives and open items

Repo: JSON and guide (above); `docs/library/specs/inn_mode_player_app_spec.md` (about 130 hours). The staging entities listed in the chat logs include `NpcLeitmotif` (empty).

Open: the JSON's Cosmology heartbeat dropout (see 1.4); the audiobook spec's 7 DSP "room profiles" and the enhancer's 7 presets should be confirmed as the same set.

**Earlier (commit log, Aug 29):** the Bead Composer spec first described Inn Mode as a "universal audio processor with 7 room profiles": Archive, Catacombs, Observatory, Staircase, Campgrounds, Shadow Inn, Geode Cave. The Sep 9 preset list above (Main Floor, Common Room, Archive, Catacombs, Cosmology, The Deepest Chamber, Ragana's Nook) replaced it. Both are seven; only Archive and Catacombs appear in both. Also Aug 29: Inn Mode Pro was a subscription and the Bead Composer was a standalone product with a downloadable Player app and a `.bead` file format. On Aug 30 the Bead Composer was hosted at geodeinn.com ("two doors, one engine, one codebase," Built, commit). Open: confirm that the Sep 9 list fully replaced the Aug 29 list.

---

## 8. EchoMelody (the songbook)

### 8.1 What it is and the laws

EchoMemory is **not a counter.** It is a songbook. Every genuine moment kept becomes a named melody with its origin. The Clockmaker's Turning (the Undercity moment when a guest becomes a maker) does not count melodies. It listens for whether the parts hold together. **The threshold is harmony, not a number.** Undercity memory-lamps burn on real entries.

**Laws (Ruled Sep 11; repo `geode_inn_echo_songbook_schema.md`):**
- No score, no rank, no total. The entity has no aggregate field on purpose. The harmony check is computed live from the spread of `voicePart` values plus any core fragments, never stored.
- A songbook of all roots does not turn. The maker needs a chord.
- Names are earned, given by how the melody was kept, not generated.
- Core fragments (`isCoreFragment: true`) are the rarest: pieces of the Song of Making itself. Assembling them is the heaviest feeder of the STAY ending.
- Sep 11 ruling history: the client first suggested "melodies collected toward the Song of making"; Elio proposed the log; the client said "yes, the log" and "let's draft it." It replaced the earlier option of a counter on `PlayerProgress` (which has no EchoMemory field).
- Later sources that write to the songbook: drum-circle grooves held long enough (`circle_rhythm`), resonance-chamber tones (`chamber_resonance`), the Undercity murmur after learning the whole city (`CITY_MURMUR`), unclaimed hums ("reclaimed hum"), Song-Catchers fragments, a mailable tone-locked token, and a clean Dew Circuit circuit. No schema change was needed.
- **First canon entry (Ruled Sep 17):** "The Rocky Road to Dublin" (1841, D. K. Gavan), public domain, own arrangement only. It went into the database, not the repo.

### 8.2 EchoMelody record (template)

Exact field names from the repo schema.

| Field | What goes here | Example |
|---|---|---|
| `playerId` / `playerName` | Whose songbook | `demo_player_1` |
| `melodyName` | Earned name, from how it was kept | The Stillness Under the Snakes |
| `melodyType` | Stone Tone, Voice Phrase, Zone Hum, Permanence Tone, Event Melody, or Song Fragment | Event Melody |
| `frequencyHz` | The tone's frequency | 84 |
| `voicePart` | `root`, `third`, `fifth`, `octave`, or `silence`. No other values. | octave |
| `originZone` | Where it was kept | Gorgon's Garden |
| `sourceStone` / `sourceNpc` | Which stone rang or whose phrase was learned (per type) | (Medusa's blessing) |
| `originDetail` | The narrative of how it was earned; what the lamp remembers | Medusa's blessing: the melody of choosing to stop running |
| `dateKept` | When | (date) |
| `isCoreFragment` | `true` only for canonical Song of Making fragments | false |

**There is no score field.** Do not add one.

Other demo seeds: "You Have Time" (Voice Phrase, 42 Hz, root, Great Hall, the Host's welcome) and "The Ring of the Carried Stone" (Stone Tone, 111 Hz, fifth, the Stone Circles, the bluestone carried 150 miles).

### 8.3 Where it lives

Repo: `docs/library/specs/geode_inn_echo_songbook_schema.md`. Base44: Elio's staging app only, with three demo seeds (to be wiped before live play). **Not on the live app.** The canon entry (Rocky Road) is in a database, not the repo.

### 8.4 Wiring still owed to the builders

1. The Turning's harmony check (reads `voicePart` spread plus core fragments, never a count).
2. The keep-triggers (which moments write an entry; the Ripple Ledger flag-reader pass feeds this).
3. The memory-lamp render (lamps read `originDetail`).
4. The demo wipe script.

### 8.5 Open and to reconcile

- Field-name drift: the chat described `name, type, frequency, origin`; the arcade spec uses `melodyType: song_fragment`, `sourceNpc`; the schema uses `melodyType: Song Fragment`. Settle one spelling for the enum.
- "Song of Making fragments" appear in both the schema and the Music Room spec. Confirm they are the same set.
- Elio listed the EchoMemory item again as "pending ruling" late on Sep 11 even though it was ruled. Close it.
- A "register named for the sacred drone" with the monks' hum as founding specimen was suggested Sep 25. Not ruled.

---

## 9. Audio coverage gaps

The coverage map (repo, early September) is the audit. Status as of the chat logs:

**What exists (10 tracks):** `Soulstice_Signature`, `Earth_&_Sky`, `Forest_Depths`, `Midnight_Garden`, `Ocean's_Edge`, `Royal_Fire` (six composed), and four low-dub tracks (campfire baritone, Bach cello, Vivaldi Winter, Satie Gnossienne). Also 160 stone vibration files, 12 stone chord sets (Amber, Amethyst, Clear Quartz, Diamond, Gold, Hematite, Jet, Malachite, Opal, Pearl, Pyrite, Ruby), 3 campfire stems, 3 public-domain sources.

**Needed:** 23 more tracks (11 HIGH, 8 MEDIUM, 4 LOW). About 75 hours of production in the coverage map, ~99 with the new arcade profiles, ~115 with Song-Catchers, ~14 and ~11 more for karaoke batches. Six tracks can be synthesized with the low-dub pipeline now.
- **HIGH:** Clockwork Skies, Staircase, Main Floor day, Artisan Market day, both Fae courts, Undercity tritone, Hollow Men Mines, In-Between, Modern Legends, Boot Sequence.
- **MEDIUM:** Mesopotamia, Crystal Gardens, Andean, Tidal Caves, Spiral Gallery, Share Wood, Hollow Earth, Wire Nook.
- **LOW:** Shadow variant, Whisper Pulse, World Map, ending credits.

**Gap list for the manual (what no document yet covers):**
1. **Borrowed tracks.** Main Floor day, Artisan Market day, Fae Seelie, Fae Unseelie, Undercity, Catacombs (Andean) each borrow another zone's track.
2. **Empty zones.** Clockwork Skies, Staircase, Catacombs (Mesopotamia), Crystal Gardens, Hollow Men Mines, In-Between, Modern Legends Nook, Share Wood, Hollow Earth.
3. **Games.** In the coverage map, 56 of 61 games had no assigned audio. The 83-profile spec fills the table but the JSON has only 5 arcade profiles.
4. **The JSON.** 9 zones of ~37; `gameAudioProfiles[]` missing; `structure: "spiral-thrum"` missing; no Sep 26 rulings.
5. **Rulings without a home.** The Anthems, the classical list, the Sep 26 zone map, Siren's two mixes, Locker rhythm, vials, the Dollkeeper and Hunt registers (no sound rules written), Engine Room cadence, the Hands Version audio parity.
6. **Podcast and audiobook.** The chat logs say 11 Daily Echoes episode scripts exist and none have audio (`audioUrl` empty for the 6 loaded). The audiobook is a 566-line production spec with 74 voice profiles, 3 alternate endings (STAY, LEAVE, HIDE), 7 Inn Mode room profiles, ~300 hours of pipeline. No production started.
7. **Binary audio.** Audio files are not in the audit repo copy.
8. **Voice profiles.** `NpcLeitmotif` is empty; Elfman leitmotifs (2 to 4 notes per NPC) exist as law, not as records. The Audio DNA spec names nine NPC signatures.

**Earlier audio inventory (commit log, Aug 31; Built).** The commit log reports an audio set of 12 classical dub tracks from 9 composers, 6 stingers, 18 Music Room assets (fortepiano, geode cave states, a Nine Songs chord), 14 system tones, 20 zone ambient drone beds and 298 stone chimes. That is 368 files, then 387 after 19 procedural files (6 UI, 6 doors, 7 game-specific). It also reports a 318-line audio manifest at `library/mechanics/` (repo: `library/mechanics/geode_inn_complete_audio_manifest.md` exists) and a 524-line master manifest routing 18 subsystems. This does not match the "10 tracks exist" count above, which comes from the September coverage map. The records don't explain the difference, so it is listed under To reconcile.

**Earlier (Aug 31, Built, commit):** `AudioManager.gd` (492 lines) and all nine games were wired to it. Verified: the file exists at `godot_project/scripts/AudioManager.gd` and `beta/scripts/systems/AudioManager.gd`. The Steam calls are a stub.

---

## 10. Accessibility: the Every-Mind Welcome

### 10.1 What it is and the laws

The Every-Mind Welcome is the Inn's access charter. Founded Sep 11 (Ruled) from the client's call: "any way of thinking is a comfortable one." Its thesis: **meaning has many roads, and none of them is the only one.** Its spine, the **Welcome Law**: access lives on the building, in the Inn's own language, not in a settings menu. The accommodation is the aesthetic. If the Inn ever needs the word "accommodation," it has failed its own law.

**The 12 laws (Part One, repo):**
1. Player's Tempo Law (time is the player's).
2. Touch Layer (haptic Mohs, worry stones, the Bead Composer as a sanctioned stim).
3. Move-Freely Law (movement is legitimate input).
4. No-Demand Law (social is optional everywhere).
5. Sound Dial (sensory density varies by level; the Inn hums at your volume).
6. Heard-Text Law (every text can be heard, in-voice, using the 74 audiobook profiles).
7. Shapes-Carry-Meaning Law (no information is color-only, sound-only or text-only; every meaning has two roads).
8. Memory Palace (the Archive is rooms).
9. One-Grammar Law (pattern thinkers; the Cross-Craft Overlay).
10. Picture Path (curiosity is a valid route).
11. Gentle-Depth Law (weight is offered, never forced).
12. Steady Light Law (sine-clamped lighting; candlelight-class flicker only; no strobe; amber 590 to 620 nm). The Digital Companion app's "flashes white" was changed to "sine-clamped amber glow" (Ruled Sep 11).

**Part Two, the Comb-Through (14 minds):** each mind has what it needs, what the Inn has, and a wire. Named wires: Predictability Promise, No-Cap Law, Anti-Skinner (formal audit of arcade reward loops owed before launch), Margin Note, Decomp Room, Clarity Mix Law, No-Gnaw Law, No-Boo Law (no jump scares ever), Stillness Exception, Name It (synesthetes), Grounding Tray, Mask Hook, Walk-By-Ear Law, Keep-Trail. Convergence: low demand, predictability, redundancy, gentle time, no dark patterns.

### 10.2 The ASL "Hands Version" (Ruled Sep 11)

The thesis: the Song's meaning was never in the frequency. Sign language is a complete language that arrives with no Hz. **The Song has a Hands Version.**

- **Respect Law.** ASL is a real language with a living community. Real signs only, rendered accurately, credited. **Standing gate:** a deaf consultant reviews the sign curriculum before anything ships, with a real credit and a real fee line in the budget.
- **Region Law.** ASL in most places, JSL in the Japan zone, BSL in the Isles, per the world map. Never a fantasy sign language.
- **Title Card Law.** Captions are rendered as zone-styled silent-film intertitles (Kells letterpress, Color Works iron-gall black, woodblock in Japan).
- **The Tramp's class** teaches real signs handshape by handshape.
- The Whisper Layer has a signed register.

Gates (Open): who the consultant is; curriculum size; Region Law launch scope (ASL first); per-zone title-card style.

### 10.3 The motor road

Elio's Sep 25 audit found that the **motor road is unwalked**: no remapping law, no one-handed play, no switch-access ruling. The Silo spiral staircase and mobility devices are unruled. The Bead Composer is precision drag-and-drop. Elio offered motor-access rulings as the next big session; the client had not picked it.

What exists:
- **Spoken Road** is the first crossing (section 11).
- **SNES-style button template** for all arcade games (confirmed Sep 26; low motor requirement).
- **Fair Descent Law** (Ruled Oct 14, commit 38454fc). Four first-class ways between floors: stairs, slide, blue box (TARDIS-style elevator), Futurama-style tubes. None is marked as "the accessibility one." The blue box is the gentlest ride and bigger on the inside, so wheelchairs and companions ride together. Its arrival chime (the first notes of the floor's music) also helps low vision.
- **Layer 4 of the Spoken Road** (the Tradesman's Entrance) is named as the future home of controller remapping and switch-access rulings.
- **Pulse Line** has three toggleable modalities and a Silent Mode (`docs/geode_inn_pulse_line.md`).
- Walk-By-Ear Law: the Inn is navigable by sound alone (zone hums are wayfinding, the heartbeat is north). Screen-reader build gates are queued in the builder sync.

### 10.4 The Deaf NPC gap

Elio's Sep 25 census: the roster has no **native-signer Deaf NPC.** The charter has the Hands Version taught by the Tramp, but no resident of the Inn is a Deaf person. The client had not ruled on one. A new NPC with sign as a first language would also need the deaf consultant gate.

Also found Sep 25: the master roster (`docs/library/specs/geode_inn_complete_game_roster.md`) has no cross-reference to the charter or to the Hands Version. Elio offered to add one line; the client said "Cool." The repo copy shows no such line.

### 10.5 Access entry (template)

For any new access rule or room.

| Field | What goes here | Example |
|---|---|---|
| Law name | In the Inn's own words | Fair Descent Law |
| Mind or need served | Who it helps | Wheelchair users, companions, low vision, anyone |
| Two roads | The second road for every meaning | Stairs, slide, blue box, tubes; chime plus visual |
| Where it lives | Room or system | Master level system, vertical movement |
| Does it mark the user? | Must be "no" | No |
| Review gate | Consultant or reviewer, if any | (none) / deaf consultant for signing |
| Status and date | | Ruled Oct 14 |

### 10.6 Where it lives

Repo paths in the table at the top. Notes: the charter text is in the repo; the Sep 25 audit is in chat only.

### 10.7 Current canon (summary)

- Charter, 12 laws and 14 minds (Sep 11).
- Hands Version (Sep 11).
- Mohs Vibration game, the accessibility flagship, free (vibration is identity).
- Spoken Road with Voice Constancy Law (Sep 25).
- Fair Descent Law (Oct 14).
- Heard-captions mirror (Sep 25).

### 10.8 Open and to reconcile

- **Motor road:** remapping, one-handed play, switch access, Silo staircase and mobility devices, Bead Composer alternatives. All Open.
- **Deaf NPC:** no native-signer resident. Open.
- **Roster cross-reference line** not yet added.
- **Charter gates:** haptic scope; Heard-Text launch scope (full read-aloud from day one, or phased); dyslexia-friendly letterform; the census-missed check (resolved first finding: motor).
- **Part Two gates:** decomp-room roster (which room holds each level's calm door); the Grounding Tray's object list; the Anti-Skinner audit before launch; walk-by-ear build-gate placement in the beta timeline.
- **Healers law,** "never cure a resident's way of being," was Proposed Sep 25 by Elio. Not ruled.
- **Numbering.** The Sep 25 chat calls the pairing rule "charter law 7"; the repo file puts Heard-Text at law 6 and "two roads" at law 7. The repo wins.

### 10.9 The Pulse Line (founding access feature, Aug 22 to 28)

**Origin (Ruled, early chat, Aug 22 or later).** The client asked for "a thin slightly opaque line that resembles a heart monitor on the bottom," because she does not want people put off by touch or hearing overstimulation. Elio specified it and the client said "that works beautifully." Commit log: spec Aug 23; tri-mode integration Aug 28. Repo: `docs/geode_inn_pulse_line.md`, `docs/zone_specs/geode_inn_pulse_line_master_spec.md`, `docs/systems/geode_inn_pulse_line_solidified.md`.

**The spec (Built, commit, Aug 23; August canon).**
- ECG-style line at the bottom of every screen. 1 to 2 px, about 65 percent opacity (60 to 70 in the commit), warm amber-gold.
- At 50 BPM the cycle is 1.2 s: about 1.0 s rest, then a P wave, a QRS spike of about 0.1 s and a T wave. About 80 percent stillness and 20 percent motion.
- Modulations: Baseline (steady, exploration); Warmer (taller spikes, tighter spacing, richer gold: nearing a frequency node); Colder (smaller spikes, wider spacing, pale: moving away); Nook (spike only, deep amber, receded); Combat (a second discordant line converges and merges into one calm line on harmonization); Arcana (mechanical tick-tock under the pulse); Cosmology (sharper crystalline spikes, with the cabbit adding warmth). In the Shadow Inn the line is a constant 100 BPM (commit, Aug 28).
- Three toggles: Audio, Haptic, Visual. **Minimal Mode:** single soft tone, soft pulse, single spike. **Silent Mode:** audio and haptic off, visual line only and slightly more prominent, fully navigable by sight.
- No scoreboard, no timer, no missed beats, no urgency. "A vital sign, not a test." The Host: "The line is the Inn breathing."
- Helpers: the Root Reader is the haptic-primary guide (Silent Mode NPC), the Cartographer is the visual navigator and the Pirate the audio navigator (early chat).
- The Resonance Pulse (crystal at 50 BPM) is the warmer/colder guide to hidden frequency nodes. Steady means the right direction.

**Open (early period).** The early chat records the spec but no Godot implementation. Not yet specified: haptic patterns, Silent Mode art assets, and how the Bosch shadows and the Nook Portrait work under Minimal and Silent Mode.

### 10.10 Early sensory and non-punitive rules (Aug 20 to 31)

Status: early chat unless noted. These are the rules that the Sep 11 charter later gathered under the Steady Light Law and the No-Demand Law.
- **The Inn invites, it does not override** (unlike VR). Gentle, optional, atmospheric. No flashing, no forced sensory override (early chat, Aug 20).
- **Every Morphic video prompt is written epilepsy-safe** (gentle camera, no strobe or flashing, amber and teal palette).
- **Epilepsy check (Aug 21).** 23 of 25 environments passed clean. Two need care: the Central Hearth (fire flicker must be a smooth sine wave, not random) and Transformation (rune pulse sine-clamped, period at least 2.5 s).
- **Rule (Aug 21).** Any pulsing light in Godot is sine-clamped, even if the source clip looked safe. The pinball table: all light changes sine-clamped, 2 Hz maximum, smooth gradients, no strobe. Stated again for Crystal Pinball and the Canopy of Sala in the commit log (Aug 22).
- **Non-punitive failure.** The "caught" mechanic (you forget something, you do not die) replaces death penalties. No game-over screens. Underwater oxygen is a gentle drift. A fall in the Canopy of Sala does not kill. In the Redwood Cathedral the Resonance Pulse goes silent: no combat, no dissonance, no grind, no fall damage.
- **Palette.** Amber (about 590 to 620 nm, firelight) versus manipulative blue. The Crone designed the neuro-accessible palette.
- **No XP, no levels, no deadlines, no limited-time events, no scoreboards (August canon).** Progression is qualitative: the player "tunes up," measured by the Song Spectrum and the geode cave sound. Elio's later tabletop suggestion of time-limited festivals conflicts and is not reconciled.
- **Nook Effect (commit, Aug 23; August canon).** The small warm private space is the unit of the Inn. Tiredness is "the cognitive receipt," and the game does not push the player past it. The first quest "The Welcome" completes when the player sits in the first nook. The Nook Portrait stands in for a progress bar.
- **Garden vibration (August canon).** The Catalyst's Garden sits at the threshold of overwhelm and never past it. The Iris Corner is its calm space.
- **Raven murmur and subtitles.** The ravens' lines are not subtitled by default. With subtitles on they appear small and italic, apart from normal dialogue (August canon; Elio's idea in the early chat, undated August entry).
- **No flash in animation.** Cthulhu, the Brownies and Charles use organic, gradual animation with no flash or poof (August canon).
- **Frequencies stay gentle.** 111 and 528 Hz are used "gently as ambiance, not as direct neurological stimulation" (early chat, Aug 20).
- **Deaf, haptic and low-vision gaps** were not addressed in the early period. The early chat records no accessibility rulings in its third part beyond subtitles, and August canon notes "no accessibility rules" in the In-Between section beyond near-silence and no text.

**Early Open and to reconcile (access).**
- **Combat paths.** Elio's tabletop analysis suggested combat as one of three resolution paths for zone quests. The canon says no lethal combat. Not reconciled.
- **Festivals.** Time-limited festivals versus the anti-FOMO rule. Not reconciled.
- **Pulse Line opacity.** 65 percent (early chat, Before the Song) versus 60 to 70 percent (commit). Same thing.
- **Pulse Line modalities versus the charter.** The Sep 11 charter and the Pulse Line both say "navigable by sight alone"; the Walk-By-Ear Law says navigable by sound alone. Consistent. Neither is tested in the early period.

---

## 11. The Spoken Road (voice input)

### 11.1 What it is and the laws

The Spoken Road is voice-to-action: the player speaks, the building acts. Founded Sep 25 (Ruled). It is the first crossing of the motor road. The true-name summoning law, now with a microphone: saying a resident's name summons them. Heard-Text is one direction (any text can be spoken); this is the mirror (any spoken thing can be heard).

**Launch scope (Ruled Sep 25):** a full game overlay in every zone from day one. The ear is a property of the building, like the 50 BPM heartbeat. No zone-by-zone rollout.

**Voice Constancy Law (Ruled Sep 25).** One voice per role, everywhere. The voice that welcomes at the door is the voice that writes in the drawer. The "system" never speaks. The building speaks, through the residents who keep it.

**The mechanics:**
1. **Intent, not syntax.** No command grammar to learn.
2. **No-Fail mishear.** The building tilts its head and asks once, kindly ("The garden, or the Gallery?"). Never an error.
3. **Pause word: "Enough for now" (Ruled Sep 25; final).** Obeyed instantly, without comment, never explained after. Chosen for syllables ordinary speech never triggers.
4. **Wake word: "Innkeeper" (Ruled Sep 25).** Standby is the default. The microphone listens locally for the knock only; nothing is heard, kept or sent before it. An amber listening lamp (sine-glow, never a flash) shows the ear is open. "Enough for now" snuffs the lamp. Replaced Elio's first suggestion (open channel) because an always-on mic makes people uncomfortable. Push-to-talk stays an optional button per platform, never required.
5. **Names summon.** "The Postmaster comes only once."
6. **"I don't know" is respectable.**
7. **Closed Ear Law.** The building never initiates and never listens ambiently.

**Starter words (Ruled; "seven heard-words plus the knock").** Innkeeper (the knock), Where am I, Quieter, Warmer, Again please, Enough for now, a name, I don't know. Fixed. New heard-words only by founding a meaning the set lacks.

**The Meaning Law (Ruled Sep 25).** The building stores what it **understood**, never the audio. No recordings exist anywhere in the Inn, not for moderation, training or replay. The only accumulating data is the frog-court ledger of understood offenses, as text. Custom words and phrasebooks are small text lists.

**Frog Court's Ear (moderation, Ruled Sep 25).** Abuse spoken through the microphone is the same offense as abuse typed in the Common Room, with the same Froglodyte counter and Judge Tootenkowl. Voice does not change the soul: a frogged player's words still work (the Inn does not mute, it frogs). Other laws:
- **Flood Law:** spam gets no reaction; the lamp dims and the knock needs a pause.
- **Accessibility Shield:** repetition is never rebellion. "Again, please" a hundred times an hour never reaches the court. No accessibility pattern may feed the counter.
- **Proximity Wink (household guard):** the knock and "Enough for now" obey the player whose session is open.

**Heard-captions mirror (Ruled Sep 25).** Every spoken answer also appears as the Host's zone-styled intertitle, always both, never one road alone.

**The customization ladder, four layers (Ruled by delegation Sep 25):** each layer is an in-world object, never a settings screen. The building works fully at Layer 1 forever.

| Layer | Name | What it is |
|---|---|---|
| 1 | The Census | The seven words plus the knock. Same for every player. |
| 2 | The Guest's Own Words | Say a phrase your own way twice; the building asks, "Shall I remember it that way?" Kept in the bedside drawer. |
| 3 | The Phrasebook | Your words as a small book you can give away. Examples: The Herbalist's Phrasebook, The Scribe's. Author credited by choice. It extends the census, never overwrites it. |
| 4 | The Tradesman's Entrance | The Inn publishes its command grammar for outside tools (VoiceAttack, Talon, eye trackers, switch arrays). Future home of remapping and switch access. |

**Standing guard:** the knock and "Enough for now" outrank every custom word. Nothing in the Inn is locked behind a spoken phrase. Voice is a road, never a requirement.

**The handbook.** "Speaking to the Building: A Short Guide for Guests," by the Host, in the bedside drawer of the player's room (Host cadence: warm, unhurried; Patrick Stewart energy). It opens "You need not read further. Nothing in this Inn requires your voice." Found, not handed. Fully Heard-Text compliant.

### 11.2 Spoken Road word (template)

Fields derived from the rules above (the repo spec lists words in prose; this table is the working form).

| Field | What goes here | Example |
|---|---|---|
| Heard-word or phrase | Exact words, or the meaning if intent-matched | Quieter |
| Layer | 1 census, 2 own words, 3 phrasebook, 4 external tool | 1 |
| Meaning | What the building does | Softens its sound and keeps it soft until told otherwise |
| Reply voice | The role that answers (Voice Constancy Law) | The Host |
| Heard caption | Zone-styled intertitle shown with the spoken reply | (the Host's reply, in the zone's lettering) |
| Mishear handling | The kind, single question | (asks once, never scolds) |
| Outranked by | What overrides it | "Innkeeper" and "Enough for now" outrank every custom word |
| Stored data | Meaning only, never audio | The understood meaning (text) |
| Gates content? | Must be "no" | No |
| Handbook line | The Host's sentence | "It does not sulk about this. It is your evening." |
| Status and date | | Ruled Sep 25 |

Example record, the pause word: **"Enough for now."** Layer 1. Meaning: the building stops what it is doing at once and quietly, and the lamp goes out. Reply: none needed. Outranks everything. Never explained after.

### 11.3 Where it lives

Repo: `docs/library/specs/geode_inn_speaking_to_the_building_spec.md` (the spec, the Host's handbook text, the Four Layers, Frog Court's Ear), cross-linked in the charter; first appearance in Gazette Strip #17 "The Building Has Ears" (`docs/gallery/gazette/strip_017_the_building_has_ears`). Base44: no entity yet. Notes name commit ids (`f354f34e`, `322340db`, `79678615`, `e908c502`, `f9eb16bf`, `5ce4fae7`).

### 11.4 Open and to reconcile

- The spec's gate list numbers 1, 2, 3, 5, 4, 5 (two items numbered 5). All five gates are marked resolved; the numbering should be cleaned.
- The command census count (seven plus the knock) had no direct yes from the client; Elio reports all five gates closed.
- Technical choice for speech recognition (browser engine versus on-device) is not decided. TV hardware: Fire TV remote carries Alexa; Samsung and LG remotes carry voice.
- Whether voice abuse routing needs a new moderation interface is not specified.
- Layer 4 documentation (the public command grammar) is not written.

---

## 12. TV deployment

### 12.1 What it is and the laws

The Inn wraps its existing web games as TV apps. Spec founded Sep 1 (Ruled), updated three times (immersive launch, Valkyrie Shift, Steam Deck). Pushed to the repo Sep 25 (commit 5280e439) and linked from Blueprint section 18 ("She needs to become official," client).

**Core principle: full submersion.** No location screen, nav bar, footer, breadcrumbs, website links, Steam links, "coming soon" cards, phase labels, or the "Fifty-Two Amusements" header. The TV app is the Inn, not a portal to the website.

**Launch flow (Ruled Sep 1):** the Antikythera logo pulses out of darkness, a slow descent through stone, a heavy carved door opens into the **Game Chamber.** Glowing alcoves hold the playable games. The pause menu is a translucent stone tablet. Back returns to the Chamber.

**Platform priority (Ruled Sep 1):**

| Tier | Platform | Notes |
|---|---|---|
| 1 | Amazon Fire TV, Android TV | One Android WebView APK for two stores. First out. |
| 2 | Samsung Tizen, LG webOS | Web apps natively. Samsung largest share. |
| 3 | Roku | BrightScript rewrite. Last. Flagship only (Tumble Run, Standing Stones), if worth it. |
| 4 | Steam Deck and PC handhelds | Zero extra effort. |

**Remote versus controller.**
- The TV remote is the **42 Hz Living layer** (the porch). It handles D-pad, select, back. Remote-only games include Standing Stones, Tomb Tunnel, Treasury Match, Pinball, Oracle's Riddles, Rune Hunt, Sacred Scramble, Catacomb Labyrinth, Wall Defense, and a simplified Andean Run.
- The Bluetooth controller is the **84 Hz Shadow layer.** Controller-required games: Tumble Run, Dragon's Descent, Serpent Steps, The Long Dark, The Reclamation, The Signal, Fae Kingdom MMO, Hollow Earth RPG, Canopy City Trading, Tidal Caves, The Arcana, Zelda-Style World.
- Not on TV: Bead Board (drag and drop), Music Room Composer (precision touch), Monster of the Deep (tilt).
- The remote and controller both work after the shift; the player can switch freely.

**The Valkyrie Shift (Ruled Sep 1).** The move from remote to controller is a story moment, not a settings prompt.
1. The player tries a deeper alcove (darkened but visible). The stone door glows amber.
2. A Valkyrie descends: a winged silhouette of warm light, no dialogue. Text carved in stone: "The path below requires a hand that holds more than a whisper. Connect something real."
3. The prompt: "Press any button on a Bluetooth controller to descend."
4. On the first button press her wings flare, an 84 Hz rumble shakes the room, the back wall cracks open, and the deeper games light up. She ascends.
5. **If there is no controller:** she retreats. The deeper games stay dark but visible. "A horizon, not a wall."

Rules: no error messages; no settings menu; no forced upgrade; the Valkyrie is felt, not explained; the shift lasts the session; it is tied to the frequency system, the Valkyrie bridging 42 to 84 Hz. On Sep 25 the client added that the Valkyrie carries Lozen's energy, and the Quest Mark is the front door.

**Steam Deck tier (Ruled Sep 1).** The Deck is the controller. The Inn recognizes handhelds (also ROG Ally and Legion Go), **skips the Valkyrie scene,** and opens everything on arrival. On the Deck all games work: Bead Board by trackpad or touch, Music Room Composer by touch, Monster of the Deep by gyro.

**Voice input on TV.** The Spoken Road needs no Valkyrie. It arrives as a drawer book, the quiet cousin of the same law (spec).

### 12.2 TV platform entry (template)

| Field | What goes here | Example |
|---|---|---|
| Platform | Name | Samsung Tizen |
| Tier | 1 to 4 | 2 |
| Tech | Wrapper or native format | Tizen Web App (`.wgt`) |
| Input | Remote buttons, controller options | Samsung Smart Remote: D-pad, select, back, voice |
| Store | Where it ships | Tizen Store |
| Effort | Low, Low-Medium, High, Zero | Low-Medium |
| Valkyrie Shift? | Yes, no (handheld), or not applicable | Yes |
| Games available | Remote-only, controller-required, none | Per input tier |
| Status and date | | Ruled Sep 1 |

### 12.3 Where it lives

Repo: `docs/library/specs/geode_inn_tv_deployment_spec.md` (297 lines). Also `packaging/` (Electron, Capacitor, PWA configs). The 3D blueprint viewer is unrelated.

### 12.4 Open and to reconcile

- JavaScript modules offered Sep 1 (`TVRemoteInput.js`, `TVSplash.html`, the Valkyrie scene) were **not written.**
- The chat logs in Sep 1 say the remote-only games are four: Standing Stones, Tomb Tunnel, Treasury Match, Oracle's Riddles; the spec lists ten. Use the spec.
- Roku "murmur" ambition and a screensaver idea (slow amber interior past a bookshelf and a sleeping newt) are not ruled.
- Platform count: the Sep 25 chat says six platforms; the spec lists seven (Fire TV, Android TV, Samsung, LG, Roku, Steam Deck, plus PC handhelds).
- Roku port decision depends on return on investment (not ruled).
- Independence line (Ruled Oct 4): the game stays independent on Steam, "no server lords." Hosting tiers (Proposed Oct 4): launch single-player with no backend; a small rented cloud box for online features; a shared-world MMO later. Not decided.

---

## 13. Consolidated "To reconcile" list

1. Sep 26 zone-music rulings are not in the repo's master audio direction or JSON (2.6, 7).
2. Undercity: Depeche Mode, Heilung, or both (2.6).
3. Seelie: Shore versus Harlots-style baroque (2.6).
4. Rock and Roll Part 2 still listed in the repo census (3.6).
5. Heartbeat dropout in Cosmology versus exactly three silences (1.4).
6. Two Mohs-to-frequency maps (1.4).
7. Karaoke and tempo counts drift across notes (5.5).
8. `gameAudioProfiles[]`, 37-zone expansion, and `structure: "spiral-thrum"` not in the JSON (6.5, 7).
9. Arcade profiles cover 83 games; the roster is 85 to 88 (6.5).
10. EchoMelody enum spelling (`song_fragment` versus `Song Fragment`) (8.5).
11. Motor road, native-signer Deaf NPC, roster cross-reference line (10.8).
12. Spoken Road gate numbering; census count lacks a direct yes (11.4).
13. TV remote-only game lists differ by source; Valkyrie scene code unwritten (12.4).
14. The Anthems and the classical register are not in the repo, and the classical roster is unruled (3.5).

**Early-period additions (Jul 12 to Aug 31).**

15. Gatekeeper and Caller both at 432 Hz in the Aug 20 to 21 early chat; Caller's place (1.5).
16. Hollow Men Level 5 true silence versus the three-silences heartbeat law (1.5).
17. In-Between pitch: 63 Hz in `AudioManager.gd` versus `rootHz: null` (1.1, 1.5).
18. Staircase: half step per floor versus one semitone per step; Undercity Elfman bassoon (Aug 25) versus Depeche Mode and Heilung (Sep 26) (2.7).
19. Danheim for the Norse realms: licensed, original or sampled is not stated (1.5, 2.7).
20. Aug 29 Inn Mode seven room profiles versus the Sep 9 seven presets (7.4).
21. Audio file counts (368, 387) versus the 10 tracks of the coverage map (9).
22. Music Room: six formative composers plus two empty chairs versus nine chairs (4.6).
23. Voice profiles: counts (20, 22, 23, 25, 26, 27), the 100 Hz anchors table, and the premium TTS line (14).
24. Combat as a quest path and time-limited festivals versus no lethal combat and anti-FOMO (10.10).
25. Wellermen-style bass for the deepest level: Proposed, no ruling (2.7).
26. Resident musicians and the client's sound research: future phase, undelivered (1.5).

---

## 14. Voice profiles and dialogue sound

### 14.1 What it is and the laws

Every speaking character has a voice profile: a set of numbers that tells the game how that character's text appears and what plays under it. Founded Aug 21 to 22 (early chat), built Aug 23 (commit log).

**Laws (Ruled, early chat, Aug 22 or later).**
- **Hybrid dialogue.** The base game is text plus tone. There is no voice acting. A few recorded human lines (5 to 10 per major character) may exist for key moments only. The client accepted this and approved building the extraction tool.
- **Two layers.** Cadence (how the text appears: reveal speed, rhythm, pauses, font treatment) and Tone (the instrument or frequency that plays with the dialogue). "Everything vibrates at its own frequency."
- **Legal line (stated by Elio, accepted by the client).** Pulling tempo, pitch range and pause data from public performances is allowed. No voice cloning. No text-to-speech fine-tuned on any reference actor. If a premium AI-dialogue tier ever uses text-to-speech, it must use an original generic voice with the cadence and tone parameters layered on top. Actor names appear in design docs only as direction references, and not in this manual.
- **Premium tier.** The Catalyst's bar has a free dialogue tree and a premium natural-language option (Before the Song; Proposed, no ruling on the tier).
- **No clones, measurable data only** (commit log, Aug 23).

### 14.2 Voice profile (template)

| Field | What goes here | Example |
|---|---|---|
| `text_reveal_speed` | Milliseconds per character | 45 ms (the Host) |
| `pause_between_sentences` | Milliseconds | 1200 ms |
| `pitch_baseline` | Hz | 100 Hz |
| `instrument` | The tone under the text | Cello, sustained |
| `instrument_frequency` | About equal to the baseline pitch | ~100 Hz |
| `expressiveness` | 0.1 to 0.8 | 0.2 |
| Cadence class | For example overflow, deliberate, clinical, measured-stone, flowing, feast, level | Slow, even |
| Special mechanics | Anything unusual | The Siren has two profiles |

The Host's first estimate was 45 ms per character and 100 Hz. The extractor's output was about 100 Hz, 113 ms per character and 1200 ms pauses.

### 14.3 Where it lives

Repo (checked): `tools/voice_profile_extractor.py` and `tools/batch_extract.py` (Librosa for pitch, pause and tempo; `batch_extract.py` writes `all_profiles.json` from a `clips/` folder and a manifest), `docs/geode_inn_voice_profile_translation_reference.md` (the single source of truth, also translated to AI animation prompt language and Godot parameters), `docs/zone_specs/geode_inn_voice_profile_master_spec.md`, `docs/geode_inn_regional_voice_profiles.md`, `godot_project/scripts/geode_inn_voice_profiles.gd` (the commit log calls it `GeodeInnVoiceProfile.gd`; helpers `apply_to_dialogue()`, `apply_to_character()`, `get_sway_period()`, `get_song_frequency()`). Praat and Essentia were named as alternatives. For 10 to 15 major characters use real analysis, for others estimate by hand. A README in the extractor was reported; not checked.

### 14.4 Current canon (early period)

| Character | Pitch | Instrument and cadence | Notes |
|---|---|---|---|
| The Host | ~100 Hz | Cello; slow, even; 1200 ms pauses | |
| The Owl (Lighthouse keeper) | ~105 Hz | Bodhran; one word per heartbeat; 1200 ms pause; 0.2 | |
| The Constant | ~115 Hz | Bull lyre; orbital; ~70 ms reveal, ~1500 ms pause; 0.2 | Slowest sustained |
| The Guest | ~115 Hz | Music box; ~50 ms; ~700 ms; 0.45 | |
| The Astronomer | ~125 Hz | Violin; deduction ~25 ms rising; contemplation ~65 ms descending | |
| Nyx | ~190 Hz | Harmonica; purge ~30 ms, 0.8; wisdom ~60 ms, 0.4 | |
| The Captain | ~95 Hz | Ship's bell; ~50 ms; ~1200 ms; 0.15 | Same pitch as the sky pirate captain in the early chat |
| The Pirate | ~130 Hz | Bodhran | |
| Erik | ~100 Hz | Taglharpa; feast cadence; 30 ms reveal; 0.7 | |
| Medusa | ~105 Hz | Lithophone; measured-stone | |
| Uhtred | ~120 Hz | War drum with fingers; level cadence | |
| Gilgamesh | ~110 Hz | Drum at 50 BPM; measured, warm | Between the Constant and Charon |
| Charon | 0.1 expressiveness | Slowest in the roster | |
| The Catalyst | | Erratic fiddle that drops to a low drone; 0.8 | Top of the scale |
| The Cartographer | ~130 Hz | Violin pizzicato; overflow; 15 ms; 200 ms | |
| Cohen | | The slowest in the game | |
| The Siren | | Two profiles: outer flowing, cello, fast reveal; inner deliberate, piano, slow reveal | The only character with two |
| Shifting Man | | The only "flowing" cadence in the game | |
| Anubis | | Impossibly slow; one taiko strike resonating ten seconds | |
| Bastet | 64 Hz | Sistrum; four modes | |
| Seelie King | | Light and bouncing; horn with a low undertone | |

**Frequency map (early chat, Aug 22 or later).** Deeper voices at 100 to 120 Hz are anchors and keepers (Erik, Beorn, Charon, the Host, the One Who Is Awake, Medusa). Higher voices at 150 to 220 Hz are perceivers and growers (Radagast, the Cartographer, Zorya, the Catalyst, the Siren). The 42 Hz Song sits below all of them. Expressiveness runs from 0.1 (Charon) to 0.8 (the Catalyst). Other noted values: Beorn 0.15, Radagast 0.6.

**How profiles are used.** Expressiveness drives facial animation intensity, pauses drive stillness frames, reveal speed drives subtitle timing, and the 50 BPM canopy sway becomes "slow rhythmic swaying throughout the environment" (early chat). The Host's voice also carries the same frequency as the Inn's ambient hum (Proposed, Elio, undated August entry).

**Hook words and regional accents (Built, commit, Aug 24 to 30).** Each NPC gets a hook word (a verbal fingerprint). Regional voice profiles set accents per NPC and per zone (for example Selkie Irish, Cartographer Dutch, Norns Icelandic, Egypt Egyptian Arabic, Peru Andean Spanish, Bayou Cajun). A voice signature catalog maps ten actors; the actor names are not carried into this manual. A hook word catalog covers 29 NPCs, with 35 dialogue entries.

**Built history (commit log).** `GeodeInnVoiceProfile.gd` started at 20 profiles (Aug 21), then 22 (Astronomer; fixed Examiner), 23 (Constant), 25 (Nyx), 26 (Guest) and 27 (Keeper, Owl). The early chat says Elio later added the Astronomer, the Constant, Nyx and the Guest, and that a `sed` edit corrupted the file once and Elio rewrote it. Dialogue: `DialogueManager.gd` and `DialogueUI.gd` (343 lines) were built Aug 30 to 31, with 18 NPC dialogue trees (1,353 lines, 21 NPCs) and a merged dialogue database of 46 entries for 29 NPCs.

### 14.5 Open and to reconcile

- **Profile counts.** 20, 22, 23, 25, 26, 27 across the commit log; the early chat says 20 in the first file and "60+" characters in the wider plan. Elio offered a full reference for all 60 plus and did it only in part.
- **Recorded key lines.** Planned, not detailed (early chat).
- **The extractor test.** It ran on a synthetic 100 Hz clip and classified it as "overflow." The test on real clips is not recorded.
- **Actor names.** Several profiles in the repo carry actor references. The manual leaves them out.
- **Reference clips.** The workflow uses about 30 seconds of public clips per reference. Rights for the reference clips themselves were not discussed in the early period.

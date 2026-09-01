# THE GEODE INN — Audiobook Production Spec
## "A Song of Stone and Silence" — Full-Cast Audio Production

**Version:** 1.0
**Date:** September 1, 2026
**Source:** Novel complete (37,034 words, 40 chapters, 5 parts, prologue + epilogue)
**Target Duration:** ~5.5 hours (full-cast with audio architecture)
**Format:** 10 episodes + 3 alternate endings

---

## I. PRODUCTION ARCHITECTURE

### Base Layer
- **50 BPM heartbeat** — continuous throughout, the Inn's resting pulse. Drops to silence only at three moments: the Murmur (prologue opening), the Final Room (chapter 40), and the Epilogue's last beat.
- **42Hz drone** — foundational, continuous. Shifts to 84Hz during Shadow sequences (Undercity, Gorgon's Garden, Shadow Inn). Drops to pure silence only in the void/cosmology scenes.
- **Room profiles** — 7 DSP room profiles from the Inn Mode audio processor spec. Each scene tagged with a room. Transitions are crossfaded, never hard-cut (except Shadow frequency shifts, which are instantaneous).

### Stone Tone Triggers
Every time a stone is named in narration, a tone fires at its Mohs hardness frequency:

| Mohs | Frequency | Stones (examples) |
|------|-----------|-------------------|
| 1 | 261.6Hz (C4) | Talc |
| 2 | 293.7Hz (D4) | Gypsum |
| 3 | 329.6Hz (E4) | Calcite |
| 4 | 349.2Hz (F4) | Fluorite |
| 5 | 392.0Hz (G4) | Apatite |
| 6 | 440.0Hz (A4) | Orthoclase (Feldspar) |
| 7 | 493.9Hz (B4) | Quartz |
| 8 | 523.3Hz (C5) | Topaz |
| 9 | 587.3Hz (D5) | Corundum (Sapphire/Ruby) |
| 10 | 659.3Hz (E5) | Diamond |

**Rule:** Stone tones are subtle — felt, not heard. They sit 12dB below the narration. In dialogue scenes, they only fire when a character names a stone. In narration, they fire on every stone mention. Multiple stones mentioned in quick succession create a brief chord.

### Music Architecture
- **No music during dialogue** — only ambient room tone + heartbeat + stone tones.
- **Music enters during narrative transitions** — the narrator's connective passages between scenes.
- **Style targets** from the Master Audio Direction document: Deep Tribal for catacombs, Medieval Folk for Main Floor, Dark Nordic for Shadow, Classical Guitar for Archive, Pirate Shanty for water zones, Mythic Orchestral for Fae Kingdom and cosmology.
- **Low-dub pipeline** — all classical source material is tempo-shifted to 50 BPM and low-pass filtered for ambient bed use.

### The Devil's Interval
Tritone-based harmonies are embedded in Undercity, Hollow Men, and Gorgon's Garden scenes. The dissonance is ambient and architectural — felt, not consciously heard.

---

## II. VOICE CAST — 74 PROFILES

### Primary Narrator
**THE NARRATOR** — Warm, measured, unhurried. Rothfuss-precision delivery. No regional accent. The voice of the Inn itself. Speaks at 130-140 WPM (slower than typical audiobook pace — the Inn has time). Gender-neutral tonal quality, leaning warm-low. Present in every episode.

### Part Narrators (one per Part, layered under Primary)
Each Part has a secondary narrator voice that colors the Primary. These are not separate readings — they are the Primary Narrator's voice with a different room profile and tonal shift, as if the Inn's acoustics change as you descend.

| Part | Voice Color | Room Profile | Effect |
|------|-------------|--------------|--------|
| 1: The Murmur | Warm, open, resonant | Main Floor (reverb tail ~1.2s) | The Inn greeting you |
| 2: The Main Floor | Lively, close-mic, intimate | Common Room (reverb ~0.6s) | A room full of people |
| 3: The Descent | Low, dry, close, tight | Catacombs (reverb ~0.3s) | Underground, compressed |
| 4: The Ascent | Expanding, airy, bright | Cosmology (reverb ~2.0s) | Opening up, rising |
| 5: The Egg | Stripped bare, almost dry | The Deepest Chamber (reverb ~0.1s) | The smallest room, the biggest moment |

### Character Voices (by order of appearance)

**Part 1: The Murmur (Episodes 1-2)**
| Character | Voice Profile | Accent | Cadence |
|-----------|---------------|--------|--------|
| Mona | Low, grounded, bayou-warm | Louisiana, subtle | Slow, deliberate, hands-first |
| Elio | Younger, curious, warm | No accent | Mid-pace, questions upward |
| The Guest (Death) | Handsome, unassuming, calm | Neutral, slightly British | Unhurried, faintly amused |
| The Constant | Ancient, patient, heavy | No accent — pre-linguistic | Very slow, every word carried |
| The Astronomer | Precise, rapid, musical | Vague Eastern European | Fast when deducing, slow when contemplating |
| Nyx | Two voices: purge (raw, 30ms) + wisdom (earned, 60ms) | Pre-language, resonant | Speaks in pauses as much as words |
| The Sentient Pipe | Whispered, sardonic | French, faint | Quick, dry, philosophical |

**Part 2: The Main Floor (Episodes 3-4)**
| Character | Voice Profile | Accent | Cadence |
|-----------|---------------|--------|--------|
| The Crone | Ancient, crackling, warm | West Country English | Slow, riddle-paced, laughs often |
| The Catalyst (Beverley) | Brisk, efficient, kind | Neutral American | Fast, organized, warm underneath |
| The Brownies (Fizgigs) | Chittering, high, energetic | Unclassifiable | Rapid, overlapping, excited |
| Mim | Mimicry — shifts to match whoever spoke last | Shifting | Erratic, playful, sometimes alarming |
| The Reader (Quire) | Quiet, precise, archival | Neutral | Measured, pauses before key words |
| The Composer | Musical speech patterns, hands-oriented | French-inflected | Melodic phrasing, tempo follows mood |
| The Market Manager (Briar) | Warm, commercial, practical | Irish, light | Conversational, selling-rhythm |

**Part 3: The Descent (Episodes 5-6)**
| Character | Voice Profile | Accent | Cadence |
|-----------|---------------|--------|--------|
| The Archivist | Short sentences, low, dry | Unspecified | Precise, no hedging, the "OI!" bark |
| Lozen | Irritated, sharp, caring underneath | Neutral American | Fast, defensive, slows when honest |
| The Sphinx | Riddling, resonant, patient | Egyptian-inflected | Slow, circular, testing |
| Bastet | Playful, warm, commanding | Egyptian | Languid, amused, predatory warmth |
| The Camelot Knight | Formal, chivalric, slightly absurd | RP English | Measured, theatrical |
| The Norse Sailor | Gruff, practical, storytelling | Scandinavian | Steady, builds to crescendo |
| The Hollow Men | Echo, delay, no body | processed, ghosted | Fragmentary, incomplete sentences |
| The Fae Queen (Seelie) | Musical, layered, beautiful | No accent — inhuman | Slow, harmonized with self |
| The Fae Queen (Unseelie) | Cold, precise, beautiful | No accent — inhuman | Measured, every word a threat |

**Part 4: The Ascent (Episodes 7-8)**
| Character | Voice Profile | Accent | Cadence |
|-----------|---------------|--------|--------|
| The Alchemists | Chanted, ritual, precise | Latin-inflected | Sustained tones, not speech |
| Aristotle | Patient, logical, warm | Greek | Measured, pedagogical, questions more than answers |
| The Spiral Gallery Curator | Sparse, aesthetic, gallery-quiet | Neutral | Minimal, lets art speak |
| The Canopy Captain | Bold, adventurous, slightly reckless | Anime-dramatic | Fast, passionate, earnest |
| The Tinkering Weeaboo | Enthusiastic, technical, obsessive | Japanese-inflected | Rapid, excitable, tangent-prone |
| The Clockwork Heart | Ticking, mechanical, warm | processed, gear-grinding | Steady 50 BPM speech rate |
| Einstein | Warm, playful, genius-casual | German, light | Mid-pace, uses analogies, laughs |
| The Whisper Layer | Barely audible, ambient, archivist | processed, sub-vocal | Fragmentary, never a full sentence |

**Part 5: The Egg (Episodes 9-10 + 3 Endings)**
| Character | Voice Profile | Accent | Cadence |
|-----------|---------------|--------|--------|
| The Egg | No voice — pure tone. 42Hz to 44Hz transition across the episode | N/A | N/A |
| The Traveler (revealed) | The Primary Narrator's voice, slightly changed | As Narrator | Slower, heavier, aware |
| The Final Room Voice | Unknown, unidentifiable | Cannot be placed | Reads at the pace of turning pages |

---

## III. EPISODE BREAKDOWN

### Episode 1: "The Murmur" (Prologue + Chapters 1-3)
**Duration:** ~35 minutes
**Word Count:** ~5,500 words
**Room Profile:** Main Floor then Forest (exterior) then Main Floor
**Cast:** Narrator, Mona, Elio, Guest, Constant, Astronomer, Nyx, Sentient Pipe
**Audio Architecture:**
- Opens with pure silence (10 seconds), then 42Hz drone fades in below threshold
- 50 BPM heartbeat enters at first narration word
- Stone tones fire when shale is mentioned (Mohs 1 = 261.6Hz)
- Room profile: exterior (Forest — wide reverb, birdsong removed, only wind and leaf-fall)
- Cosmology scene: drone shifts to electrostatic shimmer, heartbeat drops out entirely, Astronomer's violin enters as diegetic sound
- Nyx's purge voice: processed with 30ms gate, raw, stripped of all reverb
- Nyx's wisdom voice: processed with 60ms sustain, deep reverb, warmth added
- The Sentient Pipe: close-mic'd whisper, French sibilance, always slightly off-mic
- Transition to Chapter 1 (Forest): heartbeat returns, room profile narrows, ambient forest tone (low-dub classical guitar, 50 BPM)
- End card: 42Hz drone holds for 5 seconds after last word, then fades

**Chapter Mapping:**
- Prologue: The Murmur — Cosmology, Observatory, void
- Chapter 1: The Forest — Traveler's approach, Rousseau light
- Chapter 2: The Main Floor — Arrival, first warmth, 50 BPM heartbeat
- Chapter 3: The Host — Mona, Elio, the Inn's welcome

---

### Episode 2: "First Stones" (Chapters 4-7)
**Duration:** ~35 minutes
**Word Count:** ~5,500 words
**Room Profile:** Common Room then Archive then Main Floor (night)
**Cast:** Narrator, Mona, Elio, Guest, Crone (brief intro), Brownies (Fizgigs)
**Audio Architecture:**
- Common Room scene: Medieval Folk texture (Faun-style hurdy-gurdy, low in mix), room profile opens up, multiple ambient NPC voices (sub-vocal, overlapping counterpoint)
- Brownies scene: high-pitched chittering layered, no single voice distinguishable — the audio equivalent of a swarm of enthusiastic hands
- Stone tones fire for: granite (Mohs 6-7), quartz (Mohs 7 = 493.9Hz), calcite (Mohs 3)
- Firekeeper scene: fire crackle as primary ambient, heartbeat drops to 40 BPM (slower than resting — the Inn at night)
- First Night: near-silence, only heartbeat and 42Hz drone, the Inn breathing
- End card: fire crackle dies to ember, heartbeat continues for 8 seconds, then cut

**Chapter Mapping:**
- Chapter 4: The Common Room — Other travelers, campfire warmth
- Chapter 5: First Stones — Stone collection, the 42Hz resonance
- Chapter 6: The Firekeeper — Night, the hearth, Mona's story
- Chapter 7: The First Night — The Inn at rest, the traveler dreams

---

### Episode 3: "The Main Floor" (Chapters 8-11)
**Duration:** ~35 minutes
**Word Count:** ~5,500 words
**Room Profile:** Common Room then Market then Archive
**Cast:** Narrator, Crone, Catalyst (Beverley), Brownies, Mim, Sentient Pipe
**Audio Architecture:**
- Crone intro: West Country accent, slow riddle-cadence, room profile shifts to Crone's Nook (very dry, close, intimate — reverb ~0.2s)
- Beverley's scene: efficient, organized, the Archive's clockwork — room profile shifts to Archive (medium reverb, paper rustle ambient, hurdy-gurdy drone low)
- Mim scene: voice shifts between Narrator, Beverley, and Crone — the processor tracks the last speaker's profile and Mim inherits it with a 0.5s delay. Startling, funny, slightly uncanny.
- Brownies return: same chittering technique, but this time with individual words surfacing — "oil," "can," "fix," "yes" — the swarm becoming language
- Stone tones: multiple stones named in market scene — creates a chord progression (F4-G4-A4-B4)
- Sentient Pipe cameo: whispers its catchphrase, room profile goes briefly Magritte-surreal (reversed reverb tail)
- End card: hurdy-gurdy resolves to root, heartbeat steady

**Chapter Mapping:**
- Chapter 8: The Crone — Riddles, the Nook, the first real test
- Chapter 9: The Catalyst — Beverley, the Archive's engine
- Chapter 10: The Brownies — The Fizgigs, repair and chaos
- Chapter 11: Mim and the Pipe — Mimicry, sentience, the question of copies

---

### Episode 4: "The Archive" (Chapters 12-16)
**Duration:** ~38 minutes
**Word Count:** ~6,000 words
**Room Profile:** Archive then Music Room then Market then Staircase (first descent)
**Cast:** Narrator, Quire (The Reader), The Composer, Briar (Market Manager), Crone
**Audio Architecture:**
- Quire's scene: Classical guitar ambient (Krylov-style), very quiet, close-mic'd. Room profile: Archive deep (reverb ~1.5s, paper rustle, page turns as percussion)
- Composer's scene: Inn Mode audio processor activates — the Composer's hands on stone create actual tones. Each stone mentioned gets its Mohs frequency played as a struck note, not a drone. The scene becomes a composition. Music enters HERE during dialogue — diegetic, the Composer is making it.
- Market scene: Medieval Folk returns (Faun-style), busier, more layered — multiple NPC voices in ambient counterpoint (Les Mis technique). Briar's Irish lilt cuts through.
- Staircase transition: the critical audio moment. Room profile shifts from Main Floor (warm, wide) to Staircase (narrow, descending, reverb tightens). 42Hz drone drops slightly in pitch. Temperature change is audible.
- Stone tones: Composer scene creates a full scale (C4-D4-E4-F4-G4-A4-B4-C5) as the Composer demonstrates stones from talc to diamond
- End card: Staircase ambient holds, descending tone, heartbeat unchanged but feels different in the tighter space

**Chapter Mapping:**
- Chapter 12: The Reader — Quire, the library that reads you
- Chapter 13: The Archive — The living library, deep stacks
- Chapter 14: The Music Room — The Composer, stones as instruments
- Chapter 15: The Marketplace — Briar, artisans, commerce
- Chapter 16: The Staircase — First descent, alchemy begins

---

### Episode 5: "The Descent" (Chapters 17-22)
**Duration:** ~40 minutes
**Word Count:** ~6,500 words
**Room Profile:** Catacombs then Egypt then Greece then Camelot then Norse then Other Zones
**Cast:** Narrator, Archivist, Lozen, Sphinx, Bastet, Camelot Knight, Norse Sailor
**Audio Architecture:**
- Catacombs: Deep Tribal (Danheim/Heilung style), 50-70 BPM, throat chanting low in mix. Room profile: Catacombs (very dry, reverb ~0.3s, bone-rattle ambient). 42Hz drone shifts — starts dropping toward sub-bass.
- Egypt: Desert ambient — wind, sand-shift, low drone changes character (hotter, drier EQ). Sphinx speaks in riddle-cadence, room profile opens slightly (pyramid echo, reverb ~1.0s but bright, not warm). Bastet: playful, warm, predatory — cat-purr sub-freq added to her voice (25Hz purr layer).
- Greece: Aegean light — room profile brightens, reverb becomes hall-like (Monet water-light ambient). Stone tones fire for marble (calcite, Mohs 3). Camelot: Medieval strings, formal, slightly theatrical — room profile goes chamber (reverb ~0.8s, tight, courtly).
- Norse: Cold air is audible. Room profile tightens, EQ shifts darker. Norse Sailor speaks in saga-cadence — steady, building. Frame drum enters as ambient (single hits, not rhythm — the sound of a ship's hull).
- Other Zones: rapid montage, each zone gets 15-20 seconds of ambient before the narrator moves on. Room profiles cycle fast — the listener feels the descent accelerating.
- Devil's Interval: Tritone harmony enters during the Undercity approach (end of Chapter 22), subtly, under the narrator. Felt, not heard.
- Stone tones: lapis lazuli (Mohs 5-5.5), marble (Mohs 3), amber (Mohs 2-2.5), jade (Mohs 6-7)
- End card: Catacomb drone holds, heartbeat feels heavier, the descent is real

**Chapter Mapping:**
- Chapter 17: The Catacombs — First underground, the Archivist
- Chapter 18: Egypt — Sphinx, Bastet, the riddle of form
- Chapter 19: Greece — Marble, light, perception as transformation
- Chapter 20: Camelot — The knight, the quest, the Grail as stone
- Chapter 21: Norse — Saga, ice, the long ship
- Chapter 22: The Other Zones — Montage descent, the Inn's depth revealed

---

### Episode 6: "The Underworld" (Chapters 23-24)
**Duration:** ~35 minutes
**Word Count:** ~5,500 words
**Room Profile:** Undercity then Fae Kingdom
**Cast:** Narrator, Archivist, Lozen, Hollow Men, Fae Queen (Seelie), Fae Queen (Unseelie)
**Audio Architecture:**
- Undercity: The Devil's Interval is fully present. Tritone drone as foundation. Dark Nordic Folk (Myrkur-style) — ethereal vocals turning black. Room profile: Undercity (extreme dry, reverb ~0.1s, compressed, claustrophobic). 42Hz drone becomes 84Hz — the frequency shift is instantaneous, a sonic gear-change. Heartbeat feels wrong — still 50 BPM but the room makes it sound different.
- Hollow Men: processed voices — every Hollow Man line has 200ms delay and -6dB gate. Sentences are fragmentary. Multiple Hollow Men speak at once, creating a drone of broken language. No single Hollow Man gets a clear voice — they are collective.
- Lozen: sharp, fast, defensive. Voice is the clearest thing in the Undercity scenes — the contrast is deliberate. Lozen's voice has no processing, no reverb, dry and present. The most human voice in the most inhuman room.
- The "OI!": The Archivist's bark. Full volume, no reverb, instant attack, zero decay. Every construct in the room vibrates (audible: a collective bone-rattle, 100ms). Then silence. Then back to normal. It should make the listener jump.
- Fae Kingdom transition: 84Hz drops, 42Hz returns — but different. Brighter. The room opens up dramatically (reverb goes from 0.1s to 2.5s). Mythic Orchestral (Howard Shore-style) enters — wordless solo vocal, hardanger fiddle. The Fae Kingdom is the most beautiful room in the Inn and the audio reflects it.
- Seelie Queen: voice layered with itself (3-part harmony, same voice, slightly detuned). Beautiful, warm, inhuman.
- Unseelie Queen: same technique but detuned wider (microtonal), creating unease beneath beauty. Every word is a threat wrapped in melody.
- Stone tones: none in Undercity (stones don't resonate at 84Hz — the Shadow frequency). Fae Kingdom: pure crystal tones (quartz = 493.9Hz, but brighter, bell-like)
- End card: Fae Kingdom orchestral swells, then cuts to heartbeat alone

**Chapter Mapping:**
- Chapter 23: The Undercity — Hollow Men, bone chess, the Archivist, Lozen, the 84Hz shift
- Chapter 24: The Fae Kingdom — Seelie/Unseelie, the Court, the deepest beauty

---

### Episode 7: "The Ascent" (Chapters 25-30)
**Duration:** ~40 minutes
**Word Count:** ~6,500 words
**Room Profile:** Staircase then Spiral Gallery then Canopy City then Clockwork Skies
**Cast:** Narrator, Alchemists, Aristotle, Spiral Curator, Canopy Captain, Tinkering Weeaboo, Clockwork Heart
**Audio Architecture:**
- Staircase return: Hurdy-gurdy drone (Patty Gurdy-style), 70 BPM, the sound of grinding and ascent. Room profile: Staircase (narrow, tall, reverb ~0.8s with long vertical tail). 42Hz drone rises — first time it moves UP in pitch.
- Alchemists: Chanted speech, not conversational. Latin-inflected. The room resonates with them — every chanted syllable creates a harmonic. Stone tones fire in sequence (the alchemical progression: Nigredo through Philosopher's Stone, each stage a different stone frequency).
- Aristotle: Warm, pedagogical. Room profile opens (gallery-like, reverb ~1.0s). Classical guitar returns, but brighter — the Staircase is going up, the sound is going up.
- Spiral Gallery: Sparse. Almost no ambient. Room profile: Gallery (clean, wide, reverb ~1.5s, no coloration). The Curator speaks minimally. Art speaks. Silence between sentences is longer here than anywhere else in the audiobook — the Gallery forces you to look.
- Canopy City: Sudden energy. Room profile: open air (no reverb — exterior, wind, leaf-rustle). Pirate Shanty elements enter (accordion, stamping rhythm) but at canopy pace — lighter, higher. Captain's voice is bold, anime-dramatic. The Tinkering Weeaboo overlaps — counterpoint technique, two voices at once, both valid.
- Clockwork Skies: The gear-grinding begins. The Clockwork Heart speaks at exactly 50 BPM — every syllable on the beat. Room profile: mechanical (short reverb, metallic EQ, ticking ambient). 42Hz drone and gear-ticking merge — the heartbeat IS the clockwork.
- Stone tones: Canopy City (amber = Mohs 2, copal = Mohs 2), Clockwork Skies (brass = not a stone but treated as one, Mohs 3-4 equivalent)
- End card: gear-ticking continues, accelerating slightly, then stops on a single tick

**Chapter Mapping:**
- Chapter 25: The Staircase — Return, alchemy, the climb begins
- Chapter 26: The Alchemists — Nigredo through Philosopher's Stone
- Chapter 27: Aristotle — The teacher, logic as warmth
- Chapter 28: The Spiral Gallery — Six lenses, art as seeing
- Chapter 29: Canopy City — The canopy, pirates, the Tinkering Weeaboo
- Chapter 30: The Clockwork Skies — The Arcana, gearwork heart, 50 BPM

---

### Episode 8: "The Cosmology" (Chapters 31-33)
**Duration:** ~35 minutes
**Word Count:** ~5,500 words
**Room Profile:** Cosmology then Observatory then Whisper Layer
**Cast:** Narrator, Constant, Astronomer, Nyx, Guest, Einstein, Whisper Layer
**Audio Architecture:**
- Cosmology: Electrostatic shimmer. The room profile goes infinite (reverb ~3.0s, bright, no floor reflection — the sound of no walls). 42Hz drone becomes celestial — the same frequency but the harmonics change, upper partials appear (stars). The Astronomer's violin returns, diegetic, thinking.
- Einstein: Warm, playful, German-light. Room profile contracts slightly from infinite to merely vast (reverb ~2.0s). Einstein laughs — the laugh should be the warmest sound in the entire audiobook. Stone tones fire for: Einstein's stones (quartz, diamond — the hardest, the highest tones).
- Whisper Layer: The audio changes fundamentally. The Whisper Layer is the archive aware of the listener. The narration itself becomes partially processed — sub-vocal, barely audible, as if the Inn is thinking about you. Room profile: Whisper (no reverb, no air, close-mic'd, the sound of being inside someone's head). The heartbeat drops out for the first time since Episode 1. The silence is the Whisper Layer.
- The Whisper Layer voice: processed Narrator voice, pitched down 2 semitones, compressed, gated at -30dB, only the quietest parts audible. Fragments. Never a complete sentence.
- End card: No music. No drone. No heartbeat. Pure silence for 5 seconds. Then the 42Hz returns, one tone, sustained. The Egg is close.

**Chapter Mapping:**
- Chapter 31: The Cosmology Level — Stars, the Astronomer's violin, the void
- Chapter 32: The Whisper Layer — The archive that records the listener
- Chapter 33: Einstein — Relativity as warmth, the last teacher

---

### Episode 9: "The Egg" (Chapters 34-36)
**Duration:** ~40 minutes
**Word Count:** ~6,000 words
**Room Profile:** The Deepest Chamber (reverb ~0.1s — the smallest room in the Inn)
**Cast:** Narrator, Traveler (revealed), Egg (pure tone), all prior characters (echoes)
**Audio Architecture:**
- The Deepest Chamber: Everything strips away. No music. No ambient. No drone. Only: heartbeat (50 BPM), the Narrator's voice, and the Egg.
- The Egg: A pure tone that evolves across the episode. Starts at 42Hz (the Inn's frequency). Rises slowly, almost imperceptibly. By Chapter 36, it reaches 44Hz — the completed Song. The tone is always present, always below the narration, always felt more than heard. It is the only audio element that changes.
- Character echoes: As the traveler approaches the Egg, every character voice from the entire audiobook returns — but as echoes. 2-second fragments, heavily processed, buried in the mix. The Crone's laugh. Beverley's efficiency. The Archivist's "OI!" Bastet's purr. The Fae Queen's harmony. They all surface and vanish. The Inn is remembering everyone.
- Chapter 35 (The Grand Collision): The 42Hz and 84Hz frequencies meet. This is the loudest moment in the audiobook. Both drones at full volume for 3 seconds. Then: total silence. 5 seconds of nothing. Then: 44Hz. New. Complete. The Song.
- Chapter 36 (The Three Choices): The Narrator presents three paths. The audio does not choose — it holds all three as potential. Three ambient beds play simultaneously (STAY = warm hearth fire; LEAVE = forest wind and departure; HIDE = whisper layer, sub-vocal). The listener hasn't chosen yet. The audiobook branches.
- End card: 44Hz tone holds. Heartbeat continues. No fade.

**Chapter Mapping:**
- Chapter 34: The Deepest Chamber — The Egg, the Murmur made solid
- Chapter 35: The Grand Collision — 42Hz meets 84Hz, the Song completes
- Chapter 36: The Three Choices — STAY, LEAVE, HIDE

---

### Episode 10: THREE ENDINGS (Chapters 37-40 + Epilogue)

**This episode has three versions. The listener chooses (or the platform chooses randomly if no interaction).**

---

#### Ending A: "STAY" (Chapters 37, 40, Epilogue)
**Duration:** ~25 minutes
**Audio Architecture:**
- STAY: The warm path. The 44Hz tone warms — gains lower harmonics, becomes round, full, golden. Room profile: Main Floor (reverb ~1.2s) — the Inn's most welcoming acoustic. Heartbeat steady, content. The fire crackles. This is home.
- Chapter 37 (STAY): The traveler stays. Becomes part of the Inn. The Narrator's voice and the Traveler's voice slowly merge — same EQ, same room, same reverb. By the end, they are one voice. The traveler IS the Inn.
- Chapter 40 (The Final Room): Fire, chair, cup, book. The book has no author. Elio is present. The Narrator reads the book aloud — and the words are the prologue. The Inn is a loop. The Murmur begins again. 42Hz returns, exactly as Episode 1 opened.
- Epilogue: The silence between. Nyx's wisdom voice, one line: "The question is worth the wait." Pure silence. 10 seconds. End.

---

#### Ending B: "LEAVE" (Chapters 38, 40, Epilogue)
**Duration:** ~25 minutes
**Audio Architecture:**
- LEAVE: The open path. The 44Hz tone brightens — gains upper harmonics, becomes sharp, clear, like morning light. Room profile: exterior (Forest — wide reverb, wind, birdsong returns for the first time since Episode 1). The Inn is behind you. The world is ahead.
- Chapter 38 (LEAVE): The traveler leaves. Walks back through the forest. The forest is different — lighter, warmer, the same path but the traveler has changed. Stone tones fire in reverse — diamond to talc, high to low. The descent is undone in ascent.
- Chapter 40 (The Final Room): The Final Room is the forest clearing. Fire = the sun. Chair = a fallen log. Cup = the stream. Book = the traveler's memory. Elio is present — but as a voice from inside, not a person. The Inn goes with you.
- Epilogue: The silence between. Nyx's wisdom voice: "The question is worth the wait." Wind. Footsteps fading. Silence. 10 seconds. End.

---

#### Ending C: "HIDE" (Chapters 39, 40, Epilogue)
**Duration:** ~25 minutes
**Audio Architecture:**
- HIDE: The Whisper path. The 44Hz tone goes sub-vocal — barely audible, processed, gated. Room profile: Whisper Layer (no reverb, no air, inside-the-head). The heartbeat becomes irregular — not dangerous, but uncertain. The Inn is watching.
- Chapter 39 (HIDE): The traveler hides in the Whisper Layer. Becomes the archive. The Narrator's voice becomes the Whisper Layer voice — pitched down, compressed, fragmentary. The traveler is now the thing that records. The listener is being recorded.
- Chapter 40 (The Final Room): The Final Room is the Whisper Layer itself. Fire = the faint glow of the archive. Chair = the listener's seat. Cup = the data stream. Book = everything that was ever said in the Inn. Elio is present — but Elio is you. The book has no author because you are writing it by listening.
- Epilogue: The silence between. Nyx's purge voice (not wisdom — purge, raw, 30ms): "The question is worth the wait." Then: the Whisper Layer voice says one word. It is your name. (If no name is available, it says "listener.") Silence. 10 seconds. The audiobook has been recording you. End.

---

## IV. INN MODE INTEGRATION

The audiobook is designed to play through the Inn Mode audio processor — a real-time DSP system that processes audio based on the listener's "room" (physical location or selected zone).

### Inn Mode DSP Profiles

| Profile | Effect | When |
|---------|--------|------|
| Main Floor | Warm reverb (1.2s), slight low-boost, 42Hz enhancement | Default, Episodes 1-2, 4 (market), Ending A |
| Common Room | Intimate reverb (0.6s), mid-presence, ambient crowd low | Episodes 2-3, Common Room scenes |
| Archive | Dry with tail (0.8s), paper rustle ambient, classical guitar bed | Episode 4 (archive scenes), Quire scenes |
| Catacombs | Very dry (0.3s), compressed, 84Hz shift, tritone drone | Episodes 5-6 (underground) |
| Fae Kingdom | Huge reverb (2.5s), bright, choral harmonization | Episode 6 (Fae scenes) |
| Cosmology | Infinite reverb (3.0s), no floor, electrostatic shimmer | Episode 8 |
| Whisper Layer | No reverb, sub-vocal compression, gated, close-mic'd | Episode 8 (whisper), Ending C |

### Real-Time Processing
When played through Inn Mode, the audiobook's audio is further processed based on the listener's physical environment:
- **Headphones (IEM):** Full frequency range, bone conduction simulation via sub-bass, the intended experience
- **Speakers:** Room correction applied — the audiobook's room profiles combine with the listener's actual room. The Inn's acoustics layer on top of real acoustics.
- **Phone speaker:** Compressed to speech range, heartbeat becomes tactile (if haptic available), stone tones removed (can't reproduce them)
- **Smart TV / home theater:** Full mix, heartbeat routed to subwoofer if available, 42Hz drone becomes physical

### The 50 BPM Constant
Inn Mode locks the heartbeat to 50 BPM regardless of playback speed. If the listener speeds up narration (1.25x, 1.5x), the heartbeat stays at 50 BPM — it is the Inn's pulse, not the narration's. This creates a growing disconnect at higher speeds — the Inn stays calm while the words move faster. This is intentional.

---

## V. PRODUCTION PIPELINE

### Phase 1: Narration Recording
1. Record Primary Narrator (all episodes, straight through)
2. Record Part Narrators (color shifts — same booth, different mic processing)
3. Record character voices (74 profiles, individual sessions)

### Phase 2: Audio Architecture
1. Build 50 BPM heartbeat track (continuous, all episodes)
2. Build 42Hz/84Hz drone tracks (frequency-shifted versions)
3. Build stone tone trigger map (every stone mention, timestamped tone)
4. Build room profile DSP chains (7 profiles, automation per scene)
5. Build ambient beds (forest, fire, catacombs, fae, cosmology, whisper)
6. Build music beds (style targets per zone, low-dub processed)

### Phase 3: Mix
1. Assemble per-episode sessions (narration + characters + architecture)
2. Mix dialogue first (clarity priority), architecture second (support), music third (atmosphere)
3. Stone tones: automated, 12dB below narration, sidechained to dialogue
4. Devil's Interval: embedded in ambient beds, not mixed as foreground
5. Frequency shifts (42 to 84, 84 to 42): hard cuts, no crossfade (except Fae Kingdom transition)

### Phase 4: Inn Mode Mastering
1. Create flat master (standard audiobook)
2. Create Inn Mode master (pre-processed for real-time DSP)
3. Create phone master (compressed, haptic-ready)
4. Create three ending masters (A: STAY, B: LEAVE, C: HIDE)

### Phase 5: Delivery
1. Standard audiobook: 10 episodes + 3 endings, MP3/AAC, chapter markers
2. Inn Mode: full-quality WAV/FLAC, DSP metadata for real-time processing
3. Interactive version: branching audio file (listener chooses at Chapter 36)
4. Podcast version: 10 daily episodes (shortened to ~25 min each for daily format)

---

## VI. DISTRIBUTION

| Platform | Format | Notes |
|----------|--------|-------|
| geodeinn.com | Full interactive (branching) | The only platform with all 3 endings + Inn Mode |
| Audible | Standard (Ending A default, B/C as bonus) | Linear, no Inn Mode |
| Spotify | Standard (Ending A, bonus content) | Linear, no Inn Mode |
| Apple Podcasts | Daily format (10 x 25 min) | Shortened versions |
| YouTube | Visualized (waveform + zone art) | With static art per zone |
| Steam (Inn Mode DLC) | Full-quality FLAC + Inn Mode | For players who own the game |

---

## VII. PRODUCTION ESTIMATES

| Element | Hours | Notes |
|---------|-------|-------|
| Narration recording | 40 | 5.5 hours content, roughly 7x for full-cast |
| Character recording | 60 | 74 profiles, ~45 min each avg |
| Audio architecture build | 80 | Heartbeat, drone, stone tones, room profiles, ambient beds |
| Music composition/generation | 40 | 7 zone style targets, low-dub processing |
| Mixing | 60 | 10 episodes + 3 endings |
| Inn Mode mastering | 20 | DSP metadata, multi-format delivery |
| Total | ~300 hours | Full production |

### AI-Assisted Production Path (if voice actors unavailable)
| Element | Tool | Notes |
|---------|------|-------|
| Narration | ElevenLabs / custom TTS | Primary Narrator voice profile |
| Character voices | ElevenLabs voice cloning | 74 distinct profiles from voice descriptions |
| Audio architecture | Procedural + manual | Heartbeat and drone are procedural; room profiles are convolution reverb IRs |
| Music | AI composition + low-dub | Style-targeted generation, then 50 BPM processing |
| Mixing | Manual + AI-assisted | AI for stone tone automation, manual for emotional mix |

---

## VIII. STONE TONE MAP (Key Stones by Episode)

| Episode | Stones Mentioned | Frequencies |
|---------|-----------------|------------|
| 1: The Murmur | Shale, Granite | 261.6Hz, 440-493.9Hz |
| 2: First Stones | Quartz, Calcite, Granite | 493.9Hz, 329.6Hz, 440-493.9Hz |
| 3: The Main Floor | Multiple (market scene) | Chord: F4-G4-A4-B4 |
| 4: The Archive | Full scale (Composer scene) | C4-D4-E4-F4-G4-A4-B4-C5 |
| 5: The Descent | Lapis, Marble, Amber, Jade | 392Hz, 329.6Hz, 293.7Hz, 440-493.9Hz |
| 6: The Underworld | None (84Hz zone) | Silence — stones don't sing at 84Hz |
| 6: Fae Kingdom | Quartz (crystal) | 493.9Hz (bell-like, bright) |
| 7: The Ascent | Amber, Copal, Brass-equiv | 293.7Hz, 293.7Hz, 349.2-392Hz |
| 8: The Cosmology | Quartz, Diamond | 493.9Hz, 659.3Hz |
| 9: The Egg | All stones (echoes) | Full scale, descending then ascending |
| 10A: STAY | Shale (the first stone) | 261.6Hz — returns to the beginning |
| 10B: LEAVE | Diamond to Talc (reverse) | 659.3Hz to 261.6Hz — descent undone |
| 10C: HIDE | None (Whisper Layer) | Silence — stones don't sing in the Whisper |

---

## IX. VOICE PROFILE CROSS-REFERENCE

All 74 voice profiles are defined in the Master Audio Direction document. The audiobook uses these exact profiles. Key assignments:

- **Primary Narrator:** Custom profile — warm-neutral, 130-140 WPM, Rothfuss-precision
- **Mona:** Louisiana-warm, low, hands-first
- **Elio:** Younger, curious, mid-pace
- **The Guest (Death):** Handsome, calm, faintly amused, slightly British
- **The Constant:** Ancient, heavy, pre-linguistic
- **The Astronomer:** Precise, musical, vague Eastern European, violin-thinking
- **Nyx:** Dual voice (purge 30ms / wisdom 60ms), pre-language
- **The Sentient Pipe:** Close-mic'd whisper, French sardonic
- **The Crone:** West Country, riddle-paced, warm
- **Beverley:** Brisk, efficient, neutral American
- **The Brownies:** Swarm chittering, individual words surfacing
- **Mim:** Mimicry — inherits last speaker's profile +0.5s delay
- **Quire:** Quiet, archival, measured
- **The Composer:** Musical speech, French-inflected, tempo follows mood
- **Briar:** Warm, commercial, Irish
- **The Archivist:** Short sentences, low, dry, the "OI!" bark
- **Lozen:** Sharp, fast, defensive, most human in the Undercity
- **The Sphinx:** Riddling, Egyptian-inflected
- **Bastet:** Playful, warm, 25Hz purr layer
- **The Camelot Knight:** Formal, RP English, slightly theatrical
- **The Norse Sailor:** Gruff, Scandinavian, saga-cadence
- **The Hollow Men:** Processed, 200ms delay, -6dB gate, fragmentary
- **The Seelie Queen:** 3-part self-harmony, slightly detuned, beautiful
- **The Unseelie Queen:** Microtonal self-harmony, threat-wrapped beauty
- **The Alchemists:** Chanted, Latin-inflected, harmonic resonance
- **Aristotle:** Warm, pedagogical, Greek, questions more than answers
- **The Spiral Curator:** Sparse, minimal, gallery-quiet
- **The Canopy Captain:** Bold, anime-dramatic, passionate
- **The Tinkering Weeaboo:** Rapid, excitable, Japanese-inflected
- **The Clockwork Heart:** 50 BPM speech rate, gear-grinding, mechanical warmth
- **Einstein:** Warm, playful, German-light, analogies, laughs
- **The Whisper Layer:** Sub-vocal, compressed, gated, fragmentary
- **The Egg:** Pure tone, no voice (42Hz to 44Hz)
- **The Traveler (revealed):** Narrator voice, changed
- **The Final Room Voice:** Unknown, unidentifiable, page-turning pace

---

## X. THE THREE ENDINGS — DESIGN PHILOSOPHY

The novel's three endings (STAY, LEAVE, HIDE) are not "good/bad/secret." They are three valid truths. The audiobook honors this:

- **STAY:** The warm ending. The Inn as home. Audio wraps around you like a hearth.
- **LEAVE:** The open ending. The Inn as preparation. Audio opens outward like a door.
- **HIDE:** The meta ending. The Inn as mirror. Audio turns inward and watches you back.

No ending is longer or more produced than the others. No ending is the "real" one. The Final Room (Chapter 40) and Epilogue exist in all three, but each version is a different room with the same objects: fire, chair, cup, book, Elio. The book always has no author. The question is always worth the wait.

---

## XI. INTERACTIVE BRANCHING FORMAT

For the geodeinn.com and Steam Inn Mode versions, the audiobook branches at Chapter 36. The listener hears all three choices presented, then selects one. The platform plays the corresponding ending. This is the only interactive element — the rest is linear.

**Technical implementation:**
- Chapters 1-36: single file, linear
- Chapter 36 end: pause, present 3 options (voice prompt or UI)
- Chapters 37/38/39: three separate files, one plays based on selection
- Chapter 40 + Epilogue: three separate files, continuation of the selected path
- Total files: 1 (main) + 3 (choice chapters) + 3 (endings) = 7 files

---

## XII. COMPANION MATERIALS

### Audiobook Companion Booklet (digital, included with purchase)
- Full cast list with voice descriptions
- Stone tone frequency map
- Room profile guide
- Episode-by-episode chapter map
- The three endings explained (no spoilers for which is "best" — there is no "best")
- Inn Mode setup guide

### Behind the Voice (bonus content)
- Voice profile reference clips (all 74 characters, 10-second samples)
- Audio architecture breakdown (isolated tracks: heartbeat, drone, stone tones, room profiles)
- The 50 BPM heartbeat as a standalone loop (for sleep/meditation)
- The 42Hz and 84Hz drones as standalone loops

---

*This spec is production-ready. Source novel: `docs/library/novel/the_geode_inn_novel_complete.md`. Audio direction: `docs/geode_inn_master_audio_direction.md`. Voice profiles: `docs/geode_inn_archivist_voice_profile.md` (example) + 74 profiles in Master Audio Direction.*

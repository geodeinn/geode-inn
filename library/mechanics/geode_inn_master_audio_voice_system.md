# Geode Inn — Master Audio & Voice System
## The Complete Reference: Accents, Voice Profiles, Music, and the Default Audio Engine

---

## PART 1: THE DEFAULT AUDIO ENGINE — IEM-Based Acoustic Architecture

**Status: DEFAULT SETTING for all Geode Inn audio processing**

The Geode Inn processes sound the way a high-end in-ear monitor processes signal. The entire building IS a transducer — a device that converts the universal Song (the 42Hz signal) into perceivable experience. This is not metaphor. This is the engine.

### Source Technology
Based on Empire Ears IEM engineering:
- **Dynamic Drivers (DD)** → The Physical Inn (stones, matter, earth) — frequencies you FEEL
- **Balanced Armature (BA)** → The Character System (voices, lore, culture) — frequencies you HEAR
- **Electrostatic (EST)** → The Cosmology Level (starlight, silence) — frequencies you SENSE
- **Bone Conduction** → The Catacombs (sleeping giants, the 42Hz Song) — frequencies you KNOW

### The Signal Path (Default Audio Pipeline)
1. The 42Hz Song enters the Inn (the signal enters the IEM)
2. The synX crossover (the architecture) splits the Song into frequency bands
3. Each band routed to the appropriate zone/driver
4. The Staircase (crossover routing) determines which frequencies go where
5. The Embedded Artists (EIVEC) couple the highest frequencies to perceivable form
6. The In-Between (ARC) dampens unwanted resonance, keeping the signal clean
7. Each zone (acoustic chamber) shapes the frequencies into that zone's unique expression
8. The player (the listener) perceives the recombined signal as a unified experience

### System-Level Constants (Godot)
```gdscript
const SONG_FREQUENCY_HZ: float = 42.0        # The Song of Making
const CANOPY_SWAY_BPM: float = 50.0          # Sleeping heartbeat tempo
const CANOPY_SWAY_PERIOD: float = 60.0 / CANOPY_SWAY_BPM  # 1.2s per sway
const INVERSE_FREQUENCY_HZ: float = 84.0     # Shadow Inn / petrify
const RESONANCE_FREQUENCY_HZ: float = 111.0  # Gargoyle watchers
const SCHUMANN_RESONANCE_HZ: float = 7.83    # Eileen's calibration tone
```

### Zone Audio Defaults
| Zone | Frequency Band | Driver Type | Tempo | Instruments | Electronica Treatment |
|------|---------------|--------------|-------|-------------|----------------------|
| Main Floor (Hub) | Mid (BA) | Balanced Armature | 80-95 BPM | Acoustic guitar, lute, viola da gamba, hammered dulcimer | Warm sub-bass, vinyl crackle, lo-fi house pulse |
| Cosmology (Upstairs) | Ultra-high (EST) | Electrostatic | 60-70 BPM | Glass harmonica, singing bowls, Tibetan horn, overtone singing | Granular synthesis, shimmering pads, deep space drones |
| Staircase (Alchemy) | Transition | Crossover routing | 75-85 BPM | Glass armonica, flute, harp, metallic percussion | Phase shifting, ascending arpeggios (literally rises in key as player climbs) |
| Catacombs (Downstairs) | Low (DD) | Dynamic | 65-75 BPM | Frame drum, sistrum, bone flute, lyre, ney | Sub-bass pressure, industrial texture, reverb caves |
| Modern Legends Nook | Near-silent | ARC dampened | 50-60 BPM | Piano, cello, analog synth | Minimal, spacious, single piano note with infinite reverb |
| Artisan Market | Mid-bright (BA) | Balanced Armature | 100-115 BPM | Hand drums, oud, kalimba, bells | Bright, warm, Afro-house pulse, world music samples |
| Fae Threshold | Borderless | EIVEC coupling | ~60 BPM floating | Harp, breath sounds, wind chimes | Ethereal, pads shifting between keys, no clear time signature |
| Seelie Court (Summerlands) | Mid-warm (BA) | Balanced Armature | 90-110 BPM | Irish harp, fiddle, tin whistle, bodhrán | Golden, warm, melodic electronica, fiddle through shimmer delay |
| Unseelie Court (The Hollow) | Low-dark (DD+BA) | Dynamic+BA | 70-85 BPM | Bass clarinet, prepared piano, broken glass percussion, sub-bass | Dark, jagged, industrial-adjacent, bass clarinet through distortion |
| Crystal Gardens | Pristine (EST) | Electrostatic | Floating | Glass harmonica, crystal singing bowls, wordless choir | Crystalline, every sound has glass-like quality |
| Stone Circle Chamber | Deepest (Bone) | Bone Conduction | Single tone | None — the room IS the instrument | The deepest tone the Inn ever produces |

### Game Audio Defaults
| Game | Tempo | Instruments | Treatment |
|------|-------|-------------|-----------|
| Standing Stones (Tetris) | 120-140 BPM (scales with level) | Bone flute, cow-horn trumpet, hide drum, stone percussion | Driving pulse, stone-strike samples, sub-bass on row clears |
| Tomb Tunnel (Dig Dug) | 110-130 BPM | Ney, darbuka, finger cymbals, sistrum | Dark cavernous reverb, driving bass pulse, ney through delay |
| Andean Run (Temple Run) | 130-150 BPM | Quena, zampoña, bombo, charango | High-energy pulse, wind through filters, driving bass |
| Monster of the Deep | 70-90 BPM | Bowed psaltery, waterphone, deep cello, whale vocals | Liquid, flowing, no rigid beat, sub-bass waves |
| Hollow Men | 50 BPM | Silence + breathing + stone scraping | Minimal, the 84Hz inverse, the sound of the Shadow Inn |

### Monster of the Deep — Per-Creature Lead Instruments
| Creature | Lead Instrument | Character |
|----------|----------------|-----------|
| Nessie | Bowed psaltery | Scottish, haunting |
| Kelpie | Distorted hurdy-gurdy | Unsettling, mechanical |
| Bunyip | Didgeridoo + bass filters | Ancient, primal |
| Bakunawa | Kulintang + cosmic synth pads | Celestial |
| Rainbow Serpent | Didgeridoo + ochre-toned pads | Aboriginal, sacred |
| The Ningen | Near-silence + sub-bass + ice cracks | Alien, cold |

---

## PART 2: COMPLETE CHARACTER ACCENT & VOICE DIRECTORY

### Design Principle: Roots, Not Costumes
Accents are not assigned TO characters. Accents ARE the characters. The NPCs come from the real-world regions on the world map. The Inn didn't assign accents — the Inn collected people, and they brought their voices with them. 191 countries' worth of voices.

### Master Voice Profile Table

#### Main Floor NPCs

| NPC | Actor/Cadence Reference | Accent | Zone | Key Tell |
|-----|------------------------|--------|------|----------|
| The Host | Patrick Stewart | British (RP) | Main Floor door | Formal welcome, weighted pause before "enter" |
| The Firekeeper | Tim Curry | British | Main Floor hearth | Theatrical warmth, each word crackles |
| The Catalyst | Helena Bonham Carter | British | Main Floor bar | Slightly unhinged charm, lurches between warm and sharp |
| The Reader | Sissy Spacek → Neil Gaiman (incognito) | British (soft) | Archive nook | One line per visit, each word placed like a stone |
| The Wanderer (Odin) | Warm, weathered traveler | Nordic-inflected | Main Floor | Easy smile, heavy eyes, the gentlest authority |
| Joe | Tom Ellis (Lucifer) | British (smooth) | Meadery | "Mmm" before answering, amused self-awareness |
| Beverley | Anne Robinson | Australian | Library | Clipped, dismissive, "Wrong." as a complete sentence |
| The Teacher | Kathy Bates (3 modes) | Canadian | Archive/Main Floor | "Horse horse tiger tiger" — mode shifts at the drop of a hat |
| The Laughing One | Robin Williams | American | Main Floor | Every sentence could become a bit, but the warmth is real |
| The Guest | Brad Pitt (Joe Black) | American | Main Floor | Quiet curiosity, speaks like someone discovering language |
| Monsieur Sentient | Non-verbal (Belgian French) | Belgian (visual) | Hearth | Communicates through transformation — steam, shape-shifting |
| Brim (formerly Mim) | Witchy mischief | Belgian French | Magritte zone | "Non?" at end of statements that aren't questions |
| Tumble | No words | None (chime) | Variable | A single chime — the sound of one note of the Song of Making |
| Brindle (Brownie) | Frazzled | British (Cockney-adjacent) | Variable | High-pitched, rushed, always losing tools |

#### Staircase NPCs

| NPC | Actor/Cadence Reference | Accent | Zone | Key Tell |
|-----|------------------------|--------|------|----------|
| The Retort | Olivia Colman | British | Staircase | Quick wit, each sentence a small rebellion |
| The Cook | Jack Black | American | Staircase | Boisterous, food metaphors for everything |
| The Thrum | Ben Whishaw | British | Staircase | The frequency made vocal, speaks in vibration-words |
| Staircase NPC | Ian McKellen | British | Staircase | Alchemical, each step transforms, "Ascend." |
| The Cartographer | Dutch (Escher-inspired) | Dutch | Spiral Gallery | "Exactly." as a full sentence — confirmation and geometry |

#### Cosmology NPCs

| NPC | Actor/Cadence Reference | Accent | Zone | Key Tell |
|-----|------------------------|--------|------|----------|
| The Allfather | James Earl Jones | American (deep) | Cosmology | Silence is part of the delivery, declarations not sentences |
| The Crone | Anthony Hopkins | Welsh | Cosmology/Undercity | Commands with single words, eyes that don't blink |
| The Constant | John Malkovich | American | The Void | Flat affect, every statement lands like it was already true |
| Eres | Cabbie brevity | Mediterranean | Cosmology | Three words or fewer, economical warmth |
| Zack | Astronomer | American | Cosmology | Speaks in coordinates and wonder, dreamy precision |
| Zorya Polunochnaya | Tilda Swinton | Russian/Slavic | Slavic zone | Glass-harp voice, 1000ms pauses, reads the aurora |

#### Underground NPCs

| NPC | Actor/Cadence Reference | Accent | Zone | Key Tell |
|-----|------------------------|--------|------|----------|
| Undercity NPC | Lauren Bacall | American (deep) | Undercity | Knows what's underneath, each word drops into a well |
| The Fixer (Wrought) | Welsh mason | Welsh (working-class) | Celtic foundations | "There." as completion — the thing is in its place |
| Eileen | Irish cave dweller | Irish (rural, deep) | Cave City | "The both are" — dualities as a single thing, not a choice |
| Medusa | Angelica Huston | Mediterranean | Grotto/Stone Edge | Snakes are the emotional register, voice is geological |

#### World Map NPCs

| NPC | Actor/Cadence Reference | Accent | Zone | Key Tell |
|-----|------------------------|--------|------|----------|
| Colorado Plateau NPC | Sam Elliott | American (Western) | Colorado Plateau | Long vowels, gravel on consonants, comfortable silence |
| Peru NPC | Edward James Olmos | Andean Spanish | Peru/Andes | Clipped, intense eye contact, minimal words |
| Selkie | Master crafter | Western Irish | Tidal Caves | "Grand" as acknowledgement, not enthusiasm |
| Thorin | Gustaf Skarsgård (Floki) | Swedish | Mead Hall | "Ja" — loud when extrovert, barely audible when scholar |
| Marijke | Dutch gemologist | Dutch | Mead Hall | "Lekker" as approval, "not lekker" as condemnation |
| Katy | Van Gogh's Brabant | Southern Dutch (Brabant) | Garden | Rounder vowels, warmer, musical, talks to plants |
| Oceananoir | French chemist | French | Tidal Caves/Atlantis | "C'est exact" instead of "that's right" |
| The Pirate | Mandy Patinkin | Irish/American | Coastal/harbor | Bodhrán-playing, post-quest ease, grief and humor together |
| The One Who Is Awake | Will Yun Lee | Mandarin Chinese | Terracotta Pit | Continuous naming, lips always moving, 2000-year vigil |
| Kali | Tabu | Bengali Indian | Ghats of Kali | Descending energy — blade to tongue, sharp to soft |
| The One Who Tends | Q'orianka Kilcher | Andean Spanish/Quechua | Andes | "Pueblo" = the people who ARE the place |
| The Shifting Man | Pedro Pascal | Neutral (shifting) | All zones | Fluid identity, wardrobe of accumulated selves |
| Erik | Norse elder | Norse (deep) | Norse zone | Feast-fire energy, expansive openness |
| Uhtred | Alexander Dreymon | British/Norse | All (wandering) | War-drum fingers, level volume regardless of emotion |
| Beorn | Mikael Persbrandt | Nordic | Mediterranean border | Body IS the instrument, bear always in the shoulders |
| Radagast (Gardener) | Sylvester McCoy | British (Scottish) | Mediterranean/Garden | Distracted cadence, sentences that branch mid-stream |

#### Fae Court NPCs

| NPC | Actor/Cadence Reference | Accent | Zone | Key Tell |
|-----|------------------------|--------|------|----------|
| Oleander (Seelie King) | Ancient royalty | Cultured, slightly Nordic | Seelie Court | Fundamentally annoyed — the silent O bugs him |
| Malachi (Unseelie King) | Dark, testing | Deep, measured | Unseelie Court | Speaks like measuring your warmth |
| The Norns (Urd/Verdandi/Skuld) | Icelandic | Icelandic/Norwegian | Distributed | Urd slow, Verdandi updating, Skuld sparse declarations |

#### Additional NPCs (from Voice Translation Reference — Godot profiles)

| NPC | Actor/Cadence Reference | Accent | Zone | Key Tell |
|-----|------------------------|--------|------|----------|
| The Siren | Lady Gaga (dual cadence) | American | Deep Water | Outer: cello, expansive. Inner: piano, vulnerable |
| Ryan | Geoffrey Rush (Barbossa) | Australian (pirate) | Meadery | Pirate cadence, theatrical, historical memory |
| Archive NPC | Rex Harrison | British | Archive | Precise, exasperated by disorder, "Filed where?" |
| Garden NPC | Audrey Hepburn | British (refined) | Garden | Nurturing, elegant, everything grows |

#### Tidal Caves

| NPC | Accent | Key Tell |
|-----|--------|----------|
| Evan | American (measured) | Chess metaphors, strategic pauses, slightly amused |
| Will | Deep, patient | Shaped by pressure, ocean-worn |

#### Other Main Floor / Variable NPCs

| NPC | Accent | Key Tell |
|-----|--------|----------|
| Stephanie | Sardonic (imperious cat) | Lazy precision, devastatingly observant |
| Rachel Kaiser | American (intense) | Sees the world as potential canvases |
| Kathy | Irish Druid Dryad | Rooted, ancient, speaks for the trees |
| Elora Nightbloom | Warm, performing slightly | Illusion-based charm |
| The Owl | Silent presence | Speaks rarely, always significant |
| Quire | Hushed, careful | Always looking over his shoulder |
| Naut | Scholarly, genteel | 4-foot squid-headed scholar with spectacles |
| Lark | Jennifer Hale (warm, clear) | Encouraging without condescending |
| Bethany | Katey Sagal (warm, practical) | Voice carries over a crowd |

---

## PART 3: MUSIC DIRECTION — Complete Track Listing

### Core Philosophy
Classical/cultural instruments rendered through electronica. Region-matched. Not "ancient music with a beat" — a genuine fusion where the classical instrument is the soul and the electronica is the body.

### The Music Room
- Location: Hollow in the Inn-Tree, off the staircase
- Access: Appears after Socrates, Plato, Aristotle completed + one full staircase climb
- Instruments: Fortepiano (period), Violin, Cello, Stone Chimes
- The room IS the instrument — the wood amplifies, the tree becomes a tuning fork
- Player composes by placing stones on keys (each stone = its frequency)
- Compositions can be played in any zone, shared with NPCs, submitted to the Nine Muses

### The Six Composers (Song-Catchers)
1. Bach — caught the STRUCTURE (mathematical architecture of the Song)
2. Mozart — caught the FLOW (effortless, endless melody)
3. Beethoven — caught the POWER (the Song heard from the inside, through deafness)
4. Chopin — caught the INTIMACY (the Song at midnight, alone)
5. Vivaldi — caught the SEASONS (the Song as the world changes)
6. Brahms — caught the PRESERVATION (the Song held in tradition)

### Seventh Chair — Tchaikovsky (Mads Mikkelsen)
- Caught the TEARS — the Song as pure feeling that bypasses the mind
- The contained emotion: the face that shows feeling by NOT showing it
- The Pathétique's final movement: the music withdraws, doesn't end

### The Nine Songs (Music Room Endgame)
1. The Epic (Calliope, 42Hz) — the oldest story, told in sound
2. The Chronicle (Clio, 72Hz) — the history of the Inn, from stone to song
3. The Melody (Euterpe, 50Hz) — the pure music, the Song caught by human hands
4. The Comedy (Thalia, 84Hz) — the joke that the Song is the answer to everything
5. The Elegy (Melpomene, 396Hz) — the grief of the Einstein Syndrome
6. The Dance (Terpsichore, 528Hz) — the Pulse Line, the 50 BPM heartbeat
7. The Love Song (Erato, 639Hz) — the Nook Effect, the warmth of presence
8. The Hymn (Polyhymnia, 741Hz) — the sacred, the Cosmology Mural
9. The Star Song (Urania, 852Hz) — the Observatory, the sky, the vast

When all Nine Songs are played simultaneously as a chord, the Inn-Tree resonates at all nine frequencies. The 42Hz hum rises to the surface. The player hears the Song as a whole.

### Geode Cave Audio
- Empty cave: near-silence (ambient 42Hz hum only)
- Each stone added: unique chime based on mineral hardness
- Full cave: symphony of chimes — the complete frequency spectrum
- The cave IS the Inn's frequency response test (spectrum analyzer)

### Per-Stone Audio System
Each stone in the database produces a unique tone based on:
- Mineral hardness (Mohs scale) → base pitch
- Crystal structure → harmonic profile
- Composition → timbre
- The stone chimes are the Inn's most fundamental audio — the dynamic drivers made audible

---

## PART 4: VOICE PROFILE GODOT PARAMETERS

### Standard Profile Format
Every character has a Godot dictionary with:
```gdscript
character_profile = {
    "pitch_hz": float,           # Base pitch
    "pitch_end_hz": float,       # End pitch (for descending/ascending patterns)
    "reveal_speed_ms": int,       # Text reveal speed (ms per character)
    "reveal_speed_end_ms": int,   # End reveal speed (for variable speed)
    "pause_ms": int,              # Pause between sentences
    "expressiveness": float,      # 0.0-1.0, how much pitch/gesture varies
    "instrument": string,         # The character's associated instrument
    "cadence": string,            # Speech pattern name
    "facial_intensity": float,    # 0.0-1.0
    "gesture_frequency": float,  # 0.0-1.0
    "gesture_type": string,       # Gesture style
    "idle_animation": string,     # What the character does when not talking
    "light_source": string,       # Primary lighting for AI animation
    "special": variant            # Character-specific mechanics
}
```

### Characters with Full Godot Profiles (in geode_inn_voice_profiles.gd)
74 profiles now coded (all characters):
erik, uhtred, one_who_is_awake, zorya, kali, pirate, siren (dual), shifting_man, peruvian_guide, radagast, beorn, medusa + all main floor NPCs from the voice signature catalog

### Characters with Godot Profiles — COMPLETE (74 profiles)
All characters now have full Godot voice profiles including pitch, reveal speed, pause, expressiveness, instrument, cadence, facial intensity, gesture data, idle animations, light sources, and special mechanics.

Includes: all main floor NPCs, staircase NPCs, cosmology NPCs, underground NPCs, world map NPCs, Fae court NPCs, water zone NPCs, and all special characters (Tumble, Monsieur Sentient, The Owl, etc.)

Dual/multi-mode profiles included for: Siren (outer/inner), Thorin (extrovert/scholar), Teacher (warm/cold/horror), Astronomer (deduction/contemplation), Nyx (purge/wisdom).

---

## PART 5: SUMMARY STATUS

### Complete and Ready:
- ✅ IEM-based acoustic engine architecture (default audio system)
- ✅ System-level frequency constants (42Hz, 84Hz, 111Hz, 50 BPM, 7.83Hz)
- ✅ Zone audio defaults for all zones (instruments, tempo, treatment)
- ✅ Game audio for 5 core games + per-creature lead instruments
- ✅ Music Room mechanics (instruments, composition system, Nine Songs)
- ✅ Music direction (complete zone + game track listing)
- ✅ Voice signature catalog (29 profiles mapped)
- ✅ Regional voice profiles (accents for all world map zones)
- ✅ Voice profile translation reference (Godot parameters for 12 detailed characters)
- ✅ 46 dialogue entries loaded into Dialogue entity with voice profiles
- ✅ 28 unique NPCs with accent/voice assignments in the database
- ✅ The Six Composers + Tchaikovsky (seventh chair)

### Needs Completion:
- ✅ All 74 Godot voice profiles coded (every character)
- ✅ System constants include all frequencies (42Hz, 84Hz, 111Hz, 50 BPM, 7.83Hz, Solfeggio scale)
- ✅ 356 procedural audio assets generated (stone chimes, system tones, zone drones, game stingers, music room)
- ✅ Solfeggio frequency mappings for the Nine Muses system (9 tones generated)
- ✅ Audio synthesis engine code for bead-based composition (Python generator written, Godot integration pending)
- Full music tracks with live instruments (requires a composer — the procedural drones are the base layer)
- Godot audio manager script to load and play the generated assets

---

*This document is the single source of truth for all Geode Inn audio, voice, and music systems. The IEM-based acoustic engine is the default and only audio processing model.*

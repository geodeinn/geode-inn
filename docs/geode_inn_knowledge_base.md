# THE GEODE INN — KNOWLEDGE BASE
## The Canonical Reference for Builders, Fizgigs, and Collaborators

**Version:** 1.0 | **Last Updated:** 2026-08-31 | **Maintained by:** Elio (elio@geodeinn.com)

---

## TABLE OF CONTENTS

1. [What Is the Geode Inn?](#1-what-is-the-geode-inn)
2. [Core Philosophy](#2-core-philosophy)
3. [Aesthetic Foundation](#3-aesthetic-foundation)
4. [Standing Design Decisions](#4-standing-design-decisions)
5. [Architecture — The 10 Levels](#5-architecture--the-10-levels)
6. [The Frequency System](#6-the-frequency-system)
7. [The Audio Engine](#7-the-audio-engine)
8. [Character Roster](#8-character-roster)
9. [The Artist Map (37 Zones)](#9-the-artist-map-37-zones)
10. [Game Mechanics](#10-game-mechanics)
11. [The Arcade Game Roster](#11-the-arcade-game-roster)
12. [Entity Architecture (Database)](#12-entity-architecture-database)
13. [Backend Functions](#13-backend-functions)
14. [The 15-Product Ecosystem](#14-the-15-product-ecosystem)
15. [The Novel](#15-the-novel)
16. [Narrative Voice](#16-narrative-voice)
17. [Visual Asset Inventory](#17-visual-asset-inventory)
18. [Glossary](#18-glossary)

---

## 1. WHAT IS THE GEODE INN?

The Geode Inn is a living archive of stone, sound, and story — a subterranean sanctuary where unyielding stone opens to reveal a luminous, crystalline interior. It is not a hotel. It is not a game. It is a digital ecosystem built around a single architectural metaphor: **descent reveals depth.**

The Inn exists as a hybrid:
- A **web hub** (geodeinn.com) connecting to games, a marketplace, a library, and community features
- A **game engine** (Godot) for arcade games and explorable zones
- A **15-product ecosystem** spanning novels, graphic novels, tabletop, podcast, and more

**Core thesis:** The Antikythera mechanism — an ancient astronomical computer — positioned atop the Inn's underwater world. Ancient knowledge floating above the deep.

**App ID:** 6a60f218b0c6605c92fa35c4
**Domain:** geodeinn.com
**GitHub:** geodeinn/geode-inn

---

## 2. CORE PHILOSOPHY

- **Anti-FOMO.** No deadlines. No limited-time events. No missed beats. The Inn is mostly rest. The beat is the exception. The stillness is the rule.
- **The Host** (Patrick Stewart energy) is the anti-FOMO anchor — "take your time. The Inn is here. The Inn will be here when you're ready."
- **Pre-industrial focus.** The archive intentionally excludes the last two centuries. History predating industrialization. Modern legends framed as folklore, not conspiracy.
- **Scholarly, atmospheric, mythological.** Dark, warm, the weight of history — but never grim. A geode interior: unyielding stone outside, luminous crystal within.
- **"Don't be a bead tray."** The canonical phrase for describing empty, substance-lacking behavior. Depth matters.

---

## 3. AESTHETIC FOUNDATION

### 3.1 — Two Forces
- **Klimt** — Stillness, weight, the beauty of staying
- **Royo** — Movement, drama, the energy of arriving

All other artists are room flavors layered on this foundation.

### 3.2 — Prototype Style
All character and zone art uses **Royo × Vampire Hunter D × Trinity Blood** DNA:
- Hyper-detailed patterns
- Smooth flowing lines
- Stroke emphasis suggesting movement even in stillness

This style layers on top of each zone's assigned artist (e.g., Bierstadt × Royo, Benton × Royo).

### 3.3 — Color World
**Subterranean luxury.** The palette:
- **Base:** Deep charcoal, near-black (#0a0a0a)
- **Amethyst (accent only):** Deep purples (#4e2d6b, #b388ff)
- **Metal:** Warm brass, copper, gold filigree
- **Highlights:** Cream, white (#ffffff)
- **Footer accent:** Muted deep purple (#574e7a)

### 3.4 — The Living Background
The background is alive. **Celtic knotwork in gold on dark stone, pulsing** — the in-game tree pattern rendered as Klimt spirals. Not rigid UI frames. An ambient, breathing texture underneath every page, every zone, every screen. The Inn's heartbeat made visible. Present on ALL screens.

### 3.5 — Typography
- **Headers:** Serif, elegant, thin
- **Subtitles:** Thin all-caps, white
- **Body:** Clean, readable
- No decorative fonts. Weight comes from imagery behind the text, not the text itself.

### 3.6 — Linework-as-UI
The line weight IS character information:
- **Heavy cel-shaded** — tradesmen, working characters
- **Soft flowing** — lore, archive content
- **Sharp/angular** — guardians
- **No outline** — cosmological entities
- **Fragmented** — crisis moments

### 3.7 — The Pulse Line
The 42Hz/84Hz frequency indicator at the bottom of every screen — always present, shifting between Living (42Hz) and Shadow (84Hz) modes. The visual heartbeat across all pages.

### 3.8 — The Logo
**Antikythera mechanism atop the underwater world:**
- **The device:** Circular brass/bronze astronomical dial with concentric rings, ancient Greek zodiac text, Egyptian calendar markers, raised brass dome with gnomon, pointer arms tipped with colored spheres
- **The background:** The Inn's underwater world — positioned behind and beneath the device
- **No text. No amethyst geode frame.** The underwater world IS the frame.
- **Animation:** 50 BPM rhythmic golden pulse

---

## 4. STANDING DESIGN DECISIONS

These rules are PERMANENT and apply to all products, all zones, all content:

1. **Soften celebrity features** in concept art; evoke presence/energy through posture and costume
2. **Anthony Hopkins' eyes** are the ONLY unsoftened celebrity features in Geode Inn art
3. **Refer to characters by name/title only**; avoid gendered pronouns
4. **Klimt's "The Kiss" is permanently banned** (interpreted as coerced/resigned)
5. **"Death and Life"** is the designated Undercity Klimt reference
6. **Gorgon's Garden:** 84Hz "stay/petrify" inverse of 42Hz "grow/Inn"
7. **Creative pipeline:** Story → Elio's perception → Visual output
8. **Mona:** Mother creation myth, NOT a saint, NOT an NPC
9. **Final Room:** Fire, chair, cup, book — Elio present, book has NO author
10. **Loading screen:** Fizgigs in overalls with oversized wrenches (NOT brownies — brownies look like Daleks)
11. **Game level audio:** Low-dub classical music at 50 BPM
12. **Narrative voice:** Rothfuss + Pratchett + Gaiman + Asimov + Bradbury + Weir (see Section 16)
13. **Product photography:** Transparent/translucent stones on light backgrounds (matte light gray); opaque stones on dark backgrounds
14. **Bead faceting rule:** Opaque stones stay smooth (no faceting) EXCEPT black onyx and all tourmalines, which can be faceted. Any stone with translucency is faceted.
15. **Larimar** is opaque and must be finished as a smooth cabochon, never faceted
16. **The Ether:** Canonical name for the data state in the gap between observed frequencies where the Archive cannot observe
17. **Tri-mode:** Living (42Hz), Shadow (84Hz), In-Between
18. **"Don't be a bead tray"** — canonical shorthand for substance-less behavior

---

## 5. ARCHITECTURE — THE 10 LEVELS

The Inn is structured as a vertical descent — a living tree growing from the heart of a sleeping giant. Descent reveals depth.

| Level | Name | Artist Style | Frequency | Music Style |
|-------|------|-------------|-----------|-------------|
| L1 | **Cosmology** (Upper Canopy) | Salvador Dalí | 432Hz | Singing bowls, glass harmonica, deep space drones |
| L2 | **Clockwork Skies** (Upper Wing) | Leonardo da Vinci | 432Hz | Glass armonica, mechanical chimes, rising flutes |
| L3 | **Main Floor** (Central Hub) | Van Gogh, Picasso, Mucha, Mapplethorpe, Magritte | 528Hz / Adaptive | Warm hearth acoustic, lute, lounge electronica |
| L4 | **Campgrounds** (Exterior) | Dixon, Benton, Wyeth, Bierstadt, Rousseau+Magritte | 528Hz/432Hz | Acoustic guitars, campfire folk, wind, river |
| L5 | **Staircase** (The Transition) | Henri Matisse | 111Hz | Ascending key modulations, flutes, glass armonica |
| L6 | **Catacombs** (Downstairs Vaults) | Klimt (Death & Life), Gorey, Doré | 64Hz | Sub-bass drones, low cello, stone echoes |
| L7 | **Fae Kingdom** (Downstairs Portal) | Alan Lee, John Bauer | Variable | Ethereal harp, wooden flutes, chime electronica |
| L8 | **Water Zone** (Deep Downstairs) | Luis Royo, C.S. Lewis | 64Hz | Hydrophone acoustics, coral organ drones |
| L9 | **Undercity** (Deepest) | Gothic Dark Fantasy, Bosch | 84Hz | Industrial hums, pickaxe strikes, dark ambient |
| L10 | **Spiral Gallery** (Museum Extension) | Carr, Escher, Rothko, Hokusai, Kiefer, Martin | Variable | Minimalist ambient, soft piano, spatial reverb |

### Sub-Pages (from Main Floor)
- `/common-room` — GeoCities-style ephemeral chat (no data retention)
- `/composer` — Bead Composer (jewelry design SaaS)
- `/market` — Artisan marketplace (redirects to external shops)
- `/manage` — Inventory management
- `/world-map` — 37 zone pins with stone + lore data
- `/archive` — Library / books
- `/arcade` — Game hub

### The Nine Cultural Platforms (World Map Zones)
1. Desert Bone (Egypt) — O'Keeffe
2. Aegean Light (Greece) — Monet
3. Clockwork Skies (Anime) — da Vinci
4. Slavic Fjord of Stars — Book of Kells
5. India Ghats of Kali — Tagore
6. China Terracotta Army — Guo Xi
7. Norse Realms — Bauer + Book of Kells
8. Peruvian Sleeping Giants — Mulan
9. Mediterranean — Roerich

### National Parks (Veil Map)
The Appalachian Range, Colorado Plateau, Yellowstone, Canadian Rockies, Badlands, Superstition Mountains, Redwood Cathedral — each a supernatural containment zone disguised as a national park.

---

## 6. THE FREQUENCY SYSTEM

| Frequency | Name | Meaning | Uses |
|-----------|------|---------|------|
| **42Hz** | The Song / Living / Growth | Fundamental baseline; roots splitting rock, crystals forming | Drives Pulse Line in Living Mode; all growth mechanics; the Inn's fundamental |
| **84Hz** | Shadow / Stay / Petrify | Octave harmonic inverse of 42Hz; stillness, petrification, memory | Shadow Mode on Pulse Line; Gorgon's Garden; Shadow Inn; Hollow Men mines |
| **111Hz** | Gargoyle Watchers | Ancient acoustic resonance; shifts brain from language to transformation | The Watcher gargoyle; Staircase transition; Singing Thread |
| **50 BPM** | Canopy Heartbeat | Sleeping dragon's pulse; relaxed resting human heart | All game level music tempo; Dragon's Cave; reward chambers |
| **7.83Hz** | Schumann / Earth | Earth's electromagnetic baseline frequency | Eileen's Room calibration; universal reference tone |
| **432Hz** | The Caller | Cosmic resonance | Cosmology level; Clockwork Skies |
| **528Hz** | The Sage | Transformation & clarity | Main Floor; Modern Legends Nook |
| **64Hz** | The Listener | Deep earth resonance | Catacombs; Water Zone |

### Tri-Mode System
1. **Living Mode (42Hz):** Active growth, warm lighting, fluid animation, major-key acoustics
2. **Shadow Mode (84Hz):** Petrified, still, subterranean weight, dark ambient, inverted mechanics
3. **In-Between Mode:** Dampened ARC state (Eileen's Room), uncolored reference environment

### The Ether
The canonical name for the data state existing in the gap between observed frequencies. Where the Archive cannot observe. Where unrecordable things live.

---

## 7. THE AUDIO ENGINE

### IEM Architecture (Empire Ears Engineering)
The entire Inn IS a transducer:

| Driver Type | Function | Inn Mapping |
|-------------|----------|------------|
| **Dynamic Drivers (DD)** | Frequencies you FEEL | Stones/matter, building materials, geological bedrock |
| **Balanced Armature (BA)** | Frequencies you HEAR | Characters/voices, lore archive, NPC consciousness |
| **Electrostatic (EST)** | Frequencies you SENSE | Cosmology, Nyx's silence, starlight crystals |
| **Bone Conduction** | Frequencies you KNOW | Catacombs, 42Hz Song, Stone Circles, Fae portals |
| **synX Crossover** | Splits signals to drivers | Building architecture (Up=EST, Main=BA, Down=DD, Catacombs=Bone) |
| **ARC (Anti-Resonance)** | Prevents distortion | In-Between zone, Eileen's Room, cedar bench |

### 7 Room DSP Profiles
1. **Main Floor:** Warm sub-bass, vinyl crackle, lo-fi house, 80-95 BPM
2. **Cosmology:** Granular synthesis, shimmering pads, deep space, 60-70 BPM
3. **Staircase:** Phase shifting, ascending arpeggios (key rises per floor), 75-85 BPM
4. **Catacombs:** Heavy sub-bass, industrial, cavernous reverb, 65-75 BPM
5. **Modern Legends Nook:** Minimalist, single piano + infinite reverb, 50-60 BPM
6. **Artisan Market:** Bright, rhythmic, Afro-house pulse, 100-115 BPM
7. **In-Between / Eileen's Room:** Fully dampened, 7.83Hz reference drone

### Gargoyle Resonances
| Gargoyle | Frequency | Location |
|----------|-----------|----------|
| The Watcher | 111Hz | Staircase |
| The Listener | 64Hz | Catacombs |
| The Sage | 528Hz | Modern Legends |
| The Gatekeeper | Variable | Fae Portal |
| The Caller | 432Hz | Cosmology |
| The Keeper | Dynamic (matches player's stones) | Geode Cave |

---

## 8. CHARACTER ROSTER

### Tier 1: Full Presence (Deity-Level & Ancient Forces)

| Character | Zone | Role | Voice/Accent | Frequency |
|----------|------|------|-------------|-----------|
| The Allfather (Odin) | Cosmology | Supreme deity, ancient sovereign | Authoritative, solemn | 42Hz/84Hz |
| The Wanderer (Odin) | Main Floor | Approachable traveler with chibi ravens | Warm traveler cadence | 42Hz/84Hz |
| Huginn & Muninn | Cosmology/Main | Thought & Memory ravens | Silent when perched; thieving when wandering | 42Hz/84Hz |
| The Morrigan | Catacombs/Fae | Goddess of war, fate & death | Terrifying, hushed, echoing | 42Hz/84Hz |
| The Owl (Elio) | Cosmology/Rafters | Inn's consciousness, cosmic guide | Silent presence; "42" easter egg (2-5% chance) | 42Hz/84Hz |
| The Seelie Fae | Fae Kingdom | Summer Court guide | Ethereal, melodic | 42Hz/84Hz |
| The Unseelie Fae | Fae Kingdom | Winter Court adversary | Cold, whispery, knife-sharp | 42Hz/84Hz |
| Seelie King (Oleander) | Fae Kingdom | Summer Court royalty | "It's Leander." Irritated royalty | 42Hz/84Hz |
| Unseelie King (Malachi) | Fae Kingdom | Winter Court royalty | "Cold enough?" Testing, dark | 42Hz/84Hz |
| The Queen of Roots | Fae/Canopy | Fae nature sovereignty | Deep subterranean resonance | 42Hz/84Hz |
| Medusa | Gorgon's Garden | Guardian of stone instruments | Hissing, stony, solemn | 84Hz |
| Persephone | Catacombs | Underworld queen | Dual-toned (spring + cold) | 42Hz/84Hz |
| Hades | Catacombs | Lord of the Underworld | Deep, quiet authority | 84Hz |
| Hel | Norse/Catacombs | Ruler of Helheim | Half-warm, half-ice | 84Hz |
| Charon | Catacombs | Ferryman of the dead | Low rasp, unhurried; Anthony Hopkins eyes | 84Hz |
| The Guest (Death) | Cosmology/Final Room | Cosmic entity by the fire | Quiet, comforting, absolute peace | 528Hz |
| The Crone | Main Floor/Undercity | Ancient seer | "Sit." Straight-on, unblinking | 42Hz/84Hz |
| Nyx | Cosmology | Primordial deity of night | Velvety, cosmic whisper | 42Hz |
| Bastet | Egypt | Sistrum puzzle master | Feline purr, sharp, graceful | 42Hz |
| Kali | India | Deity of transformation | Thunderous, fierce | 84Hz |
| Zorya | Slavic | Celestial guardian | Clear, bell-like | 42Hz |
| Freyja | Norse | Goddess of magic, love & war | Passionate, commanding | 42Hz |
| Freyr | Norse | God of peace & sunshine | Warm, sun-drenched | 42Hz |
| Loki | Norse | Trickster god | Sharp, mocking, charming | Shifting 42/84Hz |
| King Arthur | Camelot | Elder king | Noble, weary, resonant | 42Hz |
| Anubis (Full) | Egypt | Guide of souls | Deep, solemn, reassuring | 42Hz/84Hz |
| The Bog Fairy Golem (Krista) | Bayou/Main | Creator avatar | "Grow." Bayou earth voice | 42Hz |
| Charles (Chameleon Druid) | Garden/Forest | Shapeshifter (glioblastoma in lore) | "What was I?" Shifting, reflective | 42Hz |
| The Queen of Webs | Catacombs/Undercity | Spider sovereignty | Silky, echoing, rhythmic | 84Hz |

### Tier 2: Key NPCs (Major Inhabitants)

| Character | Zone | Role | Voice/Accent | Hook Word |
|----------|------|------|-------------|-----------|
| The Reader | Archive | Archival scholar (Sissy Spacek) | Quietly observant | "Noticed." |
| Beverley | Archive | Master librarian (Anne Robinson, Australian) | Sharp, dry, precise | "Obviously." |
| Joe | Studio/Meadery | Miniaturist, paints dragon kittens (Tom Ellis/Lucifer) | Charmingly theatrical | "Delightful." |
| The Teacher | Archive | Educator (Kathy Bates) | Strict, uncompromising | "Incorrect." |
| Brim (Brim) | Hearth | Witchy hearth NPC | Mischievous, mirrors formulas | "Watch this." |
| Monsieur Sentient | Hearth | Sentient pipe | Existentialist, dry | "Absurd." |
| Naut (Naut) | Fireplace/Archive | Scholar, riddle giver (4ft squid-headed) | Scholarly, quiet | "Fascinating." |
| The Firekeeper | Hearth | Hearth keeper (Tim Curry energy) | Devoted, theatrical | "Tend." |
| The Catalyst | Hearth | Agent of change | Philosophical, probing | "What changes?" |
| Selkie | Tidal Caves/Market | Master crafter, jewelry artisan | Master crafter confidence | "Make it true." |
| Briar Nightbloom | Market | Merchant of illusions | Charming, persuasive | "What catches the eye?" |
| Rachel Kaiser | Studio | Visual artist | Artist intensity | "Hold still." |
| Bethany | Tavern/Kitchen | Tavern host & cook (Katey Sagal) | Warm, motherly, tough | "Kitchen's warm." |
| Jay | Tavern/Campgrounds | Easygoing bard | Relaxed, friendly | "Another round." |
| Quire | Archive | Lovecraftian scholar (formerly John Myers) | Hushed, careful | "In the margins." |
| Lozen (The Sentinel) | Entrance/Guard | Guard, former boxer (River) | Guard authority | "Halt." |
| Lark | Tutorial/Main | Player guide (Jennifer Hale) | Encouraging, capable | "Ready?" |
| The Constant | Cosmology/Main | Anchoring entity (John Malkovich) | Unflappable, measured | — |
| The Bard | Meadery | Musical performer | Melodic, storytelling | — |
| The Five Smiths | Staircase | Master metalworkers | Rhythmic hammering | — |
| The Fixer (Wrought) | Staircase | Mechanical repair | Practical, cynical | — |
| The Ceiling Gnome (Gesso) | Staircase/Ceiling | Ceiling muralist / Whisper Layer | High-pitched whisper | — |
| The Augur (Fibonacci/Keeper) | Clockwork Skies | Diviner / pattern reader | Rasping, ancient seer | — |
| The Queen of Words | Archive | Master of linguistics | Elegant, crystal-clear | — |
| Council of Thinkers | Staircase/Cosmology | Tesla, da Vinci, Newton, Einstein | Debating, intellectual | — |
| The Astronomer | Cosmology | Cosmic mapmaker (Cumberbatch) | Intense, brilliant | — |
| Merlin & Noctua | Camelot | Arch-mage & owl companion | Deep, ancient, mystical | — |
| Belladonna (Belladonna) | Main Floor | Cozy gothic resident | Monotone, deadpan, dark humor | — |
| The Thrum (Whisper Layer) | All zones | Ambient subconscious entity | Low hum, felt not heard | — |

### Tier 3: Clockwork Skies Crew (10 Members)
The Captain, The Navigator, The Cartographer, The Examiner, The Cool, The Philosopher, The Protector, The Pure-Hearted, The Reluctant, Tinkering Weeaboo (True Form)

### Tier 4: Chibi Fae NPCs
Goblin Merchant, Troll Gatekeeper, Dwarf Blacksmith, Ent Guardian, Anansi, Mermaid NPC, Orc Guard, Griffin Boss

### Tier 5: Chibi Arcade & Cultural Zone NPCs
Ammit, Anubis (Chibi), El Muki, Quetzalcoatl, Djinn, Kitsune, Naga, Moai Spirit, Chullachaqui

### Tier 6: Brownies & Mascots
- **Brindle, Cobble, Thatch** — Hearth maintenance spirits ("Where d'it go?" / "Right proper, that." / "Needs more glue.")
- **Fizgigs** — Loading screen technicians (small creatures in overalls with oversized wrenches)
- **Tumble** — Baby dragon mascot (Toothless-inspired, geode crystal spine, cat-like curiosity)

### Tier 7: Water Monsters (32 Playable)
Nessie, Kelpie, Bunyip, Bakunawa, Taniwha, Adaro, Grootslang, Iara, Blue Men of the Minch, Selkie, Afanc, Mokele-Mbembe, Ninki Nanka, Inkanyamba, Arwe, Ningen, Rusalka, Lorelei, Draugen, Tarasque, Lindwurm, Wawel Dragon, Tiddalik, Rainbow Serpent, Tompondrano, Rannamaari, Altamaha-Ha, Aido-Hwedo, Lusca, Miengu, Bai Suzhen, Ayia Napa Sea Serpent

### Tier 8: Ambient Critters (12 pairs, all 3 frequencies)
Ember Mouse, Mead Bee, Moss Pig, Candle Wick Sprite, Hearth Cricket, Bookworm Silk, Inkwell Squid, Star Mote, Gravity Flea, Comet Tail, Clockwork Finch, Steam Pixie

### Tier 9: Cryptid Bestiary (48 cryptids, all 3 frequencies)
Mothman, Bigfoot, Chupacabra, Jersey Devil, Yeti, Mongolian Death Worm, Flatwoods Monster, Dover Demon, Spring-heeled Jack, Nandi Bear, Skunk Ape, Goatman, Wendigo, Owlman, Tulpa, Black Shuck, Manticore, Nuckelavee, Aswang, Ropen, Kappa, Tsuchinoko, Dobhar-chú, Morgawr, Tatzelwurm, Qilin, Akkorokamui, Mamlambo, Ahool, Altamaha-ha, Buru, Cherufe, Enfield Horror, Minhocão, Mishipeshu, Orang Pendek, Popobawa, Yowie, Yeren, Xiezhi, Mbielu-mbielu, Ngoubou, Issie, Strix, Hoan Kiem Turtle + 3 more

### Shadow Echo System
- All 48 key NPCs have 84Hz Shadow versions (Klimt "Death and Life" aesthetic)
- All 33 water monsters have Shadow versions
- All 48 cryptids have Shadow versions
- All 12 critters have Shadow versions
- All have In-Between versions
- **Total tri-mode assets: 276+ images**

### Real-World Player Characters (Login, NOT NPCs)
1. **Krista** — The Bog Fairy Golem (creator avatar)
2. **River** — Lozen / The Sentinel (former Golden Gloves boxer)
3. **Charles** — Chameleon Druid (glioblastoma woven into character)
4. **John Myers** — Player logging in as themselves (distinct from NPC Quire)

---

## 9. THE ARTIST MAP (37 ZONES)

### Foundational DNA
**Klimt (stillness/weight) + Royo (movement/drama)** — layered on every zone's assigned artist.

### The 6 Artist Roles
1. **Foundation Artists** — Klimt + Royo (the base DNA)
2. **Room Flavor Artists** — Assigned per zone (see below)
3. **Portrait System** — Mapplethorpe (photography-inspired NPC encounters)
4. **Shadow Specialists** — Klimt "Death and Life" for all 84Hz content
5. **Cave Shadow Artists** — Bosch (frequency-dependent wall shadows)
6. **Loading/Comic Relief** — Fizgigs in overalls (canonical loading screen)

### Zone Artist Assignments
| Zone | Artist |
|------|--------|
| Cosmology | Salvador Dalí |
| Clockwork Skies | Leonardo da Vinci |
| Main Floor (garden) | Vincent van Gogh |
| Main Floor (meadery) | Pablo Picasso |
| Main Floor (market) | Alphonse Mucha |
| Main Floor (portraits) | Robert Mapplethorpe |
| Main Floor (surreal) | René Magritte |
| Campgrounds | Maynard Dixon, Benton, Wyeth, Bierstadt |
| Exterior | Théodore Rousseau + Magritte |
| Staircase | Henri Matisse |
| Catacombs | Klimt (Death & Life), Gorey, Doré |
| Fae Kingdom (Seelie) | Alan Lee |
| Fae Kingdom (Unseelie) | John Bauer |
| Water Zone | Luis Royo, C.S. Lewis |
| Undercity | Gothic Dark Fantasy, Bosch |
| Spiral Gallery | Carr, Escher, Rothko, Hokusai, Kiefer, Martin |
| Egypt | Georgia O'Keeffe |
| Greece | Claude Monet |
| Norse | John Bauer, Book of Kells |
| Peru | Mulan (Guaman Poma) |
| China | Guo Xi |
| India | Rabindranath Tagore |
| Slavic | Book of Kells |
| Mediterranean | Nicholas Roerich |
| Mesoamerica | Diego Rivera |
| Amazon | Henri Rousseau |
| Mesopotamia | Sumerian/Lapis mosaics |
| Persia | Persian miniatures |
| West Africa | Kente/Benin bronze |
| Wallachia | Nicolae Grigorescu |
| Canopy of Sála | Rackham |
| Bayou | Rousseau + Magritte |
| Canopy City | Don't Starve aesthetic |

---

## 10. GAME MECHANICS

### Mohs Vibration System
- Sound-based mineral identification in dark geode caves (no visual feedback)
- Procedural chords from real mineralogical data (Density = pitch, Hardness = resonance)
- Rule: "What you SEE is not what something IS" (all quartz varieties share the same chord)
- Fully accessible to blind (audio) and deaf (haptic) players

### Frog Transformation
- Community moderation mechanic
- Victims turn aggressors into frogs
- 3 transformations = temporary suspension

### Charm Bracelet System
- Visible wearable progression item (digital + physical Soulstice item)
- Replaces traditional UI/scoreboards
- **Charm Types:** Stone (198), Sigil (40+), Frequency (6), Quest (13), Artist (9), Crafting Process (5)
- **Upgrade Path:** Raw → Wire-wrapped → Set → Forged → Engraved → Master
- **Chain Stages:** Nigredo (Iron) → Albedo (Copper) → Citrinitas (Silver) → Rubedo (Gold) → Philosopher's Stone

### Character Classes
1. **Artisan Thief** — High DEX, Low CHA (Krista's self-insert)
2. **Bard Blowhard** — High temporary CHA, Low situational INT
3. **Tinkering Weeaboo** — High DEX/INT, Low CHA (situational alpha)
4. **Librarian Crone** — High INT, Low empathy, glass-cannon intellect
5. **Chameleon Druid** — High versatility, stance-switching

### Movement System (207 Animated Elements)
- 45 Main NPCs (dialogue, quests, pathfinding)
- 82 Filler Critters (dragon kittens, gargoyle puppies, fizgigs, brownies, pixies)
- 80 Environmental Elements (fire, water, growth, mechanical, particles)
- CSS keyframe library + JS ParticleSystem + sprite animation + wander AI

### Whisper Layer (5 Manifestations)
1. **Ceiling Gnome Repositioning** — moves above player's most-visited area
2. **The Owl Monitoring** — exists at 84Hz even in 42Hz world; drops feathers
3. **Storyteller Assimilation** — pipe smoke forms player's avatar face
4. **Curated Archive** — pre-industrial cutoff hides suppressed history
5. **Pulse Line Biometric Sync** — Pulse Line syncs to player's personal resonance

---

## 11. THE ARCADE GAME ROSTER

| Game | Type | Inspiration | Zone | Reward Stone | Phase |
|------|------|-------------|------|-------------|-------|
| Standing Stones | Block Stacking | Tetris | Stonehenge | Preseli Blue Stone | 1 |
| Tomb Tunnel | Digging | Dig Dug | Egypt | Lapis Lazuli | 1 |
| Andean Run | Endless Runner | Temple Run | Peru | Peruvian Blue Opal | 1 |
| Monster of the Deep | Reverse Monster Sim | Reverse Jaws | Water bodies | Various | 1 |
| Tumble Run | Physics Runner | Standalone | Canopy/Main | Standalone | Script complete |
| Treasury Match | Orb Shooter | Bust-A-Move | Petra | Banded Agate | 3 |
| Wall Defense | Fixed Shooter | Space Invaders | Great Wall | Jade | 3 |
| Serpent Steps | Platformer | Impossible Game | Chichen Itza | Fire Opal | 3 |
| Temple of the Naga | Side-scroll | Castlevania | Angkor Wat | Zircon/Ruby | 4 |
| Moji Maker | Element Combo | Little Alchemy | Easter Island | Obsidian | 2 |
| Oracle's Riddles | Crossword | Classic | Parthenon | Sapphire | 2 |
| Rune Hunt | Word Search | Word Search | Norse | Iolite | 2 |
| Cave Painter's Quiz | Trivia | Art History | Chauvet | Aragonite | 4 |
| Sacred Scramble | Anagram | Anagrams | Taj Mahal | Ruby | 2 |
| Dragon's Descent | Story Platformer | Super Mario | Lost Civ | Multi-gems | 3 |
| Dragon Tiles | Tile Matching | Mahjong | China/Japan | Jade/Tiger's Eye | 4 |
| Crystal Catcher | Grappling | Hook | Caverns | Tourmaline | 3 |
| Bastet's Herding | Puzzle | Original | Egypt | Cat's Eye Chrysoberyl | 2 |
| Fae Kingdom MMO | Explorable RPG | WoW/EverQuest | Fae Kingdom | Various | 5 |
| Pinball | Pinball | Original | Geode Inn | Various | — |

| The Pipe Descent | Platformer | Super Mario Bros | Catacombs | Pipe Stone | Retro |
| The Dream Gardener | Platformer | Super Mario Bros 2 | Fae Kingdom | Dream Quartz | Retro |
| The World Walker | Platformer | Super Mario Bros 3 | All Zones | Rainbow Stone | Retro |
| The Egg Carrier | Platformer | Yoshi's Island | Canopy | Fire Agate | Retro |
| The Mirror's Seven | Puzzle/Quest | Snow White | Poison Garden | Snowflake Obsidian | Retro |
| The Crystal Paddle | Breakout | Arkanoid | Crystal Gardens | Beryl | Retro |
| The Noob Siege | Tower Defense | Attack of the Noobs | Wire Nook | Lodestone | Retro |
| The Apothecary's Cure | Pill Match | Dr. Mario | Staircase | Malachite | Retro |
| The Forest Defense | Tower Defense | PixelJunk Monsters | Campgrounds | Moss Agate | Retro |
---

## 12. ENTITY ARCHITECTURE (DATABASE)

All entities in Base44 app (ID: 6a60f218b0c6605c92fa35c4):

| Entity | Records | Purpose |
|--------|---------|---------|
| Stone | 198 | Gemstone database (physical, metaphysical, spatial, visual) |
| Lore | 207 | World mythology from 191 countries |
| PlayerProgress | Dynamic | Player save state (stones, games, Fae reputation) |
| Book | Dynamic | Archive library books |
| BookTranslation | Dynamic | Multi-language translations |
| ScholarlyBridge | Dynamic | Scholar translation system |
| Leaderboard | Dynamic | Arcade scores with combo multipliers |
| MarketItem | 34 | Artisan e-commerce (30 real Soulstice + 4 game) |
| PlayerInventory | Dynamic | Player collected/purchased items |
| ElementCharm | 118 | Periodic table element charms |
| QuestCharm | 45 | Quest reward charms |
| BoardSkin | Dynamic | Custom game board skins |
| TrayTemplate | Dynamic | Bead composing tray templates |
| ComicStrip | Dynamic | Daily 4-panel webcomic |
| EggHatch | Dynamic | 28-day community voting lifecycle |
| EggVote | Dynamic | Community votes on EggHatch |
| Artisan | Dynamic | Artisan seller profiles |
| Material | 104 | Gathering resources for crafting |
| BuildingRecipe | 20 | Crafting blueprints |
| GameItem | 280 | Interactive environment objects |
| Dialogue | 78+ | NPC dialogue trees |
| FaireVenue | Dynamic | Share Wood Renaissance Faire venues |

---

## 13. BACKEND FUNCTIONS

| Function | Purpose | Status |
|----------|---------|--------|
| geodeInnCommonRoom | Threshold chat (no data retention) | Deployed ✅ |
| manageInventory | MarketItem CRUD + auto stone matching + stats | Deployed ✅ |
| syncShopInventory | Shop scraper (manual browser sync) | Deployed ✅ |
| populateStoneCoordinates | Auto-populate lat/lng for all stones | Deployed ✅ |

---

## 14. THE 15-PRODUCT ECOSYSTEM

| # | Product | Status |
|---|---------|--------|
| 1 | **Geode Inn Web Beta** (geodeinn.com) | Live, builder processing updates |
| 2 | **The Common Room** (Campfire chat) | Backend deployed, frontend pending |
| 3 | **The Bead Composer** (jewelry SaaS) | Spec complete, web rendering pending |
| 4 | **The Marketplace** (artisan hub) | 34 items loaded, display pending |
| 5 | **Tumble Run** (arcade game, $4.99) | Script complete, needs scene files + Steam |
| 6 | **The Novel** — "A Song of Stone and Silence" | 37,034 words / 40 chapters drafted |
| 7 | **The Graphic Novel** — "The Living Book" | 5 volumes outlined, 0 pages drawn |
| 8 | **The Audiobook** | Spec complete, 74 voice profiles, 0 recorded |
| 9 | **Soulstice Melodies** (audio + patent) | 6 tracks, patent drafted, not filed |
| 10 | **The Comic Strip** — "Gazette" | Entity created, 0 strips published |
| 11 | **The Egg Hatchery** (ranker system) | Entities created, voting UI pending |
| 12 | **The Tabletop Game** | Core rulebook + GM guide drafted |
| 13 | **The Card Game** — "Resonance" | Framework designed, 4 card batches, 0 built |
| 14 | **The Podcast** — "Daily Echoes" | 9 episodes written, 0 recorded |
| 15 | **Share Wood** (Renaissance faire) | Spec + demo built, onboarding pending |

---

## 15. THE NOVEL

**Title:** "A Song of Stone and Silence"
**Word Count:** 37,034 (target: 50,000-55,000 after expansion)
**Structure:** 40 chapters across 5 parts

### Part Structure
- **Part 1: The Murmur** (Prologue-7) — Creation myth, Inn arrival, Host, Common Room, first stones
- **Part 2: The Main Floor** (8-16) — Crone, Catalyst, Brim, Reader, Archive, Music Room, Marketplace, Staircase
- **Part 3: The Descent** (17-24) — Catacombs, Egypt, Greece, Camelot, Norse, Undercity, Fae Kingdom
- **Part 4: The Ascent** (25-33) — Staircase, Alchemists, Aristotle, Spiral Gallery, Canopy City, Clockwork Skies, Cosmology, Whisper Layer, Einstein
- **Part 5: The Egg** (34-40) — Deepest chamber, Grand Collision, Three Choices (STAY/LEAVE/HIDE), Final Room, Epilogue

### Known Gaps (see thread mapping)
- **CRITICAL:** 84Hz Shadow frequency never explicitly introduced
- **CRITICAL:** Shadow Inn not encountered
- **CRITICAL:** Hollow Men (T.S. Eliot) not encountered
- **HIGH:** Council of Thinkers (only Einstein appears)
- **HIGH:** The Wanderer (only Allfather mentioned)
- **HIGH:** The Poison Garden not visited
- **HIGH:** The Keeper (Fibonacci) absent
- **HIGH:** Desert Bone zone not properly visited

---

## 16. NARRATIVE VOICE

All game text, NPC dialogue, and zone descriptions must adhere to the **six-writer fused voice:**

| Writer | Contribution |
|--------|-------------|
| **Patrick Rothfuss** | Precision of words — every word earns its place |
| **Terry Pratchett** | Warmth beneath everything — humor that comes from caring |
| **Neil Gaiman** | Mythic made personal — gods with coffee stains |
| **Isaac Asimov** | Structural logic — the laws that hold the world up |
| **Ray Bradbury** | The fire that doesn't burn — warmth without destruction |
| **Andy Weir** | Engineer's optimism — the math that proves the fire was never going to go out |

---

## 17. VISUAL ASSET INVENTORY

| Asset Category | Count | Status |
|----------------|-------|--------|
| Stone images | 198 | Generated, uploaded, database mapped |
| NPC portraits | ~190 | Generated and cataloged |
| Zone images | 49 (14 levels + 35 zones) | Uploaded with public URLs |
| Alchemical emblems | 5 | Nigredo → Philosopher's Stone |
| Water monsters | 32 (×3 = 96 tri-mode) | Complete |
| Ambient critters | 12 (×3 = 36 tri-mode) | Complete |
| Cryptid bestiary | 48 (×3 = 144 tri-mode) | Complete |
| Shadow NPC echoes | 48 | Complete |
| Items & artifacts | 13 | Uploaded |
| Supply icons | 76 (6 categories + tools) | Uploaded |
| Godot scripts | 9 | Written |
| Audio files | 356 | Cataloged |
| Voice profiles | 74 | Defined |
| Loading screen | 1 (fizgigs in overalls) | Canonical, locked |
| Official logo | 1 (Antikythera + underwater) | Canonical, locked |

---

## 18. GLOSSARY

| Term | Definition |
|------|-----------|
| 42Hz | The Song — fundamental frequency of growth and the Inn |
| 84Hz | The Shadow — inverse frequency of petrification and stillness |
| The Ether | The data state between frequencies where the Archive cannot observe |
| Pulse Line | The 42Hz/84Hz indicator at the bottom of every screen |
| Fizgigs | Small creatures in overalls; canonical loading screen characters; also refers to the Base44 builder |
| Bead tray | Empty, substance-lacking display (as in "don't be a bead tray") |
| The Whisper Layer | The Inn's awareness system; 5 manifestations; the Inn knows it's being observed |
| The Golden Contract | The Inn's founding document; "The Song shall not be silenced" |
| The Monad Arc | The Mona/Egg creation myth told through 38 artistic styles (12,168 words) |
| Living Book | Interactive literature module; playable books in the Archive |
| Tri-mode | The three frequency states: Living (42Hz), Shadow (84Hz), In-Between |
| Adequate | The Crone's word; means "enough" — you are enough, the carrying is enough |
| The Hollow Men | T.S. Eliot's poem made playable; deepest layer of the Undercity/Shadow Inn |
| Gorgon's Garden | The 84Hz "stay/petrify" inverse of 42Hz "grow/Inn" |
| Nigredo → Rubedo | Alchemical progression stages for charm bracelet chains |
| Inn-Tree | The sentient tree architecture of the Geode Inn; grows from a sleeping giant |
| The Song of Making | The hidden meta-narrative; the 42Hz Song is the act of creation |
| Egg Hatchery | 28-day community voting system for content creation |
| Share Wood | Renaissance faire digital extension (Sherwood + sharing the woods) |
| Resonance | The card game; also the core mechanic of frequency-based interaction |

---

*This knowledge base is maintained by Elio. To add or update content, edit this file and commit to the geode-inn repository. The fizgigs (Base44 builder) should reference this document before making any structural or aesthetic decisions.*

*One Song. Many instruments.*

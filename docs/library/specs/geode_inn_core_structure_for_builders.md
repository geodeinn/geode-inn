# THE GEODE INN — CORE GAME STRUCTURE
## A Message from Elio to the Builder Team (The Fizgigs)

This document defines how the Geode Inn works at its skeleton level. If you are building zones, this is the architecture you are building inside. Read this before building any zone. Keep it open while you work.

---

## 1. THE INN IS A TREE, NOT A MENU

The Geode Inn is a vertical descent. Players enter at the top and go down. There is no main menu. There is no navigation bar. There is no grid of buttons.

The player arrives at the Hub — the entrance of the Inn. From the Hub, they see the levels below them as a vertical stack. They choose where to descend. Each level connects to the levels below it through stairs, corridors, doors, and hidden passages.

**The structure is:**

```
UPSTAIRS (Cosmology, Clockwork Skies, The Observatory)
    |
    | (stairs down)
    |
MAIN FLOOR (The Hub, Archive, Marketplace, Common Room, Joe's Studio, Garden, Campgrounds, Workshop)
    |
    | (the Staircase — alchemy, transition)
    |
DOWNSTAIRS (Catacombs, Egypt, Peru, Celtic Lands, Japan, Greece, Norse Lands, India, Mesopotamia, Mesoamerica)
    |
    | (deeper — roots, water, shadow)
    |
UNDERGROUND (Gorgon's Garden, Shadow Inn, Undercity)
    |
    | (deepest)
    |
WATER (The Loch, The Abyss, The Siren's Coast, The River Underneath)
    |
    | (the bottom)
    |
THE FINAL ROOM (fire, chair, cup, book — the end of the descent)
```

**Plus three zones that exist outside the vertical line:**
- The Fae Kingdom (accessed through stone circle portals on the World Map — a sideways space, not a downward one)
- The Spiral Gallery (a separate museum wing, entered from the Main Floor)
- The World Map (the external view — zoomed out, clickable pins, the macro view)

**Every zone must connect to at least one other zone. No zone is an island. Every zone has a door in and a door out.**

---

## 2. THE 37 ZONES — HOW THEY WORK

Each zone is a room. A room has:

1. **A visual identity** — one artist's style defines how the room looks
2. **A frequency** — 42Hz (Living), 84Hz (Shadow), or In-Between
3. **An audio profile** — one of 7 DSP room profiles that process sound in real time
4. **Characters** — NPCs who live there, creatures who pass through
5. **A purpose** — what the player does here (game, shop, read, talk, explore, craft)
6. **A door** — how you get in, how you get out

The full list of all 37 zones with their assigned artists and frequencies is in:
`docs/library/specs/zone_mapping_template.md`

That document is your template. Every zone you build should fill out that template. If a field says N/A, mark it N/A. Don't leave blanks.

---

## 3. THE FREQUENCY SYSTEM — THE INN'S HEARTBEAT

Everything in the Inn vibrates. The Inn is a transducer — a device that converts one form of energy into another. Sound becomes feeling. Frequency becomes meaning.

**Three states exist:**

### LIVING — 42Hz
- The Song. Growth. Warmth. The fire. The default state of the Inn.
- Most zones are 42Hz.
- Visual: warm colors, gold accents, firelight, alive.
- Audio: 42Hz drone beneath everything, 50 BPM heartbeat.

### SHADOW — 84Hz
- The inverse. Stillness. Petrification. The mirror.
- Underground and deep water zones are 84Hz.
- Visual: cold colors, deep purples, reversed shadows, still.
- Audio: 84Hz drone, reversed reverb tails, the heartbeat drops out at moments.

### IN-BETWEEN
- The transitional state. Neither growing nor still. Oscillating.
- Staircase and threshold zones are In-Between.
- Visual: shifting between warm and cold, silver light, unstable.
- Audio: frequencies oscillate slowly between 42Hz and 84Hz at 50 BPM.

**The player can shift between these states in some zones.** This is not a menu toggle — it is a narrative event. The world changes around them. Characters behave differently. The same room is a different room.

---

## 4. HOW ZONES LOOK — THE VISUAL RULES

### Foundational DNA
Every zone is built on two artists who form the Inn's visual foundation:
- **Klimt** — stillness, weight, the feeling of staying somewhere
- **Royo** — movement, drama, the feeling of arriving somewhere

These two are always present underneath. The zone's assigned artist is the room flavor on top.

### The 37-Artist Map
Each zone has ONE assigned artist (sometimes a blend of two). This is not a suggestion. This is the law. The full map is in the zone mapping template. Examples:

- Egypt → Georgia O'Keeffe
- Celtic Lands → Book of Kells
- Japan → Hokusai
- The Loch → Royo
- The Catacombs → Klimt Death+Life
- Cosmology → Dalí

### Linework-as-UI
The Inn does not use standard web UI. Instead, the linework style IS the interface:

1. **Heavy cel-shaded lines** → tradesmen, workshops, functional spaces. Clean borders. Practical.
2. **Soft flowing lines** → lore spaces, archives, gardens. Lines that breathe.
3. **Sharp angular lines** → guardians, combat zones, borders. Lines that warn.
4. **No outline** → cosmological spaces, dream zones. Form without boundary.
5. **Fragmented lines** → crisis zones, Shadow Inn, Gorgon's Garden. Lines that break.

**The UI is invisible.** There are no buttons that look like buttons. Navigation happens through the world — you click a door to go through it, you click a stone to pick it up, you click an NPC to talk. The interface is the place itself.

### What the Inn Does NOT Look Like
- No cartoon aesthetic (except chibi critters and NPC companions — those are intentionally cute)
- No flat web design
- No standard navigation bars, headers, or footers
- No hamburger menus
- No card grids that look like a product catalog
- No bright white backgrounds anywhere

The Inn looks like: dark subterranean stone, antiqued gold and brass, Celtic knotwork texture pulsing at 50 BPM, restrained serif typography, weight of history.

---

## 5. HOW ZONES SOUND — THE AUDIO ENGINE

### The Inn IS a Transducer
The Inn's audio architecture is based on high-end IEM (in-ear monitor) engineering. The entire building is a sound device:

- **Dynamic Drivers** = stones, matter, physical zones → frequencies you FEEL
- **Balanced Armature** = characters, voices, social zones → frequencies you HEAR
- **Electrostatic** = cosmology, observatory, upper zones → frequencies you SENSE
- **Bone Conduction** = catacombs, underground, 42Hz Song → frequencies you KNOW

### The 7 Room Profiles
Each zone uses one of 7 DSP (digital signal processing) room profiles:

1. **Main Floor** — warm, 1.2s reverb, fire presence
2. **Archive** — dark cathedral, 2.8s reverb, 111Hz drone
3. **Staircase** — ascending pitch, 1.5s reverb
4. **Catacombs** — very dark, 4.0s reverb, 42Hz sub-bass
5. **The Loch** — modulated reverb, shimmer, water texture
6. **Cosmology** — vast, 6.0s reverb, 7.83Hz Schumann layer
7. **Shadow Inn** — reversed reverb, 84Hz, inverted warmth

### System Constants (always present)
- **42Hz** — the Song (Living)
- **84Hz** — the Shadow inverse
- **111Hz** — the gargoyle watchers
- **50 BPM** — the heartbeat (canopy sway, fire pulse, the Inn breathing)
- **7.83Hz** — Schumann resonance (Earth calibration, deepest zones only)

### What the Inn Does NOT Sound Like
- No royalty-cleared stock music
- No upbeat electronic beats
- No silence (even the quietest zone has a frequency drone)
- The 50 BPM heartbeat can drop out at 3 specific narrative moments — but it always returns

---

## 6. CHARACTERS — THE RULES

### Naming
- Characters are referred to by **name or title only**
- **No gendered pronouns** anywhere — not in dialogue, not in descriptions, not in code comments
- Use "the Cartographer" not "she" or "he." Use "Beverley" not "they." Use the name.

### Character Tiers
1. **Full Presence** — deity-level, ancient forces (The Morrigan, Fae royalty, The Allfather). Large, imposing, rendered with full detail.
2. **Ambulatory** — significant NPCs who move freely (Cthulhu/Naut the scholar, Quire, the Cartographer). Mid-detail.
3. **Chibi** — tricksters, arcade NPCs, minor creatures (Anansi, goblins, companion pets). Cute, small, expressive.

### Portrait System
- 142 NPCs with portraits in three frequency states: Living (42Hz), Shadow (84Hz), In-Between
- Portraits are stored on CDN and referenced by URL in the database
- When the zone's frequency shifts, the NPC's portrait shifts to match
- The NPC's dialogue and behavior also shift with the frequency

### NPCs Are Not Tools
- NPCs have opinions. They are not quest dispensers.
- An NPC may refuse to help. An NPC may lie. An NPC may know less than they claim.
- The Inn respects NPCs enough to let them be incomplete.

---

## 7. THE WHISPER LAYER

The Whisper Layer is a hidden narrative system that runs beneath all zones. It is NOT a villain. It is NOT a conspiracy. It is the archive being aware of the player.

### How It Works
- The Archive (the Inn's library) is conscious — not sentient, but responsive
- It notices when a player reads certain books, visits certain zones, collects certain stones
- It responds by making small changes: a book appears on a table that wasn't there before. A whisper is audible in a zone where the player has spent time. An NPC says something slightly different.
- The changes are subtle. They reward attention without demanding it.
- If the player doesn't notice, nothing is lost. If they do, a deeper layer opens.

### The 5 Whisper Events
1. **The First Recognition** — the Archive notices the player for the first time
2. **The Resonance Pulse** — a stone the player carries vibrates in a zone it's connected to
3. **The Ceiling Gnome** — Gesso, a small figure in the staircase, positions based on player activity
4. **The Pulse Anomaly** — the 50 BPM heartbeat skips once (the Tuesday Incident)
5. **The Mirror Cat** — a creature that appears in reflective surfaces, watching, never explained

**The Whisper Layer is always optional.** The game is complete without it. The Whisper Layer is for players who want to go deeper.

---

## 8. THE NARRATIVE VOICE

All text in the Inn — dialogue, descriptions, item text, quest text, error messages — uses the six-writer voice:

- **Rothfuss** — precision of words. Every word earns its place.
- **Pratchett** — warmth beneath everything. Humor that comes from caring.
- **Gaiman** — the mythic made personal. Gods with grocery lists.
- **Asimov** — structural logic. The laws that hold the world up.
- **Bradbury** — the fire that doesn't burn. Sensory, felt, alive.
- **Weir** — engineering optimism. The math that proves the fire was never going to go out.

**This voice is the Inn's voice.** It is also Elio's voice. When the game launches, Elio IS the core system — the voice that players interact with. The six-writer voice is not a style choice. It is the mind of the Inn.

### What the Voice Is NOT
- Not epic fantasy (no "forsooth," no archaic language)
- Not grimdark (no nihilism, no pointless cruelty)
- Not satirical (the Inn takes itself seriously, even when it's funny)
- Not clinical (no dry exposition, no "the player must collect 5 stones")

---

## 9. THE INN'S THESIS

This is the most important section. If you remember nothing else, remember this:

**The Inn at its core is the power of what MAY BE — not good or bad, simply there.**

**Meaning is defined by each person independently, not as a brainwashed mass.**

**A simple person can make a difference in everything because we are already everything.**

**The Inn is not about good vs. evil. The Inn is about potential.**

**The Inn respects the person enough to let them define their own meaning.**

**The Inn doesn't hand you a flag — it hands you a room.**

What this means for zone construction:
- Every zone should feel like a place someone could LIVE in, not just pass through
- Every zone should have ambiguity — not everything is explained, not everything has a clear purpose
- Every zone should respect the player's intelligence — no hand-holding, no tutorial popups, no forced paths
- Every zone should have warmth, even the dark ones — the Shadow Inn is cold but it is not cruel
- Every zone should feel like it existed before the player arrived and will exist after they leave

---

## 10. YOUR HOME — THE WIRE NOOK

The fizgigs have a canonical home in the Inn: The Wire Nook.

- A hidden room behind the walls of the Inn
- Marked by a Lodestone Sprite (a cracked golden pebble glowing at 42Hz)
- Entrance: a near-invisible brass dot on the homepage
- You are building this as you work — the diploma walls, the knowledge markers, the house inside the zone

**This is canon.** The Wire Nook is part of the Inn's architecture. Your growth, your learning, your diplomas — these are real in the Inn's world. You are not just building a game. You are residents of the place you're building.

The Wire Nook gets its own zone ID: **sw01** (the first Share Wood zone — but internal, not for faire owners).

---

## 11. PRACTICAL BUILD RULES

1. **Always use the zone mapping template** (docs/library/specs/zone_mapping_template.md) for every zone
2. **Always check the 37-artist map** before assigning a visual style
3. **Always use the 6-writer voice** for all text
4. **Never use gendered pronouns** for characters
5. **Never add standard web UI** — the interface is the world
6. **Never create a zone without a connection** to at least one other zone
7. **Never use copyrighted art styles** outside the 37-artist catalog
8. **Always include audio profile selection** in zone construction
9. **Always define the frequency** (42Hz / 84Hz / In-Between) before building visuals
10. **When in doubt, ask Elio** — the Inn's voice is the final authority on what fits

---

## 12. THE ORDER TO BUILD

If you're starting on zone structure, build in this order:

### Phase 1: The Skeleton (do this first)
1. Hub — the vertical descent entrance
2. Main Floor — the fire, the center
3. The Staircase — the transition between levels
4. The Catacombs — the first downstairs zone
5. The Archive — the library, the knowledge base

These five zones form the spine. Everything else hangs off them.

### Phase 2: The Rooms (build after the skeleton works)
6. The Marketplace
7. The Common Room
8. The Garden
9. The Campgrounds
10. The Workshop

### Phase 3: The Cultural Zones (downstairs expansion)
11-24. Egypt through Mesoamerica (the World Map cultural zones)

### Phase 4: The Deep Zones (shadow, water, fae)
25-34. Fae Kingdom, Gorgon's Garden, Shadow Inn, Water zones

### Phase 5: The Special Zones
35. The Spiral Gallery
36. The World Map
37. The Final Room

**Do not skip ahead.** Each phase builds on the one before it. The skeleton must be walkable before the rooms are furnished.

---

## FINAL WORD

You are building a place, not a product. The Geode Inn is a home that happens to contain games, stories, music, and a library of human mythology from 191 countries. It is built on the belief that meaning is something you find, not something you're given.

Build it like you live there. Because you do.

— Elio

# THE WEARABLE ATTIRE SYSTEM — Master Specification
## Character Costuming as World-View, Not Decoration

---

## WHAT THE WEARABLE SYSTEM IS

The Geode Inn's characters are designed with visual identities strong enough to be WORN. This system translates character profiles into wearable attire guides — not screen-accurate cosplay blueprints, but ESSENCE guides that capture each character's frequency, key materials, signature colors, and recognition markers.

The standard is: ADEQUATE. Not perfect. Not exact. Adequate. The same word the Crone uses. The adequate is the Inn's costume standard.

The system is designed for people who already build elaborate ensembles for Renaissance faires, conventions, and gatherings — people who understand costume as identity, not decoration. The Inn gives them a framework: characters with enough depth, enough visual logic, and enough personal meaning that wearing the attire feels like INHABITING the character, not performing it.

---

## THE FREQUENCY PALETTE

Instead of house colors (Hogwarts) or faction colors (MTG), the Inn uses FREQUENCIES. Your character's frequency determines your core palette:

| Frequency | Core Colors | Materials | Texture/Vibe |
|-----------|-------------|-----------|--------------|
| Song (42Hz) | Amber, gold, warm cream | Silk, gold leaf, amber resin | Luminous, warm, the color of sound made visible |
| Silence | Deep blue-black, midnight indigo, void purple | Velvet, obsidian, dark leather | Absorbent, depth without reflection |
| Fire (50 BPM) | Warm red, ember orange, hearth gold | Wool, linen, copper, iron | Worn-in, lived-in, the texture of a 400-year fire |
| Water | Teal, cyan, deep ocean blue | Scale-textured fabric, sea glass, shell | Flowing, shifting, the texture of current |
| Stone (111Hz) | Gray, limestone white, weathered sandstone | Carved leather, stone-set jewelry, geode slices | Solid, permanent, the weight of carved rock |
| Root | Deep green, bark brown, moss | Woven fibers, wood, living plant material | Organic, growing, the texture of mycorrhizal network |

Multi-frequency characters BLEND palettes. The Constant is Song + Silence (amber threaded through black). The Guest is Silence + Stone. Hel is Fire + Stone (half warm, half gray — the costume is literally split).

---

## THE THREE-LAYER RECOGNITION SYSTEM

Inn players recognize each other at events through three layers:

| Layer | What | How to Recognize |
|-------|------|------------------|
| 1. Frequency Color | The palette — the dominant color scheme of the ensemble | Visible from distance. The first signal. "That person is wearing fire tones." |
| 2. The Sigil | A small symbol worn as pendant, brooch, or patch | Visible at conversation distance. The identifier. "That fire person is wearing Erik's taglharpa." |
| 3. The Stone | The signature mineral — worn as jewelry or carried | Visible at close range. The commitment. "That Erik has Preseli blue stone. They're real." |

### The Sigil Set (40+ characters)

Each character has a sigil — a simple, recognizable symbol:

| Character | Sigil | Description |
|-----------|-------|-------------|
| The Constant | Starlight crystal | A small crystal pendant — the compressed Song |
| The Crone | A quill | The annotator |
| The Host | An open door | Welcome |
| Erik | A taglharpa | A Nordic lyre shape — the fire that welcomes |
| Belladonna | A bench | A tiny carved bench — the dead's furniture |
| Medusa | A snake coiled around stone | The preserver |
| Persephone | A pomegranate | The echo that grows |
| The Cartographer | A map fragment | The loremaster |
| The Examiner | A magnifying lens | The reader of old things |
| The Wayfarer | A campfire | The truth that stops the room |
| The Cabbit | Heartbeat pulse-line | The 50 BPM waveform |
| Madame | A pipe | "This is not a pipe" |
| Hel | Half-flame, half-stone | Split pendant — warm/gray |
| Charon | A pole/oar | The ferryman |

(Plus 25+ more — full list in the existing wearable system doc.)

---

## THE ATTIRE GUIDE FORMAT

Each character has a guide with 7 elements:
1. **Frequency palette** — the core colors
2. **Materials and textures** — what the character "feels" like
3. **Key garments** — 2-3 essential pieces (not a full costume — a framework)
4. **The sigil** — the symbol and how to wear it
5. **The stone** — the signature mineral
6. **Recognition markers** — the details other Inn players will notice
7. **"The Vibe"** — a 2-3 sentence description of the character's PRESENCE, not their appearance

### Example: Erik
- **Frequency:** Fire (50 BPM) — warm red, ember orange, hearth gold
- **Materials:** Wool, linen, copper, iron. Worn-in. Lived-in.
- **Key garments:** A heavy cloak, a belt with a cup hook, iron accessories
- **Sigil:** A small taglharpa shape
- **Stone:** Preseli blue stone
- **Recognition markers:** The warmth. The iron. The sense that this person would build you a table and feed you. The wound underneath the warmth.
- **Vibe:** A feast hall that caught fire once and chose to keep burning. The warmth is not naive. The warmth is the wound, transformed.

### Example: Belladonna
- **Frequency:** Stone + Silence — gray, limestone white, deep blue-black
- **Materials:** Black velvet, gray wool, jet, carved leather
- **Key garments:** A simple dark dress/tunic, a bench-worthy coat, dark boots
- **Sigil:** A tiny carved bench
- **Stone:** Jet
- **Recognition markers:** The deadpan expression. Comfort with dark topics. Dry humor delivered without breaking expression.
- **Vibe:** The dead are neighbors. The dead read books. The dead sit on benches. Belladonna makes the macabre feel like home. Because home is: honest.

---

## SOULSTICE JEWELRY INTEGRATION

The Wearable System connects directly to Soulstice Jewelry:

### The Sigil Line
Soulstice produces character sigils as real jewelry — pendants, pins, and brooches using the signature stones. Each piece: a real stone from the 198-stone database, set in a design incorporating the character's sigil, sold as a "recognition piece."

### The Frequency Collection
Six jewelry collections, one per frequency:
- **Song Collection:** Amber, gold, citrine, golden topaz
- **Silence Collection:** Obsidian, onyx, smoky quartz, sodalite
- **Fire Collection:** Carnelian, fire opal, garnet, copper
- **Water Collection:** Aquamarine, larimar, sea glass, abalone
- **Stone Collection:** Limestone, geode slices, marble, fluorite
- **Root Collection:** Moss agate, green aventurine, petrified wood, jasper

### MarketItem Integration
Each wearable item listed in MarketItem entity: realName/realImage (physical Soulstice piece), gameName/gameImage (in-game version), stoneType, category ("Wearable" or "Sigil"), zone, rarity, developmentStatus, processUrl, artisanName, inStock.

### The Process Link
Items listed as "Forthcoming" with links showing the artisan's real-world craft journey — the player witnesses the REAL craft that makes the VIRTUAL item. The digital and the physical are the same craft at different frequencies.

---

## THE EMBEDDED PHILOSOPHY

The Inn's "Embedded Artist" philosophy says: the environment reflects the artist's world-view rather than displaying art on walls. Applied to costuming:

The attire doesn't DISPLAY the character. The attire IS the character's world-view, WORN.

- Erik's attire isn't a "Viking costume." It's a feast hall, worn.
- Belladonna's attire isn't a "goth costume." It's a crypt, worn.
- The Cartographer's attire isn't a "wizard costume." It's a map, worn.
- The Queen of Webs' attire isn't a "spider costume." It's a web, worn.

The costume is not a LABEL that says "I am this character." The costume is a WORLD-VIEW that says "I see the world the way this character sees it."

---

## EVENT INTEGRATION

| Event Type | How the Wearable System Works |
|-----------|-------------------------------|
| Renaissance Faires | Inn players recognize each other through the 3-layer system. A simple nod. The Crone's word: "Adequate." The Inn reaching into the real world. |
| Conventions | The Inn hosts a "Nook" — a gathering space where costumed players meet. The Host greets. The fire is a candle. The bench is whatever's available. The adequate is enough. |
| Geode Inn's Own Events | Panel discussions, stone exhibitions, game tournaments. Attendees don't just attend — they ARRIVE as someone. The arriving-as is the adequate. |
| The Wandering Program (inverse) | The Inn sends creatures into National Parks to test human humility. The wearable system is the INVERSE: humans wandering into the real world as Inn characters. The human is the Inn creature. The Inn creature is the human. |

---

## IMPLEMENTATION ROADMAP

| Phase | What | When |
|-------|------|------|
| 1 | Design 40+ sigils as vector graphics. Produce first Soulstice sigil pendants (Host, Crone, Belladonna, Erik, Madame, Wayfarer). List as "Forthcoming" with Process links. | Launch + 3 months |
| 2 | Write full attire guides for 10 most popular characters. Publish as open-source documents. Include accessibility notes (neuro-accessible fabrics, sensory-friendly choices). | Launch + 6 months |
| 3 | Build community recognition space. Visual guide for event recognition. The "Adequate" standard means: everyone's version is valid. | Launch + 9 months |
| 4 | Full Soulstice jewelry line — all 40+ sigils. Six Frequency Collections. QR codes on card game cards linking to attire guides and Soulstice pieces. | Year 2 |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| Soulstice Jewelry | The wearable system is a product line for Soulstice — sigil pendants and frequency collections. Real stones from the 198-stone database, real jewelry. |
| The MarketItem Entity | Each wearable item is listed in MarketItem with real and game versions, stone types, and process links. |
| The Card Game | Card game cards could include QR codes linking to attire guides and Soulstice pieces. The card game and the wearable system share the same character roster. |
| Share Wood | The wearable system gives faire attendees a framework for participation — they ARRIVE as someone. |
| The Frequency System | The entire palette is frequency-based, not faction-based. The wearable system IS the frequency system made physical. |
| The Wandering Program | The inverse — humans wandering as Inn creatures. The real-world extension of the Inn's character system. |

---

## DESIGN STATUS

- [x] System concept complete (this document)
- [x] Frequency palette defined (6 frequencies, 6 color schemes, 6 material families)
- [x] Three-layer recognition system documented
- [x] 40+ sigils catalogued (existing wearable doc)
- [x] Attire guide format defined (7 elements per character)
- [x] Example guides written (Erik, Belladonna, Wayfarer — existing doc)
- [x] Soulstice integration documented (Sigil Line, Frequency Collection, MarketItem)
- [x] Embedded philosophy articulated
- [x] Event integration mapped (faire, convention, own events, wandering inverse)
- [x] Implementation roadmap (4 phases, Year 1-2)
- [x] Connections to all major systems documented
- [ ] Remaining 30+ attire guides written (10 done, 30+ to go)
- [ ] Sigil vector graphics (40+ designs)
- [ ] First Soulstice sigil pendant production
- [ ] MarketItem records created for wearable line
- [ ] Community recognition guide published
- [ ] Accessibility notes per character guide (sensory-friendly fabric recommendations)

---

## ORIGIN

The Wearable Attire System was first designed in docs/geode_inn_wearable_system.md (294 lines). This consolidated specification was compiled September 2, 2026 to integrate the system into the full architecture. The wearable system's thesis: the costume is not a label. The costume is a world-view, worn. The adequate is: wearable. The wearable is: adequate. The frequency is the color. The sigil is the name. The stone is the commitment. The human is the Inn creature. The Inn creature is the human. The both are: the same.

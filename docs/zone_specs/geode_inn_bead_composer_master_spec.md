# THE BEAD COMPOSER — Master Specification
## The Sonic Jewelry Design Tool — Standalone Product at geodeinn.com

---

## WHAT THE BEAD COMPOSER IS

A jewelry design app at geodeinn.com that lets you place real gemstones on a virtual board, hear the arrangement as sound, and export a production-ready spec — with built-in mineral intelligence that tells you what cuts work for which stones.

The problem: Independent jewelry makers, bead artists, and small studio designers work with graph paper, two-sided tape, and trial-and-error. They guess at arrangements, can't preview how stones look together, have no way to know if a stone can be cut a certain way without asking a gemcutter, and order materials based on mental math. No existing tool serves this audience.

The solution: A visual bead board where you drag real stones into arrangements, hear the composition as audio (each stone's frequency based on Mohs hardness), see immediately which shapes are available (faceting rules built in), and export a complete spec — stone list, sizes, shapes, metal, arrangement diagram, and audio file — ready for production or customer preview.

What makes it different:
- NOT CAD. Rhino, Matrix, GemCAD are technical tools for gem cutters. Bead Composer is a creative tool for designers.
- HAS a database. 198 stones with real mineral data — hardness, color, opacity, geographic origin, metaphysical properties. No other jewelry tool ships with this.
- HAS audio. You hear the arrangement before you make it. Nobody else has this.
- HAS rules. The faceting engine knows opaque stones don't facet (except onyx and tourmaline). Saves makers from ordering cuts that can't exist.
- HAS a soul. Built from a real jeweler's booth process.

---

## TWO DOORS, ONE ENGINE

| Door | Access | Audience | Stones | Shapes |
|------|--------|----------|--------|--------|
| The Game | Through the Geode Inn game, Level 4+ | Players | Gated by progression | Unlock in tiers |
| The Website | geodeinn.com/composer directly | Everyone | Full 198-stone database available immediately | All shapes available immediately |

One codebase. The game layer is a conditional wrapper. No game login required for website access.

---

## TARGET MARKET

| Tier | Audience | Size |
|------|----------|------|
| Primary | Independent jewelry makers (Etsy sellers, craft show vendors, small online shops) | 500K+ active in US alone |
| Secondary | Small studios & boutiques (2-10 person operations, custom design) | Need client preview tools + production specs |
| Tertiary | Bead enthusiasts & hobbyists (design before buying materials) | Gateway users who become customers |
| Quaternary | Crystal/metaphysical community (choose stones for properties, want to "hear" combinations) | Large, unexpected market — the audio feature is the selling point |

---

## CORE FEATURES (MVP)

### 1. The Board
- Wooden tray visual (cocobolo, olive, ebony wood options)
- Grid of circular dips for bead placement
- Drag-and-drop from stone palette to board
- Snap-to-grid alignment + free rotation for asymmetric shapes
- Adjustable board size (bracelet, necklace, earrings, pendant layouts)
- Save/load board states

### 2. The Stone Palette
- 198 stones pre-loaded with real mineral data:
  - Name, stone family, category, color range (visual swatches)
  - Mohs hardness, opacity (opaque/translucent), geographic origin
  - Metaphysical properties (mind/body) — optional display toggle
  - Can-facet flag (smooth or faceted shapes available)
- Searchable, filterable by color, family, opacity, hardness
- Custom stone entry (users can add stones not in the database)

### 3. The Shape Library
- 8 smooth shapes: Round, Barrel, Drum, Coin, Freeform, Rondelle, Tube, Teardrop
- 8 faceted shapes: Round, Oval, Cushion, Marquise, Pear, Trillion, Square Princess, Baguette
- Shape availability gated by canFacet flag
- Three sizes per shape (small, medium, large)
- CSS/Canvas 2D rendering with color gradients per stone

### 4. The Audio Engine
- Each stone produces a frequency based on Mohs hardness (harder = higher pitch)
- Each shape modifies the tone (round=pure, barrel=warm, coin=bright, etc.)
- Each size affects volume and sustain (small=quiet/short, large=loud/long)
- Metal wire produces a drone (copper=79Hz, silver=80Hz, gold=82Hz)
- Arrangement plays left-to-right as a melody
- Real-time playback — adjust and replay
- Export audio as WAV/MP3 for client preview
- THE KILLER FEATURE. No competing tool has this.

### 5. The Metal Palette
- Copper (79Hz — warm, grounding)
- Silver (80Hz — bright, clear)
- Gold (82Hz — rich, resonant)
- Visual rendering of wire and findings

### 6. The Finish Selector
- Matte (dampened audio — softer sound)
- Polished (amplified audio — brighter sound)
- Oxidized (darkened color and tone)
- Textured (roughness added to audio)

### 7. Export & Production Spec
- Visual: board arrangement as PNG/PDF
- Audio: composition as WAV/MP3
- Materials list: stone names, shapes, sizes, quantities (CSV/PDF)
- Metal spec: wire type, gauge, findings
- Finish spec: surface treatment
- Customer preview link: shareable URL showing design + audio

---

## FEATURES BEYOND MVP

| Feature | Description |
|---------|------------|
| Supplier Integration | Connect to gemstone suppliers (Rio Grande, Fire Mountain Gems). Price each stone/shape/size in real-time. One-click material ordering from the design spec. |
| Custom Stone Database | Users add their own stones. Community-contributed, moderated. The database grows with the user base. |
| Template Gallery | Pre-made arrangements by style (boho, classic, minimalist, gothic). Community-shared templates. |
| Client Portal | Designers send preview links to clients. Clients approve, request changes, or modify. Order flows to the designer's production queue. |
| Batch Design | Design multiple pieces as a collection. Shared stones with inventory tracking. Collection-level audio (the full set as one composition). |
| Education Mode | Faceting rules explained. Audio theory for jewelry. Dani's design principles as interactive tutorials. The app teaches the craft while you use it. |
| Soulstice Integration | Direct order pipeline to Krista's workshop. |

---

## INN MODE AUDIO PROCESSING

The Bead Composer includes Inn Mode — the 7-room DSP profile system:

| Room Profile | Reverb | Character | DSP Effect |
|-------------|--------|-----------|------------|
| Main Floor (the hall) | 2.2s | Warm, resonant | The hall's acoustic — every composition sounds like it was played in the mead hall |
| Archive (the stacks) | 1.5s | Dry, precise | The library's acoustic — every note distinct, every frequency clear |
| Catacombs (the deep) | 4.0s | Vast, echoing | The underground acoustic — deep reverberation, the 42Hz hum underneath |
| Music Room (the circle) | 1.8s | Balanced, intimate | The composer's acoustic — the room where the Song is caught |
| Cosmology (the void) | 0.0s (no reverb) | Pure, direct | The Observatory — no reflection, just the pure frequency |
| Water Zone (the deep) | 3.0s | Liquid, flowing | The aquatic acoustic — frequencies shimmer and ripple |
| Forest (the canopy) | 1.2s | Open, natural | The outdoor acoustic — the open sky above, the ground below |

Inn Mode is the audiobook's DSP system repurposed for the Composer. The composition sounds like it was played in the Inn.

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The 198-Stone Database | Every stone's real mineral data powers the Composer. Mohs = pitch, color = visual, opacity = availability. |
| The Stone Vibration System | The Composer's audio engine IS the Stone Vibration system, made creative. Each stone's frequency is the same frequency the stones produce when touched in-game. |
| The Audio Library | Inn Mode DSP profiles come from the master audio system. The Composer is the audio system, made productive. |
| The IEM Acoustic Architecture | The 4 IEM driver types determine how each stone's audio is processed in Inn Mode. |
| The Building System | The wooden tray (cocobolo, olive, ebony) uses the building system's wood types. The board IS the building system, made miniature. |
| The Wearable System | Bead Composer designs can feed directly into the Soulstice jewelry line. A composition becomes a physical piece. |
| Soulstice Jewelry | Direct order pipeline to Krista's workshop. Designs become real jewelry. |
| The MarketItem Entity | Composer designs can be listed as MarketItems (custom jewelry commissions). |
| The Novel | Dani's workshop (Level 4) IS the Bead Composer's tutorial layer. |

---

## DESIGN STATUS

- [x] Product vision complete (this document)
- [x] Two-door architecture (game + website, one codebase) defined
- [x] Target market identified (4 tiers)
- [x] 7 core MVP features specified (Board, Palette, Shapes, Audio, Metal, Finish, Export)
- [x] 7 Beyond-MVP features documented
- [x] Inn Mode (7 DSP room profiles) integrated
- [x] Godot BeadComposer.gd script written (289 lines)
- [x] 198 stones wired with faceting + optical phenomenon data
- [x] 16 bead shape templates documented
- [x] Connections to major systems documented
- [ ] Web app implementation (Base44)
- [ ] Audio engine (Mohs → frequency → shape modifier → size modifier → melody)
- [ ] Inn Mode DSP processing (7 room profiles)
- [ ] Export system (PNG, PDF, WAV/MP3, CSV)
- [ ] Customer preview link system (shareable URLs)
- [ ] Supplier API integration (Rio Grande, Fire Mountain)
- [ ] Client portal (designer → client approval workflow)
- [ ] Education Mode tutorials (Dani's design principles)
- [ ] Soulstice order pipeline

---

## ORIGIN

The Bead Composer was first specified in docs/geode_inn_bead_composer_standalone_product.md (729 lines). This consolidated specification was compiled September 2, 2026. The Bead Composer's thesis: you hear the arrangement before you make it. The stone's frequency IS its voice. The arrangement IS a song. The export IS the score. The making IS the performance. No competing tool has audio because no competing tool was built by someone who heard stones. The adequate is: the composer that sings. The singing is: the adequate. The adequate is: the arrangement you can hear before you make it. The both are: the same. The same is: the stone and the song.

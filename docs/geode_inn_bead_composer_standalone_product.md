# Bead Composer — Standalone Product Specification
## The sonic jewelry design tool for independent makers

---

## PRODUCT VISION

**One sentence:** A jewelry design app that lets you place real gemstones on a virtual board, hear the arrangement as sound, and export a production-ready spec — with built-in mineral intelligence that tells you what cuts work for which stones.

**The problem:** Independent jewelry makers, bead artists, and small studio designers work with graph paper, two-sided tape, and trial-and-error. They guess at arrangements, can't preview how stones look together, have no way to know if a stone can be cut a certain way without asking a gemcutter, and order materials based on mental math. No existing tool serves this audience.

**The solution:** A visual bead board where you drag real stones into arrangements, hear the composition as audio (each stone's frequency based on its Mohs hardness), see immediately which shapes are available (faceting rules built in), and export a complete spec — stone list, sizes, shapes, metal, arrangement diagram, and audio file — ready for production or customer preview.

**What makes it different from everything else:**
- **Not CAD.** Rhino, Matrix, GemCAD are technical tools for gem cutters. Bead Composer is a creative tool for designers.
- **Has a database.** 164 stones with real mineral data — hardness, color, opacity, geographic origin, metaphysical properties. No other jewelry tool ships with this.
- **Has audio.** You hear the arrangement before you make it. This is the feature nobody else has and nobody else thought to build.
- **Has rules.** The faceting engine knows that opaque stones don't facet (except onyx and tourmaline), that opals don't facet (except fire opal). It saves makers from ordering cuts that can't exist.
- **Has a soul.** This isn't a sterile tool — it's a workspace that understands the craft because it was built from a real jeweler's booth process.

---

## TARGET MARKET

### Primary: Independent Jewelry Makers
- Etsy sellers, craft show vendors, small online shops
- People who work with beads and cabochons, not precision gem cutting
- People who design by arrangement, not by engineering
- Estimated market: 500K+ active jewelry makers in the US alone

### Secondary: Small Studios & Boutiques
- 2-10 person operations that do custom design work
- Need client preview tools (show the design before making it)
- Need production specs for their bench jewelers or outside contractors

### Tertiary: Bead Enthusiasts & Hobbyists
- People who make jewelry as a hobby and want to design before buying materials
- The gateway users — hobbyists who become customers

### Quaternary: Crystal/Metaphysical Community
- People who choose stones for their properties and want to "hear" the combination
- The audio feature is a selling point for this audience — the frequency of stones is already part of their belief system
- This is an unexpected but large market

---

## CORE FEATURES (MVP)

### 1. The Board
- Wooden tray visual (cocobolo, olive, ebony wood options)
- Grid of circular dips for bead placement
- Drag-and-drop from stone palette to board
- Snap-to-grid alignment
- Free rotation of asymmetric shapes (pear, teardrop, marquise)
- Adjustable board size (bracelet, necklace, earrings, pendant layouts)
- Save/load board states

### 2. The Stone Palette
- 164 stones pre-loaded with real mineral data:
  - Name, stone family, category
  - Color range (visual swatches)
  - Mohs hardness
  - Opacity (opaque/translucent)
  - Geographic origin
  - Metaphysical properties (mind/body) — optional display toggle
  - Can-facet flag (smooth or faceted shapes available)
- Searchable, filterable by color, family, opacity, hardness
- Custom stone entry (users can add stones not in the database)

### 3. The Shape Library
- 8 smooth shapes: Round, Barrel, Drum, Coin, Freeform, Rondelle, Tube, Teardrop
- 8 faceted shapes: Round, Oval, Cushion, Marquise, Pear, Trillion, Square Princess, Baguette
- Shape availability gated by the stone's canFacet flag
- Three sizes per shape (small, medium, large)
- Visual rendering: CSS/Canvas 2D with color gradients per stone type
- Each shape has a distinct visual silhouette

### 4. The Audio Engine
- Each stone produces a frequency based on Mohs hardness (harder = higher pitch)
- Each shape modifies the tone (round = pure, barrel = warm, coin = bright, etc.)
- Each size affects volume and sustain (small = quiet/short, large = loud/long)
- Metal wire produces a drone (copper = 79Hz, silver = 80Hz, gold = 82Hz)
- Arrangement plays left-to-right as a melody
- Real-time playback — adjust and replay
- Export audio as WAV/MP3 for client preview
- This is the killer feature. No competing tool has this.

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
- **Visual:** Board arrangement as PNG/PDF (the design diagram)
- **Audio:** Composition as WAV/MP3 (the "wearable song")
- **Materials list:** Stone names, shapes, sizes, quantities (CSV/PDF)
- **Metal spec:** Wire type, gauge, findings
- **Finish spec:** Surface treatment
- **Customer preview link:** Shareable URL showing the design + audio (for client approval before production)

---

## FEATURES BEYOND MVP

### Supplier Integration
- Connect to gemstone suppliers (Rio Grande, Fire Mountain Gems, etc.)
- Price each stone/shape/size in real-time
- One-click material ordering from the design spec
- This is where the app becomes a marketplace tool, not just a design tool

### Custom Stone Database
- Users add their own stones with hardness, color, opacity
- Community-contributed stone library (moderated)
- The database grows with the user base

### Template Gallery
- Pre-made arrangements by style (boho, classic, minimalist, gothic)
- Community-shared templates
- Starting points for custom design

### Client Portal
- Designers send preview links to clients
- Clients approve, request changes, or modify (within constraints)
- Order flows directly to the designer's production queue
- The app becomes a client management tool, not just a design tool

### Batch Design
- Design multiple pieces as a collection (matching set)
- Shared stones across pieces with inventory tracking
- Collection-level audio (the full set as one composition)

### Education Mode
- Faceting rules explained (why this stone can't be faceted)
- Audio theory for jewelry (why these frequencies work together)
- Dani's design principles as interactive tutorials
- The app teaches the craft while you use it

### Integration with Soulstice Jewelry
- Direct order pipeline to Krista's workshop
- The app as Soulstice's custom design portal
- White-label version for other jewelry businesses

---

## MONETIZATION MODEL

### Tier 1: Free
- Board with 20 starter stones
- 3 smooth shapes, 3 faceted shapes
- Basic audio (monophonic playback)
- Watermarked exports
- 3 saved designs

### Tier 2: Maker ($9.99/month or $79/year)
- Full 164-stone database
- All 16 shapes
- Full audio engine (polyphonic, metal drone, shape-modified tones)
- Unwatermarked exports
- Unlimited saved designs
- Customer preview links

### Tier 3: Studio ($24.99/month or $199/year)
- Everything in Maker
- Custom stone database (add your own stones)
- Template gallery
- Client portal (send designs, get approvals)
- Batch design (collections)
- Priority support

### Tier 4: Enterprise / White-Label ($99/month or $899/year)
- Everything in Studio
- White-label branding (your logo, your colors)
- Supplier integration (when available)
- API access for integration with existing studio software
- Custom stone database with team sharing
- Up to 10 team members

### One-Time Purchase: Lifetime Maker ($199)
- Everything in Maker tier, forever
- No recurring fee
- 1 year of database updates (new stones added as the library grows)

### Revenue Share: Supplier Commissions
- Affiliate commissions from supplier integrations (when a user orders materials through the app)
- This is passive revenue that grows with the user base

---

## TECHNICAL ARCHITECTURE

### Platform: Base44 Standalone App
- Separate from the Geode Inn game app
- Own domain (beadcomposer.com — to be secured)
- Base44 backend: Stone entity, Design entity, User entity, Template entity
- Web frontend: React-based interactive board (Canvas 2D for shape rendering)
- Mobile: Responsive web (no native app for MVP — PWA is sufficient)
- Audio: Web Audio API for real-time synthesis

### Entities
- **Stone** — the mineral database (164 stones, expandable). Fields: name, family, category, colorNotes, opacity, mohs, canFacet, beadFinish, frequency, geoRegion, mind, body, varieties
- **Design** — saved board states. Fields: userId, name, boardType, boardWood, stones (JSON array of placements), metal, finish, audioExport, createdAt, sharedLink
- **User** — user accounts. Fields: email, name, tier, savedDesigns, customStones
- **Template** — pre-made arrangements. Fields: name, style, stones, metal, finish, isPublic, createdBy

### Audio Implementation (MVP)
- Web Audio API: oscillators for each bead frequency
- Shape modulation: filter envelopes per shape type (round = no filter, barrel = lowpass, coin = highpass, etc.)
- Size modulation: gain and duration scaling per size
- Metal drone: sustained oscillator at metal frequency
- Playback: sequential triggering left-to-right with overlap
- Export: MediaRecorder API to capture playback as audio file

### Audio Implementation (Future)
- Full synth engine with stone-specific harmonics
- Binaural rendering for immersive preview
- MIDI export for integration with DAWs
- The composition as a real, playable MIDI file

---

## BRAND POSITIONING

### Name: Bead Composer
Simple, clear, descriptive. The name says what it does.

### Tagline Options
- "Design jewelry you can hear."
- "The sonic jewelry studio."
- "Place stones. Hear music. Make jewelry."
- "Every arrangement is a song."

### Visual Identity
- Warm, crafted, not corporate
- Wood textures (the board), stone colors (the palette), brass accents (the metal)
- The aesthetic of a jeweler's bench, not a software dashboard
- Warm amber and cream tones (consistent with the Geode Inn's visual DNA)

### Positioning Statement
For independent jewelry makers who design by arrangement, Bead Composer is the digital workspace that lets you place real stones, hear the composition, and export a production spec — with built-in mineral intelligence that no other tool offers. Unlike CAD software built for gem cutters, Bead Composer is built for designers: creative, intuitive, and grounded in real geological data.

---

## DEVELOPMENT ROADMAP

### Phase 1: MVP (Weeks 1-4)
- Board UI with drag-and-drop
- Stone palette with 164 stones
- Shape library (16 shapes, size variants)
- Faceting rule engine (canFacet gate)
- Basic audio engine (Web Audio API, monophonic)
- Export: visual (PNG) + materials list (CSV)
- Save/load designs
- User accounts (free tier)

### Phase 2: Audio + Export (Weeks 5-8)
- Full audio engine (polyphonic, metal drone, shape modulation)
- Audio export (WAV/MP3)
- Customer preview links
- Finish selector with audio effect
- Mobile optimization (PWA)

### Phase 3: Monetization (Weeks 9-12)
- Tier system (free/maker/studio)
- Payment integration
- Custom stone entry
- Template gallery (starter set)
- Analytics dashboard

### Phase 4: Growth (Weeks 13-20)
- Client portal
- Batch design (collections)
- Supplier integration (first partner)
- Community template sharing
- Education mode

### Phase 5: Scale (Weeks 21+)
- White-label version
- API access
- Team accounts
- Marketplace features
- Mobile native apps (if PWA demand warrants)

---

## THE SOULSTICE CONNECTION

Bead Composer is born from Krista's real booth process at Soulstice Jewelry. The app is the digital version of what Krista already does physically: stones on a board, arranged by ear and eye, translated into wearable pieces.

**Soulstice as launch partner:**
- Krista's designs as the template gallery's launch content
- Soulstice as the first "supplier integration" — order directly from Krista's workshop
- The Soulstice stone book (164 stones) as the app's launch database
- Krista's design principles as the education mode's foundation

**The Geode Inn as proof of concept:**
- The game version demonstrates the tool in a creative context
- The standalone version strips the game wrapper and delivers the tool to the market
- Same engine, same data, same audio — different audience, different product

---

## COMPETITIVE LANDSCAPE

| Tool | Price | Target | Database | Audio | Faceting Rules | Production Export |
|---|---|---|---|---|---|---|
| **Bead Composer** | $10-25/mo | Jewelry makers | ✅ 164 stones | ✅ Full | ✅ Built-in | ✅ Visual + audio + materials |
| Rhino + Matrix | $1,000+ | Gem cutters | ❌ | ❌ | ❌ | ✅ CAD files |
| GemCAD | $200+ | Gem cutters | ❌ | ❌ | ❌ | ✅ Cutting instructions |
| BeadTool 4 | $40 one-time | Bead pattern makers | ❌ | ❌ | ❌ | ✅ Pattern printout |
| Jewelry CAD Dream | $500+ | Studios | ❌ | ❌ | ❌ | ✅ CAD files |

**The gap:** No tool serves independent jewelry makers who work with real stones, need arrangement design (not CAD), want production specs (not cutting instructions), and could benefit from audio preview. Bead Composer fills this gap entirely.

---

## CONNECTIONS

- **Bead Composer (game version)** — `geode_inn_bead_composer.md`
- **Bead shape catalog** — `geode_inn_bead_shape_catalog.md`
- **Faceting classification** — `geode_inn_faceting_classification.md`
- **Mohs resonance architecture** — `geode_inn_mohs_resonance_architecture.md`
- **Stone entity** — 164 stones with canFacet, beadFinish, opacity fields ready
- **Soulstice Jewelry** — the real-world jewelry business this tool serves
- **Geode Inn** — the game that proved the concept

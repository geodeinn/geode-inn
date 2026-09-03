# Bead Composer — Standalone Product Specification
## The sonic jewelry design tool, hosted at geodeinn.com

---

## PRODUCT VISION

**One sentence:** A jewelry design app at geodeinn.com that lets you place real gemstones on a virtual board, hear the arrangement as sound, and export a production-ready spec — with built-in mineral intelligence that tells you what cuts work for which stones.

**The problem:** Independent jewelry makers, bead artists, and small studio designers work with graph paper, two-sided tape, and trial-and-error. They guess at arrangements, can't preview how stones look together, have no way to know if a stone can be cut a certain way without asking a gemcutter, and order materials based on mental math. No existing tool serves this audience.

**The solution:** A visual bead board where you drag real stones into arrangements, hear the composition as audio (each stone's frequency based on its Mohs hardness), see immediately which shapes are available (faceting rules built in), and export a complete spec — stone list, sizes, shapes, metal, arrangement diagram, and audio file — ready for production or customer preview.

**What makes it different from everything else:**
- **Not CAD.** Rhino, Matrix, GemCAD are technical tools for gem cutters. Bead Composer is a creative tool for designers.
- **Has a database.** 164 stones with real mineral data — hardness, color, opacity, geographic origin, metaphysical properties. No other jewelry tool ships with this.
- **Has audio.** You hear the arrangement before you make it. This is the feature nobody else has and nobody else thought to build.
- **Has rules.** The faceting engine knows that opaque stones don't facet (except onyx and tourmaline), that opals don't facet (except fire opal). It saves makers from ordering cuts that can't exist.
- **Has a soul.** This isn't a sterile tool — it's a workspace that understands the craft because it was built from a real jeweler's booth process.

---

## HOSTING: GEODEINN.COM

The Bead Composer lives at geodeinn.com as a dedicated section of the Geode Inn website. It is not a separate domain or a separate app — it is part of the Geode Inn's web presence, accessible to anyone visiting the site.

### Two Doors, One Engine

The Composer has two entry points, both running the same code:

**Door 1: The Game (for players)**
- Accessed through the Geode Inn game after reaching Level 4 (Campgrounds)
- Players see the Composer as Solstara's Studio (tutorial) or the Master's Bench (Undercity)
- Stones are gated by game progression — players use what they've collected
- Shapes unlock in tiers tied to game level
- The Composer is part of the game world, with NPCs, quests, and commissions

**Door 2: The Website (for everyone)**
- Accessed directly from geodeinn.com/composer (or similar URL)
- No game login, no game progression required
- Full stone database available immediately (all 164 stones)
- All shapes available immediately
- The Composer is a standalone tool — no game UI, no NPCs, just the workspace
- Users create a free account to save designs
- The tool is marketed independently to jewelry makers, crafters, and designers

### Why This Works

- **geodeinn.com already exists** — no new domain to secure, no new brand to build
- **The game is the proof of concept** — visitors who discover the Composer can explore the game if they want, but they don't have to
- **Cross-pollination** — game players discover the tool is useful for real jewelry; tool users discover the game exists and might try it
- **One codebase** — the Composer runs on the Geode Inn's Base44 app, with the game layer as a conditional wrapper
- **SEO** — geodeinn.com/composer is indexable; the tool drives traffic to the site; the site drives traffic to the game

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
- Solstara's design principles as interactive tutorials
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

### Platform: Geode Inn Base44 App (Shared)
The Bead Composer runs on the existing Geode Inn Base44 app (ID: 6a60f218b0c6605c92fa35c4), with the game layer as a conditional wrapper.

- **Website visitors** see the Composer at geodeinn.com/composer — no game UI, full tool access
- **Game players** see the Composer inside the game world — gated by progression, with game context
- **Same codebase** — the Composer is a page within the Geode Inn app, with the game wrapper toggled by entry point
- **Same database** — the Stone entity (164 stones) serves both the game and the standalone tool
- **Same audio engine** — the Web Audio API implementation is shared

### Page Structure (Geode Inn App)
- `/` — Geode Inn homepage (the Inn's front door)
- `/composer` — Bead Composer standalone tool (no game required)
- `/game` — Game entrance (for players)
- `/library` — Stone library / archive (browsable without game)
- `/market` — Artisan market (Soulstice + other makers)

### Entities
- **Stone** — the mineral database (164 stones, expandable). Already built. Fields: name, family, category, colorNotes, opacity, mohs, canFacet, beadFinish, frequency, geoRegion, mind, body, varieties
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

### Context: A tool from the Geode Inn
The Bead Composer is a Geode Inn tool. The Geode Inn is a living archive and game hub for gemstone enthusiasts. The Composer is what the Inn's craftsmen use — now available to everyone.

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
For independent jewelry makers who design by arrangement, Bead Composer is the digital workspace at geodeinn.com that lets you place real stones, hear the composition, and export a production spec — with built-in mineral intelligence that no other tool offers. Unlike CAD software built for gem cutters, Bead Composer is built for designers: creative, intuitive, and grounded in real geological data.

---

## DEVELOPMENT ROADMAP

### Phase 1: MVP (Weeks 1-4)
- Board UI with drag-and-drop at /composer
- Stone palette with 164 stones
- Shape library (16 shapes, size variants)
- Faceting rule engine (canFacet gate)
- Basic audio engine (Web Audio API, monophonic)
- Export: visual (PNG) + materials list (CSV)
- Save/load designs
- User accounts (free tier)
- Composer page accessible from geodeinn.com without game login

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

**The Geode Inn as home:**
- The Composer lives at geodeinn.com — the Inn is its home
- Game players discover the tool is useful for real jewelry; tool users discover the game exists
- The Inn's warm, scholarly aesthetic is the Composer's aesthetic
- The Geode Inn's reputation as a gemstone archive gives the Composer credibility

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
- **Geode Inn** — the game and archive that hosts this tool at geodeinn.com

---

## THE DOWNLOADABLE APP: BEAD COMPOSER PLAYER

### Concept
The Bead Composer exists in two forms:

1. **The Composer (web)** — at geodeinn.com/composer. Where you design. The board, the palette, the arrangement, the export. This is the workspace.

2. **The Player (downloadable app)** — a standalone app for desktop and mobile that lets you hear your compositions anywhere, the way they sound inside the Inn. This is the listening experience.

The Player is the Inn's audio engine, packaged as a portable app. You don't need the game. You don't need the website open. You open the Player, load your saved compositions (or import shared ones), and hear them rendered through the Inn's full audio architecture — the same triple-layer IEM-based engine, the same Mohs-to-frequency mapping, the same shape-modified tones, the same metal drones.

### Why a Downloadable App

- **The web version is for designing.** The downloadable is for listening.
- **The Inn's audio engine is complex** — the full triple-layer rendering (BC driver / deep knowing, DD driver / warm resonance, BA driver / clear voice, EST driver / perception edge) needs native audio processing, not browser-limited Web Audio API.
- **Offline listening** — your compositions travel with you. No internet needed. A jeweler at a show can play a client's composition on a phone without wifi.
- **Cross-platform** — desktop (Windows/Mac/Linux via Godot), mobile (iOS/Android), and Steam. Same audio engine, every platform.
- **The Inn's sound is the product** — the IEM-based architecture (Empire Ears engineering) is a feature no other jewelry tool has. The Player makes that feature portable.

### What the Player Does

#### Core Features
- **Load compositions** — import designs from geodeinn.com/composer (synced account) or import shared composition files (.bead format)
- **Full audio rendering** — the Inn's complete audio engine:
  - Each stone's frequency (Mohs hardness → pitch)
  - Each shape's tone modification (round = pure, barrel = warm, coin = bright, etc.)
  - Each size's volume and sustain characteristics
  - Metal drone (copper 79Hz, silver 80Hz, gold 82Hz)
  - Shape-modulated harmonics for faceted stones
  - The 42Hz carrier wave (the Inn's base frequency) as ambient undertone
- **Playback modes:**
  - **Linear** — left to right, the arrangement as written
  - **Layered** — all beads at once, the arrangement as a chord
  - **Ambient** — the composition looped and stretched, Inn-background style (50 BPM, low-dub classical processing)
  - **Isolated** — solo individual beads by tapping them
- **Visualizer** — the board renders during playback, each bead glowing as its tone plays. The Inn's visual aesthetic (wood, stone, candlelight glow) as the player skin.
- **Composition library** — all saved and imported compositions, organized by name, date, or project

#### The Inn Sound (What Makes It Different)

The Player doesn't just play frequencies. It renders compositions through the Inn's full audio architecture:

- **Triple-layer engine:** Each stone's frequency is processed through three driver layers (mapped from Empire Ears IEM engineering):
  - **BC (Balanced Armature) — Deep Knowing:** The sub-bass layer. The foundation. What the stone *means*.
  - **DD (Dynamic Driver) — Warm Resonance:** The midrange. The body. What the stone *feels* like.
  - **BA (Balanced Armature) — Clear Voice:** The treble. The surface. What the stone *says*.
  - **EST (Electrostatic) — Perception Edge:** The air. The shimmer. What the stone *implies*.

- **42Hz carrier wave:** The Inn's base frequency runs beneath every composition as a constant ambient undertone. The composition doesn't float in silence — it floats in the Inn.

- **50 BPM ambient mode:** The Inn's standard tempo. Compositions played in ambient mode are stretched and processed at 50 BPM — the sleeping heartbeat tempo. This is the sound of the Inn when you're sitting in it.

- **Room acoustics:** The Player applies the Inn's acoustic signature — the reverb of a stone-walled archive with wooden floors and high ceilings. Every composition sounds like it's being played *inside* the building, not in a studio.

### Platforms

| Platform | Delivery | Audio Engine | Notes |
|---|---|---|---|
| **Steam** | Godot build | Full triple-layer + 42Hz carrier + room acoustics | The primary desktop experience. Same engine as the Geode Inn game. |
| **Windows** | Godot build (standalone .exe) | Full triple-layer + 42Hz carrier + room acoustics | Direct download from geodeinn.com |
| **macOS** | Godot build (standalone .app) | Full triple-layer + 42Hz carrier + room acoustics | Direct download from geodeinn.com |
| **Linux** | Godot build (standalone) | Full triple-layer + 42Hz carrier + room acoustics | Direct download from geodeinn.com |
| **iOS** | Godot export or native Swift | Full audio engine (optimized) | App Store (future) |
| **Android** | Godot export or native Kotlin | Full audio engine (optimized) | Google Play (future) |
| **Web** | geodeinn.com/composer | Web Audio API (simplified — single layer, no room acoustics) | The design tool. For listening, use the app. |

### The .bead File Format

Compositions export as `.bead` files — a lightweight JSON-based format containing:
- Stone IDs (from the 164-stone database)
- Shape selections and sizes per stone
- Board positions and orientations
- Metal type
- Finish selection
- Composition metadata (name, designer, date, notes)
- Audio rendering hints (playback mode, tempo override)

`.bead` files are shareable — email them, AirDrop them, post them. Anyone with the Player app can open and hear them. The file is the composition; the Player is the instrument.

### Sync with geodeinn.com

- Account sync: designs saved on the web Composer sync to the Player app automatically
- Offline mode: designs cached locally, synced when online
- Share: generate a shareable link from either the web or the app — recipients hear the composition in the Player
- The web is for designing; the app is for listening. Both connect to the same account.

### Monetization

The Player app is included with all paid tiers (Maker and above). Free tier users can hear compositions in the web Composer (simplified audio) but need a Maker subscription to use the downloadable Player with full audio.

**Standalone Player purchase:** $19.99 one-time — the Player app with full audio engine, no design capabilities. For clients who just want to hear compositions their designer sent them. The jeweler designs (Maker subscription), the client listens (one-time Player purchase).

This creates a natural revenue split:
- Designer pays monthly for the Composer (design tool + full audio)
- Client pays once for the Player (listening only)
- The .bead file is the handshake between them

---

## UPDATED ROADMAP (Including Downloadable App)

### Phase 1: MVP — Web Composer (Weeks 1-4)
- Board UI with drag-and-drop at /composer
- Stone palette with 164 stones
- Shape library (16 shapes, size variants)
- Faceting rule engine (canFacet gate)
- Basic audio engine (Web Audio API, simplified single-layer)
- Export: visual (PNG) + materials list (CSV) + .bead file
- Save/load designs
- User accounts (free tier)

### Phase 2: Full Web Audio (Weeks 5-8)
- Full web audio engine (polyphonic, metal drone, shape modulation)
- Audio export (WAV/MP3) from web
- Customer preview links (web-based listening)
- Finish selector with audio effect
- Mobile optimization (PWA)

### Phase 3: Downloadable Player — Desktop (Weeks 9-14)
- Godot-based Player app (Windows, macOS, Linux)
- Full triple-layer audio engine (BC/DD/BA/EST drivers)
- 42Hz carrier wave + room acoustics
- .bead file import and playback
- All playback modes (linear, layered, ambient, isolated)
- Visualizer with Inn aesthetic
- Account sync with geodeinn.com
- Steam release (as standalone app, not requiring the game)

### Phase 4: Monetization Launch (Weeks 15-18)
- Tier system live (free/maker/studio/enterprise)
- Payment integration
- Custom stone entry
- Template gallery (starter set)
- Player app included with Maker+ subscriptions
- Standalone Player purchase ($19.99) for clients

### Phase 5: Mobile Player (Weeks 19-24)
- iOS Player app (App Store)
- Android Player app (Google Play)
- Optimized audio engine for mobile
- Offline composition library
- Sharing via mobile-native methods (AirDrop, share sheets)

### Phase 6: Growth + Scale (Weeks 25+)
- Client portal
- Batch design (collections)
- Supplier integration
- Community template sharing
- Education mode
- White-label version
- API access

---

## INN MODE: THE UNIVERSAL AUDIO PROCESSOR

### Concept

Inn Mode is the feature that transforms the Bead Composer Player from a niche jewelry tool into a universal audio experience. Any song, any genre, any artist — processed through the Geode Inn's audio architecture and heard as if it were playing inside the Inn.

The Player isn't just for stone compositions anymore. It's a DSP (digital signal processing) engine that renders any audio through the Inn's triple-layer IEM-inspired architecture, 42Hz carrier wave, and room acoustics.

**One sentence:** Bring your favorite song. Hear it the way it sounds inside the Geode Inn.

---

### How It Works

1. **User opens the Player app**
2. **User loads an audio file they own** (MP3, WAV, FLAC, AAC, OGG — from their personal library)
3. **User presses "Inn Mode"**
4. **The Player processes the audio in real-time through the Inn's architecture:**
   - **Layer 1 — The Foundation (sub-bass extraction & enhancement):** The deepest frequencies are isolated, warmed, and sustained. The floor of the Inn. What the song *means* underneath.
   - **Layer 2 — The Resonance (midrange warmth):** The midrange is softened and rounded — the wooden walls, the stone floors, the human warmth of the building. What the song *feels* like inside.
   - **Layer 3 — The Voice (treble clarity):** Vocals and lead instruments are clarified and lifted — the way sound carries in an archive with high ceilings. What the song *says* when the room is listening.
   - **Layer 4 — The Air (shimmer & space):** The highest frequencies are extended with a subtle electrostatic sheen — candlelight on stone, dust in a sunbeam. What the song *implies* beyond itself.
   - **42Hz Carrier Wave:** The Inn's base frequency layered beneath the processed audio as an ambient undertone. The song doesn't float in silence — it floats in the Inn.
   - **Room Acoustics:** The Inn's acoustic signature applied — the reverb of a stone-walled archive with wooden floors, high ceilings, and the particular warmth of a space that has been lived in. Every song sounds like it's being played *inside* the building.
5. **User hears their song transformed**
6. **User saves the processed version locally** (stays on their device, never uploaded)

---

### Playback Variants

Beyond standard Inn Mode, the Player offers themed rendering profiles — each a different "room" in the Inn:

| Profile | What It Does | Vibe |
|---|---|---|
| **The Archive (Main Floor)** | Full Inn Mode — all four layers, 42Hz carrier, room reverb | The default. Sitting in the main hall. |
| **The Catacombs (Downstairs)** | Heavy sub-bass, reduced treble, longer reverb, darker tone | Deep underground. Ancient. Weighted. |
| **The Observatory (Upstairs)** | Lifted treble, extended air, minimal bass, short reverb | Open sky. Stars. Weightless. |
| **The Staircase (Transition)** | Rising filter sweep — bass to treble as the song progresses | Climbing. The music literally ascends. |
| **The Campgrounds** | Warm midrange forward, gentle reverb, natural sound | Outside the Inn. Open fire. Grounded. |
| **The Shadow Inn (84Hz)** | Detuned, slightly discordant, heavier compression, 84Hz carrier instead of 42Hz | The mirror Inn. Wrong. Compelling. |
| **The Geode Cave** | Near-silent background, each frequency isolated and crystalline, almost a cappella | Inside the stone. Intimate. Bare. |

Each profile is a DSP preset — different EQ curves, reverb settings, carrier frequencies, and layer balances. The user picks the room; the Player reshapes the song for that space.

---

### The Legal Model (Why This Is Clean)

Inn Mode follows the established legal framework for audio processing software:

**What we do:**
- We provide a DSP engine that processes audio the user already owns
- Processing happens locally on the user's device
- The processed output stays on the user's device
- We never provide copyrighted songs
- We never store user audio files on our servers
- We never distribute the processed output

**Precedent:**
- Dolby Atmos processes user audio through spatial rendering — same model
- Waves plugins process user audio through EQ/reverb — same model
- iZotope Ozone processes user audio through mastering chains — same model
- Room correction software (Sonarworks) processes user audio through room profiles — same model
- Guitar pedals process user input through effect chains — same model

**We are selling the processor, not the content.** The user brings their legally-owned music. We transform it. The output is theirs, on their device.

**Terms of service (to be drafted):**
- "The Player processes audio files you provide. You are responsible for ensuring you have the legal right to process and listen to those files."
- "Processed audio is stored locally on your device. The Geode Inn does not upload, store, or redistribute your audio files or processed output."
- "Shareable preview clips are user-generated content. You are responsible for the source material you choose to share."

---

### Shareable Preview Clips (The Marketing Engine)

The Player can generate 15-30 second watermarked preview clips of any song in Inn Mode. These clips are:

- Short enough to qualify as fair use preview (transformative, brief, non-substitutive)
- Watermarked with a subtle "Geode Inn" audio tag
- Intended for social media sharing — "Hear my favorite song in Inn Mode"
- The user's responsibility for source material choice
- The full processed version stays in the app; only the preview clip is shareable

**The viral loop:**
1. User processes a song in Inn Mode
2. User generates a 30-second preview clip
3. User shares to social media (TikTok, Instagram, YouTube Shorts)
4. Viewers hear the Inn Mode transformation and want the app
5. Viewers download the Player
6. They process their own songs and share their own clips

The preview clip is the demo. The app is the product. The songs are the user's. The Inn's sound is what they're paying for.

---

### MIDI Rendering (Future)

The Player can also accept MIDI files and render them through the Inn's synth engine — oscillators producing tones, not recordings. This opens up:

- Public domain music (Bach, Vivaldi, folk songs, Gregorian chants) rendered in full Inn audio — no copyright concerns at all
- User-composed MIDI (original music) rendered in Inn audio
- The Inn's synth engine as a creative tool — compose in MIDI, hear it in the Inn

MIDI files of public domain compositions are freely available (IMSLP, MuseScore). The Inn could ship with a small library of public domain MIDI files pre-rendered in Inn Mode — a demo library that costs us nothing in licensing.

---

### Monetization

Inn Mode is included in the Player app (all paid tiers). It is not available in the free web Composer — Inn Mode requires the downloadable Player.

**Standalone Player with Inn Mode:** $29.99 one-time (increased from $19.99 — Inn Mode adds significant value)

**Inn Mode Pro (add-on):** $4.99/month or $39/year — access to all room profiles (Catacombs, Observatory, Staircase, Shadow Inn, Geode Cave), batch processing (process an entire album at once), and high-resolution output (24-bit/96kHz processed files instead of standard quality).

**Revenue model:**
- Designer subscribes to the Composer (design tool + stone compositions)
- Designer's client buys the Player ($29.99) to hear stone compositions
- Music lover buys the Player ($29.99) for Inn Mode — hears their favorite songs in Inn audio
- Power user subscribes to Inn Mode Pro ($4.99/mo) for all room profiles and batch processing
- The Player serves two audiences (jewelry clients + music lovers) with one app

---

### Updated Feature Summary

The Bead Composer ecosystem now has three core experiences:

1. **The Composer (web, geodeinn.com/composer)** — Design jewelry from real stones. Hear the stone composition. Export production specs. For jewelry makers.

2. **The Player — Stone Compositions (downloadable app)** — Hear your jewelry designs in full Inn audio. Load .bead files. All platforms. For jewelry clients and designers.

3. **The Player — Inn Mode (downloadable app)** — Hear any song the way it sounds inside the Geode Inn. Universal audio processor. Bring your own music. For music lovers.

One app. Two uses. Both powered by the Inn's audio architecture.

---

### UPDATED ROADMAP (Including Inn Mode)

### Phase 1: MVP — Web Composer (Weeks 1-4)
- Board UI with drag-and-drop at /composer
- Stone palette with 164 stones
- Shape library (16 shapes, size variants)
- Faceting rule engine (canFacet gate)
- Basic audio engine (Web Audio API, simplified single-layer)
- Export: visual (PNG) + materials list (CSV) + .bead file
- Save/load designs
- User accounts (free tier)

### Phase 2: Full Web Audio (Weeks 5-8)
- Full web audio engine (polyphonic, metal drone, shape modulation)
- Audio export (WAV/MP3) from web
- Customer preview links (web-based listening)
- Finish selector with audio effect
- Mobile optimization (PWA)

### Phase 3: Downloadable Player — Desktop (Weeks 9-14)
- Godot-based Player app (Windows, macOS, Linux)
- Full triple-layer audio engine (4 layers)
- 42Hz carrier wave + room acoustics
- .bead file import and playback (stone compositions)
- All playback modes (linear, layered, ambient, isolated)
- Visualizer with Inn aesthetic
- Account sync with geodeinn.com
- Steam release (standalone app)

### Phase 4: Inn Mode (Weeks 15-20)
- Audio file import (MP3, WAV, FLAC, AAC, OGG)
- Real-time DSP processing through Inn architecture
- All room profiles (Archive, Catacombs, Observatory, Staircase, Campgrounds, Shadow Inn, Geode Cave)
- Shareable preview clips (15-30 second, watermarked)
- Batch processing (Inn Mode Pro)
- High-resolution output (Inn Mode Pro)
- Inn Mode Pro subscription launch
- Public domain MIDI library (pre-rendered demo songs)

### Phase 5: Monetization + Launch (Weeks 21-24)
- Full tier system live (free/maker/studio/enterprise)
- Payment integration
- Player app at $29.99 with Inn Mode included
- Inn Mode Pro at $4.99/month
- Template gallery
- Marketing push (preview clips on social media)

### Phase 6: Mobile + Growth (Weeks 25+)
- iOS Player app (App Store) — stone compositions + Inn Mode
- Android Player app (Google Play) — stone compositions + Inn Mode
- Client portal
- Supplier integration
- Community features
- Education mode

# Geode Inn — Cabochon Cut System & Celtic Knotwork Weaving Game
## Adding Cabochons to the Stone Database + The Two-Inch Crafting Mechanic

---

## PART 1: CABOCHON CUT SYSTEM

### The Problem

The current stone database has two cut categories: smooth (beads) and faceted (beads). But cabochons are a THIRD cut type — flat-backed, domed-top, NO drill hole, set in metal rather than strung. A jeweler needs to know: can this stone be a cabochon? What shapes? 

### The Rules

**Who gets cabochons:**

1. **All opaque stones** → cabochon available (round, oval, organic). These are already "smooth" — cabochon is the natural setting cut for opaque material. Turquoise, lapis, malachite, jade, etc. — all classic cabochon stones.

2. **Translucent stones WITH optical phenomena** → cabochon ONLY (not faceted). These stones MUST be cabochon-cut because faceting destroys the phenomenon:
   - **Star sapphire** (asterism — the star needs a smooth dome)
   - **Cat's eye / chrysoberyl** (chatoyancy — the eye needs a smooth dome)
   - **Moonstone** (adularescence — the sheen needs a smooth dome)
   - **Tiger's eye / hawk's eye** (chatoyancy — the shimmer needs a smooth dome)
   - **Labradorite** (labradorescence — the flash needs a smooth dome)
   - **Opals** (play-of-color — already smooth per existing rule)
   - **Star rose quartz** (asterism)
   - **Pietersite** (chatoyant breccia)
   - **Malachite** (banding shows best on a cabochon dome)
   - **Lapis lazuli** (color shows best polished, not faceted)
   - **Rhodochrosite** (banding)
   - **Charoite** (swirl pattern)

3. **Translucent stones WITHOUT phenomena** → faceted (existing rule). But some can ALSO be cut as cabochons for jewelry setting — amethyst, garnet, citrine, peridot, aquamarine, topaz. These are versatile: faceted for beads, cabochon for settings.

4. **Fire opal** → faceted (existing exception, but CAN also be cabochon)

### Cabochon Shapes

Three cabochon shapes, each available when the stone allows cabochon cutting:

**C1. Round Cabochon**
- The classic dome. Flat back, symmetric curved top.
- Sizes: 4mm, 6mm, 8mm, 10mm, 12mm, 14mm, 18mm, 24mm
- Best for: star stones (the star centers perfectly), opals (play-of-color displays evenly), turquoise (the traditional Native American setting)
- Visual: the stone's color at its most concentrated — the dome gathers light from all angles

**C2. Oval Cabochon**
- Elongated dome. The most common jewelry cabochon shape.
- Sizes: 6×4mm, 8×6mm, 10×8mm, 12×10mm, 14×10mm, 18×13mm, 25×18mm
- Best for: chatoyant stones (tiger's eye, cat's eye — the eye runs along the long axis), banded stones (malachite, rhodochrosite — the bands show as stripes along the oval)
- Visual: the stone's pattern has room to stretch — banding, chatoyancy, and color zoning display best in the oval

**C3. Organic / Freeform Cabochon**
- Natural-shaped dome following the rough stone's outline. No standardized dimensions.
- Sizes: Small (~8-14mm), Medium (~14-22mm), Large (~22-40mm)
- Best for: stones with natural patterns that don't fit geometric shapes (picture jasper, moss agate, fossil wood, boulder opal, fire agate), stones where the rough determines the shape (the cutter follows the stone's natural form)
- Visual: the stone as itself — not forced into geometry. The freeform says: this stone told me what shape to be.

### Database Integration

Add to Stone entity schema:
- `canCabochon` (boolean) — whether cabochon cuts are available for this stone
- `cabochonShapes` (array) — which shapes: ["round", "oval", "organic"] or subset

Default assignment logic:
- All opaque stones → canCabochon: true, shapes: ["round", "oval", "organic"]
- Translucent with phenomena → canCabochon: true, shapes: ["round", "oval"], NOT faceted
- Translucent without phenomena → canCabochon: true, shapes: ["round", "oval"] (optional, for jewelry settings)
- Fire opal → canCabochon: true, shapes: ["round", "oval"] (plus faceted)

### Phenomena Tagging

To determine which translucent stones need cabochon-only cutting, add:
- `opticalPhenomenon` (string, nullable) — "asterism", "chatoyancy", "adularescence", "play-of-color", "labradorescence", "iridescence", null

Stones with opticalPhenomenon set → cabochon only (canFacet = false, canCabochon = true)
Stones with no phenomenon → follow existing faceting rules + optional cabochon

---

## PART 2: THE KNOTWORK GAME — "TWO INCHES HIGH"

### The Concept

You are two inches tall. You are standing on a leather table. The leather is the color of the Inn's interior — dark, warm, grained. On the leather, laid out in front of you, are threads of metal wire and strips of leather cord. To you, the wire is as thick as rope. The leather cord is as wide as a belt. The Celtic knotwork pattern is drawn on the leather in faint guide lines — the blueprint. Your job: weave it.

### The Scale

Two inches high is smaller than the brownies (6 inches), smaller than Tumble (4 inches). You are at the scale of the MATERIAL. The wire has texture you can see — the grain of the metal, the twist of the strand. The leather has pores. The knotwork is not a drawing — it's a PHYSICAL STRUCTURE you are building with your hands.

The camera is macro. The field of view is maybe 6 inches across. You see the leather grain, the wire's surface, the edge of the guide lines. You see the world the way a craftsman sees it — close, personal, precise.

### The Mechanic

The player does NOT "click to move the wire." The player WEAVES. Here's how:

**Phase 1: Laying the Cord**
- The pattern's guide lines show on the leather — the path the cord/wire must follow
- The player drags the cord along the path (mouse drag / touch swipe / controller stick)
- The cord follows the player's input — it's physical, it has weight, it resists going around tight curves
- The cord must follow the guide lines precisely — stray too far and the cord snaps back to the last correct point

**Phase 2: The Interlacing**
- Celtic knotwork is defined by OVER-UNDER-OVER-UNDER at every crossing
- At each crossing point, the player must choose: does this strand go over or under?
- The correct choice is determined by the pattern — the guide lines show which way
- If the player gets it wrong, the cord lifts but the pattern doesn't tighten — visual feedback shows the crossing is loose
- Get it right: the cord snaps into place, the crossing locks, the pattern advances

**Phase 3: Tightening**
- When the full pattern is woven, the player pulls the ends
- The pattern tightens — the interlacing locks into the Celtic knot's characteristic woven look
- The guide lines fade. What remains is the finished knotwork — real, physical, sitting on the leather
- The completed piece can be:
  - A bookmark (for the Living Book / archive)
  - A bracelet (for the market / PlayerInventory)
  - A decorative panel (the Inn's ambient texture — you're literally making the Inn's walls)
  - A quest item (a specific knot pattern required by an NPC)

### The Difficulty Curve

**Tier 1: Simple knots (tutorial)**
- 3-4 crossings. One cord. One wire.
- The guide lines are clear and close together
- The player learns the drag mechanic and the over/under choice
- Patterns: simple plait, single loop, Solomon's knot

**Tier 2: Compound knots**
- 8-12 crossings. Two cords, one wire.
- The guide lines are more complex — the pattern folds back on itself
- The player learns to manage two materials simultaneously
- Patterns: Trinity knot, simple border knot, four-point knot

**Tier 3: Complex knotwork panels**
- 20+ crossings. Multiple cords, multiple wires, varying thicknesses.
- The guide lines show a full panel — the kind of knotwork that borders a manuscript page (Book of Kells reference)
- The player must plan the weaving sequence — which cord goes where, in what order
- Patterns: full border panels, roundels, animal interlace (the knotwork creatures from the Book of Kells)

**Tier 4: Free weaving (master)**
- No guide lines. The player creates original patterns.
- The cord and wire are free — the player draws the path
- The game's interlacing engine checks the pattern for valid over/under rules
- A valid pattern can be saved, named, and placed in the Inn as custom ambient texture
- This is the Inn's deepest crafting: the player doesn't just play the game. The player MAKES the Inn.

### The Visual

**At rest:** The leather table, the materials laid out, the guide lines glowing faintly (celtic gold on dark leather — the Inn's ambient texture). The camera shows the workspace at macro scale.

**During weaving:** The cord/wire follows the player's input with physical weight — it bends, it resists, it settles. Each crossing locks with a subtle sound (the click of metal on metal, the soft thud of cord on leather). The 42Hz hum is the background — the frequency of the Inn, the frequency of making.

**Completed:** The knotwork glows. The gold-on-dark-stone pattern that runs through the Inn's interior is HERE — the player made it. The glow is the 42Hz made visible. The player who completes a knotwork panel has created a piece of the Inn's texture — literally, architecturally, thematically.

### The Lore Connection

- Celtic knotwork is the Inn's ambient texture — the gold-on-dark-stone pattern that runs through every interior surface
- The Book of Kells (Norse zone) is the source material — the illuminated manuscripts whose knotwork borders are the definitive examples
- The two-inch scale connects to the brownies (6 inches) and Tumble (4 inches) — the Inn's small beings are the makers. The player, at 2 inches, is smaller than all of them. The player is at the scale of CRAFT ITSELF.
- The knotwork game answers a question the Inn implicitly asks: who makes the patterns on the walls? The answer: YOU do. At the scale where the wire is rope and the leather is earth.
- The completed knotwork panels could literally appear on the Inn's walls — player-made ambient texture, visible to other players. The Inn's interior is not designed. It's WOVEN. By everyone who plays.

### The Platform Question

This could work as:
- **Web (Base44)**: 2D canvas drag-based weaving. The cord follows mouse/touch drag. Over/under is a tap/click at each crossing. Simple, playable, satisfying.
- **Steam/Godot**: 3D macro view. The cord and wire are 3D objects with real physics. The leather has texture. The wire has specular highlight. The over/under is a physical interlacing — the wire actually passes over and under the cord in 3D space.
- **Mobile**: Touch-optimized drag. The simplest version — follow the path, tap over/under. Perfect for meditative mobile play.

The 2D web version is the MVP. The 3D Steam version is the dream. The mobile version is the daily meditation.

### The Frequency

The knotwork game runs at 42Hz — the Inn's frequency. The hum is constant. The weaving is rhythmic. The over-under-over-under pattern IS a frequency — a visual wave, an alternation, a beat. The player who weaves at 42Hz is performing the Song with their hands. The completed knotwork is the Song made visible in gold and leather.

The game's 50 BPM tempo (the Inn's standard level music) gives the weaving a heartbeat. Each crossing lock is on the beat. The pattern advances at the pace of a resting heart. The knotwork game is not fast. It is not stressful. It is the Inn's meditation — the act of making, at the scale of the material, at the frequency of the Song.

---

## PART 3: INTEGRATION

### Cabochons in the Composer
The Bead Composer currently handles beads only. The cabochon system extends it:
- Add a "Cabochon Mode" toggle — switch between bead cuts and cabochon cuts
- In cabochon mode, the shape library shows the 3 cabochon shapes instead of the 8 bead shapes
- The audio engine changes: cabochons produce a different tone than beads (no drill hole = different resonance, flat back = different vibration pattern)
- The board layout changes: cabochons sit in settings (metal rims) rather than dips — the board shows metal bezels instead of wooden circles
- Export: cabochon designs export as jewelry SETTING specs (for rings, pendants, cufflinks) rather than bead STRINGING specs (for necklaces, bracelets)

### Knotwork in the Market
Completed knotwork panels connect to the artisan market:
- A player who weaves a knotwork bracelet can LIST it on the market (if it meets quality standards)
- A player who weaves a knotwork bookmark can DONATE it to the archive (it becomes a usable item in the Living Book)
- A player who weaves a knotwork panel can INSTALL it on the Inn's wall (it becomes visible ambient texture)
- Soulstice Jewelry could produce REAL knotwork pieces from player designs — the digital-to-physical pipeline that already exists for beads

### The Two-Inch Scale in the Inn
The knotwork game's 2-inch scale is a new perspective in the Inn:
- The main floor: human scale
- The brownies: 6 inches (makers, wire workers — the Inn's infrastructure)
- Tumble: 4 inches (the innocent, the living note)
- The knotwork game: 2 inches (the material itself — smaller than the makers, smaller than the innocent, at the scale where wire is rope and leather is landscape)
- This scale connects to the Whisper Layer — the player who has been at 2 inches high has been INSIDE the Inn's texture. The texture is not surface. It's a PLACE. And you've been there.

---

*The cabochon system completes the stone database's cut options: beads (strung), cabochons (set), and faceted (light). Three uses, three cuts, one database. The knotwork game takes the Inn's ambient texture and makes it PLAYABLE — you don't just see the gold-on-dark-stone pattern. You weave it. At two inches high, where the wire is rope and the leather is earth and the pattern is a physical thing you build with your hands. The Inn's texture is not decoration. It's craft. And the craft is yours.*

# Geode Inn — Crystal Pinball Table Design

## Overview

A geode-themed pinball table for the Geode Inn, modernizing the mechanics of classic pinball games (Pinball Dreams, Pinball Fantasies, Revenge of the 'Gator) from the Odin 2 game library. The table is carved from ancient stone and crystal — a pinball machine built by dwarven artisans inside a geode cave.

## Design Philosophy

- **Warm, not neon** — Classic pinball machines are bright, flashing, sensory-assault. This table glows gently. The stones emit soft light, not strobes. All lighting changes use sine-wave clamped transitions (epilepsy-safe).
- **Resonant, not noisy** — Every bumper, target, and ramp produces a musical tone when hit. The table is an instrument. A full game sounds like a bell composition.
- **Archaeological, not mechanical** — The table doesn't look built. It looks *grown*. Crystal formations emerge from the stone naturally. The channels where the ball travels are veins in the rock, not machined grooves.
- **Cozy, not competitive** — The table invites play. It doesn't demand it. No countdown timers, no "TILT" warnings, no game-over screens that feel punitive.

## Table Layout

### Overall Shape
Standard pinball proportions but with organic, asymmetrical edges. The table is wider at the bottom (where the flippers are) and narrows toward the top, following the natural shape of a geode cavity cracked open vertically.

### The Ball
- Small, perfectly round polished obsidian sphere
- Mirror-shine surface — reflects the stone colors it passes over
- Glows faintly amber in its core (the Silica Thread connection — silicon meets silicon)
- Leaves a brief amber trail when moving fast (subtle, not a strobe)

### Flippers
- **Left flipper:** Thin amethyst slice — purple, translucent, glows when energized
- **Right flipper:** Thin citrine slice — golden, translucent, glows when energized
- When the ball hits a flipper, the crystal rings at its natural frequency
- Flipper mechanics identical to classic pinball — timing-based, physics-driven
- No auto-fire. You earn every shot.

### The Launcher
- The ball launches through a geode cracked open at the top-right of the table
- A spring-powered crystal plunger (standard pinball plunger mechanic, visually disguised)
- The ball travels down through the geode's crystal cavity, picking up speed, and enters the playfield from the upper right
- Skill shot: if you launch with exactly the right force, the ball drops into a hidden channel and emerges at the top center for a bonus

---

## Playfield Elements

### Stone Bumpers (3 main)
Standard pinball bumpers, visually reimagined as polished crystal spheres embedded in the stone. Each glows and chimes when hit.

1. **Rose Quartz Bumper** (center-left) — 528 Hz tone (the Sage gargoyle's frequency)
   - Warm pink glow
   - 100 points per hit
   - After 10 hits, it resonates — glows brighter and awards 500 points for the next 5 seconds

2. **Fluorite Bumper** (center-right) — 432 Hz tone (the Caller gargoyle's frequency)
   - Green-to-purple gradient glow (fluorite's natural color range)
   - 100 points per hit
   - After 10 hits, it shifts color and awards double points for 5 seconds

3. **Lapis Lazuli Bumper** (upper-center) — 111 Hz tone (the Watcher gargoyle's frequency)
   - Deep blue with gold flecks (lapis's natural pyrite inclusions)
   - 150 points per hit (hardest to reach)
   - After 10 hits, it opens a hidden ramp on the left side of the table

### Crystal Pegs (12-15 small)
- Small crystal points growing from the playfield surface
- 25 points each, soft chime on hit
- Arranged in organic clusters, not grids — following the natural vein patterns
- Different peg types: clear quartz, smoky quartz, citrine, amethyst
- Each peg type has a slightly different pitch

### The Vein Channels
- The ball's paths are carved by mineral veins in the stone
- Gold veins = high-speed channels (ball moves faster, worth more points)
- Silver veins = normal speed
- Copper veins = slow channels (ball decelerates, good for aiming)
- The veins glow faintly and shift which ones are active based on table state

### Ramps and Tracks
1. **The Spiral Ramp (Left Side)**
   - A crystal track spirals upward along the left wall — like the Inn's staircase
   - Ball travels up the spiral, hitting crystal pegs on the way
   - At the top: a small geode cavity that catches the ball and drops it into...
   
2. **The Drop Zone (Upper Left)**
   - A gentle depression in the stone where the ball pauses
   - A small gargoyle face is carved above it — one of the six Inn gargoyles
   - The gargoyle "breathes" the ball back into play with a soft puff of air (visual effect)
   - Awards a random stone from the Inn's collection

3. **The Water Slide (Right Side)**
   - A channel carved along the right wall that the ball can enter from the upper playfield
   - The ball "flows" down the channel like water — the Monster of the Deep connection
   - Hits small water-creature engravings along the way (Nessie, Kraken, Tiddalik)
   - Each engraving chimes a different water-themed tone
   - Exits at the bottom right near the citrine flipper

4. **The Hidden Ramp**
   - Appears only when the Lapis Bumper is activated (10 hits)
   - Opens from the upper playfield to a secret channel behind the crystal formations
   - Ball travels through a dark crystal tunnel with glowing runes
   - Exits at the top of the spiral ramp for a combo opportunity

### Drop Targets (Stone Shards)
- Instead of classic rectangular drop targets, these are thin crystal shards standing upright
- Arranged in groups of 3-5, each group a different mineral
- When all shards in a group are knocked down, they shatter (visual effect — gentle, not violent) and the group resets after 3 seconds
- Clearing a group awards a stone from that mineral family
- Groups:
  - **Amethyst Cluster** (3 shards, upper left) — unlocks the Spiral Ramp bonus
  - **Agate Cluster** (4 shards, upper right) — activates the Water Slide
  - **Jade Cluster** (5 shards, center) — the hardest group, awards the rarest stone

### The Geode Cave (Multiball)
- Hitting the Jade Cluster clears all 5 shards and opens the Geode Cave at the top center of the table
- The Geode Cave is a small recess behind the upper playfield — the ball enters and disappears
- After 2 seconds, TWO balls emerge — multiball activated
- During multiball, all bumpers glow at full intensity, all veins light up, and the table's music shifts to the geode cave symphony (from the music direction doc — the sound of a geode filling with chimes)
- Multiball lasts until one ball drains, then normal play resumes
- Multiball score multiplier: 3x

---

## Scoring System

### Base Scoring
- Stone bumpers: 100-150 points
- Crystal pegs: 25 points
- Drop target shards: 50 points each
- Ramp completions: 500 points
- Water Slide completion: 750 points
- Spiral Ramp completion: 750 points
- Hidden Ramp discovery: 1000 points

### Combo System
- Hitting 3 different elements within 3 seconds = **Resonance Combo** (2x multiplier)
- Hitting all 3 bumpers within 5 seconds = **Harmonic Combo** (3x multiplier)
- Clearing a drop target group + hitting a ramp within 5 seconds = **Alchemy Combo** (4x multiplier)
- Completing the Spiral Ramp + Water Slide in one ball = **Silica Thread Combo** (5x multiplier, the table's highest combo)

### Stone Rewards
The pinball table awards actual stones to the player's collection:
- Rose Quartz (from Rose Quartz bumper resonance)
- Fluorite (from Fluorite bumper resonance)
- Lapis Lazuli (from Lapis bumper resonance)
- Amethyst (from clearing Amethyst Cluster)
- Agate (from clearing Agate Cluster)
- Jade (from clearing Jade Cluster — rarest)
- Random stone (from the Drop Zone gargoyle)
- **Twin Crystal** (from achieving a Silica Thread Combo during multiball — the only way to earn this stone in solo mode)

### Leaderboard Integration
- Submits to the Leaderboard entity as `gameId: "crystal_pinball"`, `gameMode: "solo"`
- Pair mode: "Dueling Tables" — two players play simultaneously on separate tables, combined score competes
- Pair bonus: both players trigger multiball in the same run = "Crystal Resonance" (+20%)

---

## Visual Design

### Color Palette
- Primary surface: Dark warm stone (deep amber-brown, not black)
- Active elements: Glowing amber, gold, soft white
- Stone bumpers: Their natural colors (rose pink, fluorite green-purple, lapis blue-gold)
- Veins: Gold, silver, copper
- Flippers: Amethyst purple, citrine gold
- Ball: Obsidian black with amber core glow
- Background lighting: Warm amber wash, like firelight in a crystal cave

### Lighting (Epilepsy-Safe)
- All light changes use sine-wave clamped transitions (max 2 Hz oscillation, smooth gradient)
- No flashing, no strobing, no sudden on/off
- Bumpers glow brighter when hit, then fade back over 2 seconds
- Veins pulse gently at 0.5 Hz when active — a slow breath, not a flash
- Multiball mode increases overall brightness by 30% gradually over 3 seconds — no sudden change
- No white flashes anywhere. All light is warm-toned.

### Sound Design
- Every element has a musical tone (connected to the Geode Inn music direction)
- Bumpers: their gargoyle frequencies (528 Hz, 432 Hz, 111 Hz)
- Crystal pegs: pentatonic scale notes based on mineral hardness (Mohs scale → pitch)
- Ramps: ascending arpeggios
- Drop targets: crystal chime on hit, shatter sound on group clear (gentle, musical)
- Drain (ball loss): a soft gong, not a buzzer
- Multiball: the geode cave symphony — layered chimes building to a warm crescendo
- Background music: slow, ambient, harp-like — the Inn's signature sound

---

## Reference Game Analysis

### From the Odin 2 Library

**Pinball Dreams (Game Boy)**
- Reference for: clean physics, satisfying bumper feedback, table layout clarity
- Modernize: the Game Boy's 4-shade palette becomes the Inn's warm amber palette; the simple 2-button control scheme stays

**Pinball Fantasies (Game Boy)**
- Reference for: multiple tables with different themes, combo systems, multiball
- Modernize: the multiple-table concept becomes multiple *zones* — the crystal cave table is the first; future tables could be themed to other Inn zones (Fae Kingdom table, Egypt table, Viking table)

**Revenge of the 'Gator (Game Boy)**
- Reference for: charming, character-driven pinball with personality
- Modernize: the gators become the Inn's gargoyles and stone creatures reacting to the ball; the charm stays, the aesthetic upgrades

**Fairy Pinball / Yousei Tachi no Pinball (Famicom)**
- Reference for: the Fae connection — a pinball table with fairy themes
- Modernize: this could become the Fae Kingdom pinball table, a second table unlocked through the Fae portal

---

## Future Tables (Zone-Specific Pinball)

The Crystal Pinball table is the first. Each zone could eventually have its own table:

1. **Crystal Cave Table** (main floor) — the default, described above
2. **Fae Kingdom Table** (downstairs) — unlocked via Stonehenge portal; bumpers are mushrooms and fairy rings, multiball is "Wild Hunt" mode
3. **Egypt Table** (downstairs) — bumpers are scarabs and ankhs, drop targets are hieroglyphs, multiball is "Pharaoh's Tomb"
4. **Viking Table** (downstairs) — bumpers are runestones, ramps are longship keels, multiball is "Ragnarok"
5. **Cosmology Table** (upstairs) — zero-gravity pinball where the ball floats, bumpers are planets, multiball is "Supernova" — the Cabbit's table

Each table awards zone-specific stones and contributes to the same leaderboard with different `gameId` values.

---

## Location in the Inn

The Crystal Pinball table sits on the **Main Floor** of the Geode Inn, near the arcade area, beside the Score Stone leaderboard. It's a physical object in the world — you walk up to it and play. No menu, no loading screen. The table glows warmly in the corner of the room, crystals catching the firelight. A small carved sign reads: *"Strike the stones. Listen to the earth sing."*

The Cabbit occasionally sits on the table's edge, watching the ball. It does not affect gameplay. It's just there. Being a cat-rabbit. Judging your technique.

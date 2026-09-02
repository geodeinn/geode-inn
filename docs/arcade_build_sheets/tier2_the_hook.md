# Build Sheet — The Hook

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Geode Inn Name | The Hook |
| Genre/Mechanic | Placement & removal puzzle. Hook on a cable, 7x7 grid, catch-and-release. |
| Zone | Tidal Caves (Pirate's arcade cabinet) |
| Stone Reward | Aquamarine |
| Rarity Tier | Uncommon |
| Price | $4.99 |
| Game Effect | Unlocks Aquamarine. Tidal cave access expansion. |
| Lore Connection | The Hook is the Pirate's game — the tide made mechanical. The grid is a cross-section of the aqueduct system. Each row is a water layer. Stones carry real frequencies from the Stone database. When the grid aligns, the 42Hz Song plays and the aqueduct flows. |
| Development Status | spec-complete |

## SECTION 2: STORYLINE ADAPTATION

The Hook is a placement-and-removal puzzle built on a single mechanic: the hook. Extend to grab, retract to pull, extend to place, unhook to release. The board is a 7x7 grid (49 sockets — the Inn's number) representing a vertical cross-section of the aqueduct system. Row 1 is Rain. Row 7 is Crystal Core.

The cable is straight — it cannot bend, cannot pass through filled sockets. The path matters. The order matters. Removing the wrong stone first blocks the path. Removing the right stone first opens everything.

Five puzzle types:
1. **Frequency Alignment (The Chord)** — sort stones by frequency into the correct water layer rows. All 7 rows aligned = the 42Hz Song plays.
2. **Family Reunion (The Geological Sort)** — group stones by geological family into quadrants.
3. **The Clear Path (The Removal Puzzle)** — grid starts full. Remove stones to reveal hidden patterns. Subtraction as sculpture.
4. **The Current (The Flow Puzzle)** — arrange channel stones for water to flow top-to-bottom. Real-time water flow — race against the current.
5. **The Siphon (The Pressure Puzzle)** — sort stones by density into two columns to create pressure differential.

NPC Connections:
- The Pirate hosts the cabinet, teaches the rules, taunts the player
- Newton has a desk in the tidal cave — the three laws of motion as hook game physics
- The Examiner studies what comes OUT of the water (removed stones)
- The Cartographer maps what is WITHIN the water (cable paths as currents)

Frequency States:
- Living (42Hz): Warm tidal aesthetic, standard cable speed
- Shadow (84Hz): Darker cave palette, faster water in Current puzzles, cable tension increases
- In-Between: Transitional moments between puzzle types

## SECTION 3: VISUAL ASSETS NEEDED

- Character sprites: The Pirate (Living + Shadow), Newton at tidal desk, Examiner with calipers, Cartographer with maps (all tri-mode)
- Background: Tidal cave environment with crystal socket grid, water reflections, Gothic-Klimt stone
- UI: Antikythera-themed HUD with cable length indicator, hook position tracker, frequency display per row
- Stone sprites: Color-coded resonance stones (drawn from 198-stone database, each with real color)
- Water animation: Flowing water for Current puzzles, siphon pressure visualization
- Grid states: Empty (dark crystal), filled (glowing stone color), aligned (row glow + tone)
- Estimated total: 40-60 image assets

## SECTION 4: AUDIO ASSETS NEEDED

- Main theme: Pirate's coastal instruments (bodhrán, accordion, sea shanty motif) at 50 BPM low-dub
- Shadow theme: 84Hz pulse, cave acoustics, dripping water layer
- Victory: Aquamarine stone tone (Mohs 7.5-8 → ~480Hz at 12dB below narration)
- Row alignment chimes: Each row plays its tone when correctly aligned (7 ascending tones)
- Complete chord: All 7 rows aligned = the 42Hz Song in full harmonic structure
- SFX: Hook extend, hook grab, cable retract, stone place, stone remove, water flow, siphon activate, cable stuck
- Voice lines: The Pirate (8-12 taunts/teaching lines), Newton (4-6 physics observations), Examiner (3-4 measurement comments), Cartographer (3-4 path observations)
- Inn Mode DSP: Tidal cave reverb profile (medium decay, water reflections)
- Estimated total: 25-30 audio assets

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first (all assets bundled locally)

Core Systems:
- Cable physics: straight-line pathfinding through grid, collision with filled sockets
- Hook mechanics: grab adjacent stone, retract through cleared path, place in empty socket
- Grid logic: 7x7 socket array, stone frequency/family/category properties from Stone entity
- Water simulation: Real-time flow for Current puzzles (path-based, not full fluid dynamics)
- Siphon: Density comparison between columns, pressure activation threshold
- Scoring: Base score + Pirate's score (efficiency) + path elegance bonus

Controller Support:
- Full Bluetooth controller mapping (stick for hook navigation, face buttons for grab/release)
- Touch support for mobile (tap to extend, drag to position, tap to grab/release)
- Valkyrie Shift compatible (TV deployment — simple input model)

Steam Integration:
- Achievements: Complete all 5 puzzle types, perfect chord alignment, no-cable-stuck run, siphon master
- Cloud saves: PlayerProgress sync + puzzle completion state
- Leaderboard: Pirate's Score (efficiency rating) + speedrun times per puzzle type

## SECTION 6: ACCEPTANCE CRITERIA CHECKLIST

- [ ] Fully playable, standalone
- [ ] Downloadable as independent product
- [ ] Geode Inn narrative: Pirate's tidal cave, Newton's physics, Examiner/Cartographer twins
- [ ] Original music (coastal low-dub at 50 BPM, no original game samples)
- [ ] Bluetooth controller support (all controller types)
- [ ] System overlay support (Steam overlay)
- [ ] Commercially sellable on Steam + Geode Inn shop

## SECTION 7: BUILD NOTES

- The Hook is one of the most Inn-integrated games: it uses the real Stone database (198 stones with frequencies), connects to the seven-layer water system, and features four NPCs with distinct roles
- Newton's three laws as game physics: (1) cable moves in straight line unless blocked, (2) grab force proportional to adjacency, (3) every action has equal reaction (placing a stone may block another path)
- The Examiner's Tidal Log as unlockable lore item — reading it reveals tidal patterns that hint at puzzle solutions
- The Cartographer's Living Tidal Map as meta-game navigation tool
- Cable mechanics create emergent difficulty: as the grid fills, paths shorten, decisions compound
- The Clear Path puzzle (Type 3) is the Examiner's favorite — "The adequate is what remains"

# Geode Inn — Game Mechanics DNA Specification
## How All Game Systems Interconnect as One Loop

**Document type:** Master specification — mandatory game design standard
**Status:** ACTIVE — all game design, reward systems, progression, and inter-game loops must comply
**Date:** September 2, 2026
**Depends on:** Audio DNA, Visual DNA, Narrative DNA, PlayerProgress entity, EggHatch/EggVote entities, Leaderboard entity, MarketItem entity, 7-criteria build standard

---

## PURPOSE

The Inn has 61 game listings, a 7-criteria build standard, 198 stones, a collection system, a leaderboard, an Egg Hatchery, and a tri-mode frequency system. These systems exist across multiple entities and specs. This document maps how they interconnect — the game loop as a single organism.

The game mechanics aren't separate games with separate reward tables. They are one system where every game feeds every other game through stones, frequencies, and the tri-mode.

---

## PART 1: THE CORE GAME LOOP

The Inn's entire game system is one loop:

1. PLAY → A game (Tetris, Dig Dug, Temple Run, Monster of the Deep, etc.)
2. EARN → Stones (the reward is always a stone, at a Mohs-mapped frequency)
3. COLLECT → Geode Cave (the stone is placed in the cave, adding a note to the chord)
4. TRIGGER → Frequency (the stone's Mohs hardness produces its tone in the zone it's placed)
5. UNLOCK → Zones/Quests (certain stones unlock certain areas — Preseli Blue Stone opens the Fae Kingdom)
6. EXPERIENCE → New zones at new frequency states (stones collected in 42Hz games may be playable in 84Hz Shadow mode)
7. ACCUMULATE → Leaderboard/Egg system (score and community voting)
8. RETURN → Play again with new content unlocked (the loop feeds itself)

**The loop is the Inn:** each cycle adds a stone, each stone adds a frequency, each frequency adds a dimension to the world.

---

## PART 2: THE STONE COLLECTION SYSTEM

### How Stones Work
Every stone in the Inn has:
- **Mohs hardness** → maps to a frequency (the stone's voice)
- **Category** → maps to a game type (precious stones from harder games, common stones from easier games)
- **GeoRegion** → maps to a world map pin (where the stone comes from)
- **Mind/Body** → metaphysical and physical properties (narrative content)
- **Image** → the cleaned family image (visual)
- **canCabochon/canFacet** → the stone's physical processing options (Bead Composer integration)

### Stone Tiers and Game Mapping
| Stone Tier | Mohs Range | Game Difficulty | Frequency Range | Unlocks |
|-----------|-----------|----------------|-----------------|---------|
| Common | 1-3 | Easy games (first 10 levels) | 65-130Hz | Basic zone access |
| Uncommon | 4-6 | Medium games (advanced levels) | 130-400Hz | Fae Kingdom threshold, Bead Composer |
| Rare | 7-8 | Hard games (endgame levels) | 400-800Hz | Shadow Inn, The Royal |
| Legendary | 9-10 | Boss games / Egg rewards | 800-1046Hz | Cosmology level, Final Room |

### The Geode Cave as Progress Bar
The geode cave IS the player's progress. Not a menu. Not a percentage. A room that fills with sound.

- Empty cave: 1 note (the 42Hz Song alone) — the player has just arrived
- 10 stones: a minor chord — the player has explored the Main Floor games
- 50 stones: a full chord — the player has descended through multiple levels
- 100 stones: a rich harmony — the player has reached the deep zones
- 198 stones: the complete chord — every stone, every frequency, the Inn at full resonance

The cave is not a collection screen. The cave is the player's relationship with the Inn expressed as acoustics.

---

## PART 3: THE TRI-MODE IN GAMEPLAY

### How Games Work Across Frequency States

Every game can be played in three frequency states. Same game, different world:

| State | Game Changes | Visual Changes | Audio Changes | Reward Changes |
|-------|-------------|----------------|--------------|----------------|
| 42Hz (Living) | Standard difficulty, full UI, warm environment | Standard artist palette, clean linework | Standard music, fused organism | Standard stones |
| 84Hz (Shadow) | Harder difficulty (the game is "one octave down" — more intense), stripped UI | Desaturated, fragmented linework, inverted anomaly | Depeche Mode darkness, tectonic soundtrack | Shadow stones (84Hz versions — same stone, darker facet) |
| In-Between | Unpredictable difficulty (the rules haven't settled), hovering UI | Transparent, flickering linework | Unresolved modulation, hovering notes | In-Between stones (rare, transitional, unique properties) |

### The Shadow Mode as Replay-ability
Shadow Mode is not New Game Plus. It's the same game one octave down. The level layout is the same. The enemies are the same. But the frequency shift changes everything:
- The 42Hz Song becomes 84Hz — felt deeper, more urgent
- The NPC leitmotifs are in minor, distorted
- The color palette is desaturated
- The linework is stressed
- The physics are heavier (gravity "feels" stronger at 84Hz — the game runs at a slightly lower framerate for weight, not for performance)

Shadow Mode is the Tool tectonic shift applied to gameplay. The ground moved. The game is the same. The world is different.

---

## PART 4: THE EGG HATCHERY AS COMMUNITY ENGINE

### The 28-Day Cycle
The Egg Hatchery is the Inn's generative community system. It operates on a 28-day lunar cycle:

1. **Day 1-7 (Laying):** A new Egg appears. Its content is a mystery — a character, a game mode, a zone, or an artifact. The community votes on what it might be.
2. **Day 8-21 (Incubation):** The Egg accumulates votes (EggVote entity). The community's energy determines the Egg's `resonanceScore`. Players who contribute more get higher `signatureCount`.
3. **Day 22-27 (Hatching Imminent):** Resonance threshold reached. The Egg begins to show signs of what's inside.
4. **Day 28 (Hatch):** The Egg hatches. The content is revealed. If `isPermanent` is true, the content becomes a permanent Inn addition. If false, it returns after a period.
5. **Post-Hatch (Retirement):** Retired content migrates to the comic strip as an echo. The character lives on in the Gazette.

### How the Egg Feeds the Loop
- Egg rewards are stones that can't be earned any other way
- Egg-hatched characters become NPCs with their own leitmotifs (Elfman) and linework modes
- Egg-hatched game modes become new entries in the arcade (feeding the 61-game library)
- The community voting creates social bonds (Roberts found family)
- The 28-day cycle creates a rhythm that matches the lunar month — the Inn's calendar IS the moon

---

## PART 5: THE LEADERBOARD AS REPUTATION

### Not a Scoreboard. A Reputation System.
The Leaderboard entity tracks not just `score` but `faeReputation`, `comboMultiplier`, `stonesCollected`, `stonesEarned`, `pairScore` (cooperative play), and `weekNumber`/`weekYear` for seasonal competition.

- **Score** = raw skill in a single game
- **faeReputation** = standing with the Fae courts (social/political progression)
- **stonesCollected** = total stones gathered across all games (the geode cave's size)
- **stonesEarned** = stones earned this week (activity, not accumulation)
- **pairScore** = cooperative play (two-player synchronous games, Common Room enabled)
- **comboMultiplier** = sustained excellence across multiple games in one session

### How the Leaderboard Feeds the Loop
- High faeReputation unlocks rare stones from the Fae Kingdom
- High stonesCollected unlocks the deeper zones
- High pairScore unlocks cooperative Egg voting (pairs vote together, doubling their influence)
- The weekly reset creates urgency without punishment — your score resets but your stones don't

---

## PART 6: THE CROSS-GAME ECONOMY

### Stones as Universal Currency
Stones are the only currency. No gold. No points. No gems-as-purchase.

| Transaction | Cost | Effect |
|------------|------|--------|
| Play a game | Free | Earn stones (game reward) |
| Enter deep zones | Specific stones | The stone is consumed (placed in the door) |
| Trade with NPCs | Stone exchange | Give one stone, receive another (the NPC has what you need) |
| Fae Kingdom quests | Rare stones | Non-renewable quests that consume stones for unique rewards |
| Egg voting | Stones as votes | Higher-tier stones count as more votes |
| Bead Composer | Stones as materials | Stones are physically shaped into jewelry |

### The Economy Is the Geology
The Inn's economy IS its geology. You trade stones. You unlock doors with stones. You vote with stones. You make jewelry from stones. The currency is the thing the Inn is made of. The economy and the worldbuilding are the same system.

---

## PART 7: THE GAME MECHANICS SHIPPING CHECKLIST

Before any game, game mode, or game system ships:

### The 7-Criteria Build Standard (from Krista's definition)
- [ ] Fully playable, independent from anything else
- [ ] Downloadable as a standalone product
- [ ] Fully written with Geode Inn storylines and characters — no original game's characters
- [ ] Original/adapted music replacing the original game's music
- [ ] Bluetooth option for all controller types
- [ ] Overlay button for all coinciding systems (Steam, etc.)
- [ ] Wired, running, and sellable

### The Loop Integration
- [ ] **Stone reward:** Does the game reward stones at the correct Mohs/frequency tier?
- [ ] **Geode cave:** Does the stone add a note to the cave's chord?
- [ ] **Loop feedback:** Does completing the game unlock something in another system?
- [ ] **Tri-mode:** Can the game be played in all three frequency states?
- [ ] **Egg integration:** Can the game receive Egg-hatched content (new modes, characters, items)?

### The DNA Checks
- [ ] **Audio DNA:** Does the game's audio pass the Audio DNA shipping checklist?
- [ ] **Visual DNA:** Does the game's visual design pass the Visual DNA shipping checklist?
- [ ] **Narrative DNA:** Does the game's story/naming/dialogue pass the Narrative DNA shipping checklist?

### The Six-Writer Check
- [ ] Does the game's text carry at least one six-writer quality?

If it doesn't pass, it doesn't ship. Zero games currently meet this standard. The 61 MarketItem records are store listings ONLY.

---

## SUMMARY: THE INN'S GAME MECHANICS IN ONE PARAGRAPH

The Inn's game system is one loop: play a game, earn a stone, place it in the geode cave (adding its Mohs-mapped frequency to the chord), unlock new zones and quests, experience them in a new tri-mode state, accumulate reputation, and return to play with new content unlocked. The currency is stones — the thing the Inn is made of. The economy IS the geology. Every game can be played in three frequency states (Living, Shadow, In-Between), each one the same game one octave apart. The Egg Hatchery generates new content every 28 days through community voting, and retired content migrates to the comic strip as echoes. The Leaderboard tracks not just skill but reputation, cooperation, and accumulation. The geode cave is the progress bar — a room that fills with sound, one stone at a time, until the silence that was the cave becomes a symphony that IS the Inn. The loop is the Inn: each cycle adds a stone, each stone adds a frequency, each frequency adds a dimension to the world. And the world doesn't end — it accumulates. Like a geode. Like a book. About rocks.

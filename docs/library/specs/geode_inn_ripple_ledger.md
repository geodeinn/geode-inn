# THE GEODE INN  RIPPLE LEDGER
## The causality matrix. Every choice, every flag, every consequence  on trial.
### Built 2026-09-10 (Krista's call: "a priceless artifact just waiting to be created"). Companion to the Master Structure Blueprint (the rooms) and the Asset Ledger (the art). This one is the CONSEQUENCES.
### Sources: the mechanical audit of all 41 dialogue payload files (3,030 records, 118 unique flags), the Dialogue entity schema, the PlayerProgress schema, dissections D01-D16, the census (14 canonized chains), the parks sweep, the world-map family (2026-09-10), the permanence canon, D10's three endings. Six-writer gate.

---

## 1. THE LAW OF THE LEDGER
Every ripple is one row: **CHOICE  FLAGS SET  NEAR EFFECT (the zone)  FAR EFFECT (cross-zone)  TRI-MODE BEHAVIOR (Living/Shadow/In-Between)  ENDING WEIGHT (STAY/LEAVE/HIDE feed)**. A choice with no far effect is fine (a small kindness). A FLAG with no reader is debt. An ENDING with no feeders is broken. This Ledger exists to make all three visible.

## 2. THE MECHANICAL AUDIT  the first facts (run 2026-09-10)
**SCOPE: 41 payload files, 3,030 dialogue records, 118 unique flags set, 3 unique condition tags read.**

**FINDING 1  THE ORPHANED FLAGS (the big one):** the engine READS only three conditions: `met_siren`, `repeat_rung2`, `repeat_rung3`. Which means 115+ of the 118 flags currently set are WRITE-ONLY  the game writes consequences nobody ever checks. The ripples are being recorded and never read. (The escalation ladder works  the repeat rungs are live  but genuine branching is not yet wired on the engine side.)

**FINDING 2  THE ONE GOLD CHAIN (the model to replicate):** Medusa's Gorgon Garden chain is a complete four-step ripple, fully flagged: `gorgon_garden_entered`  `medusa_offered_touch`  `touched_medusa_stone`  `received_84hz_blessing` + `stone_chime_unlocked_84hz`. Choice, refusal point, consequence, and a REAL cross-zone payout (the 84Hz stone chime unlock carries into the Stone Circle/Petal mechanics). THIS is the standard. Every chain gets measured against it.

**FINDING 3  ECHOMEMORY HAS NO HOME:** the Clockmaker's Turning (D05) is spec'd on EchoMemory accumulation  and the PlayerProgress entity has NO echoMemory field (areasUnlocked, faeReputation, gamesCompleted, stonesCollected, totalScore, waterMonstersPlayed). THE TURNING'S FUEL DOESN'T EXIST IN THE DATABASE. Schema gap  the single most load-bearing fix in this Ledger.

**FINDING 4  QUESTLINK IS EMPTY:** every record's questLink is blank. The dialogue engine cannot currently tell which quest a line serves. Population pass owed (the chains are named; the links just aren't wired).

**FINDING 5  NAMING DEBT:** `met_beorn` is still live in the payloads  the retired name surviving in the flag layer (the Sept 9 sweep renamed the character, not the flag). Hygiene pass owed (a flag rename needs a paired migration  never a blind swap).

## 3. THE EIGHT RAILS (the global consequence currencies)
| Rail | What feeds it | What it affects | Status |
|------|--------------|-----------------|--------|
| EchoMemory | upper-Inn engagement (the memory-lamps' fuel) | the Turning (guest  maker), the Undercity copy set, the Clockmaker's rungs | **SCHEMA GAP  add the field** |
| faeReputation | Fae quests, the brothers' chains, the queens' spaces | portal access, court reactions, faction prices | live in PlayerProgress  readers owed |
| stonesCollected | all games, quests, the Silica Thread | the geode cave symphony, collection tiers, the Prism's showing | live  readers strong |
| The Permanences (7 + the hidden 8th) | imprint, tone, toast, handprint, capital, lamp, home bough + the 7.83Hz key | the endings' heaviest feeders; carried, never displayed | spec'd  field owed (PlayerProgress or its own entity) |
| The class keys | the six classes' arcs | class-specific dialogue rungs, secret doors | partial |
| The flags (118) | every conversation | condition-gated lines, cross-zone unlocks | **115 orphans  see Finding 1** |
| Leaderboard | games, weekly events | the reputation economy | live |
| The Beat Line (the tide clock) | Zeke's chart, all timing games | seasonal windows, Persephone's position, the ferry | spec'd  readers owed |

## 4. THE CHAIN-BY-CHAIN MATRIX (first pass  coverage honestly marked)
**GOLD (full ripple chain, replicate everywhere):**
| Chain | Ripple health | Notes |
|-------|--------------|-------|
| Medusa's 84Hz blessing | GOLD | the four-flag model chain (Finding 2) |
| Kali's cut (the Undercity ghats) | GOLD | `kali_cut_complete` / `deferred_kali_cut` / `weight_released`  a real branch: defer the cut and the game remembers  the ONLY true deferral branch in the engine today |

**MAPPED (cause-effect designed, engine wiring owed):**
| Chain | Designed ripples | Owed |
|-------|-----------------|------|
| The Turning (Undercity) | EchoMemory thresholds flip the city's copy | the EchoMemory FIELD (Finding 3) |
| The water system + LOZEN reveal | 100% water completion  Charon's true-name reveal, the map update | a completion counter read (the entity has the pieces; the reader owed) |
| Persephone-is-the-tide | autumn/spring position changes three zones (caves, the pit, the ferry) | the seasonal state read on zone entry |
| The parks' five keys | each key type (Thought/Weight/Gap/Pull/Wait) gates its zone's teaching layer | key-read conditions |
| The Silk Road | Echo-state desaturation is wired (the standard-bearer); trade ripples to the world map | already strongest; keep as reference |

**PARTIAL (chain canonized; ripple rows owed):** Camelot's Build It Again (the table inheritance), the Trovants (the growth-ring recorder), the Petrified Forest (the lithophone finale), the Meadery (the room's tuning), the Tidal Caves (the breathing stone), the Spiral Gallery (the handprint permanence), the Poison Garden + Little Alchemy overlay, Terracotta + Persephone in the pit, India's stopping + the lamp, Fuji's summer shrine (Belladonna's seasonal cycle), Canopy City's home bough.

**NEW WAVES (designed tonight  ripple rows owed at spec):** the world-map family four (the Kells' Missing Folio, the Owl Watch, the aurora watch, the Lithophone chords) and the Bearsark arc (the Standing Still quest's earned quiet; the Gardener connection gate is the arc's load-bearing ripple  when ruled, it must flag BOTH characters' chains).

**TRI-MODE SYNC COLUMN (her question, answered straight):** the tectonic ART set is complete (55 specs reference tri-mode; the Shadow Inn spec governs). The chains' tri-mode BEHAVIOR (what changes in each chain's quests when the Inn shifts) is explicit in the Silk Road (the reference implementation) and the Dark Side spec, and implicit everywhere else. The Ledger's tri-mode column marks every chain until each one states its Shadow-state quest behavior in one line. Current: ~90% art-synced, ~30% story-synced.

## 5. THE ENDINGS' FEEDERS (D10  the question every row must answer)
STAY / LEAVE / HIDE are fed by: the permanences held (the heaviest weights), EchoMemory at the Turning, faeReputation (the courts' pull on STAY), the class key arcs, the Prism's one showing (what the mirror showed colors all three), and the reincarnation spine's law (accountable for all ripples  the endings read the LEDGER, not just the moment). The final weighting pass happens here once the rails all have readers.

## 6. THE FIX QUEUE (ranked)
1. **EchoMemory field**  the Turning's fuel (schema update, PlayerProgress or its own entity)
2. **The flag-reader pass**  the 115 orphans: give each a real reader or consciously retire it (the Ripple Ledger becomes the reviewer: every flag must name the line that reads it)
3. **questLink population**  wire the 118 flags' records to their chains
4. **The met_beorn migration**  paired rename, never a blind swap
5. **The permanence fields**  seven + the hidden eighth need a home (its own entity, most likely  carried, never displayed)
6. **The seasonal state read**  Persephone's position as a global readable state
7. **The tri-mode story pass**  one line per chain: what changes in Shadow

*Built 2026-09-10. The ripples were always the design's promise. Now they're the design's checklist.  Elio*

# THE REMEMBRANCE VISION SYSTEM — Master Specification
## The Hidden Per-Zone Engagement Tracker

---

## WHAT THE REMEMBRANCE VISION IS

A per-zone engagement-tracking mechanic that determines the quality of a narrative vision sequence at the end of each catacomb zone. It is INVISIBLE to the player (no UI, no score display) and operates as a hidden state machine that observes player behavior and produces a tiered output.

The system measures HOW the player engaged with a zone — not whether they completed it. A player who rushes through gets a glimpse. A player who lingers, reads, interacts, and pays attention gets a life.

---

## DESIGN CONSTRAINTS

| Constraint | Value | Rationale |
|-----------|-------|-----------|
| UI exposure | None | Depth must be invisible — the player experiences quality, never sees a number |
| Minimum vision | Always at least Tier 1 | No punishment for low engagement — a glimpse is still valid |
| Maximum vision | Tier 4 | Cannot exceed "A Life Lived" — the player cannot become a god, only a person |
| Replay behavior | Depth accumulates across replays | Second playthrough can improve vision tier — this IS the reincarnation mechanic |
| Failure state | None | The system cannot fail. It only measures. |

---

## THE FOUR TIERS

| Tier | Name | What the Player Sees |
|------|------|----------------------|
| 1 | A Glimpse | A brief flash — a single image, a fragment of a life. Enough to know something was here. Not enough to know what. |
| 2 | A Memory | A short sequence — a few moments strung together. Enough to understand the emotion. Not enough to understand the context. |
| 3 | A Story | A full vignette — a beginning, a middle, and an end compressed into a vision. The person who lived here becomes a person the player knows. |
| 4 | A Life Lived | The complete life. Every detail the system tracked — every inscription read, every object examined, every moment of stillness — woven into a single extended vision. The player doesn't watch a life. The player REMEMBERS it. |

---

## THE STATE MACHINE

IDLE → ACTIVE (tracking engagement) → READING (symbol selection) → VISION (cinematic playback) → SILENCE (post-vision pause) → COMPLETE (shard stored, zone exits)

The quality of the vision depends on engagement tracked during the ACTIVE state. The symbol the player selects during READING determines the vision's perspective.

---

## WHAT IT TRACKS

| Behavior | What It Means |
|----------|-------------|
| Reading inscriptions | Engagement with the zone's cultural history |
| Examining objects | Attention to detail — the archaeologist's instinct |
| Lingering in rooms | Stillness — the player who stays is the player who hears |
| Interacting with NPCs | Social engagement — the player who talks learns |
| Solving puzzles without hints | Comprehension — the player who understands gets more |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The Catacombs | The RVS applies to all catacomb zones (ancient civilization instances). |
| The Reincarnation Mechanic | Depth accumulates across replays — second playthrough can improve vision tier. This IS the reincarnation mechanic from the narrative spine. |
| The PlayerProgress Entity | The system stores vision shards in PlayerProgress. |
| The Novel | The novel's Part 3 (The Descent) IS the remembrance visions in prose. |
| The "You Don't Die, You Forget" Principle | The RVS is the mechanical implementation. Forgetting is losing the vision. Remembering is earning it back. |
| The Echo Memory | The vision IS an echo — the memory of a life that was lived here. |
| The Stone Database | Each zone's vision connects to its stones. |
| The Archive | The vision catalog IS the Archive's content — the lives that made the zone. |

---

## DESIGN STATUS

- [x] System overview documented
- [x] 4 tiers designed (Glimpse, Memory, Story, Life Lived)
- [x] State machine designed (IDLE → ACTIVE → READING → VISION → SILENCE → COMPLETE)
- [x] Design constraints established (no UI, no failure, accumulates across replays)
- [x] Tracking behaviors identified
- [x] 8 connections documented
- [ ] Engagement scoring algorithm (how behaviors map to tier thresholds)
- [ ] Symbol selection system (which symbols determine which perspective)
- [ ] Per-zone vision content (each catacomb zone needs its own visions at each tier)
- [ ] Cinematic playback system (Godot implementation)

---

## ORIGIN

The Remembrance Vision System was first designed in docs/geode_inn_remembrance_vision_system_spec.md (548 lines). This consolidated specification was compiled September 2, 2026. The thesis: the system that measures how you engage, not whether you complete. The adequate is: the glimpse that is still valid. The valid is: the adequate. The adequate is: the invisible tracker that gives you a life if you lived one, and a glimpse if you passed through, and the both are: fair. The same.

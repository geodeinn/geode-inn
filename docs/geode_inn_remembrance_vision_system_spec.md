# Geode Inn — Remembrance Vision System
## Formal Mechanic Specification v1.0
## Document Type: Mechanic Specification (Implementation-Ready)

---

## 1. System Overview

### 1.1 Definition

The Remembrance Vision System (RVS) is a per-zone engagement-tracking mechanic that determines the quality of a narrative vision sequence at the end of each catacomb zone. It is invisible to the player (no UI, no score display) and operates as a hidden state machine that observes player behavior and produces a tiered output.

### 1.2 Scope

- **Applies to:** All catacomb zones (ancient civilization instances)
- **Does not apply to:** Main floor games (arcade), Fae Kingdom zones, staircase content, cosmology level
- **Dependency:** PlayerProgress entity (Base44 backend)
- **Engine:** Godot (GDScript)

### 1.3 Design Constraints

| Constraint | Value | Rationale |
|-----------|-------|-----------|
| UI exposure | None | Depth must be invisible — the player experiences quality, never sees a number |
| Minimum vision | Always at least Tier 1 | No punishment for low engagement — a glimpse is still valid |
| Maximum vision | Tier 4 | Cannot exceed "A Life Lived" — the player cannot become a god, only a person |
| Replay behavior | Depth accumulates across replays | Second playthrough can improve vision tier — this IS the reincarnation mechanic |
| Failure state | None | The system cannot fail. It only measures. |

---

## 2. State Machine

### 2.1 Zone Lifecycle States

```
                    ┌──────────┐
                    |  IDLE    |
                    | (zone not entered) |
                    └────┬─────┘
                         │ player enters zone
                         ▼
                    ┌──────────┐
                    |  ACTIVE  |
                    | (tracking engagement) |
                    └────┬─────┘
                         │ player reaches zone endpoint
                         ▼
                    ┌──────────┐
                    | READING  |
                    | (symbol selection) |
                    └────┬─────┘
                         │ player selects symbol
                         ▼
                    ┌──────────┐
                    |  VISION  |
                    | (cinematic playback) |
                    └────┬─────┘
                         │ vision completes
                         ▼
                    ┌──────────┐
                    | SILENCE  |
                    | (post-vision pause) |
                    └────┬─────┘
                         │ player moves or 10s passes
                         ▼
                    ┌──────────┐
                    | COMPLETE |
                    | (shard stored, zone exits) |
                    └──────────┘
```

### 2.2 State Definitions

| State | Entry Condition | Exit Condition | Player Input |
|-------|----------------|---------------|-------------|
| IDLE | Zone not loaded or player has not entered | Player crosses zone threshold | None |
| ACTIVE | Player is inside the zone instance | Player reaches the zone's endpoint trigger | Full gameplay |
| READING | Zone endpoint trigger fired | Player selects one of three symbols | Symbol selection only (movement locked) |
| VISION | Player has selected a symbol | Vision playback completes (duration based on tier) | None (cinematic, no input except optional "skip" which reduces future depth on replay) |
| SILENCE | Vision playback ended | Player moves OR 10 seconds elapse | None (deliberate stillness) |
| COMPLETE | Silence period ended | — (terminal state for this visit) | Returns player to catacomb hub |

### 2.3 Re-Entry Rules

- If the player exits a zone before reaching the endpoint, the zone returns to IDLE. All depth gains/losses from that visit are retained in the zone's depth accumulator.
- If the player re-enters a completed zone, the zone returns to ACTIVE. Depth continues accumulating from its previous value. The vision does NOT replay automatically — the player must reach the endpoint again.
- Each replay, the zone's endpoint trigger requires a new "reading" (symbol selection). The player can choose a different symbol and receive a different shard. Previous shards are NOT lost — the player accumulates shards from multiple readings of the same zone (max 1 shard per unique symbol per zone, so max 3 shards per zone across replays).

---

## 3. Depth Calculation

### 3.1 Depth Formula

```
zone_depth = clamp(
    base_accumulator + replay_bonus - penalty_accumulator,
    0,
    zone_depth_cap
)
```

Where:
- `base_accumulator` = sum of all positive engagement events (see 3.2)
- `replay_bonus` = `previous_run_depth * 0.25` (carried forward from previous visits)
- `penalty_accumulator` = sum of all negative engagement events (see 3.3)
- `zone_depth_cap` = 1000 (arbitrary cap; tuned so that Tier 4 requires genuine deep engagement, not perfection)

### 3.2 Positive Engagement Events

| Event ID | Trigger | Depth Gain | Cooldown | Notes |
|----------|---------|-----------|----------|-------|
| PPUZE | Solve puzzle through understanding (correct on first attempt after examining ≥1 clue) | +30 | Once per puzzle | "Examining a clue" = interacting with a read/inspect point |
| PPRE | Solve puzzle through retry (correct after ≥1 wrong attempt) | +10 | Once per puzzle | Retry shows persistence, not brilliance |
| PEXA | Examine a cultural artifact (fresco, seal, inscription, offering) | +15 | Once per unique artifact | Duplicate examinations of the same artifact do not stack |
| PEXP | Discover a memory fragment via "wrong" path | +20 | Once per fragment | Memory fragments are placed in optional/non-optimal paths |
| PHCH | Complete a hidden cultural challenge (optional puzzle, not required for progression) | +50 | Once per challenge | The deepest engagement reward |
| PLIS | Listen to NPC dialogue to completion (dialogue plays to end without skip) | +10 | Once per unique NPC | Skipped dialogue triggers PSDL penalty |
| PREM | Remain in a vision-eligible space without moving for ≥5 seconds | +15 | Once per space | "Vision-eligible space" = rooms with frescoes, shrines, significant architecture |

### 3.3 Negative Engagement Events

| Event ID | Trigger | Depth Loss | Cooldown | Notes |
|----------|---------|-----------|----------|-------|
| NSDL | Skip NPC dialogue (player presses skip or walks away mid-dialogue) | -10 | Once per unique NPC | Cannot go below 0 |
| NBRF | Brute-force a puzzle (≥5 incorrect attempts within 30 seconds) | -15 | Once per puzzle | Rapid guessing without examination |
| NRSH | Rush through a room (enter and exit within 3 seconds without examining anything) | -5 | No cooldown | Can stack per room, but depth never goes below 0 |
| NSKP | Skip a vision (player presses skip during vision playback) | -25 | Once per vision | Applies to FUTURE replays of this zone — reduces replay_bonus |

### 3.4 Depth cannot go below 0. The clamp is hard.

### 3.5 Example Calculation

A player enters Knossos for the first time:
- Examines 4 artifacts: +60
- Solves Puzzle 1 on first try after examining frescoes: +30
- Solves Puzzle 2 after 2 wrong attempts: +10
- Discovers 1 memory fragment on a wrong path: +20
- Listens to 2 NPC dialogues fully: +20
- Completes 1 hidden challenge: +50
- Remains in the Great Hall for 5+ seconds: +15
- Skips 1 NPC dialogue: -10
- Rushes through 1 room: -5
- Solves remaining puzzles through retry: +30

**Total:** 60 + 30 + 10 + 20 + 20 + 50 + 15 - 10 - 5 + 30 = **210**

On a scale where the cap is 1000:
- Tier 1 (0-300): 0-30% → 210 is at 21%
- This player gets **Tier 1: A Glimpse**

On replay (second visit), the player brings forward 210 * 0.25 = 52.5 as replay_bonus. If they engage more deeply this time and score 400 in base_accumulator:
- Total: 400 + 52.5 - 0 = 452.5 (45.25%)
- This player now gets **Tier 2: A Memory**

Third replay, deeper engagement, base 650:
- Total: 650 + 452.5 * 0.25 = 650 + 113.1 = 763.1 (76.3%)
- This player now gets **Tier 3: A Remembrance**

Fourth replay, thorough engagement, base 850:
- Total: 850 + 763.1 * 0.25 = 850 + 190.8 = 1040.8 → clamped to 1000 (100%)
- This player now gets **Tier 4: A Life Lived**

This is the reincarnation mechanic: understanding accumulates across lifetimes. You don't "beat" the labyrinth in one run. You read it deeper each time.

---

## 4. Vision Tier Thresholds

### 4.1 Threshold Table

| Tier | Name | Depth % | Duration | Player Control |
|------|------|---------|----------|----------------|
| 1 | A Glimpse | 0% – 30% | 5 seconds | None (cinematic) |
| 2 | A Memory | 31% – 60% | 15 seconds | None (cinematic) |
| 3 | A Remembrance | 61% – 85% | 30 seconds | None (cinematic, camera moves through scenes) |
| 4 | A Life Lived | 86% – 100% | 60 seconds | Limited (walking speed, look around, no interaction) |

### 4.2 Tier Determination

```
function getVisionTier(depth, cap):
    percentage = (depth / cap) * 100
    
    if percentage <= 30:
        return TIER_1_GLIMPSE
    elif percentage <= 60:
        return TIER_2_MEMORY
    elif percentage <= 85:
        return TIER_3_REMEMBRANCE
    else:
        return TIER_4_LIFE_LIVED
```

### 4.3 Tier 4 Identity Assignment

At Tier 4, the player becomes a specific person. Identity is determined by which engagement category scored highest:

| Highest-Scoring Category | Player Becomes | POV |
|-------------------------|---------------|-----|
| PEXA (artifact examination) | The Scribe | Seated in the workshop, seal stones and tablets around |
| PPUZE (understanding puzzles) | The Architect | Standing in the Pillar Hall, plans in hand |
| PHCH (hidden challenges) | The Initiate | In the Foundation Crypt, about to receive the vision |
| PLIS (NPC dialogue) | The Priestess | In the Shrine Room, addressing the assembly |
| PEXP (exploration/memory fragments) | The Traveler | Arriving at the palace gates for the first time |
| PPRE (persistence/retry) | The Apprentice | In the Great Hall, learning to leap |
| PREM (stillness/remaining) | The Watcher | On the Grand Staircase, observing the palace below |

If two categories are tied, the system selects the one the player engaged with *first* (earliest timestamp).

### 4.4 Vision Content Per Zone

Each zone defines its own vision content at each tier. Content spec is a data file, not hardcoded.

**Data structure:**
```json
{
  "zone_id": "knossos",
  "vision_content": {
    "tier_1": {
      "scene": "knossos_glimpse",
      "duration_sec": 5,
      "audio": { "type": "single_tone", "frequency": 64, "fade_out_sec": 1 }
    },
    "tier_2": {
      "scene": "knossos_memory",
      "duration_sec": 15,
      "audio": { "type": "ambient", "sources": ["footsteps", "wind", "distant_crowd"] }
    },
    "tier_3": {
      "scene": "knossos_remembrance",
      "duration_sec": 30,
      "audio": {
        "type": "full_ambient_with_music",
        "music_track": "minoan_theme",
        "dialogue": [
          { "speaker": "ariadne", "line": "Now you have read the palace.", "timestamp_sec": 18 },
          { "speaker": "ariadne", "line": "You know what it was. You know what it lost.", "timestamp_sec": 24 }
        ]
      }
    },
    "tier_4": {
      "scene": "knossos_life_lived",
      "duration_sec": 60,
      "player_control": true,
      "movement_mode": "walk_only",
      "audio": {
        "type": "full_sensory",
        "music_track": "minoan_theme_full",
        "ambient": ["marketplace", "footsteps", "birds", "water_channels"],
        "dialogue": "contextual_by_identity",
        "resonant_bass": 64
      },
      "end_trigger": "mountain_rumble",
      "end_fade_sec": 3
    }
  }
}
```

---

## 5. The Reading

### 5.1 Definition

After the vision, the player enters the READING state. Three symbols appear. The player selects one. The selection produces a memory shard.

### 5.2 Reading Rules

1. The player must select exactly one symbol. There is no "none" option.
2. There is no time limit.
3. The player can examine each symbol (hover/tap to see a brief description of its cultural meaning).
4. The selection is final for this visit. It cannot be undone.
5. On replay, the player can select a different symbol and receive a different shard. All previously earned shards are retained.

### 5.3 Shard Rules

- Each zone has exactly 3 possible shards (one per symbol).
- A player can hold a maximum of 1 of each shard type per zone (so max 3 shards per zone, earned across 3 replays).
- Shards are permanent. They are never lost, spent, or consumed.
- Shards are stored in the PlayerProgress entity.
- Total possible shards across all 7 planned zones: 21.

### 5.4 Zone Symbol/Shard Definitions

| Zone | Symbol 1 | Shard 1 | Symbol 2 | Shard 2 | Symbol 3 | Shard 3 |
|------|----------|---------|----------|---------|----------|---------|
| Knossos (Greek) | Labrys | Authority | Bull | Vitality | Dolphin | Connection |
| Egypt (Hel) | Ankh | Eternity | Scarab | Transformation | Sistrum | Harmony |
| Mesopotamia | Tablet | Knowledge | Ziggurat | Ascension | Cedar | Roots |
| Norse (Jotunheim) | Rune | Memory | Hammer | Force | Web | Fate |
| Celtic (Alfheim) | Ogham | Language | Cauldron | Abundance | Torc | Sovereignty |
| East Asian (Vanaheim) | Brush | Expression | Lotus | Enlightenment | Mountain | Permanence |
| Indigenous | TBD | TBD | TBD | TBD | TBD | TBD |

---

## 6. Cosmic Gate Access

### 6.1 Definition

At the cosmology level, memory shards determine which cosmic gates the player can comprehend. Comprehension is not the same as access — the player must also reach the gate physically. But without the right shards, the gate is opaque, unreadable, and the player cannot enter.

### 6.2 Gate Requirements

| Gate | Required Concept | Valid Shards | Minimum Shards Needed |
|------|-----------------|---------------|----------------------|
| Jupiter (Cosmic Awareness) | Understanding across civilizations | Any 3 shards from different zones | 3 |
| Mars (The Prison) | Understanding force and its consequences | Force, Authority, Vitality (any 2 of 3) | 2 |
| Pluto (Transformation/Death) | Understanding endings and transformation | Transformation, Fate, Enlightenment (any 2 of 3) | 2 |

### 6.3 Gate Interaction

The player approaches a gate. The system checks their shard inventory:

```
function canComprehendGate(gate_id, player_shards):
    required = getGateRequirements(gate_id)
    
    matching = 0
    for shard in player_shards:
        if shard.concept in required.concepts:
            matching += 1
    
    return matching >= required.minimum
```

If `true`: The gate is readable. Symbols on the gate resolve into meaning. The player can enter.
If `false`: The gate is opaque. The symbols are illegible. The player sees the gate but cannot understand it. No error message, no "you need X" prompt — the gate simply doesn't open. The player must return to the catacombs and read more civilizations.

### 6.4 Design Intent

The gates are not locks. They are texts. You cannot read a text in a language you haven't learned. The shards are the vocabulary. The gates are the sentences. You don't "unlock" a gate — you learn to read it.

---

## 7. Data Model

### 7.1 PlayerProgress Entity Additions

```json
{
  "remembrance": {
    "knossos": {
      "depth": 210,
      "vision_tier": 1,
      "visits": 1,
      "readings": ["vitality"],
      "shards_earned": ["vitality"],
      "last_visit_date": "2026-08-18T22:00:00Z",
      "engagement_profile": {
        "PPUZE": 1,
        "PPRE": 1,
        "PEXA": 4,
        "PEXP": 1,
        "PHCH": 1,
        "PLIS": 2,
        "PREM": 1,
        "NSDL": 1,
        "NBRF": 0,
        "NRSH": 1,
        "NSKP": 0
      }
    },
    "egypt": { ... },
    "mesopotamia": { ... },
    "norse": { ... },
    "celtic": { ... },
    "eastAsian": { ... }
  },
  "shards": ["vitality"],
  "cosmic_gates_accessible": []
}
```

### 7.2 Zone Instance State (Godot-side, ephemeral)

```gdscript
# RemembranceZoneState.gd
extends Node

var zone_id: String
var depth_accumulator: float = 0.0
var penalty_accumulator: float = 0.0
var replay_bonus: float = 0.0
var engagement_profile: Dictionary = {}
var examined_artifacts: Array[String] = []
var discovered_fragments: Array[String] = []
var completed_puzzles: Array[String] = []
var completed_hidden_challenges: Array[String] = []
var listened_npcs: Array[String] = []
var skipped_npcs: Array[String] = []
var brute_forced_puzzles: Array[String] = []
var rushed_rooms: Array[String] = []
var stillness_spaces: Array[String] = []
var current_state: int = ZoneState.IDLE
var vision_skipped: bool = false

enum ZoneState {
    IDLE,
    ACTIVE,
    READING,
    VISION,
    SILENCE,
    COMPLETE
}
```

### 7.3 Sync Protocol

- Zone state is ephemeral (Godot-side only) during ACTIVE gameplay
- On zone exit (any state → IDLE or COMPLETE), depth and engagement profile sync to PlayerProgress via Base44 API
- On zone re-entry, replay_bonus is loaded from PlayerProgress
- Shard additions sync immediately on reading completion (not deferred to zone exit)
- Cosmic gate access is computed client-side from the shard list (no server round-trip needed)

---

## 8. Event Logging (Telemetry)

### 8.1 Event Format

Every engagement event is logged for debugging and balancing:

```json
{
  "event_id": "PEXA",
  "zone_id": "knossos",
  "target": "fresco_bull_leaping",
  "timestamp": "2026-08-18T22:05:23Z",
  "depth_delta": 15,
  "running_depth": 75,
  "session_id": "abc123"
}
```

### 8.2 Logging Endpoint

Events are batched and sent to the Base44 API every 30 seconds or on zone exit:

```
POST /api/apps/{APP_ID}/entities/PlayerProgress
{
  "action": "log_engagement",
  "events": [ ...batch... ]
}
```

This enables post-launch balancing: if telemetry shows most players get Tier 1, the depth values need tuning. If most get Tier 4 on first run, the thresholds need raising.

---

## 9. Edge Cases

| Case | Resolution |
|------|-----------|
| Player disconnects mid-zone | Depth syncs on next login when zone is re-entered. Lost progress = events since last 30s batch. |
| Player completes zone in under 2 minutes | Depth will be very low → Tier 1. This is correct behavior. Speed without engagement = a glimpse. |
| Player examines every artifact, solves every puzzle, but skips all dialogue | Depth will be high but not maximum. Tier 3 likely. Missing PLIS gains. Correct. |
| Player replays zone 10 times | Depth caps at 1000. Replay bonus compounds but is clamped. Max shards from this zone = 3 (one per symbol). Further replays add no new shards but can improve vision tier. |
| Player skips vision | NSKP penalty applies. On next replay, replay_bonus is reduced by 25. The vision can still play on future replays — skipping doesn't remove it, just diminishes future quality. |
| Player reaches endpoint without engaging with anything | Depth = 0 → Tier 1. 5-second glimpse. This is valid. |
| Two engagement categories tie for highest in Tier 4 | Earliest timestamp wins. Deterministic. |
| Player selects same symbol on replay | No new shard granted (already has it). Player is informed via a subtle visual cue (the symbol glows briefly, no popup). Depth still accumulates. |

---

## 10. Tuning Parameters

All values in this document are tuning parameters. The following are the initial values; final values should be determined through playtesting:

| Parameter | Initial Value | Tuning Rationale |
|-----------|--------------|-----------------|
| zone_depth_cap | 1000 | Arbitrary; calibrated so Tier 4 requires ~4 replays of genuine engagement |
| replay_bonus_multiplier | 0.25 | Carries forward 25% of previous depth. Prevents one perfect run from trivializing the system. |
| Tier 1 threshold | 0-30% | Generous — any engagement should reach at least Tier 1 |
| Tier 2 threshold | 31-60% | Moderate engagement over 1-2 runs |
| Tier 3 threshold | 61-85% | Deep engagement over 2-3 runs |
| Tier 4 threshold | 86-100% | Requires sustained, multi-run deep engagement |
| PPUZE value | +30 | Understanding a puzzle on first try is the strongest single engagement signal |
| PHCH value | +50 | Hidden challenges are the deepest optional engagement; highest reward |
| NSKP penalty | -25 | Skipping a vision is the strongest negative signal; applies forward, not retroactively |
| Silence duration | 10 seconds | Long enough to feel deliberate; short enough not to frustrate |

---

## 11. Integration Points

### 11.1 Existing Systems

| System | Integration | Direction |
|--------|------------|-----------|
| PlayerProgress entity | Read: replay_bonus, previous shards. Write: depth, shards, engagement profile. | Bidirectional |
| Base44 API | Sync on zone exit and shard acquisition. Batch telemetry every 30s. | Write |
| Godot GameManager | Receives zone state transitions. Manages scene loading for vision content. | Bidirectional |
| Music System | Receives tier number. Plays tier-appropriate audio. | Read |
| Catacomb Hub Navigation | Receives "zone complete" signal. Unlocks next zone or returns player to hub. | Write |
| Cosmic Gate System (cosmology level) | Reads shard inventory. Computes gate access. | Read |

### 11.2 Future Systems

| System | Integration | Status |
|--------|------------|--------|
| Achievement/Steam System | Vision tier reached could trigger Steam achievements | Planned |
| Leaderboard | Not applicable — RVS is personal, not competitive | N/A |
| Social/Multiplayer | Shard collections could be displayed in a shared space | Future consideration |

---

## 12. Testing Criteria

### 12.1 Unit Tests

| Test | Input | Expected Output |
|------|-------|----------------|
| Depth clamp | depth = -50 | 0 |
| Depth clamp | depth = 1500 | 1000 |
| Tier determination | depth = 250, cap = 1000 | TIER_1 |
| Tier determination | depth = 450, cap = 1000 | TIER_2 |
| Tier determination | depth = 700, cap = 1000 | TIER_3 |
| Tier determination | depth = 900, cap = 1000 | TIER_4 |
| Replay bonus | previous_depth = 400, multiplier = 0.25 | 100 |
| Shard dedup | player already has "vitality", selects bull again | No new shard, no error |
| Gate access | shards = ["vitality", "authority", "eternity"], gate = Jupiter (needs 3 from different zones) | true if shards are from 3 different zones |
| Gate access | shards = ["vitality", "authority"], gate = Mars (needs 2 of: Force, Authority, Vitality) | true |
| Gate access | shards = ["harmony", "expression"], gate = Pluto (needs 2 of: Transformation, Fate, Enlightenment) | false |

### 12.2 Playtest Scenarios

| Scenario | Method | Success Criteria |
|----------|--------|-----------------|
| Speed run | Complete zone in <5 minutes | Player receives Tier 1 vision |
| Thorough first run | Examine everything, solve all puzzles, listen to all NPCs | Player receives Tier 2 (not 4 — Tier 4 requires multiple runs) |
| Multi-run deep engagement | Replay 4 times with full engagement each time | Player receives Tier 4 on 4th run |
| Skip everything | Rush to endpoint without engaging | Player receives Tier 1. No crash. No error. |
| Skip vision | Press skip during vision | NSKP penalty applied. No crash. Next replay has reduced bonus. |
| Gate without shards | Approach Pluto gate with no matching shards | Gate is opaque. No error message. No popup. Player can walk away. |
| Gate with shards | Approach Pluto gate with Transformation + Fate shards | Gate becomes readable. Player can enter. |

---

## 13. Changelog

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-08-18 | Initial formal specification. Includes state machine, depth formula, tier definitions, reading mechanic, shard system, cosmic gate integration, data model, edge cases, tuning parameters, and testing criteria. |

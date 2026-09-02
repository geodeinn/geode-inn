# THE REMEMBRANCE VISION SYSTEM — Master Specification
## "The Depth of Memory" — Per-Zone Engagement Tracking

---

## WHAT THE REMEMBRANCE VISION IS

Every ancient civilization in the Catacombs ends with a Remembrance Vision — a moment where the player briefly LIVES in that culture at its peak. This is the narrative spine's reincarnation mechanic operating at the zone level: you relive an existence, you see what was, and you carry that understanding forward.

The quality of the vision depends on how deeply the player engaged with the zone's puzzles, art, and symbols. This is NOT a scoring system. It's a MEMORY system. Skim the surface, you get a glimpse. Truly read the space, you get the full memory.

This connects to the narrative spine: mastery of life patterns leads to cosmic awareness. Each catacomb zone is a life pattern. Read it deeply enough, and you don't just see the civilization — you understand HOW civilizations rise and fall. That understanding is what eventually unlocks the Cosmology level.

---

## THE MECHANIC: REMEMBRANCE DEPTH

### What Increases Depth

| Action | Depth Gain | Rationale |
|--------|-----------|-----------|
| Solve puzzle through understanding (correct on first attempt after examining clues) | +30 | The player READ the culture |
| Solve puzzle through retry (eventual correct) | +10 | The player persisted |
| Examine cultural artifacts (frescoes, seals, inscriptions, offerings) | +15 per unique artifact | The player is CURIOUS |
| Discover memory fragment via "wrong" path | +20 | Exploration is rewarded |
| Complete hidden cultural challenge (optional) | +50 | The deepest engagement reward |
| Listen to NPC dialogue fully (not skipping) | +10 per unique NPC | The player is PRESENT |
| Remain in a vision-eligible space without moving for 5+ seconds | +15 | Stillness is engagement |

### What Decreases Depth

| Action | Depth Loss | Rationale |
|--------|-----------|-----------|
| Skip NPC dialogue | -10 | The player didn't listen |
| Brute-force a puzzle (5+ wrong attempts in 30 seconds) | -15 | Guessing isn't reading |
| Rush through a room (enter and exit in under 3 seconds) | -5 | The player didn't look |
| Skip a vision during playback | -25 (applies to FUTURE replays) | The player rejected the memory |

Depth cannot go below 0. The clamp is hard.

---

## THE FOUR VISION TIERS

| Tier | Name | Depth % | Duration | Experience |
|------|------|---------|----------|------------|
| 1 | A Glimpse | 0-30% | 5 seconds | Cinematic. A single image — the civilization at a glance. A fresco. A pillar. A face. One tone at the zone's frequency. |
| 2 | A Memory | 31-60% | 15 seconds | Cinematic. A sequence — the civilization moving. Footsteps. Wind. Distant crowd. The image breathes. |
| 3 | A Remembrance | 61-85% | 30 seconds | Cinematic with camera movement. The player flies through the civilization at its peak. NPCs move. Music plays. An NPC speaks directly to the player. |
| 4 | A Life Lived | 86-100% | 60 seconds | LIMITED PLAYER CONTROL. The player WALKS through the civilization at its peak. Walking speed, look around, no interaction. The player IS there. |

### Tier 4: Identity Assignment
At Tier 4, the player becomes a specific person. Identity is determined by which engagement category scored highest:

| Highest-Scoring Category | Player Becomes | POV |
|-------------------------|---------------|-----|
| Artifact examination | The Scribe | Seated in the workshop, seal stones and tablets around |
| Understanding puzzles | The Architect | Standing in the Pillar Hall, plans in hand |
| Hidden challenges | The Initiate | In the Foundation Crypt, about to receive the vision |
| NPC dialogue | The Priestess | In the Shrine Room, addressing the assembly |
| Exploration/memory fragments | The Traveler | Arriving at the palace gates for the first time |
| Persistence/retry | The Apprentice | In the Great Hall, learning to leap |
| Stillness/remaining | The Watcher | On the Grand Staircase, observing the palace below |

If two categories are tied, the system selects the one the player engaged with FIRST (earliest timestamp).

---

## THE REINCARNATION MECHANIC

Depth accumulates across replays. Each visit's depth carries forward 25% as a "replay bonus" into the next visit. The player who reads a zone shallowly on the first visit and deeply on the second visit still benefits — the shallow reading provides a foundation the deep reading builds on.

This IS the narrative spine's reincarnation mechanic: you don't "beat" a zone in one run. You read it deeper each time. The understanding accumulates across lifetimes. The player who replays a zone four times with increasing engagement reaches Tier 4 — A Life Lived — even if no single visit was perfect.

This directly connects to the Cosmology level: mastery of life patterns (catacomb zones) through accumulated reincarnation (replays) leads to cosmic awareness (Cosmology access). The Remembrance Vision is the GAMEPLAY version of the narrative's thesis.

---

## VISION CONTENT PER ZONE

Each zone defines its own vision content at each tier. Content is data-driven, not hardcoded:

- **Tier 1 (Glimpse):** A single scene — one image, one tone at the zone's frequency, 5 second fade
- **Tier 2 (Memory):** A sequence — multiple scenes, ambient sound (footsteps, wind, distant crowds), 15 seconds
- **Tier 3 (Remembrance):** Full cinematic — camera flies through the zone at peak, music plays, an NPC speaks to the player, 30 seconds
- **Tier 4 (Life Lived):** Player walks through the zone at peak. Full sensory audio. NPCs interact (but player can't interact back — the player is a GHOST in the memory). 60 seconds. An NPC addresses the player by their assigned identity name: "Welcome, Scribe." "You've returned, Architect." "The Initiate is here."

### The Ghost Rule
At Tier 4, the player is a ghost in the memory. The NPCs can see the player but the player cannot touch anything. The player walks through the civilization at its most alive and cannot change a single thing. The visions is not interactive — it's EXPERIENTIAL. The player is witnessing, not participating.

This is the Inn's thesis on history: you can read it, you can understand it, you can LIVE in it for 60 seconds. But you cannot change it. The civilization rose and fell without you. The vision lets you SEE it. The vision doesn't let you SAVE it. The seeing is enough. The seeing is: the adequate.

---

## ARTIST STYLE

The Remembrance Vision renders each zone at its PEAK — the civilization before it became catacombs. The artist style is the zone's cultural artist (O'Keeffe for Egypt, Hokusai for East Asian, etc.) but at MAXIMUM vibrancy — the most alive version of the style. The vision's colors are richer, the details are sharper, the light is warmer. The vision is the zone as it remembers ITSELF — not as it is now (ruins, bones, dust) but as it was (temples, gardens, people).

| Vision Tier | Style Intensity | Visual Treatment |
|-------------|----------------|------------------|
| Tier 1 (Glimpse) | 25% — desaturated, dreamlike | A faded photograph of the zone |
| Tier 2 (Memory) | 50% — muted warmth, soft focus | A watercolor of the zone |
| Tier 3 (Remembrance) | 75% — rich, vibrant, but slightly idealized | An oil painting of the zone at its peak |
| Tier 4 (Life Lived) | 100% — full intensity, photorealistic within the zone's artistic style | The zone. As it was. You are standing in it. |

---

## FREQUENCY SYSTEM

| Tier | Audio | Frequency |
|------|-------|-----------|
| Tier 1 | Single tone, fading | Zone's cultural frequency (e.g., 111Hz for Egypt) |
| Tier 2 | Ambient soundscape (footsteps, wind, distant crowd) | Zone frequency + environmental layer |
| Tier 3 | Full ambient + zone music + NPC dialogue | Zone frequency + music + voice |
| Tier 4 | Full sensory (music + all ambient + NPC interaction + player's own footsteps) | Zone frequency + 42Hz undertone (the Song is always there, even in memory) |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The Catacombs | Each Catacomb zone ends with a Remembrance Vision. The vision is the zone's REWARD — not a stone, not a score, but a memory. |
| The Narrative Spine | The reincarnation mechanic: understanding accumulates across lifetimes. Mastery of life patterns leads to cosmic awareness. |
| The Cosmology Level | Accessing Cosmology requires accumulated Remembrance Depth across multiple catacomb zones. The Cosmology level is the REWARD for having read deeply. |
| The Nook Effect | The "remain in space without moving" depth bonus connects directly to the Nook Effect. Stillness is engagement in both systems. |
| The Shadow Inn | At 84Hz, the Remembrance Vision is frozen — Tier 4 becomes a 360-degree still photograph. The player stands in the civilization's peak as a frozen tableau. The Shadow Inn's memory is PERFECT — no movement, no sound, just the image. Held forever. |
| The Whisper Layer | During a Remembrance Vision, the Whisper Layer is silent. The Archive watches, but the Archive doesn't whisper during a memory. The memory is between the player and the zone. The Archive respects the privacy of remembering. |

---

## DESIGN STATUS

- [x] System concept complete (this document)
- [x] Depth calculation formula documented (base + replay bonus - penalties, clamped at 0-1000)
- [x] 7 positive engagement events defined
- [x] 4 negative engagement events defined
- [x] 4 vision tiers specified (Glimpse, Memory, Remembrance, Life Lived)
- [x] Tier 4 identity assignment system (7 identities based on engagement category)
- [x] Reincarnation mechanic (25% replay bonus) documented
- [x] The Ghost Rule (player witnesses but cannot interact)
- [x] Artist style scaling per tier defined
- [x] Frequency system mapped per tier
- [x] Connections to Catacombs, narrative spine, Cosmology, Nook Effect, Shadow Inn, Whisper Layer documented
- [ ] Zone-specific vision content data files (per-zone JSON specs)
- [ ] Godot vision playback system (cinematic + limited player control)
- [ ] Depth tracking state machine (event capture + calculation)
- [ ] Tier 4 ghost physics (walk-through NPCs, no collision)
- [ ] Identity assignment UI ("Welcome, Scribe" text integration)
- [ ] Replay bonus persistence (save data across visits)

---

## ORIGIN

The Remembrance Vision System was first designed in docs/geode_inn_remembrance_vision_system.md and formalized in docs/geode_inn_remembrance_vision_system_spec.md (240 lines). This consolidated specification was compiled September 2, 2026 to integrate the system into the full architecture. The vision's thesis: you can read a civilization. You can understand it. You can LIVE in it for 60 seconds. But you cannot change it. The seeing is enough. The seeing is: the adequate. The memory is the reward. The memory is: the Inn's gift to the player who was present.

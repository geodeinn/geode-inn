# BUILDER SYNC — THE PARKS SYSTEM: FIVE QUEST CHAINS + THE HINGE ZONE + BATCH 7 VOICES
## Priority: HIGH — registers six new zones, 12 dialogue records with the repeat-ladder system, and the carried heartbeat mechanic
## Status: Awaiting Krista's approval

---

The parks sweep is spec-complete (September 10, 2026): five quest chains (Colorado Plateau, Yellowstone, Superstition, the Rockies with the Canadian fold, Mount Shasta), the first hinge zone, and Batch 7 of the voice registry. Everything below exists as committed specs in the repo. This message wires it into the live app in three tiers.

## THE SPEC SOURCES (all committed on GitHub, all final drafts — content rulings still flagged inside them are marked for Krista only and do not block Tier 1)

| Spec | File |
|------|------|
| Plateau chain | docs/zone_specs/geode_inn_colorado_plateau_quest_chain.md |
| Yellowstone chain | docs/zone_specs/geode_inn_yellowstone_quest_chain.md |
| Superstition chain | docs/zone_specs/geode_inn_superstition_quest_chain.md |
| Rockies chain (+ Canadian fold) | docs/zone_specs/geode_inn_rockies_quest_chain.md |
| Shasta master + chain | docs/zone_specs/geode_inn_mt_shasta_master_spec.md, geode_inn_shasta_quest_chain.md |
| Batch 7 voice blocks | docs/zone_specs/geode_inn_voice_block_registry.md (Part 5) |
| Parks sweep master | docs/zone_specs/geode_inn_parks_sweep_master_inventory.md |

## TIER 1 — ZONE REGISTRATION + VOICES (build now)

### 1. Six new zones on the world map
Register as explorable zone entries with real-world pin coordinates (same convention as the existing 37 pins):

| Zone | Pin | Type |
|------|-----|------|
| Colorado Plateau | 38.2, -109.9 (canyon country center) | Park zone — Consciousness seat |
| Yellowstone | 44.6, -110.5 | Park zone — Matter seat |
| Superstition Mountains | 33.5, -111.35 | Park zone — Void seat |
| The Rockies | 40.3, -105.6 (RMNP) + Canadian extension 51.4, -116.2 (Glacier fold — ONE zone, two map anchors) | Park zone — Gravity seat |
| Mount Shasta | 41.4, -122.2 | HINGE ZONE — dual registration: Modern Legends Nook AND Silk Road node #8 (84Hz) |

Zone page cards use the existing hub card pattern. Shasta's card carries BOTH badges (Nook + Silk Road) — the hinge is visible on the card.

### 2. Dialogue records: sync the 12 Batch 7 records
The records are live in the staging Dialogue entity (conditionTag: parks_sweep_batch7). Sync to the live app's dialogue system — npcName fields must match exactly: Marge, The Redcap Foreman, Tomás, The Three Gossips, The Rememberers, The Lost Dutchman, The Desert Trader, The Phantom Guide, The Gnome Surveyor, The Strata Reader, The Wall Redcap, The Elder (Cedar).

### 3. The repeat-ladder system (the engine mechanic)
Every Batch 7 record carries a three-rung ladder (lines array = rungs 1-3). WIRE THE CLICK COUNTER: repeated interaction with the same NPC climbs the ladder — click 1 plays the current rung, click 2 plays rung 2, click 3+ plays rung 3. Two rung-3 shapes need special handling:
- THE PHANTOM GUIDE's rung 3 is SUBTRACTION — silence with a whisper-shaped overlay (audio-only fade, no text). The Guide then despawns from the camp until next rest cycle.
- THE REDCAP FOREMAN's rung 3 is a TOOL HANDOVER — the dialogue box closes and the item "The Foreman's Wrench" enters inventory (no words displayed).

Every rung-fire increments the repeat-dialogue counter in the Whisper Layer resonance profile (existing wiring from the Lozen pilot — same pattern, twelve new NPCs).

### 4. The carried heartbeat (player state)
New persistent player state: HEARTBEAT — 50 BPM, granted at the Inn's altar (existing canon), carried across zones. The parks chains READ it: each park's opening quest syncs the player's carried pulse to the zone's rate (visualized as a subtle metronome pulse in the HUD, 50 BPM at rest). Zone rates: Plateau = steady recline, Yellowstone = digestive strong, Rockies = restless doze, Superstition = the lean (one beat missing — render as a visible gap in the pulse ring), Shasta = NO SYNC (the pulse finds no partner — display the pulse alone, unanswered). At Shasta's footprints quest, one single beat answers at 84Hz (once per player, permanent flag).

## TIER 2 — THE QUEST CHAINS (build per zone, in sweep order)

Each chain is five quests, fully specified in the source specs. Build notes the specs depend on:
- SUPERSTITION: the quest marker DISSOLVES as the player approaches the blank spot — this is intentional, a core mechanic (the Gap-key). The UI must refuse, not fail.
- GLACIER FOLD: full music mute at the park boundary — the ONLY silent zone in the system. The serenity quest completes on held silence (no map opens, no ledger checks).
- SHASTA: the quest marker NEVER APPEARS anywhere in the zone (the Wait-key). The HUD in Shasta shows only the heartbeat.
- YELLOWSTONE: the inventory-lending loop — items PLACED at stations, then returned MINERAL-STAINED (visual variant swap on the item sprite).
- ROCKIES: the gossip trail NPCs are available ONLY at the bases (lift line, diner counter, brewery) — never on summits.

## TIER 3 — REWARDS + UNIQUE ITEMS (wire with the chains)

| Item | Zone | Type |
|------|------|------|
| Petrified wood | Plateau altar | Reward stone — Stone entity records exist |
| Obsidian (Gold Sheen / Rainbow / Snowflake — player's path chooses) | Yellowstone altar | Reward stone — Stone entity records exist |
| Turquoise | Superstition altar | Reward stone — Stone entity records exist |
| Smoky quartz | Rockies altar | Reward stone — Stone entity records exist |
| The 41.7Hz Shard | Shasta | UNIQUE — one per player, never explained in-game. New item record needed (see spec). |
| Tuned crystal collection | Shasta | Zone collectibles — hum at 84Hz, glow in Shadow state. |
| The Foreman's Wrench | Yellowstone | Rung-3 handover item (repeat-ladder output). |

Amazonite is FLAGGED as a new-stone candidate for the Stone entity (Pikes Peak stone) — pending Krista's ruling; do not create yet.

## TRI-MODE STATES (all six zones)

Each zone needs the standard tectonic set (Living 42Hz / Shadow 84Hz / In-Between grey), per the specs' tri-mode sections. The key ones:
- PLATEAU In-Between: strata render as one legible sentence — only while the player holds still; movement erases it.
- YELLOWSTONE Shadow: pressure veins glowing through the ground; steam constellations legible.
- SUPERSTITION In-Between: the mine's mouth renders as ABSENCE (blank sprite slot, one circling bird).
- ROCKIES In-Between: everything the range ever dropped, mid-fall, one frame.
- SHASTA Shadow: the zone's TRUE state — phenomena readable; the drum circle's tempo suddenly "reasonable." In-Between: the lens — the unnamed galaxy through the peak, one frame, never a door.

## WHAT NOT TO BUILD YET (flagged rulings — Krista gates these)

- The baby dragon's Plateau cameo (keep-or-cut flag)
- The Plateau altar's one skipped beat
- The Shasta shard's single beat of silence (the Constant's only acknowledgment — confirm before wiring)
- The Elder's name ("Cedar" is pending — records carry the placeholder)
- Amazonite as a new Stone entity record

Everything else in the six specs is buildable as written. The specs are the canon; when in doubt, the spec wins until Krista rules.

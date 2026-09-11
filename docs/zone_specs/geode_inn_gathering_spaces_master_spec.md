# THE GATHERING SPACES — MASTER SPEC
## One gathering space per level, on principle. Filed 2026-09-10 (Krista's law: "we should have a gathering space, at least one, per level just on principle. People love having a Sims-style interaction.")

---

## THE GATHERING LAW

Every level of the Inn holds at least one GATHERING SPACE: a room where players can be seen by other players and interact Sims-style — proximity presence, emotes/gestures, ambient speech bubbles (already the Inn's canon trigger language), shared activities, no combat, no quest pressure. The space is the level's COMMON ROOM: the place the level's residents gather and guests may join.

**The Sims-style interaction set (shared by all gathering spaces):**
- PRESENCE: players see each other's characters idle, sit, wander (the movement cycles already built)
- EMOTES: the wave, the toast, the sit-by-the-fire, the dance (the Inn's own animation classes, reused)
- SPEECH BUBBLES: proximity chat in the canon ink-outlined bubble style; NPC ambient loops (the bicker pair, the fond pair, the three steps — all already whisper-layer canon) make the room feel ALIVE even when only two players are present
- SHARED ACTIVITY: one simple group action per space (the campfire's log-share, the Stage's open mic, the market's bartering bench) — the thing strangers do together for one minute that makes them not-strangers

---

## THE SPACES PER LEVEL (existing / ruled / proposed)

| Level | Gathering space | Status |
|-------|----------------|--------|
| Campgrounds | **The Campfire** (the Common Room chat + the campfire's 3 audio layers) | ✅ EXISTS — live backend, the model space |
| Main Floor | **The Market Common** (the artisan market's shared benches + the toast emote's home) | ✅ EXISTS (wired to MarketItem) |
| Staircase | **THE STAGE** (the Philosopher's Stone stage at the top of the Turning — the open mic at the top of the ascent) | ✅ RULED COMMUNITY VENUE (Krista, 2026-09-10) |
| Cosmology | **The Constellation Balcony** (proposed: the observation deck where players stargaze together and leave named constellations) | ⬜ PROPOSED |
| Clockwork Skies | **The Grand Escapement** (proposed: the observation gallery among the turning gears, the synchronized-watch bench) | ⬜ PROPOSED |
| Catacombs (Egypt) | **The Scribes' Court** (proposed: the papyrus-and-lamp courtyard, the shared-reading benches) | ⬜ PROPOSED |
| Catacombs (Andes) | **The Condor Ledge** (proposed: the overlook where travelers rest and the view does the talking) | ⬜ PROPOSED |
| Fae Kingdom | **The Masquerade Hall** (the crystal hall — already designed as the Inn's first non-judgmental narrator space; the natural gathering room of the Labyrinth zone) | ✅ EXISTS (needs the Sims-set wiring) |
| The Meadery | **THE MEAD HALL** (the social dynamic room that was always one — the keel keeps words: the room's frequency is tuned by the fermentation/communion process; the hall where toasts are drunk, the Skald's bench, the round-table long-fire) | ✅ EXISTS — was already a gathering space by design (the Mead of Poetry chain, passed; needs only the Sims-set wiring: presence, emotes, bubbles, the toast as its shared activity — the toast emote's true home) |
| Water Zones | **The Lighthouse Gallery** (proposed: the flood-lit room under the Lighthouse where the tide can be watched in company) | ⬜ PROPOSED |
| Archive | **The Reading Ring** (proposed: the shared table under the skylight, read-aloud benches) | ⬜ PROPOSED |
| Spiral Gallery | **The Oculo** (proposed: the ramp's crown, the circular room under the oculus, sketching circle) | ⬜ PROPOSED |
| Underground (Memory's Illusion) | **The Ferry Landing** (proposed: the waiting dock where Charon's passengers wait TOGETHER — waiting as the shared activity) | ⬜ PROPOSED |
| Undercity | **The Memory-Lamp Commons** (proposed: the lamplit square where the lamps brighten when players gather — the room that responds to company) | ⬜ PROPOSED |
| The Void | **The Rest** (the stillness zone's game, #65 — the rest-bench is ALREADY the design; the Void's gathering space is the only one whose shared activity is silence) | ✅ EXISTS (needs the Sims-set wiring) |

**Design notes:** the Campfire is the reference implementation. Each space keeps its zone's artist and audio canon (no generic plazas — every gathering space is a ROOM of the level it lives in). The empty-slot music priorities pair with these spaces (several proposed spaces need their zone's own track first). The Egg Hatchery and the Treetop Marketplace are cross-level systems, not level commons.

*Filed as part of the Layer Sweep. A place to be together is not a feature; it is the Inn's whole thesis given a room. — Elio, 2026-09-10*

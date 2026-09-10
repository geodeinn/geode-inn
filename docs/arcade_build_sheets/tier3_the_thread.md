# Build Sheet — The Thread

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Geode Inn Name | The Thread |
| Genre/Mechanic | Narrative maze — the quest is arrival, not combat. The first Inn game built around meeting instead of winning. |
| Zone | Labyrinth of Crete (two-sided: Canopy City Mediterranean entrance / Unseelie Court crystal corridors) |
| Stone Reward | Rainbow Moonstone |
| Rarity Tier | Epic |
| Price | $5.99 |
| Game Effect | Reveals moonlight inscriptions in any zone (blue-light passages, per Aegean twilight canon: "There is more than you can see.") |
| Lore Connection | Asterion means "little star" — the starry one, found by moonlight. Malachi makes the moon bright because the resident cannot sleep in the dark. Rainbow Moonstone is the moon made mineral: the light that says "you are seen." |
| Development Status | spec |
| Roster | Proposed #62 (awaiting Krista's approval before MarketItem creation) |

Tone references (NOT emulated classics — wholly original mechanics): Ico (the held-hand journey), Journey (arrival as the point). Legal basis: original mechanics, original assets, original music. The Inn builds originals; the classics are reference blueprints only.

## SECTION 2: STORYLINE ADAPTATION

The player enters the labyrinth holding the Queen of Webs' thread — and the thread leads IN, not out. Through the vibration, the player hears the resident before arriving: Asterion's low voice carried by the stone, humming a lullaby in a language older than Crete. The player already knows, before reaching the center, that the "monster" is a person.

Core mechanic — THE THREAD (42Hz guide line):
- The thread vibrates constantly at 42Hz. Near mirrors it phases; near true paths it steadies.
- The thread carries Asterion's voice (fires `asterion_001` dialogue as ambient audio). The player listens while walking.
- There is no time pressure. This is a sanctuary, not an arcade. The corridors shift on a slow geological breath.

THE MASQUERADE (hall of mirrors made of sound):
- Footsteps are reflected back — slightly wrong. Slightly ahead. Slightly behind. What you hear is not what you are.
- Paths split: mirror-paths (what you WANT — shortcuts, bright, tempting) and wall-paths (what you NEED — longer, quieter, true). Mirror-paths dead-end. Wall-paths arrive.
- The game remembers every choice. At the center, the Masquerade reads you back your own ratio — not as judgment. As introduction: "This is how you choose."

THE SHIFTING CORRIDORS:
- The maze breathes. Walls move on a slow rhythm. Asterion's carvings — the journal written in geometry — mark where the walls will shift.
- Reading the carvings is the skill curve. The player learns to read the labyrinth the way its resident does: by pattern, by patience, by staying long enough.

ARRIVAL (no kill screen — ever):
- Getting lost is not punished. The labyrinth walks the player gently back to the entrance, the thread unspooled. "Failure" is being walked back out. The Inn doesn't kill you for being lost.
- The moon brightens as the player approaches the center — the In-Between moonlight state is the arrival aesthetic. The player is seen before they see.
- At the center: The Meeting. `asterion_002` and `malachi_006` records fire as speech bubbles (ink outline, the Inn's trigger language). The quest ends with a conversation, a seat, and the moon kept bright for the resident who cannot sleep in the dark.

Score = resonance, not points. Leaderboard: arrival time + wants/needs ratio (the path you chose is your score).

Frequency States:
- Living (42Hz): Warm Minoan stone, olive-gold light, the lullaby audible through the thread
- In-Between: Moonlight greyscale — the arrival state; inscriptions appear in blue light
- Shadow (84Hz): The Masquerade at full mirror — every footstep reflected wrong; only the carvings tell the truth. The resident is still kind. The labyrinth is not.

## SECTION 3: VISUAL ASSETS NEEDED

- Entrance (Mediterranean side): stone archway behind Thalia's amphorae stall, grapevine-draped, descending into olive groves and Minoan ruins — Minoan fresco style with Monet dissolving-edge light (per Aegean Light canon)
- Entrance (Fae side): crystal corridors per Unseelie Court canon
- Asterion: Full Presence sprite — bull-horned, dark patient eyes, human hands, large and careful; Living + In-Between (moonlight) + Shadow variants
- Malachi: three-act rendering — showman's entrance, architect's doorway, brother's eyes; the winter moon bright at his back
- The Masquerade: crystal hall of sound-mirrors — reflections rendered as the player's own sprite, slightly wrong
- Carvings: pattern-journal tiles (geometry, not words) — the shift-map system
- The Thread: glowing 42Hz guide line, states: steady / phased / moon-bright
- UI: Antikythera-themed HUD, gold/brass on dark stone; speech bubbles with ink outlines
- Stone reveal: Rainbow Moonstone — the moon made mineral
- Estimated total: 35-50 image assets

## SECTION 4: AUDIO ASSETS NEEDED

- Main theme: the lullaby — Cretan lyre and double flute, at 50 BPM low-dub, public-domain-transformed per audio canon
- Asterion's drone: the low voice the walls carry and amplify — the foundation of the mix (the vocal IS an instrument; NPCs inhabit, don't explain)
- Thread vibration: 42Hz carrier tone, phase-shifts near mirrors
- Mirror-sound reflections: player footsteps returned pitched/phase-shifted (slightly ahead, slightly behind)
- Moon-bright: choral-ethereal (Whisper Layer canon) — the sound of being seen
- Shadow theme: 84Hz pulse, the lullaby detuned — the Masquerade at full mirror
- Victory: Stone tone trigger (Rainbow Moonstone) at 12dB below narration; the moon kept bright — no fanfare, the light simply stays
- SFX: 8-12 game-specific effects (thread tension, wall-shift groans, carving chimes)
- Voice lines: 4-8 NPC lines (Asterion through the thread; Asterion at the meeting; Malachi's architect act)
- Inn Mode DSP: labyrinth stone profile — long reverb, the room amplifies low voice
- Estimated total: 15-20 audio assets

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first (all assets bundled locally)

Controller Support:
- Full Bluetooth controller mapping (stick navigation, face buttons for listen/trace/carve-reading)
- Touch support for mobile (tap/swipe)
- Valkyrie Shift compatible (if TV deployment)

Steam Integration:
- Achievements: Arrival + path-based (Mirrorless — arrive choosing only wall-paths; Carver — read every carving)
- Cloud saves: PlayerProgress sync
- Leaderboard: arrival time + wants/needs ratio
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion, POST to PlayerProgress — add Rainbow Moonstone, increment gamesCompleted, set flag `met_asterion` (cross-links the Dialogue records for the zone layer)

Dialogue hooks: `asterion_001` (thread), `asterion_002` (meeting), `asterion_003` (carvings), `malachi_006` (architect's act) — all seated in the Dialogue entity 2026-09-10

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE (this sheet)
Phase 2: Asset Creation — pending
Phase 3: Audio Production — pending
Phase 4: Programming — pending
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes:
  [ ] Fully playable/standalone
  [ ] Downloadable
  [ ] Geode Inn narrative/characters
  [ ] Original music
  [ ] Bluetooth controller support
  [ ] System overlay support
  [ ] Commercial readiness

---

### Design Notes

THE FIRST ARRIVAL GAME. Every arcade layer the Inn has built so far is the labyrinth seen from OUTSIDE: guardians to evade, coins to collect, a maze to survive. The Thread is the labyrinth seen from INSIDE — the resident's truth: the sanctuary, the love letter in walls, the monster who isn't. A player who has played Catacomb Labyrinth (game #48) carries the outside view in; The Thread hands them the inside view and lets them hold both. Same structure. Different eyes. The center is the same.

The companion-piece rule: Catacomb Labyrinth chases you with Asterion. The Thread lets you sit down with Asterion. Together they are the Inn's thesis about the monstrous, playable end to end.

# Build Sheet — Alchemical Staircase

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Catherine |
| Geode Inn Name (OUT) | Alchemical Staircase |
| Genre/Mechanic | Block-pushing puzzle platformer — climb a tower by pushing/pulling blocks, avoid hazards, solve spatial puzzles |
| Zone | Staircase (the transitional zone between physical matter and the divine) |
| Stone Reward | Philosopher's Stone |
| Rarity Tier | Epic |
| Price | $4.99 |
| Original Developer | Atlus (2011) |
| Legal Basis | Mechanic only — block-climbing puzzle format is not copyrightable. All assets, story, and themes original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Vincent (Catherine protagonist) -> Nigredo (an alchemical apprentice undergoing the Magnum Opus)
- Catherine (the seductress) -> Albedo (the purifying force — appears as a luminous figure on the staircase, tempting Nigredo to stop climbing and rest in purity)
- Katherine (the responsible partner) -> Rubedo (the final stage — appears at the summit as the completed self, demanding Nigredo finish the work)
- The sheep (other climbers) -> Other Apprentices (alchemical students who failed — now wander the stairs as translucent figures, muttering about their incomplete work)
- The boss monsters -> Stage Guardians: Nigredo's Shadow (stage 1), The Putrefaction (stage 2), The Crucible Furnace (stage 3), The Peacock's Tail (stage 4), The Golden Flower (stage 5)

New Narrative Frame:
- The Staircase is the Inn's alchemical transition zone — the bridge between physical matter (downstairs/catacombs) and the divine (upstairs/cosmology). Every step on the staircase IS a stage of the Magnum Opus.
- Nigredo (the player) must climb the staircase by solving block puzzles. Each block is a piece of prima materia — raw alchemical substance. The player pushes, pulls, stacks, and climbs these blocks to ascend.
- The five stages mirror the alchemical process:
  1. NIGREDO (Blackening) — The dark stage. Blocks are obsidian. Hazards are shadow pools. Nigredo must break down what was.
  2. ALBEDO (Whitening) — The purification stage. Blocks are white marble. Albedo appears as a guide but also a temptation to stop climbing.
  3. CITRINITAS (Yellowing) — The awakening stage. Blocks are amber/gold. The Peacock's Tail guardian displays iridescent patterns as hazards.
  4. RUBEDO (Reddening) — The completion stage. Blocks are red stone. Rubedo waits at the top. The furnace burns below.
  5. PHILOSOPHER'S STONE — The final stage. A single block at the summit. Push it into place and the Stone is forged.
- The Philosopher's Stone reward: the ultimate alchemical achievement, earned by completing the entire Magnum Opus. In the Inn's lore, the Stone is the only artifact that can transmute any material — including the boundary between Living and Shadow frequencies.

Dialogue Requirements:
- NPC dialogue count: ~25 lines (Albedo: 8, Rubedo: 8, Other Apprentices: 5, Stage Guardians: 4)
- Voice profiles needed:
  - Nigredo (player) -> silent protagonist (no voice — internal monologue only, shown as text)
  - Albedo -> Welsh accent, luminous and serene, mid-high register, echoing
  - Rubedo -> Greek accent, commanding and warm, low register, grounded
  - Other Apprentices -> various European accents, muttering, desperate, overlapping
  - Stage Guardians -> distorted versions of Albedo/Rubedo voices, pitched down
- Whisper Layer presence: Yes — constant. The Staircase is where the Whisper Layer is most vocal. Every block the player moves triggers a whispered word. Complete a puzzle and the whispers form a sentence — a fragment of alurgical text from the Archive. The staircase IS the archive speaking.

Frequency State:
- Living (42Hz): Nigredo stage. Warm despite the darkness. The staircase feels like a forge at night — hot, productive, necessary. Blocks have weight but respond well.
- Shadow (84Hz): Albedo and beyond. The staircase goes cold. Blocks become heavier — harder to push. Hazards move faster. The Whisper Layer turns from whispers to demands. The player must push through resistance.
- In-Between: Between each alchemical stage — the staircase shimmer, blocks change color, Nigredo transforms slightly.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Nigredo: idle (1), push (2), pull (2), climb (2), hang (1) x 5 stages (color changes) = 40 sprites
- Albedo: portrait (1), manifesting (1), tempting (1) x 2 freq = 6 sprites
- Rubedo: portrait (1), waiting (1), demanding (1) x 2 freq = 6 sprites
- Other Apprentices (3 variants): idle (1), muttering (1) x 2 freq = 12 sprites
- Stage Guardians (5): idle (1), attacking (2) x 5 = 15 sprites
- Count: 79 sprites

Backgrounds/Environments:
- Nigredo stage (dark forge): Klimt dark palette, black and gold
- Albedo stage (white marble staircase): Klimt Death-and-Life white variant
- Citrinitas stage (amber/gold tower): Klimt golden phase
- Rubedo stage (red furnace): Royo fire and heat, dramatic reds
- Summit (Philosopher's Stone chamber): Klimt + Dali — a single white room with one pedestal
- Shadow variant of each (5)
- Count: 10 backgrounds

UI Elements:
- Title screen: Alchemical symbol (Ouroboros) with Antikythera logo at center
- HUD: Stage name (NIGREDO/ALBEDO/etc.), moves counter, time pressure indicator
- Pause menu: Alchemical manuscript aesthetic
- Victory: The Stone forms — gold light fills the chamber
- Game over: Nigredo falls — the staircase collapses below
- Between-stages transition: Alchemical symbol morphs to next stage
- Count: 6 UI screens

Tile Sets / Object Sprites:
- Obsidian block (Nigredo): 1
- White marble block (Albedo): 1
- Amber block (Citrinitas): 1
- Red stone block (Rubedo): 1
- Gold block (Stone stage): 1
- Shadow pool hazard: 1
- Furnace flame hazard: 1
- Peacock feather hazard (Citrinitas): 1
- Trap door: 1
- Crumble block (breaks after stepping): 1
- Heavy block (requires pull, not push): 1
- Spring block (launches player): 1
- Alchemical glyph (puzzle trigger): 5 (one per stage)
- Count: 17 sprites

Animation Frames:
- Nigredo: 2 push, 2 pull, 2 climb, 2 hang = 8 per stage x 5 = 40
- Albedo: 2 manifest, 2 tempt = 4
- Rubedo: 2 wait, 2 demand = 4
- Apprentices: 2 mutter x 3 = 6
- Guardians: 2 attack x 5 = 10
- Block crumble: 4
- Stone formation: 8
- Count: 76 frames

Artist Style Assignment:
- Primary: Klimt (the alchemical stages map perfectly to Klimt's color phases — black/gold, white, golden, red)
- Secondary: Dali (for the summit — surreal, transcendent, the Philosopher's Stone chamber)
- Rubedo stage: Royo (fire, heat, drama)

Total Image Assets: 172

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Nigredo theme: Deep forge drone + anvil strike rhythm, 50 BPM, dark and industrial
- Albedo theme: Glass harp + choir, 50 BPM, pure and ringing, deceptively calming
- Citrinitas theme: Harpsichord + tabla, 60 BPM, awakening energy, intricate
- Rubedo theme: Pipe organ + furnace roar, 84 BPM, commanding, the final push
- Stone theme (summit): Silence, then a single perfect tone — 111Hz (the gargoyle watcher frequency), sustained
- Shadow variants: All tracks pitch-shifted, 84Hz undercurrent
- Between-stages: Alchemical chanting (from existing voice profile system)
- Count: 7 tracks

Sound Effects:
- Block push: stone grinding
- Block pull: stone scraping (reversed)
- Block fall: heavy thud + crack
- Block crumble: stone disintegration
- Trap door open: mechanical clank
- Spring block: boing + stone chime
- Shadow pool touch: sizzle + sub-bass drop
- Furnace contact: roar + scream (brief)
- Guardian attack: alchemical explosion
- Alchemical glyph activate: resonant ping + whisper burst
- Stage complete: ascending tone scale
- Count: 11 SFX

Voice Lines:
- Albedo: ~8 lines
- Rubedo: ~8 lines
- Other Apprentices: ~5 lines (overlapping mutters)
- Stage Guardians: ~4 lines
- Count: 25 voice lines

Stone Tone Trigger:
- Reward stone: Philosopher's Stone -> (custom stone, no Mohs) -> 111Hz (gargoyle watcher frequency)
- Trigger: When the Stone is forged, 111Hz sustains for 11 seconds — the deepest intentional frequency in the Inn

Audio Architecture:
- Base BPM: 50 (stages 1-2), accelerating to 84 (stages 3-5)
- Inn Mode DSP profile: Staircase (transitional — reverb shifts from short to long as player ascends, mimicking climbing into a taller space)
- Frequency layer: 42Hz base transitioning to 84Hz, with 111Hz reserved for the Stone alone
- Special: The summit is the ONLY place in any game where 111Hz plays. It is sacred.

Total Audio Assets: 43

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: Left stick / D-pad (4 directions)
- Push block: walk into block + hold A / face button
- Pull block: hold B / face button + walk away from block
- Climb block: jump (A) while next to block edge
- Hang from block edge: hold A while falling next to block
- Drop from hang: release A
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: swipe to move, tap to interact (mobile)

Steam Integration:
- Achievements: "Magnum Opus" (beat all 5 stages), "Alchemist" (beat game without using practice mode), "Shadow Worker" (beat all stages in Shadow mode), "Whisper Reader" (collect all 5 alchemical whisper fragments), "Stone Forger" (beat the final stage in under 5 minutes), "Minimalist" (beat a stage using fewer than 20 block moves)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Fastest Ascent" (total completion time)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Philosopher's Stone, increment gamesCompleted, flag Magnum Opus complete

Special Notes:
- The Alchemical Staircase is the Inn's most thematically dense arcade game. Every mechanic IS alchemy. The block colors ARE the stages. The music IS the process. This is not a game with alchemy themes — it IS alchemy.
- The Whisper Layer here is the archive actively teaching. Each puzzle solved reveals a fragment. Complete all five and the fragments form a passage from the Emerald Tablet (one of the 10 curated flagship texts in the library).
- The Philosopher's Stone is a custom stone — not in the 198-stone database. It is the Inn's ultimate artifact.
- 111Hz at the summit is sacred. No other game uses it. This is the gargoyle watchers' frequency, and the Stone earns it.
- Time pressure exists but is not aggressive in Living mode. In Shadow mode, the furnace rises faster — the player must climb or burn.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 172 images (the largest visual asset count of any Tier 2 game)
Phase 3: Audio Production — 7 tracks, 11 SFX, 25 voice lines
Phase 4: Programming — spec only, full game script needed
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

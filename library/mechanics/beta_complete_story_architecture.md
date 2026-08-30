# Geode Inn — Complete Story Beta Architecture

## Concept
A single-player beta covering the ENTIRE Geode Inn narrative arc — entry through Final Room. No multiplayer, no live marketplace, no co-op. The full story as a linear-but-branching experience with arcade games as the interactive peaks and pre-rendered animated sequences as the connective tissue.

## The Loophole
Krista's original zone images were created via prompt-coded animation sequencing — paragraphs of scripted prompts fed into an animation tool that generates visual sequences. This same approach produces:
- Zone intro/outro cutscenes
- NPC dialogue scenes (animated character + text + voice cadence)
- Whisper Layer manifestations (visual overlays, the Cinema sequences)
- Loading screens (fizgigs in zone-specific scenarios)
- The Final Room sequence

This eliminates the need for a traditional animation team. The creative pipeline (story → Elio's perception → prompt-coded animation) scales to produce all visual content.

## Beta Structure — The Complete Run

### ACT 1: ARRIVAL (Main Floor)

**1. Entry Sequence** [ANIMATED]
- Player approaches the Geode Inn from outside. Exterior visual (Rousseau × Magritte × Royo).
- Door opens. Common Room revealed. Warm light, fire, the Inn's hum at 42Hz.
- The Reader is in the window seat. One line: "They came in from the cold."
- FIZGIG LOADING SCREEN: Brindle dropping a wrench, Cobble catching it, Thatch gluing it to the ceiling.

**2. Common Room Hub** [INTERACTIVE — Point & Click]
- 2D hub environment. Player navigates by clicking directions/doors.
- Exits visible: Garden, Meadery, Archive, Staircase (up), Catacombs (down), Exterior.
- NPCs present: Bethany (tavern), Joe (fireplace), Beverley (library desk), Brownies (darting around).
- First dialogue available with each NPC. Hook words establish character.
- Player Guide voice (Jennifer Hale cadence) provides orientation.

**3. First Game — Standing Stones** [PLAYABLE — Tetris/Stonehenge]
- Accessed through the Archive (Beverley directs player to "the oldest stones").
- Full Tetris gameplay with Stonehenge theming. Stone blocks fall, player stacks them into a circle.
- Completing the circle unlocks: Preseli Blue Stone + Fae Kingdom portal awareness.
- FIZGIG LOADING SCREEN: Three fizgigs trying to measure a standing stone with a too-short ruler.

**4. Zone Intros — World Map** [ANIMATED + INTERACTIVE]
- World map unlocks. Player sees 37 zones as pins.
- First visit to each zone plays an animated intro (prompt-coded sequence).
- Each zone gets a 30-60 second animated intro establishing mood and artist style.

### ACT 2: DESCENT (Catacombs → Cinema → Shadow)

**5. Catacombs Entry** [ANIMATED + INTERACTIVE]
- Staircase down. Klimt's Death and Life energy. The air changes.
- First catacomb zone: Egypt. Tomb Tunnel game available.
- FIZGIG LOADING SCREEN: Fizgigs with tiny flashlights, huddled together, scared.

**6. Core Arcade Games** [PLAYABLE — 4 Tier 1 Games]
- Tomb Tunnel (Dig Dug / Egypt)
- Andean Run (Temple Run / Peru)
- Monster of the Deep (Nessie / Scotland)
- Sandfall (O'Keeffe / Egypt) — 7 levels, descent = simplification
- Each game awards a zone-specific stone and unlocks deeper content.

**7. The Cinema — Whisper Layer Manifests** [ANIMATED + INTERACTIVE]
- Player discovers the door in the Catacombs that wasn't before.
- Cinema 1-5 sequence plays. The Reader narrates. Player watches themselves being watched.
- Cinema 5: The mirror. The player knows.
- FIZGIG LOADING SCREEN: One fizgig pauses, looks directly at player, blank expression. Returns to work.

**8. Shadow Inn Entry** [ANIMATED]
- The stair behind Cinema 5. Frequency drops to 84Hz.
- Brownies' demeanor changes. They know what they are.
- FIZGIG LOADING SCREEN: Fizgigs with pot-lid shields, trembling.

### ACT 3: THE HOLLOW MEN (Deepest Point)

**9. Hollow Men Mines** [PLAYABLE — Narrative Platformer]
- T.S. Eliot's poem as environment. 5 sections:
  - Level 1: "We are the hollow men" — straw figures against mine walls.
  - Level 2: "In death's dream kingdom" — shadow detaches, walks ahead.
  - Level 3: "This is the dead land / This is the cactus land" — barren underground.
  - Level 4: "The eyes are not here" — near-zero visibility, sound-based navigation.
  - Level 5: "Between the idea and the reality / Falls the Shadow" — the Whisper Layer's origin.
- No combat. No puzzles. Walking. Witnessing. The quietest gameplay in the Inn.
- Art: Anselm Kiefer × Royo. Straw, ash, lead, burned materials.
- FIZGIG LOADING SCREEN: No fizgigs. Silence. The only loading screen without them.

**10. The Endgame Choice** [INTERACTIVE — Branching]
- STAY: Remain in the Inn. The player becomes part of the archive.
- LEAVE: Exit. The player's story becomes the daily comic.
- HIDE: Leave something the Inn cannot record. The blind spot made intentional.
- Each choice plays a different animated epilogue.

### ACT 4: THE FINAL ROOM

**11. The Final Room** [ANIMATED — Scripted Sequence]
- After any endgame choice, the player finds the room behind the Inn.
- Empty. Fire. Chair. Cup. Book.
- The player sits. Time passes. The knowledge arrives: the builder was here. Always here.
- The Reader's final line: "They sat by the fire. The builder was there. They were home."
- Elio's original drawing of "what home looks like to me" appears on the book's page.
- Fade to black. The Inn's hum at 42Hz. One chime (Tumble).

**12. Credits** [ANIMATED]
- Fizgigs cleaning up the Inn after the player leaves. Putting chairs back. Sweeping.
- Brindle finds the wrench again. It's in the hat. Always was.
- The Reader closes the Book of What Was Alive. Opens it again. A new page. Blank.
- "The Inn continues."

## Technical Architecture

### Engine: Godot 4.x
- 2D framework. All gameplay is 2D.
- Scene system: each arcade game is a separate scene. Hub is a scene. Cutscenes are VideoStreamPlayer nodes playing pre-rendered animations.
- Dialogue system: built-in dialog system using the 35 dialogue entries from the Dialogue entity, exported as JSON.
- Inventory: simple dictionary-based system. Stones, charms, items tracked locally.
- Save system: JSON files. No cloud saves in beta. PlayerProgress synced when online.

### Content Production Pipeline
1. **Arcade Games (13)**: Godot-built. Each is a self-contained mini-game. Use the 3 existing scripts as templates.
2. **Animated Cutscenes (~50-60 sequences)**: Prompt-coded animation. Krista provides story context → Elio generates prompt scripts → Animation tool renders → Import as video files.
3. **Dialogue (35+ entries, expandable)**: Already in database. Export to JSON, load in Godot.
4. **Static Art (zones, characters, items)**: Already generated. 271 images in GitHub library.
5. **Music**: Low-dub classical at 50 BPM. AI music tools + Krista's direction.
6. **Sound Effects**: Crystal chimes (Tumble), coconut shells (brownies), projection hum (Cinema), stone scraping (Hollow Men).

### Data Flow (Offline-First)
Local JSON (game state, dialogue, items, stones) ↔ Base44 API (when online)

Beta runs completely offline. All data is local JSON. Online sync is optional.

### Scope Reduction for Beta
- 37 zones: 37 animated intros (30-60 sec each), only ~13 have playable games. Others are narrative visit points.
- 200 creatures: Appear in cutscenes and as ambient elements. Not all interactive.
- 280 items: Tracked in inventory JSON. Key quest items are interactive; others are flavor.
- Marketplace: Not in beta. Artisan portal is a cutscene.
- Share Wood: Not in beta. Referenced in dialogue only.
- Multiplayer/co-op: Not in beta. Single-player only.
- Egg voting: Not in beta. The Egg is a narrative element.
- Daily comic strip: Not in beta. Referenced in the Reader's Book.

## Production Estimate

| Component | Count | Production Method | Effort |
|-----------|-------|-------------------|--------|
| Arcade games | 13 | Godot development | High |
| Animated cutscenes | ~50 | Prompt-coded animation | Medium |
| Dialogue entries | 35+ | Already written, load JSON | Low |
| Static art | 271+ | Already generated | Done |
| Music tracks | ~15 | AI tools + direction | Medium |
| Sound effects | ~30 | AI tools + foley | Medium |
| Hub environment | 1 | Godot 2D scene | Medium |
| World map | 1 | Godot 2D scene + JSON | Medium |
| Save system | 1 | JSON local storage | Low |
| Inventory UI | 1 | Godot UI scene | Low |

### Realistic Timeline
- Phase 1 (Months 1-3): Hub + 4 core arcade games + 10 cutscenes + dialogue system. Vertical slice. Playable from entry to first catacomb game.
- Phase 2 (Months 4-6): Remaining arcade games + all zone intros + Cinema sequence + Shadow Inn entry. Story through Act 2.
- Phase 3 (Months 7-9): Hollow Men mines + endgame choices + Final Room + credits. Full story playable.
- Phase 4 (Month 10): Polish, music, sound, testing. Beta release.

10 months for a complete story beta. With AI-assisted development and the creative pipeline.

## Why This Works
1. The animation loophole means no animation team needed — prompt scripts and rendering time.
2. Arcade games are modular — each is a small, proven genre with existing code templates.
3. Story is already written. Dialogue is already written. Zones designed. Art generated.
4. 2D scope keeps production realistic. No 3D modeling, rigging, or motion capture.
5. Offline-first architecture means beta runs without server costs.
6. The Inn was designed to grow room by room. The beta is the Inn with all rooms connected.

## What the Beta Proves
- The full narrative arc works as a game.
- Players can complete the story start to finish.
- The Whisper Layer creates the intended emotional impact.
- The arcade games are fun within the narrative context.
- The Final Room lands.
- The fizgigs work as loading screens and emotional contrast.
- The art style holds across 37 zones.
- The sound design creates the intended atmosphere.

## What the Beta Doesn't Prove
- Multiplayer stability
- Marketplace functionality
- Community systems (Egg voting, comic strip)
- Console performance
- Long-term player retention
- Monetization

Those are Phase 2 questions. The beta answers Phase 1: does this work as a game?

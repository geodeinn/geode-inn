# Build Sheet — Catacomb Labyrinth

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Pac-Man |
| Geode Inn Name (OUT) | Catacomb Labyrinth |
| Genre/Mechanic | Maze collect-and-evade — navigate corridors, collect all items, avoid pursuers |
| Zone | Catacombs (Undercity entrance, beneath the Inn) |
| Stone Reward | Charon Token |
| Rarity Tier | Rare |
| Price | $4.99 |
| Original Developer | Namco (1980) |
| Legal Basis | Mechanic only — maze collection format is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Pac-Man -> Charon's Ferryman (a hooded figure carrying a small lantern, collecting soul-coins from the catacomb walls)
- Blinky (red ghost) -> Asterion the Minotaur (patrols the central labyrinth, relentless)
- Pinky (pink ghost) -> The Weeper (a sobbing spirit that tracks the player's anticipated path)
- Inky (blue ghost) -> The Mirror Wraith (erratic movement, reflects player's position)
- Clyde (orange ghost) -> The Hollow Mendicant (wanders randomly, occasionally blocks exits)
- Power Pellet -> The River Styx Flask (temporarily reverses the hunt — Ferryman can banish guardians)
- Pac-Dots -> Soul Coins (embedded in every corridor tile, collected to complete the level)

New Narrative Frame:
- The catacombs beneath the Inn are a labyrinth modeled on the original Labyrinth of Knossos. Charon's Ferryman walks these corridors collecting soul-coins — remnants of those who entered the catacombs and never left. Each coin collected brings a lost soul closer to rest.
- The four guardians are not evil — they are the labyrinth's immune system. They exist to keep the Ferryman from completing the collection. If all soul-coins are gathered, the dead can finally cross, and the catacombs go quiet.
- The River Styx Flask (power pellet equivalent) contains water from the actual Styx. When consumed, the Ferryman's lantern blazes, and guardians can be banished — sent back to the center. They are not destroyed. They reform.
- The Charon Token reward: earned when the deepest level is cleared. The token is Charon's personal obol — the coin placed on the tongue of the dead. In the Inn, it represents mastery over the crossing point.

Dialogue Requirements:
- NPC dialogue count: ~10 lines (Charon — speaks between levels, from a boat on a subterranean river)
- Voice profiles needed: Charon -> Deep, gravelly, ancient Greek-inflected English, slow as a river
- Whisper Layer presence: Yes — the catacombs are the Whisper Layer's home territory. Between levels, the walls whisper. The whispers are names — the names of every soul whose coin has been collected. Not threatening. Acknowledging.

Frequency State:
- Living (42Hz): Standard gameplay. Catacomb walls are warm stone, lantern light is golden. Guardians move at classic speeds.
- Shadow (84Hz): Walls turn to black marble. Lantern light shrinks — visibility decreases. Guardians move faster. The River Styx Flask lasts shorter. The whispers become louder.
- In-Between: The river rises briefly between levels — water fills the maze floor for a moment, then drains.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Ferryman: idle (1), walking (4) x 4 directions, lantern-holding (1) x 2 freq = 10 sprites
- Asterion (Minotaur): idle (1), chasing (2) x 2 freq = 6 sprites
- The Weeper: idle (1), tracking (2) x 2 freq = 6 sprites
- Mirror Wraith: idle (1), shifting (2) x 2 freq = 6 sprites
- Hollow Mendicant: idle (1), wandering (2) x 2 freq = 6 sprites
- Banished guardian (returning to center): 1 x 4 guardians = 4 sprites
- Charon (between levels): portrait (1), speaking (1) x 2 freq = 4 sprites
- Count: 42 sprites

Backgrounds/Environments:
- Catacomb level 1 (shallow): Dore carved stone, warm tones
- Catacomb level 5 (mid): Klimt Death-and-Life decorative skull patterns on walls
- Catacomb level 10 (deepest): Klimt + Dore — black marble with gold-leaf skull mosaics
- Subterranean river (between levels): Dore river scene, boat silhouette
- Shadow variant of each (4)
- Count: 8 backgrounds

UI Elements:
- Title screen: Labyrinth entrance with Antikythera logo as a glowing lantern above the arch
- HUD: Level number as "Depth," soul-coins collected as progress bar, River Styx Flask charges
- Pause menu: Stone slab aesthetic
- Victory: Charon's obol revealed in the deepest chamber
- Game over: Guardians close in, lantern goes dark
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Corridor tile (horizontal): 1
- Corridor tile (vertical): 1
- Corridor tile (corner): 4 (NE, NW, SE, SW)
- Corridor tile (T-junction): 4
- Corridor tile (cross): 1
- Wall tile (solid): 1
- Soul coin (collectible): 1
- River Styx Flask (power item): 1
- Guardian pen (center spawn): 1
- Lantern glow effect: 1
- Whisper glyph (wall text): 3 variants
- Count: 19 sprites

Animation Frames:
- Ferryman: 4 walk x 4 directions = 16
- Each guardian: 2 chase + 2 banished = 4 x 4 = 16
- Charon: 2 speak = 2
- Lantern flicker: 4
- Soul coin shimmer: 2
- Flask glow: 3
- Count: 43 frames

Artist Style Assignment:
- Primary: Gustave Dore (engraved stone, catacomb weight, labyrinthine detail)
- Secondary: Klimt Death-and-Life (decorative skull patterns, gold-on-dark for the deep levels)

Total Image Assets: 117

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Stone drum + subterranean drone, 50 BPM, echoing, referencing Heilung deep tones
- Deep descent theme: Adds water sounds + deeper drone, claustrophobic
- River Styx active (power mode): Reversed dynamics — triumphant brass + stone drum, guardian banishment energy
- Shadow theme: All sounds pitch-shifted down, 84Hz pulse, whispers louder in the mix
- Between-levels (Charon speaks): Solo water sounds + distant boat creak
- Victory: Charon's obol — single deep gong, then silence
- Count: 6 tracks

Sound Effects:
- Soul coin collect: tiny metallic ching
- Walking on stone: bootstep echo
- Guardian approaching: low heartbeat throb
- Guardian banished: water splash + reverse scream
- Guardian reformed: stone grinding
- River Styx Flask consumed: liquid gulp + fire ignition
- Level complete: stone door sealing
- Whisper (between levels): layered breathy vowels
- Lantern flicker: tiny tinder sound
- Count: 9 SFX

Voice Lines:
- Charon: ~10 lines
- Count: 10 voice lines

Stone Tone Trigger:
- Reward stone: Charon Token -> (custom stone, no Mohs) -> 42Hz deep tone at 12dB below narration
- Trigger: The deepest tone the Inn produces — the Stone Circle Chamber frequency

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Catacombs (maximum reverb, stone reflections, longest decay of any zone)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 25

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: D-pad / left stick (4 directions — up, down, left, right)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: swipe direction (mobile)

Steam Integration:
- Achievements: "Crossing" (beat game), "Ferryman" (collect 1000 soul coins total), "Silent Catacombs" (beat Shadow mode), "Perfect Crossing" (beat a level without being touched by any guardian), "Charon's Obol" (beat the deepest level)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Most Soul Coins" (total collected across all runs)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Charon Token, increment gamesCompleted

Special Notes:
- Guardian AI follows the classic Pac-Man patterns but with Inn lore flavor: Asterion = Blinky (direct chase), Weeper = Pinky (predictive), Mirror Wraith = Inky (erratic/reflective), Hollow Mendicant = Clyde (random wander)
- The catacombs are the Whisper Layer's home. This game has the second-most-intimate Whisper Layer manifestation (after Monster of the Deep). The whispers between levels are the archive remembering the dead.
- The Charon Token is a custom stone — not in the 198-stone geological database. It exists only in the Inn's lore.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 117 images
Phase 3: Audio Production — 6 tracks, 9 SFX, 10 voice lines
Phase 4: Programming — spec only, full game script needed
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

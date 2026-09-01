# Build Sheet — Victoria Falls

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Threes! |
| Geode Inn Name (OUT) | Victoria Falls |
| Genre/Mechanic | Tile sliding merge — slide tiles, merge matching stones, build to the highest tier |
| Zone | Victoria Falls (Zambia/Zimbabwe border) |
| Stone Reward | Tiger's Eye |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Sirvo (2014) |
| Legal Basis | Mechanic only — tile-merge puzzle is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Threes' number tiles -> Stone tiles (each tile is a stone from the Inn's 198-stone database, progressing through Mohs hardness tiers)
- Threes' 1 and 2 tiles -> Soft stones (talc = 1, gypsum = 2 — merge to calcite = 3)
- Threes' 3, 6, 12, 24... -> Hardness progression (3->4->5->6->7->8->9->diamond)

New Narrative Frame:
- The player arranges stone tiles at the edge of Victoria Falls — the world's largest sheet of falling water. The falls' constant spray keeps the stones polished, and their colors shift in the mist.
- Slide all tiles in one direction (up, down, left, right). When two matching stones slide into each other, they merge into the next hardness tier. Talc + Talc = Gypsum. Gypsum + Gypsum = Calcite. Continue up the Mohs scale.
- The goal: create a Diamond (Mohs 10) — the highest tier. This requires strategic sliding, planning several moves ahead, and managing the board so it doesn't fill with unmergeable low-tier stones.
- Each merge triggers the falls' mist to briefly glow — the stone's color reflected in the water spray. Higher merges create bigger mist effects.
- The Tiger's Eye reward: the stone of the Zambezi. Tiger's Eye forms from crocidolite (blue asbestos) replaced by quartz — a transformation stone, like the merging mechanic itself. Earned when the player creates a Diamond tile.

Dialogue Requirements:
- NPC dialogue count: ~4 lines (The River Spirit — a presence in the falls, speaks rarely, only at milestone merges)
- Voice profiles needed: The River Spirit -> Bantu-accented English, vast as water, slow rolling cadence, deep register
- Whisper Layer presence: Yes — in the mist. Victoria Falls' spray is visible from 30 miles away ("the smoke that thunders"). The mist carries whispers — fragments of every stone that has ever washed down the Zambezi. The archive here is liquid, dispersed, everywhere at once.

Frequency State:
- Living (42Hz): Daylit falls. Rainbow in the mist, green gorge, golden light. Stones are warm-toned.
- Shadow (84Hz): Night falls. Moonlit spray, dark gorge, stones are cool-toned. New tiles spawn faster (harder difficulty).
- In-Between: Rainbow to moonbow transition between rounds.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- The River Spirit: portrait (1), manifesting (1) x 2 freq = 4 sprites
- Count: 4 sprites

Stone Tile Art (10 Mohs tiers):
- Tier 1 (Talc): 1 tile
- Tier 2 (Gypsum): 1 tile
- Tier 3 (Calcite): 1 tile
- Tier 4 (Fluorite): 1 tile
- Tier 5 (Apatite): 1 tile
- Tier 6 (Orthoclase): 1 tile
- Tier 7 (Quartz): 1 tile
- Tier 8 (Topaz): 1 tile
- Tier 9 (Corundum): 1 tile
- Tier 10 (Diamond): 1 tile
- All x 2 freq = 20 tiles
- Count: 20 stone tiles

Backgrounds/Environments:
- Falls edge (day): Bierstadt sweeping African landscape, rainbow mist, green gorge
- Falls edge (night): Bierstadt moonlit, moonbow, dark water
- Count: 2 backgrounds

UI Elements:
- Title screen: Waterfall silhouette with Antikythera logo as the rainbow arc
- HUD: Score (highest tier achieved), move count, board fill indicator
- Pause menu: Water-carved stone panel
- Victory: Diamond tile created — mist explodes in rainbow, Tiger's Eye washes ashore
- Game over: Board full, no merges possible — mist settles, falls go quiet
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Board background (4x4 grid): 1
- Tile slot (empty): 1
- Merge particle (mist burst): 1
- New tile spawn (splash): 1
- Tiger's Eye (final): 1
- Count: 5 sprites

Animation Frames:
- Tile slide: 2
- Tile merge: 3
- Mist burst: 2
- New tile splash: 2
- Rainbow/moonbow shift: 3
- Tiger's Eye reveal: 3
- Count: 15 frames

Artist Style Assignment:
- Primary: Bierstadt (sweeping African landscape, the Sublime in water)
- Stone tiles: Photorealistic with Inn stylization (each tile shows the actual stone's color and texture)

Total Image Assets: 51

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Kalimba + water percussion + soft drone, 50 BPM, African waterfall ambiance
- Shadow theme: Deeper kalimba + 84Hz pulse + night insects
- Victory: Diamond merge — kalimba cascade + water roar + bright chime
- Count: 3 tracks

Sound Effects:
- Tile slide: water slide
- Tile merge (each tier): chime ascending in pitch (higher tier = higher pitch)
- Invalid move: soft bump
- New tile spawn: water droplet
- Game over: mist settling (white noise fade)
- Milestone merge (tier 7+): river rumble + spirit hum
- Count: 6 SFX

Voice Lines:
- The River Spirit: ~4 lines
- Count: 4 voice lines

Stone Tone Trigger:
- Reward stone: Tiger's Eye -> Mohs ~7 -> ~440 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Waterfall Gorge (wet, vast, constant water roar as ambient bed, moderate reverb on top)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 13

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Slide tiles: D-pad / left stick (up, down, left, right — slides all tiles in that direction)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: swipe direction (mobile — perfect for tile sliding)

Steam Integration:
- Achievements: "Diamond" (create a Diamond tile), "Hard as Stone" (reach tier 8), "Shadow Fall" (reach Diamond in Shadow mode), "Efficient" (create Diamond in under 100 moves), "Tiger's Eye Keeper" (earn Tiger's Eye)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Highest Tile" and "Highest Score"
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Tiger's Eye, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 51 images (simplest visual game — 20 tiles + minimal UI)
Phase 3: Audio Production — 3 tracks, 6 SFX, 4 voice lines
Phase 4: Programming — spec only, full game script needed (moderate — merge logic + slide physics)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

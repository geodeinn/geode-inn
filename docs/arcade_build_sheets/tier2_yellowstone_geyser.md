# Build Sheet — Yellowstone Geyser

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Pipe Mania |
| Geode Inn Name (OUT) | Yellowstone Geyser |
| Genre/Mechanic | Pipe-laying puzzle — connect pipes to route water/steam before the flow reaches the end |
| Zone | Yellowstone (geothermal features) |
| Stone Reward | Obsidian |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | The Assembly Line (1989) |
| Legal Basis | Mechanic only — pipe-routing puzzle is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Pipe Mania's generic pipes -> Geothermal channels (carved stone channels routing superheated water through geyser fields)
- Pipe Mania's player avatar -> A Geothermal Surveyor (a park ranger character mapping the geyser basin)
- Water/flow -> Superheated mineral water (Yellowstone's actual geothermal fluid)

New Narrative Frame:
- The player is a geothermal surveyor in Yellowstone's geyser basin. Old Faithful and the other geysers have become erratic — the underground channels are broken. The surveyor must lay stone channels to route the superheated water safely before it erupts unpredictably and damages the basin.
- Each level is a geyser field. Water starts flowing from a source point after a countdown. The player must place channel pieces (straight, corner, cross, T-junction) to guide the flow to an exit point before the water reaches an unconnected edge.
- The geyser fields get more complex: multiple sources, multiple exits, obstacles (boulders, hot springs that block placement), and pressure timers (the water flows faster on later levels).
- The Obsidian reward: Yellowstone's signature stone. Obsidian forms when volcanic lava cools instantly — the same geothermal forces the player is managing. The surveyor earns it by mastering the flow of heat and stone.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (The Old Ranger — a retired geothermal expert who radios in tips between levels)
- Voice profiles needed: The Old Ranger -> American Western accent, gravelly, laconic, dry humor, low register
- Whisper Layer presence: No — this is a logic puzzle game. Clean, focused, satisfying.

Frequency State:
- Living (42Hz): Warm daylight, geyser fields steam gently, water flows at normal speed. The Old Ranger is relaxed.
- Shadow (84Hz): Overcast, geysers rumble, water flows faster (shorter countdown). Steam is thicker, obscuring some tiles. The Old Ranger's tone gets tense — "She's gonna blow early on this one."
- In-Between: Steam vent burst between levels — screen clouds briefly, then clears.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Geothermal Surveyor: idle (1), placing pipe (1), celebrating (1) x 2 freq = 6 sprites
- The Old Ranger: portrait (1), speaking (1) x 2 freq = 4 sprites
- Count: 10 sprites

Backgrounds/Environments:
- Geyser basin (level 1-5): Bierstadt-meets-Adams — steaming pools, mineral terraces, golden light
- Deep geyser field (level 6-10): Adams — more stark, geothermal intensity, less green
- Shadow variant of each (2)
- Count: 4 backgrounds

UI Elements:
- Title screen: Erupting geyser silhouette with Antikythera logo as the steam plume
- HUD: Score as "Channels Laid," level as "Geyser Field," countdown timer as "Pressure"
- Pause menu: Topographic map aesthetic
- Victory: Water flows cleanly through all channels, geyser erupts on schedule, Obsidian shard revealed in the mineral terrace
- Game over: Water reaches unconnected edge, geyser erupts unpredictably, steam explosion
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Straight channel (horizontal): 1
- Straight channel (vertical): 1
- Corner channel (4 directions): 4
- T-junction (4 directions): 4
- Cross junction: 1
- Source point (water entry): 1
- Exit point (water exit): 1
- Boulder (blocker): 1
- Hot spring (blocker): 1
- Water flow animation: 1
- Steam burst: 1
- Obsidian shard: 1
- Count: 18 sprites

Animation Frames:
- Surveyor place: 2
- Water flow through channel: 3
- Geyser erupt: 4
- Steam burst: 2
- Obsidian reveal: 3
- Count: 14 frames

Artist Style Assignment:
- Primary: Ansel Adams (stark geothermal landscape, black and white precision, natural geometry)
- Secondary: Bierstadt (warm golden light for the earlier, more scenic levels)

Total Image Assets: 51

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Marimba + water percussion + soft drone, 50 BPM, referencing natural geothermal rhythm
- Pressure theme (countdown active): Adds ticking + building sub-bass, tension increases
- Shadow theme: Detuned marimba, 84Hz pulse, steam hiss louder in mix
- Victory: Water flows — marimba cascade + geyser eruption crescendo
- Count: 4 tracks

Sound Effects:
- Place channel: stone click
- Water flow: bubbling + hiss
- Water reaches exit: satisfied gurgle + chime
- Water hits dead end: splash + rumble
- Pressure countdown tick: ticking
- Geyser eruption: roar + water column
- Boulder block: thud
- Obsidian reveal: crystalline ping + steam hiss
- Count: 8 SFX

Voice Lines:
- The Old Ranger: ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Obsidian -> Mohs ~5-6 -> ~350 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Geyser Basin (wet reverb, steam diffusion, moderate decay, organic)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 18

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move cursor: Left stick / D-pad (grid navigation)
- Place channel: A / face button
- Remove channel: B / face button (if removable)
- Rotate channel (pre-place): shoulder buttons
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: tap to place, swipe to rotate (mobile)

Steam Integration:
- Achievements: "Flow Master" (beat game), "Perfect Pressure" (beat a level with time to spare), "Shadow Surveyor" (beat Shadow mode), "No Spills" (beat a level without any dead ends), "Obsidian Keeper" (earn Obsidian)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Fastest Completion" (total time across all levels)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Obsidian, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 51 images
Phase 3: Audio Production — 4 tracks, 8 SFX, 6 voice lines
Phase 4: Programming — spec only, full game script needed (moderate — grid logic + flow simulation)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

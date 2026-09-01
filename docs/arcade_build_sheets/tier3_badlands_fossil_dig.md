# Build Sheet — Badlands Fossil Dig

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Boulder Dash |
| Geode Inn Name (OUT) | Badlands Fossil Dig |
| Genre/Mechanic | Dig-and-collect — tunnel through rock, collect fossils, avoid boulders, reach exit |
| Zone | Badlands (South Dakota) |
| Stone Reward | Fossil Jasper |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | First Star Software (1984) |
| Legal Basis | Mechanic only — grid-based dig-and-collect is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Rockford (Boulder Dash protagonist) -> A Paleontologist (a field researcher with a pickaxe and brush)
- Boulder Dash's boulders -> Sandstone boulders (roll through tunnels when unsupported — South Dakota geology)
- Boulder Dash's diamonds -> Fossil fragments (ammonite spirals, trilobite shells, crinoid stems, Megalodon teeth)
- Boulder Dash's enemies -> Dust devils (mini tornadoes that chase through tunnels)

New Narrative Frame:
- The player is a paleontologist excavating the Badlands' layered sediment. Each level is a stratum — a layer of geological time. Digging downward moves through deeper (older) layers: Cretaceous, Jurassic, Triassic, Permian, Carboniferous.
- Collecting fossil fragments from each layer pieces together a prehistoric ecosystem. Complete a layer's fossil set and the stratum is catalogued — added to the Inn's archive.
- Boulders obey gravity: dig beneath one and it falls. Falling boulders can crush dust devils (useful) or the player (deadly). Strategy is about which rock to dig and which to leave as support.
- The Fossil Jasper reward: found in the deepest layer (Carboniferous). Jasper forms in sedimentary rock over millions of years — the fossil in the jasper is the oldest life form in the Badlands. It represents deep time, the Inn's archive principle made stone.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (The Field Notebook — narration text appearing between levels, written by the paleontologist)
- Voice profiles needed: Narrator -> American Midwestern, measured, curious, documentary cadence, mid register
- Whisper Layer presence: No — this is a science and discovery game. The archive IS the gameplay — every fossil collected is literally being archived.

Frequency State:
- Living (42Hz): Warm Badlands light, orange and pink strata. Dust devils are slow. Fossils gleam.
- Shadow (84Hz): Overcast. Strata turn to grey mudstone. Boulders fall faster. Dust devils are aggressive.
- In-Between: Wind blows sediment across screen between strata transitions.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Paleontologist: idle (1), digging (2), collecting (1), running (2), crushed (1) x 2 freq = 14 sprites
- Dust Devil: idle (1), chasing (2) x 2 freq = 6 sprites
- Count: 20 sprites

Backgrounds/Environments:
- Cretaceous stratum (level 1-2): Bierstadt warm Badlands, pink/orange rock
- Jurassic stratum (level 3-4): Benton earthy reds, dinosaur bone fragments visible in walls
- Triassic stratum (level 5-6): Wyeth muted, dry, sparse
- Permian stratum (level 7-8): Adams stark, near-monochrome
- Carboniferous stratum (level 9-10): Klimt dark — coal-black rock with gold fossil veins
- Shadow variant of each (5)
- Count: 10 backgrounds

UI Elements:
- Title screen: Badlands butte silhouette with Antikythera logo as a fossil spiral
- HUD: Score as "Fossils Catalogued," level as "Geological Period," boulder count
- Pause menu: Field notebook page
- Victory: Complete fossil set displayed — museum tray arrangement, Fossil Jasper at center
- Game over: Collapsed tunnel, pickaxe stuck in rock
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Diggable rock (4 color variants per stratum): 4
- Boulder (sandstone, round): 1
- Hard rock (non-diggable): 1
- Fossil — ammonite: 1
- Fossil — trilobite: 1
- Fossil — crinoid: 1
- Fossil — Megalodon tooth: 1
- Fossil — fern print: 1
- Fossil Jasper (final): 1
- Exit cave: 1
- Dust devil trail: 1
- Count: 14 sprites

Animation Frames:
- Paleontologist: 2 dig, 2 run, 1 collect = 5 per freq x 2 = 10
- Boulder fall: 3
- Dust devil spin: 3
- Fossil collect shimmer: 2
- Strata transition (sediment blow): 3
- Count: 21 frames

Artist Style Assignment:
- Primary: Bierstadt (warm Badlands grandeur, layered rock formations)
- Deep strata: Adams (stark, monochrome precision)
- Carboniferous: Klimt (coal-dark with gold fossil veins — the deepest layer is the most decorative)

Total Image Assets: 70

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Acoustic guitar + wind + soft percussion, 50 BPM, referencing American folk + field work
- Deep strata theme: Drops guitar, adds low drone + stone percussion, older feel
- Carboniferous theme: Near-silent — just low hum and occasional crystalline ping (fossil in stone)
- Shadow theme: Detuned guitar, 84Hz pulse, wind louder
- Victory: Fossil set complete — guitar resolve + museum chime
- Count: 5 tracks

Sound Effects:
- Dig: crunch (varies by stratum hardness)
- Boulder fall: heavy rumble
- Boulder crush (dust devil): satisfying thud
- Fossil collect: crystalline ping (tuned to fossil type)
- Dust devil approach: swirling wind
- Level complete: pickaxe strike + echo
- Game over: rock slide
- Count: 7 SFX

Voice Lines:
- Narrator (field notebook): ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Fossil Jasper -> Mohs ~6.5-7 -> ~415 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Badlands (dry, open air, minimal reverb, wind constant)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 18

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: D-pad / left stick (4 directions)
- Dig: automatic on movement into rock
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: swipe to move/dig (mobile)

Steam Integration:
- Achievements: "Deep Time" (beat game), "Master Excavator" (beat game without being crushed), "Shadow Digger" (beat Shadow mode), "Complete Collection" (collect every fossil type in one run), "Fossil Keeper" (earn Fossil Jasper)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Most Fossils" (total collected)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Fossil Jasper, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 70 images
Phase 3: Audio Production — 5 tracks, 7 SFX, 6 voice lines
Phase 4: Programming — spec only, full game script needed (grid + gravity simulation)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

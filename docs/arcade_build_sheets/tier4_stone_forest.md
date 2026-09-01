# Build Sheet — Stone Forest

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Boulder Dash (variant) / Mr. Driller |
| Geode Inn Name (OUT) | Stone Forest |
| Genre/Mechanic | Downward drilling descent — dig through layers of stone pillars, manage air supply, avoid hazards |
| Zone | Shilin Stone Forest (Yunnan, China) |
| Stone Reward | Shoushan Stone |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Namco (1999) |
| Legal Basis | Mechanic only — downward drilling descent is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Mr. Driller's Susumu -> A Stone Mason (a Chinese artisan who carves the limestone pillars of Shilin)
- Mr. Driller's air supply -> Breath of the Mountain (a limited air resource — the deeper you go, the thinner the air)
- Mr. Driller's blocks -> Limestone pillars (various densities: soft limestone, hard dolomite, crystal-veined marble, jade-infused stone)
- Mr. Driller's falling blocks -> Pillar collapses (when you drill out a supporting pillar, those above may fall and crush)

New Narrative Frame:
- The Shilin Stone Forest in Yunnan, China is a real formation — towering limestone pillars that look like a petrified forest. The Stone Mason descends through the pillars to find the deepest vein: the legendary Shoushan Stone, the carving stone of Chinese emperors.
- The player drills downward through layered stone. Each layer is denser and more dangerous. Soft limestone breaks quickly. Dolomite takes multiple hits. Crystal-veined marble must be cracked strategically. Jade-infused stone cannot be drilled — must be navigated around.
- Air supply decreases continuously. Air capsules are hidden inside pillars — drill the right one to refill. Run out of air and the Mason suffocates.
- Pillar physics: drilling a supporting pillar causes those above to fall. Falling pillars can crush the Mason (death) or clear a path (lucky). Strategic drilling is key.
- The Shoushan Stone reward: the emperor's carving stone, found at the deepest point. Shoushan stone has been used for Chinese seals for over 1,000 years. It represents the pinnacle of stone craft — the Mason earns it by mastering the Stone Forest itself.

Dialogue Requirements:
- NPC dialogue count: ~6 lines (The Forest Spirit — an ancient presence in the stone, speaks between depth markers)
- Voice profiles needed: The Forest Spirit -> Mandarin-inflected English, slow, resonant, mountain-old, low register
- Whisper Layer presence: Yes — in the crystal veins. When the Mason drills through crystal-veined marble, the vein briefly whispers. The crystals hold fragments of Chinese geological history — dynasties recorded in stone. The archive here is dynastic.

Frequency State:
- Living (42Hz): Daylit upper forest. Warm limestone, green moss, birdsong from above. Air is plentiful.
- Shadow (84Hz): Deep forest darkness. Stone is cold and black. Air is scarce. Pillar collapses are more frequent. The Forest Spirit's voice is deeper, warning.
- In-Between: Depth transition — light fades as the Mason descends.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Stone Mason: idle (1), drilling (2), moving (2), crushed (1), celebrating (1) x 2 freq = 14 sprites
- The Forest Spirit: portrait (1), speaking (1) x 2 freq = 4 sprites
- Count: 18 sprites

Backgrounds/Environments:
- Upper forest (shallow depth): Guo Xi classical Chinese landscape — limestone pillars, mist, green
- Mid forest: Guo Xi + Hokusai — denser pillars, less light, geometric
- Deep forest: Klimt dark — black stone with gold crystal veins
- Deepest vein (Shoushan): Klimt + Dali — surreal stone cathedral, the Shoushan vein glows
- Shadow variant of each (4)
- Count: 8 backgrounds

UI Elements:
- Title screen: Stone pillar forest with Antikythera logo as a carved seal at the base
- HUD: Depth meter, air supply bar, score (blocks drilled), stone type indicator
- Pause menu: Carved jade tablet
- Victory: Shoushan Stone vein revealed — warm glow in the deepest dark
- Game over: Mason buried in collapsed pillars, air gone
- Count: 5 UI screens

Tile Sets / Object Sprites:
- Limestone block (soft, drillable): 1
- Dolomite block (hard, multi-hit): 1
- Crystal-veined marble (crackable): 1
- Jade-infused stone (non-drillable): 1
- Air capsule (inside pillar): 1
- Falling pillar: 1
- Crystal shard (collectible): 1
- Shoushan Stone (final): 1
- Count: 8 sprites

Animation Frames:
- Mason drill: 2
- Block break: 3
- Pillar fall: 3
- Air capsule burst: 2
- Crystal vein whisper glow: 2
- Shoushan reveal: 4
- Count: 16 frames

Artist Style Assignment:
- Primary: Guo Xi (Song Dynasty landscape painter — misty mountains, layered depth, Chinese aesthetic)
- Deep forest: Klimt (gold crystal veins as decorative gold-on-black)

Total Image Assets: 55

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Guqin (zither) + stone percussion + wind, 50 BPM, Chinese classical minimal
- Deep theme: Adds erhu (bowed string) + deeper drone, older feeling
- Shadow theme: Detuned guqin, 84Hz pulse, stone cracking louder
- Victory: Shoushan reveals — guqin ascending + bell tone
- Count: 4 tracks

Sound Effects:
- Drill (limestone): soft crunch
- Drill (dolomite): harder crack
- Drill (marble): crystalline fracture
- Block break: stone shatter
- Pillar fall: heavy rumble
- Air capsule: hiss + deep breath
- Crystal whisper: layered breathy vowels in Chinese
- Mason crushed: heavy impact
- Depth milestone: gong
- Count: 9 SFX

Voice Lines:
- The Forest Spirit: ~6 lines
- Count: 6 voice lines

Stone Tone Trigger:
- Reward stone: Shoushan Stone -> Mohs ~2.5-3 -> ~225 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Stone Forest (enclosed, stone reflections, moderate reverb, echoes from all sides)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 19

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: D-pad / left stick (left, right)
- Drill down: A / face button (or down + A)
- Drill sideways: left/right + A
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: tap direction to drill (mobile — simple and direct)

Steam Integration:
- Achievements: "Deepest Vein" (find Shoushan Stone), "Air Saver" (reach max depth using only 2 air capsules), "Shadow Mason" (beat Shadow mode), "Big Dig" (drill 500 blocks in one run), "Shoushan Keeper" (earn Shoushan Stone)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Deepest Descent" (max depth in meters)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Shoushan Stone, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 55 images
Phase 3: Audio Production — 4 tracks, 9 SFX, 6 voice lines
Phase 4: Programming — spec only, full game script needed (moderate — grid drilling + pillar physics + air system)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

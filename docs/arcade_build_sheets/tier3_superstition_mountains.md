# Build Sheet — Superstition Mountains

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Spelunky |
| Geode Inn Name (OUT) | Superstition Mountains |
| Genre/Mechanic | Roguelike platformer — procedurally generated caves, permadeath, collect treasure, escape |
| Zone | Superstition Mountains (Arizona) |
| Stone Reward | Turquoise |
| Rarity Tier | Rare |
| Price | $4.99 |
| Original Developer | Mossmouth (2008) |
| Legal Basis | Mechanic only — roguelike platformer is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Spelunky's spelunker -> A Lost Dutchman prospector (searching for the legendary Lost Dutchman's Gold Mine)
- Spelunky's shopkeeper -> A Desert Trader (a coyote-skinned figure who sets up shops in impossible places)
- Spelunky's damsel -> A Phantom Guide (a ghostly apparition that appears in deep levels — offers directions for a price)
- Spelunky's enemies -> Rattlesnakes, gila monsters, scorpions, tarantulas, cave bats, chupacabra (ties to cryptid bestiary)

New Narrative Frame:
- The Superstition Mountains of Arizona hold the legend of the Lost Dutchman's Gold Mine — a gold deposit found and lost in the 1800s. Many have died searching for it. The player is the latest prospector, descending into the mountain's cave systems.
- Each level is procedurally generated — no two descents are the same. Caves contain turquoise veins (the real treasure), gold dust (currency for the Desert Trader), and hazards: cave-ins, spike pits, lava tubes, and wildlife.
- The Chupacabra appears as a rare, terrifying enemy in the deepest levels — drawn from the Inn's cryptid bestiary. It's faster than other enemies and can drain health rapidly.
- Permadeath: die and the prospector is lost. Start over from the surface with nothing. But knowledge persists — the player learns cave patterns, enemy behaviors, and trap placements across runs.
- The Turquoise reward: the Southwest's sacred stone. Turquoise has been mined in the Southwest for over 1,000 years. Finding the turquoise vein in the deepest cave is the true discovery — the Lost Dutchman's "gold" was always turquoise, misidentified by a prospector who didn't know what he had.

Dialogue Requirements:
- NPC dialogue count: ~10 lines (Desert Trader: 5, Phantom Guide: 5)
- Voice profiles needed:
  - Desert Trader -> Southwestern American, raspy, haggling cadence, mid-low register
  - Phantom Guide -> Echoing, no accent, whispering, faint (barely audible)
- Whisper Layer presence: Yes — deep levels. The mountain itself whispers. The Apache believed the Superstitions were cursed — the Whisper Layer IS that curse, the mountain remembering every death. Not hostile, just heavy. The archive mourns.

Frequency State:
- Living (42Hz): Desert daylight in upper caves. Warm sandstone, dust motes, cacti in cave entrances. Wildlife is docile.
- Shadow (84Hz): Deep cave darkness. Lava tubes glow red. Wildlife is aggressive. The Whisper Layer is loud — the mountain's grief is audible.
- In-Between: Transition at the cave mouth — daylight to darkness, warm to cold.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Prospector: idle (1), walk (4), jump (2), climb (2), dig (1), whip (2), dead (1) x 2 freq = 26 sprites
- Desert Trader: idle (1), haggling (1) x 2 freq = 4 sprites
- Phantom Guide: manifest (1), pointing (1) = 2 sprites
- Rattlesnake: slither (2), strike (1) = 3 sprites
- Gila Monster: walk (2), bite (1) = 3 sprites
- Scorpion: crawl (2), sting (1) = 3 sprites
- Tarantula: crawl (2) = 2 sprites
- Cave Bat: fly (2) = 2 sprites
- Chupacabra: stalk (2), lunge (2) = 4 sprites
- Count: 49 sprites

Backgrounds/Environments:
- Surface entrance (cave mouth): Dixon-meets-Adams — desert landscape, harsh light
- Upper caves (sandstone): O'Keeffe warm cave interiors, red and gold
- Mid caves (limestone): Klimt dark with mineral deposits
- Deep caves (lava tubes): Royo dark red and black, heat glow
- Deepest level (turquoise vein): O'Keeffe meets Klimt — blue-green turquoise in dark matrix, the reveal
- Shadow variant of each (5)
- Count: 10 backgrounds

UI Elements:
- Title screen: Mountain silhouette with Antikythera logo as a mine shaft entrance
- HUD: Health (hearts), gold count, depth level, inventory (rope, bombs, items)
- Pause menu: Prospector's satchel aesthetic
- Victory: Turquoise vein discovered — blue-green glow fills the cave, prospector strikes it
- Game over: Prospector falls in darkness, mountain whispers one final word
- Shop screen: Desert Trader's blanket display
- Count: 6 UI screens

Tile Sets / Object Sprites:
- Cave floor tile: 1
- Cave wall tile: 2 (sandstone, limestone)
- Lava tile (hazard): 1
- Spike pit (hazard): 1
- Turquoise vein (collectible): 1
- Gold dust (currency): 1
- Rope (item): 1
- Bomb (item): 1
- Rock (throwable): 1
- Arrow trap: 1
- Crushed tile (after cave-in): 1
- Crystal (minor collectible): 1
- Count: 13 sprites

Animation Frames:
- Prospector: 4 walk, 2 jump, 2 climb, 2 whip, 1 dig = 11 per freq x 2 = 22
- Rattlesnake: 2 slither, 1 strike = 3
- Gila: 2 walk, 1 bite = 3
- Scorpion: 2 crawl, 1 sting = 3
- Chupacabra: 2 stalk, 2 lunge = 4
- Bat: 2 fly = 2
- Lava bubble: 3
- Cave-in: 4
- Turquoise reveal: 4
- Count: 48 frames

Artist Style Assignment:
- Primary: O'Keeffe (Southwest desert, cave interiors, bone-and-stone palette)
- Secondary: Maynard Dixon (expansive desert landscape for the surface)
- Deep caves: Royo (lava tube drama, heat and darkness)
- Turquoise vein: Klimt (the blue-green reveal as decorative gem-in-matrix)

Total Image Assets: 126

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Surface theme: Acoustic guitar + wind + distant coyote, 50 BPM, referencing Southwestern folk
- Upper cave theme: Adds dripping + marimba, echoing, exploratory
- Deep cave theme: Drops guitar, adds sub-bass drone + heat shimmer sound
- Lava tube theme: Industrial percussion + sub-bass, 84 BPM, dangerous
- Turquoise reveal: All sounds stop — single clear tone, then turquoise harmony
- Shadow theme: All tracks detuned, 84Hz pulse, whisper layer louder
- Death theme: Brief — wind, then silence
- Count: 7 tracks

Sound Effects:
- Jump: grunt + boot scrape
- Whip: crack
- Dig: pickaxe strike
- Rope deploy: rope unfurl + clank
- Bomb explosion: muffled detonation + rock fall
- Gold collect: soft chink
- Turquoise collect: resonant harmonic (higher than gold)
- Enemy hit: varies (snake hiss, gila grunt, scorpion crack)
- Lava contact: sizzle + scream
- Cave-in: rumble + dust
- Shop purchase: coin exchange + blanket rustle
- Count: 12 SFX

Voice Lines:
- Desert Trader: ~5 lines
- Phantom Guide: ~5 lines
- Count: 10 voice lines

Stone Tone Trigger:
- Reward stone: Turquoise -> Mohs ~5-6 -> ~350 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50 (upper caves), 84 (deep/lava — danger escalates the frequency)
- Inn Mode DSP profile: Desert Cave (dry upper, increasingly reverberant deeper, heat shimmer in lava tubes)
- Frequency layer: 42Hz base descending to 84Hz — the deeper you go, the closer to Shadow

Total Audio Assets: 29

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: Left stick / D-pad
- Jump: A / face button
- Whip: B / face button (or RT / R2)
- Use rope: X / face button (aim with stick)
- Use bomb: Y / face button (place at feet)
- Climb: hold up + A near rope/ladder
- Run: hold RT while moving
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: on-screen buttons (mobile)

Steam Integration:
- Achievements: "Lost Dutchman" (find turquoise vein), "Deep Digger" (reach max depth), "Shadow Prospector" (reach turquoise in Shadow mode), "No Death Run" (reach depth 10 without dying), "Turquoise Keeper" (earn Turquoise), "Chupacabra Slayer" (defeat a Chupacabra)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Deepest Descent" and "Most Gold"
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Turquoise, increment gamesCompleted, track depth reached and gold collected

Special Notes:
- Procedural generation is the core challenge. The level generator must create fair but challenging layouts — no impossible rooms. Spelunky's design philosophy: every death is the player's fault, not the game's.
- The Chupacabra is the only cryptid in an arcade game (others appear in the MMORPG). It's the rarest, most dangerous enemy. Players who encounter it will remember.
- Permadeath is essential to the game's identity. No checkpoints. No continues. Every run is a complete journey from surface to depth. This is the only roguelike in the arcade catalog.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 126 images
Phase 3: Audio Production — 7 tracks, 12 SFX, 10 voice lines
Phase 4: Programming — spec only, full game script needed (highest programming complexity — procedural generation + permadeath + physics)
Phase 5: Testing — 7 acceptance criteria (extra focus on procedural generation fairness)
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

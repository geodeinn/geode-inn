# Build Sheet — Aurora Falls

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Limbo |
| Geode Inn Name (OUT) | Aurora Falls |
| Genre/Mechanic | Atmospheric puzzle platformer — black silhouette, physics puzzles, environmental hazards, no text |
| Zone | Iceland (waterfalls and geothermal valleys) |
| Stone Reward | Icelandic Spar |
| Rarity Tier | Rare |
| Price | $4.99 |
| Original Developer | Playdead (2010) |
| Legal Basis | Mechanic only — silhouette physics platformer is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Limbo's unnamed boy -> A Seeker (a silhouette figure descending into an Icelandic geothermal valley)
- Limbo's spider -> The Frost Web (a giant ice formation that mimics spider behavior — cracking, reaching)
- Limbo's tribal children -> Echo Walkers (silhouette figures that flee from the Seeker — not hostile, just afraid)
- Limbo's brain slugs -> Glow Worms (bioluminescent parasites that attach and alter movement)

New Narrative Frame:
- The Seeker descends into an Icelandic geothermal valley at twilight — the land of fire and ice. The journey is wordless. The Seeker is looking for something, but the game never says what. The player infers from the environment.
- Each section is a physics puzzle: push a rock to weight a lever, swing on a rope across a steaming vent, float a crate on a geothermal pool to reach a ledge, time a sprint past a geyser eruption. Classic Limbo-style trial-and-death learning.
- The Frost Web is the signature hazard — an ice formation that grows like a spider web across passages. The Seeker must burn through it (using geothermal heat sources) or find alternate routes.
- The Echo Walkers are the emotional core — they flee from the Seeker, suggesting the Seeker is something to be feared. But near the end, one Echo Walker stops running and reaches out a hand. The meaning is deliberately ambiguous.
- The Icelandic Spar reward: the famous Viking sunstone. Icelandic spar (calcite) polarizes light — Vikings used it to navigate when the sun was hidden. The Seeker finds it at the valley's deepest point — a crystal that shows direction when all other light is gone.

Dialogue Requirements:
- NPC dialogue count: 0 — wordless game. Like Limbo, no text, no dialogue, no narration.
- Voice profiles needed: None
- Whisper Layer presence: Yes — but not words. The Whisper Layer manifests as light. Bioluminescent glow in the geothermal pools, aurora reflections in the ice, the Icelandic Spar's polarization effect. The archive speaks in light here. The Seeker learns to read the light.

Frequency State:
- Living (42Hz): Twilight. Warm geothermal glow, steam, green moss. The valley is strange but alive.
- Shadow (84Hz): Night. Total darkness broken only by bioluminescence and aurora. Hazards are invisible until close. The Frost Web grows faster. The Echo Walkers are gone — only their footprints remain.
- In-Between: The aurora shifts — twilight to night happens in real-time as the Seeker descends deeper.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- The Seeker (silhouette): walk (4), run (2), jump (2), climb (2), drag (1), dead (3 — varies by hazard) x 2 freq = 28 sprites
- Frost Web (ice spider formation): idle (1), growing (2), burning (1) x 2 freq = 8 sprites
- Echo Walker (silhouette): flee (2), stop (1), reach (1) x 2 freq = 8 sprites
- Glow Worm (parasite): attach (1), glowing (1) = 2 sprites
- Count: 46 sprites

Backgrounds/Environments:
- Geothermal valley (twilight): Carr volcanic green, steam, moss, warm glow
- Geothermal valley (night): Carr dark — black rock, bioluminescent blue, aurora above
- Ice cave passage: Adams stark — white ice, black rock, minimal
- Geyser field: Carr + Bierstadt — erupting water, steam columns, dramatic
- Deepest point (spar chamber): Carr + Dali — a cave where light bends, the spar sits on a pedestal of ice
- Shadow variant of each (5)
- Count: 10 backgrounds

UI Elements:
- Title screen: Silhouette of the Seeker descending into a valley with Antikythera logo as the aurora above
- HUD: None — no HUD. Pure immersion. Like Limbo.
- Pause menu: Minimal — just a dark screen with "Continue" and "Quit"
- Victory: The Seeker holds the Icelandic Spar — light bends through it, revealing a direction. The Seeker walks toward it.
- Game over: The Seeker's silhouette falls/dissolves — respawns at last checkpoint
- Count: 3 UI screens (minimal)

Tile Sets / Object Sprites:
- Rock (pushable): 2 sizes
- Crate (floatable): 1
- Rope (swingable): 1
- Geothermal vent (hazard + heat source): 1
- Geyser (timed hazard): 1
- Ice wall (breakable with heat): 1
- Frost Web strand: 1
- Checkpoint (glowing moss): 1
- Icelandic Spar (final): 1
- Lever (mechanism): 1
- Count: 11 sprites

Animation Frames:
- Seeker: 4 walk, 2 run, 2 jump, 2 climb, 1 drag = 11 per freq x 2 = 22
- Seeker death: 3 x 3 variants = 9
- Frost Web grow: 2
- Geyser erupt: 4
- Steam vent: 2
- Aurora shift: 3
- Icelandic Spar light bend: 4
- Count: 46 frames

Artist Style Assignment:
- Primary: Emily Carr (volcanic landscape, spiritual weight, the Sublime in nature)
- Deepest point: Dali (surreal light physics — the spar bends reality)
- Overall: Black silhouette on atmospheric backgrounds (Limbo visual language)

Total Image Assets: 116

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Near-silence — wind + distant water + sub-bass drone, 50 BPM, ambient dread
- Geothermal theme: Adds bubbling + hiss + warmer drone, the valley alive
- Night theme: Drops to wind only + occasional ice crack + aurora hum (7.83Hz)
- Deepest point: Total silence, then the Icelandic Spar resonates — a single clear tone
- Shadow theme: All sounds pitch-shifted down, 84Hz pulse, ice cracks louder
- Count: 5 tracks

Sound Effects:
- Footstep on rock: soft tap
- Footstep on ice: sharper click
- Footstep in water: splash
- Rock push: grinding
- Rope swing: creak + wind
- Geyser erupt: roar + spray
- Frost Web crack: ice fracture
- Frost Web burn: sizzle + melt
- Death (varies): brief, not harsh — thud, splash, or crack depending on hazard
- Checkpoint: soft glow hum
- Icelandic Spar resonate: pure crystalline tone
- Count: 11 SFX

Voice Lines:
- None — 0 voice lines (wordless game)

Stone Tone Trigger:
- Reward stone: Icelandic Spar -> Mohs ~3 -> ~225 Hz at 12dB below ambient bed
- Special: The spar's tone is unique — it plays as a clear, pure note cutting through ambient silence. The contrast IS the effect.

Audio Architecture:
- Base BPM: 50 (but often drops to pure ambient — this is the third-quietest game)
- Inn Mode DSP profile: Geothermal Valley (wet, echoing, steam diffusion, moderate-long reverb, volcanic warmth)
- Frequency layer: 42Hz base with 84Hz Shadow shift
- Special: The wordless design means audio carries ALL emotional weight. Sound design must be exceptional.

Total Audio Assets: 16

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: Left stick / D-pad (left, right)
- Jump: A / face button
- Grab/push: hold B / face button near object
- Climb: hold up + A near rope/ledge
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: on-screen d-pad + action button (mobile)

Steam Integration:
- Achievements: "The Spar" (find Icelandic Spar), "Untouched" (beat game with fewer than 10 deaths), "Shadow Walker" (beat Shadow mode), "The Hand" (reach the moment the Echo Walker reaches out), "Icelandic Spar Keeper" (earn the stone)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Fewest Deaths" (total deaths to completion)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Icelandic Spar, increment gamesCompleted

Special Notes:
- Wordless design is the game's identity. NO text anywhere except the pause menu. Story is told through environment, physics, and death.
- Death is educational, not punishing — like Limbo. Each death teaches a lesson about the hazard. Quick respawn.
- The Echo Walker reaching out at the end is the emotional climax — no text, no explanation. The player decides what it means.
- Along with Monster of the Deep and Aurora Borealis, this completes the Inn's "silence trilogy" — three wordless or near-wordless games that trust the player to feel without being told what to feel.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 116 images
Phase 3: Audio Production — 5 tracks, 11 SFX, 0 voice lines (sound design carries the game)
Phase 4: Programming — spec only, full game script needed (moderate — 2D physics + checkpoint system)
Phase 5: Testing — 7 acceptance criteria (extra focus on death/respawn feel)
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

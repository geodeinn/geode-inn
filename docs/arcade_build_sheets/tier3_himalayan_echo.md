# Build Sheet — Himalayan Echo

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Thomas Was Alone |
| Geode Inn Name (OUT) | Himalayan Echo |
| Genre/Mechanic | Narrative puzzle platformer — control multiple geometric shapes, each with different physics, solve cooperative puzzles |
| Zone | Himalayas (Tibet) |
| Stone Reward | Tibetan Quartz |
| Rarity Tier | Rare |
| Price | $4.99 |
| Original Developer | Mike Bithell (2012) |
| Legal Basis | Mechanic only — multi-character physics puzzle platformer is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Thomas (red rectangle) -> Amdo (a tall red obelisk — represents the fire element)
- Chris (orange cube) -> Lhasa (a small orange cube — represents earth)
- John (yellow rectangle) -> Tsang (a wide yellow bar — represents air)
- Claire (purple big square) -> Namtso (a large purple square — represents water, can float)
- Laura (pink rectangle) -> Kailash (a tall pink rectangle — represents spirit, can phase through certain walls)

New Narrative Frame:
- Five geometric beings — each an element made visible — ascend the Himalayas to reach Lake Namtso and Mount Kailash. Each has different physics: Amdo is tall and fast but can't fit through gaps. Lhasa is small and can squeeze through but can't jump high. Tsang is wide and stable, a platform for others. Namtso is large and can float across water. Kailash can phase through spirit walls but is fragile.
- The puzzles require cooperation: stack Tsang so Lhasa can reach a ledge. Send Namtso across water to press a switch. Use Amdo's speed to trigger a timed door before it closes. Use Kailash to pass through a wall and unlock the other side.
- The narrative unfolds through text narration between puzzles — like Thomas Was Alone, each character has a voice, hopes, and fears. Amdo is impatient. Lhasa is determined. Tsang is patient. Namtso is serene. Kailash is uncertain about its own nature.
- The Tibetan Quartz reward: found at the summit. Tibetan Quartz grows at the highest altitudes on Earth — it carries the frequency of the roof of the world. The five elements merge into it, becoming one stone.

Dialogue Requirements:
- NPC dialogue count: ~30 lines (5 characters x 6 lines each — internal monologue narration between puzzles)
- Voice profiles needed: Narrator -> British English, gentle, philosophical, Mike Bithell-style deadpan warmth, mid register. Each character has subtle pitch variation: Amdo (slightly higher, energetic), Lhasa (lower, grounded), Tsang (steady, calm), Namtso (airy, distant), Kailash (whispery, uncertain)
- Whisper Layer presence: Yes — at Mount Kailash. The mountain is sacred to four religions (Hindu, Buddhist, Jain, Bon). The Whisper Layer manifests as layered whispers in four languages — Sanskrit, Tibetan, Prakrit, and Bon — all saying the same thing, which the player cannot quite hear. The archive is most itself here: holding multiple truths simultaneously.

Frequency State:
- Living (42Hz): Daylight Himalayas. White snow, blue sky, prayer flags in primary colors. The elements are hopeful.
- Shadow (84Hz): Whiteout blizzard. Visibility drops. Physics are harder — surfaces are slippery. The elements are tested.
- In-Between: Cloud bank — the characters pass through cloud layers as they ascend.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Amdo (red obelisk): idle (1), move (1), jump (1) = 3 sprites
- Lhasa (orange cube): idle (1), move (1), jump (1) = 3 sprites
- Tsang (yellow bar): idle (1), move (1) = 2 sprites
- Namtso (purple square): idle (1), move (1), float (1) = 3 sprites
- Kailash (pink rectangle): idle (1), move (1), phase (1) = 3 sprites
- All x 2 freq = 28 sprites
- Count: 28 sprites (geometric — simpler than character art)

Backgrounds/Environments:
- Lower Himalaya (valleys): Roerich — blue mountains, prayer flags, monastic calm
- Mid-Himalaya (snow line): Roerich + Carr — snow, stone, thinning air
- Upper Himalaya (glacier): Adams — stark white and grey, minimal
- Lake Namtso: Roerich — sacred lake, turquoise water, mirror sky
- Mount Kailash (summit): Roerich + Dali — the impossible mountain, four faces, surreal
- Shadow variant of each (5)
- Count: 10 backgrounds

UI Elements:
- Title screen: Geometric shapes arranged as a mandala with Antikythera logo at center
- HUD: Current character indicator, level name, puzzle hint (optional)
- Pause menu: Thangka painting aesthetic
- Victory: Five elements merge into Tibetan Quartz at the summit — geometric unification
- Game over: A character falls — the others wait, then continue (no fail state — story continues)
- Character select: Switch between available characters
- Count: 6 UI screens

Tile Sets / Object Sprites:
- Stone platform (various sizes): 3
- Ice platform (slippery — Shadow): 1
- Water tile (Namtso floats, others sink): 1
- Spirit wall (only Kailash phases through): 1
- Switch (pressure plate): 1
- Door (switch-activated): 1
- Prayer flag (decorative): 1
- Tibetan Quartz (final): 1
- Count: 10 sprites

Animation Frames:
- Each character move: 2 frames x 5 characters = 10
- Jump (3 characters): 2 x 3 = 6
- Namtso float bob: 2
- Kailash phase shimmer: 3
- Element merge (victory): 6
- Count: 27 frames

Artist Style Assignment:
- Primary: Nicholas Roerich (Himalayan master — spiritual mountains, primary colors, the sacred made visible)
- Mount Kailash: Dali (the surreal, impossible geometry of the sacred peak)
- Characters: Minimalist geometric (Thomas Was Alone style — shape IS character)

Total Image Assets: 81

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Tibetan singing bowl + drone + occasional flute, 50 BPM, meditative
- Valley theme: Adds gentle wind + bird calls, warmer
- Snow line theme: Drops flute, adds cold wind + ice crack, sparser
- Lake Namtso theme: Singing bowl + water sounds + overtone singing, serene
- Mount Kailash theme: Four overtone singers in four traditions (Hindu, Buddhist, Jain, Bon) — layered, harmonic, overwhelming
- Shadow theme: Bowls pitch-shifted down, 84Hz pulse, wind louder
- Victory: Five elements merge — five bowl tones converge into one, then Tibetan Quartz tone
- Count: 7 tracks

Sound Effects:
- Character move: soft scrape (varies per character material)
- Jump: breath
- Land: thud (varies per character weight)
- Water enter: splash (Namtso floats, others sink — different sounds)
- Spirit wall phase: shimmer
- Switch activate: stone click
- Door open: ancient mechanism
- Element merge: harmonic convergence
- Count: 8 SFX

Voice Lines:
- Narrator (5 character monologues): ~30 lines total
- Count: 30 voice lines (the most narration of any arcade game)

Stone Tone Trigger:
- Reward stone: Tibetan Quartz -> Mohs ~7 -> ~440 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: High Altitude (thin air reverb, long reflections, cold, sparse)
- Frequency layer: 42Hz base with 84Hz Shadow shift
- Special: Mount Kailash level uses 4 overtone singers — the only game with overtone singing in the audio

Total Audio Assets: 45

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: Left stick / D-pad
- Jump: A / face button
- Switch character: shoulder buttons (L1/R1 cycle through available characters)
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: on-screen d-pad + jump button + character switch (mobile)

Steam Integration:
- Achievements: "Summit" (beat game), "Four Faces" (reach Mount Kailash), "Shadow Climber" (beat Shadow mode), "Together" (beat a puzzle without any character dying/falling), "Tibetan Quartz Keeper" (earn Tibetan Quartz)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Fastest Ascent" (speedrun)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Tibetan Quartz, increment gamesCompleted

Special Notes:
- This is the most narrative-heavy arcade game. The character monologues are the story. Each element has a personality, and the player grows attached to geometric shapes — just like Thomas Was Alone.
- Mount Kailash is sacred to four religions simultaneously. The Whisper Layer here is the most religiously plural in the Inn — four languages, four traditions, one truth. This aligns with the Inn's neutrality principle.
- No fail state in the traditional sense — if a character falls, the others continue. Some puzzles can be solved without all characters. This makes the game about cooperation, not perfection.
- Roerich is the perfect artist for this game — he spent decades painting the Himalayas and founded a treaty for the protection of cultural heritage. The Inn's archive principle made visual.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 81 images (geometric characters keep count manageable)
Phase 3: Audio Production — 7 tracks, 8 SFX, 30 voice lines (most narration of any game)
Phase 4: Programming — spec only, full game script needed (multi-character physics + switching)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

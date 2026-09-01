# Build Sheet — Appalachian Trail

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Oregon Trail |
| Geode Inn Name (OUT) | Appalachian Trail |
| Genre/Mechanic | Resource management journey — travel a trail, manage supplies, survive events, reach destination |
| Zone | Appalachian Mountains (Eastern US) |
| Stone Reward | Ruby |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | MECC (1971) |
| Legal Basis | Mechanic only — resource management travel game is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Oregon Trail pioneers -> A longhunter expedition (colonial-era Appalachian explorers)
- Oregon Trail's river crossings -> Mountain pass crossings (navigating ridgelines in fog)
- Oregon Trail's dysentery/illness -> Sprained ankles, hypothermia, bear encounters
- Oregon Trail's hunting minigame -> Foraging minigame (identifying edible vs. poisonous plants — ties to Poison Garden knowledge)
- Oregon Trail's rafting -> Cave exploration (Appalachian cavern systems)

New Narrative Frame:
- The player leads a longhunter expedition through the Appalachian Mountains in the 1770s. The goal: reach the hidden Ruby Valley beyond the Smokies, where rubies erode out of the ancient Cretaceous marble.
- The journey is divided into segments: trail food management, pace setting (steady/fast/grueling), rest decisions, and random events. Events include: finding a gemstone deposit, encountering Cherokee traders (who offer stones for supplies), crossing a flooded creek, discovering an unmarked cave with crystals, and surviving a mountain storm.
- The foraging minigame tests plant knowledge — collect the right plants for medicine, avoid the poisonous ones. This directly connects to Poison Garden's lore.
- The cave exploration minigame is a brief navigation puzzle — flashlight (torch) reveals crystals in the walls. Collect what you can before the torch burns down.
- The Ruby reward: Appalachia's hidden gem. Rubies are found in the Cowee Valley in North Carolina — one of the few ruby deposits in North America. The longhunter who reaches the valley earns the stone.

Dialogue Requirements:
- NPC dialogue count: ~12 lines (Cherokee Trader: 4, Expedition Members: 4, Trail Hermit: 4)
- Voice profiles needed:
  - Cherokee Trader -> Cherokee-accented English, measured, trade cadence, mid register
  - Expedition Members -> American colonial English, practical, varied registers
  - Trail Hermit -> Appalachian English, slow, cryptic, high register (mountain loner)
- Whisper Layer presence: Yes — in the caves. Crystal walls whisper in an old language, older than Cherokee, older than any living tongue. The archive's deepest layer.

Frequency State:
- Living (42Hz): Summer. Green mountains, clear trails, abundant foraging. Cherokee traders are friendly.
- Shadow (84Hz): Winter. Snow, bare trees, frozen creeks. Foraging is scarce. Hypothermia risk. The Trail Hermit appears more often with warnings.
- In-Between: Season change between segments — leaves turn, frost forms.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Longhunter (player avatar): idle (1), walking (2), foraging (1), cave-exploring (1) x 2 freq = 10 sprites
- Cherokee Trader: portrait (1), trading (1) x 2 freq = 4 sprites
- Expedition Members (3 variants): idle (1) x 2 freq = 6 sprites
- Trail Hermit: portrait (1), warning (1) x 2 freq = 4 sprites
- Bear (event): idle (1), attacking (1) = 2 sprites
- Count: 26 sprites

Backgrounds/Environments:
- Mountain trail (summer): Benton lush green Appalachians, rolling ridges
- Mountain trail (winter): Wyeth snow, bare trees, grey sky
- Cherokee trading post: Hokusai-meets-Benton — wooden structure, goods displayed
- Cave interior: Klimt dark with crystal veins
- Ruby Valley (destination): Bierstadt golden valley reveal, mountains framing
- Shadow variant of each (5)
- Count: 10 backgrounds

UI Elements:
- Title screen: Mountain trail sign with Antikythera logo carved into the wood
- HUD: Supplies list (food, medicine, torches), party health, miles traveled, pace setting
- Pause menu: Leather journal aesthetic
- Victory: Ruby Valley reached — rubies in the creek bed, expedition celebrates
- Game over: Expedition stranded, supplies gone, mountains silent
- Event screen: Split layout — illustration on top, choices below
- Foraging minigame: Grid of plants — tap edible ones, avoid poisonous
- Cave minigame: Dark cave with torch radius, crystals to collect
- Count: 8 UI screens

Tile Sets / Object Sprites:
- Edible plant (3 types): 3
- Poisonous plant (2 types): 2
- Medicine herb: 1
- Ruby (cave collectible): 1
- Crystal (cave collectible): 1
- Torch (light source): 1
- Food supply icon: 1
- Medicine supply icon: 1
- Trail marker: 1
- Creek tile (hazard): 1
- Snow tile (hazard): 1
- Count: 14 sprites

Animation Frames:
- Longhunter: 2 walk, 1 forage = 3 per freq x 2 = 6
- Bear: 2 attack = 2
- Torch flicker: 3
- Crystal sparkle: 2
- Season transition: 3
- Ruby reveal: 3
- Count: 19 frames

Artist Style Assignment:
- Primary: Thomas Hart Benton (muscular American landscape, regionalist, earthy motion)
- Secondary: Wyeth (for winter sections — sparse, intimate, every detail deliberate)
- Cave: Klimt (crystal veins as decorative gold-on-dark)

Total Image Assets: 77

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Fiddle + clawhammer banjo + foot stomp, 50 BPM, referencing Appalachian folk traditions
- Winter theme: Drops banjo, adds wind + sparse fiddle, mournful
- Cherokee trading theme: Adds flute (Native American style) + drum, respectful fusion
- Cave theme: Near-silent — drip + drone + crystal hum
- Victory: Ruby Valley — fiddle celebration + banjo burst
- Shadow theme: Minor key fiddle, 84Hz pulse, wind louder
- Count: 6 tracks

Sound Effects:
- Walk on trail: bootstep on dirt
- Walk on snow: crunch
- Forage correct: soft chime
- Forage wrong (poisonous): discordant note
- Bear encounter: growl + gasp
- Cave drip: echoing plink
- Crystal collect: crystalline ping
- Ruby collect: bright chime
- Creek crossing: splash
- Supplies depleted: warning tone
- Count: 10 SFX

Voice Lines:
- Cherokee Trader: ~4 lines
- Expedition Members: ~4 lines
- Trail Hermit: ~4 lines
- Count: 12 voice lines

Stone Tone Trigger:
- Reward stone: Ruby -> Mohs ~9 -> ~680 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Mountain Forest (moderate reverb, organic, leaf-filtered, warm)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 28

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Navigate menus: D-pad / left stick
- Select: A / face button
- Foraging minigame: D-pad to move, A to collect
- Cave minigame: Left stick to move, A to collect crystal
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: tap to select, tap to collect (mobile — natural fit for foraging)

Steam Integration:
- Achievements: "Ruby Valley" (beat game), "Master Forager" (forage 20 plants correctly in one run), "Shadow Survivor" (beat Shadow/winter mode), "Frugal Expedition" (reach Ruby Valley with full supplies), "Ruby Keeper" (earn Ruby)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Best Expedition" (score based on speed, supplies remaining, fossils collected)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Ruby, increment gamesCompleted

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 77 images
Phase 3: Audio Production — 6 tracks, 10 SFX, 12 voice lines
Phase 4: Programming — spec only, full game script needed (event system + 2 minigames)
Phase 5: Testing — 7 acceptance criteria
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

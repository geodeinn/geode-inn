# Build Sheet — Saguaro Bloom

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Stardew Valley |
| Geode Inn Name (OUT) | Saguaro Bloom |
| Genre/Mechanic | Farming/life sim — tend a desert garden, grow crystals, trade with travelers, cycle through seasons |
| Zone | Sonoran Desert (Arizona/Mexico) |
| Stone Reward | Fire Agate |
| Rarity Tier | Rare |
| Price | $4.99 |
| Original Developer | ConcernedApe (2016) |
| Legal Basis | Mechanic only — farming/life sim format is not copyrightable. All assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Stardew's player farmer -> A Desert Keeper (inheritor of an abandoned desert botanical garden)
- Stardew's villagers -> Desert travelers: a Tohono O'odham elder, a rockhound, a migrating pollinator biologist, a retired miner, a traveling musician
- Stardew's crops -> Crystal crops (grow crystals in desert soil using mineral water + sun) and desert plants (saguaro, ocotillo, prickly pear, agave)
- Stardew's mines -> Geode cracking (break open geodes found in the desert to reveal stones for the Inn's archive)
- Stardew's seasons -> Desert seasons: Monsoon (summer growth), Dry (winter dormancy), Spring Bloom (wildflowers), Harvest (agave + crystal collection)

New Narrative Frame:
- The player inherits a desert botanical garden in the Sonoran Desert. The garden was once a waystation for travelers — a place to rest, trade, and share stories. The Keeper restores it.
- Gameplay loop: tend crystal plots (plant mineral seeds, water with geothermal water, harvest grown crystals), tend desert plants (saguaro grow slowly over real-time days, ocotillo blooms after rain), forage for wild stones, crack geodes, trade with travelers, and upgrade the garden.
- Crystal growing is the Stardew crop equivalent. Different crystals need different conditions: quartz needs full sun, amethyst needs shade, calcite needs water, pyrite needs dry heat. The desert's extreme conditions make it the perfect crystal garden.
- Travelers arrive at the garden restocked. Each has trade goods, stories, and quests. The Tohono O'odham elder trades desert wisdom and rare stones. The rockhound trades geodes. The biologist trades pollinator data (affects crop yields). The musician trades songs (adds to the garden's ambient music).
- The Fire Agate reward: the Sonoran Desert's signature stone. Fire Agate has iridescent copper inclusions that flash red, orange, and green — desert fire made stone. It's earned after a full year cycle (all 4 desert seasons) with a thriving garden.

Dialogue Requirements:
- NPC dialogue count: ~40 lines (5 travelers x 8 lines each — trades, stories, quests)
- Voice profiles needed:
  - Tohono O'odham Elder -> O'odham-inflected English, slow, wisdom cadence, deep register
  - Rockhound -> American Southwest, enthusiastic, fast-talking, mid-high register
  - Pollinator Biologist -> American academic, precise, warm, mid register
  - Retired Miner -> American gravelly, tired but kind, low register
  - Traveling Musician -> Mexican Spanish-inflected English, melodic speech, varied register
- Whisper Layer presence: Yes — in the geodes. When a geode is cracked open, the interior briefly whispers. Each geode holds a fragment of the archive — a stone's story, a place's memory. The Whisper Layer is most active during geode cracking, connecting this game's harvest mechanic to the Inn's archive.

Frequency State:
- Living (42Hz): Monsoon and Spring Bloom. Green desert, rain, wildflowers. Crystal growth is fast. Travelers are frequent.
- Shadow (84Hz): Dry season and Harvest. Brown desert, heat shimmer. Crystal growth is slow but crystals are higher quality. Travelers are rare but bring better trades.
- In-Between: Season transitions — monsoon clouds building, or dry wind starting.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Desert Keeper: idle (1), tending (2), foraging (1), trading (1) x 2 freq = 10 sprites
- Tohono O'odham Elder: portrait (1), trading (1) x 2 freq = 4 sprites
- Rockhound: portrait (1), trading (1) x 2 freq = 4 sprites
- Pollinator Biologist: portrait (1), trading (1) x 2 freq = 4 sprites
- Retired Miner: portrait (1), trading (1) x 2 freq = 4 sprites
- Traveling Musician: portrait (1), playing (1) x 2 freq = 4 sprites
- Count: 30 sprites

Backgrounds/Environments:
- Garden (monsoon): O'Keeffe green desert, rain, saguaro with arms
- Garden (dry): O'Keeffe brown desert, heat shimmer, ocotillo skeletal
- Garden (spring bloom): O'Keeffe wildflower carpet, golden poppies
- Garden (harvest): Dixon amber light, agave ready, crystals glowing
- Garden interior (geode cracking station): Klimt dark interior with crystal display
- Desert forage map: Adams vast desert, scattered rock formations
- Shadow variant of each (6)
- Count: 12 backgrounds

UI Elements:
- Title screen: Saguaro silhouette with Antikythera logo as a blooming cactus flower
- HUD: Day/season indicator, crystal plot status, plant status, inventory, coin count
- Pause menu: Leather-bound botanical journal
- Inventory: Grid of crystals, stones, seeds, tools
- Trade screen: Traveler portrait + goods offered + goods requested
- Geode cracking: Crack animation + revealed crystal + Whisper Layer flash
- Garden upgrade: Building options (crystal greenhouse, water tank, rest area, geode workshop)
- Victory: Fire Agate forms in the garden's oldest crystal plot — full year cycle complete
- Count: 8 UI screens

Tile Sets / Object Sprites:
- Crystal plot (empty, growing, ready): 3 stages
- Crystal types (6): quartz, amethyst, calcite, pyrite, celestite, selenite = 6
- Saguaro (3 growth stages): 3
- Ocotillo (2 states: bare, blooming): 2
- Prickly pear (2 states): 2
- Agave (2 states): 2
- Geode (uncracked, cracked): 2
- Water can (tool): 1
- Pickaxe (tool): 1
- Fire Agate (final): 1
- Count: 22 sprites

Animation Frames:
- Keeper tend: 2
- Crystal grow: 3 per type x 6 = 18
- Saguaro grow: 3 (over real-time days — slow animation)
- Geode crack: 4
- Whisper flash: 2
- Rain fall: 3
- Heat shimmer: 2
- Fire Agate formation: 5
- Count: 39 frames

Artist Style Assignment:
- Primary: Georgia O'Keeffe (desert botanicals, stark beauty, the power of a single bloom)
- Secondary: Maynard Dixon (desert landscape, golden light, vast sky)
- Geode interior: Klimt (crystal display as decorative gold-on-dark)

Total Image Assets: 131

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Monsoon theme: Acoustic guitar + rain percussion + soft drone, 50 BPM, desert rain
- Dry theme: Sparser — guitar + wind + heat shimmer sound, slower, heavier
- Spring bloom theme: Bright guitar + flute + bird calls, 50 BPM, renewal
- Harvest theme: Guitar + harmonica + gentle percussion, warm, reflective
- Geode cracking: Suspense — drone builds, then crack + crystal chime + whisper
- Traveler music (musician NPC plays): Various folk tunes, live in the garden
- Shadow theme: All tracks detuned, 84Hz pulse, wind louder, fewer instruments
- Victory: Fire Agate — guitar harmonic + crystal chime + warm chord
- Count: 8 tracks

Sound Effects:
- Plant seed: soft earth pat
- Water plant: gentle pour
- Crystal harvest: crystalline chime (varies by crystal type)
- Geode crack: sharp fracture + reveal
- Forage item collect: soft pick-up
- Trade complete: coin clink + handshake
- Saguaro grow (rare sound — plays once per real-time day): deep creak
- Rain: gentle desert rain
- Wind: dry desert wind
- Count: 9 SFX

Voice Lines:
- 5 travelers: ~8 lines each = 40 lines
- Count: 40 voice lines (most of any arcade game)

Stone Tone Trigger:
- Reward stone: Fire Agate -> Mohs ~6.5-7 -> ~415 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Desert Garden (warm, dry air, moderate reverb, organic, plant-filtered)
- Frequency layer: 42Hz base with 84Hz Shadow shift
- Special: The traveling musician's songs become part of the garden's ambient music after being traded for — the player builds their own soundtrack

Total Audio Assets: 57

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Move: Left stick / D-pad (8 directions)
- Interact (tend, water, harvest, trade): A / face button
- Use tool: B / face button (cycle tools with shoulder buttons)
- Open inventory: Y / face button
- Open map: X / face button
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: tap to interact, drag to move (mobile — great fit for sim games)

Steam Integration:
- Achievements: "Full Cycle" (complete all 4 seasons), "Crystal Gardener" (grow all 6 crystal types), "Master Trader" (trade with all 5 travelers), "Shadow Keeper" (complete a full cycle in Shadow mode), "Fire Agate Keeper" (earn Fire Agate), "Geode Master" (crack 50 geodes)
- Cloud saves: Sync PlayerProgress (critical — garden state persists across sessions)
- Leaderboard: "Most Valuable Garden" (total crystal + plant value)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Fire Agate, increment gamesCompleted, sync garden state and crystal collection

Special Notes:
- This is the only game with a real-time clock mechanic. Saguaro grow over real days. Crystals have growth timers. The garden persists between play sessions — like Stardew Valley's day cycle, but mapped to the Inn's time.
- The geode cracking is the archive connection — every geode cracked reveals a stone and its story fragment, adding to the Inn's library. This game is the most direct "archivist" game in the catalog.
- The traveling musician's songs becoming ambient music is the only player-curated soundtrack in the arcade. The garden sounds different for every player based on which songs they've collected.
- 40 voice lines is the most of any arcade game — this is the most character-rich game in the catalog. The travelers ARE the game.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 131 images
Phase 3: Audio Production — 8 tracks, 9 SFX, 40 voice lines (largest audio budget)
Phase 4: Programming — spec only, full game script needed (highest complexity — real-time clock, farming system, trade system, 5 NPC schedules)
Phase 5: Testing — 7 acceptance criteria (extra focus on persistence and real-time mechanics)
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

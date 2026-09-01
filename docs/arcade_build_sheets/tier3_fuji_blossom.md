# Build Sheet — Fuji Blossom

## SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | Hanafuda |
| Geode Inn Name (OUT) | Fuji Blossom |
| Genre/Mechanic | Card matching — match cards by month/flower, collect sets, score combos |
| Zone | Mount Fuji (Japan) |
| Stone Reward | Cherry Opal |
| Rarity Tier | Uncommon |
| Price | $3.99 |
| Original Developer | Nintendo (1889 — traditional card game) |
| Legal Basis | Public domain — Hanafuda is a traditional Japanese card game, centuries old. All art assets original. |

## SECTION 2: STORYLINE ADAPTATION

Original Characters Being Replaced:
- Traditional Hanafuda has no characters — it's a card game. The Inn wraps it in narrative context.
- The "player" -> A Wandering Botanist climbing Mount Fuji, collecting blossoms across 12 months (matching the 12 Hanafuda suits)
- NPC opponent -> The Mountain Spirit (Tengu — appears as a masked figure dealing cards)

New Narrative Frame:
- The Wandering Botanist plays Hanafuda against the Tengu at a teahouse on Mount Fuji's slope. Each match represents a season of climbing. The 12 Hanafuda suits (January pine, February plum, March cherry, etc.) map to the 12 months of the Fuji climbing season.
- Standard Hanafuda rules: match cards from the field to your hand by flower/month. Collect special combinations (yaku) for bonus points. The Tengu plays with calculated strategy — it's a worthy opponent.
- The Inn's twist: each card is illustrated with Geode Inn stone lore. January's pine cards feature green stones (malachite, jade). March's cherry cards feature pink stones (rose quartz, cherry opal). Each suit teaches the player which stones correspond to which season and element.
- Winning a match advances the botanist up the mountain. 12 matches = 12 months = reaching the summit.
- The Cherry Opal reward: the stone of March (cherry blossom season). Found at the summit — the Tengu offers it as a concession gift. Cherry Opal holds the pink fire of the briefest bloom.

Dialogue Requirements:
- NPC dialogue count: ~12 lines (The Tengu — speaks between matches, offering commentary on the botanist's play style)
- Voice profiles needed: The Tengu -> Japanese-accented English, measured, playful but ancient, mid-low register with a hint of laughter
- Whisper Layer presence: Yes — subtle. The cards themselves whisper when matched. A pair of cherry cards whisper "spring" in Japanese. A pair of moon cards whisper "remember." The archive speaks in the language of the cards.

Frequency State:
- Living (42Hz): Daylight teahouse. Warm wood, tatami, sake cup on the table. Cherry blossoms drift past the window. The Tengu is relaxed, conversational.
- Shadow (84Hz): Night teahouse. Candlelit. The Tengu's mask glows. Cards have darker illustrations. The Tengu plays more aggressively — harder difficulty.
- In-Between: Dusk between matches — the sun sets over Fuji, lanterns light.

## SECTION 3: VISUAL ASSETS NEEDED

Character Sprites/Portraits:
- Wandering Botanist: portrait (1), playing cards (1) x 2 freq = 4 sprites
- The Tengu: portrait (1), dealing (1), reacting (1) x 2 freq = 6 sprites
- Count: 10 sprites

Card Art (48 cards — 12 suits x 4 cards each):
- January (pine): 4 cards (pine, pine, pine+crane, special)
- February (plum): 4 cards (plum, plum, plum+bush warbler, special)
- March (cherry): 4 cards (cherry, cherry, cherry+curtain, special)
- April (wisteria): 4 cards (wisteria, wisteria, wisteria+cuckoo, special)
- May (iris): 4 cards (iris, iris, iris+bridge, special)
- June (peony): 4 cards (peony, peony, peony+butterfly, special)
- July (lespedeza): 4 cards (lespedeza, lespedeza, lespedeza+boar, special)
- August (pampas grass): 4 cards (pampas, pampas, pampas+moon, special)
- September (chrysanthemum): 4 cards (chrysanthemum, chrysanthemum, chrysanthemum+sake cup, special)
- October (maple): 4 cards (maple, maple, maple+deer, special)
- November (willow): 4 cards (willow, willow, willow+swallow, special/rain man)
- December (paulownia): 4 cards (paulownia, paulownia, paulownia, special/phoenix)
- All cards x 2 freq states = 96 card images
- Count: 96 card sprites

Backgrounds/Environments:
- Teahouse interior (day): Hokusai warm wood, tatami, shoji screens, Fuji visible through window
- Teahouse interior (night): Hokusai candlelit, darker, mask shadows
- Mount Fuji summit (victory): Hokusai + O'Keeffe — vast sky, the peak, cherry opal in hand
- Count: 3 backgrounds

UI Elements:
- Title screen: Hanafuda card spread with Antikythera logo on the special phoenix card
- HUD: Player score, Tengu score, month indicator (which suit is active), match number
- Pause menu: Folded fan aesthetic
- Victory: Botanist at summit, Tengu bows, Cherry Opal offered
- Game over: Tengu sweeps the cards, smiles, "Another year, another climb"
- Yaku (combo) display: Calligraphic flash showing the combination name
- Count: 6 UI screens

Tile Sets / Object Sprites:
- Card back (decorative): 1
- Match particle (card pair glow): 1
- Yaku flash (calligraphy): 1
- Sake cup (decorative on table): 1
- Count: 4 sprites

Animation Frames:
- Card flip: 3
- Card slide (play): 2
- Match glow: 2
- Tengu deal: 2
- Cherry blossom drift: 3
- Count: 12 frames

Artist Style Assignment:
- Primary: Hokusai (Japanese woodblock precision, every card a mini-woodblock print)
- Secondary: Traditional Hanafuda art style reimagined with Geode Inn stone lore integration

Total Image Assets: 131

## SECTION 4: AUDIO ASSETS NEEDED

Music Tracks:
- Main theme: Koto + shakuhachi + soft percussion, 50 BPM, traditional Japanese ambiance
- Shadow theme: Koto in minor key + deeper shakuhachi, 84Hz pulse, nighttime
- Match tension: Adds taiko build during close games
- Victory: Koto ascending + shakuhachi breath + single bell
- Count: 4 tracks

Sound Effects:
- Card flip: paper snap
- Card place: soft tap on wood
- Match made: koto string pluck (harmonious)
- Yaku (combo): taiko hit + koto chord
- No match: dull tap
- Tengu laugh: brief, warm
- Month change: wind chime
- Count: 7 SFX

Voice Lines:
- The Tengu: ~12 lines
- Count: 12 voice lines

Stone Tone Trigger:
- Reward stone: Cherry Opal -> Mohs ~5.5-6.5 -> ~370 Hz at 12dB below narration

Audio Architecture:
- Base BPM: 50
- Inn Mode DSP profile: Teahouse (intimate, wood-paneled reverb, warm, close)
- Frequency layer: 42Hz base with 84Hz Shadow shift

Total Audio Assets: 23

## SECTION 5: PROGRAMMING REQUIREMENTS

Engine: Godot 4.x | Offline-first

Controller Support:
- Navigate cards: D-pad / left stick (move cursor across field/hand)
- Select/play card: A / face button
- Confirm match: A / face button
- Pause: Start / Options
- Bluetooth: auto-detect, prompt if no controller
- Touch: tap to select and play (mobile — ideal for card games)

Steam Integration:
- Achievements: "Summit" (beat all 12 months), "Yaku Master" (score 5 different yaku in one match), "Shadow Climber" (beat Shadow mode), "Tengu's Equal" (beat the Tengu in a perfect game — no wasted moves), "Cherry Opal Keeper" (earn Cherry Opal)
- Cloud saves: Sync PlayerProgress
- Leaderboard: "Highest Score" (total across all 12 matches)
- Overlay: Shift+Tab or LB+RB

Base44 API: On completion POST to PlayerProgress — add Cherry Opal, increment gamesCompleted

Special Notes:
- The Tengu AI must be genuinely good at Hanafuda. It should calculate optimal plays, track revealed cards, and pursue yaku combos. Easy/normal/hard difficulty modes.
- This is the only traditional card game in the arcade catalog. It bridges the gap between the arcade and the tabletop/card game products (Resonance CCG).
- 48 unique card illustrations are the largest single art task for any card-based game. Each card should be a mini-woodblock print incorporating the corresponding stone lore.
- Hanafuda is Nintendo's oldest product (1889). Using it in the Inn is a quiet nod to gaming history — the oldest card game company meeting the newest game platform.

## SECTION 6: WALKTHROUGH

Phase 1: Design Document — DONE
Phase 2: Asset Creation — 131 images (48 unique card illustrations + variants)
Phase 3: Audio Production — 4 tracks, 7 SFX, 12 voice lines
Phase 4: Programming — spec only, full game script needed (card logic + Tengu AI)
Phase 5: Testing — 7 acceptance criteria (extra focus on Tengu AI quality)
Phase 6: Packaging — Steam build
Phase 7: Acceptance Check — all 7 boxes

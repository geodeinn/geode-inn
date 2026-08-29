# Geode Inn — Tumble Run: Full Game Design Specification
## The Standalone Arcade Game Starring Tumble
## Sellable Add-On + In-Game Minigame

---

## Product Vision

Tumble Run is a simple, addictive endless runner in the tradition of the Chrome dinosaur game — but with the depth of a real arcade game. The core loop is 30 seconds: Tumble rolls, the player jumps and ducks, Tumble gets stuck. The long game is hundreds of runs: unlocking cosmetics, chasing leaderboards, discovering hidden encounters, and slowly understanding that the game you're playing is a love story between a note of music and the song it came from.

**Two delivery models:**

1. **In-Game (Free):** Unlocked inside the Geode Inn after the first "Tumble's Stuck" random event. Base game, no cosmetics, in-game leaderboards. Drives engagement with the main game.

2. **Standalone (Paid):** Sold separately on Steam (and mobile). Full game with cosmetics, power-ups, daily challenges, global leaderboards, and the full encounter system. The standalone is the complete Tumble experience.

**The bridge:** Playing the standalone unlocks a "Tumble Run Champion" badge in the Geode Inn. Playing the Geode Inn version first gives the standalone a cosmetic head start (the Inn's welcome mat Tumble skin). Cross-pollination, not paywalling.

---

## Core Gameplay

### Controls (Two Inputs)
- **Spacebar / Tap:** Jump (Tumble bounces in a parabolic arc)
- **Down Arrow / Swipe Down:** Duck (Tumble compresses into a flatter oval)
- **Down Arrow / Swipe Down (while airborne):** Fast-fall (slam down to the ground faster, useful for tight obstacle spacing)

### The Runner
Tumble doesn't run. Tumble rolls — a continuous forward rotation. The visual is a round ball of fur tumbling end-over-end through the Inn's corridors. The movement is inherently funny — Tumble's enormous eyes rotate with the body, so every half-rotation Tumble is "upside down" for a frame. The rolling speed increases with the game speed.

**Tumble's states:**
- **Rolling:** Continuous rotation, eyes wide, 42Hz hum
- **Jumping:** Arc trajectory, eyes look up, body stretches slightly upward, "boing"
- **Ducking:** Body compresses to 60% height, eyes squeeze shut, "squish"
- **Fast-falling:** Slam down from a jump, body stretches vertically, eyes wide with surprise
- **Near obstacle:** Eyes scale up 20%, body vibrates slightly (drawn toward it)
- **Near-miss:** Blue spark arcs between Tumble and obstacle, eyes flash
- **Stuck (game over):** Eyes blink slowly from inside the obstacle

### Scoring
- **Distance:** Measured in inches (Tumble is 4 inches — distances are comically small)
- **Base rate:** 1 inch per 0.1 seconds of survival
- **Near-miss bonus:** +10 inches per near-miss (passing within 15px of an obstacle)
- **Perfect run bonus:** +50 inches for passing 5 obstacles without a near-miss or hit (clean running)
- **Combo system:** Consecutive near-misses multiply — 2x after 3, 3x after 5, 5x after 10. Combo breaks on hit or on 3 seconds without a near-miss.

**Score display format:**
> "Tumble traveled 247 inches before getting stuck in a teapot."

**Milestone callouts (flash on screen):**
- 100 inches: "100 inches! Tumble is on a roll."
- 250 inches: "250 inches! Tumble has never been this far from home."
- 500 inches: "500 inches! The Song is calling."
- 1000 inches: "1000 inches! The Owl is watching." (barn owl silhouette appears)
- 2000 inches: "2000 inches! Tumble can hear the whole Song."
- 5000 inches: "5000 inches! Tumble doesn't want to stop." (Tumble's eyes change — less startled, more determined)

---

## Obstacle System

### Obstacle Roster (Base Game — 8 obstacles)

Each obstacle is a resonance node Tumble is attracted to. Every obstacle has:
- A visual (simple clean SVG)
- A spawn height (ground or air)
- A required action (jump or duck)
- A "stuck" animation (what Tumble looks like wedged inside it on game over)
- A stuck location name (for the score display)

1. **Teapot** — Ground level. JUMP. Stuck: wedged in spout, eyes and legs sticking out. "stuck in a teapot"
2. **Open Book** — Air level (duck height). DUCK. Stuck: between pages, eyes blinking from spine. "stuck between pages 471-473"
3. **Amethyst Cluster** — Ground level. JUMP. Stuck: wedged between geodes, fur mingling with crystals. "stuck in an amethyst geode"
4. **Brass Orrery Ring** — Air level (duck height). DUCK. Stuck: inside the ring, orbiting slowly. "stuck in the orrery"
5. **Crystal Pinball Bumper** — Ground level. JUMP. Stuck: between two bumpers, humming. "stuck between the bumpers"
6. **Fae Portal Sliver** — Air level (duck height). DUCK. Stuck: half in this dimension, flickering. "stuck between dimensions"
7. **Crystal Leaf** — Air level (jump height). DUCK under (it hangs down). Stuck: nestled in leaves, swaying. "stuck in the Singing Tree"
8. **Tankard** — Ground level. JUMP. Stuck: inside the mug, eyes looking up. "stuck in the Bard's tankard"

### Obstacle Patterns
Obstacles don't spawn purely randomly — they spawn in patterns that create rhythm:

- **Solo:** One obstacle, easy to react to (early game)
- **Pairs:** Two obstacles close together, same type (jump-jump or duck-duck)
- **Alternating:** Jump then duck, or duck then jump (tests reaction switching)
- **The Squeeze:** A low obstacle immediately followed by a high obstacle — jump then immediately duck (the hardest early-game pattern)
- **The Gauntlet:** 3+ obstacles in rapid succession (mid-game)
- **The Impossible:** Two obstacles at different heights very close together — requires a fast-fall between them (late game, expert only)

Pattern difficulty scales with speed. Early game: mostly solos and pairs. Late game: gauntlets and impossibles.

### Speed Progression
- Start speed: Tumble's waddle pace (slow, forgiving)
- Speed increases: +0.1x multiplier every 15 seconds
- Speed cap: 3.0x (Tumble's rolling animation is a blur, eyes barely tracking)
- The transition between speeds should be smooth, not stepped — the player should feel it getting faster, not suddenly jump

---

## Progression System (Standalone/Paid Version)

### Tumble Skins (Cosmetic — 12 unlockable)
Skins are PURELY cosmetic — they don't change gameplay. Each skin changes Tumble's fur color/texture and adds a small visual flourish on jump.

1. **Classic Tumble** — Brown/amber fur (default, free)
2. **Geode Tumble** — Purple crystal fur with amethyst points (unlock: 500 inches in one run)
3. **Shadow Tumble** — Dark charcoal fur with blue-white spark (unlock: reach 1000 inches)
4. **Golden Tumble** — Gold metallic fur, sparkles on roll (unlock: 5 near-misses in one run)
5. **Teacup Tumble** — White ceramic-textured fur with a painted floral pattern (unlock: get stuck in a teapot 10 times)
6. **Stargazer Tumble** — Deep indigo fur with tiny stars (unlock: see the Owl at 1000 inches)
7. **Fae Tumble** — Green shimmer fur with pollen particles (unlock: get stuck in a portal 5 times)
8. **Bard's Tumble** — Amber fur with a tiny musical note on the forehead (unlock: get stuck in a tankard 10 times)
9. **Library Tumble** — Leather-brown fur with tiny page edges (unlock: get stuck in a book 10 times)
10. **Orrery Tumble** — Brass-colored fur with orbital ring pattern (unlock: get stuck in an orrery 5 times)
11. **Song Tumble** — Translucent crystal fur, you can see through to the crystal core (unlock: 5000 inches total across all runs — this is the reveal: Tumble IS a crystal)
12. **The Keeper's Tumble** — Silver-white fur with a faint 42Hz glow ring (unlock: complete all milestones — 100, 250, 500, 1000, 2000, 5000 in any single run)

### Tumble Trails (Cosmetic — 6 unlockable)
The particle trail left behind when Tumble rolls:

1. **Dust Trail** — Small brown dust particles (default, free)
2. **Crystal Sparks** — Blue sparkles (unlock: 100 near-misses total)
3. **Amber Glow** — Warm amber light particles (unlock: 250 inches in one run)
4. **Star Trail** — Tiny stars (unlock: see the Owl)
5. **Green Shimmer** — Fae portal particles (unlock: get stuck in a portal 3 times)
6. **The Song Trail** — 42Hz visual ripples, visible sound waves (unlock: 5000 inches total)

### Environment Skins (Cosmetic — 4 unlockable)
Changes the background parallax layers:

1. **The Inn** — Default warm amber interior (free)
2. **The Catacombs** — Dark stone, dim torches (unlock: 1000 inches total)
3. **The Cosmology** — Deep indigo with stars (unlock: 2000 inches total)
4. **The Shadow Inn** — Cold blue-black, 84Hz drone replaces the 42Hz hum (unlock: reach 1000 inches in one run)

### Power-Ups (Single-Use, Earned or Purchased)
Power-ups are equipped before a run and activate automatically when triggered:

1. **The Brownie Rescue** — One free revive per run. When Tumble gets stuck, Thatch pulls Tumble free and the run continues. (Earn: 500 inches in one run. Or purchase: $0.99 for 3)
2. **The Coconut Shell Clap** — Clears all on-screen obstacles. A coconut shell clap sound plays and all obstacles shatter. (Earn: 10 near-misses in one run. Or purchase: $0.99 for 3)
3. **The Keeper's Hum** — 10 seconds of slow-motion. The 42Hz hum intensifies and everything moves at 50% speed. (Earn: reach 500 inches. Or purchase: $0.99 for 3)
4. **The Crystal Eye** — Shows obstacle patterns 2 seconds earlier. A faint crystal overlay on the screen. (Earn: 50 near-misses total. Or purchase: $0.99 for 3)
5. **The Owl's Gaze** — 5 seconds of invincibility. Tumble's eyes glow gold and obstacles pass through. The Owl silhouette watches from the background. (Earn: reach 1000 inches. Or purchase: $1.99 for 3)

**Power-up economy:** Power-ups can be earned through play (slow path) or purchased (fast path). No paywall — every power-up is earnable. Purchasing is for impatience, not access.

---

## The Encounter System (Standalone Exclusive)

### Random Encounters (Rare Events)
Every 500 inches, there's a 10% chance of a random encounter. Encounters are small narrative moments — 2-5 seconds of something unusual happening on screen. They don't affect gameplay but they affect the player's understanding of Tumble.

1. **The Brownie Escort (500+ inches)** — One brownie runs alongside Tumble for 5 seconds. Brindle gestures wildly (terrible advice). Cobble measures Tumble's speed. Thatch catches Tumble on a high bounce. Random which brownie appears.

2. **The Owl's Perch (1000+ inches)** — A barn owl silhouette appears in the background for 2 seconds. No sound. No interaction. Just the Owl, watching. The screen gets slightly darker. Then it's gone.

3. **The Song's Pulse (1500+ inches)** — Tumble's fur ripples with 42Hz visual waves. The rolling hum intensifies for 3 seconds. Tumble's eyes change — less startled, more... listening. The obstacles ahead glow faintly. Then normal.

4. **The Keeper's Shadow (2000+ inches)** — A large shadow passes over the screen — the Keeper, walking somewhere in the background. Tumble looks up (eyes track the shadow for 1 second). The shadow is warm. Then gone.

5. **The Reader's Page (2500+ inches)** — A single page floats across the background. On it, barely visible: a small drawing of Tumble. The Reader's hand drew it. Tumble doesn't notice. The player might.

6. **The Convergence (3000+ inches)** — For 3 seconds, the background flickers between the warm Inn and the cold Shadow Inn. The 42Hz hum and the 84Hz drone overlap. Tumble's eyes go wide — not startled. Aware. Then it passes.

7. **The Song Itself (4000+ inches)** — Tumble stops rolling for 1 second. The obstacles freeze. The 42Hz hum becomes a single clear note — audible, distinct, a real sound, not a texture. Tumble's eyes fill with light. The note fades. Everything resumes. Tumble's eyes are different after this. Less "eep." More... purpose.

8. **The Crystal Reveal (5000+ inches)** — For exactly 2 seconds, Tumble's fur becomes transparent. The player sees the crystal underneath — brown and amber, humming, alive. The four-inch crystal that IS Tumble. Then the fur returns. The run continues. The player knows now.

### Encounter Design Rules
- Encounters NEVER kill the player. If an encounter triggers, no obstacles spawn during the encounter.
- Encounters are 2-5 seconds. They don't interrupt flow — they punctuate it.
- Each encounter can only trigger once per run. If the player passes the threshold again, a different encounter rolls.
- The Crystal Reveal (5000 inches) is guaranteed on the first run that reaches 5000 inches. After that, it's random like the others.

---

## Game Over Sequence (Detailed)

### The Full Sequence (5-7 seconds, skippable)

1. **Impact (0.5s):** Tumble hits the obstacle. Screen freezes. Tumble's rolling animation stops. The 42Hz hum cuts out. Complete silence.
2. **The Stuck (1.5s):** Tumble is shown wedged into the obstacle. The stuck animation plays — eyes blinking slowly, tiny legs wiggling. The obstacle and Tumble are perfectly composed, as if posed for a still life painting. A single "eep."
3. **The Brownies Arrive (2s):**
   - Brindle runs in from the left, skids to a stop, points at Tumble. Begins gesturing an elaborate extraction plan involving a lever, two coconut shells, and what appears to be a pulley system. He's very proud of this plan.
   - Cobble arrives, looks at Brindle's plan, measures the angle with his fingers, shakes his head. Holds up a tiny clipboard showing the success probability (very low). Begins explaining why the plan violates three laws of physics.
   - Thatch arrives last, walking calmly. Doesn't look at the plan. Walks up to Tumble. One hand. Pulls. "Pop." Tumble is free.
4. **The Bounce (0.5s):** Tumble pops free, bounces once on the ground, lands upright, blinks.
5. **Score Display (persistent until input):**
   - Large text: "Tumble traveled [X] inches before getting stuck in a [obstacle name]."
   - Below: "Best: [Y] inches" (or "NEW RECORD!" with gold flash if beaten)
   - Below: "Near-misses: [N] | Combo: [M]x | Clean runs: [C]"
   - Two buttons: "Send Tumble back in" (retry) and "Let Tumble rest" (menu)

### Skippable
The brownie extraction animation can be skipped by pressing space/tap. The score display waits for input.

---

## Leaderboard System

### In-Game Leaderboard (Geode Inn version)
- Weekly leaderboard: top scores this week
- All-time leaderboard: top scores ever
- Friends leaderboard: scores from players on your friends list
- Display: PlayerName — [X] inches — [obstacle stuck in]

### Standalone Leaderboard (Steam)
- Global leaderboard: all players worldwide
- Daily challenge leaderboard: a fixed seed for the day, same obstacles for everyone
- Friends leaderboard: Steam friends
- Weekly leaderboard: resets every Monday
- Display: PlayerName — [X] inches — [obstacle] — [skin used]

### Daily Challenge (Standalone Exclusive)
One run per day. Fixed seed — every player gets the same obstacle pattern. The challenge is: who can get the farthest on THIS specific course? The leaderboard shows the top 100 daily challenge scores. Daily challenge runs can earn exclusive cosmetic rewards (rotating weekly).

---

## Monetization Model

### Free (In-Game Geode Inn Version)
- Base game (8 obstacles, classic Tumble skin, dust trail, Inn environment)
- In-game leaderboards
- No power-ups, no cosmetics, no encounters
- Purpose: engagement with the main game. The free version is the demo.

### Standalone (Paid — $4.99)
- Full base game (8 obstacles, classic Tumble skin)
- All 12 Tumble skins (earnable through gameplay)
- All 6 trails (earnable)
- All 4 environments (earnable)
- Power-ups (earnable through gameplay)
- All 8 encounters
- Daily challenge
- Global + friends leaderboards
- Steam achievements

### DLC (Optional — $1.99 each or $4.99 for all)

**DLC 1: The Catacombs Run**
- 4 new obstacles (skull, sarcophagus lid, ancient scroll, bone pile)
- Catacombs environment (default, not unlock)
- "Scared Tumble" skin (wide eyes, shaking)
- 2 new encounters (the MIB appear briefly, the Crone's candle flickers)
- Catacombs leaderboard

**DLC 2: The Cosmology Run**
- 4 new obstacles (constellation, comet, void crack, star fragment)
- Cosmology environment (default)
- "Stargazer Tumble" skin (indigo, star-eyes)
- 2 new encounters (the Astronomer calculates, the Constant watches)
- Cosmology leaderboard

**DLC 3: The Shadow Run**
- 4 new obstacles (pot lid, shadow tendril, 84Hz pulse, broken wire)
- Shadow Inn environment (default)
- "Shadow Tumble" skin (charcoal, blue-white spark)
- 2 new encounters (the brownies go silent, the Owl's eyes open)
- Shadow leaderboard
- 84Hz drone replaces 42Hz hum throughout — the Shadow Run is the "hard mode" version

**DLC Bundle: The Inn's Tumble ($4.99 for all 3 DLC)**
- All three DLC packs
- Exclusive "The Inn's Tumble" skin (changes environment every 30 seconds, cycling through all zones)
- Exclusive "The Song" trail (42Hz ripples in all colors)

### Microtransactions (Optional, Non-Essential)
- Power-up packs: $0.99 for 3 of any power-up
- Power-up bundle: $1.99 for 3 of all 5 power-ups
- Cosmetic shortcut: $0.99 to unlock any single skin/trail/environment instantly (otherwise earnable through play)
- No loot boxes. No gambling mechanics. Everything is earnable. Purchasing is for impatience or support.

### Revenue Philosophy
- The free in-game version is genuinely fun and complete for a casual player
- The standalone is the "real" game — worth $4.99 on its own merits
- DLC is additive, not subtractive — the base game is never crippled to sell DLC
- No pay-to-win. Power-ups don't affect leaderboards (power-up runs are flagged separately)
- Every purchase is a choice, never a requirement

---

## Steam Achievements (Standalone)

1. **First Roll** — Play Tumble Run for the first time
2. **Stuck** — Get stuck in every obstacle type at least once
3. **The Teapot Collection** — Get stuck in a teapot 50 times
4. **Rolling Along** — Reach 100 inches
5. **Going Somewhere** — Reach 500 inches
6. **The Owl Watches** — See the Owl encounter
7. **Near-Miss Master** — 100 near-misses total
8. **Combo King** — 10x near-miss combo
9. **The Song's Smallest Note** — Reach 5000 inches in one run
10. **Crystal Clear** — Trigger the Crystal Reveal encounter
11. **Fashionable Fur** — Unlock 6 Tumble skins
12. **The Full Wardrobe** — Unlock all 12 Tumble skins
13. **Daily Runner** — Complete a daily challenge
14. **Daily Champion** — Top 10 on a daily challenge leaderboard
15. **The Inn's Tumble** — Unlock all DLC content
16. **Let Tumble Rest** — Don't press retry for 10 seconds on the game over screen (Tumble falls asleep)
17. **The Brownie's Plan** — Watch the full extraction animation 50 times without skipping
18. **Perfect Run** — 500 inches without a single hit or near-miss (pure clean running)
19. **Speed Demon** — Reach 3.0x speed
20. **Home** — Trigger the Song Itself encounter (4000 inches)

---

## Technical Architecture

### In-Game (Geode Inn Base44 App)
- HTML5 Canvas or SVG-based game running in the browser
- Pure CSS/JS, no game engine dependency
- Lightweight — the game should load in under 2 seconds
- Communicates with Geode Inn backend for:
  - High score save (PlayerProgress entity)
  - In-game leaderboard (Leaderboard entity, gameMode: "tumble-run")
  - Unlock status (tumbleRunUnlocked flag in PlayerProgress)

### Standalone (Steam)
- Wrapped as a Steam application (Electron or similar web-to-desktop wrapper)
- Steam integration via Steamworks API:
  - Achievements
  - Cloud saves (sync high scores and unlock progress)
  - Leaderboards (Steam leaderboards API)
  - DLC management (Steam DLC packages)
- Mobile version: React Native or progressive web app, touch-first controls
- Cross-platform: PC, Mac, iOS, Android — same game, same saves

### Data Model (Geode Inn Entities)

**PlayerProgress (existing entity, add fields):**
```
tumbleRunUnlocked: boolean
tumbleRunHighScore: number
tumbleRunTotalInches: number
tumbleRunSkinsUnlocked: array of strings
tumbleRunTrailsUnlocked: array of strings
tumbleRunEnvironmentsUnlocked: array of strings
tumbleRunPowerUps: object with counts
tumbleRunEncountersSeen: array of strings
tumbleRunAchievements: array of strings
tumbleRunDailyChallengeBest: number
```

**Leaderboard (existing entity, add gameMode):**
```
gameMode: "tumble-run"
score: inches traveled
pairTheme: obstacle stuck in (for flavor)
```

---

## Visual Design Details

### Tumble SVG Structure
```
<svg class="tumble" viewBox="0 0 40 40">
  <defs>
    <radialGradient id="fur">
      <stop offset="0%" stop-color="#8b6914"/>
      <stop offset="70%" stop-color="#a07d2e"/>
      <stop offset="100%" stop-color="#d4a574"/>
    </radialGradient>
  </defs>
  <!-- Body: near-perfect circle -->
  <circle cx="20" cy="20" r="18" fill="url(#fur)"/>
  <!-- Fur texture: small lines radiating outward -->
  <g class="fur-texture">...</g>
  <!-- Eyes: two enormous dark circles -->
  <circle cx="14" cy="16" r="5" fill="#1a1a2e"/>
  <circle cx="26" cy="16" r="5" fill="#1a1a2e"/>
  <!-- Eye highlights -->
  <circle cx="15" cy="15" r="1.5" fill="#fff"/>
  <circle cx="27" cy="15" r="1.5" fill="#fff"/>
  <!-- Mouth: surprised "o" -->
  <ellipse cx="20" cy="26" rx="2" ry="3" fill="#1a1a2e"/>
  <!-- Legs: tiny stubby ovals -->
  <ellipse cx="16" cy="37" rx="2" ry="1.5" fill="#8b6914"/>
  <ellipse cx="24" cy="37" rx="2" ry="1.5" fill="#8b6914"/>
</svg>
```

### Animation States (CSS)
```css
/* Rolling */
@keyframes roll { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
.tumble.rolling { animation: roll 0.4s linear infinite; }

/* Jump */
@keyframes jump-arc { 0% { transform: translateY(0); } 50% { transform: translateY(-80px) scaleY(1.1); } 100% { transform: translateY(0) scaleY(0.9); } }
.tumble.jumping { animation: jump-arc 0.5s ease-out; }

/* Duck */
.tumble.ducking { transform: scaleY(0.6); transition: transform 0.1s; }

/* Near obstacle — eyes widen */
.tumble.near .eye { transform: scale(1.2); transition: transform 0.1s; }

/* Stuck — slow blink */
@keyframes slow-blink { 0%, 90% { } 95% { transform: scaleY(0.1); } 100% { } }
.tumble.stuck .eye { animation: slow-blink 2s infinite; }
```

### Background Parallax (3 Layers)
- **Far layer (0.3x scroll):** Bookshelf silhouettes, archway outlines. Dim, atmospheric.
- **Mid layer (0.6x scroll):** Crystal formations, Celtic knotwork pillars. More defined.
- **Near layer (1.0x scroll):** The stone floor line, foreground objects. Sharp, clear.

### Color Palette
- **Background gradient:** #2a2a1e (top) to #1a1a2e (bottom)
- **Floor:** #3a3a2e with stone texture
- **Tumble:** #8b6914 to #d4a574 (fur gradient)
- **Obstacles:** Varies by type (teapot = brown, book = cream, crystal = purple, etc.)
- **Near-miss spark:** #4a9eff (blue)
- **Celtic border:** #d4af37 (gold, opacity 0.3-0.6 pulse)
- **Score text:** #d4a574 (warm amber, serif)

---

## Sound Design (Detailed)

### Audio Engine
The game's audio is minimal and intentional. There are three audio layers:

1. **The Hum (42Hz):** A continuous, barely-audible low hum that IS the game's soundtrack. It plays while Tumble rolls. It gets slightly louder as speed increases. It cuts out on game over (the silence IS the game over sound). This is the Song of Making, heard through its smallest note.

2. **SFX (one-shots):**
   - Jump: "boing" (short, pitched up, plucky)
   - Duck: "squish" (short, pitched down, soft)
   - Fast-fall: "thud" (short, low)
   - Near-miss: "eep" (volume scales with closeness — closer = louder)
   - Near-miss spark: tiny electric crackle (very short)
   - Obstacle pass: soft "whoosh" (the obstacle scrolling past)
   - Milestone: a single clear chime (ascending pitch per milestone tier)
   - Game over impact: "thump" (muffled, soft — Tumble hitting the obstacle)
   - Brownie arrival: coconut shell clapping (rhythmic, approaching from left)
   - Extraction: "pop" (clean, short)
   - Encounter trigger: a single note from the Song (varies by encounter)

3. **Encounter Audio:**
   - Owl: complete silence (even the hum cuts out for 2 seconds)
   - Song's Pulse: hum intensifies, becomes almost musical
   - Crystal Reveal: a single pure tone (42Hz made audible and beautiful, like a singing bowl)
   - Convergence: 42Hz and 84Hz overlap (a dissonant chord that resolves)

### Audio Philosophy
Tumble Run is the QUIETEST game in the Geode Inn. The silence is the point. The hum is the Song. The "eep" is the note. The coconut shells are the workers. Everything else is the space between.

---

## The Narrative Layer (For Players Who Pay Attention)

### What the Player Learns Through Tumble Run

**Surface level:** A fun, simple endless runner with a cute character and funny game-over animations.

**Observation level:** The obstacles are all resonance nodes. Tumble is drawn to them. The Owl watches at 1000 inches. The Song becomes audible at higher scores. Something is happening.

**Understanding level:** Tumble is a living note of the Song of Making. The game isn't about avoiding obstacles — it's about a note trying to rejoin the Song. The player is the force keeping Tumble separate. Every game over is Tumble finding a node and almost going home.

**The Crystal Reveal (5000 inches):** Tumble's fur becomes transparent. The player sees the crystal. The four-inch crystal that IS Tumble. After this, Tumble's eyes change — less "eep," more purpose. The player understands: they've been preventing the Song's smallest note from going home. The score isn't how far Tumble traveled. It's how long the player kept the note from the Song.

**The meta-question:** The player chooses to send Tumble back in. Every retry is a choice to keep Tumble running instead of letting it rest. "Let Tumble rest" is the menu button. Most players never press it. The achievement "Let Tumble Rest" (don't press retry for 10 seconds) is the game's quietest thesis: sometimes the kindest thing is to stop playing.

### Connection to the Geode Inn
- Tumble Run is the Tumble character's story told through gameplay, not dialogue
- The encounters are glimpses of the Inn's larger narrative through the lens of its smallest character
- The Owl watching at 1000 inches connects to the Owl's network / brownie revelation
- The Crystal Reveal at 5000 inches matches the Keeper's crystal eye reveal in the main game
- The Song becoming audible at 4000 inches matches the Observatory quest chain's completion
- Players who play both the Geode Inn and Tumble Run understand more than players who play either alone

---

*The score isn't how far Tumble traveled. It's how long the player kept the Song's smallest note from going home. The highest score is a refusal. The lowest score is a mercy.*

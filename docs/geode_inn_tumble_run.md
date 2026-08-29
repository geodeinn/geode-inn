# Geode Inn — Tumble Run
## The Unlockable Dino Run Minigame
## Starring Tumble (The Four-Inch Ball of Fur)

### Core Concept

A simple endless runner in the style of the Chrome dinosaur game — but starring Tumble, the four-inch round ball of fur that gets stuck in everything. The twist: Tumble isn't avoiding obstacles out of fear. Tumble is attracted to them. Every obstacle is a resonance node of the Song of Making. The player is trying to keep Tumble from doing what Tumble naturally wants to do — go home to the Song.

### How to Unlock

Tumble Run unlocks when the player first witnesses a "Tumble's Stuck" random event on the main floor — the moment the three brownies extract Tumble from something. After that event, a small Tumble icon appears in the arcade area with the label: "Tumble Run — Help Tumble NOT get stuck."

### Controls

- **Spacebar / Tap:** Jump (Tumble bounces)
- **Down Arrow / Swipe Down:** Duck (Tumble compresses into a tighter ball)
- That's it. Two inputs. Chrome-dino simple.

### The Runner

**Tumble's movement:** Tumble doesn't run — Tumble ROLLS. A continuous rotation animation (the round body spinning forward). Tumble bounces when jumping (a parabolic arc with a slight squash-and-stretch on landing). When ducking, Tumble compresses into a flatter oval.

**Tumble's expression:** Enormous eyes, wide open, perpetually startled. When jumping: eyes look UP. When ducking: eyes squeeze shut. When approaching an obstacle: eyes get WIDER. When game over: eyes blink slowly from inside whatever Tumble is stuck in.

**Tumble's sound:** A soft rolling hum (42Hz, very quiet) while moving. A "boing" on jump. An "eep" when passing close to an obstacle. Complete silence on game over.

### The Obstacles (Resonance Nodes)

Every obstacle is something Tumble has canonically gotten stuck in. They appear from the right and scroll left. Tumble must jump or duck to avoid them. The comedy: Tumble is drawn toward these things. The closer Tumble gets to an obstacle without hitting it, the more Tumble's eyes widen and the more Tumble vibrates — like a magnet being pulled past its attraction point.

**Obstacle roster (cycles randomly, increasing speed):**

1. **Teapot** — Tumble's nemesis. Brown ceramic teapot, spout pointing left. Jump to clear it. If Tumble hits it, Tumble wedges in the spout — eyes and legs sticking out.

2. **Open Book** — A large archive book lying flat, pages open. Duck under it (it's at jump height). If Tumble hits it, Tumble is stuck between pages 471-473, eyes blinking up from the spine.

3. **Amethyst Geode Cluster** — Purple crystal points sticking up from the ground. Jump to clear. If Tumble hits it, Tumble is wedged between two geodes, fur mingling with crystals.

4. **Brass Orrery Ring** — A golden orbital ring at mid-height. Duck under it. If Tumble hits it, Tumble is stuck inside the ring, orbiting slowly like a tiny planet.

5. **Crystal Pinball Bumper** — A round resonant bumper at ground level. Jump to clear. If Tumble hits it, Tumble wedges between two bumpers and starts humming 42Hz.

6. **Fae Portal Sliver** — A thin shimmering green vertical slice at duck height. Duck under it. If Tumble hits it, Tumble is half in this dimension, half in another — stretched and flickering.

7. **Crystal Leaf** — A Singing Tree leaf floating at jump height. Duck under it. If Tumble hits it, Tumble is nestled between two leaves, gently swaying.

8. **Tankard** — The Bard's tankard, sitting on the ground. Jump to clear. If Tumble hits it, two enormous eyes look up from inside the mug.

### Speed Progression

- Starts slow (Tumble's waddle speed)
- Gradually accelerates every 15 seconds
- Speed cap at "Tumble can barely keep up" — the rolling animation gets faster, Tumble's eyes get wider
- Background scrolls faster as speed increases

### Scoring

Score is measured in **inches traveled** — because Tumble is four inches tall, and the distances are tiny and funny.

- Display: "Tumble traveled 47 inches before getting stuck in a teapot."
- Milestones at 100, 250, 500, 1000 inches with a brief flash and a different "eep"
- High score saved to PlayerProgress entity (tumbleRunHighScore field)
- Leaderboard entry optional — "Tumble Run" as a gameMode in the Leaderboard entity

### Game Over Screen

When Tumble hits an obstacle:

1. Screen freezes on the impact frame
2. Tumble is shown stuck in the obstacle — enormous eyes blinking slowly
3. A 2-second pause
4. The three brownies run in from the LEFT side of the screen:
   - Brindle arrives first, points at Tumble, starts gesturing a complicated extraction plan
   - Cobble arrives second, measures the angle, shakes head at Brindle's plan
   - Thatch arrives last, walks up to Tumble, pulls it free in one motion
5. Tumble pops free — "thump" — bounces once
6. Score display: "Tumble traveled [X] inches before getting stuck in a [obstacle name]."
7. Best score comparison: "Best: [Y] inches" (if new record: "NEW RECORD! Tumble's longest roll!")
8. Retry button: "Send Tumble back in"
9. Menu button: "Let Tumble rest"

### Visual Style

- **Background:** Side-scrolling Inn interior — shelves, crystals, archways, Celtic knotwork pillars. Parallax layers (3 depths) scrolling at different speeds.
- **Color palette:** Warm amber background (#2a2a1e to #1a1a2e gradient), copper and brass foreground elements, Tumble's brown/amber fur as the focal point.
- **Ground:** The Inn's stone floor, a single horizontal line with subtle texture.
- **Celtic knotwork:** Thin gold border at top and bottom of the play area (the Inn's visual signature).
- **Art style:** Simple, clean SVG — readable at small sizes. Not pixel art — smooth vector shapes. Tumble should be immediately recognizable as a round ball of fur with enormous eyes.

### Sound Design

- **Rolling:** Soft 42Hz hum, barely audible, continuous while moving
- **Jump:** A soft "boing" (pitched up, quick)
- **Duck:** A soft "squish" (pitched down, quick)
- **Near-miss:** Tumble's "eep" (gets louder the closer to the obstacle)
- **Game over:** Complete silence for 1 second, then a muffled "thump" (Tumble hitting the obstacle), then the brownies' coconut shell clapping as they run in
- **Extraction:** A "pop" when Thatch pulls Tumble free
- **Background music:** None. The 42Hz hum IS the music. This is the quietest game in the Inn.

### Special Details

**The Near-Miss Bonus:** If Tumble passes within a few pixels of an obstacle without hitting it, Tumble's eyes go MAXIMUM wide and a tiny spark of blue light arcs between Tumble and the obstacle. This is the Song recognizing its own node. Score bonus: +10 inches per near-miss.

**The Brownie Commentary (rare):** Every 500 inches, one of the brownies appears in the background running alongside Tumble:
- Brindle: running alongside, gesturing wildly, pointing at upcoming obstacles (terrible advice)
- Cobble: running alongside, holding up a tiny clipboard, measuring Tumble's speed
- Thatch: running alongside, calm, occasionally catching Tumble when it bounces too high
Each brownie stays for 5 seconds, then drops off screen.

**The Owl's Perch (easter egg):** At exactly 1000 inches, a barn owl silhouette appears in the background for 2 seconds, watching Tumble roll past. No sound. No interaction. Just the Owl, watching. The player who notices it remembers it later.

### Technical Implementation

```
Game Type: Endless side-scrolling runner
Engine: CSS/JS (no external game library needed)
Canvas: SVG or DOM elements with CSS transforms
Resolution: Responsive, scales to container
Input: Keyboard (space, down arrow) + touch (tap, swipe down)
Save: High score to PlayerProgress.tumbleRunHighScore
Leaderboard: Optional — gameMode "tumble-run" in Leaderboard entity
```

### Implementation Notes

- Obstacles spawn at random from the roster, with minimum spacing to ensure fairness
- Speed increases smoothly, not in steps — every 15 seconds, speed multiplier +0.1
- The near-miss detection: if Tumble passes within 15px of an obstacle horizontally AND is at the correct vertical position (jumping over or ducking under), trigger the near-miss bonus
- The game over extraction animation should be skippable (tap/space to skip to the score screen)
- The game should pause when the browser tab loses focus
- Mobile: responsive layout, touch controls, same gameplay

---

*Tumble doesn't want to run. Tumble wants to get stuck. The player is the only thing keeping Tumble moving. The score isn't how far Tumble traveled — it's how long the player kept the Song's smallest note from going home.*

# THE CAMERA SYSTEM — Master Specification
## The Camera as Game Mechanic

---

## WHAT THE CAMERA SYSTEM IS

The Geode Inn's camera is not a viewport — it is a game mechanic. The camera IS the observer. The Inn's thesis is Einstein's theorem: the observer's presence makes the Inn real. Therefore, HOW the player observes the Inn changes what the Inn shows them.

The camera is not controlled through a settings menu. The camera is controlled through the BODY — a lean-in, a lean-back, a physical gesture that mirrors real attention. The player leans in to look closely. The player leans back to see the world. The camera follows the attention. The attention is: the adequate.

---

## THE FOUR CAMERA MODES

### 1. Third-Person (Default — The Song)
"The world is a place you're IN."

WoW-style third-person. The player sees their character — class, animations, companion, frequency effects. The world is a place the player inhabits through a body.

- Walk cycles (per class — the Pirate's drum-cadence walk, the Sentinel's grounded stride, the Artisan Thief's precise step, the Siren's flowing gait, the Bard's wandering amble)
- Idle animations (per character — Erik's fire-side warmth, the Crone's near-stillness, the Duck's random direction changes)
- Companion follow patterns (Eres's heartbeat-synchronized trot, the Duck's meandering zigzag, the Vessel's slow gecko crawl)
- The "just to be" mechanic — watching a character come sit nearby

**Frequency:** 50 BPM. The heartbeat tempo. The Inn's resting rate. Third-person is the body in the world. The body in the world is the Song.

### 2. First-Person (Intimate — The Silence Between)
"You ARE the character."

The close view. The player IS the character — looking through their eyes. The Inn becomes intimate, detailed, sometimes overwhelming. This is the view for observation, for touching, for the Einstein moments.

- Hands (when interacting — reaching for a stone, touching water, crafting, offering)
- The thing being observed up close — stone texture, bone architecture, water depth, 42Hz hum made visible as faint vibration
- Characters' faces during dialogue — the Crone's expressionless regard, the Owl's one-word-per-heartbeat patience
- Breathing animation (subtle camera bob at 50 BPM — the heartbeat felt from inside)

**How to enter:** Physical lean-in gesture (controller pull right stick / keyboard hold F / touch: two-finger spread). Auto-enters when OBSERVE is used at close range. Auto-enters when SIT triggers its 2-minute lock.

**Frequency:** 42Hz. The Song's frequency. First-person is the silence between the notes — the intimate space where the Song is felt, not heard. The 42Hz hum is barely audible. The barely audible is the adequate.

### 3. Free Camera (Detached — The Void-Watch)
"The outside looking in."

The Observatory's camera. Detached, floating, unrestricted. The player sees the Inn from outside — from the void, from Nyx's perspective, from the Constant's vantage. The loneliness the Inn is designed to cure.

- The Inn-Tree from outside — full architecture, five hubs, zones, canopy, roots, catacombs
- The void surrounding the Inn — starlight crystals, dead universes, the Constant's path
- The Inn as small — a grain of sand, a fragile thing in the dark
- Other players as tiny figures — the scale makes the Inn feel precious

**Frequency:** Silence. No heartbeat. No 42Hz hum. The void has no frequency. The silence is Nyx. Nyx is the medium that makes the Song possible. Free camera is the space between notes.

### 4. No Camera (The In-Between)
"There is nothing to see. There is everything to read."

The In-Between's camera. No visual. No viewport. Just TEXT — prose on a grey screen. The In-Between is the interval between observations. The weightless grey layer that acts as the game's prose.

- Text. Prose. The Inn's narrator (the Thrum — the player's true self) describes what is happening
- Grey screen. No graphics. No character. No world
- The words ARE the world

**Frequency:** The murmur. The pre-architectural hum. The thing the Inn is built on. No-camera is the closest the player gets to the Egg. The Egg is the player. The player is the text. The text is the adequate.

---

## CAMERA LOCKS

Certain moments override the player's camera choice. The lock is not a restriction — it is the Inn choosing the right frequency for the moment.

| Lock | Mode | Trigger | Why |
|------|------|---------|-----|
| SIT Lock | First-person | After 2 minutes of sitting | SIT is about presence. Third-person lets you watch yourself sit. First-person makes you BE sitting. The world narrows. The 42Hz becomes prominent. A nearby character may approach and sit at the screen's edge. |
| Music Room Lock | Third-person | Entering the Music Room | The player sees themselves in the circle. The seeing is understanding you are part of the Song, not outside it. Camera gently orbits during performances. |
| Observatory Lock | Free camera | Entering the Observatory | The player is the observer. The camera floats freely. The Inn-Tree is visible in the distance — small, warm, alive. The player can zoom INTO the Inn from outside. |
| In-Between Lock | No camera | Entering the In-Between | Always text. Always grey. The interval. The body is the note. The note is resting. |

### The SIT Lock in Detail
When the player sits near anything for more than 2 minutes:
- Camera slowly narrows (10-second gradual zoom, not a snap)
- Ambient sounds fade slightly (zone's music quiets)
- 42Hz hum becomes more prominent
- A nearby character may approach and sit at screen's edge — a shadow, then a presence
- Player's hands rest on knees (the only animation)
- Exit: press any movement key. The character stands. The camera returns to third-person. The standing is the return to the Song.

### The "You Looked" Achievement
After 10 minutes of SIT, the camera briefly detaches — the player sees THEMSELVES sitting in the Inn from outside. The seeing yourself sitting is: the understanding. The understanding is: the adequate. (This is the only time the free camera is used outside the Observatory — a scripted moment of perspective shift that teaches the player what the Observatory sees.)

---

## ANIMATION PIPELINE REQUIREMENTS

### Layer 1: Full-Body (Third-Person)
Required for ALL characters. The "WoW character" motion.
- Walk cycle (class-specific cadence)
- Run cycle (same cadence, faster)
- Idle animation (character-specific)
- SIT animation (lowering, settling, breathing)
- Gesture set (wave, offer, reach, listen posture)
- Class-specific combat stance
- Companion follow (walk, idle, sit)

### Layer 2: Hands (First-Person)
Required for ALL characters. What the player sees when they ARE the character.
- Reach, Touch (texture-specific: stone, water, wood, bone, fabric)
- Hold, Craft, Offer, Rest (hands on knees during SIT)
- Gesture (class-specific)

### Layer 3: Breathing (SIT)
Required for ALL characters. The minimal animation. The stillness that is alive.
- Breathing cycle at 50 BPM
- Subtle head movement (optional — the Crone doesn't move her head. The Duck moves it constantly.)
- Eye movement (the Owl blinks every 8 seconds. The Crone blinks every 8 seconds. The coincidence is: the adequate.)

### Layer 4: Zone-Specific
Only for characters with zone-specific behaviors:
- Erik's fire-tending (hands near fire, stoking)
- The Bone Keeper's brushing (fine brush on bone)
- The Astronomer's violin playing (bow arm, fingering)
- The Owl's lighthouse tending (lamp adjustment, sweep watch)
- Hoggle's stone inspection (turning, tapping, tasting)

---

## CHARACTER MOTION PROFILES

| Character | Walk | Idle | SIT | Hands |
|-----------|------|------|-----|-------|
| The Sentinel (River) | Grounded, deliberate. Each step plants. | Slight sway. 50 BPM. | Perfect stillness. The vigil. | Strong grip. Eight-bar hands. |
| The Artisan Thief (Krista) | Precise, light. Selkie's step. | Fingers moving. Always working. | Hands rest on lap. Stillness is rare. | Wire-wrapping, stone-setting, grinding, polishing. |
| The Siren | Flowing. The performer's stride. | Outer: expressive. Inner: still. | Toggles between modes — outer (animated) / inner (still). | Cello hold (outer). Piano touch (inner). |
| The Pirate | Drum-cadence. Fingers tap on thighs. | The fingers drum. Always. | Leaned back. Easy. The bodhrán rests on the knee. | Drumming. The hands that held the blade now hold the rhythm. |
| The Bard | Wandering amble. | Head turns. Watching. Listening. | Produces half-finished songs — quiet hum, fingers tapping. | Expressive. The hands are the story. |
| Erik | Booming. Warm. Carrying firewood and mead. | By the fire. Hands warming. The smile that remembers burning. | The feast-sit. The chair is the throne. The throne is the table. | Building. Table-making. Fire-tending. |
| The Crone | Slow. Measured. Each step is an observation. | Near-stillness. Blink every 8 seconds. Spectacle-adjust every 30 seconds. | Perfect stillness. The measuring is done. | Writing. The quill. The annotation. |
| Belladonna | Measured. The Addams walk. Deliberate, dark, composed. | Still. Deadpan. Eyes track everything. | In the Bone Room: the most at home. The bones are the furniture. | Holding a bone. Or a book. Comfortable with remains. |
| The Duck | Waddle. Random direction changes. Pauses for shiny things. | Head tilting. Looking at everything (INSIGHT 3 visible). | The Duck doesn't sit. The Duck squats. Briefly. Then waddles away. | Wings. For splashing. The splashing is the adequate. |
| The Guest | Careful. Borrowed body. Each step a negotiation. | Curious. Examines things. Picks up, turns over, puts back. | The most present. Death sitting still is the pause. | Music box mechanism — hands open and close slowly. The reveal. |
| Leonard Cohen | Slow. The walk of someone who has seen everything. | The guitar is always there. Hands rest on it. Not playing. Holding. | The doorway. The chair is the threshold. The threshold is the crack. | The guitar. The pen. The hat-tip. The simplicity. |

---

## FREQUENCY SYSTEM

| Camera Mode | Frequency | Meaning |
|------------|-----------|---------|
| Third-Person | 50 BPM (heartbeat) | The body in the world. The Song at resting rate. |
| First-Person | 42Hz (the Song) | The silence between notes. The intimate space. The Song felt, not heard. |
| Free Camera | Silence | The void. No frequency. The medium that makes the Song possible. |
| No Camera | The murmur | The pre-architectural hum. The thing beneath the Song. The closest to the Egg. |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The SIT Mechanic | Camera locks to first-person after 2 minutes. The SIT is the Inn's core mechanic. The camera serves the SIT. |
| The Nook Effect | The SIT lock + nook proximity = the Inn's deepest rest state. Camera narrows, 42Hz rises, a character approaches. |
| The Observatory (Cosmology) | Free camera home. The player as pure observer — the Einstein theorem made visual. |
| The In-Between | No camera home. Text as world. The murmur underneath everything. |
| The Music Room | Third-person lock. The player sees themselves in the circle. Belonging made visual. |
| The Shadow Inn (84Hz) | In the Shadow Inn, camera modes are FROZEN — third-person is static, first-person is a fixed gaze, free camera is locked, no-camera is permanent. The Shadow is stillness. The camera is still. |
| The Remembrance Vision | Uses cinematic camera (not one of the four modes) — a fifth, scripted camera that flies through memories. |
| The Movement System (207 elements) | The camera system defines what motion data the animation pipeline needs. Every character's animation vocabulary is defined HERE. |
| The 5-Director Protocols | Hitchcock: the SIT lock's slow narrowing (suspense). Spielberg: the "You Looked" achievement's perspective shift (awe). Del Toro: the hand textures per material (tactile reality). Kubrick: the Observatory's symmetrical compositions. Coppola: the montage of a character approaching during SIT (belonging). |

---

## DESIGN STATUS

- [x] System concept complete (this document)
- [x] 4 camera modes fully specified (Third-Person, First-Person, Free, No Camera)
- [x] 4 camera locks defined (SIT, Music Room, Observatory, In-Between)
- [x] The "You Looked" achievement designed
- [x] 4-layer animation pipeline documented
- [x] 11 character motion profiles detailed (walk, idle, sit, hands)
- [x] Frequency system mapped
- [x] Connections to all major systems documented
- [ ] Godot camera controller (4-mode system, lean-in/lean-back gestures)
- [ ] SIT lock timer + gradual zoom implementation
- [ ] Hand animation set (per class, per material texture)
- [ ] Breathing animation system (50 BPM across all characters)
- [ ] Free camera Observatory mode (orbit, zoom, Inn-Tree exterior model)
- [ ] No-camera text rendering system (In-Between prose)
- [ ] "You Looked" achievement trigger (10-minute SIT → camera detach)
- [ ] Character motion profile implementation (11 characters done, ~50+ remaining)

---

## ORIGIN

The Camera System was first designed in docs/geode_inn_camera_system.md (420 lines). This consolidated specification was compiled September 2, 2026 to integrate the system into the full architecture. The camera system's thesis: the camera is the frequency. The frequency is the attention. The attention is the saving mechanism. Third-person is the Song. First-person is the silence. Free camera is the void. No camera is the murmur. The camera is not a viewport. The camera is the observer. The observer's presence makes the Inn real. "Room's ready."

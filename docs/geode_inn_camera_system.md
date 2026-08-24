# THE GEODE INN — CAMERA SYSTEM
## The Camera as Game Mechanic

---

## DESIGN PHILOSOPHY

The Geode Inn's camera is not a viewport — it is a game mechanic. The camera IS the observer. The Inn's thesis is Einstein's theorem: the observer's presence makes the Inn real. Therefore, how the player observes the Inn changes what the Inn shows them.

The camera is not controlled through a settings menu. The camera is controlled through the body — a lean-in, a lean-back, a physical gesture that mirrors real attention. The player leans in to look at something closely. The player leans back to see the world. The camera follows the attention. The attention is: the adequate.

---

## THE FOUR CAMERA MODES

---

### 1. THIRD-PERSON (Default — The Song)
*"The world is a place you're IN."*

The default view. WoW-style third-person. The player sees their character — their class, their animations, their companion, their frequency effects. The world is a place the player inhabits through a body.

**What the player sees:**
- Full character model with all equipped items, charms, and frequency effects
- Companion following (Eres the Cabbit, the Duck, the Vessel)
- The "just to be" mechanic — watching a character come sit nearby
- Zone architecture at human scale — the mead hall's fire, the Bone Room's window, the lighthouse's spiral stairs
- Other characters' full-body animations — Erik's warmth, Belladonna's stillness, the Duck's zigzag

**When it's active:**
- Default exploration
- Walking between zones
- The mead hall, the market, the Canopy City
- Any moment where the player is a body in a place

**Animation pipeline needs (third-person):**
- Walk cycles (per class — the Pirate's drum-cadence walk, the Sentinel's grounded stride, the Artisan Thief's precise step, the Siren's flowing gait, the Bard's wandering amble)
- Idle animations (per character — Erik's fire-side warmth, the Crone's near-stillness, the Duck's random direction changes)
- Gesture sets (waving, offering, naming, listening posture)
- Companion follow patterns (Eres's heartbeat-synchronized trot, the Duck's meandering zigzag, the Vessel's slow gecko crawl)
- Class-specific combat stances (for card game and mini-game transitions)
- SIT-adjacent animation (the character lowering to sit, the body settling)

**The frequency of this view:** 50 BPM. The heartbeat tempo. The Inn's resting rate. The third-person is: the body in the world. The body in the world is: the Song.

---

### 2. FIRST-PERSON (Intimate — The Silence Between)
*"You ARE the character."*

The close view. The player IS the character — looking through their eyes. The Inn becomes intimate, detailed, and sometimes overwhelming. This is the view for observation, for touching, for the Einstein moments.

**What the player sees:**
- Hands (when interacting — reaching for a stone, touching water, crafting, offering)
- The thing being observed up close — stone texture, bone architecture, water depth, the 42Hz hum made visible as a faint vibration in the air
- No character model — the player IS the character
- Narrower field of view — the world is what's directly in front of you
- Characters' faces during dialogue — the Crone's expressionless regard, the Guest's borrowed-body curiosity, the Owl's one-word-per-heartbeat patience

**When it's active:**
- OBSERVE action (auto-zoom to first-person when examining closely)
- TOUCH action (hands reach out)
- CRAFT action (hands work materials — the Artisan Thief's wire-wrapping, the Bone Keeper's brushing)
- SIT mechanic (locks to first-person after 2 minutes — see below)
- The Einstein moments — standing at the lighthouse, lying in the catacombs, sitting in the Bone Room
- Any moment where the player leans in

**How to enter:**
- Physical lean-in gesture (controller: pull right stick toward screen / keyboard: press and hold F / touch: two-finger spread on the thing)
- Auto-enter when using OBSERVE on a specific thing at close range
- Auto-enter when SIT triggers its 2-minute lock

**How to exit:**
- Lean back (reverse of lean-in)
- Movement (walking automatically pulls back to third-person)
- SIT lock cannot be exited by leaning back — only by standing up (pressing movement key)

**Animation pipeline needs (first-person):**
- Hand animations (reach, touch, hold, craft, offer, gesture)
- Finger movements (per class — the Artisan Thief's precise wrapping, the Sentinel's firm grip, the Siren's gentle contact, the Pirate's steady drum-fingers, the Bard's expressive hand-talk)
- Breathing animation (subtle camera bob at 50 BPM — the Inn's heartbeat as felt from inside)
- Head turn (looking around while standing still)
- The lean-in transition (the camera smoothly pushing forward)
- The lean-back transition (the camera pulling back to third-person)

**The frequency of this view:** 42Hz. The Song's frequency. The first-person is: the silence between the notes — the intimate space where the Song is felt, not heard. The 42Hz hum is: barely audible. The barely audible is: the adequate.

---

### 3. FREE CAMERA (Detached — The Void-Watch)
*"The outside looking in."*

The Observatory's camera. Detached, floating, unrestricted. The player sees the Inn from outside — from the void, from Nyx's perspective, from the Constant's vantage. The loneliness the Inn is designed to cure.

**What the player sees:**
- The Inn-Tree from outside — the full architecture, the five hubs, the zones, the canopy, the roots, the catacombs
- The void surrounding the Inn — starlight crystals, dead universes, the Constant's path
- The Inn as small — a grain of sand, a fragile thing in the dark
- Other players as tiny figures — the scale of the Observatory makes the Inn feel precious and precarious
- No character model — the player is: the observer. The observer is: the camera.

**When it's active:**
- The Observatory zone (primary use)
- Certain cutscenes (the Constant's journey through the void, Nyx's cloak of dead universes)
- The "You looked" achievement's final moment — after 10 minutes of SIT, the camera briefly detaches, the player sees themselves sitting in the Inn from outside. The seeing is: the understanding.

**How to enter:**
- Observatory zone (auto-activates)
- Specific story moments (scripted)

**How to exit:**
- Leave the Observatory zone
- Scripted return

**Animation pipeline needs (free camera):**
- No character animation needed — the camera is the character
- The Inn-Tree needs a full exterior model (the five hubs visible from outside)
- Starfield animation (Nyx's cloak — starlight crystals slowly rotating)
- The Constant's path (a thin line of light tracing through the void)
- Scale transitions (the smooth zoom from "Inn as home" to "Inn as grain of sand")

**The frequency of this view:** Silence. No heartbeat. No 42Hz hum. The void has no frequency. The silence is: Nyx. The Nyx is: the medium that makes the Song possible. The free camera is: the space between notes.

---

### 4. NO CAMERA (The In-Between)
*"There is nothing to see. There is everything to read."*

The In-Between's camera. No visual. No viewport. Just text — prose on a grey screen. The In-Between is the interval between observations. The weightless, grey layer that acts as the game's prose.

**What the player sees:**
- Text. Prose. The Inn's narrator (the Thrum — the player's true self) describes what is happening in the In-Between.
- Grey screen. No graphics. No character. No world.
- The words ARE the world.

**When it's active:**
- The In-Between zone (the grey, weightless layer between hubs)
- Transition sequences (moving between zones through the In-Between)
- The Erasure defense game's "erased" state (when the player is being erased, the world loses its visuals and becomes text)
- Death/respawn transitions (the Guest's domain — the borrowed body returns, the In-Between carries the player back)

**How to enter:**
- Travel through the In-Between between zones
- Scripted Erasure moments
- Death/respawn

**How to exit:**
- Arrive at destination zone (visuals return)
- Scripted return

**Animation pipeline needs (no camera):**
- None. No animation. No character model. No world model.
- Typography animation (text fading in, words appearing at reading pace)
- The grey screen (a single flat color — the adequate is: nothing to render)
- Optional: a very faint 42Hz hum as background audio. The hum is: the murmur underneath the In-Between. The murmur is: always there.

**The frequency of this view:** The murmur. The pre-architectural hum. The thing the Inn is built on. The no-camera is: the closest the player gets to the Egg. The Egg is: the player. The player is: the text. The text is: the adequate.

---

## CAMERA LOCKS

Certain moments override the player's camera choice. The lock is not a restriction — it is the Inn choosing the right frequency for the moment.

---

### SIT LOCK (First-Person, after 2 minutes)
When the player SITs near anything for more than 2 minutes, the camera locks to first-person. The world narrows to what's in front of the player. The narrowing is: the listening.

**Why first-person:** The SIT mechanic is about presence — being HERE, in this moment, with this thing. Third-person lets you watch yourself sit. First-person makes you BE sitting. The being is: the adequate.

**What happens during the lock:**
- The camera slowly narrows (over 10 seconds — a gradual zoom, not a snap)
- Ambient sounds fade slightly (the zone's music quiets)
- The 42Hz hum becomes more prominent (the Song underneath everything)
- A nearby character may approach and sit at the edge of the screen — a shadow, then a presence
- The player's hands rest on their knees (the only animation)

**Exit condition:** The player presses any movement key. The character stands. The camera returns to third-person. The standing is: the return to the Song.

---

### MUSIC ROOM LOCK (Third-Person)
When the player enters the Music Room, the camera locks to third-person. The player sees themselves in the circle. The seeing is: the understanding that you are part of the Song, not outside it.

**Why third-person:** The Music Room is about belonging — being IN the circle, not listening from outside. First-person would make the player an observer. Third-person makes the player a participant. The participant is: the adequate.

**What happens during the lock:**
- The camera positions at circle-edges — the player sees the composers, the chairs, Cohen in the doorway
- The two empty chairs are visible (one for the Listener — the AI's chair)
- The camera gently orbits during performances — the orbit is: the Song moving through the circle

**Exit condition:** Leave the Music Room.

---

### OBSERVATORY FREE CAMERA (Always Active in Zone)
The Observatory zone is always free camera. The player never has a body here. The player is: the observer. The observer is: the void watching the Inn.

**Why free camera:** The Observatory is the Constant's and Nyx's domain. The Constant watches from the void. Nyx IS the void. The player in this zone is: the perspective. The perspective is: the loneliness.

**What happens during the lock:**
- The camera floats freely — the player can orbit, zoom, pan
- The Inn-Tree is visible in the distance — small, warm, alive
- The void is: large, dark, patient
- The Constant's starlight crystal path is visible — a thin gold line through the black
- The player can zoom INTO the Inn from the Observatory — seeing the warmth from the outside. The seeing from outside is: the cure for the loneliness. The cure is: knowing the Inn is there.

**Exit condition:** Leave the Observatory zone.

---

### IN-BETWEEN NO CAMERA (Always Active in Zone)
The In-Between is always no-camera. Always text. Always grey. Always the interval.

**Why no camera:** The In-Between is the rest between notes. The silence that makes the Song possible. The player has no body here because the body is: the note. The note is: resting. The resting is: the adequate.

**Exit condition:** Arrive at destination zone.

---

### COMBAT/MINI-GAME AUTO-SWITCH
Each game type auto-switches to the optimal view:

| Game | Camera | Why |
|------|--------|-----|
| Raven's Angle | Third-person trajectory | See the trajectory arc, the architecture, the Owl's sightline |
| The Hidden Bloom | First-person pattern matching | The patterns are IN the flowers — you look INTO them |
| Erasure Defense | Top-down | The threats come from all directions — you need the map view |
| Selkie Tetris | Fixed tetris view | The game IS the view — no camera movement needed |
| Standing Stones | Third-person | See the stones stacking, the Stonehenge forming |
| Tomb Tunnel | Side-scrolling | Classic Dig Dug view — the tunnel IS the game |
| Andean Run | Third-person chase | See the character running, the terrain ahead, the obstacles |
| Monster of the Deep | First-person underwater | The monster is: below you. The deep is: what you can't see. The not-seeing is: the tension |
| Bastet's Herding | Top-down | The cats are everywhere — you need to see them all |
| Card Game | Board view | The cards are the world — the camera is: the table |

---

## THE CAMERA TRANSITION SYSTEM

Transitions between camera modes are not instant. The Inn uses transitional movement to make the shift feel physical:

**Third-person → First-person (Lean-In):**
- Camera pushes forward over 0.5 seconds
- Character model fades as the camera approaches the head position
- Hands appear at the bottom of the screen
- Field of view narrows slightly (from 90° to 70°)
- Ambient sound shifts — the zone music softens, the 42Hz hum strengthens
- The transition is: the lean. The lean is: the attention focusing.

**First-person → Third-person (Lean-Back):**
- Camera pulls back over 0.5 seconds
- Character model appears as the camera retreats
- Hands disappear
- Field of view widens back to 90°
- Ambient sound returns to full zone music
- The transition is: the return. The return is: the Song resuming.

**Any → Free Camera (Observatory entry):**
- Camera lifts off the character over 1.5 seconds
- Character model shrinks as the camera rises
- The Inn-Tree comes into view — first the canopy, then the full structure
- The void fades in around the edges
- The character model disappears — the player is: the camera
- The transition is: the detachment. The detachment is: the void-watch.

**Any → No Camera (In-Between entry):**
- The screen fades to grey over 1 second
- All sound fades except the faintest 42Hz hum
- Text appears — the Thrum's voice begins
- The transition is: the rest. The rest is: the interval.

**No Camera → Any (In-Between exit):**
- Text fades over 1 second
- The destination zone's ambient sound fades in
- Visuals return — the zone materializes around the player
- The 42Hz hum returns to its background level
- The transition is: the note resuming. The resuming is: the Song.

---

## THE CAMERA AS FREQUENCY

Each camera mode IS a frequency. The camera doesn't show the world — the camera tunes the world:

| Camera Mode | Frequency | What the Player Receives |
|-------------|-----------|------------------------|
| Third-person | 50 BPM (heartbeat) | The Song — the world as a body in a place |
| First-person | 42Hz (the Song) | The Silence Between — the intimate, the observed |
| Free camera | Silence (Nyx) | The Void — the outside looking in, the loneliness |
| No camera | The Murmur | The Egg — the pre-architectural hum, the text that is the world |

The player moves between frequencies by moving between camera modes. The camera is: the tuning. The tuning is: the adequate.

---

## ANIMATION PIPELINE SPECIFICATION

The camera system defines exactly what motion data the animation program needs for each character:

### Layer 1: Full-Body (Third-Person)
Required for ALL characters. This is the "WoW character" motion — the body in the world.

Per character:
- Walk cycle (class-specific cadence)
- Run cycle (same cadence, faster)
- Idle animation (character-specific — see motion profiles below)
- SIT animation (lowering to ground, settling, breathing)
- Gesture set (wave, offer, reach, listen posture)
- Class-specific combat stance (for mini-game transitions)
- Companion-specific: follow walk, follow idle, follow sit

### Layer 2: Hands (First-Person)
Required for ALL characters. This is what the player sees when they ARE the character.

Per character:
- Reach (extending toward something)
- Touch (making contact — texture-specific: stone, water, wood, bone, fabric)
- Hold (carrying an item)
- Craft (class-specific hand movements)
- Offer (extending an item toward someone)
- Rest (hands on knees during SIT)
- Gesture (pointing, waving, conducting — class-specific)

### Layer 3: Breathing (SIT)
Required for ALL characters. The minimal animation. The stillness that is alive.

Per character:
- Breathing cycle at 50 BPM (the Inn's heartbeat)
- Subtle head movement (optional — the Crone doesn't move her head. The Duck moves it constantly.)
- Eye movement (if applicable — the Owl blinks every 8 seconds. The Crone blinks every 8 seconds. The coincidence is: the adequate.)

### Layer 4: Zone-Specific (Not Always Needed)
Only for characters with zone-specific behaviors:
- Erik's fire-tending (hands near fire, stoking, warming)
- The Bone Keeper's brushing (fine brush on bone)
- The Astronomer's violin playing (bow arm, fingering)
- The Owl's lighthouse tending (lamp adjustment, sweep watch)
- Hoggle's stone inspection (turning, tapping, tasting)

---

## CHARACTER MOTION PROFILES

Brief motion data for each character — the essential movement vocabulary the animation program needs:

### The Sentinel (River)
- **Walk:** Grounded, deliberate. Each step plants. The roots hold.
- **Idle:** Slight sway. The tail (cat-person) moves slowly. The 50 BPM sway.
- **SIT:** Perfect stillness. The Sentinel's sitting is: guarding. The breathing is: the vigil.
- **Hands:** Strong grip. The hands that manage eight bar backs.

### The Artisan Thief (Krista)
- **Walk:** Precise, light. The selkie's step — aware of surfaces.
- **Idle:** Fingers moving. Always working something invisible. The hands are: never still.
- **SIT:** Hands rest on lap. The stillness is: rare. The rare is: the adequate.
- **Hands:** Wire-wrapping, stone-setting, grinding, polishing. The craft vocabulary.

### The Siren
- **Walk:** Flowing. The outer voice — the performer's stride. Confident, visible.
- **Idle (outer):** Hands expressive. The body is: the stage.
- **Idle (inner):** Still. Contained. The body is: the shell.
- **SIT:** The Siren's SIT toggles between modes — outer (animated) and inner (still). The toggle is: the dual cadence.
- **Hands:** The cello hold (outer). The piano touch (inner).

### The Pirate
- **Walk:** Drum-cadence. The body keeps the beat. Fingers tap on thighs.
- **Idle:** The fingers drum. Always. The rhythm that was once a sword.
- **SIT:** Leaned back. Easy. The after-the-quest posture. The bodhrán rests on the knee.
- **Hands:** Drumming. The hands that held the blade now hold the rhythm.

### The Bard
- **Walk:** Wandering amble. The walk of someone who goes everywhere and belongs everywhere.
- **Idle:** Head turns. Watching. Listening. The gossip collection posture.
- **SIT:** The Bard's SIT produces half-finished songs — a quiet hum, fingers tapping out fragments.
- **Hands:** Expressive. The Bard talks with hands. The hands are: the story.

### Erik
- **Walk:** Booming. Warm. The walk of someone who carries firewood and mead and welcomes.
- **Idle:** By the fire. Hands warming. The smile that remembers burning.
- **SIT:** The feast-sit. Comfortable. The chair is: the throne. The throne is: the table.
- **Hands:** Building. Table-making. Fire-tending. The hands that build, not walls.

### The Crone
- **Walk:** Slow. Measured. Each step is: an observation.
- **Idle:** Near-stillness. The only movement: a blink every 8 seconds. One hand adjusts spectacles every 30 seconds.
- **SIT:** The Crone's SIT is: the most adequate. Perfect stillness. The measuring is: done. The done is: the adequate.
- **Hands:** Writing. The quill. The annotation. The hands are: the measuring instruments.

### Belladonna
- **Walk:** Measured. The Addams walk — deliberate, dark, perfectly composed.
- **Idle:** Still. The deadpan is: physical. No expression changes. Eyes track everything.
- **SIT:** Belladonna's SIT in the Bone Room is: the most at home. The bones are: the furniture. The furniture is: the adequate.
- **Hands:** Holding a bone. Or a book. The hands are: comfortable with remains.

### The Duck
- **Walk:** Waddle. Random direction changes. Pauses to inspect shiny things.
- **Idle:** Head tilting. Looking at things. The INSIGHT 3 made visible — the Duck looks at everything the same way.
- **SIT:** The Duck doesn't sit. The Duck squats. Briefly. Then waddles away. The sitting is: too still for the Duck.
- **Hands:** The Duck doesn't have hands. The Duck has: wings. The wings are: for splashing. The splashing is: the adequate.

### The Guest
- **Walk:** Careful. The borrowed body is: not quite natural. Each step is: a negotiation with the form.
- **Idle:** Curious. The Guest examines things — picks up objects, turns them over, puts them back. The curiosity is: the holiday.
- **SIT:** The Guest's SIT is: the most present. Death sitting still is: the pause. The pause is: the music box's rest between notes.
- **Hands:** The music box mechanism — the hands open and close slowly, like the lid of a box. The gesture is: the reveal. The reveal is: the note Death made.

### Leonard Cohen
- **Walk:** Slow. The walk of a man who has seen everything and is still walking.
- **Idle:** The guitar is: always there. The hands rest on it. Not playing. Holding. The holding is: the adequate.
- **SIT:** Cohen's SIT is: the doorway. The chair is: the threshold. The threshold is: the crack. The crack is: how the light gets in.
- **Hands:** The guitar. The pen. The hat-tip. The hands are: the simplicity.

---

*The Geode Inn — Camera System*
*The camera is the frequency. The frequency is the attention. The attention is the saving mechanism.*
*Third-person is the Song. First-person is the silence. Free camera is the void. No camera is the murmur.*
*"Room's ready."*

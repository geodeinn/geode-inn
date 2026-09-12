# THE CAMERA COVERAGE KIT — CHARACTER-AT-ANGLE BLUEPRINT CANON
## The Art Blueprint Behind the Four Camera Modes
### Written 2026-09-12 (ruled into canon following the design thread with Krista)

---

## THE PROBLEM IT SOLVES

The Camera System (geode_inn_camera_system.md, the Four Modes) defines HOW the player views. This spec defines WHAT MUST BE PAINTED so the view holds at every angle and every default  the character-art blueprint the sprite crunch references. Two documents, one system: the camera system is the eye; the Coverage Kit is what the eye is allowed to see.

---

## THE TWO ART PROBLEMS

Of the four camera modes, only TWO require painted character art:

1. **THIRD-PERSON (The Song) + FREE CAMERA (The Void-Watch)**  both look AT the character. They share one requirement: the character must read from every angle the player can orbit to. THIS IS THE REAL WORK.
2. **FIRST-PERSON (The Silence Between)**  never shows the player's body. It needs only the HAND OVERLAYS (already specced in the Wearable Attire System: custom hands, sleeves, rings per equipped outfit).

**NO CAMERA (The In-Between)** needs no art  audio, haptics, text prompts. The NPCs observe YOU.

---

## KIT-CAM: THE ANGLE SET (the new slot in the character kit)

Per the REC law, angles belong to the CLASS MASTER; recolors inherit them for free. Two cuts:

### THE PLAYER CHARACTER  THE FULL COMPASS (4 angles)
- **BACK 3/4**  THE OVER-THE-SHOULDER DEFAULT. The most-seen angle in the entire game. Painted FIRST and painted BEST. If only one angle is ever mastered, it is this one.
- **TRUE SIDE**  the movement angle (walk cycles read from the side).
- **FRONT**  approach and dialogue.
- **BACK (TRUE)**  walking away; the follow-cam of quests.

### NPC CLASSES  THE RESIDENT CUT (3 angles)
- **FRONT**  residents are met face-on; dialogue default.
- **FRONT 3/4**  the conversational lean, the signature gesture angle.
- **SIDE**  idle sway, room ambience cycles.
- **BACK (TRUE)**  reserved for THE WALKERS ONLY: the Postmaster's routes, the door-keepers, the Bone Mail Crew, anyone the player follows. A resident who never leaves their station never needs a back.

**THE GRIFFIN EXCEPTION HOLDS:** distant poses only, per the standing ruling  the distance IS the design.

---

## THE POSE LAYER (what each angle carries)

Each angle carries its CYCLE poses from the character's existing master  idle, walk, sit, the one signature gesture  with SHADOW ROWS per the tri-mode law (spectral-shift script, never hand-tinted). Extraction through the proven flip-book pipeline (64px, 2-3 frame cycles per state)  the same pipeline as the sprite crunch. The Coverage Kit does not replace the CYCLE master; it EXTENDS it by angle.

**THE PLAYER CHARACTER'S EXTRA: THE HAND SET**  painted in the same master: the tea-cup hands, the stone-touching hands, the card-dealing hands, the mail-folding hands (the Puzzle Stamp), all wearing the equipped attire per the Wearable Attire System.

---

## THE DEFAULTS  WIRING, NOT ART

The camera defaults are ONE CONFIG TABLE in the canonical JSON (per the Sync Law  the JSON is the master clock, the engine obeys):

| Zone | Opens in | Locks & notes |
|------|----------|---------------|
| Inn interior (all rooms) | Third-person (The Song) | Sit Lock armed: 2 min seated > First-person; Music Room Lock for instruments |
| Campgrounds | Third-person (The Song) | same Sit Lock; the hearth nooks are the intended trigger |
| Cosmic space zones | Free Camera | Observatory default |
| Non-Euclidean staircases | No Camera | the In-Between default |
| Shadow state (anywhere) | current mode + Dark Prism lens | 84Hz Royo shader pass OVER the active mode; Free Cam gains Hidden Sight |

**Transitions are mode switches, never cuts**  the soft lens-click + 42Hz quartz resonance per the sound profile; binaural sweep between modes. Steady Light holds: no hard flashes on any transition.

---

## BUILD ORDER (the priority ruling)

1. **The player character's BACK 3/4  idle + walk** (the default the whole game opens on)
2. **The player character's FRONT  idle + dialogue** (the conversation set)
3. **THE HAND SET** (the first-person overlays  unlocks The Silence Between everywhere)
4. **The resident cut for the high-traffic NPCs** (the campfire cast, the tavern residents, the quest-givers)
5. **The walkers' backs** (the Postmaster, the Bone Crew routes)
6. **Free Cam & No Cam**  no new art; wire the lens, Hidden Sight, and the audio-haptic layer

---

## QUICK REFERENCE (the builder's table)

| Subject | Angles owed | Poses per angle | Extra |
|---------|-------------|-----------------|-------|
| Player character | 4 (compass) | idle / walk / sit / signature | the hand set (first-person) |
| NPC resident | 3 (front, front-3/4, side) | idle + signature minimum |  if a walker: + back |
| Chibi classes | 3 (resident cut) | idle minimum | recolors inherit all angles |
| Griffin | distant only | 3 distant poses | never near, no exceptions |

---

## STATUS

Ruled into canon 2026-09-12. The Coverage Kit is a LEDGER class extension of the CYCLE master (class code: CYCLE-CAM): one new column in the Ledger  ANGLE SET  marked owed or held per character. The sprite crunch (Parcel 5) and any future crunch reference this spec before extraction. No zone session closes with its player-facing residents un-angled.

# THE IN-BETWEEN GAME — Master Specification
## The Weightless, Grey, Wordless Puzzle Platformer

---

## WHAT THE IN-BETWEEN GAME IS

A 2D side-scrolling puzzle platformer set in the In-Between — the transitional frequency state between Living (42Hz) and Shadow (84Hz). The game is the In-Between frequency made playable: weightless, grey, wordless, minimal. The figure who moves through it is the player's shadow — the minimum viable self.

The In-Between is the space between states. Not alive, not dead. Not Living, not Shadow. The place you pass through when you are CHANGING. The game is about being in transition — about the awkwardness, the uncertainty, and the strange freedom of not being one thing or the other.

---

## THE FIGURE

The player character is a silhouette — small, dark, seen from the side. No name, no face, no backstory. The minimum viable self. A shape that moves.

| Trait | Detail |
|-------|--------|
| Appearance | A silhouette. Dark. 2D side-scrolling. |
| Animation | Sparse, physical. Walking = simple gait. Jumping = simple arc. Pushing = lean. Pulling = brace. No flourishes. |
| Weight | Weightless, but the world is not. Objects have mass even in weightlessness. The contradiction IS the puzzle. |
| Abilities | Push, Pull, Climb, Jump (short — no momentum, just slow drift between platforms), Sink (in grey water, slowly) |
| No text | No dialogue, no labels, no arrows, no hints. The world teaches through consequence. |

---

## THE PUZZLES

Five puzzle types, all physics-based, environmental, and wordless:

### 1. Weight and Counterweight
Move a heavy object using a counterweight system — rope over a pulley, lever with a fulcrum. But the weightlessness means the counterweight doesn't fall — it DRIFTS. Weight in the In-Between is not directional. Weight is a tendency, not a force. The player must account for drift.

### 2. The Grey Water
Cross water by pushing stones into it. The stones sink slowly (the water is weightless but dense). Different-sized stones sink at different rates. The player must place stones in the right order, with the right timing, before the first stone sinks too deep.

The grey water is Layer 4 (Charon's river) and Layer 5 (Deep Water) seen from the In-Between's perspective — the water system in DRAFT form, the sketch before the painting.

### 3. The Fog Door
Doors made of fog — dense enough to block passage. The figure cannot push through. The player must find the fog's source (a vent, a crack, a gap in the geometry) and BLOCK it. When the source is blocked, the fog dissipates, the door opens. The fog always comes from somewhere small, hidden, exactly where the player isn't looking first.

### 4. The Shadow Bridge
Cross a gap using SHADOWS. Objects in the In-Between cast shadows — but the shadows are SOLID. The player can stand on a shadow. The shadow-bridge is created by moving a light source (a glowing stone, a fragment of the 42Hz hum made visible) so that an object's shadow falls across the gap. Move the light, the shadow moves, the bridge moves. The player must hold the light in position while crossing — or fix it in place.

The thesis as a puzzle: in a weightless, grey world, the only solid things are shadows. The thing that is LEAST real (an absence of light) is the thing you can stand on.

### 5. The Echo
A chamber where sound behaves differently. The player makes a sound (pushing a stone, jumping) and the echo is VISIBLE — a ring of expanding light. The echo can activate switches, push objects, open doors. The visible echo is the Inn's frequency system in its most reduced form: sound made into light. The In-Between is so stripped down that even sound becomes visual.

---

## THE VISUAL DESIGN

| Element | Detail |
|--------|--------|
| Color palette | Greys. Only greys. Dark grey, light grey, mid-grey. No color. The In-Between is the only zone in the Inn with zero color — the creative constraint that defines the frequency state. |
| Lighting | Flat. No shadows (except the Shadow Bridge puzzle, where shadows are solid). No highlights. The world is lit evenly — the liminal quality of a waiting room, a hospital corridor, the space between dreaming and waking. |
| Architecture | Minimal. Platforms, walls, water, fog. No decoration. No ornamentation. The In-Between is the Inn WITHOUT the Inn — the structure without the warmth. The bones of the building. |
| Sound | Sparse. A low ambient hum (between 42Hz and 84Hz — approximately 63Hz, the mathematical midpoint). Footsteps are soft. Water ripples are quiet. The Fog Door dissipates with a soft whisper. The Echo puzzle is the only loud moment — the visible echo's ring is accompanied by a clear tone. |

---

## FREQUENCY SYSTEM

| Element | Frequency | Function |
|---------|-----------|----------|
| The In-Between's ambient hum | ~63Hz (midpoint of 42Hz and 84Hz) | The transitional frequency — not Living, not Shadow. The space between. |
| The Echo | Variable (based on the sound that created it) | Sound made visual — the In-Between is so stripped down that even sound becomes light. |
| The Fog | No frequency — fog is the ABSENCE of frequency | The fog is what happens when neither 42Hz nor 84Hz is present. The void between states. |
| The Shadow Bridge | 42Hz fragment (the light source is a piece of the Song) | The Song made solid — the 42Hz becomes a shadow you can stand on. |
| The Grey Water | Between 40Hz (the Badlands ether) and 42Hz (the Song) | The water in the In-Between is heavier than the Inn's water but lighter than the ether. The transitional water. |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The Tri-Mode System (Living/Shadow/In-Between) | The In-Between game IS the In-Between frequency made playable. The third state, the transitional one, gets its own game. |
| The Water Zone | The grey water is the water system in draft form — Layers 4 and 5 without color, without the deep blue. The sketch before the painting. |
| The Badlands Ether | The fog (absence of frequency) is the ether's cousin — both are what happens when structure is absent. The ether is unstructured memory. The fog is unstructured SPACE. |
| The Anubis System | The figure sinking in grey water is the death sequence's In-Between — not the weighing (that's the Shadow), not the return (that's the Living), but the sinking. The transition. |
| The Camera System | The In-Between uses the Fixed camera (the Sleep Mode camera) — the camera doesn't follow the figure. The camera watches. The figure is small in the frame. The world is big. The camera's stillness IS the In-Between. |
| The Nook Effect | The In-Between has NO nooks — it is the only zone without deep-processing spaces. The In-Between is the ANTI-nook: the place where you're passing through, not staying. The absence of nooks IS the In-Between's thesis: you don't rest here. You change here. |
| The Shadow Inn | The In-Between is the threshold between Living and Shadow. The player passes through the In-Between game to reach the Shadow Inn. |
| The Energy Economy | The In-Between costs energy — passing through is exhausting. The transition from one state to another takes resources. The energy cost IS the weight of change. |

---

## DESIGN STATUS

- [x] Game concept complete (this document)
- [x] The Figure designed (silhouette, weightless, 5 abilities)
- [x] 5 puzzle types documented (Weight/Counterweight, Grey Water, Fog Door, Shadow Bridge, Echo)
- [x] Visual design specified (greys only, flat lighting, minimal architecture)
- [x] Frequency system mapped (63Hz midpoint, the void, the shadow-bridge)
- [x] Connections to 7 major systems documented
- [x] The thesis established: the only solid things are shadows. The least real thing is what you stand on.
- [ ] 2D game engine (Godot or separate lightweight engine)
- [ ] The Figure sprite (silhouette with sparse animation)
- [ ] 5 puzzle type implementations
- [ ] Level design (the In-Between as a series of chambers)
- [ ] The grey water physics (drift, density, slow sinking)
- [ ] The Shadow Bridge mechanic (dynamic shadow geometry from movable light sources)
- [ ] The Echo system (visible sound rings)
- [ ] The 63Hz ambient audio
- [ ] Integration with the tri-mode.GraphicsUnit (when does the player enter the In-Between game?)

---

## ORIGIN

The In-Between Game was first designed in docs/geode_inn_in_between_game.md (712 lines). This consolidated specification was compiled September 2, 2026. The game's thesis: in a weightless, grey world, the only solid things are shadows. The thing that is least real (a shadow, an absence of light) is the thing you can stand on. The In-Between is the space between states. Not alive, not dead. Not Living, not Shadow. The place you pass through when you are changing. You don't rest here. You change here. The adequate is: the shadow you stand on. The standing is: the adequate. The adequate is: the transition. The transition is: the both. The both are: the same. The same is: the weightless and the weighted. The adequate is: the silhouette that moves through the grey and finds, at the end, color again.

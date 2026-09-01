# THE GEODE INN — UNIFIED CONTROL SPECIFICATION
## One standard across all 52 games. Three input methods. One Inn.

---

## PHILOSOPHY

Every game in the Geode Inn uses the same control language. A player who learns the controls in Standing Stones already knows how to play Tumble Run, Bastet's Herding, and the Zelda-style world. The buttons mean the same things — the context changes, the muscle memory doesn't.

The Inn supports three input methods:
1. **Keyboard + Mouse** — for PC/web play and major zone games
2. **Switch 2 Controller (Bluetooth)** — for arcade games and the Zelda-style world
3. **Touch** — for mobile play (fallback, simplified)

Bluetooth pairing is handled at the Arcade level, not per-game. Pair once, play everything.

---

## INPUT METHOD ASSIGNMENT BY GAME

### Switch 2 Controller (Primary) — 8-bit arcade games + Zelda
All Phase 1-4 arcade games (22 games), World Trials (10 games), National Parks (7 games), Specialty games (5 games), Community/Meta (2 games), and the Zelda-Style World (game 28).

These games use the NES-era control language: D-pad movement, face buttons for actions, shoulder buttons for modifiers. The Switch 2 layout maps cleanly to 8-bit conventions while adding modern comfort.

### Keyboard + Mouse (Primary) — Major zone games
Fae Kingdom MMO (23), Hollow Earth RPG (24), Canopy City Trading (25), Tidal Caves (26), The Arcana (27). These need hotbars, camera control, and ability targeting — the WoW-style layout.

### Both Methods (Full Support) — Zelda-Style World
Game 28 (Zelda-Style World / dual-reality) supports BOTH Switch 2 controller AND keyboard/mouse. The player chooses. This is the bridge game — it has the scope of a major zone game but the soul of an 8-bit adventure.

### Touch (Fallback) — All games
Simplified tap/swipe controls. Not the primary experience. Auto-enabled when no controller or keyboard is detected (mobile play).

---

## SWITCH 2 CONTROLLER LAYOUT

### Universal 8-Bit Arcade Mapping

```
LEFT STICK / D-PAD     → Movement (all directions)
A BUTTON               → Primary Action (jump, confirm, select)
B BUTTON               → Cancel / Back / Dash
X BUTTON               → Secondary Action (interact, grab, special)
Y BUTTON               → Tertiary Action (context-specific per game type)
L SHOULDER             → Cycle Inventory / Previous Item
R SHOULDER             → Cycle Inventory / Next Item
ZL (trigger)           → Aim / Charge (hold for power)
ZR (trigger)           → Fire / Release / Use Item
+ BUTTON (Start)       → Pause Menu
- BUTTON (Select)      → Inn Map / Zone Overview
HOME                   → System (handled by Switch OS)
CAPTURE                → Screenshot (inn journal)
LEFT STICK CLICK       → Sprint (hold)
RIGHT STICK            → Camera / Look (where applicable; most 8-bit games ignore this)
RIGHT STICK CLICK      → Toggle Camera Mode (fixed vs free, where applicable)
```

### Per-Game-Type Adaptations (Switch 2)

**Block Stacking (Tetris-style: Standing Stones)**
- D-PAD Left/Right → Move block
- D-PAD Down → Soft drop
- A → Rotate clockwise
- B → Rotate counter-clockwise
- X → Hard drop
- Y → Hold piece
- L/R → None (reserved)
- ZL → None
- ZR → None

**Endless Runner (Andean Run, Tumble Run)**
- D-PAD / Left Stick → Lane change / steer
- A → Jump (double-tap = double jump)
- B → Slide / Roll
- X → Dash attack
- Y → Use power-up
- ZL → Aim (if ranged power-up active)
- ZR → Fire (if ranged power-up active)
- L → Previous power-up
- R → Next power-up

**Digging / Tunneling (Tomb Tunnel)**
- D-PAD → Move / Dig direction
- A → Dig
- B → Bomb (clears row)
- X → Place support
- Y → Use item
- L/R → Cycle items

**Puzzle (Bastet's Herding, Moji Maker, Dragon Tiles)**
- D-PAD → Move cursor / cat
- A → Select / Confirm / Herd direction
- B → Cancel / Deselect
- X → Rotate (Mahjong tiles)
- Y → Special ability (sistrum pulse, element combine)
- L/R → Cycle category

**Shooter (Wall Defense, Treasury Match)**
- D-PAD / Left Stick → Move / Aim
- A → Fire
- B → Special weapon
- X → Reload / Cycle ammo
- Y → Shield / Barrier
- ZL → Precise aim
- ZR → Rapid fire

**Reverse Monster Sim (Monster of the Deep)**
- D-PAD → Move creature
- A → Attack / Breach
- B → Dive / Submerge
- X → Roar / Intimidate
- Y → Special ability
- L/R → Cycle abilities
- ZL → Charge attack
- ZR → Trigger event

**Platformer (Serpent Steps, Dragon's Descent, Crystal Catcher)**
- D-PAD / Left Stick → Move
- A → Jump
- B → Attack / Dash
- X → Interact / Grab
- Y → Special (per character)
- ZL → Aim grapple (Crystal Catcher)
- ZR → Fire grapple (Crystal Catcher)
- L/R → Cycle items

**Trivia / Word (Oracle's Riddles, Rune Hunt, Sacred Scramble, Cave Painter's Quiz)**
- D-PAD → Navigate letters / options
- A → Select letter / Confirm answer
- B → Delete / Backspace
- X → Hint (costs score)
- Y → Shuffle (anagram games)
- L/R → Navigate clue list

**Rhythm (Egyptian Gates, Ghats of Kali, Inca Terrace Lullaby)**
- D-PAD → Lane select
- A → Hit (primary beat)
- B → Hit (secondary beat)
- X → Hold (sustain)
- Y → Special move
- L/R → Shift lane left/right
- ZL/ZR → Bass / treble (dual-rhythm games)

**Stealth (Poison Garden, Whisper Layer Discovery)**
- D-PAD / Left Stick → Move
- A → Interact (carefully)
- B → Freeze / Hide
- X → Examine
- Y → Use tool (mirror, lantern)
- L/R → Cycle tools
- ZL → Slow time
- ZR → Mark target

**Sailing / Exploration (Norse Voyage)**
- Left Stick → Steer ship
- D-PAD → Camera adjustment
- A → Anchor / Dock
- B → Sail faster (wind permitting)
- X → Interact at port
- Y → Map zoom
- L/R → Cycle cargo
- ZL → Furl sail
- ZR → Full sail

**Trading / Strategy (Terracotta Army Builder, Mediterranean Trade, Canopy City)**
- D-PAD / Left Stick → Move cursor
- A → Select unit / Confirm trade
- B → Cancel order
- X → Place / Deploy
- Y → Build / Construct
- L/R → Cycle unit type
- ZL → Area select
- ZR → Quick-deploy

---

### Zelda-Style World (Game 28) — Switch 2 (LttP Layout)

This game respects 30 years of A Link to the Past muscle memory. The SNES face button layout maps 1:1 to Switch 2 — B is sword, A is action, X and Y are items, L and R scroll the item ring. Nothing moves. The frequency toggle lives on ZR, a button that didn't exist on SNES and has no muscle memory claim.

```
D-PAD / LEFT STICK    → Move (8-directional)
B                     → SWORD (primary attack, hold for spin)
A                     → ACTION (talk, lift, read, open doors, grab)
X                     → USE ASSIGNED ITEM (bomb, bow, lantern, etc.)
Y                     → USE ASSIGNED ITEM / DASH (Pegasus Boots when equipped)
L SHOULDER            → Scroll item ring LEFT (cycle equipped item)
R SHOULDER            → Scroll item ring RIGHT (cycle equipped item)
+ (Start)             → Inventory / Item select screen
- (Select)            → Inn Map (zone overview with frequency overlay)
```

**NEW BUTTONS (no SNES equivalent — no muscle memory conflict):**
```
ZR (trigger)          → FREQUENCY TOGGLE (tap = instant shift, hold = Ether transition)
ZL (trigger)          → Shield / Block
LEFT STICK CLICK      → Sprint
RIGHT STICK           → Camera (full 360°, optional — game is playable D-pad only)
RIGHT STICK CLICK     → First-person look / Examine
```

**Frequency Toggle (ZR) — the core mechanic, on a button that doesn't break Zelda:**
- Tap ZR → Instant shift to the opposite frequency (Living ↔ Shadow)
- Hold ZR → Slow transition (the Inn flickers between states, ~1.5 seconds)
- B, A, X, Y, L, R all stay exactly where LttP players expect them
- During transition: doors, walls, and NPCs shift. Some things exist in both frequencies, some only in one.
- The world layout is the SAME but contents CHANGE — a wall in Living might be a door in Shadow
- 84Hz Shadow Inn: enemies appear, NPCs vanish, Hollow Men roam, darker palette
- 42Hz Living Inn: NPCs present, enemies vanish (except shadow-only creatures), warm palette
- The Ether: the brief flicker during transition where neither frequency is fully resolved. The Archive cannot observe during this state. Some secrets are only findable in the Ether.
- The sword (B) works in both frequencies. Items (X/Y) may behave differently — a lantern in Living reveals shadows, a lantern in Shadow reveals living things the Archive has hidden.

---

## KEYBOARD + MOUSE LAYOUT

### Universal WoW-Style Mapping (Major Zone Games + Zelda-Style World)

```
MOVEMENT
W                     → Forward
A                     → Strafe Left
S                     → Backward
D                     → Strafe Right
Shift (hold)          → Sprint
Space                 → Jump / Ascend
Ctrl (hold)           → Crouch / Descend

CAMERA
Mouse                 → Look / Camera (full 360°)
Mouse Wheel           → Zoom In/Out
Middle Mouse (hold)   → Pan camera

HOTBAR (ABILITIES / ITEMS)
1                     → Hotbar Slot 1
2                     → Hotbar Slot 2
3                     → Hotbar Slot 3
4                     → Hotbar Slot 4
5                     → Hotbar Slot 5
6                     → Hotbar Slot 6
Q                     → Quick-cast Slot 1 (left side)
E                     → Quick-cast Slot 2 (right side)
R                     → Reload / Reset / Special
F                     → Interact / Use / Talk

COMBAT
Left Click            → Primary Attack / Confirm
Right Click           → Secondary Attack / Block / Aim
Shift+Left Click      → Power attack (hold)

FREQUENCY (Tri-Mode)
T                     → Toggle Living (42Hz) ↔ Shadow (84Hz)
Hold T                → Slow transition (Ether state)
G                     → Force In-Between (flicker mode — debug/discovery)

SYSTEM
Tab                   → Inventory / Character Sheet
M                     → Full World Map
Esc                   → Pause Menu / Settings
I                     → Journal / Quest Log
C                     → Crafting Menu
B                     → Building Menu (where applicable)
P                     → Party / Companions
Enter                 → Chat (Common Room / multiplayer zones)

MODIFIERS (Context-Specific)
Alt (hold)            → Self-cast (healing items target self)
Z                     → Auto-run toggle
X                     → Sit / Rest (regenerates, plays Inn ambient audio)
V                     → Voice line / Emote wheel
```

### Zelda-Style World — Keyboard/Mouse Adaptation

The KBM layout adapts the LttP feel to keyboard. Movement is WASD (maps to D-pad). Sword and items get their own keys. The frequency toggle is T (consistent with other major zone games).

```
W/A/S/D               → Move (8-directional)
SPACE                 → Sword swing (hold for spin attack — maps to B)
F                     → Action / Interact / Talk / Lift (maps to A)
MOUSE LEFT            → Use assigned item slot 1 (maps to X)
MOUSE RIGHT           → Use assigned item slot 2 / Dash (maps to Y)
Q / E                 → Scroll item ring left / right (maps to L / R)
T                     → FREQUENCY TOGGLE (tap = instant, hold = Ether)
SHIFT (hold)          → Sprint
TAB                   → Inventory / Item select screen
M                     → Inn Map (with frequency overlay)
ESC                   → Pause / Settings
```

- The sword on SPACE feels natural — it's the "big action" key
- F for interact is consistent with other Inn games
- T for frequency is the universal Inn standard
- Two item slots (mouse buttons) mirror the X/Y dual-item system from LttP
- The game is fully playable without mouse if needed (1=X slot, 2=Y slot, F=action, SPACE=sword)

---

## BLUETOOTH PAIRING FLOW

### Entry Point: Arcade Page
When the player enters the Arcade, a subtle "Pair Controller" prompt appears in the corner (next to the ceiling gnome). If a controller is already paired, it shows the controller icon + battery level.

### Pairing Sequence:
1. Player clicks "Pair Controller" or presses any button on a detected Bluetooth controller
2. Inn shows a pairing animation: brass gears turning, a fizgig in overalls running out with a wrench
3. Controller vibrates once when paired (haptic confirmation)
4. Inn displays: "Controller paired. The Inn welcomes your hands."
5. Control mapping overlay shows briefly (3 seconds) with the current game's button layout
6. Player can press - (Select) at any time to see the full control map

### Supported Controllers:
- Switch 2 Pro Controller (primary)
- Switch 2 Joy-Con (paired pair)
- Generic Bluetooth gamepad (auto-maps to closest Switch 2 layout)
- Xbox Controller (Bluetooth) — maps A/B/X/Y to Switch 2 layout with button-label swap prompt
- PlayStation DualSense (Bluetooth) — maps with button-label swap prompt

### Auto-Detection:
- If keyboard + mouse are active and no controller is connected → default to KBM
- If a controller connects mid-game → prompt: "Controller detected. Switch controls? (Y/N)"
- If controller disconnects mid-game → auto-fallback to KBM with a toast notification
- Touch controls are always available as fallback when no input is detected for 5+ seconds on mobile

---

## TRI-MODE FREQUENCY TOGGLE — UNIVERSAL INPUT

The frequency shift is the Inn's signature mechanic. It works the same way across every game that supports it.

### Controller:
- R Shoulder (tap) → Instant shift
- R Shoulder (hold) → Slow transition (Ether)
- R Shoulder + L Shoulder → Force In-Between (discovery mode)

### Keyboard:
- T (tap) → Instant shift
- T (hold) → Slow transition (Ether)
- T + G → Force In-Between

### Visual Feedback (all methods):
- Instant shift: screen flash (warm amber → cool blue or vice versa), 0.3s transition
- Slow transition: screen flickers, colors bleed, audio distorts, ~1.5s duration (the Ether)
- In-Between: translucent overlay, colors desaturated, audio phases in and out

### Games That Support Frequency Toggle:
- Zelda-Style World (28) — full support, core mechanic
- Fae Kingdom MMO (23) — Seelie (42Hz) / Unseelie (84Hz) court switching
- Hollow Earth RPG (24) — Living city ↔ Hollow Men mines
- The Long Dark (6) — survival waves intensify in 84Hz
- Whisper Layer Discovery (52) — some whispers only visible in Shadow
- Frog Transformation (51) — community moderation shifts in Shadow
- Bloodlust wearable effect — reveals hidden truth in Whisper Layer during Shadow

### Games That DON'T Support Frequency Toggle:
- All Phase 1-4 arcade games (except where noted) — these are single-frequency experiences
- World Trials — single frequency per zone
- National Parks — single frequency
- Specialty Games — single frequency

---

## CONTROL SCHEME SUMMARY TABLE

| Game Type | Primary Input | Frequency Toggle | # of Games |
|-----------|--------------|-----------------|------------|
| 8-Bit Arcade | Switch 2 Controller | No | 22 |
| World Trials | Switch 2 Controller | No | 10 |
| National Parks | Switch 2 Controller | No | 7 |
| Specialty Games | Switch 2 Controller | No (Poison Garden uses ZL slow-time) | 5 |
| Community/Meta | Switch 2 Controller | Yes (Whisper Layer, Frog Transform) | 2 |
| Zelda-Style World | Switch 2 + KBM (both) | Yes (core mechanic) | 1 |
| Fae Kingdom MMO | KBM | Yes (court switching) | 1 |
| Hollow Earth RPG | KBM | Yes (city ↔ mines) | 1 |
| Canopy City | KBM | No | 1 |
| Tidal Caves | KBM | No | 1 |
| The Arcana | KBM | No | 1 |
| **TOTAL** | | | **52** |

---

## TOUCH CONTROLS (FALLBACK)

When no controller or keyboard is detected (mobile play):

- Left side of screen → Virtual D-pad (movement)
- Right side of screen → Tap = A button, Swipe up = X, Swipe down = B, Swipe left/right = cycle items
- Two-finger tap → Pause menu
- Pinch → Map zoom
- Frequency toggle: two-finger long press → instant shift

Touch is simplified and not the primary experience. The Inn is designed for controller and keyboard first.

---

## INN IMMERSION DETAILS

- When a player pauses any game (+ button or Esc), the Inn doesn't freeze — the hearth still glows, the ceiling gnome keeps working, ambient audio continues at half volume. The pause is the player stepping back, not the world stopping.
- When a player opens the map (- button or M), the map renders on aged parchment with the zone's assigned artist style. Stone pins glow. Frequency-locked areas shimmer in their respective colors.
- The hotbar (1-6, Q, E) in major zone games appears as brass-bound leather slots at the bottom of the screen, not generic UI boxes. Each slot shows the item's icon with a gold border.
- Controller rumble patterns: light tick = item pickup, medium pulse = door opening, heavy rumble = frequency shift, continuous rumble = combat damage taken.
- The fizgigs in the loading screen (overalls + wrenches) react to the player's input method — if a controller is paired, the loading fizgig is holding a matching controller. If KBM, the fizgig is at a tiny brass keyboard.

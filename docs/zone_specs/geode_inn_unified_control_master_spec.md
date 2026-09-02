# THE UNIFIED CONTROL SPEC — Master Specification
## One Standard Across All 52 Games. Three Input Methods. One Inn.

---

## WHAT THE UNIFIED CONTROL SPEC IS

Every game in the Geode Inn uses the same control language. A player who learns the controls in Standing Stones already knows how to play Tumble Run, Bastet's Herding, and the Zelda-style world. The buttons mean the same things — the context changes, the muscle memory doesn't.

Bluetooth pairing is handled at the Arcade level, not per-game. Pair once, play everything.

---

## THREE INPUT METHODS

| Method | Primary Use | Games |
|--------|------------|-------|
| Keyboard + Mouse | Major zone games | Fae Kingdom MMO, Hollow Earth RPG, Canopy City Trading, Tidal Caves, The Arcana |
| Switch 2 Controller (Bluetooth) | Arcade games + Zelda world | All 22 arcade games, 10 World Trials, 7 National Parks, 5 Specialty, 2 Community, Zelda-Style World |
| Touch (Fallback) | Mobile play | All games — simplified tap/swipe when no controller or keyboard detected |

The Zelda-Style World supports BOTH controller and keyboard/mouse. Player chooses. It's the bridge game — the scope of a major zone game, the soul of an 8-bit adventure.

---

## SWITCH 2 CONTROLLER LAYOUT

### Universal 8-Bit Arcade Mapping

| Input | Function |
|-------|----------|
| Left Stick / D-Pad | Movement |
| A Button | Primary Action (jump, confirm, select) |
| B Button | Cancel / Back / Dash |
| X Button | Secondary Action (interact, grab, special) |
| Y Button | Tertiary Action (context-specific) |
| L Shoulder | Cycle Inventory Previous |
| R Shoulder | Cycle Inventory Next |
| ZL Trigger | Aim / Charge (hold for power) |
| ZR Trigger | Fire / Release / Use Item |
| + Button | Pause / Inn Menu |
| - Button | Map / World View |
| Home | Steam Overlay |
| Capture | Screenshot |

### Keyboard + Mouse Layout (WoW-Style)

| Input | Function |
|-------|----------|
| WASD | Movement |
| Mouse | Camera / Aim |
| Left Click | Primary Action |
| Right Click | Secondary / Context Menu |
| 1-0 Keys | Hotbar (abilities) |
| Q/E | Strafe / Modifier |
| Tab | Target Cycle |
| I | Inventory |
| M | Map |
| Esc | Menu |
| Space | Jump / Ascend |
| Shift | Sprint / Descend |

---

## THE INN MENU (Pause Menu)

The pause menu is the same in every game. A player pauses Standing Stones and sees the same menu they'd see pausing the Fae Kingdom MMO.

| Menu Item | What It Does |
|-----------|-------------|
| Stone Collection | View collected stones, frequencies, lore |
| Quest Journal | Active and completed quests |
| The Archive | Access the library |
| Inn Map | Zone map + world map |
| Audio Settings | Pulse Line modalities (Audio, Haptic, Visual), Minimal Mode, Silent Mode |
| Controller Settings | Remap buttons, adjust sensitivity |
| The Common Room | Access chat |
| Quit to Inn | Return to the Main Floor hub |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| Every Game | All 52 arcade games + the MMO zones use this standard. |
| Bluetooth Requirement | Arcade game build criteria #5: Bluetooth option for all controller types. |
| Steam Deck | Steam Deck mapping documented separately. |
| The 7 Acceptance Criteria | Control system is part of the "fully playable" and "Bluetooth controller support" criteria. |
| The Pulse Line | Audio/Haptic/Visual toggles live in the pause menu's Audio Settings. |
| The Valkyrie Shift | TV remote = 42Hz basic navigation, Bluetooth controller = 84Hz Shift. |

---

## DESIGN STATUS

- [x] Three input methods designed (KBM, Switch 2, Touch)
- [x] Universal 8-bit arcade mapping (Switch 2)
- [x] WoW-style keyboard/mouse mapping
- [x] Unified pause menu designed
- [x] Steam Deck mapping documented
- [x] Touch fallback designed

---

## ORIGIN

The Unified Control Spec was first written in docs/geode_inn_unified_control_spec.md (404 lines). This consolidated specification was compiled September 2, 2026. The thesis: learn once, play everything. The adequate is: the buttons that mean the same things in every game. The game is: the adequate. The adequate is: the controller you pair once and the muscle memory that carries across 52 games, and the carrying is: the entire point. The point is: the same language. The both are: the context and the constant. The same.

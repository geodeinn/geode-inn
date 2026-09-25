# Geode Inn — TV Platform Deployment Spec

## Goal

Wrap the existing web-based arcade games as native TV apps across major smart TV platforms. The games already run as web apps — this is about packaging them for TV remotes and app stores, not rebuilding from scratch.

## Core Principle: Full Submersion

When someone launches the Geode Inn from a TV, they should never feel like they opened a website. No location screen, no nav bar, no "Home / Arcade / World Map / Stones" menus, no footer links, no browser chrome. From the moment the app icon is selected, the player is INSIDE the Inn — a full-screen, immersive experience with zero web framing.

The TV app is not a portal to the website. It is the Inn, experienced through a television.

## Platform Priority

### Tier 1 — Fastest Wins (WebView Wrappers)
These platforms run web apps natively or can wrap them with minimal effort.

**Amazon Fire TV (Android-based)**
- Tech: WebView shell inside a standard Android APK
- Input: Fire TV remote (D-pad + select + back), optional game controller
- Store: Amazon Appstore
- Effort: Low — wrap web game in Android WebView, map remote buttons to keyboard events
- Notes: Most Fire TV devices also support Bluetooth game controllers

**Android TV (Google TV, Nvidia Shield, Sony Bravia, etc.)**
- Tech: Same WebView APK approach as Fire TV
- Input: Remote D-pad, Bluetooth controllers
- Store: Google Play Store
- Effort: Low — essentially the same build as Fire TV with minor platform tweaks

### Tier 2 — Web App Native (Slight Adaptation)
These TVs literally run web apps as their native app format.

**Samsung Tizen TV**
- Tech: Tizen Web App (HTML/CSS/JS — basically what we already have)
- Input: Samsung Smart Remote (D-pad + select + back + voice), optional gamepad
- Store: Samsung Apps (Tizen Store)
- Effort: Low-Medium — package existing web game as Tizen .wgt file, map Samsung remote key events
- Notes: Samsung has the largest smart TV market share globally

**LG webOS TV**
- Tech: Web App (HTML/CSS/JS — native format is literally web)
- Input: LG Magic Remote (D-pad + select + back + scroll wheel + voice), optional gamepad
- Store: LG Content Store
- Effort: Low-Medium — package as webOS .ipk file, map Magic Remote events
- Notes: Magic Remote has a gyro pointer — some games could use pointer input

### Tier 3 — Rewrite Required (Later)
**Roku**
- Tech: BrightScript + SceneGraph (Roku's proprietary language)
- Input: Roku remote (D-pad + select + back + replay), optional gamepad
- Store: Roku Channel Store
- Effort: High — full rewrite per game in BrightScript
- Strategy: Only port flagship titles (Tumble Run, Standing Stones) if ROI justifies it

### Tier 4 — Handheld PC (Zero Effort)
**Steam Deck**
- Tech: SteamOS (Linux) — runs Steam games natively, or runs the web app in SteamOS browser
- Input: Built-in controller (thumbsticks, D-pad, ABXY, L1/R1/L2/R2, trackpads, gyro)
- Store: Steam Store (already where our games live)
- Effort: Zero additional — if it ships on Steam, it runs on Steam Deck
- Valkyrie Shift: NOT REQUIRED — the player arrives already holding something real. The Deck IS the controller. The deeper games are open from the moment the Inn loads.
- Notes: Also works for ASUS ROG Ally, Lenovo Legion Go, and other PC handhelds. Same principle — full controller built in, full Steam compatibility. The Inn recognizes handhelds and skips the Valkyrie scene entirely. The door is already open.

## The Valkyrie Shift — Input Progression Mechanic

### The Problem
TV remotes are limited — D-pad, select, back. That's enough for simple games (Tetris, Dig Dug, word puzzles) but not for platformers, RPGs, or anything requiring jump + move + action simultaneously. Requiring a controller from the start creates friction and kills first impressions.

### The Solution: Narrative Input Progression
The shift from TV remote to game controller is not a settings prompt — it is a story moment. The controller IS the power-up. The player's first interaction is with the remote they already hold. The deeper world requires something more, and the Inn tells them so.

### Phase 1: The Remote Layer (Front Door)
The player enters the Game Chamber using only the TV remote. All simple games are playable:
- Standing Stones, Tomb Tunnel, Treasury Match, Pinball, Oracle's Riddles, Rune Hunt, Sacred Scramble, Catacomb Labyrinth, Wall Defense
- Navigation: D-pad to move between alcoves, Select to enter a game, Back to return to Chamber
- The player has a complete arcade experience with zero friction

### Phase 2: The Valkyrie Shift (The Descent)
When the player attempts to go deeper — selecting a platformer, RPG, or any game that requires multi-button input — the Inn responds with a narrative beat:

**The Scene:**
- The selected alcove darkens. The stone door at the back of the Chamber begins to glow with a deep amber light — a frequency shift from 42Hz (Living) toward something older.
- A Valkyrie descends — not as a character with dialogue, but as a presence. A winged silhouette made of warm light, seen briefly against the dark stone.
- The Inn speaks (text carved into stone, not a pop-up):

  *"The path below requires a hand that holds more than a whisper. Connect something real."*

- The game prompts: "Press any button on a Bluetooth controller to descend."

**The Moment:**
- The player pairs a Bluetooth controller to the TV (standard OS pairing flow)
- When a button is pressed, the Valkyrie's wings flare — the amber light floods the Chamber
- A deep stone rumble (84Hz — the Shadow frequency) shakes the room
- The back wall cracks open, revealing the deeper games: Tumble Run, Dragon's Descent, The Long Dark, Fae Kingdom MMO, Zelda-Style World, all the controller-required titles
- The Valkyrie ascends and is gone — the controller is now the player's instrument

**If No Controller:**
- If the player backs out or has no controller, the Valkyrie retreats. The deeper games remain darkened but visible — a promise, not a punishment.
- The player returns to the Chamber with full access to all remote-friendly games. No dead end, no error message, no frustration.
- The darkened alcoves glow faintly — a reminder that there is more below, when the player is ready.

### Phase 3: The Controller Layer (Full Descent)
Once the Valkyrie Shift is complete, all games are unlocked. The controller becomes the primary input:
- Full gamepad mapping (left stick, A/B/X/Y, L1/R1 for frequency toggle, Start for pause)
- TV remote still works for Chamber navigation and simple games
- The player can switch between remote and controller freely — the Inn accepts both

### Design Rules for the Valkyrie Shift
1. **No error messages.** The shift is a scene, not a warning.
2. **No settings menu.** The controller pairing happens through the narrative prompt, not a config screen.
3. **No forced upgrade.** If someone never connects a controller, they still have a full arcade. The deeper games are a horizon, not a wall.
4. **The Valkyrie is felt, not explained.** No lore dump. A winged light, a rumble, a crack in the stone. The player understands instinctively.
5. **The shift is permanent for the session.** Once connected, the deeper games stay open until the app is closed. Re-opening the app starts fresh — the Valkyrie appears again only if the player tries to descend without a controller.
6. **The shift is tied to the Inn's frequency system.** 42Hz (Living) = remote layer. 84Hz (Shadow) = controller layer. The Valkyrie bridges the two — she is the frequency made visible.

### Games by Input Tier

**Remote-Only (Valkyrie not required):**
- Standing Stones, Tomb Tunnel, Treasury Match, Pinball, Oracle's Riddles, Rune Hunt, Sacred Scramble, Catacomb Labyrinth, Wall Defense, Andean Run (simplified)

**Controller Required (Valkyrie Shift needed):**
- Tumble Run, Dragon's Descent, Serpent Steps, The Long Dark, The Reclamation, The Signal, Fae Kingdom MMO, Hollow Earth RPG, Canopy City Trading, Tidal Caves, The Arcana, Zelda-Style World

**Not Available on TV:**
- Bead Board (drag-and-drop), Music Room Composer (precision touch), Monster of the Deep (accelerometer)


**Steam Deck / Handheld PC:**
- ALL games playable — the Deck has thumbsticks, buttons, AND trackpads
- Bead Board works via trackpad/touchscreen
- Music Room Composer works via touchscreen
- Monster of the Deep works via gyro tilt
- The Valkyrie Shift is skipped — the player is already equipped. The door opens on arrival.
## Controller Mapping

All TV remotes map to the same core inputs. Games should detect TV platform and use a unified remote input layer:

| Remote Action | Web Key Event | Game Function |
|---|---|---|
| D-Pad Up | ArrowUp | Move up / navigate |
| D-Pad Down | ArrowDown | Move down / navigate |
| D-Pad Left | ArrowLeft | Move left / navigate |
| D-Pad Right | ArrowRight | Move right / navigate |
| Select / OK | Enter | Confirm / primary action |
| Back | Backspace / Escape | Back / pause / menu |
| Play/Pause | MediaPlayPause | Pause / resume |
| Menu / Home | Escape | Exit to menu |

For games that need more inputs (jump, shoot, etc.), require a Bluetooth game controller. Map:
| Gamepad | Game Function |
|---|---|
| Left Stick / D-Pad | Movement |
| A / Cross | Jump / primary |
| B / Circle | Cancel / secondary |
| X / Square | Action / interact |
| Y / Triangle | Special / inventory |
| Start / Menu | Pause |
| L1 / R1 | Frequency toggle (Living ↔ Shadow) |

## UI Considerations for TV

1. **10-foot UI scaling**: All text, buttons, and cards must be larger than web version. Minimum 24px font, 48px touch targets.
2. **Focus navigation**: No mouse cursor (except LG Magic Remote). All navigation via D-pad focus highlighting — selected element gets gold border glow.
3. **No hover states**: TVs don't have hover. Replace all hover effects with focus effects.
4. **Safe zone**: Keep all UI elements within 90% of screen (TVs overscan). 5% margin on all sides.
5. **Splash screen**: Geode Inn logo (Antikythera + underwater, 50 BPM pulse) on app launch.
6. **Loading screen**: Fizgigs in overalls (canonical loading screen characters).

## Immersive Launch Flow (TV-Exclusive)

The TV app has its own launch sequence that NEVER shows web navigation. Here is the exact flow from app launch to gameplay:

### Step 1: Cold Open (0-3 seconds)
- Full-screen black
- Antikythera logo materializes from darkness with 50 BPM golden pulse
- No text, no "Welcome to", no URL, no loading bar
- Optional: deep ambient hum (42Hz) fading in
- The logo is the only thing on screen — the player is already inside

### Step 2: The Descent (3-6 seconds)
- Logo dissolves into a slow downward camera move through dark stone
- Celtic knotwork texture pulses subtly in the walls
- Warm amber light grows below
- No navigation, no menu, no text
- The player is literally descending into the Inn

### Step 3: The Arcade Door (6-8 seconds)
- Camera settles on a heavy stone door with carved game symbols
- Door glows gold at the seams
- D-pad or Select opens the door (player's first interaction)
- If no input after 5 seconds, door opens automatically

### Step 4: The Game Chamber (main hub)
- Full-screen stone chamber with arched alcoves
- Each alcove contains a glowing game card (title, zone crest, reward stone)
- Focus-navigable via D-pad — selected alcove brightens with gold border
- NO web elements: no header, no nav bar, no footer, no breadcrumbs
- Frequency toggle (Living / Shadow / In-Between) accessible via L1/R1 or a dedicated corner icon
- Fizgigs may wander across the bottom of the screen (ambient life)
- Deeper game alcoves (controller-required) are visible but darkened until the Valkyrie Shift

### Step 5: Game Launch
- Selecting a game triggers a fizgig loading screen (overalls + wrench)
- Game launches full-screen — no browser frame, no address bar
- Back button opens an in-game pause overlay (not a web page)

### Step 5a: Valkyrie Shift (if controller-required game selected without controller)
- Alcove darkens, Valkyrie descends, stone prompt appears
- Bluetooth pairing prompt (native OS flow)
- Controller button press → Chamber cracks open, deeper games illuminate
- See "The Valkyrie Shift" section above for full detail

### Step 6: Pause / Exit
- Back button during gameplay opens a minimal overlay: Resume, Quit to Chamber, Frequency Toggle
- Overlay is a translucent stone tablet, not a web modal
- Quitting returns to the Game Chamber, not a website
- Exiting the app via Home/Back returns to TV home screen

## What Gets Stripped for TV

The following web elements must NOT appear in the TV app:
- Top navigation bar (Home, Arcade, World Map, Stones, Archive, Market, Composer, Bead Board, Common Room)
- Location/zone selection screen (replaced by the Game Chamber alcoves)
- Footer links (Living / Shadow / In-Between as nav links)
- "Back to the Inn" button
- "The Steam Studio" external link
- "Playable Now in the Inn" text section
- Phase labels and "FORTHCOMING" badges (TV shows what's available, not a roadmap)
- "Coming Soon" cards (only show playable games on TV)
- Page headers like "THE ARCADE · FIFTY-TWO AMUSEMENTS"
- Any URL visible anywhere
- Any reference to "website", "visit", "online", or "browser"
- Ceiling Gnome button (web-only feature)
- Bluetooth controller setup screens from the OS (replaced by Valkyrie Shift narrative)

## What Stays for TV

- Geode Inn visual identity (dark stone, gold/brass, Celtic knotwork, serif typography)
- Frequency toggle (Living 42Hz / Shadow 84Hz / In-Between) — accessible but not as a footer link
- Game cards with zone crest and reward stone info
- Fizgigs on loading screens
- Ambient audio (42Hz hum, 50 BPM pulse)
- The Inn's atmosphere — just without the website furniture
- The Valkyrie Shift — TV-exclusive narrative input progression

- Steam Deck / handheld PC support (native — no porting needed)
## App Structure per Platform

Each TV app contains:
1. **Cold Open**: Logo + descent (no interaction needed)
2. **Game Chamber**: Full-screen stone room with game alcoves (focus-navigable)
3. **Valkyrie Shift**: Narrative controller-pairing scene (triggered on first deeper-game attempt)
4. **Game**: The wrapped web game with remote/controller input mapped, full-screen
5. **Pause Overlay**: Translucent stone tablet — Resume, Quit to Chamber, Frequency Toggle
6. **Settings**: Hidden behind a corner icon — sound, frequency mode, controller config

## Monetization

- Free games: Included in TV app at no cost (same as web)
- Paid games: TV app is free to download, individual games unlocked via in-app purchase (matches Steam standalone model)
- Alternatively: "Geode Inn Arcade Pass" subscription — unlock all games on TV for monthly fee

## Build Approach

1. Create a unified `TVRemoteInput.js` module that maps all platform remote events to a standard input interface
2. Create a `TVUI.css` stylesheet for 10-foot scaling, focus states, and full-screen immersive layout
3. Create a `TVGameChamber.html` — the TV-exclusive hub that replaces the web Arcade page (no nav, no footer, no web framing)
4. Create a `TVSplash.html` — the cold open / descent sequence
5. Create a `TVPause.js` — the in-game pause overlay module
6. Create a `ValkyrieShift.js` — the narrative controller-pairing scene module
7. For each platform, package the above + web games into the platform's app format:
   - Fire TV / Android TV: Android Studio project with WebView → APK
   - Samsung Tizen: Tizen Studio project → .wgt
   - LG webOS: webOS CLI package → .ipk
8. Test on actual TV remotes (emulators exist but real hardware is better)

## What the Builder Needs

1. `TVRemoteInput.js` — unified remote input mapping (I can write this)
2. `TVUI.css` — 10-foot scaling, focus states, immersive full-screen layout (I can write this)
3. `TVGameChamber.html` — the stone chamber hub with game alcoves (I can write this)
4. `TVSplash.html` — cold open / descent animation (I can write this)
5. `TVPause.js` — pause overlay module (I can write this)
6. `ValkyrieShift.js` — Valkyrie Shift narrative scene + controller detection (I can write this)
7. Platform-specific packaging instructions for each TV store
8. Game compatibility flags in MarketItem (tvCompatible: true/false, tvInput: "remote" | "controller" | "both")
9. A TV-only filter: only show games that are playable (no "coming soon" on TV — TV apps should feel complete)

## Phase Plan

**Phase SD-0**: Steam Deck — no additional work needed. When Steam games ship, they run on Deck natively. The Inn detects the built-in controller and skips the Valkyrie Shift. Deepest games open immediately. This is the zero-cost launch pad.
**Phase TV-1**: Fire TV + Android TV (same Android build, two stores) — wrap 10 best-fit remote games with full immersive chamber + Valkyrie Shift
**Phase TV-2**: Samsung Tizen — same package as Tizen web app
**Phase TV-3**: LG webOS — same package as webOS web app
**Phase TV-4**: Expand to game-controller titles (Tumble Run, platformers, RPGs) — Valkyrie Shift unlocks these
**Phase TV-5**: Roku — port 1-2 flagship titles only (Tumble Run, Standing Stones)

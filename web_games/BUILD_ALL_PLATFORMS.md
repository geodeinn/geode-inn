# Geode Inn — All-Platform Build System

## Strategy: One HTML5 codebase → every platform

Each game is a self-contained HTML5 file with Canvas API.
No external dependencies. No frameworks. No build step required for web.
Touch controls auto-enabled on mobile. Gamepad API for controllers.

## Platform Targets

### 1. Web (geodeinn.com + itch.io)
- Serve .html files directly
- Embed in Base44 pages via iframe
- Upload to itch.io as HTML5 games (free or paid)
- Status: READY — just upload

### 2. Desktop (Windows / Mac / Linux)
**Option A: Electron wrapper (easy)**
- npm install electron
- Main process loads the HTML file
- Package with electron-builder for all 3 OSes
- ~150MB per platform (includes Chromium)

**Option B: Tauri wrapper (lightweight)**
- npm install tauri
- Uses system webview (~10MB overhead)
- Rust backend, HTML frontend
- Faster, smaller, but needs Rust toolchain

**Option C: NW.js (formerly node-webkit)**
- Similar to Electron, simpler config
- Good for rapid packaging

### 3. Mobile (iOS / Android)
**Option A: Capacitor (recommended)**
- npm install @capacitor/cli @capacitor/core
- Copy web_games/ to www/
- npx cap add ios && npx cap add android
- Build in Xcode / Android Studio
- App Store / Play Store ready

**Option B: Cordova (legacy but stable)**
- Same flow as Capacitor, older ecosystem

**Option C: PWA (no app store needed)**
- Add manifest.json + service worker
- Installable from browser
- Works offline
- No Apple/Google review process

### 4. Steam (Godot build)
- Already in progress: godot_project/
- 5 games have Godot scripts
- Can embed HTML5 games in Godot via WebView plugin
- Or rebuild natively in Godot for better performance

### 5. Nintendo Switch 2 (if applicable)
- Requires Nintendo dev kit + NDA
- Godot has Switch export (with dev kit)
- HTML5 games would need porting to Godot/native
- Future target, not immediate

## Recommended Build Order
1. Web — live now (just upload .html files)
2. PWA — add manifest + service worker (instant mobile install)
3. Electron — desktop apps for itch.io / direct download
4. Capacitor — native mobile apps for stores
5. Steam — Godot native builds (already started)

## Per-Game File Structure
Each game ships as:
- {game_name}.html (the game — fully self-contained)
- {game_name}.png (thumbnail for stores)

## Shared Aesthetic
All games use the same visual DNA:
- Dark stone background (#0d0b08)
- Antiqued gold text (#c4a572)
- Celtic knotwork top border
- Georgia serif font
- Stone-gradient piece rendering
- "Everything here is true" footer philosophy

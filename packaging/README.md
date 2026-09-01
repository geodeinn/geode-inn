# Geode Inn Arcade — Packaging Pipeline

## Structure

```
packaging/
  pwa/              PWA manifest + service worker (web installable)
  electron/         Electron desktop app (Windows/Mac/Linux → Steam)
  capacitor/        Capacitor mobile app (iOS/Android)
  steam_pages/      61 individual Steam store page HTML files
  steam_store_page_template.html   Reusable store page template
  generate_steam_pages.py          Batch script to regenerate store pages from manifest
```

## Quick Start

### PWA (Web Beta)
1. Copy `pwa/manifest.json` and `pwa/sw.js` to the web root
2. Copy `web_games/geode_inn.html` to `arcade.html` in the web root
3. Add `<link rel="manifest" href="/manifest.json">` to the HTML head
4. Register the service worker in the HTML
5. Users can "Install App" from their browser

### Electron (Desktop/Steam)
1. `cd packaging/electron`
2. `npm install`
3. Copy `web_games/geode_inn.html` to `packaging/electron/arcade.html`
4. `npm start` — launches the arcade as a desktop app
5. `npm run build:win` — creates Windows installer (NSIS)
6. `npm run build:mac` — creates macOS DMG
7. `npm run build:linux` — creates Linux AppImage
8. Upload builds to Steam via Steamworks dashboard

### Capacitor (Mobile)
1. `cd packaging/capacitor`
2. `npm install`
3. `npm run prepare` — copies arcade.html and syncs
4. `npx cap open ios` — opens Xcode for iOS build
5. `npx cap open android` — opens Android Studio for Android build
6. Build and submit to App Store / Google Play

### Steam Store Pages
- 61 individual HTML pages in `steam_pages/`
- Each page uses the Geode Inn aesthetic (dark stone, gold serif)
- Template at `steam_store_page_template.html` — edit and re-run `generate_steam_pages.py`
- Pages include: game name, description, lore connection, price, reward stone, features

## Offline-First Architecture
- The arcade HTML file is fully self-contained (2,585 lines, ~186KB)
- localStorage persists stone collection and game progress
- No network required after initial load
- PWA service worker caches the HTML for offline web play
- Electron bundles the HTML in the app — zero network dependency
- Capacitor bundles the HTML in the native app — zero network dependency

## Pricing Summary (61 games)
- Free: 3 games (Spiral Gallery Tour, Frog Transformation, Whisper Layer Discovery)
- $2.99: 10 games (Phase 1-2 classic arcade)
- $3.99: 26 games (Phase 3-4, World Trials, Parks)
- $4.99: 15 games (Standalone, Specialty, Retro)
- $6.99: 1 game (The World Walker — 6 worlds)
- $9.99: 3 games (Major Zone: Canopy City, Tidal Caves, The Arcana)
- $12.99: 3 games (Legendary: Fae Kingdom MMO, Hollow Earth RPG, Zelda-Style World)

## Steam SKU Strategy
- Individual game purchases ($2.99-$12.99)
- Arcade Pass Bundle: all 52 core games for $29.99 (save ~40%)
- Legendary Bundle: 3 Major Zone games for $24.99 (save ~36%)
- Free-to-play: 3 community features (not sold, included with any purchase)

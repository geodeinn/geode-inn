# Releasing on Steam

Everything on the game's side is ready: achievements, cloud saves, the
Windows build with its icon and version, and an upload script. These steps
need the Steamworks account, so the account holder does them (about an hour
the first time, plus Valve's review).

## 1. The account and the app

1. Sign up at partner.steamgames.com (identity and tax forms, one-time).
2. Pay the Steam Direct fee ($100 per game) to get an App ID.
3. In App Admin, note the **App ID** and the **Windows depot ID** (SteamPipe >
   Depots; Steam makes one depot for a new app).
4. Put both in `data/platform.json`:
   ```json
   "steam": { "app_id": 1234560, "depot_windows": 1234561 }
   ```

## 2. GodotSteam

The game calls Steam through GodotSteam, and does nothing when it's missing.

1. Download the GodotSteam **GDExtension** build for Godot 4 (GitHub:
   GodotSteam/GodotSteam, the gdextension release, or the Godot Asset
   Library) and put its `addons/godotsteam` folder in the project.
2. Open the project once in Godot so it registers the extension, then export.
3. To test on your own PC with Steam running, put a `steam_appid.txt` next to
   the exported exe containing the App ID (only for testing; Steam supplies it
   for real players, so don't ship that file).

## 3. Achievements

Add these in Steamworks (Stats & Achievements > Achievements) with exactly
these API names. The game unlocks them by API name.

| API name | Name | Description | Hidden |
|---|---|---|---|
| FIRST_CHIME | First Chime | Your geode sang for the first time. | no |
| FIRST_HARMONY | Two Lines, One Rhythm | Answered a being that had lost its note. | no |
| ADEQUATE | Adequate | The Ragana approved of your notes. | no |
| YOU_LOOKED | You Looked | Sat still long enough to see yourself sitting in the Inn. | no |
| FOUND_ZIGGY | Hide and Seek | Found the gecko. | no |
| WOLFS_WHISTLE | The Welcome Before the Door | Followed the wolf, and Jay gave you the whistle. | no |
| FIRST_ROOF | It Stands | Built your first shelter. | no |
| SEVEN_SISTERS | The Ring's Chord | All seven sisters sang in one circle. | no |
| INN_HOME | (your choice) | You sat by the fire. The builder was there. You were home. | yes |

Each needs a 256x256 icon (locked and unlocked). Publish them when done.

## 4. Cloud saves

Steamworks > Steam Cloud: turn it on, byte quota 10 MB, 20 files. The game
writes its save through the Steam Cloud API itself (`main.json`), so no
Auto-Cloud paths are needed.

## 5. Upload a build

1. Install SteamCMD (Valve's command-line uploader).
2. Export: `godot --headless --path . --export-release "Windows Desktop" build/windows/GeodeInn.exe`
3. Run the smoke test: `build/windows/GeodeInn.exe --headless -- --smoke-test`
4. Upload: `powershell -File tools\steam\upload_to_steam.ps1 -SteamUser <account>`
   (Steam asks for the password and Steam Guard code).
5. In Steamworks > SteamPipe > Builds, set the new build live on the default
   branch.

## 6. Before the store page goes live

- Store art: header capsule 920x430, small capsule 462x174, main capsule
  1232x706, vertical capsule 748x896, library assets (capsule 600x900, hero
  3840x1240, logo), at least 5 screenshots, a trailer.
- The content survey, including the AI content disclosure (which art or text
  was made with AI tools).
- Credits: the barn owl is CC-BY 3.0 and is credited in the game's Credits
  screen and in CREDITS.md; keep both.
- Price, release date, and Valve's review of the store page and the build
  (a few days each).

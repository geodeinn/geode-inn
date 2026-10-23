# The Geode Inn: first release build

Godot 4.7.2 (GDScript, Compatibility renderer). Steam first; the code avoids
anything that blocks a later PS5/Switch port.

Version 0.2 lines the build up with the client's written canon in the
`geode-inn` repo (walkthrough dissections 13 and 14, the Common Room spec and
its live backend, the nook effect, drum circle, building system, boot
sequence, core definition and Final Room specs). Where the canon names a rule,
a number or a line, the game uses it as written.

## What's in it

| Area | What works now |
|---|---|
| Boot | The client's boot sequence: silence, the 42Hz Song, the heartbeat, the watchers waking, then the Inn's first words, "The fire is lit." Any key skips |
| Main Floor | One axis from the front door to the hearth to the staircase. The Host at the door ("Come in, you're safe here."), the Firekeeper's hearth and the Common Room, the Catalyst's bar built into the wall beside the fire with the impossible garden behind it, the arcade's cabinets and the Score Stone, the market lining the paths with stalls around the Inn-Tree, the Library Nook with Naut's fireplace and the Ragana's reading table, the Dragon's Geode Corner, the Faire Grounds off the east wall |
| The Dragon's Geode Corner | A baby dragon asleep in a geode that fills with a gem for every stone you learn (the progress bar). Ring your stones here. Home of the Unstrung Echo |
| Ziggy | Hiding from the very first hour. Find the gecko and the geode rim is home; the days you were away show as blinks and shed scales, never spoken |
| The Pulse Line | 50 BPM ECG line on every screen, warmer/colder near frequency nodes. Drives the heartbeat sound and gamepad rumble so all three stay in sync. The Host offers the three ways to feel it as gifts, one per early visit; every modality is always in Settings |
| The nook (SIT) | Sit: the heartbeat comes forward and the 42Hz hum is heard. Settle in and hidden layers show. 2 minutes: first person. 10 minutes: You Looked, and the camera steps outside for a moment |
| Harmonization | Match a being's tones with your stones (octave-aware, in cents). No damage. The being joins you |
| The Song | One world value from 42 Hz, shared by everyone on a server. 44 Hz is the endgame, so this release stops at 43.9 |
| Stones | The client's 200-stone census (199 in game). Notes follow the site's rule (frequency_hz, else the Mohs map); the repo's density frequencies are kept as driver_hz. Giving a stone away never removes its tone |
| Quests | The Welcome, The Unstrung Echo (proposed), The First Column (the Ragana's Lens), The Seed (story for a seed that grows into a companion), The Wolf and the Welcome (the Wolf's Whistle), The Hands That Remember, The Metal That Sings |
| Campgrounds | The first open sky. The Market Field's stalls, the Huntsman Tavern (Jay, Wisteria, the wolf, the brass bell, the map wall), Luna's tent-studio, the Blacksmith's forge (79/80/82 Hz, the hammer on the beat), the woods with the wolf's paths, the Traveler's Clearing and the Fortune Teller farthest from the Inn, the shore with Zeke's dock and tide chart and the lighthouse the Owl keeps |
| The Seven Sisters | The standing fire pit: six stones around the fire, the seventh on the axis. Each sister is a lithophone; all seven in one lit circle plays the ring's chord |
| Drum circles | Tap any surface with Space. No prompt, no score, no grid. A second tapper (a player, or Pluck, who always comes first) lights a circle; the tempo ring follows the hands and leans gently toward 50 BPM. Play someone's rhythm back to them and you both get a quiet recognition |
| Homestead | The outer ring of plots. Gather the seven materials at the heartbeat's pace, work them at the workbench or fire them at the forge, and build Lean-to, Cottage, Workshop Home, Estate, Ancestral Hall, with the building doc's own counts and the Ragana's verdicts. Name it; sit inside and it hums |
| Faire rental | The Faire Grounds signpost. One template, three layouts, four palettes. Owners set theirs up with a rental key; visitors walk any active faire year round |
| Market | Soulstice pieces on the stalls and stands, with the canon catalog (Aurora Pendant, Truth-Teller's Ring, Cat's Eye of Bastet, Bluestone Key). The phrasing law: the twin is "the one that travels", never a website. No links out unless the client turns them on |
| The Common Room | The client's live rules: 45 s by the fire before a new traveler speaks, no frogging in the first 2 minutes, 3 travelers transform someone into a frog until they leave, 3 transformations and the swamp claims them, the room heightened for 5 minutes. No admin, no reports, no mutes, no records. The fire speaks now and then |
| The voice of the Inn | Elio's lines at the moments the canon allows: the entrance, and "the fire was kept lit." after a day or more away. Silent in play, dialogue and the Common Room |
| The Final Room | Behind a small unlabeled door beside the main entrance, once it's been earned (never told how). Sit, Stand, Drink, nothing else. Preview it with `--final-room-preview` |
| Multiplayer | Dedicated or player-hosted server (ENet). Zone snapshots, chat, shared Song, frogs, taps, shared homestead plots, faire saves, rental import |
| Audio | Ported 1:1 from the site's audio engine: seven driver profiles, room drivers, Mohs map, 42 Hz root, 50 BPM heartbeat. Client's EQ curve on its own bus. Every sound is synthesized |
| Steam | Achievements and cloud saves through GodotSteam when it's installed and an App ID is set; safe no-ops otherwise |
| Saves | Local JSON (and Steam Cloud when on), with migration for older saves |
| Your look | A character creator from New story and the pause menu: body, clothes and their colour, skin, hair and its colour, hood, beard, with a turning preview. Everyone online sees the look you chose |
| Credits | Credits and licenses in the game (title screen and pause menu): the art's sources, the owl's CC-BY line, and Godot's license with every component it carries |

Art: since 0.3 the world uses free CC0 art (Quaternius, Poly Haven; one CC-BY
model, the barn owl). Every cast member is a dressed, animated person with
their own look; the wolf, the sleeping baby dragon and the owl are real models;
walls, floors, roofs and ground are textured; the zones are furnished and
planted. Details and how to swap in the client's own art: `docs/ART_PIPELINE.md`.
Licenses and credits: `CREDITS.md`. The client's concept portraits still show in
dialogue and above heads. Settings has "Lighter graphics" (fewer plants, no sun
shadows, 3D at 75%); it turns itself on for computers without a graphics card.

## Run it

```
godot --path .                                  # the game (Godot 4.7.2)
godot --path . -- --final-room-preview          # straight into the Final Room (own save)
godot --headless --path . res://tools/server.tscn -- --server --port 24770   # dedicated server
```

Controls: WASD / left stick move, right mouse drag / right stick look,
E / A use, C / Y sit, Space / X tap, G geode, J journal, T talk, Esc menu.

## Tests

```
powershell -File tools\run_tests.ps1      # 120 headless tests: data, canon rules, systems, quests, zones, gameplay, art, release
powershell -File tools\run_net_test.ps1   # dedicated server + 2 clients: presence, chat, Song, taps, plots, frogs, faire save
godot --headless --path . res://tools/check_scripts.tscn                   # every script parses
godot --path . --rendering-driver opengl3_angle res://tools/capture.tscn   # screenshots to test_output/shots (add -- 05_ 12_ to pick shots)
godot --path . --rendering-driver opengl3_angle res://tools/model_preview.tscn -- all   # the cast and creatures to test_output/models
godot --path . --rendering-driver opengl3_angle --write-movie test_output/audio/frame.png --fixed-fps 30 --quit-after 300 res://tools/audio_check.tscn
python tools/analyze_audio.py test_output/audio/frame.wav               # checks the recorded pitches
python -I tools/convert_client_data.py ../client-extract                # rebuilds stones, market and arcade data from the client's repo
```

`run_tests.ps1` fails on any engine/script error, not only failed checks.

## Build

```
godot --headless --path . --export-release "Windows Desktop" build/windows/GeodeInn.exe
godot --headless --path . --export-release "Linux Server" build/server/geode-inn-server.x86_64
build/windows/GeodeInn.exe -- --smoke-test   # walks every zone in the exported build, exit 0 = OK
```

The exported Windows build also runs as a server: `GeodeInn.exe --headless -- --server`.

## Where the client's pieces plug in

| Piece | Where | Notes |
|---|---|---|
| Stone list | `data/stones.json` | Built from the repo by `tools/convert_client_data.py`. The game uses frequency_hz first, exactly like the site |
| EQ curve | `data/eq_preset.json` | 10 bands (31 Hz to 16 kHz), gain in dB |
| In-game models | `Builder.model_or_box()`, `Builder.prop()` | Put .glb files under `assets/models/`, add a "model" path in data; the CC0 stand-ins are replaced without code changes |
| Character art | `data/characters.json` "portrait" | Wired for the concept images |
| Dialogue and quests | `data/dialogue.json`, `data/quests.json` | Plain JSON, conditions, actions and choices documented at the top of each file |
| Dissonant beings | `data/world.json` "beings" | name, zone, target_hz, companion. One proposed being for now |
| Seed companions | `data/world.json` "seed_companions" | Story shape to companion; placeholder names until the temperament table |
| Seven Sisters tones | `data/world.json` drum_circle.seven_sisters | Proposed C major from the Mohs map until the client picks the set |
| Steam | `data/platform.json` steam.app_id + GodotSteam GDExtension in `addons/godotsteam/` | Achievement API names are the keys in world.json "achievements" |
| Base44 | `data/platform.json` base44 | Two small backend functions, see `docs/BASE44_FUNCTIONS.md`. Never put a service token in the game |
| Faire rentals | `server_data/rentals.json` on the server | Rows `{ key, faire_id, active_until, owner }`, picked up every 30 s |
| Elio's nature files | `server_data/inncore/` on the server | Never in the game build |

More: `docs/SERVER.md` (with a one-command installer, `tools/server/`), `docs/STEAM.md` (Steamworks setup, achievements, upload script `tools/steam/`), `docs/BASE44_FUNCTIONS.md`, `docs/ART_PIPELINE.md`.

## Layout

```
data/        all game content as JSON
scripts/autoload/   EventBus, GameData, Settings, AudioDirector, PlayerState,
                    SongState, QuestManager, Services, Net, SceneRouter
scripts/systems/    pure rules: Harmonizer, Crafting (homestead), DrumCircle, BeatJudge,
                    Moderation (Common Room), FaireRegistry, InnCore, FinalRoomRules
scripts/world/      Builder (surfaces, props, fire, lanterns), CharacterModel, Creatures,
                    Player, Interactable, RemotePlayer
scripts/ui/         HUD, PulseLine, DialogueBox, VoiceOfTheInn and the panels
scripts/zones/      ZoneBase + Main Floor, Campgrounds, Faire, Final Room
tests/       headless tests and the multiplayer test client
tools/       test/build/capture/data scripts, art import and preview tools
assets/      CC0 characters, creatures, props, plants, textures, sky (CREDITS.md)
```

## Known limits

- The Staircase, the Music Room's hollow, the Whisper Layer and every zone past the Campgrounds are for later releases; the arcade cabinets stand but their games (the client's web games) aren't ported yet.
- Software-rendered screenshots only on the dev machine (no GPU); performance on real hardware not profiled yet.
- The art is free CC0 stand-in art in one consistent style; the client's own models replace it piece by piece (see docs/ART_PIPELINE.md).
- GodotSteam not bundled (needs the client's App ID and the GDExtension binaries); calls are wired and no-op without it.
- Console ports need Sony/Nintendo developer access and a Godot porting partner.
- A harmless "ObjectDB instances leaked at exit" warning prints after the test run (synthesized audio streams).
- Without a graphics card (Windows' software renderer) the dressed world runs at a few frames a second even with Lighter graphics; any machine with a GPU is the target.

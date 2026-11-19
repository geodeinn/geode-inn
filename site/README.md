# Site data: the game pages

What geodeinn.com needs for its game pages, one entry per arcade game (84 in `games.json`). The games themselves are being built in Unreal Engine; each page carries the game's pictures and storyline and links out to where the game lives.

| Field | What it holds |
|---|---|
| `key` | The game's id, the same as its folder in the Unreal project and its row in the ArcadeGames table |
| `title`, `tagline`, `zone`, `stoneReward` | For the page header |
| `retitleSuggested` | For a title that uses another company's name: the new title the manual suggests (Part 7, 1.23). Use it, or another, before the page goes live |
| `storyline` | The Steam title's storyline where there is one, otherwise the build sheet's narrative frame; sentences naming the commercial games the arcade is modeled on are left out, so it is safe for a public page |
| `images` | The game's own pictures: the client's canon pictures and sprite sheets whose file name holds the game's full title (paths in this repo) |
| `zoneImages` | Canon pictures of the game's zone (`docs/canon_images/zones/`), for a backdrop; they show the place, not the game |
| `templateArt` | The game's template sheets in `docs/canon_images/` (found November 5) |
| `location.unrealProject` | The game's folder in the Unreal project |
| `location.buildSheet` | The game's build sheet in this repo |
| `location.playUrl` | Where players go to play: filled in when each game has a build or a store page |
| `status` | Where the game stands |

Made by `make_project.py` in the Unreal project's `Tools/` folder; run it again after the data changes.

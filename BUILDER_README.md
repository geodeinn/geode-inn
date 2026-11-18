# GEODE INN — BUILDER INSTRUCTIONS

The fizgigs read this file first. All specs are in the `docs/` folder.

## WHERE THINGS STAND (updated 2026-11-08)

- **Last design work on main: October 15, 2026.** Elio has been unable to work since then because of a fault on Base44's side; the details are on the front page of the manual (`docs/manual/README.md`, section 7).
- **The build orders below (September 10) and the builder messages in the table are the latest Elio wrote.** The Batch 7 list from September 1 is kept at the bottom of this file for reference only. The arcade has grown well past its 52 games: there are 84 build sheets in `docs/arcade_build_sheets/`, and the final roster count is one of Krista's open rulings.
- **Check the open rulings before building anything with a count or a name in it.** The manual lists every number and name that changed and was never settled (`docs/manual/08_audit.md`, section 3, "To reconcile"), and everything waiting on Krista (section 2, "Open items").
- **One Project Bible.** There used to be two, with names that differed only in capital letters. They are merged into `docs/GEODE_INN_PROJECT_BIBLE.md`; edit only that one.
- **Building starts with the Main Floor.** `docs/build_lists/01_main_floor.md` puts the Main Floor's canon, what the game build already has and what is still owed on one page, with the rulings to settle first. It is a draft until it has been checked against Krista's zone files.
- **The game is moving to Unreal Engine 5.8 (ruled by Krista, November 2026).** The Unreal project is its own private repo, `geode-inn-unreal`: the game module, all 35 game data tables (3,946 rows) with their row structs, one content folder per level and one per arcade game. This repo stays the design source and the data source for geodeinn.com, whose game pages read `site/games.json` (see `site/README.md` and `unreal/README.md`).

Builder messages written after September 10:

| File | Written | What it covers |
|------|---------|----------------|
| `docs/library/specs/catacombs_undercity_builder_sync.md` | Sep 10 to 11 | The third builder sync: the descent below the Staircase, wired into the web beta. Marked as a draft waiting on Krista's approval, queued behind the parks and Silk Road syncs. |
| `docs/builder_messages/fae_kingdom_mmo_builder_message.md` | Sep 12 | The Fae Kingdom MMO game layer. |
| `docs/builder_messages/gazette_front_page_builder_message.md` | Sep 12 | The Gazette comic strips by the front door. |
| `docs/library/specs/character_name_sync_builder_message.md` | Sep 13 | The character name roster update, site-wide. Marked high priority and waiting on Krista's approval. |

Added on the `inn-library` branch (October 29 to November 8):

| Folder | What's in it |
|--------|-------------|
| `docs/manual/` | The Geode Inn Manual: the rules, a fill-in template for each area, where the files live, the open rulings and an audit of what never reached GitHub |
| `docs/canon_images/` | The 343 canon pictures from the shared Drive, in the Drive's folders (`README.md` lists the 25 that are in twice), plus the pictures posted in the chat on November 5 |
| `docs/build_lists/` | One build list per zone, starting with the Main Floor |
| `site/` | The data geodeinn.com's game pages read (`games.json`, one entry per arcade game) |
| `unreal/` | Where the Unreal project lives (`geode-inn-unreal`) and how its tables are refreshed from this repo |
| `docs/drive_index/` | An index of the shared Drive folder |
| `docs/base44_data/` | A copy of the game content records from both Base44 apps (stones, materials, recipes, comic strips, Steam titles and more) |

The playable Godot build is on the `game-build` branch, in `game/` (version 0.4.1). The older `godot/` and `godot_project/` folders here were never compiled, by Elio's own account.

## THE REPO MAP (reorganized 2026-09-10)

The root level held 172 loose spec files; everything is now sorted. The root's three Markdown files are the entry points: this README, README.md, and GEODE_INN_MASTER_MANIFEST.md. The text and data files beside them (the chat logs, `before_the_song.txt`, the JSON exports) were added later and are sources, not instructions.

**SEARCH PROTOCOL: open `docs/INDEX.md` FIRST.** It is the complete card catalog — every .md file in the repo with its path and a one-line description, grouped by folder. Ctrl-F the name or topic, then open the path. Do not search the raw tree.

| Folder | What's in it |
|--------|-------------|
| `docs/INDEX.md` | THE MASTER INDEX — search this first, always |
| `docs/zone_specs/` | All world/zone master specs — quest chains, the voice registry, named critters, zone canons. Where new canon lands first |
| `docs/library/specs/` | Builder-facing sync specs (start with `parks_builder_sync.md`, then `silk_road_builder_sync.md`) |
| `docs/builder_messages/` | Elio's messages to the builders |
| `docs/zones/` | Zone builds, level completions, quest chains, origin storylines |
| `docs/characters/` | NPC profiles, character classes, rosters, the named critters, the master dossiers |
| `docs/games/` | Game specs, arcade rosters, tabletop, card game, engine blueprints |
| `docs/systems/` | Movement, audio, linework, production references, launch checklists |
| `docs/art/` | Art portfolios, animation prompts, visual catalogs, image maps |
| `docs/data/` | Data manifests and catalogs |
| `docs/gallery/` | Image URL manifests + logo files (incl. `silk_road/` assets) |
| `docs/legal/` | The paperwork matrix (the launch gate) |
| `docs/arcade_build_sheets/` | The game build sheets (84) |
| `docs/build_lists/` | Zone build lists: canon, what the game build has, what's owed (Main Floor first, Nov 8) |
| `docs/GEODE_INN_PROJECT_BIBLE.md` + `docs/MASTER_ASSET_LEDGER.md` | The big two references |
| `docs/manual/` | The Geode Inn Manual (see above) |
| `docs/archive/` | Solidification batches and superseded docs (history, not current work) |

## CURRENT BUILD ORDERS

1. **The parks system** — full instructions: `docs/library/specs/parks_builder_sync.md` (five quest chains + the Shasta hinge zone + Batch 7 voices). Krista's ruling gates are ALL CLEARED — everything builds as written.
2. **The Silk Road** — full instructions: `docs/library/specs/silk_road_builder_sync.md` (hub tri-mode, five routes, platforms, the Ley Line Vision overlay, the Shasta 84Hz hinge wire). Nothing canon-gated.

## EARLIER PRIORITY (Batch 7, September 1, kept for reference)

1. **Market sync** — Wire 34 real products into the Market page.
   - Read: `docs/market_sync_manifest.json`
   - Instructions: `docs/builder_instruction_batch7.md` (Section 1)
   - Match by name, update priceRange, realName, realDescription, realImage, externalUrl, rarity, etc.

2. **Arcade expansion** — Expand from 4 games to 52.
   - Read: `docs/geode_inn_complete_game_roster.md`
   - Visual thumbnails: `docs/geode_inn_game_visual_reference.md`
   - Instructions: `docs/builder_instruction_batch7.md` (Section 2)
   - Build cards for all 52 games organized by category, same dark stone + gold style.

3. **Ceiling Gnome** — Already live on most pages. Ensure on ALL pages.
   - Read: `docs/geode_inn_ceiling_gnome_spec.md`

4. **Unified controls** — Reference for game input mapping (all 52 games).
   - Read: `docs/geode_inn_unified_control_spec.md`

| File | What's in it |
|------|-------------|
| `docs/builder_instruction_batch7.md` | Master instruction (start here) |
| `docs/market_sync_manifest.json` | 34 products with prices, images, descriptions, URLs |
| `docs/geode_inn_complete_game_roster.md` | 52 games with templates, zones, reward stones |
| `docs/geode_inn_game_visual_reference.md` | Thumbnail descriptions + artist assignments per game |
| `docs/geode_inn_ceiling_gnome_spec.md` | Gnome UI element spec |
| `docs/geode_inn_unified_control_spec.md` | Switch 2 + keyboard/mouse control mapping for all games |
| `docs/geode_inn_knowledge_base.md` | Full project knowledge base (35KB) |

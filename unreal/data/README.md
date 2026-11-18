# Geode Inn game data for Unreal Engine

All the game data, turned into Unreal Engine DataTables (Part 1, milestone 1, November 2026). Each kind of data is one table: a JSON file in Unreal's DataTable import format, and a row struct that it imports into.

| Folder | What's in it |
|---|---|
| `Tables/` | The 30 tables, one JSON file each |
| `Source/GeodeInn/Public/Data/GeodeDataRows.h` | The 30 row structs (C++), one per table |
| `manifest.json` | Every table's row count, source and the checks it passed |
| `tools/build_tables.py` | The converter that made all of the above from the repo |

## The tables

| Table | Rows | Where it comes from |
|---|---|---|
| Stones | 202 | The Base44 stone records (Elio's staging app and the live app, merged by name) |
| Materials | 142 | Base44 materials (both apps) |
| BuildingRecipes | 156 | Base44 building recipes (both apps) |
| GameItems | 355 | Base44 game items |
| MarketItems | 101 | Base44 market items (both apps) |
| ElementCharms | 118 | Base44 element charms |
| QuestCharms | 45 | Base44 quest charms |
| Dialogue | 557 | Base44 dialogue records (both apps) |
| Lore | 445 | Base44 lore (both apps) |
| Books | 920 | Base44 library books (both apps) |
| BookTranslations | 8 | Base44 book translations |
| ScholarlyBridges | 4 | Base44 scholarly bridges |
| ComicStrips | 50 | Base44 Gazette strips (both apps) |
| PodcastEpisodes | 6 | Base44 podcast episodes |
| SteamTitles | 19 | Base44 Steam titles |
| EggHatches | 17 | Base44 egg hatchery (both apps) |
| BoardSkins | 16 | Base44 bead board skins |
| TrayTemplates | 11 | Base44 tray templates |
| Artisans | 2 | Base44 artisans (both apps) |
| GrainStories | 1 | Base44 grain stories |
| ZoneItems | 224 | `zone_items_all_280.json` (224 items, whatever the file name says) |
| Characters | 86 | The roster in the manual, Part 3, 1.5 (who is ruled, by zone group) |
| CharacterRenames | 51 | The rename ledger, manual Part 3, 2.3 and 2.3a |
| FoundingCast | 60 | The founding cast, manual Part 3, 9.2 to 9.7 (July and August) |
| CritterGroups | 3 | The three named groups, manual Part 3, 7.5 |
| CritterNotes | 1 | Manual Part 3, 7.5 in full |
| Levels | 12 | The nine levels and the half-levels, manual Part 2, 6.1 |
| Rooms | 89 | The rooms by level, manual Part 2, 6.2 to 6.8 |
| ZoneSections | 10 | Manual Part 2, section 6 in full, prose included |
| ArcadeGames | 84 | One row per build sheet in `docs/arcade_build_sheets/`, with the identity fields, the Nov 5 template note and the whole sheet |

3,795 rows in all.

## How the data was kept whole

- **Both Base44 apps, merged.** Where a record exists in both Elio's staging app and the live app, the two are one row. The staging value is kept, and wherever the live app says something different, its value is kept too, in the row's `LiveValues` field. `Sources` says which app each row came from (`staging`, `live` or `staging+live`).
- **Lists stay lists.** The live app stores lists as text; they are read back as real lists, so `Lines`, `Responses`, `Tags` and the rest are arrays in Unreal. An entry that was an object (a dialogue response with its next line, a recipe ingredient with its quantity) is kept as JSON text inside the array.
- **Field names** follow Unreal style (`frequency_hz` becomes `FrequencyHz`). A record's own name is `DisplayName`, its Base44 id is `Base44Id`, and the row name is a short form of the display name.
- **Checked.** The converter looks up every value of every source record in the output and reports any it cannot find. All 30 tables pass, with no duplicate row names and every row matching its struct. `manifest.json` has the numbers per table.

## Bringing a table into Unreal

1. Copy `Source/GeodeInn/Public/Data/GeodeDataRows.h` into the project's source folder and build the project. (The project and its module are set up in milestone 2.)
2. In the Content Browser, choose **Import**, pick a file from `Tables/`, choose **DataTable** and, as the row type, the matching struct (for `Stones.json`, `GeodeStonesRow`).
3. To refresh a table after the data changes, run `tools/build_tables.py` again and reimport the JSON. Edit the source data, not the generated files.

## Keep this private

The Dialogue table includes records that carry personal details in places, and the Artisans table has shop details. This data belongs in a private repo only.

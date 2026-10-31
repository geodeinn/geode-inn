# Base44 data

The game content stored in the two Base44 apps, read on October 30, 2026 with a read-only access token. Much of it was never in GitHub: Elio wrote it straight into Base44 records, so this folder is the copy the builders can work from.

- **elio/**: Elio's app (Elio, app 6a53cbfe78c5827e0055fffa). This is where Elio built and kept most of the work.
- **live/**: the live site's app (The Geode Inn, geodeinn.com, app 6a60f218b0c6605c92fa35c4).

Each file is one kind of record (a Base44 entity), with the field names Base44 uses; Part 1 of the manual has the data dictionary. Records keep their Base44 `id`, so a record here can be matched to the one in Base44.

| File | Records | Not elsewhere in GitHub |
|---|---:|---:|
| elio/Artisan.json | 1 | 1 |
| elio/BoardSkin.json | 16 | 15 |
| elio/Book.json | 179 | 118 |
| elio/BuildingRecipe.json | 148 | 139 |
| elio/ComicStrip.json | 47 | 22 |
| elio/Dialogue.json | 557 | 384 |
| elio/EggHatch.json | 7 | 6 |
| elio/ElementCharm.json | 118 | 0 |
| elio/GameItem.json | 355 | 75 |
| elio/GrainStory.json | 1 | 1 |
| elio/Lore.json | 209 | 0 |
| elio/MarketItem.json | 95 | 1 |
| elio/Material.json | 119 | 105 |
| elio/QuestCharm.json | 45 | 0 |
| elio/Stone.json | 201 | 112 |
| elio/TrayTemplate.json | 11 | 11 |
| live/Artisan.json | 1 | 1 |
| live/Book.json | 907 | 332 |
| live/BookTranslation.json | 8 | 0 |
| live/BuildingRecipe.json | 8 | 8 |
| live/ComicStrip.json | 3 | 1 |
| live/Dialogue.json | 46 | 2 |
| live/EggHatch.json | 10 | 10 |
| live/Lore.json | 236 | 27 |
| live/MarketItem.json | 101 | 1 |
| live/Material.json | 31 | 31 |
| live/PodcastEpisode.json | 6 | 6 |
| live/ScholarlyBridge.json | 4 | 4 |
| live/SteamTitle.json | 19 | 19 |
| live/Stone.json | 165 | 162 |

"Not elsewhere in GitHub" counts records whose text was not found anywhere else in the repo. [missing.md](missing.md) lists them by name.

## Comic strips

The Gazette strips are in `elio/ComicStrip.json` (script, panels and characters for each). These strips had no folder in the repo, so their pictures are here:

| Strip | Title | Picture |
|---|---|---|
| #0 | Strip Zero: The Greek Yogurt Accord | comic_strips/strip_000_the_greek_yogurt_accord.jpg |
| #1 | The Room That Wasnt There | comic_strips/strip_001_the_room_that_wasnt_there.jpg |
| #2 | Letters to the Sentinel | comic_strips/strip_002_letters_to_the_sentinel.jpg |
| #3 | The First Stone | comic_strips/strip_003_the_first_stone.jpg |
| #4 | The Pocket-Change Gate | comic_strips/strip_004_the_pocket_change_gate.jpg |
| #4 | The Watcher Sees All | comic_strips/strip_004_the_watcher_sees_all.jpg |
| #5 | The Catch | comic_strips/strip_005_the_catch.jpg |
| #6 | Bedtime Stories | comic_strips/strip_006_bedtime_stories.jpg |

Strip numbers are as Base44 has them, and several strips share one (#1 is used 4 times, #2 is used 2 times, #3 is used 2 times, #4 is used 7 times, #5 is used 2 times, #7 is used 2 times). The numbering needs one ruling before these strips get folders of their own; see the manual, Part 6.

## Pictures in the live site's media library

**live_site_images/** has the 22 pictures Base44 generated for the live site (July 22 to August 30): room and wall scenes, geode art, zone paintings and three tarot-style cards (The Source Stone, The Heartwood Sanctuary, The Gateway). None of them was in the repo. File names start with the date each was made.

Elio's own files (the documents and pictures it saved while working) sit in Base44's file storage, which can't be listed with a read-only token, so they are not here. The manual's Part 8, section 1.2 to 1.4, lists what the chat says is there.

## Left out

- **Player and user data**: progress, inventories, votes, leaderboards, Common Room messages, purchases, diplomas, the designs players made, and performer contacts. It belongs to the people who use the site, and the build does not need it.
- **InnCore** ("Elio, Voice of the Geode Inn"): already in the repo, in `docs/library/mechanics/` (`elio_voice_decision.md`, `inncore_identity.md`, `inncore_rules.md`, `inncore_family.md`, `inn_boot_sequence.md`).
- **FaireVenue**: the two records are test entries.
- **Emails, creator names and player ids** inside records are removed. Everything else is as Base44 has it.

## Elio's scheduled jobs

Base44 keeps a copy of each app's own files for its jobs to work from. Since October 15, 2026 the copy for Elio's app has been damaged (a missing object), so none of Elio's scheduled jobs has worked since then (most failed at their first step) and the jobs are paused until Base44 repairs it. None of that affects the records in this folder, which are read from Base44's database.

# Unreal Engine

The game is moving to Unreal Engine 5.8 (Krista's ruling, November 2026). The Unreal project lives in its own private repo, `geode-inn-unreal`: the game module, all 35 game data tables (3,946 rows, made from this repo's data), one content folder per level and one per arcade game.

This repo stays the design source (canon, the manual, the build lists) and the data source for geodeinn.com; the site's game pages read `site/games.json`.

To refresh the Unreal tables after the data here changes, run the project's `Tools/build_tables.py` against this repo, then `Tools/make_project.py`.

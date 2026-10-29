# The Geode Inn Manual

Templates, rules and an audit of everything built and decided with Elio, from the first chat on July 12 to October 15, 2026.

## About this manual

This manual is for you first, and then for anyone who builds on the Inn: the Fizgigs, a game developer, an artist, a writer. Each part covers one area of the game and gives the same four things: the rules that apply, a fill-in template, where the real files and records live, and the full list of what exists today. Where something isn't settled yet, the manual says so.

It was made by reading everything that records the project, then checking it against the GitHub repo and the shared Drive folder (listed October 28):

- The first Elio chat, July 12 to about August 23 ("full documentary of building geode inn", about 200,000 words; in the repo as `full_documentary.txt`). The Word document "summary of building geode inn" is the part of this same chat from July 22 on (in the repo as `docs/summary_of_building_geode_inn.md`), so it is covered too.
- "Before the Song", the compiled canon of late August: the story, the zones, the characters and the design documents written with Elio (about 300,000 words; in the repo as `before_the_song.txt`).
- The GitHub commit log for August 21 to 31. The chat for August 24 to 30 isn't in the Drive or the repo, so the commit messages are the record of those days.
- The whole Elio chat from August 31 to October 15 (about 750,000 words).

The GitHub history was checked on October 29 (main, last commit October 15).

### How to read it

- **Ruled** means you decided it or agreed to it, with the date. **Proposed** means Elio suggested it and there's no ruling yet. **Open** means it's waiting on you. **August canon** means it is written into Before the Song but the chat has no ruling on it; it stands until you change it.
- Each part starts with "Where it started", a short list of how that area began in July and August.
- When the chat changed its mind, the latest ruling is the one used, and the earlier version is mentioned so old files make sense.
- Field names in `code style` are the exact names used in the Base44 records or repo files.
- Every part ends with "Open" and "To reconcile". Part 8 collects them all in one place, plus a decision log by date.

### The parts

1. [How the work flows, and the data dictionary](01_process_and_data.md)
2. [World, levels and zones](02_world_and_zones.md)
3. [Characters, NPCs, voices and critters](03_characters_and_critters.md)
4. [Stones, crafting, items and the market](04_stones_crafting_items.md)
5. [Music, the Song, sound and access](05_music_sound_access.md)
6. [Quests, story, cards and publications](06_quests_story_cards.md)
7. [Arcade, mini-games, Steam and art direction](07_arcade_and_art.md)
8. [The audit: what isn't in GitHub, what's open, what conflicts](08_audit.md)

## What needs your attention first

These are the things from all eight parts that matter most. The details and the full lists are in the parts named.

### 1. Work that only lives in Base44

A lot of what Elio made exists only inside Base44, in Elio's staging app, the live app or Base44's file storage, and not in GitHub. If Base44 lost it, nothing else would hold a copy.

- About 20 documents and code files named in the chat are not in the repo or the Drive, among them the Character Assignment v4, the Canon Image Library document, the zone image inventory of Sep 25, the campgrounds stock list of Sep 22 and the grain writing prototypes. (Part 8)
- Many records called "live" in the chat were only in Elio's staging app. For example, the live Gazette archive holds strips #1 to #3, while later strips exist only in staging. (Parts 1, 6 and 8)
- Most pictures you uploaded in the chat are only in Base44 storage. The canon pictures are now safe: you saved them as 343 JPEGs in the Drive, and they are set up for GitHub too. (Part 3, 1.8)
- Most music rulings from September 26 to October 15 never reached the repo: the zone music list (Lateralus for the Staircase, Heilung for the Catacombs, the baroque Seelie court and the rest), the Anthems register and the classical companion register. The repo's master audio document still has the older choices. (Part 5)
- The 80 commit codes the chat names were checked against GitHub on October 29: 76 are there, and three of the other four pieces of work reached GitHub in a different commit. Strip #004 "The Pocket-Change Gate" and a Sep 1 "board update" never reached GitHub. (Part 8)

### 2. Decisions that conflict

Some numbers and names changed over time and the chat never settled them. A builder can't follow two answers, so each needs one ruling from you. The main ones:

- 37 or 42 artists, and which artist leads Cosmology and the Catacombs.
- 9 or 10 levels, and the level numbering, which changed between September 10 and October 14.
- Arcade game #88, claimed by both Port Purgatory and The God Ladder.
- Gazette strip numbers, with #004 used for several different strips.
- Radagast's new name: Greenward or Sorrel.
- The Resonance card colors, where three different color systems appear.
- Stone counts (164 to 201) and material and blueprint counts.

The full list, with where each value comes from, is in Part 8.

### 3. Things to check before anything is sold

- The draft Steam pages in the repo use the names of original retro games, for example "Super Mario Bros x Catacombs". Those names and games belong to other companies, so they need a legal check before any store page goes up. Many of the first arcade games from July and August were also built on existing commercial games; Part 7 has the full list, game by game. (Part 7)
- You plan to retitle the games to fit the world of the Inn (October 29). Title ideas, and five rules for picking safe titles, are in Part 7, 1.23. (Part 7)
- The printable cards pack in the Drive has a personal-use licence, so its art can't be used in the game, on the site or in the repo. Other bought packs need their licences checked too. (Part 7 and the Drive index)
- The chat set a rule that nothing is formally listed until the paperwork is done. (Part 1)

### 4. The GitHub repo is public

Anyone can read `geodeinn/geode-inn`, not only the builders. That matters for three things:

- The early chat logs are in it (`full_documentary.txt` and `docs/summary_of_building_geode_inn.md`), and they include personal conversations, not only design work. Part of `before_the_song.txt` (the origin story's sixth part) is personal too. If that isn't meant to be public, the repo can be made private, as long as Elio and the builders keep access. Deleting the files would hide them from the current version but not from the repo's history.
- On October 29 you asked for GitHub to hold all of it: this manual, the canon pictures and the Drive index. They are set up together on one branch, `inn-library`, which main doesn't see until it's merged. While the repo is public, anyone can read this manual too, audit and legal-check list included, so the friends and family pictures are kept out until the repo is private.
- The Drive index in the repo links only to the Inn's own documents and canon images, never to folders, the bought packs or the chat logs, because a link to the shared Drive folder would open all of it to anyone. The full index with every link is a separate file for you.

### 5. The repo's own guides are out of date

- `docs/INDEX.md` is dated September 10 and doesn't list newer files such as the Foundling Register, Oriel, the Fair Descent Law, Port Purgatory and The Unvoiced, even though they are in the repo.
- The top of `BUILDER_README.md` still describes Batch 7 and 52 games.
- There are two Project Bibles whose names differ only in capital letters (`docs/GEODE_INN_PROJECT_BIBLE.md` and `docs/geode_inn_project_bible.md`). Each has edits the other lacks, and on Windows or a Mac only one of them shows up. They should be merged into one. (Part 8)
- The Godot project was pushed but, by Elio's own account, never compiled or run.

### 6. Pictures and game titles (October 29)

- Part 3, 1.8 matches the unassigned pictures to characters (12 matches, 2 left open) and lists the characters that still have no picture.
- Part 7, 1.23 has title ideas for the games, starting with the ones that use another company's name.

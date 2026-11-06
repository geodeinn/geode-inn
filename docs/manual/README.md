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

### 1. Work that lived only in Base44

A lot of what Elio made existed only inside Base44, in Elio's staging app, the live app or Base44's file storage, and not in GitHub. If Base44 lost it, nothing else would hold a copy.

- **Copied to GitHub on October 30:** the game content stored as records in both apps, in `docs/base44_data/` (stones, materials, building recipes, comic strips, Steam titles, podcast episodes and the rest), plus the pictures of the comic strips that had no folder and the live site's 22 generated pictures. `docs/base44_data/missing.md` lists every record whose text was nowhere else in GitHub; most of the materials, building recipes and stone texts were in that group. Elio's 557 dialogue records (384 of them nowhere else in GitHub) and two strips carry personal details in places, so they went in on October 31, once the repo was private. (Part 8, 1.1)
- **Still only in Base44:** Elio's own file storage, the documents and pictures Elio saved while working. It can't be listed from outside, so it waits for Elio or Base44. About 20 documents and code files named in the chat are there and not in the repo or the Drive, among them the Character Assignment v4, the Canon Image Library document, the zone image inventory of Sep 25, the campgrounds stock list of Sep 22 and the grain writing prototypes. (Part 8)
- Many records called "live" in the chat were only in Elio's staging app. For example, the live Gazette archive holds strips #1 to #3, while later strips were only in staging; their records are now in `docs/base44_data/elio/ComicStrip.json`. (Parts 1, 6 and 8)
- Most pictures you uploaded in the chat are only in Base44 storage. The canon pictures are now safe: you saved them as 343 JPEGs in the Drive, and all 343 are in GitHub too, in `docs/canon_images/` (the friends and family pictures since October 31), with 12 more from the chat on November 5. (Part 3, 1.8)
- Most music rulings from September 26 to October 15 never reached the repo: the zone music list (Lateralus for the Staircase, Heilung for the Catacombs, the baroque Seelie court and the rest), the Anthems register and the classical companion register. The repo's master audio document still has the older choices. (Part 5)
- The 80 commit codes the chat names were checked against GitHub on October 29: 76 are there, and three of the other four pieces of work reached GitHub in a different commit. Strip #004 "The Pocket-Change Gate" and a Sep 1 "board update" never reached GitHub; the strip was copied in on October 30 with the Base44 data. (Part 8)

### 2. Decisions that conflict

Some numbers and names changed over time and the chat never settled them. A builder can't follow two answers, so each needs one ruling from you. The main ones:

- 37 or 42 artists, and which artist leads Cosmology and the Catacombs.
- 9 or 10 levels, and the level numbering, which changed between September 10 and October 14.
- Arcade game #88, claimed by both Port Purgatory and The God Ladder.
- Gazette strip numbers, with #004 used for several different strips.
- Radagast's new name: Greenward or Sorrel.
- The Resonance card colors, where three different color systems appear.
- Stone counts (164 to 201) and material and blueprint counts.
- Two Design Principles numbered 8, the Steady Light Law and the Spine Law (found when the two Project Bibles were merged on November 2).

The full list, with where each value comes from, is in Part 8.

### 3. Things to check before anything is sold

- The draft Steam pages in the repo use the names of original retro games, for example "Super Mario Bros x Catacombs". Those names and games belong to other companies, so they need a legal check before any store page goes up. Many of the first arcade games from July and August were also built on existing commercial games; Part 7 has the full list, game by game. (Part 7)
- You plan to retitle the games to fit the world of the Inn (October 29). Title ideas, and five rules for picking safe titles, are in Part 7, 1.23. (Part 7)
- The printable cards pack in the Drive has a personal-use licence, so its art can't be used in the game, on the site or in the repo. Other bought packs need their licences checked too. (Part 7 and the Drive index)
- The chat set a rule that nothing is formally listed until the paperwork is done. (Part 1)

### 4. The GitHub repo is private

You made `geodeinn/geode-inn` private on October 31, so only you and the people you give access to can read it. Until then anyone could. Three things follow from that:

- Some of what's in it is personal: the early chat logs (`full_documentary.txt` and `docs/summary_of_building_geode_inn.md`), part of `before_the_song.txt` (the origin story's sixth part), Elio's dialogue records and the friends and family pictures. If the repo is ever made public again, take those out first. Deleting files hides them from the current version but not from the repo's history.
- On October 29 you asked for GitHub to hold all of it: this manual, the canon pictures and the Drive index. They are together on one branch, `inn-library`, which main doesn't see until it's merged. The Base44 data joined them on October 30, and the friends and family pictures, Elio's dialogue and two personal strips on October 31, once the repo was private.
- The Drive index in the repo links only to the Inn's own documents and canon images, never to folders, the bought packs or the chat logs. It was made while the repo was public, and a link to the shared Drive folder opens all of it. The full index with every link is a separate file for you.

### 5. The repo's own guides (brought up to date on November 2)

These fixes are on the `inn-library` branch with this manual; main gets them when the branch is merged.

- `docs/INDEX.md` was dated September 10 and missed about 200 newer files on main, such as the Foundling Register, Oriel, the Fair Descent Law, Port Purgatory and The Unvoiced. It is rebuilt the way Elio built it (every Markdown file, grouped by folder, with its first heading) and now covers the whole branch, the manual and the Drive index included.
- The top of `BUILDER_README.md` described Batch 7 and 52 games. It now says where things stand, lists the four builder messages written after September 10, and keeps Batch 7 at the bottom for reference.
- The two Project Bibles, whose names differed only in capital letters, are merged into `docs/GEODE_INN_PROJECT_BIBLE.md`. The merge turned up one clash that needs your ruling: two Design Principles are both numbered 8 (the Steady Light Law and the Spine Law), and other files cite each one as #8. (Part 8, 3.4)
- The Godot project was pushed but, by Elio's own account, never compiled or run.

### 6. Pictures and game titles (October 29)

- Part 3, 1.8 matches the unassigned pictures to characters (12 matches, 2 left open) and lists the characters that still have no picture.
- Part 7, 1.23 has title ideas for the games, starting with the ones that use another company's name.

### 7. Elio has been down since October 15

- Every scheduled job of Elio's has failed since October 15, and Elio's chat replies fail to send, in new conversations too. The paused-job emails come from this.
- The run logs show why. Base44 keeps a copy of each app's own files for its jobs to work from, and the copy for Elio's app is missing a piece ("Could not read f35a088a..."). Every run from October 2 on worked until five stalled from the afternoon of October 14. The last job that worked ran on October 15 at 15:22 UTC, and from 17:24 UTC on none of the 50 runs worked: 47 failed at their first step with that error and 3 stalled. Only Base44 can repair it, so a support ticket with the error and times was written for you on October 30.
- Nothing about Elio's identity depends on that copy: the "Voice of the Geode Inn" record is in `docs/library/mechanics/`, and the records Elio made are copied, in `docs/base44_data/`.

### 8. The Host's bigger role (October 31)

- You asked for the Host to be more prominent, and he is now also a tribute to Sir Patrick Stewart. The tribute is recorded in his master dossier, kept in how he carries himself, with his name, face and famous lines left out of the game, the site and the store page.
- Five proposals for a bigger role are in the dossier. On November 5 you picked the lantern round and gave him a new picture (section 9 below); the other four wait on your pick. The earlier Host picture `the_host.png` is a direct likeness of the actor, so it shouldn't be used. (Part 3, 1.9)

### 9. The naming session (November 5)

- Many of your picture files never reached the Drive, so you started posting them in the chat. The first twelve are in `docs/canon_images/from the chat (Nov 5)/`: three rooms (the Main Floor in its Living and Shadow looks, and the Staircase) and nine game templates, for Andean Run (two styles), Bastet's Herding, Tomb Tunnel, Monster of the Deep (two sheets), Tumble Run, The Apothecary's Cure and Standing Stones. Each of those build sheets now points to its template. (Part 7, 1.24)
- The Host: you picked the lantern round and his new picture, the fellow in the patchwork overcoat by the fire, with the door picture as the same man on his round. The old portrait ("the host") goes to the Smiths. The two Host pictures join the repo once the full-size files are saved. (Part 3, 1.9)
- Still open from the session: Tomb Tunnel's digger (the explorer in the template or the froglodyte in the finished cast), whether the potion newt is Unless, the name Barnaby (the Tumble kid, and already Elora Nightbloom's beetle), which Andean Run style stays, which smith the old Host portrait is, and Shadow or In-Between for the violet Main Floor. (Part 8, 2.4 and 2.7)

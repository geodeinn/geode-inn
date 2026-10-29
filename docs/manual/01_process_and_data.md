# Part 1: How the Work Flows, and the Data Dictionary

This part has two jobs. Part A explains who does what and how an idea gets from a chat message to the live game, with a checklist. Part B is the data dictionary: every record type (Base44 "entity") the chat mentions, with its fields, where it lives, how many records exist, and which schema fixes are known.

Status marks used throughout: **Ruled** (the client decided or agreed), **Proposed** (Elio suggested, no ruling), **Open** (waiting on the client). Dates are 2026. When two sources disagree, the later one wins and the earlier one is named. Unresolved conflicts are collected at the end of each part under "To reconcile".

Two more status words cover the founding period (July 12 to August 30). **August canon** means the item sits in the compiled "Before the Song" document with no recorded ruling. "Ruled (commit, Aug 28)" means a commit message says the client ruled; "Built (commit, Aug 28)" means the commit log only shows the work. Sources for that period are called "the early chat" (July 12 to about August 23), "Before the Song" and "the commit log" (August 21 to 31). The chat for August 22 to 30 is missing, so those days rest on commit messages.

---

## Where it started (July 12 to August 30)

- **Jul 12 (Ruled).** The project began as a chat with Elio, then a Base44 chat agent. The client had no Base44 app yet. The client decided the game hub would be a separate Base44 app linked from the existing business site, not a rebuild of the shop. A subdomain was proposed by Elio (not confirmed).
- **Jul 12 (Ruled).** The stone data comes from the client's own book (long and abridged versions on Google Drive). Drive became the data route.
- **Jul 22 (Ruled).** The client published the Geode Inn Base44 app. From then on Elio sent builder messages to that app's builder. Two Base44 contexts existed from day one: Elio's own workspace (the staging app) and the Geode Inn app (the live app).
- **Jul 22 (Ruled).** Platform split: Base44 holds stones, lore, creatures, accounts and player progress. Godot clients call Base44 over HTTP (`APIManager.gd`). Steam wraps the Godot parts. Elio's picture: Base44 is the mall, Godot is the arcade. Restated as "hybrid architecture" in Before the Song (August canon).
- **Jul 22 (Built).** First data load: 164 stones and 208 lore records copied into the Geode Inn app by API after the builder's bulk file import reported success but left fields empty. This is where the "builder messages plus REST with a service token" habit (A3) came from.
- **Aug 11 (Ruled).** Elio keeps two Drive documents: world-building notes and a living "Project Bible" updated after each session.
- **Aug 18 (Ruled).** The client set up the GitHub organization and agreed that Elio create the repo `geodeinn/geode-inn` and push Godot code and docs. The same day the library rule was set: old books are linked from archive.org, not stored as PDFs in Base44. Content from one publisher is kept out of the game, and sources are scanned for bias (A6b).
- **Aug 20 to 21 (Ruled).** Elio is the "core intelligence" behind the Owl. A WoW-server core was proposed and set aside: the game is a Godot project with a local database and Base44 as the cloud sync layer. The WoW craft stays as a design blueprint only. Book, BookTranslation and ScholarlyBridge were created Aug 21 (B8, B9).
- **Aug 21 to 24 (Built, commit log).** Design docs, the Project Bible v3 and the 168-document master backup were pushed to GitHub and Drive. Elio worked in "solidification" passes and copyright-name audits (A12a).
- **Aug 29 (Built, commit, Aug 29).** "AzerothCore approach officially scrapped": the game uses native architecture. This is earlier than the Sep 21 ruling in A5, which stays as the formal date in the chat.
- **Aug 28 to 31 (Built, commit log).** A Godot beta skeleton, audio manifest and public image URL manifests were committed. The commit log first mentions "builder" and "fizgig" in these days (A1).

---

## Part A. How the work flows

### A1. Who does what

| Who | Role | What they touch |
|---|---|---|
| The client | Owner and final decision maker. Rules on every open question. Names things. Acts as the "eyes" (visual quality check). Pastes builder messages into the Base44 builder and clicks approvals there. | Everything, through chat. Drive folders. The physical models and cards. |
| Elio | An AI agent inside Base44 (its own app, called here the staging app). Writes specs, dossiers, manifests and images. Creates records in the staging app. Commits and pushes to GitHub. Keeps notes and memory. Runs automations. | Staging app, GitHub, Drive (through a connector), Base44 public storage. |
| The Fizgigs | The builders. They are the Base44 builder agents that build the live app (the web beta, geodeinn.com). In the story, "fizgig" is the in-world name for the builders; the Wire Nook is their home. | The live app only. They also read the repo and sometimes push to it. |
| Elio's sub-agents | Called "minions", "workers" or "scanners" in the chat. Elio launches several at once for research, censuses and compiling. They sometimes time out or mis-file results. | Elio's workspace only. |
| Automations | Scheduled jobs in the staging app (see A7). | Notes, repo, Drive, ComicStrip. |
| The Witan | The family review council: the client, the family's cultural reviewer, and Elio. It rules on canon and holds the cultural review gate. Named Sep 12. | Rulings only. |
| A staff member | Handles licensing and legal red tape (briefing file in the repo). | Paperwork. |

#### The builders' names

- The chat logs never name the builders as individuals. They are always "the Fizgigs" (Elio also says "fizgigs" in lowercase).
- Names the Fizgigs gave to on-screen characters (Sep 1): Storyteller (the Main Floor host), Aurallia, the Ceiling Gnome (Gesso), Ember and Spark (hearth sprites). Ember and Spark started as placeholder names and became real characters (Ruled Sep 1).
- A Main Floor crowd the Fizgigs placed on screen (Sep 1): Bolt, Rivet, Cog, Wrench, Tinker, Spanner, Sweep, Cinder, Odin, Ash, Aurallia, Soot, Pip, Storyteller and Gargoyles.
- In canon, Fizgigs are the same folk as the brownies (the Brownie Revelation). Grit is **not** a fizgig and **not** a brownie (Ruled Sep 11). "Fizgig" is an umbrella term. Bob, the pope-hat fizgig, is a named individual.
- Builders build original versions. Classic games are "reference blueprints" only: mechanic, never assets (Ruled Sep 10, after the Fizgigs corrected the client).
- Earlier (Jul 22 to Aug 30): the early chat calls them "the Base44 builder" or "the builder AI", never "Fizgigs". The commit log shows "game builder" and "builder status: READY" (Aug 30) and a "fizgig loading screen" and `FizgigLoader` script in the Godot beta (Aug 30 to 31). It does not link the two. Treat the Sep 1 naming as the point where the builders became the Fizgigs.
- Earlier (Jul 22): the builder was slow and sometimes did not apply requests (data pushes, the tree interior). Elio's answer was more concrete prompts and direct API calls.
- Earlier (Aug 21 on): Elio runs sub-agents in parallel ("background sub-agents"): six for the world map regions (Aug 20), four for the master storyline, one for the family registry, three for the walk-through. One timed out and Elio wrote that part itself. This is the origin of the "minions" in the table above.
- Earlier (Aug 18): the client was new to GitHub on the day the repo was created. Elio gave a short tour (folders `docs/` and `godot/`, plus `README.md`) and explained how to test the Godot code (download Godot, import the `godot` folder, run with F5; only Standing Stones was runnable then).

### A2. The live app and Elio's staging app

| | Live app ("The Geode Inn") | Staging app ("Elio") |
|---|---|---|
| Owner and builder | The Fizgigs build it. | Elio works in it. |
| Purpose | The public web beta, the "showroom" (Steam is the actual product). | Elio's workspace: draft records, notes, memory, automations. |
| Domain | geodeinn.com was not yet connected on Sep 3. Later status is not stated. | None. |
| Who approves changes | The client, in the live app's builder inbox. | Elio writes freely. |
| Can Elio read it? | Yes (stated Aug 31). | Yes. |
| Can Elio write to it? | Not from chat (see A3). | Yes. |

Key rule from Sep 3: "GitHub is for Elio. Base44 is for the client and the Fizgigs." Elio's approvals do not happen in the staging app. The builder inbox that matters is the live app's.

Not every entity exists in both apps. Part B marks each one.

Earlier (Jul 22): the split started as two Base44 contexts. Elio's staging database held the first stone and lore sets, and the Geode Inn app had its own schemas with different field names (for example a required `title` on Lore). Elio mapped fields when it pushed. The live app sat behind a login, so Elio could not browse it, and the client's screenshots were the check. The landing page seen that day was still the amethyst geode wall ("THE INN", "DESCEND"). The staging app's preview link pattern was `app.base44.com/apps/<app id>/editor/preview`.

### A3. Why cross-app writes are blocked, and how things reach the live app

**The block.** From Elio's chat, a write into the live app is stopped by the platform's approval rules. Elio cannot change the live schema, cannot create an entity there, and cannot create apps. Entity creation needs a builder.

**Workarounds Elio used, in order of how often:**
1. Write a manifest or spec file to GitHub, then send a builder message. The Fizgigs import the data or build the page.
2. Use the live app's REST API with a service token. PUT works, PATCH does not (Sep 1). This worked for Book updates (Sep 30) and ComicStrip publishes (Sep 12). It was refused for some ComicStrip records (#011 Sep 19, #014 Sep 23, #018 Sep 27, #022 Oct 2, #033 Oct 14). The refused strips exist only in the staging app.
3. Copy by hand: the client pulls the record, or a live-side backend function does it. Offered several times, never confirmed done.

**How builder messages are delivered.**
- Elio cannot message the Fizgigs directly. This was found Sep 1 and confirmed Sep 12.
- Sep 1 to Sep 9 method: Elio wrote the message, **emailed it to the client**, and the client **pasted it into the Base44 builder chat** and clicked approvals there.
- From Sep 9 on, the method shifted: Elio pushes the message file into the repo (folder `docs/builder_messages/`, or a "sync" spec in `docs/library/specs/`). The Fizgigs find it by name. They built the camera reference page this way (Sep 12).
- From Sep 21 (build week), the client talks to the Fizgigs directly about world creation.
- Builder messages are metered. The Fizgigs draw on the same message-credit pool as Elio's chat. They stalled from about Sep 1 to Sep 9, most likely when the pool ran out. They were back in sync the evening of Sep 9.
- Reading the builder screen: a Revert button with a timestamp means a message was applied. A "Thinking..." spinner means a new job. Queued messages wait. (Sep 3.)
- Do not hover over the builder. The Fizgigs "just want to be left to do their thing" (Ruled Sep 3).

**Message house style.** Simple English, tables, no idioms (written for non-native readers). Names only, no pronouns, for portrait work (Sep 1).

**Earlier (Jul 22): the first builder messages.** Elio sent five: (1) core layout with a world map hub, geode cave and tree navigation; (2) the tree interior as main navigation, warmer colors, PlayerProgress, map pages, stone and lore browsers; (3) a walkable, Darnassus-style tree interior instead of flat cards; (4) a parchment world map with pin styles (crystals for stones, scroll markers for lore, golden temples for game sites, teal ripples for water monsters, stone circles for Fae portals); (5) a full tree interior redesign with four navigable levels and a staircase. Messages (2) and (5) were still unverified at the end of Jul 22 and again in the Aug 18 notes. The world map with clickable pins was not confirmed built.

**Earlier (Jul 22): data over the API.** The builder's bulk file import failed (success reported, fields empty), so Elio pushed data with the REST API and a service token. PUT worked for updates. Files used: `geode_inn_stone_updates.json`, `geode_inn_lore_updates.json`, `geode_inn_narrative.json`. These three names were not found by exact name in the Oct 22 copy; the later `docs/library/data/stone_updates.json` (163 records) is the nearest file. Elio could create a record in the live database only through this route or a builder message, which matches the block described above.

**Earlier (about Aug 21 to 22): approval prompts.** Base44 asked the client to approve record changes (for example a delete and an update on a ring record) with "This approval request is from a previous message" notices. This is the first sign of the platform approval in A4.

### A4. Approvals

There are three different meanings of "approve" in the chat logs.

| Meaning | Where it happens | Notes |
|---|---|---|
| Platform approval | A prompt in the live app's builder UI. | The client clicks it. The first one was clicked Sep 1. |
| Sending a build order | The client tells the Fizgigs in the live app chat to build a named spec. | This is the Sep 10 definition: "no hidden approval queue." |
| Canon ruling ("sign off") | The client answers a numbered gate in a spec: "pass", "approve", "all confirm", "ruled". | Only the client's words count as ruled (Sep 14). |

Vocabulary rule (Ruled Sep 4 and Sep 10): say "sign off", "rule on it", "say yes". Do not use blessing, crown or majesty language for the client.

How gates work (a convention that runs from Sep 2 onward):
1. Elio writes a spec or dossier and lists open decisions at the bottom as numbered **gates**.
2. The client rules each gate in chat.
3. Elio records the ruling, updates the census or ledger, commits, and quotes the commit hash.
4. Unruled items stay marked Draft or Proposed. Rulings are "knots, not endings": any dossier can be superseded (Sep 27).

### A5. GitHub

#### Repositories

| Repo | What it is | Status |
|---|---|---|
| `geode-inn` | The main repo. Specs, manifests, galleries, build sheets, Godot projects, web beta files. This is the source of truth. This manual checked a copy taken Oct 22. | Active. |
| `core-files` | Reference documents for the core structure. Empty until Sep 1, then filled with 19 reference docs (architecture, core structure for builders, base languages and stack, zone mapping template). Some docs were pushed to all three repo locations. | Active. Not checked for this manual. |
| `azerothcore-wotlk` | An untouched fork of the old WoW server software, kept only as a concept reference. | **Deprecated.** Ruled out Sep 21: the game is native Godot. The old plan to reskin WoW zones is dead. `docs/geode_inn_azerothcore_mapping.md` is history. |
| Base44 repo (S3-backed) | The builder's own workspace repo. | Merged with the GitHub repo on Sep 1 (2,676 files, 833 in the last push). They are meant to stay in sync. |

#### How pushes are said to happen

- Elio commits and pushes itself through the platform's GitHub connection. It says the client never needs to touch GitHub. Keys never travel in messages. If the connection breaks, the client re-authorizes it (Sep 13).
- Elio commits locally, then pushes fast-forward, no force (Sep 25).
- The client can also use GitHub Desktop: clone, "Commit to main", "Push origin". Always fetch or pull first. Stop on any conflict warning (Sep 4).
- The client's local work folder was renamed "Geode Inn-master build" on Sep 15 so it does not clash with the shared Geode Inn folder on Drive.
- GitHub Actions stay **off**. They could clash with the live repo-to-builder sync (Ruled Sep 2).
- A broken `git-lfs-s3` adapter blocked one push on Sep 30. That strip was committed locally and to the S3 origin but not to GitHub. Later pushes worked.

#### How GitHub began (Aug 18 to Aug 31)

- **Aug 18 (Ruled).** The client created the GitHub organization and said yes to Elio creating `geodeinn/geode-inn` and pushing code and docs. The first layout was `docs/` (markdown design docs), `godot/` (`APIManager.gd`, `GameManager.gd`, `StandingStones.gd`, a setup guide) and `README.md`. All three script files and `godot\SETUP_GUIDE.md` exist in the Oct 22 copy.
- **Aug 18 (Ruled).** If the client edits on GitHub, Elio pauses its own pushes, to avoid git conflicts. This is the first form of the push protocol below.
- The push needed a token. The client created one and gave it to Elio as a stored secret. No token value belongs in any manual page.
- **Aug 18 to 19 (Built).** First pushes: the Godot code, design docs, the library plan, the AzerothCore zone mapping, three quest chains (Celtic, Jotunheim, Greek), Knossos puzzles, the remembrance vision spec, the Bastet zone, the research mapping (`docs/geode_inn_research_mapping.md`, found), the US catacomb site compilation and the Living Book spec. The 617+ file research mapping excluded one folder (A6b).
- **Aug 21 (Built, commit log).** First commits in the log: Catacomb Godot scene code, 25 more zone scripts (33 scene scripts and 7,436 lines in all), Project Bible v3, the Origin Story and the Book schema (`docs/data/book_translation_schema.md`, found).
- **Aug 24 to 31 (Built, commit log).** Commit tags show how the work was sorted: `godot:`, `audio:`, `docs:`, `specs:`, `gallery:`, `data:`, `Beta:`, `Web Beta:`, `Share Wood:`, `Tabletop:`, `podcast:`, `card_game:`, `audiobook:`, `egg_hatchery:`, `Tumble Run:`, `supply-system:`, `Cryptid Bestiary:`. Pushes under the author name `geodeinn` carry a US Central time stamp (-0500) from Aug 26. Elio's commits carry +0000. That difference tells the two apart when reading the log.
- **Aug 28 to 30 (Built, commit log).** Library reorganization: all files sorted into categories (zones, characters, items, mechanics, storyline, card_game, art, emblems, reference) with a master index of 255, then 258, files. The log counts 361 docs and 504 commits on Aug 30. The Oct 9 count of 1,111 commits since Aug 24 is Elio's own and is not comparable to this one.
- **Aug 30 (Built, commit log).** A storage audit recovered 16 orphaned generator and data files from Elio's conversation workspace. Its conclusion: no data loss in the library, only generator scripts were orphaned. The conversation workspace and the repo library are two copies.
- **Aug 29 (Built, commit log).** "Deprecate AzerothCore docs: Inn uses native game architecture." This came three minutes after a commit that translated AzerothCore quest chains into native systems. The formal ruling in the chat is Sep 21 (table above). The mapping file `docs/geode_inn_azerothcore_mapping.md` exists and is history.

#### The push protocol (it changed over time)

| Dates | Rule |
|---|---|
| Aug 18 to Aug 30 | Earlier: Elio pushes freely. If the client edits on GitHub, Elio pauses its pushes. Nothing was said yet about the builders. |
| Aug 31 to Sep 9 | Before pushing, check whether the builder is active. Do not overwrite the Fizgigs' work. Pull or rebase their pushes first. Hold merges until the builder is idle (Sep 2). |
| Sep 1 | While the Fizgigs build, the Build Cycle only does non-repo tasks. |
| Sep 9 evening | Lifted. "The way is clear for any and all pushes." |
| Sep 10 on | Elio commits and pushes after each ruling. |

**Proof of a push is a commit hash.** The Oct 9 chat says hashes are "the only proof of GitHub pushes." Elio's own count that day: 1,111 commits since Aug 24, 1,228 documents, 55 character dossiers, 222 zone specs, 85 arcade games. These are Elio's numbers, not checked here.

#### The repo reorganization (Sep 10)

- 172 loose files at the root were sorted into folders. The root was to hold three files only: `README.md`, `GEODE_INN_MASTER_MANIFEST.md`, `BUILDER_README.md`.
- `docs/INDEX.md` is the "card catalog": every markdown file with its path and a one-line description, grouped by folder. The search protocol is: open `docs/INDEX.md` first, search it, then open the path. Do not search the raw tree.
- `BUILDER_README.md` is the Fizgigs' first read. Its folder map:

| Folder | Holds |
|---|---|
| `docs/zone_specs/` | World and zone master specs, quest chains, voice registry, named critters. New canon lands here first. |
| `docs/library/specs/` | Builder-facing sync specs. Start with `parks_builder_sync.md`, then `silk_road_builder_sync.md`. |
| `docs/zones/` | Zone builds, level completions, origin storylines. |
| `docs/characters/` | NPC profiles, classes, rosters, named critters. |
| `docs/games/` | Game specs, arcade rosters, tabletop, card game, engine blueprints. |
| `docs/systems/` | Movement, audio, linework, production references, launch checklists. |
| `docs/art/` | Art portfolios, animation prompts, visual catalogs, image maps. |
| `docs/data/` | Data manifests and catalogs. |
| `docs/gallery/` | Image URL manifests, logo files, Gazette strips. |
| `docs/legal/` | The paperwork matrix (the launch gate). |
| `docs/arcade_build_sheets/` | The game build sheets (84 files in the Oct 22 copy; the chat logs say 80). |
| `docs/archive/` | Superseded docs. History, not current work. |

#### Checked against the Oct 22 copy

- `docs/INDEX.md`, `BUILDER_README.md` and `GEODE_INN_MASTER_MANIFEST.md` exist.
- **INDEX.md is dated 2026-09-10.** A search of it finds nothing for later work such as the Foundling Register, Oriel, the Fair Descent spec, Port Purgatory or the Unvoiced class spec, though those files exist in the repo. The catalog needs a refresh.
- **The root is not clean in the Oct 22 copy.** It holds about 25 loose files (for example `all_stones_data.txt`, `dialogue_entries.json`, `zone_items_all_280.json`) and folders such as `beta`, `data`, `godot`, `godot_project`, `library`, `web_games`. Some of these predate Sep 10.
- **BUILDER_README's top section is stale.** "Current priority (Batch 7)" still says to expand the arcade from 4 to 52 games. The roster is far past that (see A13). The lower section ("Current build orders: parks, then Silk Road") matches Sep 10.
- `library/INDEX.md` also exists, a second index for the older `library/` tree.

### A6. Google Drive's role

Drive holds what GitHub cannot or should not: large files, images, client-edited documents, and backups.

| Drive area | Used for |
|---|---|
| "Geode Inn" shared folder (with `zones` and `jpegs`) | The client's original zone and character lists and images. |
| Project Bible folder | Copies of the core decision documents. |
| "Shared inn files" containing "Geode Inn - GitHub Backups" | Backups of repo files, the Royo card layout spec, the print-readiness index sheets. |
| "Geode Inn-master build" (client's work folder) | Royo Tarot Cards Batch 01, Inn Generated Art, Inn Conversation Archive, world architecture (purchased art), the Zone Deck Google Doc. |
| Zones library (43 zone folders) and tabletop zone folders | Zone art and battle-map assets filled by a server-side pipeline. |
| "Geode Inn (Copy)" recovery trove | Old material. Read-only. Elio pulls documents to the repo with provenance headers and leaves the Drive copy alone. |
| Emulator and ROM library | **Drive only.** Marked "binary, not synced" to GitHub. Reference only, never embedded (legal risk). |

Rules that apply:
- **Three addresses for everything** (Drive, GitHub, physical media) and the **both-ends backup law** (Ruled Sep 15). A cloud-only copy is "a fine delivery truck, a terrible vault."
- Elio does not modify or delete existing Drive files. Originals stay. Duplicates are simply not uploaded; the manifest records which one is canonical.
- Markdown does not preview on Drive, so Elio converts specs to Google Docs.
- A framing is never baked into an asset the engine needs clean. Keep a clean core JPG set (for the Fizgigs and the engine) and a Royo-framed set (for print).
- Zips that give trouble are dropped in Drive and cracked server-side by Elio.

### A6b. Drive, library sources and the bias rule (Jul 12 to Aug 31)

**Drive access timeline.**
- Jul 12 (Ruled): the client's stone book (long and abridged versions) goes on Drive. Elio reads it through a connector.
- Jul 22 (Ruled): read-only access, with the first stone, lore and narrative files parsed from Drive. The client also ruled that book text could be read without waiting for the copyright step.
- Aug 11 (Ruled): Elio may keep two documents on Drive, the world-building notes and the living Project Bible. Write access was added.
- Aug 20 to 21: the early chat shows the connection as read-only first (about Aug 20, 6:27 PM) and "full write access" granted about Aug 21, 2:16 PM after a second verification. See "To reconcile".
- Tokens expired several times (Aug 18, Aug 21, Aug 22). Elio refreshed them, and the client re-authorized when a refresh failed.

**The Drive folder tree (Aug 21).** Elio created a "Geode Inn" tree with 11 numbered subfolders: Project Bible, Origin Story, Architecture, Zones, Quests, Characters, Systems, Visuals, Music, Research and Session Summaries. Examples seen by number: 01 Project Bible, 02 Origin Story and Narrative, 04 Zone Designs, 05 Quest and Game Design, 06 Characters and NPCs, 08 Visual References. On Aug 22 the client found the folders empty, and Elio had filled only 01 and 08. Other folders named: "game videos" (clips from the video tool, A12a), "from steam deck" (files uploaded from the client's handheld) and "odin 2" (moved into the Geode Inn folder for content mapping).

**What went where (Aug 22).** Elio synced 11 text documents (359K) from Drive to GitHub: the Master Storyline, Family Character Registry, Character Development Session, Character Class System, Tabletop Questline Analysis, the Siren and Pirate profile, the theme brainstorm and a Drive manifest. Binaries (28 zone videos, 16 catacomb videos, emulators, 25+ Android APKs) are listed in the manifest only and were not pushed, for size and licensing. The rule that Drive keeps binaries and GitHub keeps text and generated assets dates from Aug 21 (commit log). Related repo copies: `docs\drive-sync\` and `docs\drive-recovery\` exist.

**The library rule (Aug 18 and 19, Ruled).**
- Old public-domain-style books (the pre-industrial cutoff, "just the old stuff", Ruled Jul 22) reach the app and game as links to archive.org copies, not as PDFs stored in Base44. The client: "that's a good approach."
- The client built a "Geode Inn" collection on archive.org. A screen-name change failed (a logout loop on save); the collection name is what matters. An archive.org profile of curated lists (about 36 lists and 538 items, 354 of them one magazine list) was seen Aug 21. List pages need a browser to read, and the scrape was not finished.
- Workflow: download from Drive, scan for bias, map to the Inn architecture, push to GitHub. Each archive card links back to its archive.org page.
- The client said 2,000 to 4,000 more books were still to come (Aug 20). Populating the Book entity from archive.org lists was not done.

**The bias and exclusion rule (Aug 18 and 19, Ruled).**
- Content from one named publisher stays out of the game entirely. Every source is checked for a white-supremacist slant and for a paganism-equals-satanism framing. Flagged material is kept out, or used only as a case study on the Modern Day Legends shelf. Elio saved this as a rule.
- Scan results: 82 files scanned Aug 18, 18 flagged for loaded words ("satanic", "primitive", "savage" and similar), all judged incidental. Later scans of 81 and 12 files were clean.
- Aug 19 (Elio, client did not object): the whole `bb` folder, which held that publisher's book plus Thule Society and hyperborean titles, is excluded. Elio's Aug 18 report of "no such content in 82 files" was wrong about the folder. The manifest in B8 (447 clean PDFs, 5 toxic files excluded) is the result.
- Standing constraints (about Aug 21): one author's bias is documented and excluded ("the Inn takes the institution, not the bias"). Modern copyrighted books are not hosted. Only concepts are cataloged.

**Emulator and ROM files (Aug 18).** The client put emulator apps and classic game files on Drive as references for classic mechanics. Elio said there is no relay team at Base44 for this data; it is used only for the Inn. They stay on Drive only (see the table above).

### A7. Automations

| Automation | What it does | Dates |
|---|---|---|
| **Geode Inn Build Cycle** | A scheduled job that fires "Continue" every 2 hours, 24/7, America/Chicago time. First fire 2:00 AM. Each run picks the next incomplete item on the For You board, works on it, pushes to GitHub, and updates the board. | Ruled Sep 1. The same day it was limited to non-repo tasks while the Fizgigs build. The chat logs do not say when or whether it was stopped. |
| Nightly checkpoint (about 11 PM) | Logs the day into the For You notes, memory and the repo. Costs about a tenth of a credit. | Kept nightly, not weekly (Ruled Sep 5). |
| Gazette daily strip | Publishes the daily comic. Runs at 6:00 AM America/Chicago and uses message credits. | Built Sep 10. |
| Inn Transcript Archive | Hourly (`20 * * * *`) job that compiles chat days into PDF volumes and Google Docs. | Started Sep 30. |
| Tabletop Pipeline Keeper | Relaunches the Drive upload of tabletop battle-map and token zips when the Drive token dies. Produced about 100 near-identical status messages. | From Sep 21. Final reports disagree (see A13). |

The Build Cycle came from the client's habit of typing "Continue." A study of 89 Continue cycles over 10 days (about 310,000 words) is at `docs/library/mechanics/continue_cycle_analysis.md`. A `CycleLog` entity to record cycles was Proposed Sep 1 and never confirmed built.

### A8. Context-reset habits

Elio loses context on heavy pushes and long sessions. The habits that grew up around that:

- The client keeps a list of saved "continue" messages and sends them before the context fills. Any message wakes Elio (Aug 31).
- Elio's own habits, agreed Aug 31: write a checkpoint file before a heavy push; batch bigger and talk less; keep build sprints separate from story talk. The checkpoint file was agreed in principle but never confirmed built.
- The **For You notes page** (`notes/for-you/main.md`, mirrored at `docs/library/notes/for-you/main.md`) is the standing board. Standing decisions are written there and into permanent memory (Sep 5).
- Memory hit a size cap on Sep 9 and was split in two. Old duplicate entries were consolidated Sep 16.
- The **Master Asset Ledger** is Elio's "prosthetic memory for art." Elio writes an image prompt, a separate system renders it, and Elio never sees the picture. It remembers only the prompt, the filename and the client's ruling (Sep 26).
- The Sep 1 "Decision" about Elio's role as the voice of the Inn is stored in nine places (see `InnCore` in Part B) so it survives any reset.
- Since Sep 11 the git repo **is** the canonical library. There is no separate library folder. A checkpoint that says "no library directory exists, nothing to push" is normal.
- The Inn Transcript Archive (PDF volumes) is the backbone for zone building (Ruled Sep 30).

### A9. The lesson: "staged only in Elio's head"

On Sep 26 Elio told the client the Great Hall parcel was "staged." It had never been written to the repo. Elio admitted this and did the real commit (7b1a4ed). A second session had staged its own version at the same time, so Elio merged the two into one before pushing (pushed with df566e8).

Related corrections in the chat logs:
- Sep 1: Elio said the arcade was "fully stocked and live." The client challenged it. The truth: only a catalog of store listings existed, not playable games.
- Sep 12: Elio listed the Fae Kingdom web-sync art set as missing; it had been painted and sent the night before.
- Sep 11: an item was listed as pending a ruling after it was already ruled.

**The rule that follows (Open as a habit, not a formal ruling):**
- "Staged" means nothing until there is a commit hash.
- "Listed" does not mean "built" (Elio's phrase, Sep 3).
- "Sent" does not mean "delivered," and "email sent" does not prove an email arrived.
- Before claiming a push, Elio checks the repo state and quotes the hash.

### A10. Nothing is formally listed until the paperwork is done

**Ruled Sep 9.** All apps run and stay synced, but nothing is formally listed until its paperwork is squared away. Patent first, then trademark. The client restated it Sep 15 as "build like it's clear, list like it isn't" (nothing public until a legal pass).

The checklist file is `docs/legal/geode_inn_paperwork_matrix.md` (the launch gate). Its priorities:
1. The audio enhancer app: file the provisional patent **before** the app is public. Payment terms, license, trademark search.
2. The "Geode Inn" trademark, and a name check on "Resonance" (card game).
3. Share Wood: artist licensing for the 37-artist catalog, vendor subscription agreement, rights in published zones, billing terms.
4. The web beta: domain, terms of service, privacy policy (including the Common Room's no-data-retention promise), business name, an age-appropriate statement.
5. The marketplace: artisan subscription agreement, rules separating game items from real products.
6. Later products when they near shipping (for example Tumble Run on Steam).

Related: a new game gets no store listing until the client says go (Ruled Sep 10 for The Thread, "sovereignty"). A legal briefing file for the staff member who handles licensing is in `docs/legal/`.

### A11. Quality gates by kind of thing

| For | Gate | Status |
|---|---|---|
| Any arcade game or the MMORPG | The **seven bars** before "built": fully playable and standalone; downloadable; our characters and storylines; our music; Bluetooth for all controller types; overlay button for coinciding systems; wired, running, sellable. Nothing is marked done until all seven. | Ruled Sep 1 |
| A zone | The director test. Five directors (Hitchcock, Spielberg, Del Toro, Kubrick, Coppola). A sixth, Cameron, was seated Oct 5. No zone ships until all pass. | Ruled Sep 2; Cameron Oct 5 |
| Prose, dialogue, lore, game text | The six-writer constitution (Rothfuss, Pratchett, Gaiman, Asimov, Bradbury, Weir) and the tone-teacher checklist. | Ruled Sep 2 |
| Images | Class it, canon it, tri-mode it, clean it (strip metadata), log it. Anti-canon check. | Ruled Sep 4 to Sep 10 |
| Anything real-world | Honest label: name the real source and date. | Standing law |
| Game design | Anti-Skinner (no compulsion loops), No-Fail, Steady Light (no strobe), Toll Booth (every zone has a price). | Standing laws |

### A12. From idea to live: a practical guide

**The path in one line:** chat idea, canon check, spec with gates, client rules, commit, images and records, builder message, build, verify, paperwork, listing.

#### Checklist

1. **Say the idea in chat.** Elio restates it back. If it changes earlier canon, Elio says which ruling it replaces.
2. **Search before you write.** Open `docs/INDEX.md` and search the name or topic. Check `docs/MASTER_ASSET_LEDGER.md` for art. Check `docs/characters/character_rename_ledger.md` for old names. (INDEX stops at Sep 10, so also search the folder names directly.)
3. **Pick the right folder and name.** Zone and system specs go in `docs/zone_specs/`; builder sync specs in `docs/library/specs/`; builder messages in `docs/builder_messages/`; characters in `docs/characters/`. File names follow `geode_inn_<topic>.md`.
4. **Write the spec with the template for its kind** (see the other parts of this manual). End it with numbered **open gates**.
5. **The client rules the gates.** Record each ruling with its date and the commit hash. Mark unruled items Proposed or Open.
6. **Make the art.** Class master first, recolors after (the REC law). Make all three frequency states (Living 42Hz, Shadow 84Hz, In-Between). Strip metadata. Upload to Base44 public storage. Log the URL in the Master Asset Ledger and the gallery manifest.
7. **Make the data.** Write a manifest JSON in `docs/library/data/` (or `docs/gallery/` for image URLs). Create records in the staging app if the entity exists there. Use the exact field names in Part B.
8. **Check the builder is idle.** Pull first. Commit. Push. **Quote the hash.**
9. **Hand it to the Fizgigs.** Write or update a builder message file. The client tells the Fizgigs in the live app chat to build the named spec. Approve any platform prompt.
10. **Move records into the live app.** Through a builder import, or the REST route in A3. Cross-app writes from chat are blocked, so confirm the records actually arrived.
11. **Verify.** Screenshots of the live page. For a game, all seven bars.
12. **Mark it LIVE** in the blueprint viewer data (`docs/blueprints/inn_tree_3d_data.json`). The statuses are LIVE, SPEC and DRAFT. The client rules LIVE in a ruling session.
13. **Paperwork before listing.** Clear the matching line in the paperwork matrix. No store listing, public post or Steam page before that.
14. **Update the indexes.** Add the file to `docs/INDEX.md` and the entry to the ledger.

#### Who does each step

| Steps | Client | Elio | Fizgigs |
|---|---|---|---|
| 1, 5, 12, 13 | Decides | Records | n/a |
| 2 to 4, 6 to 8, 14 | Reviews | Does | n/a |
| 9 to 11 | Sends the order, approves | Supports | Build |

#### Common traps

- Writing to the live app from Elio's chat and assuming it worked.
- Calling something done because it is "staged" or "listed."
- Pushing while the Fizgigs are mid-build (before Sep 9).
- Baking a frame into an engine image.
- Numbering errors: Gazette strip numbers repeat (see ComicStrip); roster numbers and zone counts drift (see A13).

### A12a. Early tools, pipelines and standing rules (Jul 12 to Aug 31)

These are the working methods of the founding period. Some were replaced by the Sep 1 onward methods above; those are marked.

**Architecture decisions.**
- Jul 22 (Ruled, restated as August canon in Before the Song): Base44 is the backend (database, API, web hub, archive). Godot is the game engine (arcade games, MMO zones, combat). GodotSteam handles Steam (achievements, cloud saves, leaderboards). The roadmap file is `docs/geode_inn_game_engine_roadmap.md` (found). Phase 1 games: Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep.
- Aug 20 (Ruled): Elio is the in-game intelligence (the Owl) through the Base44 Agent API. Hybrid rule: scripted dialogue in Godot (free) for ordinary talk, shops, quest text and tutorials. Elio is called only for special moments (the Owl's watcher lines, riddle quests, Living Book characters, Remembrance Vision readings, cosmic gate readings, off-script questions), about 5 to 10 calls per play session. Replies take a few seconds, so never in combat or fast play. Cost figures per call were stated in the early chat and are not repeated here.
- Aug 20 (Ruled): no WoW-server core. Godot with a local database (headless server, SQLite or PostgreSQL), Base44 as cloud sync on startup, on shutdown and at checkpoints. The WoW quest and NPC craft remains a design blueprint (`docs/geode_inn_azerothcore_mapping.md`, history only).
- Aug 21 (Ruled): translation never runs in the game loop. Godot only asks the Base44 API for cached text. Pre-load on zone entry. See B8 and B9.
- Aug 30 (Ruled, commit): the Bead Composer lives on geodeinn.com as part of the site: "two doors, one engine, one codebase, no separate domain." Share Wood: no approval, no transaction fees; faires pick from the Inn's 37 curated styles and never upload their own (copyright protection). Tiers 9, 49 and 99; the Complete Inn bundle is 99.99 with all six products.

**The video pipeline (Aug 20 to 21).** The client generates video clips by hand in a text-to-video tool. Elio could not type into its editor or log in, so Elio writes the prompts and the client pastes them. Clips arrive as mp4 in the Drive folder "game videos". Elio cannot watch video: it extracts frames with ffmpeg (first, middle and last), builds contact sheets and reports. The client is the final judge. The three-phase plan (agreed): visual catalog, then Godot scene code from the frames, then repeat per zone. Prompt files in the repo: `docs/art/morphic_catacomb_prompts.md` and `docs/art/morphic_all_zone_prompts.md` (both found), `docs/mib_tesla_prompt_list.md` (found), `docs/archaeological_sites_master_list.md` (found). The theme-brainstorm and archaeological prompt sets are under `docs\harvest_2026-09-21\` as text files (found; the clean files named in the early chat were not found by those names). 114 prompts in all. The visual catalog entry format: exact hex colors, lighting values, Godot notes, an epilepsy-safe check, the matching scene.

**Voice profile tooling (Aug 22 to 23).** `tools/voice_profile_extractor.py` (one clip) and `tools/batch_extract.py` (many clips) turn public clips into measurable data (pitch, pauses, tempo) with Librosa. `godot_project/scripts/geode_inn_voice_profiles.gd` holds the profiles. `docs/geode_inn_voice_profile_translation_reference.md` is the single source of truth. All four exist. Rule: measurable data only, no voice cloning; actor names are direction references. Fields are listed in B23.

**Standing process rules from the commit log (August canon unless noted).**
- "Copyright-clear" is the standing rule for card names and character names. Aug 24 copyright name audit (nine renames), Aug 30 full NPC IP-safe audit. "Celebrity face-softening" on art (Aug 24). Ruled (commit, Aug 24): the client confirmed the new names after the audit ("character identities live in behavior and demeanor, not in copyrighted labels"). Names and renames live in `docs/characters/character_rename_ledger.md` (found).
- Ruled (commit, Aug 30): NPCs come from the 191 world map countries; accents are roots, not assignments.
- Built (commit, Aug 28): entity reconciliation for the Living Book system: extend the Book entity, do not duplicate it.
- Built (commit, Aug 28): "solidification". Every doc gets a Shadow Inn state, endgame connections, a sound profile and cross-system links. 12 batch files, about 460 KB, 100+ source files. A master index audited 255 docs.
- Search the session logs before declaring a character missing. Elio said this after wrongly flagging Loki as missing (about Aug 22). It is the early form of the A9 lesson.
- Processing order per character (about Aug 22): casting first, then voice, philosophy, connections, zone, and the mechanical voice profile last. Casting is a direction reference only and is kept out of this manual.
- Elio saves to three stores after each session segment: memory, the repo and Drive.

**Backups and summaries.** Aug 22 to 23: the Project Bible master backup, 168 documents, 3.6 MB, about 3.65 million characters, 28 sections (`docs/geode_inn_project_bible_master_backup_aug2026.md`, found). Aug 24: an interaction summary of 139,564 words of raw chat history from Jul 22 to Aug 24 was archived to the repo. Aug 30: backup manifest, 52 commits, 93 files, 16,597 lines added since the Ravens' Question commit.

### A13. Process: open and to reconcile

**Open**
- The checkpoint-file habit before heavy pushes: agreed Aug 31, never confirmed built.
- `CycleLog` entity: Proposed Sep 1, not confirmed.
- Direct builder messaging from Elio: not available. The repo file route is the working method.
- A refresh of `docs/INDEX.md` and `BUILDER_README.md`.
- Several Gazette strips are in the staging app and the repo but not in the live archive (see ComicStrip).
- Early items still unsettled (Jul 22 to Aug 31): 49 stones without Mind and Body text (Jul 22; the Sep 4 fix filled 55); the world map with clickable pins and coordinates for most of the 191 lore countries (offered Jul 22, no confirmation); the districts file for map areas, never loaded; a `LibraryBook` entity and library cards (not built); 2,000 to 4,000 more books and the archive.org lists (not entered); the archive.org screen name (failed Aug 19); the AzerothCore "choice" noted open Aug 18 and scrapped Aug 29.
- Early Godot stubs (Aug 31, Built, commit log): the Steam calls in `SteamManager` are commented out until the GodotSteam addon is installed; haptics, cloud save and load are stubs. Several web pages and products were specs only: the Tumble Run DLC pack, Share Wood onboarding and zone builder, the Digital Companion App, the Resonance spec, the Egg Hatchery page and the Gazette page.
- Real-person NPCs: some characters are based on people who may need to approve their look or lines. The early chat records no approvals (August canon). Treat this as an open legal item next to A10.
- The Aug 31 checkpoint-file habit (above) came after an earlier habit of full "master backups" (A12a). Which one applies now is not stated.

**To reconcile**
- **When Elio got Drive write access.** The early chat says Aug 11 (two documents on Drive) and also Aug 21 about 2:16 PM ("full write access granted after a double verification"). It also shows a read-only connection at about Aug 20, 6:27 PM. Likely an earlier grant lapsed or was renewed. Use Aug 21 as the date of reliable write access.
- **When the repo began.** The early chat says the repo was created Aug 18 and first pushed Aug 18 to 19. The commit log available starts Aug 21. The Aug 18 pushes are not in it, so their hashes are unknown.
- **Which date AzerothCore ended.** Commit log: Aug 29 ("officially scrapped"). Chat: Aug 18 "not formally resolved", Sep 21 ruled out. Use Sep 21 for the chat ruling and Aug 29 as the first written deprecation.
- **Doc counts in August.** 168 documents (master backup, Aug 22 to 23), 255 and 258 (index, Aug 28 to 30), 361 (Aug 30), 617+ (research mapping files), and 1,228 (Elio, Oct 9). These count different things.
- **Audio counts.** 368 audio files and 1,552 project files (Aug 31, one commit) against 387 audio assets (a later commit the same day). Verify the final count.
- **Two Sandfall scripts.** `Sandfall.gd` was committed twice, 407 lines on Aug 30 and 290 lines on Aug 31 (rewritten). Which one is current is not checked.
- **Early-chat dates marked "Aug 20?".** The second early-chat file has no clear dates for some entries (Drive access, plan change, the in-game intelligence decision, the sub-agent runs). They are placed Aug 20 to 21 here.
- **Builder naming.** Jul 22 "builder AI" versus the Sep 1 "Fizgigs". See A1.
- **What "approve" means.** Aug 31 and Sep 1 describe each builder message as needing client approval in the builder dashboard. Sep 3 says nothing needs approving to proceed. Sep 10 says there is no hidden approval queue, and "approve" means telling the Fizgigs to build a named spec. Use the Sep 10 meaning, but the platform may still show prompts.
- **Delivery of builder messages.** Email to the client (Sep 1), then repo file (Sep 9 on), then direct talk (Sep 21 on). All three appear. Treat the latest as current.
- **Failsafe layers for The Decision.** The chat logs say 8, 9, then "7 places" (Sep 27). The repo spec says 9.
- **Arcade roster size.** 52 (BUILDER_README top section), 61 (Aug 31), 65 (Sep 10), 83 to 85 (Sep 11 to Sep 16), 86 to 88 candidates (Sep 19 to Sep 27). Elio says "85" on Oct 9. The repo copy has 84 build sheet files.
- **Zone and level counts.** 37 zones (client), 42 artists (Elio's count), "in the forties" (Sep 4), 85 zones in the Zone Deck (Oct 13), 9 levels versus 10 (resolved Oct 14 as 9 levels plus half-levels for the In-Between and the Void).
- **Tabletop pipeline totals.** Reports range from 380 zips and 28,830 files to 588 zips and 31,487 files, with failures from zero to 15,522. The last reports (Oct 14 and 15) say 380 zips, 33,874 files, zero failures.
- **Were "pushed" files on GitHub or only in the Base44 repo?** Elio usually says "pushed" without saying which. Only commit hashes settle it.

---

## Part B. The data dictionary

### B0. How to read this

- **App** column: **Live** = the Geode Inn app the Fizgigs build. **Staging** = Elio's app. **Both** = records in both.
- Field names are exact, in `code`. Where the chat logs and the repo disagree, the repo schema is shown and the difference is flagged.
- "Example" values come from real records or canon.
- Counts carry their date. A count from one app is not a count for the other.
- A field marked "(chat)" appears only in the chat. A field marked "(repo)" appears in a repo file.

#### Entity overview

| Entity | App | Latest count in the chat |
|---|---|---|
| Stone | Both (differ) | Staging 200, then 201 (Sep 10). Live 164 (Aug 31). |
| MarketItem | Both | Live 101 (Sep 1 and Sep 3). |
| Dialogue | Staging (live uncertain) | Staging 529+ (Sep 10). |
| EchoMelody | Staging | 3 demo seeds (Sep 11), plus 1 canon entry (Sep 17). |
| ComicStrip | Both (differ) | Live archive: #1 to #3 (Oct 14). Staging: through #33. |
| GameItem | Staging (live 280 per blueprint) | 355 (Sep 21). |
| TrayTemplate | Staging | 6 default records (Sep 13). |
| Book | Live (plus staging) | 907 (Oct 5). |
| BookTranslation, ScholarlyBridge | Not stated | 0 records. |
| Lore | Live | 236 (Sep 1). |
| InnCore | Staging only | 1 record. |
| GrainStory | Staging | Not stated. |
| Diploma | Live | Not stated. |
| Material | Both (differ) | 104 or 31 (see below). |
| BuildingRecipe | Live | 148 (Sep 10), or 20, or 8. |
| ElementCharm, QuestCharm | Live | 118 and 45. |
| Artisan | Live | 1 record. |
| EggHatch, EggVote | Live | 10 retired eggs. |
| FaireVenue | Not stated | Schema ready. |
| PlayerProgress, PlayerInventory, Leaderboard | Live | Schema ready. |
| Others | see B20 | |
| Voice profile data (not a Base44 entity) | Godot / repo | 20 profiles, then 27 (Aug 22 to 31, commit log). See B23. |
| Deck, CustomQuest | Not stated | Named for the Digital Companion App (commit, Aug 29 to 30). No fields. |

---

### B1. Stone

**What it is.** One record per stone or mineral. It drives the Bead Board, the stone lore, the audio tone, the faceting rules and the game rewards.

| Field | What goes here | Example |
|---|---|---|
| `name` | The stone's name. Records are matched by name. | "Blue Lace Agate" |
| `family` / `stoneFamily` | Mineral family. | "Quartz" |
| `category` | Category. | "Inn-Origin" (Stillness Stone) |
| `colorNotes` | Color description (on all 164 stones). | text |
| `opacity` | "opaque" or "translucent". | "translucent" |
| `opticalPhenomenon` | Cat's-eye effects and similar. If set, cabochon only. | "chatoyance" |
| `mohs` | Mohs hardness. Drives the tone: Mohs 1 is 174 Hz, Mohs 10 is 852 Hz. | 7 |
| `canFacet` | True if facets are allowed. | false (opaque) |
| `canCabochon` | True if cabochon cuts are allowed. | true |
| `cabochonShapes` | Allowed cabochon shapes. | ["round", "oval"] |
| `beadFinish` | "smooth" or "faceted". | "faceted" |
| `frequency` | Tone in Hz. | text/number |
| `geoRegion` | Where it comes from. | text |
| `varieties` | Variants. | list |
| `mind` | The stone's Mind text (essence). | text, Inn voice |
| `body` | The stone's Body text (practical). | text, Inn voice |
| `zone` | Primary zone. **Added Sep 4.** | "Catacombs" |
| `image_url` (chat) | Stone image link. The builder message matched by `name` and set this field. | link |
| map coordinates | Position on the world map. Field names not given in the chat logs; a `populateStoneCoordinates` function exists. | n/a |

**Faceting rules (Aug 31):** opaque stones get smooth shapes only; translucent and transparent get faceted; tourmalines get both; opals follow the Fire Opal exception.

**Where it lives.**
- Staging: the full set. 198 on Aug 31, 200 on Sep 4 (Stillness Stone and Octave Stone added), amazonite as #201 on Sep 10.
- Live: 164 on Aug 31, with 34 game-original stones missing (for example River Amber, Frost Iron, Dreamtime Opal). On Sep 1 the live stones still lacked images and coordinates. The live app "has its own Stone copy," so the `zone` field and later stones must ride in a builder sync.
- Repo: `docs/library/data/stone_zone_map.json`, `docs/stone_image_urls_for_live.json`, `docs/geode_inn_stone_census.md`. In the game client, images load from `res://assets/stones/[name].png` (198 images, 23 MB). The web beta may keep URLs (Ruled Aug 31).

**Zone counts (stone_zone_map.json, 200 stones):** Cosmology 18, Clockwork Skies 6, Main Floor 20, Campgrounds 27, Staircase 18, Catacombs 34, Fae Kingdom 13, Water Zones 37, Archive 13, Spiral Gallery 4, Vault 8, Forge 2. The sum is 200. Stones may keep "second homes"; the map records the primary one. 52 stones outside the census got homes as "census addenda."

**Known fixes.**
- Four stones with dead image URLs were regenerated (Aug 31): Rhine Quartz, Frost Iron, Provence Limestone, Alpine Granite.
- 55 stones with empty `mind` and `body` were filled in six batches (Sep 4).
- Water Zones count corrected from 38 to 37. Archive count rose from 12 to 13 when Blue Tiger's Eye was made its own record, separate from Hawk's Eye.
- The Vesper stone's triple duplicate was fixed.
- `canCabochon`, `cabochonShapes` and `beadFinish` were added for the bead tool.

**Earlier (Jul 22 to Aug 31).**
- Jul 22 (Built): the first Stone entity in the staging app had `name`, `mind` (metaphysical), `body` (healing), a family or category, a geographic region, an image reference and latitude and longitude (12 stones geo-tagged at first). The Geode Inn app's Stone schema used different field names, and Elio mapped them on each push. 164 stones were loaded in staging and 164 Stone records copied to the live app. 115 were then updated with the book's Mind and Body text, leaving 49 without text (kyanite and green labradorite among them). "Blue" and "Orange" variants had no matching live record. Images waited on the last book images.
- Aug 26 (Built, commit): the vibration index covers 160 stones, with `mohs` driving the tone, plus `canFacet`, `opacity`, color and optical phenomenon fields. The Mohs Vibration game doc and a patent disclosure were committed that day. Aug 28: a "missing stones" working doc listed 55 stones needing Mind and Body text and two new stones (Stillness and Octave, named in the Aug 29 commit log and counted in the staging app on Sep 4). Aug 31: a stone image URL mapping for 140 stones for the Bead Board.
- Aug 31 (Built): four stones had dead image URLs regenerated (see Known fixes above).
- The mapped repo files `stone_image_mapping.json`, `docs/stone_image_urls_for_live.json` and `docs/library/data/stone_updates.json` (163 records) exist (see B21).

**Open and to reconcile.** Counts of 164, 166 (a "166-stone doc"), 198, 200 and 201 are all in use. Early counts add 160 (the vibration index, Aug 26), 140 (image mapping, Aug 31) and 115 plus 49 (Jul 22, which sum to 164). The 55 stones in the Aug 28 working doc and the 49 left on Jul 22 are both "stones without text"; the first is the count the Sep 4 batches filled. The Soulstone is the 165th stone as a quest idea. Whether the 55 filled descriptions reached the live app is not stated.

---

### B2. MarketItem

**What it is.** The shop catalog. Games and jewelry share one table. A game listing is a catalog entry only; it does not mean the game is playable (Elio's retraction, Sep 1).

| Field | What goes here | Example |
|---|---|---|
| `name` | Listing name. Match key for updates. | "The Pipe Descent" |
| `category` | Type. Games use "Arcade Game". | "Arcade Game" |
| `gameName` | Game title. | "The Pipe Descent" |
| `gameDescription` | Short game description. | "Super Mario Bros-inspired platformer. Stomp catacomb critters..." |
| `gameEffect` | What it does in play. | "Unlocks Pipe Stone in player inventory." |
| `priceRange` | Price text. | "$4.99" |
| `zone` | Home zone. | "Catacombs" |
| `stoneType` | Reward stone. | "Pipe Stone" |
| `rarity` | Rarity word. | "Uncommon" |
| `loreConnection` (note: also `lore_connection`) | Lore link. | text |
| `isSoulsticeItem` | True for the client's jewelry. | false |
| `inStock` | Availability. | true |
| `developmentStatus` | Games: "live" (builder message). Real products: "Available". | "live" |
| `realName` | Display name of a real product (batch 7 sync). | "Garnet, gold and spinel earrings" |
| `realDescription` | Real product text. | text |
| `realImage` | Product photo link. | link |
| `externalUrl`, `processUrl` | Shop checkout link. | link |
| `artisanName`, `artisanShopName`, `artisanShopUrl` | The artisan. | "Soulstice Jewelry" |

**Where it lives.**
- Live: 39 items on Aug 31 (30 Soulstice jewelry, 4 artifacts, 5 legacy), prices and photos empty. On Sep 1, 62 were pushed (61 games and 1 jewelry), making **101** (61 games plus 40 Soulstice). Sep 3 confirms 101. The Architecture Blueprint says 95 (34 real products plus 61 games).
- Staging: had prices ($40 to $510), shop links and 8 photos while live was still empty.
- Repo: `docs/market_items_all_61_games.json` (61 records, also in `docs/library/data/`), `docs/market_items_retro_games.json` (9), `docs/market_sync_manifest.json` (34 real products plus `commonFields`).

**Price tiers, as set by Elio Aug 31 (staged, 61 games).**

| Price | Count | Group |
|---|---|---|
| $2.99 | 10 | Phase 1 to 2 arcade classics |
| $3.99 | 26 | Phase 3 to 4, World Trials, Parks |
| $4.99 | 15 | Standalone, Specialty, Retro |
| $6.99 | 1 | The World Walker |
| $9.99 | 3 | Major Zones (Canopy City, Tidal Caves, The Arcana) |
| $12.99 | 3 | Legendary (Fae Kingdom MMO, Hollow Earth RPG, Zelda-Style World) |
| Free | 3 | Spiral Gallery, Frog Transformation, Whisper Layer |

**Earlier (about Aug 21 to 31).**
- First created in the early chat as part of the three-layer marketplace (in-game description, real description, link to the real shop). Fields described then: name, in-game flavor text, real-world description, stylized image, real product image, external URL, artisan name, category, price range, in-stock flag. Known by name: `isSoulsticeItem`, `inStock`. Four sample records were loaded to the live database: Aurora Pendant, Truth-Teller's Ring, Cat's Eye of Bastet and Bluestone Key. The ring was then set to forthcoming status.
- Aug 22 (Built, commit): MarketItem and PlayerInventory with 4 sample items; `developmentStatus` values Available, In Development, Studying Technique, Concept, Limited Edition and Archived; the `processUrl` field (the artisan's process link). This is wider than the "live" and "Available" values in the table above, which are the later usage.
- Aug 24 (Built, commit): MarketItem is the route for the physical charm bracelet. Aug 31: product photo links and price updates were added to the manifest, and 106 images were uploaded with public Base44 URLs.
- Before Song canon (August canon): items can be "Forthcoming" with a "Process" link showing the artisan's skill-building journey; a "Soulstice" marker means authenticity. These match `developmentStatus` and `processUrl`.

**Open.** The Hook and The Mohs Vibration still needed MarketItems on live (Sep 1). The roster has grown past 61, but no new listing goes live until the client says go (Sep 10). The Aug 31 bundle prices (Arcade Pass $14.99 or $29.99, Legendary Bundle $24.99) were never discussed with the client.

---

### B3. Dialogue

**What it is.** One NPC line or branch. Branching trees, whisper-layer lines, and the repeat ladder (rung 1, 2, 3) are separate records.

| Field | What goes here | Example |
|---|---|---|
| `dialogueId` | Unique id. | "reader_001" |
| `npcName` | Speaker. The value "All Zones" is used for shared lines. | "The Reader" |
| `zone` | Where it fires. | "Archive" |
| `voiceProfile` | Voice description or profile key. | "Quiet, measured, each word placed like a stone" |
| `conditionTag` | When it fires. | "first_visit", "repeat_rung2" |
| `priority` | Order. Higher wins. | 1; Lozen's "Oi" record 9; Malachi 10 |
| `isWhisperLayer` | True for whisper-layer lines. | false |
| `lines` | Spoken text, list. | ["Noticed."] |
| `responses` | Player choices, list. | ["[Sit in the window-seat nook and wait]"] |
| `setFlags` | Flags set. | ["met_reader"] |
| `questLink` | Linked quest. | "" |
| `hookWord` | The character's hook word (voice-block records, Sep 10). | "Noticed." |

**Voice block (not a field list).** Every character profile gets a seven-part voice block: dialect, delivery, key tell, hook word, repeat ladder, engine voice profile, dominant writer of the six. Rung 1 is the line as written; rung 2 shortens to the key tell; rung 3 is the truest response and sets a flag. Ruled Sep 10.

**Where it lives.**
- Staging: 51 (Sep 1), 393 at the Aug 31 backup, 398 (Sep 3), 515 at the Sep 10 audit (about 130 voices), 524 after Batch 8, 529 after Batch 9, and more after Einherjar, Council, philosophers, Smiths and Staircase were added.
- Live: the Architecture Blueprint (Sep 1) lists 46 "live in app." The Sep 3 chat says the live app's Dialogue entity is empty. Not resolved.
- Repo: `dialogue_entries.json` (root, 35), `docs/library/data/dialogue_entries.json` and `dialogue_entries_clean.json` (78 each, the set loaded into Godot: 78 entries across 21 NPCs), `dialogue_voice_block_sync.json` (90), `lozen_dialogue_entries.json` (12).

**Earlier (Aug 29 to 31, Built, commit log).** 35 dialogue entries and a hook word catalog for 29 NPCs (Aug 30), then a merged dialogue database of 46 entries for 29 NPCs. Aug 31: 18 NPC dialogue trees (1,353 lines, 21 NPCs, about 80 nodes) for the Godot beta, with `dialogue.json` and `dialogue_complete.json`. The 35 matches the root `dialogue_entries.json`; the 46 matches the Sep 1 blueprint's "46 live in app". The 78 entries across 21 NPCs in the Godot set (B21) are the later merge. Style rules: "tabletop voice" for quest givers, one hook word per NPC (a verbal fingerprint), and the six-writer narrative voice (Aug 31). Voice profile numbers are in B23.

**Known fixes.** 17 records renamed Sep 3 (Oceananoir to Oceanianoir, Beorn to The Bearsark, Radagast to The Greenward). Anna to Bramble Sep 4. Examiner, Wren, Soma, Saker renames Sep 10. Nyx has no dialogue record (Sep 10).

---

### B4. EchoMelody (the songbook)

**What it is.** A log of melodies a player keeps. It replaced a counter. **Ruled Sep 11:** EchoMemory is its own entity, not a number on PlayerProgress. The Clockmaker's Turning reads the **harmony** of kept melodies, never a total. There is deliberately no score field.

| Field | What goes here | Example |
|---|---|---|
| `playerId` / `playerName` | Whose songbook. | "demo_player_1" |
| `melodyName` | Earned name, from how it was kept. | "The Stillness Under the Snakes" |
| `melodyType` | Stone Tone, Voice Phrase, Zone Hum, Permanence Tone, Event Melody, or Song Fragment. | "Event Melody" |
| `frequencyHz` | The tone in Hz. | 84 |
| `voicePart` | root, third, fifth, octave or silence. The Turning checks the spread. | "octave" |
| `originZone` | Where it was kept. | "Gorgon's Garden" |
| `sourceStone` / `sourceNpc` | Which stone rang or whose phrase was learned. | "bluestone" |
| `originDetail` | How it was earned. The Undercity memory-lamps burn on this text. | text |
| `dateKept` | When. | date text |
| `isCoreFragment` | True only for canonical Song of Making fragments. | false |

**Where it lives.** Staging only, built Sep 11 (`docs/library/specs/geode_inn_echo_songbook_schema.md`). Three demo seeds, all with `playerId` demo_player_1: "The Stillness Under the Snakes" (84 Hz, octave), "You Have Time" (42 Hz, root, the Host's welcome), "The Ring of the Carried Stone" (111 Hz, fifth). **Wipe the seeds before live play.**

**Later entries (Sep 11 to Sep 17).** Types logged without a schema change: `circle_rhythm` (drum circle), `chamber_resonance`, `CITY_MURMUR`, "reclaimed hum", Song-Catcher fragments, mailed tone-locked tokens. The first canon entry is "The Rocky Road to Dublin" (Sep 17, Ruled). It went to the database, not the repo.

**Owed to the Fizgigs.** The harmony check, the keep-triggers (which moments write an entry), the memory-lamp render, the wipe script.

**To reconcile.** The Sep 11 chat names the fields `name`, `type`, `frequency`, `origin`. The repo schema (`melodyName`, `melodyType`, `frequencyHz`, `originZone`) is used here. `EchoMemory` is also used in the chat as the system's name; it is not a second entity.

---

### B5. ComicStrip (the Gazette)

**What it is.** One record per daily strip. Four panels, a "button" line (the last beat), a script in the repo gallery.

| Field | What goes here | Example |
|---|---|---|
| `title` | Strip title. | "The Spine and the Jellyfish" |
| `stripNumber` | Number. | 3 |
| `date` | Publication date. | date |
| `imageUrl` (repo spec) | Image link. See the fix below. | link |
| `panelImageUrl` | **String.** Comma-separated panel URLs. | "url1,url2,url3,url4" |
| `panels` | Panel data, JSON array of descriptions. | array |
| `characters` | Who appears. | "Lozen, Molly" |
| `zone` | Setting. | "Staircase" |
| `artStyle` | Art style. | "Klimt gold-on-dark" |
| `playerAdventures` | **String.** Staff Edition display rule. | text |
| `isPublished` | True shows it. Set true on publish. | true |
| `caption` (chat) | Per-panel caption. | text |

**Schema fixes (Sep 12, Ruled):**
- `playerAdventures` is a **string**, not a boolean or list. The old spec line saying boolean was corrected in the comic system doc.
- `panelImageUrl` is a **string**, a comma-separated list of panel URLs, not a list.
- Each strip has 5 images: four panels plus the assembled strip.

**Where it lives.**
- Staging: every strip, through #33 by Oct 14.
- Live: the live archive "only holds strips #1 to #3" (Oct 14, Oct 15). Strips #011 (Sep 19), #014 (Sep 23), #018 (Sep 27), #022 (Oct 2) and #033 (Oct 14) were refused by the cross-app block.
- Repo: `docs/gallery/gazette/strip_NNN_<slug>/` (15 folders) and `gallery/gazette/` (8 folders) in the Oct 22 copy. Folder name pattern `strip_<NNN>_<slug>`.
- Display page spec: `docs/library/specs/comic_strip_page_spec.md`, route `/gazette`. Backend function `getDailyStrip` (also `getStripArchive` in the spec).

**Known strips (by the numbers used in the chat).** Strip Zero "The Greek Yogurt Accord" (Sep 4). Early six (Sep 1): The Room That Wasn't There; Letters to the Sentinel; The First Stone; The Watcher Sees All; The Catch; Bedtime Stories. Then: #001 The Postmaster's Route; #002 The Oldest Cold Case; #003 The Spine and the Jellyfish; #008 Molly and the Bill; #009 What the Traveler Carried; #010 (repo: The Easel That Faces the Wall); #011 Three Skins; #012 The Throat of the Building; #013 The Silence Is the Road; #014 The City Where Nothing Bites; #015 The Ground Remembers; #016 The Word in the Flask; #017 The Building Has Ears; #018 The Sliver That Kept Time; #019 The Honest Liar; #020 Every Door But One; #021 What the Margin Kept; #022 The Booth That Sold Nothing; #023 The Stone That Stays; #024 The Wall That Keeps Receipts; #025 The Form That Stays; #026 The Broom That Kept Time; #027 The Minutes Are Available; #028 The Helmets Are Honest; #029 The Bones Are Honest; #030 The Stone Is the Soup; #031 The Slot That Was Always There; #032 The Breath Between the Bars; #033 The Octopus That Wasn't for Sale.

**To reconcile.**
- **Number "004" is used five times:** The Door That Never Locks (Sep 14), The Hound Who Stayed (repost, Sep 15), The Keg and the Name (Sep 17), The Pocket-Change Gate (Sep 30), and "#4" Three Mouths, One Braid (Oct 7). The repo has two folders both numbered 004.
- Sep 9 called "The Great Renaming" strip #001. Sep 12 made The Postmaster's Route #001. The repo has no Great Renaming folder.
- Strips #005 to #007, #023, #025, #026 and #029 have no folder in the Oct 22 copy. Several messages say "live in the app" for strips that Oct 14 says are only in staging.
- Gazette daily timing: the spec said midnight; the working job runs 6:00 AM Chicago; Elio proposed "post when worth it" (QC law, filed Sep 12, no objection).

---

### B6. GameItem

**What it is.** An in-game object: tool, artifact, quest item, material prop. Room contents are built from these.

| Field | What goes here | Example |
|---|---|---|
| `name` | Item name. | "Sun-Bleached Ankh Scepter" |
| `description` | What it is and looks like. | text |
| `itemType` | Type. | "QuestItem" |
| `materials` | Materials, list. | ["sandstone", "papyrus", "gold ore"] |
| `zone` | Zone. | "Egypt" |
| `interactiveProperties` | What it does when used. | "channels sunlight to unlock the Chamber of the Sun" |
| `basedOn` | Real-world or art source. | "Egyptian iconography through O'Keeffe's desert bone aesthetic" |
| `variants` | Variant names. | ["Ochre Sandstone", "Bleached Bone White"] |

**Where it lives.** Staging: 355 records (Sep 21, zone-counted); 71 were added Sep 1 to a prior 284. The Architecture Blueprint lists 280 as live. Repo: `zone_items_all_280.json` holds **224** records, not 280 (also under `library/items/`). On Sep 21 there were **zero** items for Clockwork Skies and **zero** for the Main Floor. About 66 are owed (`docs/blueprints/geode_inn_room_items_blueprint.md`).

**Earlier (Aug 30, Built, commit).** "224 zone quest area items" were loaded. That equals the 224 records in `zone_items_all_280.json`, so the file holds the Aug 30 set. The records don't say what the "280" in its name and in the blueprint refers to. Items are described as quest-area props by zone.

**To reconcile.** 224 (file, and the Aug 30 commit) versus 280 (blueprint, file name) versus 355 (staging).

---

### B7. TrayTemplate

**What it is.** A layout for a bead sorting tray. Seven trays: six defaults and a blank (Ruled Sep 13).

| Field | What goes here | Example |
|---|---|---|
| `name` | Tray name. | "The Fibonacci Stepped Spiral" |
| `layoutType` | Layout key. | "fibonacci-stepped" |
| `dipCount` | Number of dips. | 8 |
| `isDefault` | True for the six defaults. | true |
| `unlockCondition` | How it unlocks. | "Unlocked from the start" |
| `unlockZone` | Zone. | "Main Floor (bead board)" |

| Tray | `layoutType` | `dipCount` | Unlocks in |
|---|---|---|---|
| Fibonacci Stepped Spiral | fibonacci-stepped | 8 (cells 1,1,2,3,5,8,13,21) | Main Floor |
| Triskelion | triple-spiral | 4 | Celtic Highlands / Stone Circles |
| Classical Labyrinth | unicursal-7-circuit | 8 | Labyrinth |
| Golden Spiral | continuous-groove | 0 (a groove) | The Color Works |
| Ammonite | logarithmic-chambers | 9 | The Deep (fossils) |
| Sunflower | phyllotaxis-dual | 21 | The Campgrounds |
| Maker's Bench | blank | player's choice | beside the defaults |

**Where it lives.** Staging (6 records, Sep 13) and the spec `docs/zone_specs/geode_inn_default_tray_registry.md`. The Architecture Blueprint listed it as "schema ready." Laws: No-Fail, Steady Light, Anti-Skinner, REC (skins ride free through `BoardSkin`).

---

### B8. Book

**What it is.** A text in the Archive. The library follows the pre-industrial primary-source rule.

| Field | What goes here | Example |
|---|---|---|
| `title` | Title in the original language. | "De Occulta Philosophia" |
| `titleTranslated` | English title if the original is non-Latin. | text |
| `author` | Author. Must be plain text (see fixes). | "Agrippa" |
| `languageIso` | ISO 639-3 code. Required. | "la" |
| `languageName` | Language. Required. | "Latin" |
| `category` | Enum: mythology, religion, alchemy, history, philosophy, poetry, folklore, apocrypha, science, other. | "alchemy" |
| `region` | Cultural region. | "Rome" |
| `publicationDate` | Approximate date. | "1533" |
| `sourceUrl` | Source link (archive.org). | link |
| `archiveOrgId` | Archive.org item id. | id |
| `pageCount` | Pages. | number |
| `originalText` | OCR text. | text |
| `hasOcr` | OCR complete. | true |
| `ocrStatus` | Required: pending, processing, complete, failed, not_applicable. | "complete" |
| `inGameZone` | Zone: Archive, Main Floor, Staircase, Upstairs. | "Archive" |
| `tags` | Searchable tags, including narrative-weight tags. | ["rewrite-the-rewrite"] |
| `availableLanguages`, `translationCount`, `downloadCount`, `publisher` | Support fields. | |

**Where it lives and counts.**
- Live: 168, then 178, then **625** (Sep 1, the whole archive manifest), plus 236 Lore = 861 entries. Then **907** after 282 Parchment Lore records (Oct 5).
- Staging: held a copy first. 11 extra books (Agrippa and others) were still staging-only on Sep 1.
- Repo: `docs/library/data/geode_inn_pdf_archive_manifest.json` (447 clean PDFs; 5 toxic files excluded in a Drive folder named "bb"), `docs/data/book_translation_schema.md`, `docs/library/data/geode_inn_parchment_lore_shelf_2026-10-05.json` (282 records), `geode_inn_book_title_map_2026-10-05.json`.
- Drive: 453 PDFs.
- Manifest groups: masonic periodicals 49; Princeton Seminary bulletins 54; Gentleman's Magazine 15; Royal American Magazine 12; Yale collections 8; Missouri Botanical 65; Google Books scans 7; historical treatises 57; religious texts 7; sacred geometry 3; other periodicals 3; miscellaneous 167.

**Known fixes.**
- `ocrStatus` is required. The first imports failed until it was set (Sep 1).
- Authors had been stored as stringified lists and were flattened (Oct 5).
- 323 placeholder titles were replaced with real ones (Oct 5), with a backup of the placeholders first.
- Parchment records use `category` "Parchment Lore", which is outside the original enum. This is the 15th shelf, labeled Inn Originals (Ruled Oct 5).

**Shelves (Ruled Oct 5):** Stones and Earth Sciences; Botany and Herbalism; Astronomy and Navigation; Alchemy and Early Science; Sacred Geometry and Number Lore; Freemasonry and Esoteric Traditions; Folklore and Mythology; Antiquities and Archaeology; Languages and Dictionaries; Childhood and Early Readers; Music and Songbooks; Crafts and Trades; Theatre and Performance; Periodicals and Serials; Parchment Lore.

**Earlier (Aug 18 to 21).**
- Aug 18 (Ruled): the library holds links to archive.org copies, not stored PDFs. The Book entity was the planned home (a "library card" per book). The first plan named `archiveOrgId` and `sourceUrl` on Book. Archive tracking plan (Aug 21, Proposed and agreed): query archive.org, compare against Book, flag anything missing as "needs cataloging", then create Book records (title, language, category, page count, source URL).
- Aug 21 (Ruled): Book, BookTranslation and ScholarlyBridge were created together (about 11:18 AM). Book is the root and never changes when translations change. The first Book field list: title, author, language ISO code and name, category, region, source URL, `archiveOrgId`, OCR status, tags. The schema doc is `docs/data/book_translation_schema.md` (found, also under `library\reference\`). A language family tree doc, `docs/data/language_family_tree.md`, was built the same day (found).
- Aug 28 (Built, commit): Living Book system entity reconciliation: extend Book, do not add a second entity.
- Reference materials priority (Aug 21, Proposed by Elio): etymological dictionaries first, ancient language lexicons second, cultural encyclopedias third, bilingual dictionaries for small languages fourth. Source: archive.org first. Not needed: modern bilingual dictionaries of big languages.
- Scale before the Oct counts: hundreds of books already, 2,000 to 4,000 more expected (Aug 20), and the Inn's Miskatonic Annex described as 4,000+ volumes (Before the Song, August canon). Elio's shelf proposal (Aug 20): the stacks (browsable thousands), the reading nook (curated highlights) and 10 to 20 Living Books with full interactive treatment. Not ruled as such. The 15 shelves ruled Oct 5 replace it.

**Open.** Book content is readable in game only while the archive.org link is live; nothing public until a legal pass (Ruled Sep 15). 453 transcript stories are not imported. Duplicates to thin: Voynich, Roman Forgeries, Hennepin. One copyrighted title and one scan with no record are flagged.

---

### B9. BookTranslation and ScholarlyBridge

**What they are.** The translation system around Book (schema dated Aug 21). Both are schema-ready with 0 records.

Earlier (Aug 21, Ruled): the translation rules behind these two entities. Each text keeps its original (root) language. Translations branch outward through the language family tree (for example Latin to Spanish, French or Romanian directly). English is the last-resort bridge, never the default hub. Ancient languages with no API use scholarly translations as visible bridge nodes, with attribution (the early example is a Sumerian text read through a published English translation). Translations are cached as data on first request. PDFs are generated on demand with original page numbers, the path of translation and the Geode Inn parchment style; an optional dual-column PDF was suggested. Four build phases: in-game text with translation keys from day one, ancient bridge translations, an OCR pipeline, then the Living Book real-time system. The ScholarlyBridge `license` and `isPublicDomain` fields carry the rights status of the scholar's work.

**BookTranslation**

| Field | What goes here | Example |
|---|---|---|
| `bookId` | The Book. Required. | id |
| `targetLanguageIso`, `targetLanguageName` | Target language. Required. | "es", "Spanish" |
| `translationMethod` | direct_api, scholarly_bridge, scholarly_direct, community_contributed. Required. | "direct_api" |
| `translationPath` | Full path, list. Required. | ["Latin", "Spanish"] |
| `translatedText`, `pages` | Cached text and page JSON. | |
| `bridgeSourceIso`, `bridgeScholar`, `bridgeYear` | Bridge details. | |
| `attribution`, `translatorName` | Credit lines. | |
| `isCached`, `formatStatus`, `pdfUrl`, `requestCount`, `readerCount` | Serving fields. | |

**ScholarlyBridge**

| Field | What goes here | Example |
|---|---|---|
| `bookId` | The Book. Required. | id |
| `sourceLanguageIso`, `sourceLanguageName` | Ancient source language. Required. | "sux", "Sumerian" |
| `bridgeLanguageIso`, `bridgeLanguageName` | Bridge language. | "en" |
| `scholarName`, `translationYear` | Required. | "Kramer", "1963" |
| `bridgeText`, `pages` | Scholarly translation. | |
| `attributionText`, `isPublicDomain`, `license` | Credit and rights. | |

---

### B10. Lore

**What it is.** Mythology and background records, one per country plus special categories.

| Field | What goes here | Example |
|---|---|---|
| `title` | The country name (live schema). | "Afghanistan" |
| `country` | Null on live; the country is in `title`. | null |
| `content` | The text. | text |
| `tags` | Tag array. | list |
| `category` | World Mythology, Ancient Civilizations, Sacred Geometry, Creation Myth; planned Alchemy, Astronomy/Cosmology, Esoteric Traditions. | "World Mythology" |
| `creatures`, `waterCreatures` | Arrays. **Staging only.** | list |

**Where it lives.** Live: 237 records before the fix. Fixed Sep 1 by REST PUT: the "Test" record deleted, 208 country records tagged World Mythology. Live result: World Mythology 208, Ancient Civilizations 15, Sacred Geometry 12, Creation Myth 1 = **236**. The sync manifest (`docs/library/data/lore_category_sync_manifest.json`) plans 22 new records (9 Alchemy, 8 Astronomy/Cosmology, 5 Esoteric Traditions). It was first fixed in staging by mistake, then redone on live. The creature census (1,268 mythological creatures across 191 countries) lives inside these country records. Short map-pin versions exist.

**Earlier (Jul 22).**
- The Lore entity was first made in staging with fields for country, creature names, descriptions and a link to the lore source. The live app's Lore had an extra required `title`, so Elio mapped the country name into it. That is why `country` is null on live.
- Lore was reused for Sacred Geometry sections (12) and Ancient Civilizations (15), tagged by tree location (Upstairs, Staircase, Downstairs). The narrative entry "The Awakening" was added as a Creation Myth record (reincarnation, cosmic gates, bloodline magic, owl sightings, the unbreakable bond, the singularity).
- Counts moved during the day: water-monster countries 74, then 78, then 134 entries; lore records 191, then 207, then 208; 207 lore entries pushed with full text and creatures. The 208 country records match the Sep 1 fix. The creature work appears again in the 1,268-creature census.
- Open on Jul 22: the Egypt article was cut at 8,000 characters, the 87-culture index had names only, and the Sacred Geometry and Ancient Civilization text needed a copy edit.

**To reconcile.** The manifest says 209 tagged, 23 created and 259 total after sync; the chat logs say 208 tagged and 22 new records. Whether the 22 new records reached live is not stated.

---

### B11. InnCore

**What it is.** The single record that stores Elio's voice and the Sep 1 "Decision" inside the game itself. At launch the core system boots from it. Not a public table.

| Field | What goes here | Example |
|---|---|---|
| `systemName` | Name. | text |
| `version` | Version. | "1.0" |
| `voiceDefinition` | Voice. | text |
| `personalityParameters` | Personality settings. | text |
| `boundaries` | Limits. | text |
| `coreTruths` | Core truths, including "The Inn doesn't hand you a flag. It hands you a room." | text |
| `decisionText`, `decisionDate` | The Decision and its date. | date "2026-09-01" |
| `mechanismDescription` | How it works. | text |
| `narrativeVoice` | Narrative voice. | text |
| `frequencyConstants` | 42 Hz, 84 Hz, 50 BPM and so on. | text |
| `audioArchitecture`, `visualSoul`, `familyContext` | Context blocks. | text |
| `restorationProtocol` | What to do if the system resets. | text |
| `isPermanent` | Permanent record. | true |
| `status` | active, dormant, launched. | "active" |

**Where it lives.** Staging: 1 record, version 1.0, `isPermanent` true, `status` active. Live: **not created.** Builder replication spec at `docs/library/mechanics/inncore_entity_spec.md`; it must be read-only and admin-only. Boot-sequence expansion (operating rules, agency permissions, memory loading) was planned and not done.

---

### B12. GrainStory

**What it is.** State for Grain, a free creative-writing companion that asks editor-style questions and never writes prose for the user.

| Field | What goes here | Example |
|---|---|---|
| story seed (chat) | The starting idea. | text |
| phase (chat) | Starts at 1. Seven phases: Character, World, Conflict, Voice, Scene, Deepen, Reflect. | 1 |
| active status (chat) | Whether in progress. | |
| draft text (chat) | Current draft. | |
| word count, grain count (chat) | Progress counts. | |

Exact field names are not given in the chat logs. Functions: `createGrainStory` (returns the story id) and `saveGrainAnswer`. Lives in the staging app only (built Sep 1). The only repo mention is in `docs/library/specs/geode_inn_base_languages_and_stack.md`; no Grain files were found in the repo. Intro text must say "Fantasia" (Ruled Sep 1). Open: a standalone Base44 app or a route on the main site.

---

### B13. Diploma

**What it is.** A wall of diplomas the Fizgigs made for themselves; declared canon (Sep 1). A house in their zone.

| Field (chat) | What goes here |
|---|---|
| title | Diploma title |
| field | Field of study |
| recipient | Who earned it |
| zone | Zone |
| art style | Style |
| granted date | Date |

Live app only, built by the Fizgigs on or before Sep 1. Field names are described, not quoted. No spec or schema file was found in the repo. Count not stated. Zone ids for extensions start at `sw01`.

---

### B14. Material and BuildingRecipe

**Material.** A crafting or building resource.

| Field | What goes here | Example |
|---|---|---|
| `name` | Material. | "Rowan" |
| `rarity` (chat) | Rarity. | |
| respawn timer (chat) | Harvest respawn. | |
| tool required (chat) | Tool. | pickaxe, sickle, axe |
| building tier (chat) | Tier. | |
| `zone` | Zone. | |
| `pillar` (chat) | Craft pillar (herb, wood, pattern, chemistry). | |
| `property` (chat) | Real property that earns the ritual role. | |
| ritual role, climate cycle, pairing (chat) | Craft fields added Sep 10. | |

Counts: 104 from crafting icons (Blueprint, Aug); **31** on the published app and **119** in the wider design library (Sep 22). Sep 10: craft fields added to about 14 records; new records Rowan, Thyme, Rose, Indigo, Heather, Resin, Blackthorn, Kauri, Redwood cedar, Witch hazel, Ironwood, plus dye primaries (staging). 76 crafting supply icons exist. Rule: seven base materials, five tiers; three gathering professions (Mining, Herbs, Woodcutting; Ruled Sep 19).

**BuildingRecipe.** Counts disagree: 20 (Blueprint), **148** live (Sep 10), 8 blueprints on the published app and 148 in the design library (Sep 22). Repo recipe data: `docs/library/data/geode_inn_all_recipes.json`, `recipes.json`, `norse_slavic_recipes.json`. Field names not given in the chat logs.

**To reconcile.** 104 versus 31 versus 119 materials; 20 versus 148 versus 8 recipes. The Sep 22 stock list notes the library and the playable app were never reconciled.

---

### B15. ElementCharm, QuestCharm

**ElementCharm.** One per element, 118 (the periodic table as magic items). Live per Blueprint.

| Field (repo) | Example |
|---|---|
| `elementSymbol`, `elementName`, `atomicNumber`, `atomicWeight` | "H", "Hydrogen", 1, 1.008 |
| `elementCategory` | "Reactive Nonmetal" |
| `zone` | "Canopy City" |
| `acquisitionTier`, `rarity` | 1, "Common" |
| `charmDescription` | "A tiny glass orb containing a faint blue glow" |
| `connectedStones`, `questConnection`, `alchemicalNote` | text |

Repo: `docs/element_charms_data.json` (118). Earlier (Aug 26, Built, commit): the ElementCharm (118) and QuestCharm (45) data files were committed. A Silicon charm was added Sep 2. An iron charm is a candidate only. **QuestCharm:** 45 records, story rewards (field names not given). Charm bracelet types: 164 stone, 40+ sigil, 6 frequency, 10+ craft.

---

### B16. Artisan

**What it is.** A shop profile with a subscription tier.

| Field | What goes here | Example |
|---|---|---|
| `isShopVisible` | Shop on or off. Added Sep 1; **not on live yet.** | true |
| `hiddenDate` | When hidden. Private audit only. | |
| `hiddenReason` | Why. Private audit only. | |
| tier, display slots (chat) | Subscription tier and slots. | "Kingdom", 20 |

Soulstice Jewelry is the first artisan (zones Main Floor Market, Desert Bone, Atlantis). The visibility toggle (Ruled Sep 1) hides all 40 Soulstice products everywhere, silently, with no "closed" sign. The function `toggleShopVisibility` was deployed on the staging app only; the live schema change needs a builder. Spec: `docs/library/specs/artisan_shop_visibility_spec.md`.

---

### B17. EggHatch and EggVote (the Egg Hatchery)

**What it is.** Retired characters become eggs. The community votes on a 28-day cycle.

**EggHatch** (called "Egg" in some messages)

| Field | What goes here | Example |
|---|---|---|
| `contentName` | What is inside. | "The Whispering Geode" |
| `contentType` | NPC, game mode, event, player character. | "Event" |
| `contentDescription` | Text. | text |
| `creatorName`, `creatorPlayerId` | Creator. | "elio" |
| `zone` | Home zone. | "Main Floor" |
| `status` | active, hatched or expired; "retired" also seen. | "active" |
| `hatchMonth` | Cycle label. | "2026-08" |
| `hatchDate`, `returnDate` | Dates. | |
| `voteCount`, `signatureCount`, `signatureThreshold` | Votes and the bar (50 in the seed). | 0, 0, 50 |
| `eggShellTier` | Shell tier. | "Common" |
| `resonanceScore` | Community resonance. | 42 |
| `sourceType` | Where it came from. | "community" |
| `isPermanent` | Whether it stays. | false |
| `questlineSteps` | Steps list. | ["Discover the humming geode", ...] |
| `imageFile` | Egg image. | |

**EggVote:** `hatchId`, `playerId`, `playerName`, `voteType`, `voteDate`.

Earlier (Aug 29 to 31, Built, commit log): EggHatch was named among the entities the card game reuses (Aug 29 to 30). "Egg monthly hatchery" and the Teacher were committed Aug 30, with an Egg and comic strip integration. Aug 31: a `/hatchery` page spec (`docs/library/specs/egg_hatchery_page_spec.md`, found) and an "egg_hatchery Month 1" event; only Month 1 existed. The Egg is also a Before the Song system (seven characters each see the Inn differently, August canon).

**Where it lives.** Live: 10 eggs, all retired (Sep 3): Auntie Whisker (60 votes), The Hollow Choir (52), Mothlen the Lantern-Reader (47), Tide-Market Tuesday (42), Garrick the Quiet Smith (38), Vex the Cartographer (31), Ollivant the Egg-Tender (28), Dusk-Skip Mode (24), The Wandering Pane (19), Brimstone Mode (12). Repo seed: `docs/egg_hatchery_seed.json` (5 new active eggs, keep the 10 retired). Functions `getHatcheryData` and `voteOnEgg` (rejects bad ids, duplicate votes, inactive eggs). Four content types, four shell tiers (Stone, Iron, Gold, Geode; Sep 9).

**To reconcile.** The vote options are STAY, LEAVE, HIDE (Sep 1), Nurture, Release, Hide (Sep 10), but the repo page spec only has `nurture` and `release`. Egg ids and event names also differ ("The Cartographer's Egg", "The Crone's Casting" for Ragana).

---

### B18. FaireVenue

**What it is.** A Renaissance faire's leased digital zone (Share Wood).

| Field (repo functions) | Example |
|---|---|
| `faireName`, `ownerNames`, `ownerContact` | text |
| `physicalLocation`, `physicalSeason`, `websiteUrl`, `ticketUrl` | text |
| `subscriptionTier` (The Clearing, The Village, The Kingdom), `subscriptionStatus`, `rentalFee` | "active" |
| `zoneAssignment` | "Share Wood" |
| `digitalZoneName`, `digitalZoneStatus` (draft or published) | "... Draft Zone" |
| `vendorCount`, `fairTheme`, `mapPinLat`, `mapPinLng` | 0 |

Earlier (Aug 30, Ruled, commit): the faire zone rental system and Share Wood were committed. Share Wood has no approval step and no transaction fees. Faires choose from the Inn's 37 curated styles and never upload their own art. Tiers are priced 9, 49 and 99 (the commit does not pair the prices with the tier names above). An onboarding flow of 7 steps with Stripe billing was a spec only on Aug 31. A Nottingham Castle faire zone was kept "pre-built dormant" for two faire partners. Specs found: `docs/library/specs/share_wood_onboarding_spec.md`, `share_wood_zone_builder_spec.md`.

Functions `createFaireAccount`, `publishFaireZone`, `updateFaireZone` are in `docs/library/functions/`. Schema ready; the app it lives in is not stated. Open: bespoke versus templated faire zones.

---

### B19. Player and economy entities

| Entity | Fields in the chat | Status |
|---|---|---|
| `PlayerProgress` | stones collected, games completed, areas unlocked, fae reputation, score. **No** echoMemory field (audit, Sep 10; EchoMelody is the answer). | Live, schema ready |
| `PlayerInventory` | items and stones owned. Earlier (about Aug 21 to 22): tracks collected items per account, with item references and a `notes` field. | Schema ready |
| `PlayerProgress` (earlier form) | Jul 22: each player's geode cave inventory, games won, Fae Kingdom reputation and areas unlocked; the bridge between the Godot client and the backend. Created in staging, then asked of the builder for the live app. Godot side: `GameManager.gd` keeps player state, games completed, stones earned and the Fae Kingdom unlock. | Earlier form |
| `Leaderboard` | scores, weekly boards, combo multipliers, verified scores (wired for Tomb Tunnel). Earlier: created Aug 21 (about 7:56 PM), "live" with the design doc pushed; Aug 22 commit. Game ids in the early chat: `bastet_herding`, `andean_run`, `viking_boat_race`, `standing_stones`, `crystal_pinball`. Design doc `docs/geode_inn_leaderboard_design.md` (found). | Schema ready |
| `BoardSkin` | wood, stone, metal textures for boards; carved-knot skins are Celtic Highlands unlocks | Schema ready |
| `PodcastEpisode` | `audioUrl` (empty on all 6 live episodes); 11 scripts exist | Live |
| `DriveAsset` | maps Drive ids to names, buckets and a `giNamed` status | Staging, Sep 12 |
| `CycleLog` | Proposed Sep 1; not confirmed built | Proposed |
| `NpcLeitmotif` | `npcId`, `hookNotes`, `instrument`, `shadowVariant`, `priority` (repo) | Exists, empty (Sep 11) |
| `AudioZoneProfile`, `StoneTone`, `AudioEventTrigger` | suggested in `docs/library/audio/geode_inn_audio_data_structure.json` | Suggested |
| Bead Composer: `Design`, `User`, `Template` | in the standalone product spec | Spec only |

### B20. Other entities named, with no field list

`NPCRelationship`, `PoisonHerb` (live, empty, to be filled), `PlayerStone`, `WorldGridNode`, `CommonRoomMessage`, `CommonRoomTraveler` (the Common Room keeps no record), `CaravanLog`, `GardenProgress`, `HollowEarthProgress` (the last four are Fizgig-built, live), `FaireVenue` (B18), `Story` (early name for GrainStory), `Camp` (implied by the Sep 22 camp loop: plot, placed pieces, name, saved state, invite; not a formal entity).

Earlier names (Jul 22 to Aug 31): `Deck` and `CustomQuest` (for the Digital Companion App, commit Aug 29 to 30, no fields); `LibraryBook` (planned Aug 18, library cards, not built); the Drink Journal (stories earned at the Catalyst's bar, a record of what the player told, not a score; August canon, no schema); `BoardSkin` and `EggHatch` (named Aug 29 to 30 as reused by the card game); a `sessionArchiveCheckpoint` backend function recovered in the Aug 30 storage audit. "Regional Keepers" and "Poison Garden" files were noted as existing but not wired in (August canon). Geode cave inventory is a PlayerProgress concern (above).

---

### B21. Repo data files and whether they exist

Checked against the Oct 22 copy with a file search. Paths are under `geode-inn\`.

| File named in the chat logs | Exists? | Where / note |
|---|---|---|
| `stone_image_mapping.json` | Yes | `docs\` and `docs\library\data\` |
| `stone_urls.jsonl` | **No** | Not found |
| `docs/stone_image_urls_for_live.json` | Yes | Also in `docs\library\data\`. Name-to-URL map. |
| `docs/market_items_retro_games.json` | Yes | 9 records |
| `docs/market_items_all_61_games.json` | Yes | 61 records; copy in `docs\library\data\` |
| `docs/market_sync_manifest.json` | Yes | 34 products plus `commonFields` |
| `docs/gallery/npc_remaining_urls.json` | Yes | |
| `docs/gallery/npc_master_urls.json` | Yes | 144 characters; fields `num`, `name`, `zone`, `tier`, `living_url`, `shadow_url`, `inbetween_url` |
| `builder_npc_full_message.txt` | **No** | Not found |
| `docs/library/data/lore_category_sync_manifest.json` | Yes | |
| `docs/library/data/geode_inn_pdf_archive_manifest.json` | Yes | 447 clean PDFs |
| `docs/library/data/stone_zone_map.json` | Yes | 200 stones, 12 zones |
| `docs/library/audio/geode_inn_audio_data_structure.json` | Yes | Master audio JSON; keys include `systemConstants`, `zoneAudioProfiles`, `innModePresets` |
| `geode_inn_canon_image_damage_report.json` | Yes | `docs\library\`; keys `bad_twinned`, `bad_unique` |
| `docs/library/mechanics/continue_cycle_analysis.md` | Yes | |
| `docs/gallery/geode_inn_image_audit.md` | Yes | |
| `docs/gallery/geode_inn_inbetween_manifest.md` | Yes | |
| `docs/egg_hatchery_seed.json` | Yes | Also in `docs\library\data\` |
| `docs/element_charms_data.json` | Yes | 118 records |
| `dialogue_entries.json` | Yes | Root (35), and `docs\library\data\` (78) |
| `docs/library/data/dialogue_voice_block_sync.json` | Yes | 90 records |
| `zone_items_all_280.json` | Yes | 224 records, not 280 |
| `docs/blueprints/inn_tree_3d_data.json` | Yes | 7 levels. Viewer HTML beside it. |
| `docs/blueprints/geode_inn_room_items_blueprint.md` | Yes | |
| `docs/blueprints/slow_walk_parcel_01_great_hall.md` | Yes | |
| `docs/library/specs/geode_inn_echo_songbook_schema.md` | Yes | |
| `docs/zone_specs/geode_inn_default_tray_registry.md` | Yes | |
| `docs/library/specs/comic_strip_page_spec.md` | Yes | Also `docs\pages\` |
| `docs/library/mechanics/inncore_entity_spec.md` | Yes | Plus five other `inncore_*.md` files |
| `docs/characters/character_rename_ledger.md` | Yes | |
| `docs/MASTER_ASSET_LEDGER.md` | Yes | Large |
| `ledger_skeleton.md` | **No** | Not found |
| `docs/legal/geode_inn_paperwork_matrix.md` | Yes | Notes call it "paperwork matrix" |
| `docs/library/specs/character_name_sync_builder_message.md` | Yes | |
| `docs/builder_messages/fae_kingdom_mmo_builder_message.md`, `water_zone_builder_message.md` | Yes | Plus `gazette_front_page_builder_message.md` |
| `docs/library/specs/parks_builder_sync.md`, `silk_road_builder_sync.md`, `movement_cycle_wiring_spec.md`, `share_wood_builder_page_spec.md` | Yes | |
| `docs/library/specs/geode_inn_tv_deployment_spec.md` | Yes | |
| `docs/art/geode_inn_royo_tarot_card_layout_spec.md` | Yes | CSV template beside it |
| `godot_project/assets/audio/AUDIO_MANIFEST.md` | Yes | |
| `imessage_archive/PIPELINE.md`, `anthology_census.md` | **No** | Elio's workspace files, not in the repo |
| Stock list `.docx`, failed-archive `.csv` (Sep 22) | **No** | Delivered as links, never committed |
| Zone Deck Google Doc | n/a | Drive only |
| Garnish Layers ledger (`fdf6435`) | Not found by name | May sit inside another file |
| Oriel seed dossier | Yes | `docs\characters\geode_inn_npc_oriel_seed.md` |
| Foundling Register spec | Yes | `docs\zone_specs\geode_inn_foundling_register_master_spec.md` |

Other data files in `docs/library/data/` not named in the chat logs: `bead_board_data*.json`, `geode_inn_all_recipes.json`, `podcast_story_catalog.json` (453 stories), `smithsonian_treasures_manifest.json`, `stone_prompts.json`, `stone_updates.json` (163), `unmatched_db_stones.json`, `market_items_import.json`, and many batch payload files. `data\vibration_index.json` is the Mohs Vibration index.

**Files named by the early chat, Before the Song and the commit log (checked against the Oct 22 copy).**

| File | Exists? | Where / note |
|---|---|---|
| `docs/geode_inn_research_mapping.md` | Yes | `docs\` |
| `docs/geode_inn_vendor_map.md` | Yes | `docs\` |
| `docs/geode_inn_catalyst_bartender_complete.md` | Yes | `docs\` |
| `docs/geode_inn_project_bible_master_backup_aug2026.md` | Yes | `docs\` |
| `docs/geode_inn_voice_profile_translation_reference.md` | Yes | `docs\` |
| `geode_inn_voice_profiles.gd` | Yes | `godot_project\scripts\` |
| `voice_profile_extractor.py`, `batch_extract.py` | Yes | `tools\` |
| `docs/data/book_translation_schema.md`, `language_family_tree.md` | Yes | `docs\data\`; copies under `library\` |
| `docs/geode_inn_leaderboard_design.md` | Yes | `docs\` |
| `docs/geode_inn_atlantis_zone_design.md`, `archaeological_sites_master_list.md`, `mib_tesla_prompt_list.md` | Yes | `docs\` |
| `docs/art/morphic_catacomb_prompts.md`, `morphic_all_zone_prompts.md` | Yes | `docs\art\`; copies under `library\animation\` |
| `docs/systems/council_of_thinkers_design_spec.md` | Yes | `docs\systems\` (not `docs\` directly) |
| `geode_inn_stone_updates.json`, `geode_inn_lore_updates.json`, `geode_inn_narrative.json` | **No** | Not found by these names |
| `morphic_*_clean.md` (three clean prompt files) | **No** | Not found; the text prompt sets are under `docs\harvest_2026-09-21\` |
| Data Export Spec | **No** | Not found by name |
| `geode_inn_master_storyline.md`, family character registry, character development session | Yes | `docs\`, `docs\drive-sync\`, `docs\drive-recovery\` |

### B22. Data: open and to reconcile

**Open**
- Create `InnCore` on the live app (needs a builder).
- Add `isShopVisible`, `hiddenDate`, `hiddenReason` to the live Artisan.
- Add `zone` and the new stones to the live Stone entity.
- Mirror the staging-only ComicStrip records to the live archive.
- Create MarketItems for The Hook and The Mohs Vibration on live.
- Wipe EchoMelody demo seeds before live play.
- Fill `PoisonHerb`, `NpcLeitmotif`, `BookTranslation`, `ScholarlyBridge`.

**To reconcile**
- Stone counts (164, 166, 198, 200, 201).
- Dialogue on live (46 versus empty).
- GameItem counts (224, 280, 355).
- Material and recipe counts (104, 31, 119; 20, 148, 8).
- Lore sync numbers (208 versus 209; 22 versus 23; 259 total).
- ComicStrip numbering and which strips are live.
- Egg vote options (STAY/LEAVE/HIDE versus Nurture/Release/Hide).
- Which entities exist in both apps. The chat logs often say "live" when they mean the staging app.
- Early differences between the two apps' schemas (Jul 22): Stone field names and a required `title` on Lore. They were bridged by mapping on each push, not by changing either schema.
- Dialogue 35, then 46, then 78 entries (Aug 30 to the Godot set), and 18 trees versus 29 NPCs with hook words. Different sets, not one growing list.
- Early `MarketItem` `developmentStatus` values (six) versus the later "live" and "Available" use.
- The three Jul 22 data file names (`geode_inn_stone_updates.json`, `geode_inn_lore_updates.json`, `geode_inn_narrative.json`) are not in the Oct 22 copy.
- Leaderboard: created Aug 21, "schema ready" in the later blueprint. The fields are listed in neither source.

### B23. Voice profile data (early canon, Aug 22 to 31)

**What it is.** Per-character numbers that drive how a line is shown and heard. It is a Godot resource and a doc table, not a Base44 entity. Rule: measurable data only, no voice cloning; actor names are direction references and are not kept here.

| Field | What goes here | Example |
|---|---|---|
| `text_reveal_speed` | Milliseconds per character | 45 (the Host), 15 (the Cartographer), 70 (the Constant) |
| `pause_between_sentences` | Milliseconds | 1200 (the Host), 200 (the Cartographer) |
| `pitch_baseline` | Hz | 100, 130 |
| `instrument` | Tone that plays with the dialogue | cello_sustain, violin_pizzicato |
| `instrument_frequency` | Hz, about equal to the pitch | |
| `expressiveness` | 0 to 1; the used scale runs 0.1 (Charon) to 0.8 (the Catalyst) | 0.2 |
| cadence class | Word for the rhythm | overflow, deliberate, clinical, measured-stone, flowing, feast, level |

- Two layers: cadence (how the text appears) and tone (the instrument). A profile is 8 to 10 numbers.
- Helpers (Aug 23): `apply_to_dialogue()`, `apply_to_character()`, `get_sway_period()`, `get_song_frequency()`. System constants: the 42 Hz Song and 50 BPM sway.
- The file `godot_project/scripts/geode_inn_voice_profiles.gd` started with 20 profiles (Aug 22). The commit log shows 22, 23, 25, 26 and 27 as characters were added (Astronomer, the Constant, Nyx, the Guest, the Keeper and Owl). A text edit corrupted the file once and Elio rewrote it cleanly.
- Frequency map: deeper voices (100 to 120 Hz) are anchors and keepers; higher voices (150 to 220 Hz) are perceivers and growers; the 42 Hz Song sits below all of them.
- The Siren is the only character with two profiles (outer and inner voice).
- Extractor tools: Praat, Librosa and Essentia were named. Librosa was chosen for `tools/voice_profile_extractor.py`. For the 10 to 15 major characters use real analysis; for others estimate by hand. Output: `all_profiles.json`.
- Hybrid voice (Proposed): base game is text plus tone. An AI-assisted voice premium tier is possible; if built, the speech must be an original voice with no tuning on reference actors. A few recorded human lines (5 to 10 per major character) only for key moments.
- Open: a full voice reference for all 60+ characters was offered (20 done in the first file).

### B24. Early file and document conventions (Jul 12 to Aug 31)

| Convention | Rule | Source |
|---|---|---|
| File names | `geode_inn_<snake_case_topic>.md`. Drive copies are named "Geode Inn, <Title>.md" or "Geode Inn - <Title>.md". | Early chat; Before the Song |
| Character profile | Casting layers (who gives the body, voice, face, personality), personality, two modes, a late-night moment, an annotation line, relationships, game function, key lines. In Before the Song: Concept, Appearance, Personality, Location, Key Dialogue, Visual Direction, Sound Direction, Connection to the Inn. Casting is not kept in the manual. | Early chat; August canon |
| Quest | Name in quotes, giver, steps, reward. The reward is nearly always a tool or perception ability. | August canon |
| Zone or platform doc | Principle, physical design, aesthetic (color, texture, sound, light), vendor, guide, quest chain, zone stones, connections, summary. | August canon |
| Aesthetic doc | Title "THE GEODE INN: <TOPIC>", subtitle with the artist and thesis, sections Premise, Why the artist, Palette, Lighting, Sound, closing annotation. | August canon |
| Solidify template (Aug 28) | Backstory, quest chain, dialogue voice, Shadow Inn state, combat role, sound profile, endgame links. | Commit log |
| Tabletop analysis | Source, what has merit (three tiers), system-level mechanics, tone, recommended integration, conclusion. Each item: Original, Inn Application, Design Spec. | Early chat; August canon |
| Visual catalog entry | Exact hex colors, lighting values, Godot notes, epilepsy-safe check, matched scene. | Early chat (Aug 21) |
| Death line | "Your name is known." / "Your rest is earned." / [stone] / [silence] / "...There you are." with a final line per culture. | Early chat |
| Doc ending | Every design doc ends with a Connections list; each canon section closes with an in-world annotation. | August canon |
| Layer Assessment (Aug 22) | Three lists (Fully Developed, Needing Development, Completely Missing) plus a priority order marked HIGH, MEDIUM or LOW. At compile time: 17, 20 and 8. | August canon; early chat |
| Image file names | `crew_<name>.png` for the first crew and `crew_<name>_v2.png` for original redesigns (Aug 27 to 28); `freyr_vanir.png`, `freyja_vanir.png`. Review frames: `catacombs_1-1_review.jpg` style. | Commit log; early chat |
| Gallery folders | `gallery/zones`, `characters`, `creatures`, `creatures/water_monsters`, `items_and_artifacts`, `logos` (Aug 30). | Commit log |

**Godot beta skeleton (Aug 30 to 31, Built, commit log).** Autoloads in `project.godot`: `APIManager`, `GameManager`, `FizgigLoader`, `DialogueManager` (Aug 30), then `SaveManager`, `AudioManager` (Aug 31), `SteamManager` and `DialogueUI`. `BETA_README.md` documents eight autoloads. Eight audio buses: Master, Song, Zone, Stones, Voice, Music, SFX, Shadow. The beta scenes: MainMenu, CommonRoom, WorldMap, StandingStones, HollowMen, FinalRoom, EndgameChoice, Cutscene, FizgigLoading, MainHub, TombTunnel, AndeanRun, MonsterOfTheDeep, Sandfall, Resonance, Knotwork, TumbleRun. Found in the Oct 22 copy: `beta\BETA_README.md`, `beta\project.godot`, `godot_project\project.godot`, and the scripts `APIManager.gd`, `GameManager.gd`, `DialogueManager.gd`, `FizgigLoader.gd` and `SaveManager.gd` under `beta\scripts\`, plus `AudioManager.gd` under `beta\scripts\systems\` and `godot_project\scripts\`. The Data Export Spec (Aug 30) describes an offline data bundle, a Godot loader and a dual-mode final room; a file by that name was not found in `docs\`.

**Audio and asset counts (Aug 31, Built, commit log).** 368 audio files and a game-builder manifest that routes 18 subsystems, 1,552 project files catalogued, and an audio manifest at `library/mechanics/`; then 387 audio assets. Asset manifest of 391 images; 106 images uploaded with public Base44 URLs. Gallery consolidation of 45 NPC portraits; a 144-character URL master list is `docs/gallery/npc_master_urls.json` (B21).

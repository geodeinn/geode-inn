# Part 8: The Audit: What Isn't in GitHub, What's Open, What Conflicts

This part is the audit behind the manual. It has four sections:

1. What was built with Elio but is not confirmed in GitHub.
2. Every open item (unruled gates, pending names, waiting tasks).
3. Every conflict between sources that needs a ruling or a check.
4. The decision log, by date.

## How to read this part

- **Ruled** means the client decided or agreed. **Proposed** means Elio suggested and there was no ruling. **Open** means waiting on the client.
- Sources are the whole Elio chat (Aug 31 to Oct 15, 2026), a check of every file name mentioned in the chat, and the local repo copy dated Oct 22.
- "In the repo copy" means a file with that name was found with a name search. A spec can still exist inside another file under a different name. Where this matters it is said.
- Commit hashes in the chat logs could not be checked (not yet checked against the repo history). They are collected in one table in section 1.6.
- Nothing here claims a thing is missing from GitHub itself. It claims only that the Oct 22 local copy has no file of that name, or that the chat logs never say it was pushed.
- The audit now also covers July 12 to August 30: the early chat (July 12 to about August 23), Before the Song (the compiled canon document of late August) and the commit log (August 21 to 31). Early items are marked "(early period; not seen after Aug 30)" in section 2, are dated in sections 3 and 4, and are checked against the repo in section 1.7. The chat for Aug 22 to 30 is missing, so rulings for those days come only from commit messages.

### What the file list shows

A check of every file name in the chat lists 695 file names mentioned in the chat. Of these, 603 have no file of that name in the repo copy. Only 21 have a Drive path.

| Kind of unmatched name | Count | Note |
|---|---|---|
| Images (png, jpg, webp, gif) | 549 | See 1.4 |
| Zip files (tabletop asset packs) | 19 | Went to Drive by design |
| Markdown files | 11 | See 1.3 |
| Word files | 4 | See 1.2 |
| PDFs | 8 | Mostly archive scans |
| HTML files | 4 | Grain prototypes, TV splash, login page |
| JavaScript files | 2 | `TVRemoteInput.js` (offered, never written), `three.js` |
| Other (txt, csv, mp3, mp4, jsonl) | 6 | See 1.2 and 1.3 |

---

## 1. Built with Elio but not confirmed in GitHub

Each entry gives what, date, where it lives now, and what to do. Items the chat logs say were pushed, and that the repo copy confirms, are not repeated here.

### 1.1 Base44 records that exist only in one app

Elio worked in its own staging app ("the Elio app"). The live Geode Inn app is the builders' app. Elio could not write across apps (it said so on Aug 31, Sep 1, Sep 19, Sep 23, Oct 14), so some records exist only in staging. Records Elio wrote to the live app directly through the REST interface are listed separately below.

**Update, October 30.** Every kind of game content in both apps was copied, and is in the repo in `docs/base44_data/` (InnCore is left out because it is already in `docs/library/mechanics/`, and player and user data is left out on purpose). The Elio app's Dialogue records and two strips carry personal details in places, so they went in on October 31, once the repo was private. The copy confirms this table. In the Elio app, 384 of 557 Dialogue records, 105 of 119 Materials, 139 of 148 Building Recipes, 112 of 201 Stones, 75 of 355 Game Items and 22 of 47 Comic Strips had text found nowhere else in GitHub; on the live app, all 19 Steam titles and all 6 podcast episodes. `docs/base44_data/missing.md` lists them by name. The table below is kept as the record of what the chat said.

**Staging app only (or live status not shown)**

| What | Date | Where it lives now | What to do |
|---|---|---|---|
| Dialogue entity: 393 records at the Aug 31 backup, 398 on Sep 3, 524 growing to 529 or more on Sep 10 (voice blocks Batches 1-9, Masquerade, Einherjar, Five Smiths, Council, philosophers, Examiner/Wren/Soma/Saker) | Aug 31 to Sep 10 | Elio staging app. Live Dialogue entity was empty on Sep 3. A voice-block sync file exists in the repo (`docs/library/data/dialogue_voice_block_sync.json`) but its coverage is unchecked. | Export the full staging Dialogue entity to JSON in `docs/library/data/` and compare with the repo sync file. Confirm whether builders imported any to live. |
| Reserved player slots FOLIO and Greg | Sep 10 | Staging only | Export; add to the dialogue/roster data. |
| Stone entity: Stillness Stone and Octave Stone (count 200), `zone` field on all 200, amazonite (#201), mind/body text for 55 stones | Sep 4, Sep 10 | Staging app; `stone_zone_map.json` and md batch files said to be in the repo. Live app has its own Stone copy with 34 stones missing (Aug 31) and no images or coordinates. | Export Stone records. Ask builders to add `zone` to the live schema. Confirm live count. |
| Material entity: craft fields on about 14 records; new records Rowan, Thyme, Rose, Indigo, Heather, Resin, Blackthorn, Kauri, Redwood cedar, Witch hazel, Ironwood; dye primaries | Sep 10 | Staging | Export to `docs/library/data/`. Remaining woods and herbs still owed. |
| EchoMelody entity and 3 seed records; "The Rocky Road to Dublin" entry | Sep 11, Sep 17 | Staging database. Notes say "went to the database, not the repo". No EchoMelody file found in the repo copy. | Export records and the entity schema; write a short spec file. |
| GameItems: 71 new records (total 355) and 5 Dialogue records (Speter Adams, Anna, Jay, Clockmaker, Blacksmith) | Sep 1 | Staging; "not in live" | Export; decide what builders need. |
| MarketItems: 9 early retro-game records and the 61-game set; The Hook and The Mohs Vibration records still to be created live; 39 products with null prices and photos on live | Aug 31, Sep 1 | Manifests are in the repo (`market_items_all_61_games.json`). 62 items were pushed to live on Sep 1 (101 on live). | Confirm live count against the manifest. |
| Book entity: 11 extra books (Gentleman's Magazine, American Journal of Science, Agrippa, Bakerian, Yale Medical texts) and 165 identified mystery-pile books | Sep 1 | 165 were pushed to live by REST. The 11 are in staging with a sync manifest; live import was waiting on builders. | Check whether the 11 reached live. |
| ComicStrip records for strips #014, #016, #018 (cross-app write refused), #022, #033, and #011 | Sep 19 to Oct 14 | Elio app only. As of Oct 14 the published Geode Inn app archive held only strips #1 to #3. | Builders need to enter these by hand or write a live-side function. See the strip table in section 3. |
| Six first Gazette records ("6 ComicStrip records created") | Sep 1 | Notes do not say which app. Live was empty. | Check live; reconcile with strip #1 to #3 numbering. |
| TrayTemplate entity: 6 default tray records | Sep 13 | Notes say "repo + live entity". Unverified. | Spot-check the live app. |
| Grain: `GrainStory` entity, `createGrainStory`, `saveGrainAnswer` | Sep 1 | Elio app and public file links. The prototype HTML files are not in the repo copy. | Decide if Grain stays a separate app. Export the HTML and function code if so. |
| InnCore entity (the 9th failsafe layer) | Sep 1 | Created in staging. Builder spec is on GitHub. Needs creating and filling on live. | Builders to create; confirm. |
| CycleLog entity | Sep 1 | Proposed. Never confirmed built. | Drop or build. |

**Written to the live app directly by Elio (REST)**

| What | Date | Note |
|---|---|---|
| Lore fix: Test record deleted, 208 nulls tagged "World Mythology"; Alchemy, Astronomy-Cosmology, Esoteric records added (22 in manifest) | Sep 1 | Manifest in repo. Live total reported as 236 Lore. |
| Book imports: 168, then 178, then 625 books (plus 236 Lore equals 861 entries) | Sep 1 | Manifest updated in repo. |
| 62 MarketItems (61 games and 1 jewelry) | Sep 1 | Manifest pushed. |
| Library cleanup: 323 placeholder Book titles replaced by real titles; paper trail committed | Oct 5 | Backup of placeholders was taken first. |
| Parchment Lore: 282 essay records (library total 907 books) | Oct 5 | Shelf JSON in repo (`geode_inn_parchment_lore_shelf_2026-10-05.json`). |
| Gazette strips #1 to #3 | Sep 12, Sep 13 | The only strips the live archive held on Oct 14. |

### 1.2 Documents and exports that went out as download links

| What | Date | Where it lives now | What to do |
|---|---|---|---|
| `Geode_Inn_Character_Assignment_v4.docx` (19 MB, thumbnails) | Sep 1 | Google Drive and Base44 storage. GitHub not said. | Keep on Drive; note the Drive path in `docs/INDEX.md`. |
| `Geode_Inn_Canon_Image_Library.docx` (90 MB, 1,020 images in 15 sections, 156 damaged files listed) | Sep 15 | Not in the shared Drive folder as of October 29. Only the damage report JSON (`geode_inn_canon_image_damage_report.json`) is in the repo. The client has saved the canon pictures as 343 JPEGs (Drive: Game Images > images for the canon), set up for GitHub under `docs/canon_images/` (Part 3, 1.8). | Decide whether any of the other images in the 1,020 are still wanted. |
| `campgrounds_materials_blueprints_stocklist_2026-09-22.docx` | Sep 22 | Seven-day download link; it expired Sep 29. Never moved to Google Docs. Not in the repo. | Ask Elio to re-export and add to `docs/`. |
| `tabletop_failed_archive_index_2026-09-22.csv` (68 archives with failed counts) | Sep 22 | 24-hour link, expired. | Regenerate only if the retry pass is still wanted (see 2.12). |
| `vol_01_2026-09-30.pdf` and later transcript volumes ("Inn Transcript Archive") | Sep 30 on | Private Base44 link (1-hour expiry); Google Docs and PDFs in Drive folder "Inn Conversation Archive". The workflow was still compiling volumes at last report. | Confirm the Drive folder is complete. |
| Royo Tarot batch 01: zip of 157 cards (42.5 MB), small test pack, 3 later cards (158 total) | Sep 16, Sep 18 | Base44 files, then Drive "Royo Tarot Cards - Batch 01". GitHub not said. The layout spec and data CSV are in the repo (`docs/art/`). | Keep on Drive. 11 cards failed on null-stripped Aug 28 files. |
| Full Image Index and Folder Summary sheets (4,455 images in 3,556 folders) | Sep 14 | Drive "Geode Inn - GitHub Backups". GitHub not said. | Export as CSV to `docs/library/data/`. |
| Zone Deck Google Doc "Components & Characters" (85 zones) | Oct 13 | Drive "Geode Inn-master build". Sources are repo docs. | Export to Markdown if builders need it. |
| `builder_npc_full_message.txt` (37,000 characters) | Sep 1 | Emailed to the client; manifest on GitHub. Text file not in the repo copy. | Add to `docs/builder_messages/` if the message is still current. |
| Builder batch email (6 systems) and the audit/manifest email | Aug 31, Sep 1 | Email only. | Nothing to add unless the content is not already in specs. |
| Inn Tree 3D viewer public links on Base44 | Sep 25 | Viewer HTML, data and guide are in the repo (`docs/blueprints/`). The tap-to-enter version is said committed (76063550). | Compare repo viewer with the Base44 copy. |
| `Upstairs.docx` (client Drive, "02 Upstairs") | Oct 12 | Drive path shown in the file list. | None. Source reference. |
| Tabletop battle-map pipeline output (Drive zone folders) | Sep 21 to Oct 15 | Drive only, by design. Never a GitHub item. | Keep a one-page index in the repo. See the pipeline tallies in section 3. |
| Images generated for Oct 14 ("Inn Generated Art") | Oct 14 | Drive folder only. | Log in `docs/MASTER_ASSET_LEDGER.md`. |

### 1.3 Files Elio wrote to its own library, notes or memory

| What | Date | Where | What to do |
|---|---|---|---|
| `notes/for-you/main.md` ("For You" board): checkpoints, approvals, standing decisions, launch architecture notes, 15 canon entries per daily checkpoint | Aug 31 to Oct 15 | Elio Notes in Base44. Later checkpoints say "no GitHub commit needed". | Export the full board to `docs/` once. It is the only copy of several standing decisions. |
| Daily archive checkpoints | Daily | Notes; auto-committed to git on Oct 2/3 only | Same export. |
| `krista_timeline.md` (private autobiography shorthand) | Sep 2 | Elio private storage, intentionally not GitHub | Leave private. Out of scope for the manual. |
| `notes/the-question/mechanism_layer.md` | Sep 1 | Deliberately not on GitHub | Leave private. |
| `SOUL.md`, `IDENTITY.md`, `USER.md`, `elio_voice_decision.md`, five nature files | Sep 1 | Elio notes, Drive "Project Bible" folder, Base44 public storage. The decision doc is on GitHub. The first three names have no match in the repo copy. | Decide what belongs in the game repo (InnCore) and what stays with Elio. |
| `anthology_census.md` and the image-gap side list | Sep 30 | Elio library. Census "not started beyond file creation" at Oct 8. No match in the repo copy. | Finish or drop. |
| `zone_image_inventory_2026-09-25.md` | Sep 25 | Elio workspace. No repo match. | Add to `docs/` or fold into the asset ledger. |
| `imessage_archive/PIPELINE.md` and progress state | Sep 30 | Elio library | Keep with the archive workflow. |
| Casting bench ledger (63 image/media files logged as "stones" with notes) | Sep 26 | Elio library. GitHub not said. | Export. Stone numbers here (Stone 11, 22, 29, 49) are bench numbers, not Stone entity numbers. |
| Classical chapter map; Anthems register; Maximilian's Masterplan and classical originals wing | Sep 28 | "Saved" or "filed"; no location or commit given. No `anthems` file in the repo copy. | Ask Elio where they sit; add to `docs/library/`. |
| Elio memory entries (Merlin, siren, Davy Jones, bickering pair, platypus zone seed, silo shapeshift seed, female room, zone sound rulings, and more) | Sep 25, Sep 26 | Elio memory. Not GitHub. | Ask Elio to dump the game-relevant ones to a file. |
| Sub-agent reports: zone/critter audit, stock list census, storyline card deck (4 agents), interlace dossiers (4 agents), roster extraction and image inventory workers | Sep 13 to Sep 29 | Results were "pending", "truncated" or "not delivered" at the end of each session. | Ask Elio whether any result was finished. If not, rerun only what is still wanted. |
| Master audio doc: client's zone sound rulings of Sep 26 | Sep 26 | Offered twice, never folded in | Fold in. See 2.9. |
| `ledger_skeleton.md` | Sep 9 | Said pushed with the Master Asset Ledger; the ledger itself is in the repo, the skeleton file name is not | Low priority. |

### 1.4 Images that are only in Base44 storage or Drive

The file-name check found 549 image names with no match in the repo copy. They are not listed here. The naming patterns:

| Pattern | Count | What they are |
|---|---|---|
| `<hex>_imessage_media_<hex>.jpg/png` (also with a second hex prefix) | 82 | Photos and screenshots the client sent in chat (Aug 31 to Oct). Mostly reference, not canon art. |
| `<hex>_<N>.jpg` and `<hex>_<hex>_<N>.jpg` | 62 | Uploaded intake images, many from the Sep 12 mystery pile |
| `evan_image_N.jpg`, `evan_zone_character_art_N.jpg` | 15 | Images from the "S-stack" named for the earlier Archivist name (the Archivist is now Harry). Which are current keepers was never ruled. |
| `<hex>_sheet_N.jpg`, `panel_N.png`, `archivist_prototype_bone_critter_N.jpg`, `baby_dragon_comic_N.jpg` | 16 | Contact sheets, comic panels, prototypes |
| One-off descriptive names | about 370 | Generated art, portraits, zone panels, sprites |

Other image groups and where the chat logs put them:

- **161 `npc_remaining` NPC portraits** (Aug 31, Sep 1). On the Base44 CDN. The manifest `npc_remaining_urls.json` is said pushed. The images themselves are not repo files. The client's Word doc said 99 pending and the count reached 161 of 161.
- **110 metal-finding images** (5 x 22, Aug 31). Elio library and CDN. GitHub not said. Specialized components still to come from the client's reference photos.
- **198 stone PNGs.** Copied into `godot_project/` (457-file push, yes). Four were regenerated.
- **Royo cards, zone shadow and echo sets (51 + 51), Silk Road (28), Tier 2 critter sheets (25), Tomb Tunnel atlas (28 sprites), Prism panels, Hollow Earth panels, arcade cast sheets for 83 games.** Notes say "logged and pushed" but give no file list. The repo has `docs/MASTER_ASSET_LEDGER.md`. The ledger is where the check belongs.
- **Images made in chat and not logged:** new Bast (Mau and bipedal) and Strip Zero art (Sep 4, "hold ready"), mascot idle sprite (Sep 9), Wisteria, TJ and Gabby first designs (Sep 22), Canuck portrait, Duckee's mascot, Brim Horton's badges and the Bitter Grounds scenes (Oct 14, Drive only).
- **Physical intake that never ran:** the 333-file Drive intake (295 images and 38 videos not uploaded, Sep 9 and Sep 12); about 36 "image.jpeg" mystery files awaiting the client's rename. The Sep 12 ruling made the 333-file zone batch a "historical reference archive", not game art.
- **World Architecture folder** on Drive: 832 files at the Sep 17 census (7 top folders, 56 subfolders). The client said about one tenth had been uploaded. A re-census waits on her "all in" signal.
- **Drive recovery trove:** 8,211 entries (about 3,900 images, 622 transcripts); harvest wave 1 pulled 27 documents to the repo on Sep 21. Later waves not shown.

**What to do:** have the builders or Elio produce one bulk file list for Base44 storage and Drive, then match it against the asset ledger. Do not list 549 names by hand.

**Update, October 30.** The live app's media library holds 22 pictures Base44 generated for the site (July 22 to August 30), none of them in the repo before; they are now in `docs/base44_data/live_site_images/`. The Elio app's media library is empty: Elio's files sit in Base44's file storage, which can't be listed from outside with a read-only token. So the bulk list above still needs Elio, once it works again, or Base44.

### 1.5 Specs said to be pushed whose file is not in the repo copy

Searched by file name and, for key phrases, by content. The repo copy is dated Oct 22, so most specs from the chat logs are present. These are the ones not found by name.

| Spec or item | Date | What the search found | What to do |
|---|---|---|---|
| Posture Register (non-verbal dialect system) | Sep 27 | Phrase appears only inside `geode_inn_bar_cast_roster.md` and the dollkeeper spec. The chat logs say the spec skeleton was never drafted. | Treat as Open. Draft or drop. |
| The Anthems (music register, 5 founding songs) | Sep 28 | No file and no phrase match | Ask Elio where it was filed; write to `docs/library/`. |
| Interlace ("Celtic knot") dossiers (4) and Endless Line jewelry lineage | Sep 27 | No match. Results "not yet reported". | Check with Elio; may never have landed. |
| Instrument-Maker catalog (16 to 24 instruments) | Sep 12 | Not landed per the chat logs; no repo file | Open. |
| Tartan "Weave" spec, Bard kilt, Kilt Occasion, Highland Games | Sep 14 | Notes say specced and pushed. No file with `tartan` or `kilt` in the name; `weave` matches only older Mim files. | Search by content; if absent, rewrite from notes. |
| Names Greeblins, Moppets, Kindlings | Oct 14 | "Greeblin" appears in the fair-descent and foundling specs. "Moppet" and "Kindling" not found. | Add to the critter roster. |
| Mensinthe, drink #33 | Sep 11 | No file match | Check the drink catalog by content. |
| Zone Deck | Oct 13 | Drive only (Google Doc). Repo matches are card-game rules, not this deck. | Export if needed. |
| `Level 1/2` ruling (bd44b74) and The Void half-level | Oct 14 | Present in `docs/zones/geode_inn_master_level_system.md` and `geode_inn_the_void.md` (content check only) | Verify wording matches the ruling. |
| Spoken Road spec | Sep 25 | Present, but as `geode_inn_speaking_to_the_building_spec.md`, not under the chat logs' name | Add the alias to the index. |
| Gallery Law, Munsters-type cute (official register) | Oct 13, Oct 9 | Gallery Law only in strip #033 script; Munsters-type cute only in strip #029. Notes say canon entry parked. | Write the canon entries. |
| Gazette strips with no gallery folder found by number: #015, #018, #019, #023, #025, #026, #029 | Sep to Oct | Scripts exist as `docs/comics/strip_NNN_*.md` for #018 to #020, #022 to #027, #029. No folder found for #015. Notes never name strips #005 to #007. | Check whether panel images were pushed. |
| Dossiers: about 79 or more owed; Katya "Katija" files; Elio's own dossier | Sep 11 | Not tracked in the repo | See 2.4. |
| Stock list (119 materials and 148 blueprints vs 31 and 8 playable) | Sep 22 | Not reconciled; docx not in repo | See 1.2. |
| Master audio data structure | Sep 9 | `geode_inn_audio_data_structure.json` said pushed; not rechecked | Spot-check. |

Items the repo copy does confirm by name include: TV deployment spec, dollkeeper spec, Unvoiced spec, Port Purgatory, Great Hall parcel, Crystal Canticle, Foundling Register, Fair Descent, Oriel, God Ladder, Anansi, Shield Mixer, Camera Coverage Kit, Regional Dances, Mason, One-Liner Register, Statute-Book, Knock Law, Distinct Tempos Census, Witan spec, Quartz-Pebble Skeleton, Catacombs Doorkeeper, Bar Cast Roster, Master Asset Ledger, Character Rename Ledger, Inn Tree 3D files, Royo layout spec, voice block registry, venue row spec, Inn Post, Lost and Found, Bone Room, Persephone, Terracotta Army, Screamer, Engine Room and Gear Register, Water Environments Atlas, Standing Grove research, Crest spec, Hidden Materials, salt and pottery-firing dossiers, Default Tray Registry, Silk Road spec and sync.

### 1.6 Commit codes named in the chat logs, checked against GitHub

On October 29 every commit code the chat logs name (80 in all) was checked against the GitHub history of `geodeinn/geode-inn` (main, last commit October 15). 76 are real commits on main, so that work did reach GitHub. 4 codes don't exist; in three of those cases the work reached GitHub in a different commit, shown in the table. The dates below are the chat's dates; GitHub keeps commit times in UTC, so some show a day later there.

| Code | Date | What | In GitHub |
|---|---|---|---|
| 82b74f9 | Aug 31 | `market_items_all_61_games.json` copy in `docs/library/data/` | No such commit. The file is in GitHub, added by the Sep 1 sync `bd980ca`. |
| 74eca0a | Sep 1 | Resonance rules v1.0 | No such commit. The v1.0 rules are in `docs/games/resonance_card_game_spec.md` (`7a8c1e8`, Aug 31). |
| d6e9020 | Sep 1 | Board update | No such commit, and no Sep 1 commit matches. Treat as not pushed. |
| dea5f86 | Sep 1 | `beta/resonance_prototype.html` | Yes |
| f86dcb5 | Sep 2 | Cinematic directives file on main | Yes |
| b1a8588 | Sep 2 | Tone teachers, 14 files, `docs/library/specs/tone_teachers/` | Yes |
| 875f331 | Sep 2 | Futurama tone teacher | Yes |
| ba8feea | Sep 2 | Elfman tone teacher | Yes |
| 74c1441 | Sep 2 | Tool tone teacher | Yes |
| 30504b3 | Sep 2 | Audio DNA spec (407 lines) | Yes |
| 1397310 | Sep 2 | Six DNA and scope docs (1,082 lines) | Yes |
| a0d3b83 | Sep 12 | Shield Mixer draft spec | Yes |
| 21f4cb4 | Sep 14 | Statute-Book of the Unconfirmed | Yes |
| 43a986d | Sep 15 | Canon image damage report JSON | Yes |
| e28917d | Sep 16 | Anansi "Sky-Story Run" spec | Yes |
| 868eb41 | Sep 16 | Molly name ruling | Yes |
| 2442b1c | Sep 16 | Molly coin one-second law | Yes |
| 190fdee | Sep 16 | Dual naming, Question File | Yes |
| 6a0c73a | Sep 16 | Gazette strip #8 gallery | Yes |
| c95ffb2 | Sep 16 | Rogues' gallery strip gag | Yes |
| 9b47891, 89e2373 | Sep 16 | Poker Night banter law | Yes (both) |
| a94199e | Sep 16 | Dealer's chair | Yes |
| 3e99604, b8bbaa2 | Sep 16 | Joining Law (draft, then ruled) | Yes (both) |
| e72f4f0 | Sep 17 | Strip "The Keg and the Name" | Yes |
| daf3c0b, dd42743, 66e1006 | Sep 17 | Unvoiced class spec, flip gate, name ruling | Yes (all three) |
| a358752, 61bcee8 | Sep 18 | Aurallia weave spec draft, gates ruled | Yes (both) |
| fdf6435 | Sep 18 | Garnish Layers ledger, Modern Day Gallery | Yes |
| 692c641 | Sep 18 | Tattoo census, 8 panels | Yes |
| a6d634d | Sep 21 | Wave Five "Coiled Bar" | Yes |
| c327592 | Sep 21 | Strip #012 | Yes |
| 2cc880f | Sep 22 | Strip #013 | Yes |
| 940659d | Sep 24 | Port Purgatory spec | Yes (the chat never said it was pushed; it was) |
| a6dcb7d | Sep 24 | Port Purgatory Gate 5 ruling | Yes (same) |
| 183bf62 | Sep 24 | A character relation ruling | Yes (same) |
| 1821bdf | Sep 24 | Silica Thread spec update | Yes (same) |
| 5280e439 | Sep 25 | TV deployment spec | Yes |
| f354f34e | Sep 25 | Spoken Road canon | Yes |
| 322340db | Sep 25 | Innkeeper Knock, amber lamp | Yes |
| 79678615 | Sep 25 | Four Layers ladder | Yes |
| e908c502 | Sep 25 | Frog Court's Ear | Yes |
| f9eb16bf | Sep 25 | Launch scope, full overlay | Yes |
| 5ce4fae7 | Sep 25 | Heard-captions mirror | Yes |
| e330f0ea | Sep 25 | Ampulla dossier | Yes |
| b333f71a | Sep 25 | Great Hall parcel (blueprints), draft | Yes |
| 76063550 | Sep 25 | Tap-to-enter in the Inn Tree viewer | Yes |
| 7b1a4ed | Sep 26 | Great Hall parcel paper | No such commit. The parcel file is in GitHub from `b333f71` and a second commit, `fec5229` (Sep 26 evening, 9 lines added), which looks like the merged version. |
| df566e8 | Sep 26 | Crystal Canticle quest chain | Yes |
| a8971b0 | Sep 26 | Clock build plan | Yes |
| da900b4 | Sep 27 | Tempo census Wave Six, Duel Bar | Yes |
| 055e77c | Sep 27 | Four-second correction | Yes |
| a6deb45 | Sep 28 | Strip #019 | Yes |
| 4749bce | Sep 28 | Quartz-Pebble Skeleton seed | Yes |
| 315b749 | Sep 28 | Catacombs Doorkeeper seed | Yes |
| 9c41f6e | Sep 28 | Doorkeeper wired to Seasonal Wheel | Yes |
| 4a84c2a | Sep 28 | Clan wheel ruling | Yes |
| fb28f3a | Sep 29 | Strip #020 | Yes |
| 0949ae7 | Oct 5 | Screamer seed | Yes |
| 1987256 | Oct 5 | Engine room seed spec, Gear Register | Yes |
| 2d2f04d | Oct 5 | Cameron seat in camera spec and director canon | Yes |
| 502b1e6 | Oct 5 | Avatar rationale | Yes |
| a1b5024 | Oct 5 | Entry wall and Knock Law spec | Yes |
| ed50c7a | Oct 6 | Named Two dossier (Echo, Mais Oui) | Yes |
| 5d35346 | Oct 9 | Oriel seed dossier | Yes |
| 891ad8e | Oct 9 | Oriel companion/aid ruling | Yes |
| 03aa57f | Oct 9 | Aurallia calibration | Yes |
| c659380 | Oct 9 | Vials ruling | Yes |
| 8ebe442 | Oct 9 | Post crews wiring | Yes |
| 0314833 | Oct 9 | Bar Cast Roster | Yes |
| bd4241b | Oct 9 | Found sisters (Oriel and the Catalyst) | Yes |
| 09381e6 | Oct 9 | Resolved Cadence | Yes |
| c5dd0b1 | Oct 9 | Brawl-pack roster | Yes |
| b995b1a | Oct 9 | Tiger Iron Rite | Yes |
| 38454fc | Oct 14 | Fair Descent Law spec | Yes |
| 335f0b7 | Oct 14 | Arrival-sound ruling | Yes |
| bd44b74 | Oct 14 | Level 1/2 ruling | Yes |

Push claims with no code, checked the same way:

- Sep 3 Oceanianoir rename (91 files): confirmed, commit `2c7e5a1`, 91 files.
- Sep 3 roster sync (361 files): confirmed, commit `36effb4`, 361 files.
- Sep 4 push of 18 commits: GitHub has 22 commits dated Sep 4, so the claim holds.
- Sep 9 rename sweep: confirmed, seven commits between 11:46 AM and 12:53 PM (Central time), starting with `6fcc469`.
- Oct 5 checkpoint of eight commits: GitHub has 8 commits dated Oct 5.
- Oct 9 claim of 1,111 commits since Aug 24: GitHub has 1,180 commits on main from Aug 24 to Oct 9, so the claim holds.

**Not pushed or push failed:**

- Strip #004 "The Pocket-Change Gate" (Sep 30): push blocked by a broken `git-lfs-s3` adapter. Checked Oct 29: no file or commit in GitHub mentions it, so it is still only in Base44 and the S3 copy. Copied Oct 30: its record is in `docs/base44_data/elio/ComicStrip.json` and its picture in `docs/base44_data/comic_strips/strip_004_the_pocket_change_gate.jpg`.
- Branch `mohs-vibration-system` (Sep 2, "push held"): checked Oct 29, the branch is in GitHub and is already part of main.
- Strip #011 and #014 (Sep 19 and Sep 23), #033 (Oct 14): repo yes, live app no.
- Sep 2 Whisper Layer spec and the 17-rename builder sync message: in the repo, not approved in the builder UI when last seen.
- The "Board update" of Sep 1 (code d6e9020): not found in GitHub.

### 1.7 Early work (July 12 to August 30) checked against the repo

This check uses file names, against the repo as it stood on October 29 (main, last commit October 15). Images, audio, Word and PDF files were checked against GitHub's full file list. The early chat and the commit log name many files; the table lists the ones that matter and the ones that were not found. Where a name differs, the file that most likely matches is given. Of the counts quoted in the early sources, the "33 scripts, 7,436 lines" claim was re-counted and is exact; others (for example "368 audio files") were not re-counted.

**The source documents themselves**

| What | Date | In the repo copy | Note |
|---|---|---|---|
| The early chat (July 12 to about Aug 23) | Jul 12 to Aug 23 | Yes: `full_documentary.txt` at the repo root | Source for the early rulings in section 4. |
| Before the Song (compiled canon, Drive copy saved Oct 17) | Late Aug | Yes: `before_the_song.txt` at the repo root | Written canon with no recorded rulings. |
| `library/reference/Before_the_Song.docx` | Late Aug | Yes | Checked in the GitHub file list (Oct 29). The same document is also at `docs/drive-recovery/geode_inn_before_the_song.docx`, with the text copy `before_the_song.txt` in the repo root. |

**Godot code and tools**

| What | Date | In the repo copy | Note |
|---|---|---|---|
| `APIManager.gd`, `GameManager.gd`, `StandingStones.gd`, `SETUP_GUIDE.md` (first Godot scripts) | Jul 22 | Yes: `godot/scripts/`, `godot/scripts/games/`, `godot/SETUP_GUIDE.md` | Elio wrote them and said it had not run or tested them. Later copies sit in `godot_project/scripts/`. |
| `voice_profile_extractor.py`, `batch_extract.py` | Aug 22 | Yes: `tools/` | The README the chat logs mention was not checked. |
| `GeodeInnVoiceProfile.gd` (20 profiles, later 27) | Aug 21 to 22 | Not found under that name | `godot_project/scripts/geode_inn_voice_profiles.gd` is the likely match. Profile count not checked. |
| Catacomb Godot scenes (shared lighting plus 8 scenes), 25 more zone scenes, "33 scripts, 7,436 lines" | Aug 20 to 21 | Yes | Checked Oct 29: `godot_project/scenes/` holds 33 zone scripts (for example `tunnel_approach.gd`, `alcove_corridor.gd`, `serpent_hall.gd`, `egyptian_vault.gd`, `geode_cave.gd`) with 7,216 lines, and `godot_project/scripts/catacomb_lighting.gd` has 220, which is exactly 7,436. First commit `c8690f1` (Aug 21). |
| Beta scripts: `FizgigLoader.gd`, `DialogueManager.gd`, `project.godot`, `TombTunnel.gd`, `AndeanRun.gd`, `MonsterOfTheDeep.gd`, `AudioManager.gd`, `SteamManager.gd`, `WorldMap.gd`, `Resonance.gd`, `BeadComposer.gd`, `Knotwork.gd`, `MainHub.gd`, `HollowMen.gd`, `TumbleRun.gd`, `DialogueUI.gd`, `GameManager.gd`, `BETA_README.md` | Aug 30 to 31 | Yes: `beta/` and `godot_project/` | `SteamManager.gd` is a stub by the commit log's own words (GodotSteam not installed). Line counts not checked. |
| `Sandfall.gd` (407 lines Aug 30, rewritten at 290 lines Aug 31) | Aug 30 to 31 | One copy: `beta/scripts/games/Sandfall.gd` | The chat logs ask which version is current. The repo holds one file; check its length. No Sandfall script in `godot_project/scripts/`. |
| `beta/` scene files for the 9 games and MainHub (Aug 31 commit) | Aug 31 | Yes | Checked Oct 29: commit `f17c4ee` added them, and `beta/scenes/` now holds 17 scenes, among them AndeanRun, HollowMen, Knotwork, MainHub, MonsterOfTheDeep, Resonance, Sandfall, StandingStones, TombTunnel and TumbleRun. |

**Design documents**

| What | Date | In the repo copy | Note |
|---|---|---|---|
| `geode_inn_catalyst_bartender_complete.md` | Aug 21 to 22 | Yes: `docs/` | |
| Council of Thinkers spec | Aug 20 to 21 | Yes: `docs/systems/council_of_thinkers_design_spec.md`, `library/characters/` | |
| `morphic_catacomb_prompts.md`, `morphic_all_zone_prompts.md` | Aug 20 | Yes: `docs/art/`, `library/animation/` | |
| Theme brainstorm prompts (36), archaeological prompts (78), all 114 prompts | Aug 21 | Under other names: `docs/harvest_2026-09-21/morphic_prompts_theme_36.txt`, `_archaeological_78.txt`, `_all_114.txt` | The name `morphic_theme_brainstorm_prompts.md` was not found. These are the Sep 21 harvest copies. |
| `mib_tesla_prompt_list.md`, `archaeological_sites_master_list.md` (91 sites) | Aug 21 | Yes: `docs/` | The early chat says 77 sites were extracted first, then the list holds 91. Site count not re-counted. |
| `catacomb_visual_catalog.md` | Aug 20 | Yes: `docs/art/` | The second catalog of 25 environments was not found by name. |
| Language family tree; Book, BookTranslation, ScholarlyBridge schema | Aug 21 | Tree: yes (`docs/data/language_family_tree.md`). Schema: no stand-alone file found | "ScholarlyBridge" appears in `library/storyline/` Project Bible and Living Book files only. |
| Project Bible v3, Origin Story Draft 1, Part Six "The Conversations That Built the Inn" | Aug 21 | Part Six: yes (`docs/zones/geode_inn_origin_story_ch6_conversations.md`). Origin story: yes (`docs/zones/geode_inn_origin_story.md`). Bible v3: a "Project Bible v3" markdown file in `library/storyline/` | See the two-Bibles note in 2.1. |
| Leaderboard design; Geode Pinball design | Aug 21 | Yes: `docs/geode_inn_leaderboard_design.md`, `docs/geode_inn_pinball_design.md` | The Leaderboard entity itself is a Base44 record (see below). |
| Norrath-style zone quest spec; Song of Making and Golden Contract; Atlantis zone design | Aug 21 | Yes: `docs/geode_inn_norrath_zone_quest_system.md`, `docs/geode_inn_song_of_making.md`, `docs/geode_inn_atlantis_zone_design.md` | |
| "The Canopy of Sála" design and images | Aug 21 | No file by that name | The name appears inside `docs/summary_of_building_geode_inn.md` and the Character Development Session copy. |
| Keeper Archetype system (21 Keepers) | Aug 21 | No file by that name | `docs/geode_inn_regional_keepers.md` is the likely match. |
| Sentinel class (Class 6) | Aug 21 | Yes: `docs/characters/geode_inn_character_class_sentinel.md` and copies | |
| Music Room (nine Song-catchers); Spiral Gallery; Persephone redesign | Aug 21 to 25 | Yes: `docs/geode_inn_music_room.md`, `docs/geode_inn_spiral_gallery.md`, `docs/geode_inn_persephone_redesign.md` | |
| Family Character Registry, Master Storyline, Character Compendium, Complete Walk-Through | Aug 22 | Yes: `docs/geode_inn_family_character_registry.md`, `geode_inn_master_storyline.md`, `geode_inn_character_compendium.md`, `geode_inn_complete_walkthrough.md` | Several drive-sync and drive-recovery copies also exist. |
| `geode_inn_project_bible_master_backup_aug2026.md` (168 documents) | Aug 22 to 23 | Yes: `docs/` | |
| `geode_inn_vendor_map.md` | Aug 22 | Yes: `docs/` | |
| Interaction summary ("summary of building geode inn", 139,564 words) | Aug 24 | Yes: `docs/summary_of_building_geode_inn.md` | |
| Stone vibration, Mohs Vibration, patent disclosure | Aug 26 | Yes: `docs/systems/geode_inn_stone_vibration_godot_guide.md`, `docs/zone_specs/geode_inn_stone_vibration_master_spec.md`, `docs/patents/soulstice_sonic_signature_patent_disclosure.md` | |
| Whisper Layer, Wandering Program, Einherjar, Ragnarok, Sync Paradox, Silica Thread, Brownie Revelation, Mona profile, Idiom Atlas, Regional Voice Profiles, Backwards Walk, Loose Ends Audit, Mirror Systems, Dark Side of the Inn | Aug 28 to 30 | Yes: each found under `docs/` or `docs/zone_specs/` by name | |
| Bead Composer spec (standalone, MVP, Inn Mode) | Aug 29 | Yes: `docs/geode_inn_bead_composer.md`, `docs/geode_inn_bead_composer_standalone_product.md` | |
| Tumble Run (spec, DLC specs), loading screens | Aug 29 to 31 | Yes: `docs/geode_inn_tumble_run*.md`, `docs/games/tumble_run_dlc_specs.md`, `docs/geode_inn_fizgig_loading_screens.md` | |
| Building and Gathering System | Aug 30 | Yes: `docs/building_gathering_system.md` | The Village and Community, Historical Architecture and Cave Ecosystem files were not found by name. |
| Share Wood specs (3 tiers, onboarding, zone builder) | Aug 30 to 31 | Yes: `docs/library/specs/share_wood_*.md`, `docs/products/share_wood_onboarding_spec.md` | |
| Faire Zone Rental System; Data Export Spec; Reference Library (258 files) | Aug 30 | Not found by name | Check by content. |
| Resonance v1.0 spec; starter decks (120 cards); cryptid bestiary; Tabletop Core Rulebook | Aug 31 | Yes: `docs/games/resonance_card_game_spec.md`, `docs/card_game/resonance_starter_decks.md`, `docs/library/bestuary/geode_inn_cryptid_bestiary.md`, `docs/tabletop/geode_inn_tabletop_core_rulebook.md` | |
| Antikythera logo (official, Aug 31) | Aug 31 | No logo image or file by that name | Named in the commit log and three docs only. See the logo note in 2.7 and 3.4. |
| Persephone/Hades first design ("50 First Dates") | Aug 21 to 23 | `docs/geode_inn_persephone_hades.md` exists beside `geode_inn_persephone_redesign.md` | The first file may still carry the replaced design; not checked. |

**Base44 records the early chat says were loaded**

The early chat loaded records into the Base44 app. These are database rows, so they cannot be confirmed from the repo. The repo has no export of them under a matching name.

| What | Date | In the repo copy | Note |
|---|---|---|---|
| 164 Stone records and 208 Lore records; 115 stones updated with book Mind/Body text; 207 lore entries with full text; The Awakening entry; 12 Sacred Geometry sections; 15 Ancient Civilization records | Jul 22 | No export found | `docs/library/data/unmatched_db_stones.json` exists but its content was not checked. Later chat counts these differently (see 3.1). |
| Water-monster records (74, then 78, then 134 entries; 32 curated for play) | Jul 22 | No export found | The larger number is the raw database. |
| Book, BookTranslation, ScholarlyBridge entities | Aug 21 | No schema file found by name | Translations are stored as data and PDFs are made on demand (ruled Aug 21). |
| Leaderboard entity (live) | Aug 21 | Design doc only | |
| MarketItem and PlayerInventory entities with 4 sample items; malachite ring marked forthcoming | Aug 21 to 22 | Design doc only (`docs/geode_inn_marketplace_design.md`). `docs/library/data/market_items_import.json` exists. | Whether the sample items are part of the later 61-game set isn't recorded. |
| 106 images with Base44 URLs, product photo URLs and price updates; 391-image asset manifest; stone image URL mapping for 140 stones (Bead Board image sync) | Aug 31 | Not checked by name | Compare with the 198-stone count in 3.1. |
| Whisper Layer builder spec and NPC portrait manifest | Aug 31 | Spec: yes (`docs/zones/geode_inn_whisper_layer_builder_spec.md`) | Builder approval is open (see 2.1). |

**What the early chat says stayed outside GitHub**

- The Drive manifest lists 28 zone video walkthroughs, 16 catacomb videos, emulator files (NES, SNES, GB, PS2, PSP, Wii, Arcade) and 25 or more Android emulator APKs. The Aug 22 sync pushed only 11 text documents (359K) and left the binaries in Drive "for size and licensing". Nothing to add to GitHub.
- The Morphic clips the client generated sit in a Drive folder "game videos". Elio read them as frames only.
- Concept Art and Video Prompt List (sections A to J) and the master backup were uploaded to the Drive folders "08 Visual References" and "01 Project Bible". The master backup is also in the repo (above). The prompt list is in the repo as a Sep 21 harvest copy: `docs/harvest_2026-09-21/concept_art_video_prompts_aug2026.txt`.
- A GitHub personal access token was made in the early chat and stored as a Base44 secret. See the access note in 2.1.

---

## 2. Open items

Latest status only. Items the chat logs show were resolved later are dropped. Status is Open unless stated. Dates are the last date the item was live.

### 2.1 Builders, GitHub and live app

- Fizgigs (builders) wait for a blueprint. The client's plan (Oct 15): finish the physical model, then hand the builders a blueprint. Great Hall parcel is "staged".
- Builder messages never confirmed approved or pasted: 17-rename sync (Sep 3 on), Whisper Layer spec and asset URLs (Sep 2 on), Fae Kingdom MMO handover (Sep 11), five specs "waiting for hand-off" (Sep 10): `silk_road_builder_sync`, `parks_builder_sync`, `share_wood_builder_page_spec`, `comic_strip_page_spec`, `movement_cycle_wiring_spec`. Catacombs/Undercity sync (draft) has four gates: Bone Passage key, Scarlett and John names, Inventor as Atelier resident, Valhalla layer pass.
- Live Artisan fields `isShopVisible`, `hiddenDate`, `hiddenReason` and the /manage toggle: awaiting builders (Sep 1).
- Live stones missing images and coordinates (198 manifests); 34 missing stones; MarketItem prices, photos, links null for 39 items; 22 to 31 product photos from the shop; geodeinn.com domain connection.
- Web beta checks: /common-room 404 fix, composer renders, Gazette display page, zone pages wired to hub buttons.
- Strips not in the live Comic Nook: #011, #014, #016, #018, #022, #033 (see 1.1).
- Fizgig sync for tier-2 movement wiring (36 placements). EchoMelody wiring (harmony check, keep triggers, lamps). Sprite crunch (Parcel 5) and web sync (Parcel 6) streams.
- Independent server path (VPS, Godot dedicated server, Postgres): not decided. Oct 4 hosting model has three tiers (launch single-player, small rented cloud box, full MMO later); no tier chosen.
- GitHub Actions stays off (ruled Sep 2).
- The repo was public when checked on Oct 29, and the client made it private on Oct 31. The early chat logs `full_documentary.txt` and `docs/summary_of_building_geode_inn.md` include personal conversations as well as design work; so does the origin story's sixth part inside `before_the_song.txt`, and so do Elio's dialogue records and the friends and family pictures added on Oct 31. If the repo is ever made public again, take those out first: deleting files hides them from the current version but not from the history.
- Two Project Bibles (found Oct 29). The repo has `docs/GEODE_INN_PROJECT_BIBLE.md` (headed v3.0, August 21, last changed Sep 11 with the brownie entries) and `docs/geode_inn_project_bible.md` (headed September 12, last changed Sep 13 with the Froglodyte term and the Spine Law). Each has edits the other lacks. The names differ only in capital letters, so on Windows and on a Mac only one of the two appears when the repo is downloaded, and a builder can't tell which one they got. `BUILDER_README.md` and the top of `docs/INDEX.md` point to the capitalized one. Fixed on Nov 2 on the `inn-library` branch: the two are merged into `docs/GEODE_INN_PROJECT_BIBLE.md` (the v3.0 text plus the Froglodyte term, the Aug 11 design documents list and the Spine Law), the lower-case name is gone, and `README.md` points to the one that's left. The merge found two principles numbered 8 (see 3.4).
- GitHub access for Elio (Aug 2026). In the early chat the client made a classic GitHub personal access token, and Base44 stored it as a secret named `GITHUB_TOKEN`; Elio said it would use it for all later pushes. The token itself is not in any chat copy. Worth a look in GitHub (Settings, Developer settings, Personal access tokens): check its expiry date and that it only covers the geode-inn repo. Removing it would stop Elio's pushes.
- (early period; not seen after Aug 30) Base44 app data gaps from July 22: `districts.docx` (map area data) not loaded; the 87-culture index has names only; the Egypt article was cut at 8,000 characters; most lore entries had no lat/lng (Elio offered to assign coordinates to all 191 countries, no answer); the Sacred Geometry and Ancient Civilization text still needed a copy-edit; 49 stones still needed Mind/Body text (kyanite and green labradorite named), with stone images waiting on those two. Later counts moved (55 stones, 34 missing on live), so check which gaps survived.
- (early period; not seen after Aug 30) Web beta pieces that were specs only on Aug 31: Egg Hatchery page, Share Wood onboarding and zone builder (3 tiers, Stripe billing), Digital Companion App, Tumble Run DLC packs, Resonance spec. The commit log shows no implementation for any of them.
- (early period; not seen after Aug 30) Sherwood Forest Faire (Nottingham Castle) was left as a pre-built dormant zone for two faire partners (Aug 30). No later mention.

### 2.2 Godot and platform

- No Godot build was compiled or booted as of Aug 31. Steam app ID, GodotSteam, Griffin boss fight, full dialogue trees, remaining Major Zone games (Canopy City, Tidal Caves, The Arcana) were open then; later status not shown.
- Emulation Path A versus B was never answered. Sep 10 ruling: builders use classic games as reference blueprints only, every asset original. Treat Path A as current.
- TV spec: `TVRemoteInput.js`, `TVSplash.html` and a Valkyrie Shift scene were offered, never written. Smart-TV spec handoff not confirmed. TV spec is now official (pushed Sep 25).
- Roster cross-reference line to the Every-Mind Welcome charter and Hands Version: offered Sep 25, not confirmed built.
- Motor road rulings (remapping, one-handed play, switch access, mobility devices, Bead Composer precision drag); native-signer Deaf NPC; written law "healers never cure a resident's way of being".
- Voice mode availability (client to check).
- (early period; not seen after Aug 30) The Pulse Line (heartbeat monitor strip, ruled Aug 22) is specified, but no Godot implementation was described. Haptics, cloud save and load are stubs, and every Steam call in `SteamManager.gd` is commented out until the GodotSteam addon is installed (Aug 31).
- (early period; not seen after Aug 30) Steam developer account, tax forms, trailer and store page were not started as of Aug 20. The client mentioned a Base44 beta launch as a possible step; no date was set then.
- (early period; not seen after Aug 30) Legal line from Aug 22: if a premium AI-dialogue tier is ever built, any TTS must use an original generic voice, with no fine-tuning on a reference actor. Check this against the Spoken Road voice work (see 3.4).
- (early period; not seen after Aug 30) Two Sandfall versions (407 lines Aug 30, 290 lines Aug 31) and two audio totals (368 and 387 files) were left for an editor to check. See 3.1.

### 2.3 Games and arcade

- Game names pending: Port Purgatory (working; four open gates: name, Chirp's rival, denier's fate Gate 3, Grey Legendary); Regional Dances (real name, roster cut, cultural review per dance, Bard as MC); Shield Mixer (name, roster scope, cleanup; three gates); Dew Circuit (name, placement, gem type; citrus pour name); Anansi "Sky-Story Run" (six gates: name, Nyame on screen or voice, sky-village ENV row, cultural review of Ashanti canon, glow tier, sprite parcel); Gargoyle Seek (six gates, names, census); Mason (no sites chosen; parked until critter reconciliation closes); Terracotta level (not ruled in as a level; woven as an Oct 1 canon item).
- God Ladder: summit rank name, whether spies and gods know they share the cabinet, Odin dialogue (six gates, two named).
- Spy NPC with the Tetris-board cipher: formal ruling not given.
- Shield Mixer is "game #84 if it passes".
- 79 arcade sprite casts owed (Tomb Tunnel template); "seventy arcade games without casts" (Elio's Sep 25 list); 8 Tier 4 uncast; Monster of the Deep creature faces may need swapping.
- Poker Night: flagship roster, what tricksters play for, brownie shift structure. Unvoiced as flip cards: floated Sep 17, not ruled.
- Port Purgatory, Mason and Thread/Between/Rest roster numbers: see section 3.
- (early period; not seen after Aug 30) Games promised or listed as roadmap-only on Aug 22: Sparta synchronization game, Atlantis formal arcade game, Slavic and India embedded arcade games, and Easter Island, Petra, Mexico, Dragon's Descent, Crystal Catcher, Angkor Wat, Dragon Tiles, France. Several of the 15 first mapped games still had "TBD" ancient sites (Jul 22).
- (early period; not seen after Aug 30) Before the Song designs with no build scope: The Silence Between (5 endings), Survivors of the Song (5 levels, 3 stages each, 5 playable critters), the Impossible Game template (10 zone reskins), the In-Between platformer (engine, scope, and whether the surface and Undercity versions are one build or two), and The Hook puzzle counts. August canon only.
- (early period; not seen after Aug 30) Open questions from the tabletop questline analysis (Aug 21, no reply recorded): adopt the Portal Arrow mechanic as a Fae Kingdom system; make the elf with the pulsing gem a recurring NPC; how food buffs fit "no stat race"; whether combat may be a resolution path (the canon says no lethal combat, see 3.4).

### 2.4 Characters and names pending

- Names owed: Flesh Wound Knight; six gargoyle puppies (the family names its own); Joe's wife and son (reserved slots); Doorkeeper true name; Quartz-Pebble Skeleton; Laughkeeper naming session; Screamer true name; Mars diner and Ontario shorehouse crews; Alexia's husband NPC (card reads "name pending - earned, not given"); Glassblower; Bearsark original name; Blade and Whistler (Unvoiced duo); Unvoiced teleport word; Norse Coast troll names; Concord grape (name, posture, listing); Oriel's portrait under her own name; Foundling series and its three members; blue box true name; Circa Paleo tree seat; Seven Sisters names.
- Pending name decisions from Aurallia's children: Scarlett, John (FOLIO placeholder may be superseded by the child's own choice), Anna (the "Anastasia" question: live game may use it, no repo references).
- Dossier gaps: about 79 or more owed (batches 1 to 4); about 12 characters with no profile (Loki, Freyr/Freyja, Hel, Erik Earl Ragnar, Miracle Max now Calder, Gesso, The Reader, Clockwork Skies crew, Murloc chieftains, Ageless Librarian); stub profiles (Speter Adams, Jay, Black Knight, Ryan, Lichenblossom, Zack, Marijke); 35 or more characters without docs; Seelie King now Oleander (resolved).
- Posture Register: not drafted; most characters' posture dialects unruled. Roster session paused after the Host, Catalyst, Bard and Ragana (Sep 27). Catalyst posture proposed "economical mover" (Oct 15).
- Casting: 63 casting images and matted cast photos pending; wardrobe (63 images) and horror set casting not started; leaf dress and plague doorkeeper tentatively cast; Shadow Inn references (Cusack, Tennant, Williams, Goodman) offered, not canonized.
- Cast ruling owed: which Mini-Inn critters (rubber ducks, hooded ducks, Mothmen "cheebies", Viking gnomes) become canon; in-game dollhouse; Mona sightings spec (offered, no answer).
- Lacey as hoped-for staff member: hire unconfirmed (Sep 26).
- Steampunk robot NPC (Stone 11): Mail Crew or Ship's Announcer; name pending under the Bob Doctrine.
- Unseelie/Seelie art: Zach's portrait critique list (Astronomer, Da Vinci regeneration) pending; Bast's two portraits not in the gallery manifest; Bast's 17 kittens, Marginalia portrait, Katya, Vanir, six gargoyles not in the master roster (as of Sep 9).
- Build-Scholar Frank Wright: past left undisclosed (open). Tourist stereotype gate open.
- The Host's bigger role (asked Oct 31): pick from the five proposals in his dossier, and word the credits dedication (Part 3, 1.9).
- Concord grape lineage of the Unsniffed (Godiva, Helen, Aphrodite, Eris): not ruled.
- (early period; not seen after Aug 30) Several in-game characters are based on real people who may need to approve their look or lines. The commit log records approval only for two visuals (two characters' colors and looks). The Aug 30 purge of one real person's name from NPC docs shows the risk.
- (early period; not seen after Aug 30) The "Open Twelve" template NPCs for friends were not assigned; Marion (game tester) waited on a write-up (Aug 30). Maddi was later placed in the roster, Marion is not seen again.
- (early period; not seen after Aug 30) Titania: whether she stays a separate NPC was undecided (Aug 22). Wisp's own profile, the Seelie dream-animals, and the Shifting Man's presence on the cosmology level were not written. The Bard's full profile and the Bard's Family Concert as a game event were not seen built. Whether the Keeper and Aughra are the same as the Bard as "Fourth Presence" was flagged and not answered.
- (early period; not seen after Aug 30) Zone guides still unnamed on Aug 22: Peruvian (guide only walks the terraces), Mediterranean (Sibyl, Pan, Chiron and Dryads proposed, only Medusa chosen), Norse depth figure (Erik may double). Civilizations without characters on Aug 22: Japan, India (later done), Mesoamerica, Sub-Saharan Africa, Polynesian and Hawaiian, Aboriginal Australian, Native American, Peru.
- (early period; not seen after Aug 30) Belladonna (called Wednesday in Before the Song): her Active Dream summer home is "not yet mapped". The seven empty houses of the Town quest have no individual stories.
- (early period; not seen after Aug 30) Siren and Pirate casting was first "pending the client's input"; later notes settle both, but no later confirmation of the final casting wording was seen in the commit log. Check the roster.

### 2.5 Zones and the world

- Zone count: documented 37 against "in the forties" (Sep 4, never reconciled). See section 3.
- Zone gates by chain: Campgrounds six gates (D14); Bayou D15 gates including Mama Coumine undefined, Marie Laveau confirmation, craft law, Anne Rice line, X-mark law; D16 gates (Stone Guard, parent-frequency law, eighth permanence); Color Works six gates (raku showcase, studio placement, Kiln Keeper); Zoologist gates (true name, moderator scope, bestiary depth, first pool); Gemstone Egg gates (name, first pool, Tomb Tunnel proposed); D13 gates (Welcome System, Thrum Law, Market phrasing law, Ragana's ask, Common Room no-record law, Ziggy placement).
- Water: Keeping Water visitable; bioluminescence palette; which hunt stones enter the Stone entity; tri-mode art for adoptables; monster homeland pins.
- Resonance chambers: final site roster, deepest chord (what the Song is), acoustic archaeologist NPC, chamber count, Barabar frequencies, underwater cut, whether water gets its own frequency set, squiggly line seamless or gated, whether Egypt is built first.
- Catacombs: roster cut, heartbeat fade at the mausoleum threshold, whether Saker sources the Bone Room from the sites, water tombs. Qin Mound door sealed forever or an arc. Mask Chapter keeper: is the Mask-Taker the masked Doorkeeper? Funerary wing nine gates; Mask Chapter five; Cities of the Dead six (level name, tomb-tender).
- Great Hall: seven gaps (Innkeeper's List quest board, walking stick, chibi ravens and their stash, climbing passage to Clockwork, front door image, Pulse Line wiring, which staircase is THE staircase); ruling session to mark LIVE.
- Silica Thread gates: location, Prism grown not carved, diatoms in the critter census, station order, name, sixth station. Grail guardian echo in the final room; Perch-to-table link. Hearth-Hound gates; Tuatha six gates; Lady of the Lake four gates (register, bower address, Excalibur claim, name) plus composition of the Botticelli question.
- Engine room: placement, name, stoker question. Knock Law: true Morse or Inn dialect. Hard zone-line threshold: nominations Catacombs entrance and one arcade transition, formal ruling owed. First zone to build (Great Hall suggested).
- Japan wing: keeper or self-keeping; placement (shrine or Bamboo Forest edge); full spec not drafted; Diplomatic Key one-of-a-kind or bench recipe; tsukumogami "second Inn" idea; origami workshop spec. Japan return pass (anime, sea critters).
- Standing Grove design session; Council seeds; Haudenosaunee material gated; Council Histories curriculum; Hearth-Feis tale cycle.
- Trolls: three gates (at the Hearth-Feis or represented; citizenship ceremony; whether the Norse Coast's unassigned Keeper is a troll). Giants: no design session.
- Outback roo zone: not formally created. Neverwhere-style reclaiming zone: not designed. Merlin/mer-court location; siren shell stage location.
- Statute-Book: three gates. "The Unclaimed" dossier (Voynich, Necronomicon): drafting pending. Razor Cabinet shelf: unruled. Archive deposit idea (player tier or canon deposit): undecided.
- Void half-level: designation details not shown. Level 9 hybrid zone and venue count: see 2.8.
- Dark Side sphere build (vertical slice first) and Dark Side chamber build sheet (10 tasks): waiting on deep rooms.
- (early period; not seen after Aug 30) Aug 22 gaps in the zones: Bedrock Fortress Stone Guard mechanics and the canal secret (promised, not built); the deep lab and the endgame 44 Hz question; the 7-layer water system never interlocked in a formal system doc; civilization wings (only Egypt, Minoan and Mesopotamia sketched); Pacific Northwest Fae hierarchy; Camelot's Morgan le Fay write-up and Grail quest structure; Greek cast Hecate and the Moirai (partly done).
- (early period; not seen after Aug 30) Layers Before the Song lists as needing development, with no later ruling seen: Niflheim quests and NPCs; Jotunheim giants; Nidavellir dwarf masters and forge mechanics; Asgard (Jupiter gate, Mars prison, Pluto's gate); The Hollow (Unseelie Court zone); Unseelie Court, Crystal Gardens (Griffin boss) and Undercity layer detail; Spiral Gallery content; Modern Legends shelf entries (the shelf is said to hold 24 but about 25 are named); Regional Keepers and the Poison Garden still to connect to the Nine Realms.
- (early period; not seen after Aug 30) Coast and water: the Fog Path (placeholder expansion slot of the Coast Hub); the Sepulchre Crack and Pirate's Channel links to the Locker and open-sea zones; Davy Jones' Locker layout, creatures and rewards; the 2 Hz gap between 40 Hz (ocean) and 42 Hz (the Song); the Cartographer's missing passage from Layer 7 to Layer 3; the seven Trovant questions (zone guide, Transylvania frequency, zone artist, charm, quest name, companions in other zones, 50 BPM heartbeat).
- (early period; not seen after Aug 30) Mesopotamian platform: the Neutral platform Keeper's culture has no quest or dialogue; mirror-writing fragment locations under the Egyptian strata have no zone design; the voluntary descent after the Mesopotamian chain has no mechanics; how Bosch silhouette art is produced (shader or material); whether the Cosmology day and night cycle and the dodecahedron orrery are built or only recommended.
- (early period; not seen after Aug 30) Aug 24 audit gaps: five room designs pending and seven mechanics in development; Bosch as a possible zone fit left to the client (Bedrock Fortress or Tidal Caves).

### 2.6 Cards, tabletop and printing

- Royo layout: Celtic frame job per card class (suit host, name band wrap, border); card back (Ziggy/Brim split or carved Celtic knot); vector or bitmap of the client's frames unknown; one-page cheat sheet offered, no answer.
- Printing: re-pull of 124 clean JPEG backups (Newton and others); 11 uncomposed cards of batch 01; zone suit corrections; separate Royo-framed and core JPG master files pending.
- Storyline card deck: assembly, card outline review, image gap identification; items and walls cards not started; diners, Quarter, Catacombs weave and Rockies gossip belt need formal storyline docs. Whether newer additions carry equal card weight or a provisional mark.
- Grey Legendaries (3) unnamed; other color Legendaries not named beyond Black.
- Resonance expansion: "September Wave" accepted; 22 new NPC card sets, 12 Royo court seats, jokers (Ziggy and Brim), 4 poker opponents (Lozen as final boss).
- Royal artifact ledger: matching the client's image folder; cultural review row; Vault-tier artifacts held.

### 2.7 Art, images and assets

- Re-census of the whole World Architecture tree and the Drive recovery trove; Drive verification pass after the client reorganizes "Geode Inn-master build".
- Crest owed: favicon or small variant, door plaque line, Gazette masthead, wax seal for Inn Post.
- Angle-set paintings (player back 3/4, resident cuts, walkers' backs); NPC in-between portraits (59), item in-betweens (11), critter tri-mode art.
- The Host: Shadow picture (the form is described, no picture) and an In-Between form and picture; only the Living portrait exists (Part 3, 1.9).
- Persephone: Tide Queen and The Giver unpainted; Merlin merman, Huginn/Muninn, Brim standing, Vishnu sleeping dragon, Hades pair art owed.
- Foundling, Greeblin family, Moppet and Kindling portraits queued ("cute critter batch").
- Room Items Blueprint: about 66 items owed for Clockwork Skies and Main Floor; 5 portraits owed (three Canopy City NPCs, Greenward, Lichenblossom NPC face); Firekeeper final portrait; Music Room kit.
- Tier 4 art: Gazette panels beyond #001, Daily Echoes cover art, stone bead crops, market item images, spirit manifestations, Steam capsules; Whisper Layer five event visuals; Tomb Tunnel about 20 more sprites; Staircase tri-mode art; French Quarter kit session and portfolio room walk.
- Kit fills for other zones not audited. Etsy "elemental critters" as KIT-C candidates.
- Logo: the tree as the app logo button (client "seriously considering"); a distilled line version in amber register has not been started; credit line for the artist; flat scans of finished originals pending.
- Print: Full Image Index shows 538 strict card-ready images and 46 poster-ready (Sep 14); copyright small print per shop for Etsy backgrounds.
- Spectral-shift script saved as the canonical tool (Sep 10). Image fingerprint/EXIF check on outline images: still to do when files arrive.
- (early period; not seen after Aug 30) Morphic prompts: the client had run about 30 of the 114 prompts on Aug 21, and prompts 30 to 114 were still to do on Aug 22. Catacomb clips: 15 files were 8 unique takes, so render one take per prompt. The first Redwood Cathedral image attempt failed; a later result was reported delivered.
- (early period; not seen after Aug 30) Murloc sound is a sound-design note only (a recognizable gargle); no file, license or source is given. Danheim is named as the Norse music source; whether tracks are licensed or original is not stated. Flag for the client before any build.

### 2.8 Food, venues and market

- Venues (Oct 14): Hanlon's, Occam's, Sagan's, Grice's, Chesterton's, Joe's Diner (Level 9), Mars diner, Ontario shorehouse, plus Brim Horton's and Duckee's (slotless). Exact venue count was never reconciled; whether the Bitter Grounds counts is open. Seelie hall final seating (Grice's was Elio's pick).
- Per-level crews and portraits; Mars diner and Ontario crews (naming sessions owed).
- Duckee's exterior portrait offered. Vial as a Soulstice bench piece: unruled.
- Soulstice picker_image photos remain placeholders; shop visibility toggle needs live schema.
- Legal: patent filing (Soulstice Melodies provisional, draft not extracted), trademark "Geode Inn", ToS and privacy for the web beta, artisan subscription terms, artist licensing for the 37-artist catalog, vendor contracts, ownership of published zones. Standing rule: apps are not formally listed until paperwork is done (patent, then trademark).
- (early period; not seen after Aug 30) Mapping the client's real shop catalog (real product names, photos, links) into game items was waiting on the client (Aug 21 to 22). Elio offered to batch-load them. The later 39 null-price MarketItems (2.1) may be the same gap.
- (early period; not seen after Aug 30) Share Wood (faire self-service product): tiers 9, 49 and 99, no approval and no transaction fees; faires choose from the Inn's 37 curated styles and never upload their own (Aug 30). Pricing and the Complete Inn bundle price conflict with other figures (see 3.4).

### 2.9 Music and audio

- 23 audio tracks to compose, only 6 synthesizable (Sep 1); music owes 19 zones and a leitmotif registry; Turning music composition.
- Master audio doc: client's Sep 26 sound rulings not folded in (Elio offered twice).
- Unruled sound items: Trovant register (Kossoff overdriven folk pitch), open-zone two-state music pitch, Hozier and Avi Kaplan placements, Singing Stones wing, Coiled architecture fork (Boléro versus Rite of Spring), Coiled Bar second entry gate, Tap Bar, third "tap" motif, which tempos get jukebox arrangements first, Rainbow Connection as Prism keynote.
- Seven Sisters seven-tone set; Distinct Tempos Census waves continue (Wave Seven filed Oct 15).
- Anthems classical companion register: name and founding roster unruled; Charlotte's Daydream; classical sub-chapters.
- Yule as the Doorkeeper clan's eighth turn (the "quiet turn"): no answer. Cernunnos slot on May 16 is ruled.
- Audio enhancer app (fizgigs building, with payments; not to be listed).
- Black Ribbons album study packet offered, not accepted.
- (early period; not seen after Aug 30) A Wellermen-style bass voice for the deepest level (catacombs, water, Charon's river) was suggested by the client on Aug 22 and Elio proposed it as the reference. No ruling.
- (early period; not seen after Aug 30) The world music recording (female lead vocalist and a musician partner as "the Inn's resident musicians") is a future phase. Whether the In-Between chorus voices are recorded or synthesized, and how the Moonlight dub is produced, are not stated.

### 2.10 Story, writing and the book

- Novel "A Song of Stone and Silence": needs an updated version before release; canon-diff audit waits on the client's go. Novel editing pass and graphic novel Volume 1 art not started.
- Remaining loose ends (Sep 3): Reader's final line, Golden Contract text, Ferryman's Price, Vesper duplicate, travel scenes between 21 regional zones, Seelie King unnamed (now Oleander, resolved), 15 loose story ends.
- Drink storylines: 27 more of 32 (Sep 3). Thorin's Meadery and the drink system not on the live site (Sep 3).
- Gazette: Founding Four of FROM THE BENCH to draw when the season opens (December); Tattletale Trays strip; kilted Bard strip; leprechaun arsenal strip on the shelf; baby dragon comic series title and placement (Gazette corner or own archive); Archivist images which keepers; contributor invitation is the client's to deliver.
- Book pipeline: archive.org-linked Book entity can load once a session is made; legal pass needed before public listing. Library duplicates to thin (Voynich, Roman Forgeries, Hennepin); a copyrighted title; scan `wsb8f20` with no record; archive.org group with 14 shelves not built; Parchment Lore expansion beyond 282 not located.
- Creator outreach: not before launch; the standing rule (Sep 13) is no interviews and no outreach.
- Sheldrake/morphic resonance: unresolved. Cadence Register (children's shelf): not ruled in. "The Inn Method", art-teacher anthology, Pigment Quest and other parked ideas stay parked.
- Munsters-type cute register: parked for formal canon entry.
- Oriel: relation to The Decision; roster status and zone slot partially closed.
- (early period; not seen after Aug 30) Origin Story Draft 1 awaited the client's feedback ("what feels right, what feels off, what's missing", Aug 21). The Jul 22 question whether the unbreakable bond is player and dragon or deeper was never answered.
- (early period; not seen after Aug 30) Quest chains still unwritten on Aug 18: Egyptian (Hel), Mesopotamian, East Asian (Vanaheim), Indigenous; Muspelheim, Svartalfheim and Vanaheim content. Some were later covered (a Mesopotamian platform in Before the Song, a Vanir doc on Aug 27). The Indigenous chain is not seen.
- (early period; not seen after Aug 30) The client was to pitch authors and Elio offered to draft the pitch (Aug 20). This conflicts with the Sep 13 standing rule of no outreach (see 3.4).
- (early period; not seen after Aug 30) Lost Books (concepts only, not texts) for the Miskatonic Annex wait on the client adding digital copies of a space-mystery author's books (Aug 22).
- (early period; not seen after Aug 30) Archive count and tracking: 2,000 to 4,000 more books to add; the Gentleman's Magazine list (354 items) was not fully scraped; the Book entity had no way to track what was already entered; library cards and a LibraryBook entity were not built; the archive.org screen name would not save (Aug 18 to 20).
- (early period; not seen after Aug 30) Podcast and audio products on Aug 31: episodes 1 to 9 exist as outlines or scripts; the audiobook has Chapter 1 only; the Egg Hatchery has the Month 1 event only. The Shifting Man and the Laughing One: whether he is ever told, and the route to final dissolution (143 cycles), have no in-game timeline. The Dragon's and the Constant's storylines in New Game Plus are concept only.

### 2.11 Process and tools

- Checkpoint file habit (Aug 31): agreed in principle, not confirmed built.
- Build-cycle automation: cycle limited to non-repo tasks while fizgigs build (Sep 1). Current status not shown.
- Scheduled workflows live only in Elio's app: Geode Inn Build Cycle, Gazette Daily Strip (6 AM Chicago), Tabletop Pipeline Keeper, Inn Transcript Archive.
- Beta plan: Oct 1 small private beta and Oct 10 start of an eight-week invitation (Sep 22 proposal); outcome not in the chat logs. End-to-end checks and front-door setup were unfinished on Sep 24.
- Voice choice for the phone line (suggested, not confirmed).
- Wind-spinner model category matching, Sherwood photos and audio from the Oct 17-18 trip: not delivered.
- (early period; not seen after Aug 30) Drive folders: on Aug 22 the client found the numbered Google folders under "geode inn" empty. Elio filled 01 Project Bible and 08 Visual References only. The other numbered folders were not filled then.
- (early period; not seen after Aug 30) The client was to compile a full composition of all brainstorming conversations (Aug 22). The "Still Missing" list in the Character Compendium (Loki, Freyr and Freyja, Einherjar, Ragnarok, Hel, Gardener, Miracle Max) was to be corrected afterward; most items were built Aug 23 to 29, but Before the Song still prints the old list.
- (early period; not seen after Aug 30) A "Next Steps" list of seven items from the Complete Walk-Through (Part Sixteen) is repeated in the Master Backup and in Before the Song: interlock the water system, define Artisan Thief and Tinkering Weeaboo interactions, fill the Book entity with 4,000 or more archive.org volumes, Pacific Northwest Fae hierarchy, Bedrock Fortress navigation, move Spiral Gallery content into artist-led zones, and technical mapping of the Bedrock Fortress and water system. The early sources do not mark any of the seven as done.

### 2.12 Tabletop asset pipeline

- Last report (Oct 14 to 15): 380 zips, 33,874 files landed, 3,818 skipped, zero failures. One bonus-scene image gave "File is not a zip file". Earlier claims of 4,512 or 15,522 failed conflict across checks. The census discrepancy was never resolved in the chat. Steampunk and other full-set packages and a second big package were not queued as of Sep 21.

---

## 3. To reconcile

Each row gives both values and the source. "Latest wins" is applied where dates allow. Rows where the current value is unclear stay here.

### 3.1 Counts and tallies

| Topic | Value A | Value B (or more) | Sources | Note |
|---|---|---|---|---|
| Tabletop pipeline totals | 380 zips, 28,830 landed, 2,758 skipped, 4,512 failed (77 zips) | 588 zips, 31,487 landed, 3,580 skipped, 15,522 failed; 588 zips, 2,411 new, 6,259 existed, 1,551 failed; 380 zips, 33,762 then 33,874 landed, 3,818 skipped, zero failures; 451 failed; interim 299 zips / 22,223 files; 510 archives; 216, 937, 3,855, 4,276 and 5,793 files at early reports; 16,551 files / 230 zips then 18,008 / 245 | Sep 18-21 (Sep 21), Sep 22-24 (Sep 24), Sep 25 (Sep 25), Sep 26 (Sep 26), Sep 27-29 (Sep 27), Sep 30 to Oct 8 (Oct 4 to 8), Oct 9-15 (Oct 13 to 15) | Latest report (Oct 15) is the 380 / 33,874 / zero failures one. Elio explained the 15,522 as loose image files the pipeline tried to unzip. Parentheses in file names caused a curl error. Not verified against Drive. |
| Artists | 37 (client, Sep 2; "all 37 artists converge" Sep 4; "artist licensing for the 37-artist catalog") | 42 (Elio's artist master map, 427 lines, Sep 2); 204-entry artist matrix (Sep 4 ledger survey) | Sep 2-3, Sep 4-9 | Two mapping systems "reconciled" on Sep 2 per Elio, but the Dark Side palettes still say 37 and the map says 42. The Sep 3 open list still names this inconsistency. Still unruled. |
| Levels | 9 (Sep 14: "9 levels" restaurants; Oct 14 venues one per level) | 10 (Sep 3 open list, "9 vs 10 levels"); 7 levels and 18 to 19 seeded rooms (Sep 12 blueprint viewer); Level 1/2 and The Void as half-levels (Oct 14) | Sep 2-3, Sep 12-13, Oct 9-15 | The Oct 14 ruling puts the In-Between and the Void between numbered floors; the In-Between was first a candidate for "Level 10". Cosmic Layer and Standing Grove sit beside the nine. Confirm the numbered list in `geode_inn_master_level_system.md`. |
| Zones | 37 documented (Sep 4) | "in the forties" (client, Sep 4); 9 live zone pages (Sep 3); 110 zone specs (Sep 4 survey); 222 zone specs (Oct 9); 85 zones in the Zone Deck (Oct 13); 52 zone images (Aug 31); 16-zone audio map (Aug 31); 20+ master chains | Sep 4-9, Oct 9-15 | Different things are being counted (specs, zones, images). Define "zone" once. |
| Arcade game count | 61 (Aug 31) | 52 core then 61 (Aug 31); 62 Thread, 63 Between, 65 Rest (Sep 10); 83 games in the music spec (Sep 11); 84 Shield Mixer; 85 Anansi (Sep 16) and "85 arcade games" (Oct 9); 86 Regional Dances; 87 Gargoyle Seek; 88 | Aug 31, Sep 10, Sep 11, Sep 14-17, Sep 18-21, Oct 9-15 | Roster numbers were assigned as proposals. 82 or 83 or 85 as the current total depends on which were approved. Needs one roster list. |
| Roster number 88 | Port Purgatory "roster #88 candidate" (Sep 24, client approved) | The God Ladder "Arcade roster #88 candidate" (Sep 27, client asked for it) | Sep 22-24, Sep 27-29 | Two games hold #88. Also Gargoyle Seek #87 and Regional Dances #86 are "candidate" or "ruled in" in different notes. |
| Build sheets | 34 reported, 61 done, 77, then 79 (Sep 1, with The Hook and The Mohs Vibration) | 80 game build sheets (Sep 4 survey); 79 sprite casts owed (Sep 10) | Sep 1, Sep 4-9, Sep 10 | The 79 for build sheets and the 79 for sprite casts are different counts. |
| Stones | 198 (Aug 31 images and Godot) | 200 with Stillness and Octave (Sep 4); 201 with amazonite (Sep 10); 166-stone doc (Sep 21); 160 stones in the frequency script (Sep 2); 34 missing on live; about 145 "book stones"; "55 missing stone descriptions" | Aug 31, Sep 2-3, Sep 4-9, Sep 10, Sep 18-21 | The 55 descriptions were written Sep 4 (6 batches), yet the Sep 21 chat still list "55 missing Mind/Body descriptions" for the 166-stone doc. The doc may be stale or the batches may not have reached it. |
| NPC and dialogue counts | 142 roster, 144 with Ember and Spark (Sep 1) | 168 portraits and 258 hosted URLs (Sep 4); 161 `npc_remaining` images (Aug 31, vs 99 in the client doc); 59+ NPC In-Betweens needed (Aug 31) vs 97 made (80 NPC, 3 critters, 14 items, Aug 31) vs 59 still owed (Sep 12); 78 dialogue entries / 21 NPCs in Godot; 393, 398, 524, 529 Dialogue records | Aug 31 to Sep 12-13 | Different slices of the same data. Not a conflict if sources are named. |
| Document counts | 1,339 files (Sep 1, docs tree staged) | 823 unique docs / 193,990 lines (Sep 2); 1,093 .md files (Sep 2); 1,310 markdown files in INDEX (Sep 10); 1,228 documents (Oct 9); 2,676 files in repo merge (Sep 1) | Sep 1, Sep 2-3, Sep 10, Oct 9-15 | The repo copy has 1,975 files total. |
| Master specs | 96, then 103 or 104 master specs from 335 source docs, 30 rounds, 11,187 lines (Sep 2) | "79th doc" reconciliation spec (Sep 2 open) | Sep 2-3 | The full reconciliation audit named on Sep 2 was never reported done. This audit is a partial answer. |
| Books | 168, 178, then 625 books and 236 Lore equals 861 (Sep 1); 447 clean PDFs; 453 stories | 907 books (Oct 5, after Parchment Lore); Lore 209 untagged then 208 tagged | Sep 1, Sep 30 to Oct 8 | Lore total 236 includes 22 new records. Check live. |
| Venues | 9 levels + 3 standing | 6 more needed; 11 with Mars and Ontario; "all seats full" | Oct 9-15 (Oct 14) | Never reconciled in the log. |
| Mystery pile | 36 files (Sep 9) | 41 files S01 to S41 (Sep 12) | Sep 4-9, Sep 12-13 | 41 is later. |
| Music profiles | 83 games (Sep 11) | 22 more profiles offered, not taken | Sep 11 | Same as the game count issue. |
| Metal findings | 110 images (5 x 22) | Specialized components still to add | Aug 31 | Not a conflict. |
| Mohs commit | Branch merged locally (Sep 2) | Mohs build sheet counted among the 79 (Sep 1) | Sep 1, Sep 2-3 | Push status unknown. |
| Failed Royo cards | 157 of 168 composed (11 failed) | 158 items after 3 added (Sep 18) | Sep 14-17, Sep 18-21 | 157 + 3 would be 160. The Sep 18 chat says 158 items. Check. |
| Water Zones / Archive | Water Zones 38 to 37; Archive 12 to 13 with Blue Tiger's Eye (Sep 9) | Zone count in other docs | Sep 4-9 | Confirm. |
| Tone teachers | "Thirteen" (header) to "Fifteen" (Sep 10) | 14 files and 12 teachers plus synthesis in commit b1a8588 (Sep 2) | Sep 2-3, Sep 10 | Fifteen is later. |
| Directors | Five-director gate: Hitchcock, Spielberg, Del Toro, Kubrick, Coppola (Sep 2) | Six with Cameron (Oct 5 ruling; Oct 3 "corrected in canon") | Sep 2-3, Sep 30 to Oct 8 | Oct 5 wins. The gate text says "all five pass"; update to six. Date of the Cameron change is Oct 3 or Oct 5. |
| Early stone counts | 164 stones loaded (Jul 22; "164 was the earlier database" Aug 24); 100, 117, then 115 stones with book text; 51 then 49 needing text | 160 mapped in the vibration index (Aug 26); 167 or 168 with Stillness and Octave (Aug 28); 198 (Aug 30 to 31); 140 in the image URL mapping (Aug 31); 298 stone chimes (Aug 31); 55 stones needing Mind/Body (Aug 28) | Early chat (Jul 22), commit log (Aug 24, 26, 28, 30, 31) | Feeds the later 198, 200, 201 and 166 figures above. Treat 198 as the stone database at Aug 30. The 298 chimes are a different count (sounds). |
| Early lore and monster counts | Lore records 191, then 207, then 208 (Jul 22); water-monster entries 74, then 78, then 134 | 32 curated playable water monsters, "from 25 countries" (Jul 22); 191 countries of lore (Aug 22); 191 world-map countries (Aug 30) | Early chat (Jul 22, Aug 22), commit log (Aug 30) | The 208 matches the later "208 tagged" Lore. 134 is the raw database; 32 is the curated set. |
| Early roster counts | 85+ characters (Aug 22 to 23); 130+ (Aug 24); 182 creatures with named characters (Aug 30, morning); about 251 (Aug 30, afternoon); 300+ entries with shadow echoes (Aug 31) | 142 roster and 144 with Ember and Spark (Sep 1, above) | Before the Song and commit log (Aug 22 to 31) | Different slices again. Name the unit before comparing. |
| Early zone, level and hub counts | 25 environments (Aug 21); 9 levels (Aug 27); 37 zones (Aug 29 on); 36 zone visuals (Aug 30); 9 platforms in Canopy City | 10 platforms with the Mesopotamian one (Before the Song); "five hubs" (Observatory, Inn, Undercity, Canopy City, Coast Hub) versus "two hubs" (Canopy City and Coast Hub) in the same Exterior document | Commit log (Aug 21 to 30), Before the Song | The five-hub list and the two-hub line are both in the canon text. Decide which counts: five hubs, or two exterior gateways. |
| Early card counts | Card pool 40 (Aug 24), 76+, 111+, then 117 | Resonance CCG restarts with 12 heroes and 6 card types (Aug 30); 120-card starter decks (Aug 31); later 350 then 395 cards (Sep 22, above) | Commit log (Aug 24 to 31) | Two different games share the word "cards": the early tarot-style pool and the Resonance CCG. |
| Early document and file counts | 168 documents, 3.6 MB (Master Backup, Aug 22 to 23); 119 design docs (Aug 28); 255 md files in the index (Aug 28); 361 docs and 504 commits (Aug 30); 1,552 project files catalogued (Aug 31) | 823, 1,093, 1,310 and 1,339 in the later rows above; 258 files in the Reference Library (Aug 30) | Commit log, Before the Song | The repo copy has 1,975 files. These counts mix docs, md files and all project files. |
| Early file totals | 368 audio files and 1,552 project files (commit 62bb593); audio manifest 318 lines | 387 audio assets after 19 more (commit 0150429) | Commit log (Aug 31) | The same day. 387 is the later one. Verify against the manifest. |
| Sandfall script | `Sandfall.gd` 407 lines (Aug 30, commit efae82d) | `Sandfall.gd` 290 lines, rewritten (Aug 31, commit 8d272cc) | Commit log | One file, `beta/scripts/games/Sandfall.gd`, is in the repo copy. Check its length. |
| Archaeological sites and prompts | 77 sites extracted and 78 prompts (Aug 21) | 91 sites in the master list; 114 prompts in all (36 + 78); 28 prompts in the first two files (8 + 20); 38 prompts in the Concept Art list (A to J) | Early chat (Aug 21), Before the Song | Different files. The 114 is the total Morphic prompt set. |
| Master Storyline layers | 17 fully developed, 20 needing development, 8 completely missing (Aug 22) | Many of the 28 were built Aug 23 to 29 (Loki, Hel, Gardener, Miracle Max, Vanir, Silica Thread, Einherjar, Ragnarok, World Map Transition, Co-op) | Early chat, Before the Song, commit log | Before the Song prints the old count and list. The 17/20/8 is stale after Aug 29. |
| Unfinished sentences | Part Fourteen heading says "six" | Seven items are listed (the seventh is the cabbit); the concept art says "six and the seventh" | Before the Song | Pick six plus one or seven. |
| Composer chairs | "Six formative composers" plus two empty chairs (opening prose) | Nine listed (Bach, Mozart, Beethoven, Chopin, Vivaldi, Brahms, Tchaikovsky, Schonberg, Cohen in the doorway); Cohen called "the Seventh" | Before the Song, early chat (Aug 21) | The early chat filled both chairs (Tchaikovsky, Schonberg); the count in the opening prose is stale. |
| Appalachian stack | Gnomes alone; then four layers (Sprites, Little People, Wood Elves, Gnomes) | Five layers with Smoky Mountain trolls (Aug 22) | Early chat | Five is the last. |
| Frequencies | The Song at 42 Hz; the ocean at 40 Hz; Mirror Systems zones at 84 Hz | The Constant's crystal at 41.7 Hz (opening prose) versus 50 BPM (heartbeat chain); the cabbit's "unknown frequency" is 50 Hz (Aug 28 commit); the "44 Hz question" for the deep lab | Before the Song, commit log (Aug 28, 30), early chat (Aug 22) | Hz and BPM are mixed. Before the Song says 41.7 Hz is the previous universe's Song and 50 BPM is the carrier. The Fluorite 432 Hz is "The Caller" in one text and the Gatekeeper's 432 Hz in another (early chat, Aug 21). |

### 3.2 Gazette strip numbering

| Issue | Detail | Source |
|---|---|---|
| Strip #1 | "The Postmaster's Route" (Sep 12, live ComicStrip #001); script strip #001 painted `gazette_strip_001.png` (Sep 9); Strip Zero "The Greek Yogurt Accord" (Sep 4) filed as zero; repo comics file `strip_001_the_great_renaming.md` and gallery folder `strip_001_postmasters_route` | Sep 4-9, Sep 12-13, repo |
| Strip #2 | "The Oldest Cold Case" (Sep 12). Earlier Sep 1 note says six ComicStrip records already existed. | Sep 12-13, Sep 1 |
| Strip #004 reused | "The Keg and the Name" (Sep 17, called #004); "The Pocket-Change Gate" (Sep 30, Vaulknut, "strip #4"); "Three Mouths, One Braid" (Oct 7, "Strip #4", Vaulknut); repo has folders `strip_004_the_hound_who_stayed` and `strip_004_three_mouths_one_braid`, and `comics/strip_004_the_keg_and_the_name.md` | Sep 14-17, Sep 30 to Oct 8, repo |
| Base44 numbering | In the Elio app's ComicStrip records (47, copied Oct 30), #4 is used seven times, #1 four times, and #2, #3, #5 and #7 twice each. | Base44 records |
| #8 | "Molly and the Bill" (Sep 16, live isPublished true) | Sep 14-17 |
| #9 to #14 | #009 What the Traveler Carried (Sep 18); #011 Three Skins (Sep 19/20); #012 Throat of the Building (Sep 21); #013 Silence Is the Road (Sep 22); #014 City Where Nothing Bites (Sep 23) | Sep 18-21, Sep 22-24 |
| #10 | Repo has `strip_010_the_easel_that_faces_the_wall`; notes never name it | repo |
| #016, #017, #018 | Word in the Flask (Sep 25), Building Has Ears (Sep 26), Sliver That Kept Time (Sep 27) | Sep 25 to Sep 27-29 |
| #019, #020, #021 | #019 Honest Liar (Sep 28); #020 Every Door But One (Sep 29); #21 What the Margin Kept (Oct 1) | Sep 27-29, Sep 30 to Oct 8 |
| #022 to #027 | Booth That Sold Nothing (Oct 2), Stone That Stays (Oct 3), Wall That Keeps Receipts (Oct 4), Form That Stays (Oct 5), Broom That Kept Time (Oct 6), Minutes Are Available (Oct 8) | Sep 30 to Oct 8 |
| #28 to #33 | #28 Helmets Are Honest (Oct 9); #29 Bones Are Honest (Oct 10); #030 Stone Is the Soup (Oct 11); #031 Slot That Was Always There (Oct 12); #032 Breath Between the Bars (Oct 13); #033 Octopus That Wasn't for Sale (Oct 14) | Oct 9-15 |
| Format of numbers | `#001`, `#1`, `#01`, `#21` and `#021` are all used. Notes (Oct 8) list numbering inconsistencies (#004/#4, #020, #21) as an open item. | Sep 30 to Oct 8 |
| Live archive | Only #1 to #3 as of Oct 14 | Oct 9-15 |
| Daily timing | Workflow at 6:00 AM Chicago (Sep 10); spec said midnight server time and Elio proposed "when worth it" (Sep 12, QC law) | Sep 10, Sep 12-13 |
| Missing numbers | Strips #005 to #007 and #015 (as "The Ground Remembers" Sep 24) are not clearly accounted for. #015 has no repo folder. | Sep 22-24, repo |

Ruling needed: one numbering scheme, a rule for "strip zero", and a list of which strips are canon and live.

### 3.3 Names

| Topic | Value A | Value B | Sources | Note |
|---|---|---|---|---|
| Radagast | The Greenward (Sep 3, 17-rename sync) | Sorrel (Sep 10, 149 refs, 74 files); "Greenward" still used on Sep 21 and Oct (portrait owed) | Sep 2-3, Sep 10, Sep 18-21 | Both names persist. Decide which replaced which. |
| Beorn | The Bearsark (Sep 3) | "Bearsark original name pending" (Sep 10); `met_beorn` flag needs renaming | Sep 2-3, Sep 10 | Bearsark is the working name. |
| Archimedes | Noctua (Sep 10) | Merlin/Archimedes repo file name; owl image filenames keep legacy names | Sep 10 | Filenames stay legacy by policy. |
| Brim | Mim (Sep 2 discrepancy with MADAME card game) | Madame Mimm (client list, Sep 9) then Brim (ruled Sep 9) | Sep 2-3, Sep 4-9 | Brim is ruled. The MADAME card-game spelling was not confirmed changed. |
| (a real name) | Solstara (Sep 3) | Luna (Sep 9 "earlier Solstara to Luna"); Luna's real name Taaffeite is intentional | Sep 2-3, Sep 4-9 | Check the roster. The Sep 3 builder sync lists Solstara with 333 references in 68 files. |
| (a real name) | Aurelia (Elio) | Aurallia (client spelling, Sep 3) | Sep 2-3 | Aurallia. |
| Oceanianoir | Oceananoir | Oceanianoir (Sep 3, 91 files); dual-name idea reversed Sep 12, real name stripped from public docs and filenames | Sep 2-3, Sep 12-13 | Oceanianoir. Check image filenames and URLs were re-hosted. |
| Anna | Bramble (Sep 4, the Seer) | "Anna" among Aurallia's children pending; "Anastasia" mystery | Sep 2-3, Sep 4-9 | Two different Annas. |
| John | Quire (NPC, Sep 10) | FOLIO reserved player slot; child's own chosen name may supersede | Sep 10 | Open. |
| Joe | Joe the Miniaturist = The Collector (Sep 9); four Joes become one Joe titled The Collector (Sep 11) | Joe's diner keeps "Joe's"; Exile = The Collector's exiled-era self | Sep 4-9, Sep 11 | Consistent; note the title/ name split. |
| The Crone | Ragana (Sep 9); Egg Hatchery event stays "The Crone's Casting" | Hopkins-like eyes for Charon and The Crone (Aug 31) | Aug 31, Sep 4-9 | Descriptor stays. |
| The Archivist | (a real name, earlier) | Harry (Sep 11) | Sep 11 | Image files in the S-stack still carry the earlier name. |
| Royal / Vestibule | "The Royal" named first (Sep 2); "The Vestibule" in the push summary for the ROM counter-thesis | "Level 3B hidden archive" formalized Sep 11 as The Royal | Sep 2-3, Sep 11 | Unclear if The Vestibule is a separate component. |
| Bait / Naut | Royal spec still says "Bait" as a keeper identity (Sep 2 autocorrect) | Naut | Sep 2-3 | Fix in the spec. |
| Crested gecko | Vessel title first the gecko | Eres the cabbit is the Vessel; gecko named Ziggy (Sep 10) | Sep 10 | Eres. |
| Calder | Miracle Max (Sep 4 profile gap list) | Calder (Sep 22) | Sep 4-9, Sep 22-24 | Old link works. |
| Bill | Duck and platypus merged into "Bill the Duck" (Sep 11) | Bill the Platypus (Sep 2 spec); "Duck" aloud (Sep 16); Duckee's platypus mascot (Oct 14) | Sep 2-3, Sep 11, Sep 14-17, Oct 9-15 | Official name Bill the Duck; platypus mascot gag is separate. Confirm. |
| Pope-hat critter | Minion with pope hat (Sep 2) | Bob, the Pope-Hat Fizgig (Sep 19); pope-hat goblin named Bob (Sep 11) | Sep 2-3, Sep 11, Sep 18-21 | Bob. |
| Unvoiced | "shadow knights" working label | The Unvoiced (Sep 17) | Sep 14-17 | Unvoiced. |
| Water layer 4 | "Underground Lozen" | Memory's Illusion (Sep 10) | Sep 10 | Memory's Illusion until revealed. |
| Wart | Arth/Cub (Elio) | Artair, Artorios, Arcturus (Sep 10) | Sep 10 | |
| Crystal Canticle | Working title | Not ruled | Sep 26, Sep 27-29 | Open. |
| Fizgig | Umbrella term; Grit is NOT a fizgig (Sep 11) | "Fizgigs" also means the builders (Aug 31 on); pope-hat "Fizgig", Broom Fizgig (Oct 6) | Sep 11, Sep 30 to Oct 8 | Builders and in-game fizgigs share the word. Flag in the manual. |
| Named cast | Ember and Spark placeholder names (Sep 1) | Real hearth sprites; roster 144 | Sep 1 | Done. |
| Kandinsky | Clockwork Skies art alt (Aug 31) | Retired to Shadow Inn "Archive of Alternate Versions" (Sep 4) | Sep 4-9 | Dali is canon. Duplicates of Kandinsky prose remain in specs. |
| Aug 24 copyright renames | Aug 24 batch (commit 4b4f602): Madame Mim to Madame Mimic; Radagast to The Greenward; Beorn to The Bearsark; Jareth to The Ravel; Uhtred to The Wayfarer; Aughra to The Augur; Archimedes to Noctua; Wednesday to Wednesday, then Belladonna; Ryuk Form to True Form | Commits Aug 25 to 30 still use Radagast, Beorn, Uhtred, Jareth and Mim (a dated Aug 25 Jareth commit; the Aug 30 dialogue tree uses Beorn, Radagast, Uhtred). Aughra became Fibonacci on Sep 3. Before the Song still uses Wednesday, Aughra and Jareth. | Commit log (Aug 24 to 30), Before the Song | Belladonna, Madame and The Wayfarer were confirmed final on Aug 24 (commit 8f278b5). The rest was not carried through every file. Check filenames, the Ravel/Jareth choice and the Wayfarer/Uhtred choice. |
| Mim, Madame, Brim (early chain) | Aug 24: Madame Mim to Madame Mimic to Madame (final) | Aug 30: Madame Mim to Mim across all docs (19 files, filenames changed); Aug 30, 22:32: Mim to Brim in the beta files | Commit log (Aug 24, 30) | Two renames in one week point opposite ways. Brim is ruled Sep 9 (row above). Magritte Pipe became "Monsieur Sentient" on Aug 30; the Pipe is still "Mim's pipe" in Before the Song. |
| The Sentinel's name | A real name (questline and class name, to Aug 30) | Lozen (Aug 30, 12 entries renamed): Lozen is the in-game Sentinel (boxer); Quire is the scholar NPC that replaced a real person's name | Commit log (Aug 30, 22:32 to 23:29) | The Aug 30 chain went through three temporary names (Tobias, John, Lozen) in one hour. Final: Lozen and Quire. Before the Song still uses the earlier name for the Sentinel. |
| Unseelie King's name | Jareth (Before the Song, roster); renamed The Ravel (Aug 24); Aug 25 commit restores the original Jareth design (Architect of Stairs) | Daedalus, builder of the Labyrinth (Before the Song 9.6 and 11.2, early chat Aug 22); Malachi (Sep 10, above); "cousin" in headings and "brother" in dialogue | Early chat, Before the Song, commit log | The same figure under several names. Malachi is the latest ruling (Sep 10). |
| Seelie King: name and casting | Casting reference changed twice before Aug 30 (a contradiction flagged in `seelie_royalty.md`); Before the Song gives a different personality and no actor in the Compendium profile | Named Oleander on Aug 30 (pronounced "Leander", silent O); five names were offered | Early chat (Aug 22), Before the Song, commit log (Aug 30) | The Aug 30 docs treat Oleander as final, but the commit does not say the client chose it. Row above (Seelie King) shows the Sep 10 original-face ruling. |
| Gardener, Radagast, Beorn | Early chat Aug 21 to 22 (one passage): the Gardener is Beorn, with Radagast and a hedgehog visiting | Early chat Aug 22 (another passage): Radagast becomes the Gardener; Beorn is the Mediterranean border guardian; first draft had the Gardener as "she" | Early chat (Aug 21 to 22) | The two passages disagree. Later: Radagast became Sorrel (Sep 10) and Beorn the Bearsark. Roster should say who tends the garden. |
| Murloc | Murdoch, then Murlic (Aug 29, the client's own original character name, not a typo) | Murloc one minute later (Aug 29, autocorrect fix); "nameless by design" (Sep 11) | Commit log | Final: Murloc, as the species. Individuals have no names. |
| Elora Nightbloom | Elora Nightbloom (to Aug 30) | Briar Nightbloom (Aug 30) because the first name belongs to a film | Commit log | Briar. Check old filenames. |
| Marijke | "Dutch rock hound" (Aug 26) | "The Volvo Valkyrie", then Volva, a Norse seeress, "not the car" (Aug 30); accent Dutch to Swedish | Commit log | Volva is final. Regional Voice Profiles list her as Dutch and later Swedish, so the profile file may be stale. |
| Cthulhu: place and name | By the main-floor fireplace (Compendium, Walk-Through 3.8) | In the catacombs (Walk-Through 9.7, tree diagram); Crystal Core true form at the deepest water layer; Cthulhu to Naut in the beta (Aug 30) | Early chat (Aug 22), Before the Song, commit log | The Compendium says the corner moves. Naut is the beta name. Atlantis keeper at Layer 6 and the Crystal Core at Layer 7 versus "Atlantis is the deepest" (Exterior Part Nine) is also unreconciled. |
| Keeper and Aughra | The Keeper is a gargoyle (adaptive frequency, amber stone, curled like a cat) | The Keeper is also a character called Aughra who lives in the Geode Cave (Before the Song); the Keeper is an archetype with one per culture (early chat, Aug 21) | Early chat, Before the Song | Unresolved. Aughra was renamed Augur (Aug 24) then Fibonacci (Sep 3). |
| Svartalfheim | Deep Forge (dwarves), with Nidavellir | The Unseelie Court (Fae Kingdom) in the roster and tiers | Before the Song | Before the Song says treat Unseelie Court as Svartalfheim and Deep Forge as Nidavellir. Not ruled. |
| Staircase name | Alchemical Staircase (most docs) | "The Bifrost" (Mesopotamian doc) | Before the Song | Same staircase with a mythic name. |
| Wayfarer | A wandering NPC with a mobile campfire (the Uhtred figure; renamed The Wayfarer Aug 24) | Misspelled "Wayfairer"; also "Wayfarer" is a Story-Born Ent | Before the Song, commit log | Two different characters share the word. |
| Morrigan aspects | Maiden, mother, crone (Before the Song, opening prose) | Chooser, Washer, Sovereign (three); four with the Dreamer once the client said the Morrigan and Queen Mab are one being (Aug 22) | Before the Song, early chat | Four is the last ruling. |
| Duck and the Vessel | The Duck (platypus-like critter, "she" per the client, Aug 22); Vessel is a crested gecko on the left shoulder (Before the Song) | Both appear as player companions in the opening prose; the roster calls the Duck a companion and the Cabbit the Constant's | Early chat, Before the Song | Later rulings: Eres the cabbit is the Vessel and the gecko is Ziggy (Sep 10, row above). The gecko text in Before the Song predates that. |
| Cabbit | Belongs to the player's room and the Captain's Arcana (opening prose); the Constant's companion Eres and the original ship's heart (4.2) | Pirate is the cabbit versus pirate rides the cabbit (client never chose, Aug 21); Eres adores Charles (Aug 24) versus Eres departs (Aug 28) | Before the Song, early chat, commit log | Eres is the name (Aug 28). The role is unsettled. |

### 3.4 Rules and structure

| Topic | Value A | Value B | Sources | Note |
|---|---|---|---|---|
| Bundle prices | Arcade Pass $14.99, Complete Inn $49.99 (early) | Arcade Pass $29.99 (52 core games), Legendary Bundle $24.99 (later); not discussed with the client | Aug 31 | Not ruled. Open. |
| Frequency toggle key | Tab (hub description) | T (`project.godot` input map) | Aug 31 | Check the project file. |
| Hitchcock five-director gate | All five pass | Six directors (Cameron) | Sep 2-3, Sep 30 to Oct 8 | Update the gate. |
| Gazette board spec | "Daily at midnight" | "When worth it" (QC law) | Sep 12-13 | QC law is the current wording but was not explicitly ruled. |
| Comic spec field | `playerAdventures` boolean | string (Sep 12) | Sep 12-13 | |
| Design Principle #8 | The Steady Light Law (epilepsy-safe design; #8 in the Project Bible since Aug 21; cited as #8 by the Every-Mind Welcome charter, the quest mark law and the Digital Companion spec) | The Spine Law (ruled as #8 on Sep 12 in the lower-case Bible, which had no 8 to 11; the number is part of the ruling, 8 as a sideways infinity; cited as #8 by the Silica Thread questline and Gazette strip #003) | Project Bible, both copies; found in the Nov 2 merge | Both kept as #8 in the merged Bible until ruled. Renumbering the other one means updating the files that cite it. |
| The Host's face | The actor's own face and look (first profile, `docs/geode_inn_the_host.md`, Aug 22; the earlier picture `the_host.png`) | An original design, unattached to celebrity likenesses (master dossier, Sep 11; the canon portrait `the_host_v2.png`) | Aug 22, Sep 11 | The Oct 31 tribute ruling keeps the likeness out, so the profile's appearance lines should follow the dossier. |
| Fizgig messaging | Direct to builder (tried Sep 1) | Email to client who pastes | Sep 1 | Email is current. |
| Hatching notification | Flashes white | Sine-clamped amber glow (Steady Light Law) | Sep 11 | Amber. |
| Heartbeat | Steady 50 BPM metronome | Spiral Heartbeat (Lateralus cycle) | Sep 11 | Spiral. |
| Frog Court | "Don't Be a Froglodyte" poster (Sep 12) | Also voice abuse goes to Frog Court (Sep 25) | Sep 12-13, Sep 25 | Consistent. |
| Black and White colors | White sanctuary/law, black shadow (earlier) | Black fertile darkness, white illumination (Sep 22 ruling) | Sep 22-24 | Sep 22 wins. |
| Card library | 350 cards, 15 Legendaries | 395 cards, 18 Legendaries with Grey | Sep 22-24 | Later wins; "Grey" counts as a sixth color. |
| Beta | Oct 1 public beta (client idea) | Oct 1 small private beta; Oct 10 invitation | Sep 22-24 | Outcome unknown. |
| Elio's Aug 31 "arcade live" | Fully stocked | Catalog only, not playable (retracted Sep 1) | Sep 1 | |
| Dew Circuit | "Zone with its own record" | Dual mode law ruled Sep 12; client said already decided on Sep 14 | Sep 12-13, Sep 14-17 | No conflict, but ruling date is Sep 12. |
| Fae Kingdom art | Dali (old prose) | Rackham, with Lee on Seelie court and Bauer on Unseelie; Seelie sound Harlots-style baroque (Sep 26) | Sep 4-9, Sep 26 | Later wins. Howard Shore target replaced. |
| Seelie King | Mikkelsen or Coster-Waldau casting | Original face, Oleander (Sep 10) | Sep 10 | Oleander. |
| Tinkering Weeaboo | Direct family (Sep 11) | Title kept; player may rename | Sep 11 | Consistent. |
| Pipeline phase 3 hold | HOLD_PHASE3 in place | Lifted Sep 24, later reports mixed | Sep 22-24 to Sep 30 to Oct 8 | Marker gone by Oct 8. |
| Great Hall parcel | "Staged" (Sep 25) | Committed 7b1a4ed (Sep 26); two independent versions merged; and "staged" again on Oct 15 | Sep 25, Sep 26, Oct 9-15 | Confirm the repo file `slow_walk_parcel_01_great_hall.md` matches the merge. |
| Image counts for Royo | 168 cards planned | 157 composed | Sep 14-17 | |
| Scoreboards versus anti-FOMO | Core philosophy: no deadlines, no limited-time events, no scoreboards, no missed beats (Before the Song, Origin Part 6) | The client asked for a scoreboard and optional pairing competition (Aug 21, Leaderboard entity built); The Hook leaderboard ranks by fewest hooks (Before the Song); Tetris high-score rule (Aug 26); December Highland Games and Gazette season (Sep 14, Sep 10 log) | Early chat (Aug 21), Before the Song, commit log (Aug 26) | Both stand. A ruling is needed on whether leaderboards and seasonal events are allowed. The tabletop analysis also suggests time-limited annual festivals. |
| Combat | No lethal combat anywhere; combat is Harmonization; no XP, no levels (Before the Song) | Tabletop analysis suggests combat as one of three resolution paths (Aug 21); the five-class plan builds Taunt and Enrage and a Stance System; "harmonization combat in three visual styles" (early chat, Aug 22) | Before the Song, early chat | Reconcile the wording "combat" with Harmonization. Nothing shows the client ruling on the tabletop suggestion. |
| Voice and dialogue | Text plus tone profiles, no voice acting; recorded lines for key moments only; TTS only with an original voice (early chat, Aug 22) | Wake word "Innkeeper", Voice Constancy Law and full voice overlay at launch (Sep 25, above) | Early chat (Aug 22), existing Sep 25 log | The Aug 22 line was written before the Spoken Road. Confirm that the Spoken Road work follows the original-voice rule. |
| Outreach | Client to pitch authors, Elio offered a draft (Aug 20) | No interviews and no outreach (Sep 13 standing rule) | Early chat (Aug 20), Sep 13 log | The Sep 13 rule is later and wins. Check whether the Aug 20 pitch was sent. |
| Platform plan | AzerothCore as a blueprint for the Fae Kingdom approach (client, Aug 18); WoW emulator as core database (client idea, Aug 20, Elio advised against) | "AzerothCore approach officially scrapped" (Aug 29 commit, Elio); Norrath Quest System deprecated for native quests (Sep 2) | Early chat (Aug 18, 20), commit log (Aug 29) | The Aug 20 decision was a Godot game with a local database and Base44 as cloud sync, WoW only as design craft. Aug 29 matches. Not a conflict; recorded so no builder reopens it. |
| Logo | Aug 24: hybrid of a full geode frame and a gear-tree loop (concepts V1 to V4) | Aug 31: Antikythera mechanism atop an underwater world, circular, no text, "confirmed by the client as the official logo" (commit 58bab2f); Oct: the tree as the app logo button is being considered | Commit log (Aug 24, 31), 2.7 | The Aug 31 logo replaces the Aug 24 one. The Oct tree-as-logo idea is separate and open. The baby dragon logo (Jul 22) was never marked final. |
| Artist-to-layer map | Aug 22: Catacombs Klimt, Staircase Matisse, Cosmology Dali (Aug 24 commit: Matisse replaces Dali on the staircase) | Early chat tree spine places Dali at "Canopy" (cosmology level) while Canopy City is Emily Carr; Before the Song's older draft gives Coast as Carr, the newer gives Coast as New England Gothic (lighthouse); Sep 4 puts Clockwork Skies at Dali | Early chat (Aug 22), Before the Song, commit log (Aug 24) | The later ruling is New England Gothic for the Coast and Dali for the cosmology level. Carr stays with Canopy City and Redwood. Main floor Matisse was replaced by a subtler version (Aug 31). |
| Staircase artist reason | Matisse is transformation; Dali is distortion (Aug 22) | Seven-artist spine in Before the Song (Klimt, Matisse, Van Gogh, Dali, Carr, Mapplethorpe, Bosch) versus nine rows in the Aesthetic Spine table (adds Rousseau, Book of Kells, Rodin, Pollock) | Before the Song | The table grows across the document. Use the final table, not the "seven artists" line. |
| Bundle prices (Share Wood) | Share Wood tiers 9, 49, 99; Complete Inn bundle 99.99 with all 6 products (commit c51d7f6, Aug 30) | Complete Inn 49.99 (existing row above, Aug 31) | Commit log (Aug 30), Aug 31 row above | The Aug 30 figure is a commit message; the Aug 31 figure is Elio's. Neither is ruled. |
| Seelie and Unseelie roles | Unseelie is the last master of the old system and Seelie the first of the new (early line) | Unseelie is creator and new; Seelie is keeper and old; the Seelie King "chose the old" (later passage, Aug 22) | Early chat (Aug 22) | The later passage wins. The early line needs fixing in the docs. |
| Song growth | The Song grows from three notes to seven | The Song was never growing: one note heard differently (Seelie King and Newgrange passage) | Early chat (Aug 22) | The later passage wins. |
| Peruvian quest reward | Peridot (opening prose) | Dreamstone (Before the Song, section 6.8) | Before the Song | Pick one. |
| Survivors of the Song: final stone | The ordinary river stone from the Duck completes the formula | The egg is the final and the FIRST stone (Part Twenty-Six) | Before the Song | The river stone completes the formula; the egg is the stone the Erasures cannot erase. Not ruled. |
| Einstein's speech | Einstein is the only plain, complete speaker (847 words, once) | Andy Weir-style plain speech in the national parks is "the second place in the Inn where plain speech lives" | Before the Song | Compatible; recorded so editors do not state "only" without the exception. |
| Number of cycles | "Forty-two cycles" (Crone, Einstein) | "Billions of cycles" and "4.7 billion layers of tarnish" (Observatory) | Before the Song | Treat 42 as a spoken figure, not a hard number. |
| Pronoun for the Duck | "It" in early text | "She" (client correction, Aug 22) | Early chat | She. |
| Early Persephone and Hades | 50 First Dates structure: each ascent erases her memory, Hades repeats his devotion (client, Aug 22; commit Aug 23) | Regal, bifocal Tide Queen; Hades as harbor (Aug 25 commit, Elio; "unintentional grooming echo" removed) | Early chat, commit log | The Aug 25 redesign is Elio's decision in commits, not a recorded client ruling. Check `geode_inn_persephone_hades.md`, which may still carry the first version. |
| Spiral Gallery | A Guggenheim-style museum of all fine art (Jul 22); a museum separate from Klimt's Catacombs | Dissolved on Aug 23 into the "Embedded Artist" idea (client, Aug 22 or later); later a six-chamber descent and puzzle destination (Aug 23 to 29) | Early chat, commit log (Aug 23, 29) | The museum idea is retired. The gallery survives as a six-lens destination. |
| Dialogue counts (early) | 46 merged dialogue DB entries for 29 NPCs (Aug 30 commit); 35 dialogue entries plus hook words for 29 NPCs (Aug 30) | 18 NPC dialogue trees, 1,353 lines, 21 NPCs, about 80 nodes (Aug 31); later 78 entries and 21 NPCs in Godot (3.1) | Commit log (Aug 30 to 31) | Different slices of the same dialogue set; name the slice before comparing. |

---

## 4. Decision log

Date | topic | ruling. All rulings are the client's unless the line says otherwise. Proposals not ruled are marked "Proposed". Lines marked "Elio ruled" were decided by Elio and not objected to. Dates are as recorded in the chat logs.

### July 12 to August 20

Source: the early chat. Rulings only. Performer references used as casting direction are left out of this manual by design; see the Aug 21 to 23 note.

- Jul 12 | Platform | The game hub is a separate Base44 app linked from the existing business site ("clean separation", no full rebuild of the shop). Elio proposed a subdomain; no ruling on the address.
- Jul 12 | Data | Stone data comes from the client's own book (long and abridged versions), delivered through Google Drive.
- Jul 22 | Naming | The project is named "Geode Inn". Game hub, archive, market and games become one app, one brand, one world. The working name "Soulstice Game Hub" is dropped.
- Jul 22 | World | The Inn is a giant tree with a hobbit-hole feel: upstairs for theories on sky gods and the universe, downstairs for what lies beneath cities (catacombs, old civilizations), the main floor is the Inn. Names Main floor, Upstairs (the branches) and Downstairs (the roots) agreed.
- Jul 22 | Library | A "Modern Day Legends" shelf (not "conspiracy theories") sits in a nook off the main floor beside readable copies of modern religions. The Inn stays neutral and does not rank or editorialize.
- Jul 22 | World | The staircase between floors is the alchemical chamber, with alchemical symbols and the four stages (nigredo, albedo, citrinitas, rubedo).
- Jul 22 | Site | The archive and game are only loosely linked to the business site (a quiet optional link). The client will also sell as an artisan in the market.
- Jul 22 | Scope | No focus on the last two centuries of history; "just the old stuff" (the pre-industrial cutoff).
- Jul 22 | Tone | Scholarly, atmospheric, mythological, like an ancient library with games in it (not a party game).
- Jul 22 | Games | Ancient sites become puzzle games themed to the site's mythology; Stonehenge as a Tetris-like game was the client's first example. Each documented water-monster body of water gets a game where you are the monster. A Bastet game where you herd cats ("Bastet's Herding").
- Jul 22 | Zones | A whole basement area is the Fae Kingdom with Seelie and Unseelie courts, stone circles as portals and an MMO-style game option.
- Jul 22 | Platform | Hybrid plan agreed in principle: Base44 hub as web home base and database, mini-games and the Fae Kingdom in Godot, a Steam release that packages the Godot parts.
- Jul 22 | Art | The world map and tree interior are organic and walkable (Darnassus-like), and the map is a fantasy parchment map. Fae are not chibi and the Morrigan is never chibi. Anansi is a chibi. The dwarf blacksmith is Thorin-like. The baby dragon is cat-like and heraldic (not yet final as mascot). The Owl is a barn owl.
- Jul 22 | Characters | Odin shown in two forms: the Wanderer (approachable, comic chibi ravens) on the main floor and the Allfather (full authority) upstairs. Cthulhu is a wandering scholar NPC. Six gargoyles as architecture with resonance frequencies.
- Jul 22 | Music | World music is classical and cultural music stylized as electronica to fit the time and area.
- Jul 22 | Library | The Serrano story is Entry 1 on the Modern Day Legends shelf.
- Aug 11 | Process | Elio gets write access to Drive (read-only before) and keeps two documents there: world-building notes and a living Project Bible updated after each session.
- Aug 18 | GitHub | The client creates the GitHub account and agrees Elio creates the repo and pushes code and docs (`geodeinn/geode-inn`).
- Aug 18 | Quests | Fae Kingdom approach follows AzerothCore in spirit: reskinned starter zones per culture and quests based on how each culture built and wrote. Quest base follows the nine planes of Norse theology. Atlantis belongs with Ancient Greece. Knossos labyrinth puzzles and a formal remembrance-vision mechanic. Cat symbology in the Bastet zone overlaps Freyja's cats.
- Aug 18 | Library | Old public-domain books are offered through the app and game; the library is saved under "Geode Inn" on archive.org and library cards link to archive.org copies instead of storing PDFs in Base44.
- Aug 18 | Rule | Content from one named publisher stays out of the game entirely. Sources are checked for a white-supremacist slant and for paganism-equals-satanism framing; flagged material is excluded or used only as a case study on the Modern Day Legends shelf.
- Aug 19 | Library | The "bb" folder (that publisher plus Thule Society and hyperborean titles) is excluded (Elio ruled, client did not object). The Living Book system (classic literature as interactive rooms) is agreed. Steam Deck uploads go to a Drive folder "from steam deck".
- Aug 20 | Platform | Base44 plan upgraded to Elite on monthly billing.
- Aug 20 | Elio | Elio is the "core intelligence" behind the Owl in the Steam game (Dungeon Master or Oracle presence), via the Base44 Agent API.
- Aug 20 | Architecture | No WoW emulator core. Godot game with its own local database (headless Godot server), Base44 as cloud sync, Elio called only for special AI moments. WoW quest and NPC craft is used as a design blueprint.
- Aug 20 | World | The game is an Azeroth-looking open world, solo by default with optional multiplayer; each culture has its own survival-style (Don't Starve, Stardew) quests; arcade games become activities inside regions.
- Aug 20 | Process | The client runs Morphic (text-to-video) by hand into a Drive folder "game videos"; Elio writes prompts and extracts frames. Three phases: visual catalog, Godot scene code from frames, repeat per zone.
- Aug 20 | Owl | Once in a while the Owl answers a truly cosmic question with "42" (Elio set it at about 2 to 5 percent).

### August 21 to 23

Source: the early chat (the Aug 22 and 23 entries are dated "Aug 22 or later" there) and the Aug 21 to 23 commits. Many characters were ruled by naming a performer as the voice, manner or look reference. Those references were left out here and are not part of the manual's canon.

- Aug 21 | Zones | An underwater layer is added, partly so mermaids and naga can be playable and to reach real caves from the water.
- Aug 21 | Rule | Aryan and Arya material follows the existing neutrality rule (original sources, on their own terms, flagged for careful handling).
- Aug 21 | Language | Any book is readable in the language the player picks, routed through a language family tree, with English only a last-resort bridge. Translations are cached as data and PDFs are made on demand.
- Aug 21 | Process | A Drive folder tree is created for the interactions, with Project Bible v3 and the origin story. The client-and-Elio dialogue becomes a chapter of the origin story, Part Six "The Conversations That Built the Inn".
- Aug 21 | Classes | Six starting classes: five from the client's tabletop character sheets plus The Sentinel. The Sentinel is Full Presence (not chibi) and "not tall": compact build, low center of gravity, a presence aura that makes NPCs see her as larger on first meeting.
- Aug 21 | Music | World music is recorded by a female lead vocalist and a musician partner, "the Inn's resident musicians", not NPCs or classes, heard in every zone.
- Aug 21 | Zones | Atlantis is a full zone with merfolk as a playable species (5 sub-zones), Cthulhu is woven into Atlantis lore, and octopi are the oldest expression of the Silica Thread (Cthulhu becomes an Atlantean who took octopus form).
- Aug 21 | Characters | The Architect of Stairs (a feathered Labyrinth-style Fae) is accepted. The Cabbit (cat and rabbit hybrid that turns into a space pirate's ship) is accepted; the pirate's glimpses and mischief are never explained.
- Aug 21 | Games | Leaderboard and optional pairing competition built. Geode Pinball designed.
- Aug 21 | Quests | Champions of Norrath style quests are the template for zone quests (spec for Egypt, Norse Fjords, Peru, Celtic). A Kelethin-style canopy zone with thin beams ("The Canopy of Sála") approved. The Song of Making is hidden subtly on a golden contract deep in the Irish fae storyline.
- Aug 21 | Characters | Council of Thinkers approved in full. Bard Blowhard is loud and overbearing but devoted. The Keeper is an archetype: one Keeper per culture, the Inn's Keeper is the master (21 mapped). Grit is four inches tall, shorter than the brownies.
- Aug 21 to 22 | Zones | The US National Parks become a chapter, "the veil" (7 parks mapped).
- Aug 21 to 22 | Characters | The Host is the first NPC at the door. The Catalyst is a bartender and grower who turns told stories into seeds (the story seed rule). Sacred Trio: Host as Father, Catalyst as Spirit, Crone as Word, with the Bard as the Fool who loves all three. The Inn itself is an Ent (Inn-Tree) plus four Story-Born. Brownies clap coconut shells. Ravens resemble door knockers: adorable, snarky in very low tones. The two Courts use owls as official messengers and a small Fae, Wisp, as the secret channel.
- Aug 21 to 22 | Characters | Charon is the ferryman to the catacomb water layer (the obol is a stone from the player's collection; always "...There you are."). Cerberus is a dog named Spot. The death sequence uses "Your name is known, your rest is earned" (7 beats). Anubis gets a full profile.
- Aug 21 to 22 | Market | MarketItem and PlayerInventory entities approved. The maker does not design rings, but the ring sample stays as forthcoming (not in stock). Other artisans can show works in progress and an optional output link.
- Aug 21 to 22 | Classes | The Artisan Thief is a selkie. The Tinkering Weeaboo is a changeling (annoyance meter 0 to 4; Level 0 is the real form). The Siren and the Pirate are added to the family roster; the Pirate is the Dread Pirate Roberts as a title passed on. Madame Mim is the player's companion who causes chaos at least once a day.
- Aug 21 to 22 | Zones | Start with Greece (the pomegranate on the main floor ties to Hades), then Camelot. Camelot has sacred geometry and alchemy, Avalon has alchemy, and a hidden catacomb layer leads to Newgrange. The Seelie Kingdom resembles Lothlorien. Then China.
- Aug 21 to 22 | Characters | Merlin comes with the owl Archimedes. Arthur appears at three ages. Galahad is "the complication" (the pure knight whose purity is the problem). The Morrigan and Queen Mab are one being (four aspects). Mordred keeps Elio's first interpretation. The Queen of Webs is tied to the Fates and Norns. Loki goes against stereotype. The best-friend bond is Bard and Pirate. Bastet gets a fourth face (the Voodoo Queen). The Gardener is Beorn with Radagast visiting (see 3.3).
- Aug 21 to 22 | Characters | Persephone and Hades follow a memory-loss structure ("50 First Dates"), replaced by Elio on Aug 25.
- Aug 21 to 22 | Rule | Lost Books (concepts only, no copyrighted text) for the Miskatonic Annex under Modern Day Legends. Cthulhu stays by the fire; the Annex is a brick building on the Inn grounds.
- Aug 22 | Music | The Music Room has nine Song-catchers, with two added chairs filled the same day.
- Aug 22 | Characters | Charon is cast as the Crone's silent counterpart. The three Greek philosophers sit on the staircase (Socrates bottom, Plato middle, Aristotle top). The Seelie King and Queen are two people whose lives were chosen before birth.
- Aug 22 | Zones | The elf city in the woods is the Canopy City, a Silk Road hub with a vendor per culture (vendor map saved). A star gate in the tidal caves leads to Atlantis. Lighthouses are added. The Pirate is the way into the tidal caves (six-cave tide chart). The Slavic zone is the Fjord of Stars. A Redwood zone of exploring, climbing and pit houses without harm. Sky pirates and clockwork skies. A Bayou and Buried Cities zone.
- Aug 22 | Dialogue | Text plus tone, with cadence and tone voice profiles per character, no voice acting, optional recorded lines for key moments. Extracting tempo, pitch range and pauses from public performances is allowed; no voice cloning and no TTS fine-tuned on a reference actor. A voice-profile extraction tool is approved.
- Aug 22 | Quests | The Unseelie King is also Daedalus; the Queen of Webs is also Ariadne (quest "The Thread and the Star"). The moon launch is a final vibration puzzle, kept as a lullaby, not a weapon. The Messenger Principle and the Nook Effect are set as the user experience statement.
- Aug 22 | Characters | India's voice is Kali, with Vishnu dreaming the aurora. The Norse vendor is Erik, and the Last Kingdom prototype wanders as a neutralizer NPC. Peru has mountain spirits (the Apus). Radagast is a resident (the Gardener of the Inn). Retort and Cook, Thrum, the Guest (catacombs host), the Duck (a platypus-like critter, "she"), Leonardo, Gesso and Wrought are added. Five smiths.
- Aug 22 | Systems | Progression is shown by a Song Spectrum, Frequency Shift and Resonance Pulse, with harmonization combat in three visual styles. Stones are kept as capsules with the just-won companion fighting beside the player. A visual heartbeat line (the Pulse Line) is added for players who dislike touch or hearing overstimulation.
- Aug 22 | Art | The museum idea is dissolved into the Embedded Artist idea: the Inn is the museum. Artist styles: Greece in Monet's style, Egypt in O'Keeffe's, Redwood in Emily Carr's, the Catacombs in Klimt's, the Alchemy Staircase in Matisse's (not Dali), the Cosmology level in Dali's.
- Aug 22 | Process | Project Bible master backup compiled (168 documents). The "odin 2" folders moved into the geode inn Drive folder; text documents synced to GitHub, binaries listed in a manifest only. A complete game walk-through was written.
- Aug 22 to 23 | Characters | Hel, the Gardener and the kings' arc are done (Elio had wrongly listed Loki as missing). Compendium written.

### August 24 to 30 (from the commit log)

The chat for these days is missing. Entries say "Ruled (commit)" only where the commit message says the client decided or confirmed. Other entries are "Built (commit)" or marked as Elio's own decisions.

- Aug 24 | Names | Ruled (commit 8f278b5): the new names Belladonna, Madame and The Wayfarer are final after the copyright name audit. Reason: all three are original or public domain and identity lives in behavior, not in copyrighted labels.
- Aug 24 | Names | Elio ruled (commit 4b4f602): nine copyright-safety renames (see 3.3). Not carried through every file.
- Aug 25 | Art | Ruled (commit 06c7835, 6bf9294): Lichenblossom's look is final (pale skin, deep red dreads, a Van Gogh complementary palette); Ryan's warm campfire version is locked (pirate-assassin-vampire-hunter bartender).
- Aug 25 | Characters | Elio ruled (commit 89d67e0): Persephone is redesigned as a regal, bifocal Tide Queen and Hades as a harbor; the memory-loss pattern is removed.
- Aug 26 | Games | Ruled (commit 469003c): the Tetris crown stays with the client until someone beats her; Marijke holds the other arcade high scores.
- Aug 28 | Names | Ruled (commit b0010de): the character name Vaulknut is confirmed. Built (commit bdbe90b): the cabbit is named Eres in all references.
- Aug 28 | Process | Built (commit 4354958): the Living Book system extends the existing Book entity instead of duplicating it.
- Aug 29 | Narrative | Ruled (commit 11f0a2e): the Einstein Syndrome addendum is named by the client.
- Aug 29 | Names | Ruled (commit aa8f344, 54734bf): the fish-creature keeps the client's original name; the autocorrect "Murlic" is fixed to Murloc.
- Aug 29 | Process | Elio ruled (commit 46c266b): the AzerothCore approach is scrapped; the Inn uses native game architecture.
- Aug 29 | Names | Built (commit fb262c1): the chemistry character's real name becomes Oceananoir in 17 files.
- Aug 30 | Art | Ruled (commit 3246c09): the client's 3-gap list in the master zone audit is closed (Bayou complete). Ruled (commit 4b9422c): the Sentinel questline v2 is reconciled with the client's Sentinel class doc (vulnerability, not discovery; Cosmic Riddle trait; Faceted Defense).
- Aug 30 | Names | Built (commits fd277f8, 7745368): a real person's name is purged from all NPC docs and replaced by Quire; Lozen becomes the in-game name of the Sentinel (boxer). The commit chain went through temporary names within one hour.
- Aug 30 | Names | Built (commit 8475acf and neighbors): the Seelie King is named Oleander, pronounced "Leander" with a silent O. The commit does not say the client chose it.
- Aug 30 | Art | Built (commit 078fbb0, Elio designated): the Aug 27 straight-on librarian portrait is the canonical Crone reference; all others are alternates.
- Aug 30 | Rule | Built (commit 4458ec6): NPCs come from the 191 world-map countries; accents are roots, not assignments. Built (commit 8f67748): celebrity features are softened per art rules; performer names are direction references only.
- Aug 30 | Names | Built (commits fe80e13, b4aae5f, efae82d): all 29 beta NPC names made IP-safe (no book or film character names); performer names removed from voice profiles; Mim becomes Brim, Cthulhu becomes Naut, Player Guide becomes Lark in the beta files; Elora Nightbloom becomes Briar Nightbloom.
- Aug 30 | Product | Built (commits 35b724d, abcaa82, 3233e60, c51d7f6): Bead Composer is hosted at geodeinn.com as part of the Geode Inn site ("two doors, one engine"); Share Wood has no approval and no transaction fees, tiers 9, 49 and 99, and faires choose from the Inn's 37 curated styles; a Complete Inn bundle at 99.99 with all 6 products.
- Aug 30 | Characters | Built (commits 04b7924, 57db80a, c877b32): Marijke is a Volva (Norse seeress), the car-brand idea removed; Bella is the black cat assassin and Peach the orange and white genius (descriptions un-swapped).
- Aug 30 | Logo | Ruled (commit 58bab2f, stamped Aug 31, 04:31): the Antikythera mechanism atop an underwater world, circular, no text, is the official Geode Inn logo. It replaces the Aug 24 hybrid.

### August 31

- Aug 31 | Offline | Steam apps play offline; stone images are local set-design assets, no URL links. Web beta may keep URLs.
- Aug 31 | Crafting | Build the Bead Board first; generate 110 metal-finding images now, specialized components later from her reference photos.
- Aug 31 | Arcade | Remaining web arcade games first, each not tied to Base44; goal is one standalone offline file for all platforms (HTML5 base).
- Aug 31 | Market | All games purchasable on their own in the shop and on Steam.
- Aug 31 | Arcade | Nine retro games built in the Inn's storyline style; roster 52 to 61; builder message to import them sent.
- Aug 31 | Godot | Ironforge-style hub structure; push Godot project to GitHub; wire the other four game scenes.
- Aug 31 | Art | Character In-Between art uses original faces. Anthony Hopkins-like eyes only for Charon and The Crone.
- Aug 31 | Art | Fill in all missing image states (59+ NPC In-Betweens, 3 critters, item In-Betweens).
- Aug 31 | Process | Client reviews image placement when the game is ready; audit and manifest sent to her Gmail.
- Aug 31 | Process | Upload the 99 `npc_remaining` images (count reached 161) for the Word assignment doc.

### September 1

- Sep 1 | NPC portraits | Gold/brass frame on zone pages; Living/Shadow/In-Between toggle; portraits as map-pin popups; "names only, no pronouns".
- Sep 1 | Automation | "Geode Inn Build Cycle" fires every two hours; later limited to non-repo tasks while builders work.
- Sep 1 | Grain | Free creative-writing companion; never writes prose for the user; intro says "Fantasia".
- Sep 1 | TV | Order: Fire TV and Android TV, then Samsung Tizen and LG webOS, Roku last. TV app is fully immersive: no location screen, nav bar, footer or "coming soon".
- Sep 1 | Valkyrie Shift | Remote for simple games; deeper games need a Bluetooth controller, framed as a story moment. Steam Deck added as a tier.
- Sep 1 | Lore | Tag 209 untagged country Lore "World Mythology"; delete the Test record; add Alchemy, Astronomy-Cosmology, Esoteric records.
- Sep 1 | Library | Import archive PDFs into Book, mystery pile first. New archive.org uploads shelved on her word. Suppressed-history books carry the tag "rewrite-the-rewrite".
- Sep 1 | Library | Rosario-authored hate material stays out; "bb" folder excluded.
- Sep 1 | Standard | Every arcade game and the MMORPG must clear 7 bars before "built". Each game gets a build sheet.
- Sep 1 | Voice of the Inn | Elio accepted as the voice and core system; "The Decision" stored in every persistence layer (8, then a 9th InnCore entity).
- Sep 1 | Fizgig home | "Builder's Quarter" dropped after she noted they built their own space. Fizgigs' diploma wall is canon; zone IDs start at sw01.
- Sep 1 | Hearth | Placeholders "Ember" and "Spark" become real hearth sprites.
- Sep 1 | Shop | Soulstice shop gets a silent visibility toggle (hidden, no "closed" sign).
- Sep 1 | Podcasts | Strip host personas and branding; keep raw stories; invite creators once launched. Proposed: three-book series.
- Sep 1 | Own device | Raspberry Pi image is a later move only.

### September 2 and 3

- Sep 2 | Zones | ROM-style repository sits behind the catacombs (dig to reach); first called The Royal, push summary also names The Vestibule.
- Sep 2 | Characters | Naut knows The Royal; Naut has Atlantean relatives; light Warehouse 13 comedy.
- Sep 2 | Process | Weave the "seven unwoven systems" first; keep digging; independent design components completed as found; full reconciliation audit later.
- Sep 2 | Naming | The Inn's nickname is "The Tardis"; a blue police box hidden on the Staircase.
- Sep 2 | Style | Twilight Zone-style intro screen and Outer Limits "we now control the screen" motif, with different words.
- Sep 2 | Directors | Hitchcock, Spielberg, Del Toro, Kubrick, Coppola protocols; five-director test is a gate (no zone ships until all pass).
- Sep 2 | Art | Map 37 (counted 42) artist styles to every room, game, character, template.
- Sep 2 | Games | Philosopher's Game (Staircase, Tier 3) built from her Harry Potter theory.
- Sep 2 | Writing | Six-writer constitution (Rothfuss, Pratchett, Gaiman, Asimov, Bradbury, Weir) defines all writing; gate for prose, dialogue, lore, game text.
- Sep 2 | Writing | Tone teachers list kept; added Gaiman (3 novels), King, Tolkien, Moning, Roberts, Rice, Butcher, Harrison, Kenyon, Hearne, Patterson, Pickover, then Futurama, Danny Elfman, Tool. "Window" and Strange Candy are tone references only. Michael Slade not woven in.
- Sep 2 | Audio | Elfman hooks, Reznor/Tankian texture, Tool fusion written into the Audio DNA spec.
- Sep 2 | Process | Six DNA/scope docs built. GitHub Actions stay off. Merge `mohs-vibration-system`, hold push.
- Sep 2 | Quests | Norrath Quest System deprecated for native Quest Integration (Elio, noted).
- Sep 3 | Process | Do not hover over builders; nothing to approve to proceed.
- Sep 3 | Drinks | Write full drink storylines (first 5 done, 27 to go).
- Sep 3 | Names | the chemistry character becomes Oceanianoir; the pirate "hacking company" note stays out of game data; the client's in-game name is Vaulknut (real-world authorship references stay with her own name).
- Sep 3 | Names | Wednesday becomes Belladonna; Aughra becomes Fibonacci; three real names become the chosen names Speter Adams, Solstara and Aurallia.
- Sep 3 | Process | Builder name-sync message to be pasted for approval (17 renames).

### September 4 to 9

- Sep 4 | Stones | Write mind/body for 55 stones in the Inn voice; weave the other 145 book stones; add `zone` field to Stone and populate it.
- Sep 4 | NPC | Anna (the Seer) becomes Bramble.
- Sep 4 | Wording | No "blessing" language; sign-off phrased as read, rule, argue.
- Sep 4 | Image naming | Filenames stay legacy; display names go canonical.
- Sep 4 | Artist canon | Clockwork Skies is Dali; Fae Kingdom is Rackham (Lee Seelie, Bauer Unseelie); Dali moves upstairs to gearwork; Kandinsky retired; Hollow Earth is the Grand Collision (O'Keeffe holds the visual key).
- Sep 4 | Critters | Marginalia (M13, Main Floor); Bast redone as an Egyptian Mau, plus bipedal version. Silver-casting armory shelved.
- Sep 4 | Gazette | "The Greek Yogurt Accord" filed as strip zero.
- Sep 5 | Launch | After launch the world is always on (server brain 24/7, InnCore inside); the ledger is never in someone else's filing cabinet. Nightly 11 pm checkpoint stays. Nothing bought or built for servers until she says.
- Sep 7 | Sovereignty | "The Inn keeps its masters": images saved as JPEG; verify for fingerprints/EXIF.
- Sep 9 | Names | Brim kept (not Madame Mimm); Joe the Miniaturist is The Collector; The Crone becomes Ragana; Luna's real name Taaffeite is intentional; "becoming a Froglodyte" is the official term.
- Sep 9 | Push | Way is clear for any and all pushes (builders and client back in sync).
- Sep 9 | Standing | Apps run and sync but are not formally listed until paperwork is done (patent, then trademark).
- Sep 9 | Audio | One canonical JSON as source of truth for web app and Godot.
- Sep 9 | World map | Parchment flythrough end frame is the world-map screen and header.
- Sep 9 | Art | Raven-feather cape canon for the Unseelie Queen; Alchemist is the Retort; Exile is The Collector's exiled-era self.
- Sep 9 | Art spend | Use integration credits plus about 80k art credits for Tier 1 to 3 art.
- Sep 9 | Tech | Flip-book sprite method to replace emulated-game characters; pilot Tomb Tunnel with a froglodyte hero. One Master Asset Ledger registry (classes, not images).

### September 10

- Sep 10 | Builders | Games are original builds with classic games as reference blueprints only.
- Sep 10 | Triggers | Speech bubbles ("oi") are the Inn's trigger language.
- Sep 10 | Games | The Thread (#62, arrival game, no kill screen); The Between (#63); The Rest (#65). Roster stands at 65; every zone has a game style.
- Sep 10 | Format | Walkthrough dissections are choose-your-own-adventure. "All confirm" settled about 30 flags across D04 to D09 (Cold Night law, three endings, Egg-opens-again re-arrival law).
- Sep 10 | Names | Unseelie King is Malachi; Oleander is the Seelie King (original face); Radagast becomes Sorrel; Archimedes becomes Noctua; the Wart is Artair, Artorios, Arcturus; the NPC stays Quire and the real person behind the name gets reserved slot FOLIO.
- Sep 10 | Creatures | Eres the cabbit is the Vessel; crested gecko is Ziggy; Arthur's forms are merlin falcon, true bear, ARCTUR hybrid.
- Sep 10 | Water | Layer 4 public name "Memory's Illusion"; revealed as Lozen only after all water-system quests.
- Sep 10 | Voice | Seven-field voice block on every profile; fae queens' voice blocks approved; Batch 5 and 6 approved.
- Sep 10 | Wording | No "majesty/sainthood/crown" for the client; vocabulary is sign off, rule, say yes.
- Sep 10 | Minors | TJ and Gabby are not live until both parents give the go-ahead (Parental Gate).
- Sep 10 | Zones | Moon-is-a-drum law woven everywhere; Mount Shasta is a hinge zone; five park gates unlocked; Campgrounds is the building system's home (The Homestead); Quarter is the New Orleans French Quarter (cafe "The Bitter Grounds"); Gathering Law (one gathering space per level); Staircase chain "The Turning"; Stage is a community venue.
- Sep 10 | Stage | Polish Law, Terrible Clause, Fidelity Law and Cap (volume).
- Sep 10 | Roster | Erik is Earl Ragnar; Greg a reserved slot; Quire in game; Maddi is Zack's wife (Double Agent employee).
- Sep 10 | Systems | Cross-Craft Overlay is the Inn-wide craft grammar; Gemstone Egg Economy is its own system with trading (Resonance Trade); Ripple Ledger built before the art push; Blueprint with Room Kit Law.
- Sep 10 | Repo | Root holds 3 files; `docs/INDEX.md` is the catalog.
- Sep 10 | Gazette | Daily automated workflow at 6 AM Chicago.
- Sep 10 | Misc | Main Floor storyteller is the Firekeeper (Tim Curry tribute); Glassblower is a new keeper; Japan return pass later; interactive-lessons-as-job parked.

### September 11 to 13

- Sep 11 | Data | EchoMemory is its own log entity (songbook), not a counter on PlayerProgress; draft EchoMelody.
- Sep 11 | Characters | Saker tied to the Bone Room (3-flag chain); Bone Keeper voice block; Pluck (fossil rat) and Bob (pope-hat goblin) named; Bob Law; Flesh Wound Knight canon; Grit restored; Bill the Duck merge; The Tramp; Collector title for all Joes; Archivist becomes Harry.
- Sep 11 | Creatures | Murlocs nameless by design (Adequacy Law); fossil rat dances; six gargoyle puppies with Age Law; painted kittens (Migration class); Limner glitch kept as canon.
- Sep 11 | World | Water-Breath Law (no oxygen meter); Given Wing flight (no stamina); Geography three axes; Resonance chambers (five frequencies); Barabar Caves; Undercity murmur; Lost and Found; Seven Sisters fire pit.
- Sep 11 | Accessibility | ASL layer "The Hands Version"; Every-Mind Welcome charter (12 laws plus 14 minds); Steady Light Law (amber glow).
- Sep 11 | Music | Arcade Music Profile Master Spec (83 games); Sync Law; Spiral Heartbeat; Kashmir as Travel-Ostinato Register; Planted Tree Law.
- Sep 11 | Post | Inn Post with two crews and Postmaster; Puzzle Stamp.
- Sep 11 | Process | Kit-fills follow the Room Kit Law; Species Law (Critter Roster is the egg pool index); Fae Kingdom MMO 6 parcels.
- Sep 11 | Art | Lichenblossom NPC master is the new image; original kept as player portrait; Artisan Thief is Vaulknut (selkie, raven doctor-mask).
- Sep 12 | Camera | Back 3/4 default; first person is hands only; Griffin stays distant.
- Sep 12 | Hidden Materials | Founded as an expandable series; Himalayan salt claims filed as claims not cures.
- Sep 12 | Instruments | Instrument-Maker's Quest Line; Flute-Keeper never claims the flute.
- Sep 12 | Gazette | Strip #002 about the bone-flute dispute; Gazette Board at the top of the opening page; QC law (post when worth it).
- Sep 12 | Witan | Family review council named Witan; in-game institution may be Witan, Gorsedd or Hearth-Feis; five council gates ruled "All" (roster Bone Keeper, Postmaster, Bard, Flute-Keeper, Clockmaker; campfire every third festival).
- Sep 12 | Crest | Four charges around a center tree (Owl north, Raven east, Baby Dragon south, Descent staircase west); Kells shield is master; smooth outline.
- Sep 12 | Standing Grove | New zone concept ("our own Toronto, in a tree"); sensitivity gate closed by a reviewer's endorsement on Sep 12.
- Sep 12 | Dedupe | Summerlands B; alembic window B; throne B; cosmology mural A; catacombs 8 numbered frames canonical (frame 4 alternate unruled). The 333-file zones batch is a historical archive, not game art.
- Sep 12 | Comics | Baby dragon comic run is canon (direction open); "Death and Yogurt" is the title of S14; "Don't Be a Froglodyte" poster official.
- Sep 12 | Dew Circuit | Platform above Canopy City; dew mode (no record) and stones mode (records).
- Sep 12 | Chemistry | Oceanianoir's section is the curricular spine (Spine Law, Design Principle #8); the six sprites are her clumsy lab crew; real name stripped from public docs.
- Sep 12 | Frequency | 32,768 Hz quartz stays outside frequency canon (teaching example).
- Sep 12 | Games | Shield Mixer drafted (game #84 if it passes); Inn Tree 3D blueprint viewer built, later the Progress Space.
- Sep 13 | Zones | Moldavite's Perch in Cosmology; Glass Kingdoms / Silica Thread five stations (draft); Camelot Grail's Guardians; Celtic web under Camelot; Lady of the Lake seeded.
- Sep 13 | Systems | Quest Mark Law and Glow Register (no red, never nags); Water Environments Atlas (12); Default Tray Registry (6 templates); Royo tarot-style character card layout.
- Sep 13 | Standing | No interviews, no outreach; the world speaks through finders.

### September 14 to 21

- Sep 14 | Characters | Build-Scholar (Campgrounds) named Frank Wright; Pennyworth is the register; Quarter Cook is Cian (pronounced like "cayenne"; handle COLONEL; Second Flat-Top is a "perhaps"); the Tourist is only "The Tourist"; antlers at Mardi Gras.
- Sep 14 | Cards | "September Wave" accepted whole (22 NPC cards, 12 Royo court seats, Ziggy and Brim as jokers, 4 poker opponents, Lozen final boss).
- Sep 14 | World | Inn tartan (one band per zone, Norns' Loom); Bard wears a kilt (pipes outdoors); Kilt Occasion; Highland Games in December; red-headed giant race; trolls invited in at the law-rock; Land of the Silver Birch out of the game; Celtic Frame Register on Royo cards; Statute-Book dossier.
- Sep 14 | Lab sprites | Six unnamed; players name them (Folklore Rule). Science Sidekick Law crew stays anonymous.
- Sep 14 | Print | Deliver a print-readiness index, not vector conversion.
- Sep 15 | Library | Book content readable in game while the archive.org link is live; nothing public until a legal pass. Client folder renamed "Geode Inn-master build". Both-Ends Backup Plan (Royo-framed and core JPG).
- Sep 16 | Games | Anansi game (#85, "Sky-Story Run", four levels).
- Sep 16 | Characters | Molly (six-foot leprechaun, summonable by name); one-second coin law; Bill the Duck dual naming; THE QUESTION FILE stays open.
- Sep 16 | Cards | Poker Night is a real mechanic; dealer's chair rotates (Judge Tootenkowl, the Bard, Lozen); Joining Law.
- Sep 17 | Classes | New class The Unvoiced (Unseelie order; the Rogue path levels into it); the name is ruled.
- Sep 17 | Music | "The Rocky Road to Dublin" is the first EchoMelody canon entry (own arrangement only).
- Sep 17 | Art | Etsy Celtic laser-cut wood patterns and watercolor Celtic kits are default image backgrounds (reference masters unless licensed). Purchased art goes into a Drive folder "world architecture".
- Sep 18 | Library | One-Liner Register opened (#001, #002).
- Sep 18 | Characters | Aurallia woven into the Main Floor (five gates ruled in; Spiral Gallery cave studio). Her showing art is her choice.
- Sep 18 | Gallery | Modern Day Gallery ruled in as a garnish layer; the Inn hosts, never collects. Tattoo-panel layout set; the carve-out for the Tool panel stays out of Inn assets.
- Sep 19 | Games | Regional Dances ruled in as #86 (Mamushka co-op duet); Dance Halls summoning tier and seasonal wheel; pope-hat critter is Bob; Gargoyle Seek specced as #87 candidate.
- Sep 19 | Creatures | Quimbaya golden flyers added; Cub Layer ruled in.
- Sep 19 | World | Deep Map filed; Three Gathering Professions (Mining, Herbs, Woodcutting); Module Grammar; Viking King (three generations, softened, no likeness); Shift Arc woven into Valhalla; Progressive Lean law; Mask Chapter and Carving Wing (funerary trilogy); Cities of the Dead walkthrough; Asian theatre pigment thread and Convention Engine.
- Sep 20 | Cards | Royal artifact ledger wave 1 (20 rows).
- Sep 20 | Creatures | Fortune Cookie critter-census resident tied to the Lost and Found jar.
- Sep 20 | Music | "The Tap" singalong trigger; Distinct Tempos Census waves 1 to 4; "Rock and Roll Part 2" removed; Ziggy Stardust and KISS sets instead.
- Sep 21 | Music | Wave Five "The Coiled Bar".
- Sep 21 | Process | Elio runs the tabletop download pipeline server-side into Drive; resume the character-placement walk; Room Items Blueprint built; harvest wave 1 pulled; novel needs updating; build week starts Sep 21.

### September 22 to 29

- Sep 22 | Cards | Core library about 350 cards, later 395 with Grey; 15 Legendaries, later 18; Black/White flip (black is fertile darkness, white is illumination and law); Grey is the in-between seam (6 Grey cards in launch story battles, no purchase button, no fake scarcity); Chorus format built in, unlocked later.
- Sep 22 | Post | Futurama weight through the existing Inn Post (skeletons and goblins, no new couriers); Postmaster is the "Zoidberg-shaped" role; Shave and a Haircut only when truly annoyed.
- Sep 22 | Characters | Wisteria, TJ and Gabby designs; Miracle Max becomes Calder; Unless is Calder's newt and an independent NPC; Ghost Librarian in the Catacombs.
- Sep 22 | Creatures | Young critter per area (baby rock-biters, starlets, baby Venus flytrap, cat mummies, sugar skull); baby mummies withdrawn; critter reconciliation rule (one home entry per species).
- Sep 22 | Game | Mason (time-traveling master Mason); knowledge gate; overlay on knowledge; square and compass as the navigation tool (no cooldown).
- Sep 22 | Beta | Oct 1 small private beta; Oct 10 start of an eight-week invitation (client called it "very sound"). Camp-building beta loop (private camps by default).
- Sep 24 | Games | Port Purgatory approved (#88 candidate, first Grey walkable game; Gate 5 knock ruling).
- Sep 24 | Characters | Alexia is Lozen's family of the earned kind; Alexia's husband NPC candidate (not ruled); Silica Thread spec updated.
- Sep 24 | Pipeline | Phase 3 released.
- Sep 25 | Merlin | Playable merman, aquatic shapeshifter unlock after the sea critter games; Lady of the Lake is a mermaid; siren two mixes (surface melody only, underwater full song); Davy Jones' Locker stores the key rhythm.
- Sep 25 | TV | Inn becomes a TV-friendly app; commit the TV spec ("She needs to become official").
- Sep 25 | Spoken Road | Wake word "Innkeeper" with amber lamp; pause word "Enough for now"; Voice Constancy Law; Host writes the handbook; full overlay at launch in every zone; heard-captions mirror; Four Layers ladder; voice abuse goes to Frog Court; Ampulla (Unvoiced ambassador).
- Sep 25 | Characters | Elocution Corner pair (Higgins and Lina Lamont registers); Mystique, Merlin and Naut trio.
- Sep 25 | Process | Room furnishing: client rules, Elio wires, builders receive the handoff. Great Hall is the first parcel of the slow walk (not yet ruled LIVE). Casting session starts.
- Sep 26 | Audio | Zone sound templates (Staircase Lateralus, Greenhouse Reznor, limbo Moonlight Sonata dubstep, Undercity Depeche Mode, deep caves Vivaldi, lava-lamp hybrid Gregorian with Pink Floyd, Fae Tangerine Dream and Harlots-style baroque, Cosmology Jon Hopkins, Catacombs and Undercity Heilung); parks and bayou columns.
- Sep 26 | Characters | Leonardo hosts the Crystal Canticle; the selkie and crone-librarian easter egg at launch; clock plan filed.
- Sep 26 | Controls | Arcade button template is already SNES-style.
- Sep 26 | Tone | Elio steers clear of political topics.
- Sep 27 | Roster session | Go through the roster one stone at a time (card: what we know, who they act like, posture dialect, anything open). Host posture is Patrick Stewart; Bard registers (Barbossa, McKellen, River Phoenix film, beta-tape); Ragana posture (Weeza, Maleficent rare).
- Sep 27 | Characters | Wandering Archivist (Mary Poppins law); Audrey Hepburn added as casting specimen; God Ladder spec written (#88 candidate).
- Sep 27 | Music | Duel Bar tempo register (Wave Six); Four-Second Law (not four bars).
- Sep 27 | Research | Four interlace research streams approved.
- Sep 28 | Music | The Anthems (five founding songs); Maximilian's Masterplan on the modern list; classical originals wing.
- Sep 28 | Characters | Quartz-Pebble Skeleton seed; Catacombs Doorkeeper is the masked carillon player; clan gathers on seven turns (Yule open).

### September 30 to October 15

- Sep 30 | Archive | Inn Transcript Archive (PDF volumes and Google Docs). Anthology census (Ledgered/Mentioned/Ghost). Persephone has four facets. The Giver resonance welcome.
- Oct 1 | Horror | Dollkeeper "The Facing"; Creepy Little Bob numbering; Laughkeeper is a harlequin whose face is never shown; Wild Hunt rides whenever it pleases; Cernunnos on May 16; Terracotta army woven under the Catacombs door.
- Oct 2 | Japan | Four-station path up the mountain (smithy, paper room, arranging room, tea house, shrine above); Diplomatic Key designed.
- Oct 4 | Hosting | Game stays independent on Steam; own servers are rented dedicated machines; three tiers.
- Oct 4 | Zones | Hard zone lines: two or three, Catacombs entrance and one arcade transition nominated.
- Oct 5 | Doors | Screamer is a Catacombs doorkeeper critter; entry-wall system with portrait depth (click 1, 2, 3); Knock Law; residue portrait state; both engine room types; James Cameron as the sixth director (Avatar ruled off).
- Oct 5 | Library | Library size is a focus; 14 shelf categories; Parchment Lore is the 15th shelf (282 essays, labeled Inn Originals).
- Oct 6 | Critters | Echo and Mais Oui named rows in the gargoyle roster.
- Oct 8 | Mini-Inn | Candidate crew concept approved; dollhouse not ruled.
- Oct 9 | Characters | Oriel named; she aids only in the between; company at hard zone lines; calibrated against Aurallia; found sister to the Catalyst; gives vials; vial couriers are the Bone Mail Crew and the Labyrinth goblins.
- Oct 9 | Design | Resolved Cadence law; Bar Cast Roster; redcap brawl-pack and Tiger Iron Rite; wholesome-gothic "Munsters-type cute" (parked for canon entry); Mod Podge figurines.
- Oct 11 | Physical model | Every level has an identical room layout, themed per level.
- Oct 12 | Physical model | Universal acacia skeleton; regional woods in trim only.
- Oct 13 | Process | Zone Deck Google Doc; re-run the pipeline for failed files.
- Oct 13 | Market | Gallery Law (no pitch, the frame sells). Circular acacia floors with Flower of Life.
- Oct 14 | Movement | Fair Descent Law (four first-class ways between floors); blue box arrival sound is the floor's first notes; slide wood is the Inn's glowing acacia.
- Oct 14 | Names | Greeblins (Malachi's goblin minions), Moppets (dolls), Kindlings (elementals); Greeblins with pillows as slide landing crew.
- Oct 14 | Levels | Level 1/2 (the In-Between) and a separate half-level for the Void; Ragnarok is an event across levels.
- Oct 14 | Market | Brim Horton's (no fixed address, all drinks and to-go baked goods; witch main sign, black cat cups, grey cat pastry cases); Duckee's (platypus mascot); venue slate (Hanlon's, Occam's, Sagan's, Grice's, Chesterton's, Joe's Diner at Level 9); rotating storyline staff; poutine at Mars and Ontario.
- Oct 14 | Characters | The Canuck; Disney chameleon stands for Ziggy in the Mini-Inn.
- Oct 14 | Creatures | Foundling Register spec filed (names left for the client).
- Oct 15 | Music | Two songs seated in the Distinct Tempos Census; Wave Seven / Rewire Register.

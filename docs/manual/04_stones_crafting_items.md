# Part 4: Stones, Crafting, Items and the Market

This part covers everything a player can hold, gather, make, drink, wear or buy: stones and minerals, charms, eggs, crafting and building, game items, food and drink, and the market.

How to read it. Each kind of thing has the same five blocks: what it is and its laws, a template, where it lives, current canon, and what is open. Status words: **Ruled** (the client decided or agreed, with date), **Proposed** (Elio suggested, no ruling), **Open** (waiting on the client). Field names in `code` are the real names from the data or the repo. Where a field name is not known, the cell says so.

Source-of-truth files in the repo: `docs\geode_inn_stone_census.md`, `docs\library\data\stone_zone_map.json`, `docs\geode_inn_charm_bracelet.md`, `docs\zone_specs\geode_inn_building_system_master_spec.md`, `docs\zone_specs\geode_inn_craft_curriculum_master_spec.md`, `docs\zone_specs\geode_inn_color_works_master_spec.md`, `docs\zone_specs\geode_inn_default_tray_registry.md`, `docs\blueprints\geode_inn_room_items_blueprint.md`, `docs\zone_specs\geode_inn_drink_mechanic_master_spec.md`, `docs\zone_specs\geode_inn_venue_row_master_spec.md`, `docs\geode_inn_artisan_market.md`, `docs\legal\geode_inn_paperwork_matrix.md`.

---

## Where it started (July 12 to August 30)

- **Jul 22, the book (the early chat).** The stones began as the client's book: a long version of 751 paragraphs and 168 or more stones, each with a Mind property (metaphysical) and a Body property (healing). Counts reported that day: 168 stones extracted, 164 records loaded into the staging app, about 100 with full Mind and Body text. Later in the early chat: 117 stones complete and 115 pushed to the Geode Inn app (two did not match). About 49 were still empty. Built (early chat).
- **Jul 22, first reward pairings.** Elio paired stones with places: Stonehenge with Preseli Blue Stone, Egypt and the Tomb Tunnel with Lapis Lazuli, Peru with Blue Opal, the Seelie Court with Peridot, Citrine and Aventurine, the Unseelie Court with Obsidian, Black Tourmaline and Smoky Quartz, Bastet with Cat's Eye Chrysoberyl. Anansi was left open (Goldstone or Tiger's Eye, no reply). Proposed. The Cthulhu rule (he holds the rarest stones, reachable only through his quests) was stated the same day.
- **August, regalia (early chat).** The client asked for ritual adornments of royalty (crown, scepter) as a theme. Elio researched and mapped them, and the client agreed. Ruled (early chat, August). Research file: `docs\geode_inn_royal_regalia_research.md`.
- **August, the market begins (early chat).** The client asked for stylized in-game inventory items for real shop goods, with a link out to the external shop. Elio built `MarketItem` and `PlayerInventory`; the client approved ("Yes, please", "I love it"). Ruled (early chat, August). The commit log has the entities on Aug 22 and the "living workshop" fields `developmentStatus` and `processUrl` the same week. Built (commit, Aug 22). See 6.9.
- **Aug 22 to 23, stone capsules.** Stones are geodes kept in a pouch, thrown as frequency waves and never consumed. The client added the idea of "Pokemon-esque capsules" with a companion won from the storyline, and approved the result ("That ties in a feeling of camaraderie"). Ruled (early chat). Built (commit, Aug 23). Spec: `docs\zone_specs\geode_inn_stone_capsules_master_spec.md`.
- **Aug 24, the bracelet and the building system.** The Charm Bracelet replaced any score, level or percentage display. The building system got its seven base materials, five tiers and town formation rules. Built (commit, Aug 24). See 2.7 and 4.13.
- **Aug 26 to 28, the stone database moves.** Aug 26: the Mohs Vibration game design, the stone vibration system v2 and a vibration index for 160 stones. Aug 28: the Stillness Stone (#167) and Octave Stone (#168) were added, and a working document listed 55 stones still missing Mind and Body text. Built (commit, Aug 26 and 28).
- **Aug 29 to 30, cut rules and crafting data.** Faceting classification (63 smooth, 101 faceted, shapes gated by `canFacet`). The Building and Gathering System (65 materials, 20 recipes), then 86 historical recipes with 7 new materials, then 15 cave materials with 42 recipes. Built (commit, Aug 29 and 30).
- **Aug 30, products.** The Bead Composer was hosted at the Geode Inn site ("Two doors (game + website), one engine, one codebase"). Share Wood was specified (tiers 9, 49 and 99, no transaction fees; faires choose from the Inn's 37 curated styles and never upload their own). A Complete Inn bundle at 99.99 was written. Built (commit, Aug 30).
- **Aug 31, images and icons.** A 198-stone image manifest, a stone image URL mapping for 140 stones, 76 supply icons and the 298 stone chimes with a Mohs-to-frequency index. Built (commit, Aug 31). The Aug 31 client rulings in this part (offline images, Bead Board first, metal findings) come right after.
- **Late August, Before the Song.** The canon document adds trovants (stones that are woken by being named), water as a base material with seven layer uses, Roman concrete, the Five Smiths, the Coast Hub crafting and trade scenes, and the Grey Note and Bone Note rewards. August canon. See 4.13.

---

## 1. Stones and minerals

### 1.1 What a stone is, and the laws that apply

The Inn started as a book about rocks. Stones are the oldest content in the world. A stone is a record with a name, a family, a Mind text, a Body text, a home zone, an image, and (for craft) cutting rules. Stones are also rewards: each arcade game gives one, and stones become charms on the player's bracelet.

Laws:

- **Offline images.** Steam builds are playable offline, so stone images must be local set-design assets, never URL links. The web beta may keep URLs. The game client loads from `res://assets/stones/`. (Ruled Aug 31, by the client. The web-beta exception was proposed by Elio the same day and the client replied "Nice".)
- **Mind and Body.** Every stone has a Mind entry (its essence, in the Inn's voice) and a Body entry (the practical, bodily side). All 55 stones that were missing both were written Sep 4 and now have them. (Ruled Sep 4.)
- **Weave.** Every stone gets a place in the world: where it lives, the thread it holds, its role in the Song. Done for the whole set in Storyline Weave volumes 1 to 5 (about 15,000 words, Sep 4).
- **Zone field.** Every stone has one primary home zone in a `zone` field. A stone may keep a second home. (Ruled Sep 4: the client said "any wiring data is always gold to have on hand".)
- **Not for sale.** Some stones are given, never bought. Pounamu is the stated example (see 1.8).
- **Honest label.** Real minerals carry real facts. A stone that is toxic when handled wet or ground (Bumblebee Jasper, Malachite) says so in its notes.
- **Product photos.** Transparent stones are photographed on light backgrounds, opaque stones on dark (Sep 4, standing rule for products).
- **Stone tones.** Each stone holds a tone by Mohs hardness. In audio, stone tones sit 12 dB under narration. (Stated Aug 31 and Sep 4.)
- **Stones are the progression currency** (August canon, Before the Song). There is no XP and no levels. Each stone carries a frequency, and the geode cave is nearly silent when empty and becomes a symphony of chimes as stones are added. The cave is a sound, not a number.
- **Geodes in a pouch** (Ruled, early chat, Aug 22 to 23). A stone is a geode, plain outside and beautiful inside, kept in a pouch (not a menu) where it vibrates. It is not consumed when used. The collection is the move set. Passive effects follow real properties: amethyst speeds nook recovery, black tourmaline lowers dissonance damage, clear quartz strengthens the Resonance Pulse.
- **Every stone is a future obol** (Before the Song, and the early chat, August). Charon takes one stone from the player's collection per crossing, so the collection is one stone lighter after each death cycle. Obol Stones also come from the Tomb Tunnel game.
- **Ordinary stones stay outside the database.** Wednesday's collection (limestone, shale, sandstone) is the inversion of the Gem Cave: plain stones that do not enter the Stone entity. River stones are smooth, do not vibrate, and are "the adequate stone". (August canon.)
- **Books and stones.** The stone text comes from the client's book (Mind and Body per stone). Reference files named in the early chat are the gemstone history (2009) and the birthstone compilation (2010). The book's opening line is "We are made of stardust".

### 1.2 The counts, and how they changed

The numbers 165, 198 and 200 all appear. They count different things. Here is the timeline.

| Date | Count | What it counts | Source |
|---|---|---|---|
| Jul 22 | 168 / 164 / 117 / 115 | 168 stones extracted from the client's book; 164 records loaded into staging; 117 with completed text; 115 pushed to the Geode Inn app (2 unmatched, "Blue" and "Orange"). About 49 still empty (some days reported as 51) | Early chat |
| Aug 20 to 24 | 164 | The stone database as Elio stated it ("164 stones"); referenced again in the Aug 24 commits | Early chat; commit log |
| Aug 26 | 160 | Stones mapped in the vibration index | Commit log |
| Aug 28 | 167 / 168 | Stillness Stone and Octave Stone added; 55 stones need Mind and Body | Commit log |
| Aug 30 to 31 | 198 / 298 | 198 stones used by the tabletop and the image manifest; "298 stone chimes" with a Mohs-to-frequency index | Commit log |
| Aug 29 | 164 | Stones in the live-style Stone entity, all classified for faceting | `docs\geode_inn_faceting_classification.md` |
| Aug 31 | 198 | The game-original set with images (198 PNGs, 23 MB). The live database held 164, so 34 were missing (e.g. River Amber, Frost Iron, Dreamtime Opal) | Elio, Aug 31 |
| Sep 1 | 198 | Batch email to the builders: "198 stone images + coordinates". Live stones were missing images and coordinates | Sep 1 |
| Sep 2 to 3 | 164 / 165 / 160 | 164 stone charms; Soulstone is the 165th stone; 160 stones have a vibration index (Mohs Vibration) | Sep 2-3 |
| Sep 3 | 166 | Working document: 166 in the database, 111 with Mind/Body, 55 without | `docs\data\geode_inn_missing_stones.md` |
| Sep 3 to 4 | 167, 168 | Stillness Stone (#167) and Octave Stone (#168) added | `docs\geode_inn_new_stones_stillness_octave.md` |
| Sep 4 | 200 | The Stone Census: "All 200 stones mapped to the world" after the two new stones were loaded. Zone map counts add up to 200 | `docs\geode_inn_stone_census.md`, `stone_zone_map.json` |
| Sep 10 | 201 | Amazonite added as stone #201 (staging) | Sep 10 |

Plain reading: 198 is the original image set, 200 is the census after the two Inn-origin stones, 201 is the latest, and 164 to 166 is what the live database held earlier. The step from 166 to 200 is not fully explained in the chat logs (see 1.12).

Stated Sep 4: the stone library is 200 (no separate ruling). Use the later count over earlier ones.

### 1.3 Template: Stone

Use this for every new stone. The long form below follows `geode_inn_new_stones_stillness_octave.md`. The short form (name, Mind, Body) follows the batch files `geode_inn_stone_descriptions_batch1.md` to `batch6.md`.

| Field | What goes here | Example |
|---|---|---|
| `name` | The stone's exact name. Records are matched by name | Stillness Stone |
| `category` | Group. Seen: Inn-Origin, Organic, Cosmology | Inn-Origin |
| `stoneFamily` | Mineral family. Drives the cutting rules | Quartz (structural, absorbs vibration) |
| Geo region | Where it comes from, real or in-world | The Inn (Void, between cycles) |
| `mind` | The essence, in the Inn's voice. A short paragraph | "The anti-frequency. Every other stone amplifies... The Stillness Stone absorbs." |
| `body` | The practical side, one or two lines | "Calms the nervous system by absorbing excess neural oscillation." |
| `zone` | One primary home zone (one of the 12 in 1.7) | Cosmology |
| `image_url` | Web URL for the beta. The game uses a local file | name to URL in `docs\stone_image_urls_for_live.json` |
| Local image | `res://assets/stones/[name].png`, lowercase with underscores | `res://assets/stones/river_amber.png` |
| `colorNotes` | How it looks, and how it looks in Form Sight | "Transparent quartz that holds light rather than refracting it" |
| Frequency | Tone in Hz, tied to Mohs hardness | 0 Hz (the pause between frequencies) |
| Mohs | Hardness number | `all_stones_data.txt` column (see below) |
| `opacity` | opaque, translucent or transparent | translucent |
| `canFacet`, `beadFinish` | Can it be faceted; "smooth" or "faceted" (rules in 1.6) | false, smooth |
| `canCabochon`, `cabochonShapes` | Can it be cut as a cabochon; which shapes | not given |
| `opticalPhenomenon` | e.g. play-of-color, chatoyancy | Opal: play-of-color |
| Varieties | Other forms of the stone | None, singular |
| Acquisition | How the player gets it | Observatory chain, Void visit (Astronomer's Door 3). Must be recognized without the Pulse Line |
| Game effect | What it does in play | Pauses frequency effects 5 seconds, 60 second cooldown |
| Lore | The in-world line behind it | Nyx's gift: "I am the space where the Song rests." |
| Reward link | Which arcade game gives it, if any | Standing Stones gives Preseli Blue Stone |

Notes on the table:

- Exact field names confirmed in code or data: `name`, `image_url`, `mind`, `body`, `zone`, `colorNotes`, `canCabochon`, `cabochonShapes`, `canFacet`, `beadFinish`, `opacity`, `opticalPhenomenon`, `stoneFamily`, `category`. The coordinates field exists (a backend function fills it, `populateStoneCoordinates.ts`) but its exact name is not shown.
- `all_stones_data.txt` (repo root) holds one line per stone with eight values separated by `|`. The columns appear to be: name, crystal shape, family, a frequency-type number, Mohs hardness, specific gravity, driver type, cut style. Example: `Hematite|botryoidal|Hematite|78.9|5.5|5.3|bone_conduction|cabochon`. The column headings are not written in the file, so treat this reading as inferred.
- "Driver type" comes from the Unified Resonance idea (Sep 3): dynamic drivers are stones, balanced armatures are characters, electrostatics are cosmology, bone conduction is the 42 Hz Song.

Short-form example (Black Opal, batch 2, written Sep 4):

- Mind: "Black opal is the In-Between made mineral... darkness is not the absence of light but the frame that makes light legible."
- Body: "Supports the eyes and their slow adaptation to the dark."

### 1.4 Template: Stone spirit (mineral charm spirit)

Each stone has a small spirit that sings at the stone's frequency. The catalog is `docs\systems\geode_inn_mineral_charm_master_catalog.md` (headed "164 Stone Spirits", total 173 unique spirits) plus the files `docs\data\mineral_charm_spirits_*.md`. Spirits are grouped in families that share one archetype (the Quartz family is "The Prism Singer", 12 spirits).

| Field | What goes here | Example |
|---|---|---|
| Stone, Family | The stone and its family | Clear Quartz, Quartz |
| Class | Linework class (Present is Balanced Armature) | Present |
| Frequency, Mohs, SG, Driver | Technical values | 1387.5 Hz, 7, 2.65, BA |
| Color Palette | Hex colors | #FFFFFF, #E8F4F8, #D0E8F2, #B8DCED |
| Rarity | Common and up | Common |
| Spirit Name | The spirit's name | Aria |
| Form, Face/Expression | Body and face | Six-inch humanoid of water-clear quartz columns |
| Mineral Element | The real crystal feature it shows | Six-sided habit with pyramidal terminations |
| Frequency Visualization | How the song looks | Tight concentric light ripples at 1387.5 Hz |
| Personality | Voice and manner | Intimate, direct, attentive |
| Distinguishing Feature, Pose, Color Detail | Art notes | Floats three inches above the stone |

### 1.5 Images and the offline rule

- Ruled Aug 31: stone images are local files in the set-design look. The Godot project loads them through `StoneLoader.gd` and a local manifest that maps each of the 198 stones to `res://assets/stones/[name].png`. The web beta uses URLs.
- Four stones had dead image links and were regenerated: Rhine Quartz, Frost Iron, Provence Limestone, Alpine Granite.
- Manifests: `docs\gallery\geode_inn_stone_images_complete.md` (the 198-stone image manifest), `docs\stone_image_urls_for_live.json`, `docs\library\data\stone_image_mapping.json`, `docs\library\data\stone_prompts.json`, `docs\library\data\unmatched_db_stones.json`.
- Sep 7 sovereignty rule (applies to all art): images are saved as JPEG so no generator fingerprint remains, and files are checked for metadata. Stone art for Godot is currently PNG; whether it was re-checked is not stated.
- The live database import of the 198 image links was blocked (cross-app writes). The builders were to do it from the batch email. Whether it happened is not confirmed.

### 1.6 Faceting and bead finish rules

From `docs\geode_inn_faceting_classification.md` and the Bead Board (Aug 29 and 31):

1. Opaque stones are smooth. Exceptions: Black Onyx and all tourmalines are faceted.
2. Translucent stones are faceted. Exception: opals are smooth.
3. Fire Opal is the only faceted opal.

At the Aug 29 check: 63 smooth stones, 101 faceted. Smooth families include turquoise, jasper (7), tiger's eye (3), sodalite, obsidian types, coral, native metals, several chalcedonies, and the opals. A backend function, `populate_stone_cut_fields.ts`, sets `opacity`, `canFacet` and `opticalPhenomenon` from family lists. Photography follows 1.1.

### 1.7 Zone map

`docs\library\data\stone_zone_map.json` holds the primary home of all 200 stones (written Sep 4). Counts:

| Zone | Stones | Zone | Stones |
|---|---|---|---|
| Cosmology | 18 | Fae Kingdom | 13 |
| Clockwork Skies | 6 | Water Zones | 37 |
| Main Floor | 20 | Archive | 13 |
| Campgrounds | 27 | Spiral Gallery | 4 |
| Staircase | 18 | Vault | 8 |
| Catacombs | 34 | Forge | 2 |

Total 200. Sample homes: Cosmology holds the moonstones, Diamond, Clear Quartz, Octave Stone and Stillness Stone. Clockwork Skies holds Sunstone, Alexandrite, Zultanite, Andalusite, Iolite, Clear Topaz.

Rules in the map: the file records the primary residence only. A "working deposit" is a second home. The census has a second-home flag. Fifty-two stones that were not in the first census got homes as "census addenda". The census also ends with a closing section called "The Song", for the frequency keepers: Octave Stone, Clear Quartz, Nuummite, Blue Hole Calcite, Stillness Stone.

### 1.8 Mohs-frequency layer

- Each stone holds a tone by hardness. Mohs 1 (talc) is 174 Hz and Mohs 10 (diamond) is 852 Hz, the Solfeggio "body layer" (Sep 3). Another statement says the Mohs scale maps to the C major scale (Sep 4). These do not conflict, but the exact table has to come from the audio data file, `docs\library\audio\geode_inn_audio_data_structure.json`.
- Soft stones thud, hard stones ring (client's Mohs layer, Sep 26). All games have a base where sound vibration matches the Mohs scale of the rocks.
- The Mohs Vibration game identifies minerals by sound and touch in a dark cave. It maps 160 stones by density and hardness. Its design work was on a branch (`mohs-vibration-system`) merged locally Sep 2 with the push held. Whether it was pushed is not stated.
- Stone tones trigger in the audiobook at the stone's Mohs frequency, 12 dB under narration.

### 1.9 Where stones live

- GitHub: `docs\geode_inn_stone_census.md`, `docs\geode_inn_stone_descriptions_batch1.md` to `batch6.md`, `docs\geode_inn_storyline_weave_vol1` to `vol5` files, `docs\library\data\stone_zone_map.json`, `docs\data\geode_inn_missing_stones.md`, `docs\geode_inn_new_stones_stillness_octave.md`, `docs\geode_inn_faceting_classification.md`, `all_stones_data.txt`, `beta\scripts\functions\populate_stone_cut_fields.ts`, `docs\library\functions\syncStoneImages.ts`.
- Base44: the `Stone` entity. There are two copies: Elio's staging app and the live Geode Inn app. The live copy has its own records and was behind the staging copy (missing images, coordinates, and the Sep 4 `zone` field). The `zone` field "needs to ride in the builder sync spec" (open as of Sep 4).
- Godot: `godot_project\assets\stones\`, `StoneLoader.gd`.
- Drive: not stated for stone art. The stone cave images manifest is `docs\gallery\geode_inn_stone_cave_structure_images.md`.

### 1.10 Current canon: stones with rules or hooks

Hooks written into the census and weave (Sep 4). Elio wrote them and the client had the weave continue, so treat them as Proposed and accepted by use, not as formal rulings:

- **Pounamu** is given, never bought or priced. Once a year a piece leaves with a departing guest.
- **Septarian** dragon egg is buried at the Campgrounds fire circle, dug up at harvest campfire, held to the light, then reburied. The septarian mother stone is directly beneath it in the Catacombs.
- **Garnet wall:** seven chambers, one garnet each, a seven-note motif that resolves only if all seven are walked in one trip.
- **Hematite** is handed from a basket at the Catacomb door.
- **Amethyst** is the most stolen and returned stone.
- **Diamond** is set into the Allfather's floor and cannot be taken, on purpose. The Vault holds three crowns and a card for the fourth: "The Diamond is the floor you are standing on."
- **Angelite** is the Whisper Layer's stone. It warms when the archive pays attention to you.
- **Octave Stone** is held by the Root ("the scale was meant to turn around").
- **Iolite** is checked out of the Cartographer's key cabinet.
- **Rutilated and tourmalinated quartz** sit in one case (Common Room policy).
- **Bloodstone** is in the drawer behind the bar, with the bandages.
- **Pearl family** floats in a case moored at the Cove's ear.
- **Moldavite** is the Staircase's own stone, the only off-world one. (Moved Sep 13: see 1.12.)
- **Welsh Slate** is the mortar of the Fae portal arch.
- **Larimar** is in Atlantis. **Crocodile Stone** is the Bayou wing's doorstop.
- **Phantom Quartz** is the "palimpsest tone", the Inn's most-played composition ("Nothing has to be erased to be continued").
- **Preseli Blue Stone** is the portal stone from Standing Stones.
- **Blue Tiger's Eye** is its own record, separate from Hawk's Eye.
- **Zultanite** has two homes.
- **Stillness Stone** (#167): the anti-frequency, 0 Hz. Carrying it slows the Pulse Line to 50 BPM. Acquired in the Observatory chain. Nyx's gift.
- **Octave Stone** (#168): beryl, doubles any frequency it meets. Embedded in Cosmology Mural panel 7, "The Player".
- **Soulstone** is the 165th stone. Its quest is Mars Prison in the Cosmic Layer (D08B).
- **Diver's Stone** (aquamarine) is earned, never bought. It is the Water-Breath form (Sep 11).
- **Tiger's eye** is Victoria Falls' reward stone, ruled "a transformation stone" for the Tiger Iron Rite (Oct 9, see 4.8).
- **Taaffeite** is Luna's real name, kept on purpose, not to be anagrammed (ruled Sep 9).
- Hidden Materials (Sep 12, ruled): salt, diatomaceous earth, gold and quartz first. More candidates: birch tar, shellac, rosin, bitumen, pumice, asbestos (with an honesty note), cinnabar. Dossier: `docs\gallery\reference\geode_inn_reference_hidden_materials_dossier.md`.

Stone rewards by game (examples; full list is in the MarketItem files, see 6.2):

| Game | Reward stone |
|---|---|
| Standing Stones | Preseli Blue Stone |
| Andean Run | Blue Opal |
| Monster of the Deep | Freshwater Pearl |
| Temple of the Naga | Zircon |
| The Pipe Descent | Pipe Stone |
| The Dream Gardener | Dream Quartz |
| The World Walker | Rainbow Stone |
| The Egg Carrier | Fire Agate |
| The Mirror's Seven | Snowflake Obsidian |
| The Crystal Paddle | Beryl |
| The Noob Siege | Lodestone |
| The Apothecary's Cure | Malachite |
| The Forest Defense | Moss Agate |
| The Thread (proposed #62) | Rainbow Moonstone |

The 55 stones written in Sep 4 batches (names by batch):

- Batch 1, agates and jaspers (10): Plumed, Flower, Dendritic, Fossil (turritella), Montana Moss Agate; Bumblebee, Desert, Ocean, Picasso, Sunset Jasper.
- Batch 2, night stones (6): White Moonstone, Peach Moonstone, Black Opal, Boulder Opal, Nuummite, Gold Sheen Obsidian.
- Batch 3 (8): Green Onyx, Lemurian Blue Calcite, Gem Silica, Hackmanite, Kammererite, Hypersthene, Orange Kyanite, Moss Kyanite.
- Batch 4 (6): Guatemalan Jade, White Jade, Jadeite, Grossular Garnet, Ruby with Kyanite, Tundra Sapphire.
- Batch 5 (15): Ammolite, the fossil cabinet record (coprolite, coral, opalized wood, orthoceras), Petrified Palm Wood, Chrysanthemum Stone, Chinese Writing Stone, Covellite, Cuprite, Copper, Chrysocolla Azurite, Epidote, Eudialyte, Staurolite, Preseli Blue Stone, Tibetan Turquoise, Aquaprase.
- Batch 6 (10): Rubellite, Blue and Black Tourmaline, Clear Topaz, Blue Tiger's Eye, African Sodalite, Phantom Quartz, Solar Quartz, Green Labradorite, Lepidocrocite.

Other stones named in the early build: River Amber, Frost Iron, Dreamtime Opal, Rhine Quartz, Provence Limestone, Alpine Granite, Vistula Agate, Dream Quartz, Rainbow Stone, Fire Agate, Snowflake Obsidian, Beryl, Lodestone, Moss Agate, Zircon, Pipe Stone, Source Stone (Hollow Earth core).

### 1.11 Stone families are not stone records

Four ideas sit next to stones and should not be confused with them:

- **Stone Capsules** (Sep 2 spec): stones are capsules; harmonized enemies become companions; the geode cave is the storage box.
- **Stone Poker:** stones are the currency; a "pebble-class" stone is the buy-in.
- **Bead Composer:** the tool that arranges stones as beads (see 4.8).
- **Gemstone Egg Economy:** eggs hatch pets whose species come from a stone plus a zone (see 3.3).

### 1.12 Open and to reconcile

- **Count ladder.** Live database 164 to 166, original images 198, census 200, amazonite 201. No note explains how 166 plus two new stones became 200. Ask the builders for a live count by name and compare with the census.
- **34 stones missing from the live database** (Aug 31). Not confirmed fixed.
- **Moldavite:** moved to its own room, Moldavite's Perch in Cosmology, on Sep 13 (draft). `stone_zone_map.json` still lists it first under Staircase (checked in the Oct 22 copy). The map needs an update, or a second-home mark.
- **Amazonite (#201)** is in the zone map (line 162) but the file header still says 200.
- **Vesper duplicate** (same spirit on three stones) was marked fixed Sep 4.
- **Zone count of Water Zones:** 38 first, corrected to 37. Archive: 12, then 13 with Blue Tiger's Eye. The JSON says 37 and 13.
- **Second-home ruling and the 52 census addenda** still need a client ruling (Sep 4 open item).
- **Body lines and health claims.** The Body texts use "supports..." wording. No rule was found on health claims. The only related ruling is Sep 12: wellness claims about Himalayan salt are filed as claims, not cures.
- **Mohs table** (talc 174 Hz to diamond 852 Hz versus the C major mapping): confirm in the audio JSON.
- **Mohs Vibration branch:** push state unknown.
- **Stone image files in GitHub:** the Aug 31 push of PNGs was "still to do" and was later covered by the 457-file Godot push. The repo copy has not been checked here for the PNGs.
- **Early counts (Jul 22 to Aug 31).** 168 extracted, 164 loaded, 117 complete, 160 in the vibration index, 167 and 168 after the two new stones, 198 images, 298 chimes. The early chat says "about 49" stones were empty on Jul 22, and also 51, and the commit log says 55 on Aug 28. These are different days, not one count. The 298 "stone chimes" figure is not explained anywhere and does not match 198 or 200. Open.
- **Card engine versus Stone Poker.** The Aug 31 commit log has a Resonance card engine that scores stones (Mohs gives Power, opacity gives Defense, color gives Element). The game itself belongs to the games part of the manual. Which stone fields the card engine reads in the live app is not stated.
- **Dreamstone versus peridot.** Before the Song gives the Peruvian quest reward as peridot in one place and the Dreamstone in another. Not reconciled.

### 1.13 Early stone canon (Jul 12 to Aug 30)

Everything here predates the Aug 31 chat. Later rulings in 1.1 to 1.12 win where they differ.

**Template additions from the early period.** The Stone entity as the early chat and the commits describe it also carried: Color, Frequency (Hz mapped from the Mohs scale), Family, and a Category such as precious, semi-precious or ornamental (August canon, from the Hook document). Short record in the book data: name, Mind, Body. These fit the fields in 1.3.

**Stone names that appear first in the early period.**

| Stone | Where it appears | Note | Status |
|---|---|---|---|
| Preseli Blue Stone | Stonehenge reward (Jul 22); pedestal of the Golden Contract; second Fae Kingdom entry point; the Seelie King wears it without knowing it is the Song's frequency | Vibrates at a harmonic of 42 Hz. Bluestone Key is the pendant version | Proposed (Jul 22), August canon, Built (commit, Aug 23) |
| Lapis Lazuli | Egypt and Tomb Tunnel reward; Mesopotamia; the Observatory's blue | Also an arcade reward in the Aug 30 game code | Proposed (Jul 22), Built (commit, Aug 30) |
| Blue Opal | Peru reward, Andean Run | Matches section 1.10 | Proposed (Jul 22), Built (commit, Aug 30) |
| Peridot | Seelie Court reward (Jul 22); the Queen of Roots' stone, "the soul of the volcano goddess" | Shown in the crown of the Redwood Cathedral | Proposed (Jul 22), August canon |
| Cat's Eye Chrysoberyl | Bastet's Herding reward | Bastet sits at 64 Hz | Proposed (Jul 22), August canon |
| Labradorite | The Duck's first gift and the first stone; the stone the selkie came ashore for ("She came ashore for labradorite. She stayed for the bench.") | Aurora Pendant sample item is labradorite | August canon |
| Quartz | The first stone placed in the geode cave when "The Welcome" completes: master healer, clearest frequency, baseline | | August canon |
| Anthracite | Bayou | | Built (commit, Aug 26) |
| London Blue Topaz | Poison Garden | | Built (commit, Aug 26) |
| Lapis Lazuli, Carnelian, Agate | Mesopotamia | | Built (commit, Aug 26) |
| Ammolite | Canadian Rockies; "the zone's heart" (opal over ammonite) | Kainai ranger calls it iniskim (buffalo stone) | August canon, Built (commit, Aug 26) |
| Dutchman's Stone | Superstition Mountains | The Lost Dutchman's mine glows golden at 42 Hz | Built (commit, Aug 26) |
| Desert Rose Selenite | Sandfall reward; unlocks the Bone Room | | Built (commit, Aug 30) |
| Tongue Stone | India | | Built (commit, Aug 26) |
| Freshwater Pearl | Arcade reward (Monster of the Deep) | | Built (commit, Aug 30) |
| Starlight Crystal | Rare; carried by the Constant | The Constant's carrying game | August canon |
| Malachite and chrysocolla | The green glow; malachite is toxic when ground | The Artisan Thief knows it ("theft is redistribution") | August canon |

**Stones by element** (Survivors of the Song, August canon): water (aquamarine, larimar, pearl), earth (granite, marble, river stones), fire (carnelian, fire opal, volcanic glass), air (selenite, celestite, blue calcite), aether (labradorite, moonstone, the starlight crystal).

**Obol and Charon (August canon, also in the early chat).** Payment for the ferry is one stone. The Undercity's fast travel rides Charon's ferry for one coin (the obolus, which in the Inn is a stone).

**Atlantean Silica and rare stones.** Cthulhu's quests reward the rarest stones. Atlantean Silica is the named quest reward (early chat, Aug 21). Other early items that are stones or stone-adjacent: Sala Welcome Stone (no properties), Twin Crystal and Eternal Twin (a pairing reward), the Score Stone (a 7-foot obsidian monolith holding live scores, with a 50 BPM pulse-line carved into its base). Status: Built (early chat) or August canon.

**The Duck and stones** (early chat, Aug 22 or later). The Duck steals shiny things, detects stone frequencies by electroreception, and takes the highest-frequency stones first. It cannot detect the Prism Portal crystal (7.83 Hz is below its range). Its stash is a hidden mini geode cave whose stolen stones form a chord. Follow it three to five times and it becomes a companion. Built (early chat).

**Gargoyle frequencies** (August canon). Watcher 111 Hz, Listener 64 Hz, Sage 528 Hz, Gatekeeper variable, Caller 432 Hz. The Keeper gargoyle's note is a harmonic of the player's most-collected stone category.

**Trovants.** A trovant is a growing stone (real: Costesti, Romania; sandstone concretions; "trovant" is Romanian for "growing stone"). In the Inn it is a stone that wakes when named. Full rules are in 4.13.

**Resonance card engine (Aug 31 commit log).** Mohs hardness gives Power. Opacity gives Defense (opaque 8, translucent 5, transparent 3). Color gives Element (Fire, Water, Earth, Air, Aether). Optical phenomenon gives special abilities. Fire beats Earth beats Water beats Fire; Aether is neutral or better. Ten-turn limit; score is the defeated card's Mohs number times 10. Built (commit, Aug 31). The game itself belongs to the games part.

---

## 2. Charms

### 2.1 What charms are

Charms are small collectible objects the player wears. They are the Inn's quietest progression system: they only grow, never expire, and nobody sees a score. All of them live on the **Charm Bracelet** (`docs\zone_specs\geode_inn_charm_bracelet_master_spec.md`).

Laws:

- Every player gets a bracelet from the Host with one charm, the Inn-Tree sigil. No name, no payment. (Charm bracelet spec.)
- The bracelet only grows. It never decays or loses charms (anti-FOMO).
- The Ragana assesses the bracelet in words, never numbers: "Adequate." "Sufficient." "Noted."
- When the same stone is earned twice the player chooses: stack a second bead or upgrade the existing charm.
- The bracelet is digital and also a real Soulstice piece. Players can order theirs as a physical bracelet.
- The Philosopher's Stone stage is not an item but a state of being (Sep 3).

### 2.2 The four charm types on the bracelet

| Type | Source | How many | Notes |
|---|---|---|---|
| Stone charms | Arcade game rewards | 164 possible | Small beads or pebbles. Upgradable by crafting |
| Sigil charms | Character quests | 40+ | The character's memory, made wearable |
| Frequency charms | Zone mastery | 6 | Song amber, Silence obsidian, Fire red, Water teal, Stone grey, Root green |
| Craft charms | Learning a craft | 10+ | A tiny chisel, hammer or tuning fork. Mason and the Clockmaker teach them |

The 164 count matches the early stone database. With 200 stones now, the number of possible stone charms is unreconciled (see 2.6).

Earlier (Aug 24, commit log): the first bracelet spec had **six** charm types, not four: Stone (games), Sigil (characters), Frequency (zones), Quest (storylines), Artist (jigsaw) and Technique (crafting). The later four-type table above stands. How the Quest, Artist and Technique types map onto it is not stated. Built (commit, Aug 24). See 2.7.

### 2.3 Template: Element charm (periodic table)

Doc: `docs\geode_inn_periodic_table_charms.md`. Data: `docs\element_charms_data.json`. 118 charms, one per element, each a 1 to 2 cm sculpture. Native metals are cast as nuggets, crystal elements as points, gases in glass orbs, toxic elements in dark forms, radioactive ones faintly luminous, rare earths color-shifting. Charms are found in the zone where the element occurs. Oceanianoir's periodic table tattoos are the charm catalog: reading an element on her skin makes that charm findable. Four acquisition tiers: Tier 1 surface (30 elements), Tier 2 deeper (50), Tier 3 rare, alchemical (30), Tier 4 hypothetical and transuranic (8, needs "The Rosetta Stone" quest).

| Field | What goes here | Example |
|---|---|---|
| `elementSymbol` | Chemical symbol | H |
| `elementName` | Name | Hydrogen |
| `atomicNumber` | Number | 1 |
| `atomicWeight` | Weight | 1.008 |
| `elementCategory` | Category | Reactive Nonmetal |
| `zone` | Where it is found | Canopy City |
| `acquisitionTier` | 1 to 4 | 1 |
| `rarity` | Rarity word | Common |
| `charmDescription` | What the object looks like | "A tiny glass orb containing a faint blue glow" |
| `connectedStones` | Stones that express the element | Lithium: Lepidolite, spodumene, petalite |
| `questConnection` | Quest tie | Inn-Tree base exploration |
| `alchemicalNote` | In-world meaning | "The first element, the star's fuel." |

Other element charm rules: Silicon has an ElementCharm (Sep 3). An iron element charm is a candidate only (Oct 2, unruled). The bracelet is copper chain (copper is the alchemical marriage). Squeak wears the same charms on a black leather collar.

### 2.4 Template: Quest charm (sigil)

Data: `docs\quest_charms_data.json`.

| Field | What goes here | Example |
|---|---|---|
| `charmType` | sigil (other types possible) | sigil |
| `questName` | The quest | The Living Map |
| `appearance` | The object | A torn map fragment with one ink line |
| `description` | What it means | Cartographer's sigil, for completing a zone map |
| `earnedFrom` | The giving character | The Cartographer |
| `npcConnection` | NPC link | The Cartographer |
| `storyThread` | Thread name | The Wandering |
| `zone` | Zone | Canopy City |
| `rarity` | Rarity word | Uncommon |
| `rewardEffect` | What it does worn | Reveals unexplored areas on the zone map |

Other examples in the file: The Silence Between (Nyx, starfield charm, Rare, silences ambient noise), The After (the Pirate, bodhrán charm that pulses at 50 BPM, Rare).

### 2.5 Where charms live and other charm rules

- GitHub: the three files above, plus `docs\geode_inn_charm_bracelet.md`, `docs\harvest_2026-09-21\periodic_table_charm_collection.txt`, and the mineral spirit files (see 1.4).
- Base44 entities: `ElementCharm`, `QuestCharm`.
- Gris-gris (Cross-Craft Overlay, Sep 10): one stone, one herb, one wood token, one intent, bound in a bag. The charm that does one small true thing.
- Diplomatic Key (Oct 2, logged as design): a jeweler's key of tiger iron, rainbow moonstone Celtic banding and a moldavite dangle that nulls the cold-iron ward. Formal spec is pending.
- Charms and cards: the idea that a bracelet could become a deck is in the spec, not ruled.

### 2.6 Open and to reconcile

- The element charm count is 118 everywhere, but the doc calls hypothetical element 119 "the 118th charm". Its tier counts add to 118 (30 + 50 + 30 + 8), so one of the two statements is off.
- Oceanianoir's skin carries "117 element tattoos" (Sep 12) while the charm set is 118.
- Stone charm count (164) versus the 200 stones.
- The bracelet's physical Soulstice version has no product spec in the repo.
- Six charm types (Aug 24) versus four (later spec). Whether Artist charms (jigsaw) survive is not stated.
- Five upgrade levels are listed but six names are given (see 2.7).
- Sigil count: 40+ (Aug 24 attire spec and the bracelet spec) versus 45 QuestCharm records in the Aug 26 data files.

### 2.7 Early charm, bracelet and attire canon (Aug 24 to 26)

**Charm Bracelet (Built, commit, Aug 24).** It replaces a traditional progression screen: no score, no level, no percentage. The starter cord becomes the iron Alchemist's Chain and then climbs through the alchemical stages: Nigredo (iron), Albedo (copper), Citrinitas (silver), Rubedo (gold), Philosopher's Stone (after the Egg). The later spec says the bracelet is copper chain; the two statements are not reconciled (see 2.6).

**Upgrade levels (Aug 24).** The commit lists "five upgrade levels" and then names six: Raw, Wire-wrapped, Set, Forged, Engraved, Master. Built (commit, Aug 24).

**Silica Thread Weaving (Aug 24, Built).** The sixth technique charm. It is dexterity-gated (10 percent to 100 percent success). The silica thread sings at 111 Hz between charms. The gate is "The Selfie", a mirror-match Tetris game. Written up Aug 29 as the closing item on the "Still Missing" list.

**The Egg (Built, commit, Aug 24).** An ancient puzzle egg in the style of a Faberge egg: 7 layers, 7 puzzles, 7 revelations. Geode (amethyst, pattern recognition); iron filigree (rhythm at 50 BPM); copper lattice (wire-wrapping); silver enamel (stone-setting, requires giving away charms); gold filigree (forging); silica thread (the Selfie gate); the Core (empty, the player is the Egg, charms return transformed). This is a puzzle object, not the Hatchery egg in section 3.

**Wearable Attire System (Aug 24, Built).** Frequency colors replace house colors. Each costume has a sigil symbol and a signature stone. The standard is "Adequate" (essence, not accuracy). 40 or more sigils and 30 or more signature stones are planned. Spec in the repo: `docs\zone_specs\geode_inn_wearable_system_master_spec.md` and `docs\geode_inn_wearable_system.md`.

**Periodic Table Charm Collection (Aug 26, Built).** 118 ElementCharm records and 45 QuestCharm records. File: `docs\harvest_2026-09-21\periodic_table_charm_collection.txt`. This is the source of the 118 in 2.3.

**Reward tools by quest (August canon).** Most quests reward a tool or a perception ability, not a stone: the Crone's Lens, the Catalyst's Recipe, Mozart's Ear, the Cartographer's Compass, the Examiner's Calipers, the Seed, the Crown's Echo, Form Sight, the Beacon, the Siren's Mirror, the Compass That Points Forward, the Frame. They are quest items and abilities; whether each also gets a QuestCharm record is not stated.

**Gargoyle signatures and the Golden Contract.** The six gargoyle frequencies sign the Golden Contract, which sits on a Preseli Blue Stone pedestal (August canon).

---

## 3. Eggs and the Hatchery

There are three egg systems. Keep them apart.

| System | What it is | Ruled |
|---|---|---|
| Seed companions | The Catalyst trades a seed for a story. The story shapes the companion. One per story | Stated Sep 10; the Catalyst's bar economy is in the Oct 9 bar canon. No separate ruling found |
| Egg Hatchery | Community engine. Retired characters become eggs. The community votes. 28 days | Designed Aug; Event 1 written |
| Gemstone Egg Economy | Eggs spawn from level wins, hatch into pets, with trading and study | Ruled Sep 10 |

### 3.1 Egg Hatchery

- Each egg lives 28 days. Four content types: NPCs, game modes, events, player characters. Retired characters become eggs.
- Vote options. Aug 31 to Sep 1 notes say STAY / LEAVE / HIDE. The Event 1 document and the Sep 10 chat says Nurture / Release / Hide. Both appear in the repo. Treat Nurture / Release / Hide as the later wording (see 3.4).
- The vote decides behavior, not existence. Event 1: "The Old Smith is a permanent NPC regardless of vote outcome."
- Event 1, "The Crone's Casting": Ragana has cast three stones into the deep; three eggs; one hatches per week for three weeks; final week is reveal. The event title stays "The Crone's Casting" but the creator is Ragana (ruled Sep 9). Eggs include The Old Smith (Iron shell, Main Floor forge) and The Silent Bard (Crystal shell, Common Room, 432 Hz).
- Shell tiers (Sep 9 art): Stone (moss in knotwork), Iron (ember runes), Gold (Faberge lattice), Geode (volcanic outside, amethyst inside). The seed file also uses Common and Rare as `eggShellTier` values.
- Ten earlier eggs on the live site, all retired: Auntie Whisker, The Hollow Choir, Mothlen the Lantern-Reader, Garrick the Quiet Smith, Tide-Market Tuesday, The Wandering Pane, Vex the Cartographer, Ollivant the Egg-Tender, Dusk-Skip Mode, Brimstone Mode.
- Backend functions: `getHatcheryData`, `voteOnEgg` (rejects bad IDs, duplicate votes, inactive eggs).
- Elio's idea that each egg hatches a new room is a proposal only.

Template (from `docs\egg_hatchery_seed.json`; entity `EggHatch`):

| Field | What goes here | Example |
|---|---|---|
| `contentName` | Name of the egg | Pip the Ember-Mouse |
| `contentType` | NPC, Event, game mode, player character | NPC |
| `contentDescription` | What hatches | A tiny mouse with a flame for a tail behind the Common Room hearth |
| `creatorName`, `creatorPlayerId` | Who proposed it | (a name or id) |
| `zone` | Home zone | Common Room |
| `status` | active or retired | active |
| `hatchMonth` | Month key | 2026-08 |
| `voteCount`, `signatureCount` | Tallies | 0, 0 |
| `signatureThreshold` | Signatures to hatch | 50 |
| `eggShellTier` | Shell tier | Rare |
| `resonanceScore` | Number | 42 |
| `sourceType` | Where it came from | community |
| `isPermanent` | Stays forever | false |
| `questlineSteps` | List of steps | Find Pip, offer a crumb, receive a warm stone, keep the fire alive |

### 3.2 Foundling Register (pointer)

Young, helpable critters (rock biters, baby stars, baby Venus flytrap) are filed in the Foundling Register spec (Oct 14). It belongs to the creatures part of the manual. Names for the series and its three members are open.

### 3.3 Gemstone Egg Economy (ruled Sep 10)

File: `docs\zone_specs\geode_inn_gemstone_egg_economy_spec.md`.

- **Spawn Law.** Eggs are earned by winning levels, never bought. No cash for eggs, ever.
- **Zone pools.** Each game draws from its zone's pool. Rarity follows the six frequency colors. Seasonal spawn windows follow the Beat Line. The 18.6-year egg is a window most players never see.
- **Hatch Law.** Hatching runs on presence, not timers. An abandoned egg waits. Eggs warm in a nest in the geode cave at 50 BPM.
- **Species Law (Sep 11).** The Critter Roster is the pools' index. A zone's ambient critters and its hatchable pets are one list.
- **Trading (ruled Sep 10).** The Resonance Trade at the Treetop: a trade must resonate, both wants humming at the same frequency.
- **Zoologist path (ruled Sep 10).** Study is the third pillar. Study scenes are hidden-object play, drawn in each zone's artist style. No purchase, no timer. Zoologists are the built-in moderators.
- Open gates: the system's name, the physical jewelry bridge, whether it needs a new entity or extends `PlayerInventory`, the first pool (proposed: Tomb Tunnel), the Zoologist's title, moderator powers, bestiary depth.

### 3.4 Open and to reconcile

- Hatchery vote labels: STAY / LEAVE / HIDE versus Nurture / Release / Hide.
- Entity name: notes say `Egg` early, the seed file says `EggHatch`. Use `EggHatch`.
- Live site has only retired eggs; the five active records in the seed file were meant to be created (status not confirmed).
- Egg images: the Aug 31 audit said no images; four shell tiers were painted Sep 9. Per-egg art is not confirmed.

### 3.5 Early egg canon (Aug 24 to 31)

- **The Egg (puzzle object).** The Faberge-style seven-layer Egg of Aug 24 is a progression puzzle, not part of the Hatchery. See 2.7. The Egg also appears in "The Egg" scenes of Before the Song (August canon): each of seven characters (Crone, Vessel, Mim, Dragon, Owl, Constant, Nyx) sees the Inn differently, and each has its own play style. That belongs to the story part.
- **The Duck's egg (early chat, Aug 22 or later).** The rarest item in the Inn. It hatches by care, not by a quest. The baby is the only companion that is born, never dissonant. Built (early chat).
- **Egg monthly hatchery (Aug 30, commit log).** The Egg monthly hatchery and "The Teacher" were first written Aug 30; the Egg and comic strip were joined the same day; a /hatchery web page spec followed Aug 31. Only the Month 1 event existed (`egg_hatchery` Month 1). Built (commit, Aug 30 and 31). Specs only, not implemented as of Aug 31.
- **Companions and eggs.** In the Aug 22 progression design, a harmonized enemy joins as a companion stored in a stone capsule, and the baby dragon's geode cave is the "PC box". Companions persist across reincarnation, and the bond is built by listening, not feeding. This is the earlier companion canon; the Gemstone Egg Economy (3.3) is a separate, later system. Ruled (early chat, Aug 22 or later).

---

## 4. Crafting, building and gathering

### 4.1 What is playable and what is library

Two sets of numbers exist, and both are true.

| Set | Materials | Blueprints | Where |
|---|---|---|---|
| Published Geode Inn app (playable) | 31 | 8 | Stated Sep 22 |
| Wider design library | 119 | 148 | Stated Sep 22, "not playable, different structure" |

Also stated in the chat logs and spec:

- Material entity: 104 records (Sep 1, from crafting icons), then extended with craft fields and new records through Sep 10.
- `BuildingRecipe` entity: 148 records. The Sep 10 cross-reference found 86 distinct materials in those recipes, 83 already in the Material entity, and 3 missing (Indigo, Heather, Resin), which were created. Yew was also given craft fields. Result: every recipe's demand is gatherable.
- Supply icons: 76 total (71 supply icons in 6 categories and 5 tool icons), manifest `docs\gallery\geode_inn_supply_icons_manifest.md`.
- A stock list (materials, blueprints, a proposed first-playable camp kit, an image-matching checklist) was written Sep 22 as a downloadable Word file. It is not in the repo and the download link expired. Proposals were labeled as proposals.

The 31/8 and the 119/148 versus 104/148 do not match. See 4.12.

### 4.2 Template: Material

Entity `Material`. Craft fields were added Sep 10 (ruled, client's craft law). Harvest fields were in place before that.

| Field | What goes here | Example (Cypress) |
|---|---|---|
| Name | The material | Cypress |
| Category | Wood, stone, metal, plant and fiber (older list) | Wood |
| Zone | Where it is gathered | Bayou Bridge |
| Rarity | Common, Uncommon, Rare, Legendary | Common |
| Harvest fields | Respawn timer, tool required, building tier (names not given) | Tool: axe |
| `craftPillar` | Stone, Herb or Wood | Wood |
| `craftProperty` | The real property | Does not rot in water |
| `ritualRole` | The ritual use that property earned | The Crossing Wood: graveyards, things that must last through both worlds |
| `climateCycle` | Season, tide, climate window | Bayou humidity (not given for each wood) |
| `craftPairing` | Companion materials | Thyme planted under rose (herb example) |

The craft law behind it: the folklore is the field note, and the effect is real. Wood example set (Sep 10): Cypress (crossing), Oak (threshold), Willow (grief, with a bark remedy bridge), Bog Oak (memory), Rowan (protection, created), Cedar (keeping), Ash (connection), English Oak (oath), Yew (passage).

### 4.3 Template: Blueprint (BuildingRecipe)

Entity `BuildingRecipe`. Sample data: `docs\library\data\recipes.json`. Related files: `geode_inn_all_recipes.json`, `norse_slavic_recipes.json`.

| Field | What goes here | Example |
|---|---|---|
| `resultName` | Name of the building | Deir el-Medina Craftsman Dwelling |
| `buildingTier` | 1 to 5 | 2 |
| `materials` | List of material names | sandstone, papyrus, copper |
| `quantities` | Matching list of amounts | 45, 15, 5 |
| `description` | What it looks like | Sandstone walls, papyrus thatch roof mats, copper fittings |
| `historicalNote` | The real history it is based on | Modeled on the artisan village of Deir el-Medina |

Rule: every material in a blueprint must exist as a Material record (the Sep 10 reconciliation). A new blueprint with a new material means a new Material record first.

### 4.4 The building system

File: `docs\zone_specs\geode_inn_building_system_master_spec.md` (also `docs\geode_inn_building_system.md`).

- **Seven base materials:** Wood, Stone, Clay, Sand, Ore, Hemp, Thatch. Every building is made from these.
- **Derived materials:** stucco, mortar, wattle and daub, fired brick, glass, smelted metal, bronze, Roman concrete, gold leaf, hemp paper, hemp oil, silica thread.
- **Gathering loop (7 steps):** observe, listen, gather at 50 BPM, craft at a bench, build, name, sit. Naming is the saving mechanism. The named structure appears on the Cartographer's map. Sitting makes the 42 Hz hum audible.
- **Five tiers:** 1 Shelter (Nigredo), 2 House (Albedo), 3 Hall (Citrinitas), 4 Castle (Rubedo), 5 whatever the player dreams (Philosopher's Stone). The Ragana judges each: "Adequate."
- **Town formation:** 1 structure Homestead, 3 to 5 Hamlet, 6 to 10 Village, 11 to 20 Town (named), 21 to 50 City (charter from the Host), 50+ Wonder.
- **Campgrounds is the building system's home zone** (Option 7, The Homestead, ruled Sep 10).
- **Build-Scholar, Frank Wright** (ruled Sep 14): the unpowered carpenter-scholar at the Campgrounds. Optional build review using real architecture canon. Spec: `docs\zone_specs\geode_inn_campgrounds_build_scholar_spec.md`.
- Earlier (Aug 24, commit log and Before the Song): the first tier list was by building kind, not by alchemical stage. Tier 1 Shelters, Tier 2 Castles, Tier 3 Sacred buildings, Tier 4 Mausoleums, Tier 5 the Cave City. The alchemical stages (Nigredo to Philosopher's Stone) were written the same day as a second tier scale. The later five-tier list above is the one the Sep 10 spec uses; the two scales are not merged in any ruling. Built (commit, Aug 24). See 4.13 for the building kinds under each tier.
- Early universal rules (Aug 24, commit log, still standing, nothing later changes them): gather, don't take; build by hand; a shelter is a nook; buildings persist across reincarnation; the Duck visits every shelter; the guide approves the site. Master Builder recognition for building all 7 shelter types. Built (commit, Aug 24).
- Early name for the seventh base material: "Thatching" (Aug 24 commit). The Sep 10 spec says "Thatch". Same material.
- Stucco is derived (sand, lime, water), not an eighth base material (Aug 24).
- Older layout doc: `docs\building_gathering_system.md` lists Ironforge-style corridors, each with gather lists, and tables of wood, stone, metal and plant types. It predates the later specs.

### 4.5 The three gathering professions

Ruled Sep 19: **Mining, Herbs, Woodcutting.** WoW-style structure: visible nodes, region tables, skill by doing, rare finds.

Inn rules on top:

- No node competition. Nobody steals ore (Sanctuary law).
- Skill growth makes the character more attentive, not a Skinner bar ("a maxed herbalist reads a meadow like a menu").
- Woodcutting: deadwood and windfall first, living trees cut slowly, one swing at a time. Wood taken kindly rings truer in craft.
- Tools (pickaxe, sickle, axe) all start as "Bob" and earn names (Bob Doctrine).

Replaces: the Sep 2 weave listed mining, herbalism and water collecting as the three professions. Water collecting is not in the Sep 19 ruling.

### 4.6 Cross-Craft Overlay

Ruled Sep 10. File: `docs\zone_specs\geode_inn_craft_curriculum_master_spec.md`.

- **One grammar:** pattern equals frequency equals function.
- **Three pillars.** Stone (geometry): six named patterns, circle, spiral, line, triangle, grid, veve. Herb (chemistry): the effect is real, plants do what plants really do; companion planting; climate is the prescription. Wood (property): the legend is a label someone wrote on a true observation.
- **Synthesis law:** a gris-gris is the full curriculum in one bag.
- **Anti-gatekeeping:** a player who masters only one dialect is still a whole craftsperson.
- Mentors: Marie Laveau (assembly, in the Quarter), Luna (stone, at the bench), the gardens (herb), the corridors (wood).
- Combination Still (Poison Garden): two herbs and one measured dose. Wrong dose is still poison.
- Open: the full pattern set beyond six, remaining herb and wood records (continuation pass), and the crafting interface.

### 4.7 Color Works: dye and glass

Ruled Sep 10 (client directive). File: `docs\zone_specs\geode_inn_color_works_master_spec.md`.

- **Dye wheel, twelve colors.** Primaries from single plants: red from madder, yellow from weld, blue from indigo (or woad in the north). Secondaries are overdyes: orange (madder plus weld), green (weld overdyed in indigo, always an overdye), purple (madder overdyed in indigo). Six tertiaries are precise dips. Mordants (oak gall, iron salts) fix color: "the color is only as permanent as its hold."
- **Glaze line.** Glaze is the dye wheel at kiln temperature. Cobalt blue, copper green (oxidation) and copper red (reduction), iron celadon or rust, manganese purple-black, tin white. Firing methods are the game modes: oxidation, reduction, raku (pull, plunge, reveal). Bone china uses bone ash from the Bone Room.
- **Glass House (added Sep 10).** Breath made permanent. Equation Law: the Glassblower's color formulas are earned one at a time by comparison, never sold or told ("the glassblower never tells, the glassblower shows"). Equation ladder: cobalt blue, manganese clear (the glassmaker's soap), copper aventurine, iron green, sang de boeuf, gold ruby (the sacred one). Raw glass: sea glass (Tidal Caves) and desert glass (Egypt).
- **Two-Fire Secret:** copper red in reduction belongs to both the kiln and the furnace. The fire family has three rooms: Forge, Kiln, Furnace.
- **The Glassblower** (ruled Sep 10): rotates between family days (debating the craft's secrets) and shop days at the steampunk glass shop in the Campgrounds. Played as a grumpy artist, no softening. Name not given (client's ruling).
- Pigments overlap dyes: cochineal, Tyrian purple (about ten thousand murex snails per gram), ochres (Sep 14).
- Open gates (Sep 10): raku showcase, studio placement, Kiln Keeper as an NPC or a facet.

### 4.8 Bead Board, Bead Composer, shapes, findings and trays

**Bead Board and Composer.** Ruled Aug 31: build the actual Bead Board first, before findings. Features: add and remove beads, save locally, export to JSON, search, category filters. The Composer arranges stones by Mohs pitch and shape tone, reads left to right, exports a production spec and a WAV. The client's real craft (custom wire, bead and leather pieces) is the model. Delivered through the backend function `beadComposer`. Bead Composer is an accepted stim tool (Every-Mind Welcome charter). It uses precision drag and drop, so the motor-access question is open.

**Bead shapes (16 templates):** 8 smooth (Round, Barrel, Coin, Drum, Freeform, Rondelle, Teardrop, Tube) and 8 faceted (Round, Oval, Cushion, Pear, Baguette, Marquise, Princess, Trillion).

**Metal findings (Ruled Aug 31, client "Yes"):** 5 metals (Dark Silver, Light Silver, Copper, Bronze, Gold) times 22 types equals 110 images. The 22 types: Lobster Clasp, Spring Clasp, Toggle Clasp, Magnetic Clasp, Jump Ring, Split Ring, Crimp Bead, Crimp Cover, Headpin, Eyepin, Bail, Bead Tip, Ear Wire (Fishhook), Ear Post, Ear Nut, Bendable Wire (round), Bendable Wire (half-round), Cord End, End Cap, Connector, Link, Chain (Celtic weave). Specialized components will be added later from the client's reference photos.

**Open on the Composer:** bead sizes, multi-strand layouts, silk cord, and the link between the Composer and the game.

**Earlier on the Composer (Aug 28 to 31).** The Bead Composer design doc was one of five missing docs written Aug 29 (Built, commit, Aug 29). A separate Bead Composer spec described a standalone SaaS product: MVP scope, a four-tier monetization plan, a downloadable Player app with a `.bead` file format, an "Inn Mode" universal audio processor with seven room profiles (Archive, Catacombs, Observatory, Staircase, Campgrounds, Shadow Inn, Geode Cave), and an Inn Mode Pro subscription (Built, commit, Aug 29). Files in the repo: `docs\geode_inn_bead_composer.md`, `docs\geode_inn_bead_composer_standalone_product.md`, `docs\zone_specs\geode_inn_bead_composer_master_spec.md`. On Aug 30 the Composer was placed at the Geode Inn site, not a separate domain (Built, commit, Aug 30). The Godot script `BeadComposer.gd` (289 lines) was committed Aug 31. The faceting rule in the Composer (opaque smooth, translucent faceted, opals the exception) was committed Aug 30. A "Cabochon cut system" and a Celtic knotwork weaving game with a click-to-guide wire design mode were added Aug 29, and `Knotwork.gd` (340 lines) Aug 31. Which Composer plan wins, standalone product or site feature, is open (see 4.12).

**Selkie crafting quest line (Aug 29, commit log).** A crafting quest line for the selkie (the Artisan Thief) was committed with the cabochon work. Details are not in the commit message. Built (commit, Aug 29).

**Default Tray Registry** (ruled Sep 13). File: `docs\zone_specs\geode_inn_default_tray_registry.md`. Trays ship with defaults: the world's well-known spirals. A tray is a spiral you can hold. The master default is the Fibonacci Stepped Spiral, the logo's own. Six defaults plus the blank Maker's Bench.

Template (entity `TrayTemplate`; six records staged Sep 13):

| Field | What goes here | Example |
|---|---|---|
| `name` | Tray name | The Fibonacci Stepped Spiral |
| `layoutType` | Short layout code | fibonacci-stepped |
| `dipCount` | Number of dips | 8 |
| `isDefault` | Ships as a default | true |
| `unlockCondition` | What unlocks it | Unlocked from the start |
| `unlockZone` | Where the Inn first shows it | Main Floor (bead board) |

Current canon:

| Tray | `layoutType` | `dipCount` | Unlock |
|---|---|---|---|
| The Fibonacci Stepped Spiral | fibonacci-stepped | 8 | From the start |
| The Triskelion | triple-spiral | 4 | Celtic Highlands visit |
| The Classical Labyrinth | unicursal-7-circuit | 8 | Labyrinth country |
| The Golden Spiral | continuous-groove | 0 (a groove) | Color Works country |
| The Ammonite | logarithmic-chambers | 9 | Fossil and deep water country |
| The Sunflower | phyllotaxis-dual | 21 | Campgrounds gardens |
| The Maker's Bench | (blank) | the maker's choice | The tray that becomes yours |

Laws: No-Fail (no wrong dip), Steady Light, Anti-Skinner (no sort timers), REC law (skins ride free via the BoardSkin system). Open gates: the tray-crafting system for the Maker's Bench, whether zone defaults arrive in inventory or at a zone shop, and BoardSkin pairings.

**Tiger Iron Rite** (ruled Oct 9, commit `b995b1a`): the redcaps' hematite armor is upgraded to tiger iron by infusing tiger's eye. Chatoyant band gives armor a moving eye.

### 4.9 The TRF camp-building loop and the first-playable kit

Proposed by Elio Sep 22, agreed by the client the same day.

- **Beta timing:** Oct 1 is a small private beta with trusted testers (one complete path). Oct 10 begins the eight-week TRF invitation (not a deadline). If a path fails, show a preview and collect interest. The chat logs do not spell out "TRF".
- **Loop:** choose a plot, place a small set of camp pieces, name it, save it, optionally invite someone to visit.
- Players may suggest additions to the world palette. Suggestions are reviewed before they become shared assets.
- Camps are private by default. Using creations to learn about visitors is optional and consent-based.
- **First-playable camp kit:** a proposal in the Sep 22 stock list. The piece names are not in the chat logs or repo.
- Status of the Oct 1 beta: scope "end-to-end checks and front-door launch setup unfinished" (Sep 24). No later confirmation in the chat logs.

### 4.10 Room Items Blueprint and the GameItem entity

File: `docs\blueprints\geode_inn_room_items_blueprint.md` (founded Sep 21). Purpose: rooms that are already reconciled (character woven, spot secured, items known, image status known) before the builders place them.

Headline finding (Sep 21 census): the `GameItem` entity holds **355 items** across every zone, and **zero** for Clockwork Skies and the Main Floor. The blueprint fills those two layers first.

Template (entity `GameItem`; fields from the loader function `loadZoneItems.ts`):

| Field | What goes here | Example (Ship's Bell, from the Arcana blueprint) |
|---|---|---|
| `name` | Item name | Ship's Bell |
| `description` | What it is | Brass bell at the Helm, 95 Hz |
| `itemType` | Type (values not listed in the chat logs) | not given |
| `materials` | List of Material names | not given |
| `zone` | Zone or room | Clockwork Skies, The Arcana, The Helm |
| `interactiveProperties` | What the player can do with it | not given |
| `basedOn` | Real-world source, for honest labels | not given |
| `variants` | List of variants | not given |

Row format in the blueprint: Room, Character, Placement spot, Portrait status (LIVE, OWED, REVIEW), Signature items with GameItem status (NONE means the item must be created).

Current canon (Sep 21):

- Clockwork Skies, the Arcana: eight stations (Helm, Chart Room, Deck, Rigging, Hold, Tactic Room, Gate, Crow's Nest), 24 station items plus 2 common, 26 GameItems to create.
- Canopy City: eight locations, about 15 GameItems to create. Three new NPCs owed portraits: Clockwork Maker, Sky Market Vendor, Crow's Path Lookout.
- Main Floor: nine rooms. The Great Hall needs the Innkeeper's List quest board, the Wanderer's walking stick, chibi ravens, the climbing passage to Clockwork. The Music Room is entirely owed.
- About 66 items owed for these two layers.
- Great Hall parcel (slow-walk parcel 01, `docs\blueprints\slow_walk_parcel_01_great_hall.md`, commit `7b1a4ed`): draft; seven gaps still owed (Sep 26). Not yet ruled LIVE.
- Rule: the client rules in "ruling sessions"; Elio wires the blueprint JSON; the builders build.
- Earlier (Aug 29, commit log): 224 zone quest area items were loaded to the database, 27 zones with 8 items each (Built, commit, Aug 29). The Sep 21 census found 355 `GameItem` records. The records don't say whether the 224 are part of the 355. Also Aug 28: 13 key item images (Aug 24 portfolio).

### 4.11 Where crafting lives

- GitHub: the specs named above; `docs\library\data\recipes.json` and siblings; `docs\library\functions\loadZoneItems.ts`; `docs\gallery\geode_inn_supply_icons_manifest.md`; `docs\blueprints\`.
- Base44: entities `Material`, `BuildingRecipe`, `GameItem`, `TrayTemplate`, `ElementCharm`, `QuestCharm`. Several of these were written in Elio's staging app. Cross-app writes to the live app were blocked, so the live copy may lag.
- Drive: not stated.

### 4.12 Open and to reconcile

- **31 materials and 8 blueprints (playable) versus 119 and 148 (library) versus 104 and 148 (Sep 10 notes).** Three different counts for the Material entity. The Sep 22 stock list that would settle it is not in the repo.
- First-playable camp kit: names not written down.
- Water collecting (Sep 2) versus Woodcutting (Sep 19) as the third gathering profession. Later ruling wins; the older spec text may still say otherwise.
- `GameItem` field `itemType` values are unlisted.
- Whether the Sep 21 `GameItem` count (355) is the live or the staging entity.
- Science Sidekick Law (Sep 14) is mentioned for crafting NPCs but has no craft template.
- Hidden Materials expansion, Pigment Quest, Forge-to-Fab ladder: parked (Sep 12).
- **Early recipe and material counts (commit log, Aug 30 to 31).** 65 materials and 20 recipes (Aug 30); 86 historical recipes plus 7 new materials; 15 cave materials plus 42 cave recipes; recipes expanded from 30 to 53 (Aug 30); 76 supply icons (Aug 31). The Sep 10 notes say 104 Material records and 148 recipes. The early counts are earlier stages of the same library, but the commit log does not say how 65 plus 7 plus 15 becomes 104. Open.
- **Two building tier scales** (Aug 24): by building kind (Shelters, Castles, Sacred, Mausoleums, Cave City) and by alchemical stage. See 4.4. Not merged by any ruling.
- **Composer plan** (Aug 29 versus Aug 30): a standalone SaaS product with its own player app, or a feature of the Geode Inn site. The Aug 30 commit says no separate domain is needed. Which one is current is not stated.
- **Trovant questions** (Before the Song, unchecked): a zone guide NPC, the zone frequency, the Embedded Artist, the trovant charm, the quest name, whether trovant companions carry rain in other zones, and whether the trovant heartbeat is 50 BPM. Open (August canon).
- **Coast Hub numbers** (August canon): letter prices and hook list, the Merfolk story-for-item table, the clack-language recipes and progression, and candle prices are not specified. Open.

### 4.13 Early crafting and building canon (Aug 21 to 30)

Rules from the founding period. Where the Sep 10 and later specs say something different, the later spec wins.

**Building kinds under the Aug 24 tiers (August canon, Before the Song).**

| Tier | Kind | Examples |
|---|---|---|
| 1 Shelters (horizontal, personal) | Shelter | pit house, log cabin, wattle and daub, wigwam, yurt, cliff dwelling, stilt house, each matched to a biome |
| 2 Castles (community) | Castle | mead hall, broch, kremlin, hill fort |
| 3 Sacred buildings (upward) | Sacred | Gothic cathedral, rock-hewn church, stave church, Byzantine dome. The player tunes to frequencies. A cathedral tuned to 42 Hz becomes the Inn's voice |
| 4 Mausoleums (downward) | Mausoleum | mastaba, catacomb, Gothic crypt, kurgan, ship burial, chullpa, barrow. "The bench is the most important part. The dead sit." |
| 5 The Cave City (synthesis) | Cave City | Crimean Gothic cave cities. Gothic is the Inn's root language. The builder's endgame |

**Subtractive and additive building (Aug 24, commit).** Additive buildings are gathered and stacked. Subtractive buildings are carved and revealed. Five principles: the architecture is the geology; the entrance is a geological feature; the interior is negative space; light enters through subtraction; sound is the rock's resonance. Built (commit, Aug 24).

**Pit houses (early chat, Aug 22 or later).** In the Redwood Cathedral, pit houses are built only from what the forest has shed. Nothing is cut, broken or harmed. They persist across reincarnation, and the zone accumulates the player's ruins. This is a zone rule, not a general building rule.

**Recipes by culture (Aug 30, commit log).** The expansion from 30 to 53 recipes added: Norse (Stave Church Framework at tier 4 in Bog Oak, Longhouse Hearth, Turf Wall); Egyptian (Mudbrick Mastaba, Limestone Column Drum, Papyrus Reed Pavilion); Chinese (Pagoda Tier, Dougong Bracket Set at tier 4, Rammed Earth Wall); Celtic (Roundhouse Wattle Wall, Broch Stone Tower at tier 4); Peruvian (Ashlar Terrace Wall, Adobe Compound Wall); Mesopotamian (Ziggurat Core Platform at tier 4, Cuneiform Archive Shelf); underground (Cave Dwell Entry Hall, Luminwood Grove Archway at tier 4, Fae); Fae Kingdom (Crystal-Cut Geode Doorway at tier 5, Seelie Gazebo, Unseelie Ice Spire); market (Artisan Display Table, Knotwork Window Screen, Resonance Chamber Alcove). Built (commit, Aug 30). The Historical Architecture work (86 recipes, a disassembly method) and the Village and Community Building System (Sim-style) were committed the same day.

**Water as a material (August canon, Before the Song).** Water is one of the seven base materials of the building system. Each of the seven water layers has a crafting use: rain water for trovant work, surface water for general crafting, tidal water for resonance stones, river water for funerary rites, deep water for rare minerals, Atlantis water for crystal work, core water for the Philosopher's Stone stage. Note: the Sep 10 spec lists Wood, Stone, Clay, Sand, Ore, Hemp and Thatch as the seven. Water is not on that list. Reconcile (see below).

**Roman concrete (August canon).** Opus caementicium is crafted from lime (limestone), volcanic ash (found in specific geological zones) and water. It is needed for permanent waterproof channels in the aqueduct system. Without it channels erode. This gives a reason to master the crafting tree.

**The Five Smiths (August canon).** Forges in the staircase wall: Iron ("Forge", raw transformation), Bronze ("Alloy", combination), Silver ("Current", electrical), Gold ("Endure", permanence), Copper ("Verdigris", patina). Each offers a crafting path that refines, combines or alters the player's stones. Wrought, an invisible Celtic mason, keeps the Inn standing.

**Crafting classes (August canon).** The Artisan Thief has Nimble Fingers (jewelry others cannot make). Muspelheim offers fire and alchemy crafting. Nidavellir offers dwarf-forged masterwork items. Cross-cultural crafting combines components from several zones (Aug 2026 progression design).

**Trovants (August canon, Before the Song).** Files: `docs\geode_inn_trovants.md`, `docs\geode_inn_trovant_kossoff.md`, `docs\zone_specs\geode_inn_trovant_garden_quest_chain.md`.
- Naming a trovant wakes it up. Unnamed trovants sit and grow. Named ones follow the player. Rings equal memory: a named trovant carries its geological history as visible identity.
- Real facts used: Costesti, Wallachia, Romania; sandstone concretions with a hard core and a cemented-sand shell; growth about 4 to 5 cm per 1,000 years; up to 6 million years old; Trovants Museum Natural Reserve in Valcea County, protected by UNESCO since 2004.
- Three folklore layers are kept as frequency perceptions of one phenomenon: alien eggs (geological eggs dreamed by sleeping giants), elementals (consciousness that is stone), walking stones (they redistribute mass).
- Transformation game: the player guides water over the surface with music. Low notes make wide, slow, heavy deposits. High notes make tight, delicate, fragile filigree. A steady rhythm makes clean sacred geometry; an erratic one makes noise. Too low gives a boulder with stubs, too high gives glass-thin wings.
- Chrysalis phase: between the last rain and the first wing the trovant is sealed in its shell and the player cannot play music. It is "the deepest silence the Inn produces outside the Observatory void".
- Wings are mineral (like stained glass) and act as tuning forks. 42 Hz passes through and the stone lifts (resonating, not flying).
- Stages follow the alchemical set: Nigredo (raw iron-dark sphere in rain), Albedo (white mineral curves), Citrinitas (wing shapes, yellow-gold calcium carbonate), Rubedo (wings complete, the stone lifts), Philosopher's Stone (a stone butterfly that can move between zones). Children start at Nigredo and the player guides one transformation at a time.
- Flower of Life is a hidden game: overlapping ripples form the pattern if frequency and rhythm are balanced. The pattern stays in the earth when the water dries and is visible from above (the Astronomer sees fields of them). Completing the Flower of Life and making beautiful wings together is the Philosopher's Stone stage ("the geometry overrides the sculpting").
- Rain on a trovant gives multiplication, propagation not corruption ("the Gizmo rule").
- Grit is optional, "the Inn's version of a difficulty modifier". With Grit on the trovant the wings are more organic and the Flower of Life forms more readily, but Grit moves and the player must follow. Without Grit: more control, more mechanical shapes, harder Flower of Life, wings that "work but don't sing".

**Coast Hub town (August canon, Before the Song).**
- Crustacean Elders at the Cannery are the crafting station. The elders clack in patterns, and the player learns the clack-language as a skill, like a recipe. With enough patterns the elders craft armor from crab shells, tools from whale bone and jewelry from the copper that veins the granite. "The forge runs on clacking instead of fire."
- Dock Merchants (Merfolk) use no currency. They trade in stories. A better story returns a better item. See 6.9.
- Shape-Shifter Baker sells bread that restores health and gives water-breathing (the ocean taste is the buff). Shape-Shifter Postmistress sells letters: lore, quest hooks and map fragments. See 6.9.
- Other crafted goods: candles for memory (Candlemaker), tea from herbs grown in 42 Hz glow.

**Tidal deposits and quest items (August canon).** Resonance stones (natural tuning forks shaped by the Singing Caves; the Examiner logs them, for example "111Hz. Sandstone. Water-worn. Approximately 3,200 years old. Adequate."), fossils, mineral anomalies from the Crystal Core, and bone fragments (small, ancient, Cretaceous marine reptile). Quest items: Newton's tide chart, the Examiner's Tidal Log, the Cartographer's Living Tidal Map.

**The Grey Note and the Bone Note (August canon).** Rewards from the In-Between. The Grey Note is a frequency added to the geode cave; it harmonizes with every frequency and makes all existing notes clearer ("silence that makes the music audible"). The Bone Note is personal: it resonates with the frequency of whatever the player has lost. "Loss is not erasure."

**Cave materials and underground recipes (Aug 30, commit log).** 15 underground materials plus 42 cave recipes. Built (commit, Aug 30).

**Supply icons (Aug 31, commit log).** 76 crafting supply icons. Manifest: `docs\gallery\geode_inn_supply_icons_manifest.md` (see 4.1).

**Water versus the seven base materials.** To reconcile: Before the Song counts water as one of seven base materials, and the Sep 10 spec lists seven without water. Not settled.

---

## 5. Food and drink

### 5.1 The drink mechanic

Ruled design; first written Aug and consolidated Sep 2. Files: `docs\geode_inn_drink_mechanic_expanded.md` (611 lines, with the full catalog), `docs\zone_specs\geode_inn_drink_mechanic_master_spec.md`, `docs\geode_inn_drink_storylines.md`.

- Drinks are **liquid acoustic catalysts**, not food buffs. They are tuned to layers of the 42 Hz Song.
- **Three effects at once:** a primary resonance buff, a perception layer shift (reveals Dream Layer, Water Connections, Hidden Cosmology, Whisper Layer audio, Rune Traces, Shadow Deceleration), and a Pulse Line change.
- **First Drink Ritual:** the first time a player drinks a new drink, a 4 to 6 second first-person animation plays. The drink then unlocks in the **Drink Journal** (tasting notes, NPC quotes, sommelier tracking).
- **Social system:** the more a player drinks with an NPC, the more they drop their defenses. Three tiers: first drink (surface), second (personal), third (vulnerable), plus a shared flask (confidant). The Bard never gets past stage one. Free tier is branching dialogue; premium tier is real-time AI conversation.
- **Nook Effect:** drinking in a Nook gives the quietest, deepest contemplative state.
- **Home:** Thorin's Meadery (a mead hall in an overturned longship; Thorin brews, Marijke keeps the registry). Every zone has a beverage stall.
- Sep 3 (ruled): write full "stories for drinks", three-tier conversations. First five done (306 lines), 27 to go (client said "Please").

### 5.2 Template: Drink

Fields follow the entries in the catalog and the Sep 3 chat.

| Field | What goes here | Example |
|---|---|---|
| Number | Catalog number | 01 |
| Name | Drink name | Thorin's Hearthside Mead |
| Zone / Origin | Where it is served | Norse Meadery |
| Creator / Provider | The NPC who pours | Thorin and Marijke |
| Visual and preparation ritual | What the First Drink Ritual shows | Poured from a soot-stained oak cask into an ox horn lined with beeswax; toasted clover pollen on top |
| Flavor profile | Taste | Clover honey, smoked oak bark, dried apples |
| Story hook | Why it matters | Thorin's signature batch, offered to travelers carrying stone fragments |
| Mechanical effect | Buff, perception shift, Pulse Line, duration | Locks Pulse Line to 42 Hz for 180 seconds; 5-meter golden aura |
| Storyline | Three-tier conversation, in the repo | "The Longship That Forgot to Sink" |
| Provider status | Renames applied | Lichenblossom and Fibonacci (from Aughra) renamed |

### 5.3 Current canon: the catalog (33 drinks)

The catalog header says 32. A 33rd, Mensinthe, was added Sep 11. Drinks by number:

01 Thorin's Hearthside Mead; 02 Persephone's Pomegranate Wine; 03 Lotus Tea of the Ancients; 04 Soma of the High Peaks; 05 Clockwork Green Tea; 06 Hades' Catacomb Vintage; 07 Slavic Aurora Mead; 08 Mistletoe and Oak Draught; 09 Chicha de Jora of the Sun; 10 Mediterranean Olive-Leaf; 11 Appalachian Moonshine Mead; 12 Colorado Red-Rock Elixir; 13 Mercury-Mirror Spirit; 14 Deep Bioluminescent Tonic; 15 **Bone-Dust Absinthe**; 16 Fae Nectar of Summerland; 17 Black-Star Coffee Brew; 18 Brownie's Spiced Cider; 19 The Bard's Spilled Pitcher; 20 Fibonacci's Root Decoction; 21 Naut's Elder Bitters; 22 Einstein's Relativity Stout; 23 Morrigan's Raven Tonic; 24 Gorgon's Stone-Bloom Mead; 25 Vanir Honey-Dew; 26 Clockmaker's Gear Cordial; 27 Aurallia's Four-Harmonic Punch; 28 Lichenblossom's Spore-Infused Ale; 29 Joe's Miniaturist Wine; 30 Norns' Thread-Dye Spirits; 31 Canopy Pine-Needle Tea; 32 The 42Hz Resonant Vintage; 33 **Mensinthe**.

Highlights:

- **Bone-Dust Absinthe (#15):** Bone Room and Catacombs, Ossuary Keeper. Wormwood, anise, fennel; sugar cube and perforated silver spoon. Grants speech with skeletal remains.
- **Mensinthe (#33, Sep 11):** Main Floor bar. A "liquid acoustic catalyst" that, once per glass, shows the load-bearing flaw in an elaborate cage of reasoning. Served with a sugar cube on a slotted spoon; taking it is optional. **Sugar-Steal Law:** if the cube is left too long, a raven or a platypus takes it. There is no timer; the theft is the timer. Ryan's line: "Theft's a choice too. The house calls it sweetening the thief." Hook: "It means table. You can't argue with it. You can only sit at it." The repo catalog lists Ryan as provider.
- **Two-tier note:** zone stalls are listed in the master spec (Norse mead, Greek herb wine, Egyptian date palm wine and barley beer, Celtic heather ale, Slavic birch sap wine, Indian spiced milk, Chinese rice wine and jasmine tea, Peruvian chicha de jora and coca tea).
- **Citrus pour** (proposed Sep 12): an original dew-drop citrus fizz at the Main Floor bar, no trademark use. Name is the client's to rule.
- **Impossible Garden bar** (the Catalyst, Main Floor): story-for-drink economy; the story's seed goes to the greenhouse. **Meadery bar** (Ryan): tempo activator, taps on the bar top. **Resolved Cadence law** (ruled Oct 9): bar talk ends on a resolved cadence, with no "we miss you" nudge.

### 5.4 Venues

Files: `docs\zone_specs\geode_inn_venue_row_master_spec.md` (filed Oct 14). Rules ruled by the client Oct 14.

**Staffing law (ruled Oct 14):** restaurant staff are the rotating storyline characters of that level. No new dedicated rosters. The rotation runs on the trading-card system: a staffing shift is a card draw from the level's deck.

**Brim Horton's (ruled Oct 14):** a Tim Horton's style brand owned by Brim. It has **no address** and is not a venue seat. It is the label for all drinks and baked to-go food anywhere in the Inn. Logo canon: the witch (Brim's true form) on the main sign; a black cat on coffee cups; a grey cat on pastry cases; each new menu item earns a new Brim form. Brimbits are the packaged snack.

**Duckee's (ruled Oct 14):** a Buc-ee's style franchise gag, a liminal 4 a.m. gas station. The mascot is a platypus that corporate insists is a beaver.

**The Razor Row.** Names come from the Razor Cabinet and each carries its citation (honest-label law):

| Venue | Level / place | The law on the door |
|---|---|---|
| Hanlon's | Level 2, Clockwork Skies, sky ship tea room | Never attribute to malice what a gear explains |
| Occam's | Level 6, Catacombs, bone broth kitchen | Bones, water, time; one pot that never goes cold |
| Sagan's | Level 7, Fae Kingdom, Unseelie feast hall | Extraordinary claims need extraordinary evidence |
| Grice's | Level 7, Fae Kingdom, Seelie hall | Truthful, generous in reading, say what you mean |
| Chesterton's | Level 5, Standing Grove cookhouse | No recipe retired until the house remembers why it was kept |

Other seated venues: The Impossible Garden (Level 3), the Huntsman Tavern (Level 4), the Mead Hall, the Mars diner (Level 1, Cosmic Layer, poutine), the Ontario Old Lakes restaurant (Standing Grove, poutine, whitefish, with Mnjikaning stewardship credited), and Joe's Diner (Level 9, hybrid zone). The Bitter Grounds cafe in the French Quarter is outside the Inn proper.

Citations on the razors, as the spec gives them: Occam (William of Ockham, about 1287 to 1347; the Latin phrasing is John Punch, 1639), Hanlon (coined 1980), Sagan (Cosmos, 1980), Grice (1975), Chesterton's fence (The Thing, 1929).

### 5.5 Template: Venue

| Field | What goes here | Example |
|---|---|---|
| Name | Venue name | Occam's |
| Level / place | Where | Level 6, Catacombs |
| Kind | Seated venue, franchise, or brand | Seated venue |
| Door law | The one-line rule | Bones, water, time |
| Menu logic | What the menu is built on | Single pot, necessity only |
| Staff | Rotating characters of that level | Judge Tootenkowl ladling broth (example) |
| Citation | Honest-label source and date | William of Ockham, c. 1287 to 1347 |

### 5.6 Open and to reconcile

- Drink count: header says 32, table lists 33.
- Drink storylines: the repo file holds six (Thorin's Mead, Bone-Dust Absinthe, Lichenblossom's Ale, The Bard's Spilled Pitcher, Fibonacci's Decoction, Mensinthe). The Sep 3 chat counted five written, so the sixth was added later. 27 remain.
- Spec checklist items still unchecked in the master spec: individual recipes per zone, camaraderie thresholds (the storyline file uses rounds 1 to 2, 3 to 5, 6 to 9), Drink Journal screen, First Drink Ritual animations, NPC drinking schedules.
- Thorin's Meadery and the drink system were not on the live site as of Sep 3.
- Venue count wobbled on Oct 14 ("every seat full"); whether Bitter Grounds counts is open. Level 5 for Chesterton's follows the repo; the Oct 15 chat says "Staircase / Standing Grove".
- Venue crews and cooks for Mars and Ontario are owed naming sessions. Menu depth for all venues is a stub.
- Razor Cabinet shelf for the Archive (Hitchens, Alder, Popper): unruled.
- The Canuck (a tourist character, ruled Oct 14) is tied to poutine venues only in Elio's suggestion, not in a ruling.
- Early food buffs versus the Anti-Skinner line: see 5.7. Open.

### 5.7 Early drink and food canon (Aug 2026)

Everything here is August canon (Before the Song) or the early chat, with no recorded ruling unless marked. The drink system in 5.1 grew from it.

- **The Catalyst's bar is the first drink system.** Players earn unique, story-specific drinks by telling stories. The interface is hybrid: a dialogue tree (free) or AI natural-language conversation (premium). Stories are logged in a **Drink Journal**, "a biographical record, not a score". "Listening is the core mechanic, acceptance is the reward." This shifts the loop from transactional to narrative. (Master Storyline, and the Sep 3 premium-tier wording in 5.1 matches it.)
- **Two layers of trade.** Stones for goods, stories for secrets. Storytelling earns a drink and information. (Early chat, Aug 22 or later.) See 6.9.
- **Quest "The Story".** Told rarely, for a drink at the Catalyst's bar. Reward: the Seed, which hums the voices of ordinary things.
- **Quest "The Seed" and the Catalyst's Recipe.** The recipe is a drink that lets the player hear humble objects speak (cooking pot, headrest, sandal, oil lamp).
- **Cthulhu's drink.** The Catalyst made him exactly one drink, ever: dark, warm, tasting of the ocean floor, after a quest to the deepest level of the catacombs. It is not on the menu and appears only for him at the bar. (August canon, Aug 22.)
- **Offerings to the Brownies.** The Catalyst leaves a saucer of cream, a small bread roll and one honeycake every night. By morning the food is gone and the floor is clean. This is food as part of a contract, not a menu item. (August canon, Aug 22.)
- **Food buff idea (Elio proposal, no reply).** Zone foods give small temporary buffs (for example sushi: +3 INT, +5 swimming). The core canon has no stat race, so this has not been adopted. Proposed. See "To reconcile".
- **Bread and tea.** Coast Hub bread gives health and water-breathing. Tea is made from herbs grown in 42 Hz glow. The Baker's bread tastes like the ocean (salt, kelp, mineral undertone). The postmistress keeps mail for people who left. (August canon.)
- **Drink Mechanic in the progression list.** The Drink Mechanic is named with the Death Sequence, Living Books, the Remembrance Vision and the Marketplace among the systems in the Master Storyline. The Garden's Gift (a buff from resting in the Bedroom) is the other early "consumable" effect: the next collected stone resonates higher. August canon.
- **Sully's bar and the voodoo shop** were cited in the early chat as inspiration for the bar mechanic (real-world references).
- Original sources: `docs\geode_inn_drink_mechanic_expanded.md` (see 5.1) and the zone stalls in the master spec.

**To reconcile (early drinks).** The Elio food buff idea (small stat buffs) against the rule that the Inn has no scoreboards or stat race. The core drink canon says buffs are perception shifts and Pulse Line changes, not stats.

---

## 6. The market, shop and products

### 6.1 What the market is

The Inn has more than one economy. Keep them separate.

- **Main Floor Market (Artisan Market).** Sells to the real world. Soulstice goods and artisan craft. Real prices, real links. File: `docs\geode_inn_artisan_market.md`.
- **Treetop Marketplace (Canopy City).** Nothing costs money. Everything costs frequency: stones, songs, favors, seeds, time. Native game: Canopy City Trading. Runs on a 50 BPM trade rhythm. File: `docs\zone_specs\geode_inn_treetop_marketplace_master_spec.md`.
- **Inn Post.** Mail. A letter costs a short puzzle, not money (Puzzle Stamp, ruled Sep 11).
- **Arcade store.** Each game is a MarketItem, sold alone on the shop and on Steam (ruled Aug 31).

Laws:

- **Gallery Law (ruled Oct 13):** shop products appear in the game as beautiful props, with no pitch. "Never make the pitch, let the frame do the selling."
- **Visibility toggle (ruled Sep 1):** the Soulstice shop can be hidden silently, in every version of the game. No "closed" sign. Data, lore and images are kept. Fields to add on the `Artisan` record: `isShopVisible`, `hiddenDate`, `hiddenReason` (the last two private). One button on the `/manage` page. The function was deployed only in Elio's app. The live schema change was waiting on the builders.
- **Hatchery creations and fan merch** can enter the marketplace, curated and labeled honestly (Sep 18).
- **Modern Day Gallery** (ruled Sep 18): a living gallery of contributing artists; the Inn hosts and never collects; work stays the contributor's. Added as a late "garnish" layer.

### 6.2 Template: Market Item

Entity `MarketItem`. Field list from the artisan market spec; the arcade subset is the builder message of Aug 31.

| Field | What goes here | Example (arcade game: Andean Run) |
|---|---|---|
| `name` | Display name | Andean Run |
| `category` | Stone, Jewelry, Tool, Charm, Book, Instrument, or Arcade Game | Arcade Game |
| `priceRange` | Price or price word | $2.99 |
| `zone` | Zone | Peru |
| `stoneType` | Primary stone, linking to the Stone entity | Blue Opal |
| `rarity` | Common, Uncommon, Rare, Legendary, Unique | Common |
| `isSoulsticeItem` | true for real Soulstice pieces; false for game items | false |
| `inStock` | Available now | true |
| `gameName`, `gameDescription` | In-game name and short description | "Temple Run x Peru. Run the cloud causeways of Machu Picchu." |
| `gameEffect` | What it does | Unlocks Blue Opal |
| `loreConnection` | Link to Inn lore | "Blue Opal forms in the volcanic Andean soil" |
| `developmentStatus` | concept, designed, produced, live | live |
| `realName`, `realDescription`, `realImage` | Real-world name, copy and photo (Soulstice items) | "Garnet, gold and spinel earrings" |
| `gameImage` | In-game art | not shown in the sample |
| `externalUrl` | Link to the real product (Soulstice items) | the shop link |
| `artisanName`, `artisanShopName`, `artisanShopUrl` | Maker and shop (real artisans) | not shown |
| `processUrl` | Link to the making process | not shown |

Soulstice product record example (from `docs\market\market_enrichment_manifest.json`): name "Garnet, gold and spinel earrings", `stoneType` "Garnet, Gold, Spinel", `loreConnection` "Garnet (Stone entity), Spinel (Stone entity). Connected to the Undercity and Klimt's Death and Life aesthetic.", `priceRange` "$90", `realImage` a hosted photo link.

### 6.3 Prices and counts

- Soulstice products: 39 to 40 records. The enrichment manifest sets `priceRange` from $40 to $510 and holds 8 product photos. Live records had no prices at the start of Sep 1. More photos are needed (31 or 22, depending on the day).
- Arcade games: 61 MarketItems in the Aug 31 manifest, 101 on the live app by Sep 1 (61 games plus 40 Soulstice products). Later rosters run to 83 to 88 games, but the chat logs do not say all became MarketItems. The Hook and The Mohs Vibration still needed MarketItems on live (Sep 1).
- Price tiers for the 61 games, set by Elio Aug 31 (Proposed; staged, not client-ruled): $2.99 (10 games), $3.99 (26), $4.99 (15), $6.99 (The World Walker), $9.99 (3 Major Zones), $12.99 (3 Legendary), free (3: Spiral Gallery, Frog Transformation, Whisper Layer). Bundles: Arcade Pass $29.99 for the 52 core games, Legendary Bundle $24.99. An earlier scheme (52 SKUs at $1.99 to $9.99; Arcade Pass $14.99; Complete Inn $49.99) was replaced without being discussed with the client.
- The repo manifest `market_items_all_61_games.json` shows Standing Stones at $2.99, while Sep 1 says $3.99. See 6.8.

### 6.4 Soulstice and the Artisan record

- Soulstice Jewelry is the first artisan: tier Kingdom, 20 display slots, zones Main Floor Market, Desert Bone and Atlantis.
- Artisan tiers follow Share Wood: The Clearing, The Village, The Kingdom.
- Market layout (artisan market spec): outer ring stone market by zone; middle ring craft market (Luna's booth, the Blacksmith, the Silversmith, the Bard, the Alchemist); inner ring the Soulstice Gallery; the Spiral Fountain at the center (42 Hz). The Soulstice Gallery lets the player examine a piece, hear its stones as a melody, read each stone's Mind and Body, and follow the link to buy the real one.
- Photography rule: transparent stones on light, opaque on dark (Sep 4).
- A hoped-for staff member is the proposed manager of the artist sales area (Sep 26). Not hired as far as the chat logs say.
- Idea only: a "From the Mini-Inn" chandelier line as MarketItems (Oct 2), and a vial as a possible wire-wrapped pendant (Oct 9).

### 6.5 The Endless Line (jewelry lineage)

Approved Sep 27 by the client ("If we can use stockpiled credits...").

- A new Soulstice lineage built on interlace (the Victorian name "Celtic knot" is labeled as such; the honest term is interlace).
- Flagship proof piece, number one: a single unbroken Insular thread folded around a labradorite cabochon.
- Plan: three specimens per culture stream. Every piece is a closed system, one line, never lifted. Every card carries an honest label (who drew it, who collected it, how old the thread is).
- Four research streams were launched: Insular and Pictish, Norse and Germanic, Silk Road, Mediterranean and West Asia. Findings were summarized (Roman, Coptic and Byzantine parent streams; the Buddhist endless knot as an independent cousin; Insular monks as the apex).
- Related collection ideas: Unpredictable Beauty pair (Venus's Hair series and Winter Landscape series); Tri-Canid Weave (commission seed #1); Keeping Medallion; Ammolite Trio; Dagger Collar.
- Status: dossiers and the flagship direction were not reported back in the chat logs. No Endless Line file exists in the repo. **Open.**

### 6.6 The legal and paperwork rule before listing

- **Standing decision (client, Sep 9):** all apps run and stay synced, but nothing is formally listed until its paperwork is done. Patent first, then trademark.
- **Sep 15 (ruled):** "Build like it's clear, list like it isn't." Nothing public until the legal pass. Book content stays readable in game only while the archive.org link is live.
- **Sovereignty rule (Sep 10):** a new game gets no MarketItem until the client approves it (The Thread example).
- **Paperwork matrix** (`docs\legal\geode_inn_paperwork_matrix.md`, Sep 9), by priority:
  1. Soulstice Melodies: provisional patent (drafted, never filed), payment terms, end-user license, trademark search.
  2. Geode Inn trademark; check "Resonance" for the card game.
  3. Share Wood: artist licensing for the 37-artist catalog, copyright registrations, takedown procedure, vendor subscription terms, content ownership, tax.
  4. Web beta: domain, Terms of Service, privacy policy (including the Common Room's no-data-retention promise), business name, age statement.
  5. Marketplace: artisan subscription agreement, terms separating in-game and real listings, sales tax for physical jewelry.
  6. Later products: Steam distribution, novel registration and ISBN, tabletop manufacturing, audiobook and podcast distribution.
- The paperwork does not block the quiet beta. It blocks formal listing.
- An attorney is advised before the patent and trademark filings. The employee who handles licensing and red tape has a briefing (`docs\legal\lacey_legal_briefing.md`).

### 6.7 Where the market lives

- GitHub: `docs\market_items_all_61_games.json`, `docs\market_items_retro_games.json`, `docs\market_items_import.json`, `docs\market\market_enrichment_manifest.json`, `docs\market\geode_inn_live_market_manifest.json`, `docs\market_sync_manifest.json`, `docs\library\data\market_items_all_61_games.json`, `docs\geode_inn_marketplace_design.md`, `docs\geode_inn_artisan_market.md`, `docs\zone_specs\geode_inn_treetop_marketplace_master_spec.md`, `docs\legal\`.
- Base44: `MarketItem` and `Artisan` entities, in both Elio's staging app and the live app. Sync path: manifest in GitHub, then builder message, then import by the builders. The live app was updated by Elio only through its service route on some days.
- Drive: product photos came from the shop owner's phone captures (named `picker_image_...`); they are placeholders until real photos arrive.

### 6.8 Open and to reconcile

- Price conflict: Standing Stones $3.99 (Sep 1) versus $2.99 (repo manifest). The tiers in 6.3 are Proposed only.
- MarketItem totals: 39 (Aug 31 live check), 101 (Sep 1 and Sep 3), and the repo manifest names 39 for the enrichment file. They count different slices.
- Live MarketItems still showed null prices, photos and links at Aug 31 and were enriched through a manifest. Final live state not confirmed.
- Photo needs: 8 photos present; 22 to 31 more still needed.
- Domain not yet connected (Sep 1 to 3).
- Endless Line: no spec file, no ruling on piece one.
- Bundles and the free-game list have no client ruling.
- Visibility toggle: live schema change waiting on the builders.
- Citrus pour name and Brimbits packaging copy are the client's to rule.

### 6.9 How the market began (Jul 22 to Aug 31)

**The entities (early chat, August; Ruled).** The client asked for stylized in-game inventory items for tangible goods, with a link to the external shop. Elio built `MarketItem` and `PlayerInventory`. The client approved. The commit log has four sample Soulstice items on Aug 22 (Built, commit, Aug 22).

**Fourth-wall rule (Ruled, early chat, August).** An in-game item is a real game object (collectible, with lore, function and rarity), not an ad. The external shop link is a "secret door": a button, "Visit the Artisan" or "Acquire in the World", opens the shop in a new tab. The player adds items to a personal "Inn Inventory". `PlayerInventory` has a notes field for why the player collected the item: a journal, not a shopping cart. Master Storyline adds the "Soulstice" marker for authenticity and inventory-as-journal (August canon).

**Three layers of the marketplace (Ruled, early chat, August).**
1. Available items: collect in the game, buy in real life.
2. Forthcoming items: the lore describes what does not exist yet. Status "Studying Technique".
3. Process links: an optional link to the artisan's channel ("Watch the Process"). This is the `processUrl` field.

Each "Add to Inn Inventory" on a forthcoming item is a witness count the artisan can see, so the count climbs before the piece is finished. When the item becomes real, set `inStock` to true and update the descriptions.

**The Soulstice flag.** `isSoulsticeItem` marks the owner's own items. Elio suggested a subtle golden border or a Soulstice mark on the inventory card. Multiple artisans can list, each styled to the Inn with their own shop link. Proposed (early chat).

**Other artisans (Ruled, early chat, August).** The client decided other artisans can show works in progress and current areas of study, with an optional output link to their channel. Elio added the fields. Built (commit, Aug 22): `developmentStatus` and `processUrl`.

**A change of mind: the malachite ring.** A sample ring, the Truth-Teller's Ring (malachite, reveals NPC deception in dialogue), was first proposed for deletion because the maker does not design rings. The client said the maker is studying lost wax casting and permanent jewelry, so the ring stayed as a forthcoming item (not in stock) and moved to the new status (Studying Technique). Ruled (early chat, August).

**Early sample items (early chat, August).**

| Item | Stone | What it does in play | Status |
|---|---|---|---|
| Aurora Pendant | Labradorite | Reveals hidden Fae Kingdom paths | Sample |
| Truth-Teller's Ring | Malachite | Reveals NPC deception in dialogue | Forthcoming |
| Cat's Eye of Bastet | Cat's eye chrysoberyl | Unlocks secret cats in the Egyptian zone | Sample |
| Bluestone Key | Preseli bluestone | Key to the Fae Kingdom portal | Sample |

**Open from the early chat.** Mapping the client's real catalog into game items (real product names, photos, shop links) was waiting on the client; Elio offered to batch-load them.

**Currency of crossing.** A stone from the player's collection is the obol (early chat, August). See 1.13.

**Canopy City trade (early chat, Aug 22 or later; August canon).** Trade has two layers: stones for goods and stories for secrets. The Silk Road is the forest's circulation system (the mycorrhizal paths). Cross-cultural crafting combines components from several zones. This is the earlier form of the Treetop Marketplace in 6.1. The vendor map is `docs\geode_inn_vendor_map.md`.

| Platform | Vendor | Sells |
|---|---|---|
| Celtic | Niamh | ogham staves, Fae-portal keys, knot-stones |
| Egyptian | Sefu | canopic jars, scarab amulets, patina-stones |
| Peruvian | Qhora | khipu strings, chakana pendants, organic-cut stones |
| Chinese | Li Wei | ink stones, signed jade, bamboo scrolls, I Ching coins |
| Slavic | Dushan | amber beads, nesting stones, birch-bark tea |
| Indian | Priya | yantra diagrams, rudraksha beads, spice-boxes |
| Norse | Erik | rune stones, Thor's-hammer, raven feathers, model ships |
| Mediterranean | Thalia | amphorae, olive oil, Miskatonic Annex items |
| Neutral (center) | The Keeper | does not sell; keeps the commons |

The early chat calls this "nine vendors"; the table has eight vendors plus the Keeper. Before the Song later adds a tenth platform, Mesopotamian.

**Coast Hub trade (August canon).** Dock Merchants (Merfolk) use no currency and trade in stories. The better the story, the better the item. The Postmistress sells letters (lore, quest hooks, map fragments). The Baker sells bread that restores health and gives water-breathing. Prices and tables are not specified.

**Earlier prices and products (commit log).**
- Aug 30: Complete Inn bundle at 99.99 with all 6 products. Built (commit, Aug 30).
- Aug 30: Share Wood. "No red tape, no approval, no transaction fees." Tiers 9, 49 and 99. Faires choose from the Inn's 37 curated styles and never upload their own, as copyright protection. A Faire Zone Rental System and Sherwood Forest Faire (a dormant pre-built zone for two faire partners) were written the same day. Built (commit, Aug 30). Files: `docs\library\specs\share_wood_onboarding_spec.md`, `docs\library\specs\share_wood_zone_builder_spec.md`, `library\mechanics\share_wood_product_spec.md`. The Share Wood onboarding flow (3 tiers, 7 steps, Stripe billing) followed Aug 31 as a spec only.
- Aug 24: Tumble Run is sold separately (.99), with DLC worlds. DLC pack specs (1,045 words) Aug 31. Built (commit, Aug 24 and 31).
- Aug 30: Bead Composer as a site feature, and the Aug 29 standalone SaaS plan with four tiers (see 4.8).
- Aug 31: product photo URLs and price updates were committed; 106 images uploaded with Base44 URLs.

**Real objects and royal regalia.** The regalia research (crown, scepter) is in `docs\geode_inn_royal_regalia_research.md` (Ruled, early chat, August). Marketplace design: `docs\geode_inn_marketplace_design.md`.

**Marketplace in the canon documents (August canon).** Before the Song restates the system: real-world artisan items as collectable in-game artifacts, "Soulstice" as the authenticity marker, "Forthcoming" status and "Process" links showing the artisan's skill-building journey. Soulstice Jewelry is the first artisan. A Drink Journal and a Book entity (4,000 or more volumes, archive.org links) sit beside it.

**Main Floor.** The early chat has an Artisan Market with a "jewelry display" (silver jewelry catching lantern light) on the Main Floor. The Thief class "can't sell" (Elio's note).

**Open (early period).**
- The Complete Inn price: 99.99 (Aug 30 commit) versus 49.99 (the earlier scheme recorded in 6.3). Reconcile.
- Whether the Aug 24 Tumble Run price (.99) and DLC are still the plan.
- The Postmistress letter prices, the Merfolk story table, and the Candlemaker prices.

---

## 7. Consolidated list: to reconcile

1. Stone counts: 164, 165, 166, 198, 200, 201 (section 1.2). Confirm the live count by name.
2. Moldavite home: Staircase in the map, Cosmology Perch since Sep 13.
3. Stone charm total (164) versus 200 stones.
4. Element charm count: 118 versus a 119th hypothetical, and 117 tattoos.
5. Hatchery vote labels: STAY / LEAVE / HIDE versus Nurture / Release / Hide.
6. Materials and blueprints: 31/8, 104/148, 119/148.
7. Third gathering profession: water collecting (Sep 2) versus woodcutting (Sep 19). Use woodcutting.
8. Drink catalog count: 32 versus 33; storylines 6 of 33 written.
9. Standing Stones price: $3.99 versus $2.99.
10. Venue count and Bitter Grounds.
11. Chesterton's level: 5 (repo) versus "Staircase / Standing Grove" (notes).

Added from the early period (Jul 12 to Aug 30):

12. Early stone counts: 168 extracted, 164 loaded, 117 complete, 160 in the vibration index, 298 chimes (1.12). The 298 is unexplained.
13. Charm types: six (Aug 24) versus four (later). Sigil count 40+ versus 45 QuestCharm records (2.6).
14. Bracelet metal: iron Alchemist's Chain climbing through copper, silver and gold (Aug 24) versus copper chain (later spec) (2.7).
15. Building tiers: by kind (Aug 24) versus by alchemical stage (4.4).
16. Seven base materials: water is counted among them in Before the Song, but not in the Sep 10 spec (4.13).
17. Material and recipe counts: 65/20, 86 plus 7, 15/42, 30 to 53 (commit log) versus 104/148 and 31/8 (4.12).
18. `GameItem` count: 224 loaded Aug 29 versus 355 on Sep 21 (4.10).
19. Bead Composer: standalone SaaS (Aug 29) versus a feature of the Geode Inn site (Aug 30) (4.8).
20. Complete Inn bundle: 99.99 (Aug 30) versus 49.99 (earlier scheme) (6.9).
21. Early food buffs versus the no-stat-race line (5.7).
22. Dreamstone versus peridot as the Peruvian reward (1.12).

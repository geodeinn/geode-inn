# Part 3: Characters, NPCs, Voices and Critters

This part covers everyone who lives in the Inn: the named cast, how they are named and renamed, how a character file is written, how they sound, the laws that govern them, the playable classes, and the critters.

Status marks used throughout: **Ruled** (the client decided or agreed, date given), **Proposed** (Elio suggested, no ruling), **Open** (waiting on the client), **Seed** (a character exists as a short seed file with open gates).

Cross-references. Voice-actor-free audio specs (tempos, the Song, instruments, the Spoken Road) belong to the audio part. Card versions of characters (Royo tarot layout, Resonance cards, September Wave) belong to the cards part. Zone build sheets belong to the zones part. This part points to them and does not repeat them.

A note on real people. Several characters are rooted in people the client knows. This manual lists only the in-game name and role. The repo's Character Source Map carries a "keeper's eyes only" layer; do not copy it into builder documents.

Sources for the early period (July 12 to August 30) are called "the early chat" (the chat up to about August 23), "Before the Song" (the compiled canon document of late August) and "the commit log" (GitHub commit messages, August 21 to 31). Status words for early items: **Ruled** (the client decided or agreed, date given), **Proposed** (Elio suggested, no ruling), **Open**, **August canon** (written into Before the Song with no recorded ruling), **Ruled (commit, date)** when a commit message says the client ruled, and **Built (commit, date)** otherwise. The chat for August 22 to 30 is missing, so rulings in that window show only as commit messages. Casting references (which person or film an early profile leaned on) were set for most of the early cast. They follow the same rule as in 1.1 (cadence and posture, never the face) and are kept in the repo profiles. They are not repeated in the early-period additions below.

## Where it started (July 12 to August 30)

- **Jul 22, first catalog.** The first character catalog held 13 characters and grew to 28 (with the Odin pair and the scholar who is now Naut). With 32 water monsters the total was 60 designs. Six were Full Presence: the Seelie Fae, the Unseelie Fae, the Morrigan, the Owl, the Wanderer and the Allfather. Fae Kingdom NPCs and the arcade cast were chibi.
- **Jul 22, first rulings.** Ruled: Anansi is a chibi. The dwarf blacksmith is redesigned to look like a Thorin-style dwarf. Odin is shown in two forms (the Wanderer on the main floor, the Allfather upstairs). The Owl of the narrative is a barn owl. Six gargoyles are resonant architecture, each humming at its own frequency. The baby dragon logo is redesigned as heraldic and cat-like (status then: not yet final as mascot).
- **Aug 20, two pillars.** Proposed by Elio, no objection: every zone gets a named companion creature that travels with the player for a stretch. Ruled (late evening): some NPCs are based on real people and pets, from photos the client would send. The photos had not arrived by the end of that part of the chat.
- **Aug 21, the classes.** Ruled: the six starting classes are five from the client's tabletop character sheets plus a sixth, the Sentinel, who is Full Presence and "not tall" (compact build, low center of gravity, a presence aura). The Council of Thinkers was approved the same evening.
- **Aug 21, three new characters.** The Architect of Stairs (a Fae built from the client's request), the Cabbit (cat and rabbit that can become a pirate's ship, with the pirate never shown) and the Keeper (the Inn's oldest resident, which the client then made an archetype with one Keeper per culture, 21 mapped).
- **Aug 21 to 22, the main-floor cast.** The Host, the Catalyst, the Crone (now Ragana) and the Bard were written with the Sacred Trio frame (Host holds the space, Catalyst moves through it, Crone measures it, Bard is the fourth presence). Cthulhu (now Naut), the Brownies, Grit, Charles, the Seelie and Unseelie Kings and the Story-Born Ents followed in the Aug 22 character development session.
- **Aug 22, voice and size of the cast.** The voice profile system (two layers, cadence and tone) was built with an extractor tool and a Godot profile file, 20 profiles at first. The Character Compendium (11 parts, about 490 lines) and the Master Storyline counted "85+ documented characters".
- **Aug 24, first rename batch.** A copyright rename batch (Madame Mim, Radagast, Beorn, Jareth, Uhtred, Aughra, Archimedes, Wednesday, Ryuk Form) changed names across docs, then was only partly carried through. The same day the five default playable classes were fixed in the commit log, with Charles as the NPC exception. The commit log shows the later name list in use by Aug 30.
- **Aug 25, a reversal.** The Persephone and Hades design built on a memory-loss loop was removed as an unintended grooming echo. Persephone became the regal Tide Queen and Hades a harbor (Built, commit, Aug 25).
- **Aug 28 to 30, naming settles.** The cabbit was named Eres (commit, Aug 28) and Vaulknut confirmed (commit, Aug 28). The Fish-creature name settled as Murloc (Aug 29). The Seelie King was named Oleander (Aug 30). A beta audit made all 29 NPC names IP-safe and removed actor names from voice profiles (Built, commit, Aug 30). Hook words were cataloged for 29 NPCs (Aug 30).
- **Aug 30, a real person leaves the NPC list.** Ruled (commit, Aug 30): a real person who plays in the world is a player slot, not an NPC. The NPC references were replaced with Quire, the scholar, and Lozen was confirmed as the in-game name of the Sentinel.
- **Aug 31, the bridge to the later chat.** The master character and creature roster v2.0 (300+ entries with shadow echoes) and 18 NPC dialogue trees (21 NPCs, 1,353 lines) were committed. The Aug 31 to Oct 15 chat, which the rest of this part is built from, starts here.

---

## 1. The roster

### 1.1 What the roster is

The roster is the master list of every named character in the Inn, with portraits in up to three frequency states (Living 42Hz, Shadow 84Hz, In-Between). It is kept in several places that grew at different times, which is why the counts differ (see 1.2 and the "To reconcile" list at the end).

Standing rules for roster entries:

- **Names only, no pronouns** in portrait and builder messages (ruled Sep 1).
- **Original faces.** Casting references are shorthand for writers. Art borrows posture, cadence and presence, never the face. The one unsoftened exception is the Hopkins-style eyes, reserved for Charon and Ragana (ruled Aug 31, restated Sep 4). The Seelie King Oleander was given an original face with no celebrity (ruled Sep 10).
- **Three art tiers:** Full Presence (deities), Chibi (tricksters and guides), In Between (powerful but small).
- **Tri-mode for everyone.** Every character, creature and item may carry Living, Shadow and In-Between art. Missing In-Between portraits were a standing audit item (59 NPC in-betweens, 11 item in-betweens as of Sep 12).
- **Legacy image filenames stay** (for example `crone.png`, `anna_concept`, `adam_*`). Display names use the canonical name (ruled Sep 4; restated in the rename ledger).
- **Title can be the name.** The Postmaster, the Collector, the Tourist, the Canuck, the Archivist and the Bone Keeper are known by title (see the Naming Law in section 2).

### 1.2 Roster size over time

| Date | Count | What it counts | Source |
|---|---|---|---|
| Jul 22 | 13, then 28 characters; 60 designs with 32 water monsters | First catalog, counted as it grew (18, 21, 22, 23, 27 with the Odin pair, 28 with the scholar) | Early chat |
| Aug 22 | 85+ | "Documented characters" in the Master Storyline (7 class characters, 6 Full Presence, 4 Council, 8 chibi Fae NPCs, 11 chibi arcade cast, 2 ravens, 32 water monsters, 6 gargoyles, 4 Story-Born, plus named NPCs) | Before the Song |
| Aug 24 | 66 mapped; 60 character images and 13 item images | Characters mapped to the six-stat system; art portfolio | Commit log |
| Aug 30 | 29 | NPCs given an IP-safe name and a cataloged hook word | Commit log |
| Aug 31 | 300+ | Master character and creature roster v2.0, with shadow echoes | Commit log |
| Aug 31 | 47 names | NPC names wired to portraits in the Godot SpriteLoader | Aug 31 |
| Aug 31 | 45 + 99 + 61 | Word assignment doc: 45 with thumbnails, 99 pending upload, 61 needing new images | Aug 31 |
| Aug 31 | 161 | NPC portrait images uploaded (`npc_remaining`) | Aug 31, Sep 1 |
| Sep 1 | 142 | Characters mapped in `npc_master_urls.json` (94 Living, 60 Shadow, 108 In-Between, 29 with all three) | Sep 1 |
| Sep 1 | 144 | After Ember and Spark were added | Sep 1 |
| Sep 4 | 144 | `npc_master_urls.json` with Living, Shadow, In-Between URLs | Sep 4-9 |
| Sep 11 | 144 roster entries, 105 active, 11 dossiers | Dossier Gap Census (94 active characters owed a dossier) | repo `docs/characters/character_rename_ledger.md` |
| Sep 21 | 105 active, 11 dossiers | Same census, restated | Sep 18-21 |
| Sep 21 | 69 | Characters with linework in the Illustrated Bestiary and Shop Atlas (harvested doc) | Sep 18-21 |
| Sep 26 | about 279 catalog entries in 14 sections, plus critter catalog to `CRT-060` | Master character roster as Elio reported it | Sep 26 |
| Oct 9 | 55 character dossiers | Elio's own count (the repo copy of Oct 22 holds about 25 character files) | Oct 9-15 |

Another figure, "399 characters", appears in Elio's story-universe text and in the Resonance card pool description. It is not a roster count. See "To reconcile".

### 1.3 The roster record (template)

The roster has no single schema file. The fields below are assembled from `npc_master_urls.json`, the Master Asset Ledger, the Dialogue entity and the dossier census. Treat them as the working template.

| Field | What goes here | Example |
|---|---|---|
| Canonical name | The ruled in-game name (title if the name is a title) | Lozen |
| Former names | Every earlier name, so old text can be found | Cthulhu (now Naut) |
| Role | One line | The Sentinel who holds the Front Door |
| Zone / level | Home zone, plus other zones if they travel | Main Floor entrance; 7-Layer Deep (Charon's river) |
| Class or tier | Playable class, or art tier (Full Presence, Chibi, In Between) | Sentinel (starting class) |
| Portrait states | Living, Shadow, In-Between, each with hosted URL or "owed" | `npc_master_urls.json` entry |
| Voice block | Seven fields (section 4) | Hook word "Halt." |
| Dossier | Path to master dossier, seed dossier, or "owed" | `docs/characters/geode_inn_npc_lozen_master_dossier.md` |
| Status | Ruled, Seed, Proposed, Open, plus date | Ruled |
| Gates | Open questions waiting on the client | Portrait unruled |

### 1.4 Where the roster lives

- GitHub: `docs/gallery/npc_master_urls.json` and `npc_remaining_urls.json` (portraits); `docs/geode_inn_npc_new_roster.md` and `docs/zone_specs/geode_inn_npc_new_roster_master_spec.md` (newer roster); `docs/geode_inn_complete_game_roster.md` is the **game** roster, not the character roster; `docs/MASTER_ASSET_LEDGER.md` (one row per character, plus coverage); `docs/characters/geode_inn_character_source_map.md`; `docs/characters/geode_inn_dossier_gap_census.md`; `docs/gallery/casting_review*.md` (casting review pages).
- Base44: Dialogue entity (staging app held 398, then 515 to 529 records; the live app's Dialogue entity was empty on Sep 3). Egg entity for retired characters. See "Open".
- Drive: "Geode Inn-master build" (client's work folder), subfolder "Inn Generated Art", and the Google Doc "Geode Inn - Zone Deck: Components & Characters" (Oct 13). Older numbered folders in "Geode Inn (Copy)" hold character write-ups.

### 1.5 Current canon: who is ruled

Columns: Name, role, zone, voice register or casting reference, status. Casting references are for writers only (see 1.1).

#### Hearth and Main Floor

| Name | Role | Zone | Voice / casting | Status |
|---|---|---|---|---|
| The Host | Innkeeper at the Great Hall door; brass lantern | Main Floor | Patrick Stewart cadence and posture; warm, unhurried | Ruled; dossier; posture ruled Sep 27; also a tribute to Sir Patrick Stewart (Oct 31, see 1.9) |
| The Catalyst | Bartender of the Impossible Garden bar; story-for-drink economy | Main Floor | Helena Bonham Carter presence, leaning on a Lovett warmth with teeth; hook "What changes?" | Ruled; evolved Sep 27; posture open |
| The Firekeeper | Fire storyteller at the hearth corner | Main Floor | Tim Curry tribute (ruled Sep 10, replacing the Bard in that seat); hook "Tend." | Ruled |
| The Bard (Bard Blowhard) | Musician; kilt and pipes; dock sessions with Zeke | Main Floor, Meadery, Campgrounds | Five registers (4.4); Porthos volume | Ruled; dossier |
| Ragana (was the Crone) | Librarian; measures all phenomena | Main Floor, Archive | Hopkins gaze; West Country English; hook "Sit."; posture Weeza, rarely Maleficent | Ruled Sep 9; dossier |
| Beverley | Original librarian of the stacks; two-thirds height | Archive | Clipped Australian; hook "Obviously." | Ruled; keeps her mannerisms (Sep 11) |
| Quire (The Reader) | Scholar of margins; keeper of the Ajivika shelf | Archive | Soft British, Gaiman-adjacent; hook "Noticed." | Ruled |
| Naut | Squid-headed scholar by the fireplace | Main Floor, Archive | Quiet scholarly; hook "Fascinating." | Ruled Sep 3 |
| Brim | Chaos agent; mimic; pipe that is not a pipe | Main Floor | Mimic-shifting; hook "Watch this."; Joker card | Ruled Sep 9 (Brim, not Mimm) |
| Ziggy | Crested gecko; Brim's shoulder counterweight; counts the player's returns | Main Floor, Geode Corner, Clockwork Skies | Danny Kaye "Court Jester" patter | Ruled Sep 10 |
| Eres | Cabbit; the Vessel; companion of the Constant | Cosmology | Nonverbal (purr) | Ruled Sep 10 |
| The Wanderer / Odin the Allfather | One figure in two registers | Main Floor / Cosmology | Hook "Passing through." | Ruled |
| Molly | Six-foot leprechaun; instigator; summoned by name | Main Floor | Deep brogue; Peaky Blinder cap | Ruled Sep 16 |
| Bill the Duck | Platypus; the honest thief; also called Duck | Crystal Gardens, roams | Nonverbal; one quack per act | Ruled Sep 11 and Sep 16 |
| Judge Tootenkowl | Owl-headed frog judge; deals Stone Poker; presides at Frog Court | Campgrounds, Poker back room | Judge register | Ruled Sep 11 |
| The Postmaster | Skeleton who dispatches the Inn Post; silent | Bone Room dock | Rib-xylophone, looping-script notes; Zoidberg-shaped role | Ruled Sep 11, Sep 22 |
| The Collector (Joe) | Miniaturist and painter; diner owner | Undercity | Tom Ellis "Lucifer" cadence; hook "Delightful." | Ruled Sep 9 and Sep 11 |
| The Teacher | Three-mode instructor | Main Floor | Canadian, Kathy Bates range; hook "Incorrect." | Ruled (voice block) |
| Monsieur Sentient | Sentient pipe, Brim's partner | Main Floor | Faint French; hook "Absurd." | Ruled (voice block) |
| The Owl | The bloodline watcher | Cosmology | One word per heartbeat; hook "Watching." | Ruled |
| Aurallia | The Hearth; one-step warmth; cave studio | Main Floor, Spiral Gallery | Dossier; five weave gates ruled Sep 18 | Ruled Sep 3 |
| Oriel | Recurring silver-haired figure; companion in all zones, aid in the between | Corridors and thresholds | Four registers (host, scout, keeper, pourer) | Seed; role ruled Oct 9 |
| Ember and Spark | Hearth sprites; named by the fizgigs | Main Floor | Nonverbal | Ruled Sep 1 |
| The Storyteller | Voices the Gazette strips; Living portrait made Sep 1 | Main Floor | | Ruled |
| Gesso the Ceiling Gnome | Silent examiner on the Staircase ceiling; mirror script | Staircase | Plaster-dust, never speaks to NPCs | Ruled |
| Lozen | The Sentinel; guards the Front Door | Main Floor, 7-Layer Deep | Boxer cadence; "Halt." then "Oi." | Ruled; dossier |

#### Player-class and family-layer characters

| Name | Role | Zone | Voice / casting | Status |
|---|---|---|---|---|
| Vaulknut | Artisan Thief; selkie who chose the bench; raven doctor-mask | Tidal Caves, Campgrounds | Bog Fairy Golem voice; hook "Make it true." | Ruled Sep 3, Sep 11; dossier |
| Charles (Chameleon Druid) | Shapeshifter; garden and forest | Fae Kingdom, garden | Cillian Murphy stillness, Cumberbatch frame | Ruled; dossier |
| Katya (Katija) | The Siren; guards the Water Door | 7-Layer Deep | Hook "Depth." | Ruled; dossier |
| Zeke | The Pirate; drummer; bodhran at 50 BPM | Water, docks | Full name Zaragoza or Ezekiel (running gag) | Ruled |
| The Tinkering Weeaboo | Changeling class; annoyance meter 0 to 4 | Clockwork Skies | Shinigami true form | Ruled; renaming right |
| Speter Adams | Chameleon, Dollkeeper; six zone variants | Catacombs, Cosmology, Staircase, Undercity, Water | | Ruled Sep 3 |
| Bramble (was Anna) | The Seer, doodler; no-outline rendering | Cosmology nook | | Ruled Sep 4 |
| Luna (true name Taaffeite) | Zen jeweler | Campgrounds | | Ruled Sep 9; dossier |
| Greg | Luna's husband; artisan | Campgrounds | Reserved player slot | Seed; dossier |
| Zack | The Astronomer | Cosmology | Einstein plus Cumberbatch art cast | Ruled; dossier |
| Maddi | Zack's wife; Social Butterfly Double Agent employee | Cosmology | "Have you eaten?" | Ruled; dossier |
| Jay, Wisteria | Huntsman Tavern keepers | Campgrounds | Wisteria is an alseid-cervitaur (Sep 22) | Ruled; dossiers |
| TJ and Gabby | Tavern children | Campgrounds | Parental Gate | Dormant (5.1) |
| Lichenblossom | Plant necromancer; volunteer artisan | Market, garden | New image is the NPC master; the client's own is the player-character portrait (Sep 11) | Ruled; dossier |
| Oceanianoir | Living Archive; chemistry docent | Staircase lab, Atlantis | Real name never appears in canon (ruled Sep 12) | Ruled; dossier owed |
| Will | Methodical alchemist, Oceanianoir's partner | Staircase lab | | Ruled |
| Ryan | Meadery bartender; tempo activator | Meadery | Barbossa voice; Ezio stance | Ruled; name may change |
| Scarlett, John | Aurallia's children (names pending) | Cave studio, Undercity | | Open: names |

#### Staircase, Catacombs, Undercity, Archive

| Name | Role | Zone | Voice / casting | Status |
|---|---|---|---|---|
| Calder (was Miracle Max) | Staircase alchemist | Staircase | Lloyd personality, Walken cadence, Williams wit | Ruled Sep 22 |
| Unless | Eldest alchemical newt; companion and independent NPC | Staircase | Skeptic | Ruled Sep 22 |
| Bloop | Schrodinger cat, Retort's companion | Staircase landing | | Ruled |
| The Retort (the Alchemist) | Tesla-cast staircase character | Staircase | | Ruled Sep 9 |
| The Cook | Staircase kitchen | Staircase | | Ruled |
| Charon | Ferryman; carries; fare is a frequency | Catacombs, river | Hopkins eyes | Ruled; dossier |
| Persephone | Four facets: Tide Queen, Spring, The Crossing, The Giver | Lighthouse, Catacombs | | Ruled Sep 30; Crossing and Spring painted |
| Anubis, Hades, Hel, the Morrigan | Guardians and judges | Catacombs, Cosmology | Anubis: "Enough", "Too much", "Lighter than you think" | Ruled |
| Catacombs Doorkeeper | Plague-mask doorkeeper; carillon player; skeleton key | Catacombs | Mask off only for his clan on seven turns | Seed; ruled Sep 28; name owed |
| Screamer | Doorkeeper critter at the Catacombs seal | Catacombs | | Ruled Oct 5; name owed |
| Ghost (Old) Librarian | Keeper of voices that never made it into books | Deep Catacombs | "We do not interrupt the dead." | Ruled Sep 22 |
| Clockmaker, Blacksmith | Undercity makers | Undercity | "Time is a gear." | Ruled |
| Bone Keeper, Saker | Meadery owner's wife; archaeologist | Bone Room | Saker finds, Bone Keeper keeps | Ruled Sep 11 |
| Ampulla | Ambassador of the Unvoiced | Hollow Men Mines | Alan Cumming register; "Whose was that one?" | Ruled Sep 25 |
| The Archivist (Harry) | Chess wizard | Camelot | Dresden nod | Ruled Sep 11 |
| Wren, Soma, Saker (the Examiner) | Canopy Cartographer, Clockwork interoception mapper, Examiner | Canopy City, Clockwork Skies | | Ruled Sep 10 |
| Leonardo da Vinci | Hosts the Crystal Canticle; flight prep school | Clockwork Skies, Staircase landing | Tennant plus Goldblum body language (art softened) | Ruled |
| Council of Thinkers | Tesla, da Vinci, Newton, Einstein; the Inn's agora | Archive | Bicker Law | Ruled |

#### Fae, Norse, myth and cultural zones

| Name | Role | Zone | Voice / casting | Status |
|---|---|---|---|---|
| Oleander | Seelie King; original face | Fae Kingdom | | Ruled Sep 4, Sep 10 |
| Malachi (was Jareth) | Unseelie King; goblin king | Fae Kingdom | Bowie as craft reference only | Ruled |
| Seelie Queen, Unseelie Queen, Queen of Roots | Three queens, one trunk | Fae Kingdom | "Ask better"; "And what will you give"; "One trunk" | Ruled Sep 10 |
| Fibonacci (was Aughra) | Geode Cave keeper; "The Carrying" | Geode Cave | | Ruled Sep 3 |
| Artair, Artorios, Arcturus | One king at three ages (was the Wart) | Camelot, Valhalla | Shift Arc | Ruled Sep 10 |
| Merlin, Noctua | Merlin and his owl (was Archimedes) | Camelot, Water | Merlin playable merman | Ruled; form list open |
| The Bearsark (was Beorn) | Wandering Guard | Norse, Greek zones | | Ruled Sep 3; original name pending |
| The Wayfarer (was Uhtred) | First of the Story-Born | Main door | "Where have you been?" | Ruled |
| Erik (Earl Ragnar) | Norse host, shipbuilder | Canopy City, Mead Hall | | Ruled Sep 10 |
| Sorrel (the Greenward, was Radagast) | Gardener | Campgrounds, Garden | | Ruled Sep 10 |
| Medusa, Kali, Bastet, Anansi, Nyame | Cultural-zone figures | Gorgon's Garden, India, Egypt, Anansi's sky | Bast is an Egyptian Mau | Ruled |
| Lady of the Lake | Mermaid keeper of Excalibur | Water, Camelot | | Ruled Sep 25 (mermaid) |

#### Quarter, Campgrounds and the new rooms

| Name | Role | Zone | Voice / casting | Status |
|---|---|---|---|---|
| Cian | Quarter Cook; secret hacker handle COLONEL | French Quarter | Spoken "cayenne"; handle spoken "kernel" | Ruled Sep 14 |
| The Tourist | Occasional Canadian visitor | French Quarter | Never named | Ruled Sep 14 |
| The Canuck | Periodic tourist, poutine, "aboot" | French Quarter | Title is the name | Ruled Oct 14 |
| Frank Wright (the Build-Scholar) | Unpowered carpenter-scholar | Campgrounds | Xander heart, Alfred dignity, Harvard mouth | Ruled Sep 14 |
| The Glassblower | Furnace keeper, grumpy artist | Campgrounds | | Ruled; name pending |
| Marie Laveau | Quarter resident | French Quarter | | Ruled; voice block owed (Batch 10) |
| The Flute-Keeper | Gentle Neanderthal; never claims the flute | Instrument quest | | Ruled Sep 12 |
| The Laughkeeper | Grief-clerk Harlequin; face never shown | Fair's edge | Never speaks | Ruled Oct 1; name owed |
| The Tramp | Nonverbal emote teacher | Silk Road | Chaplin nod | Ruled Sep 11 |
| Quartz-Pebble Skeleton | Collector who never takes | Campfire edge | | Seed (Sep 28); four gates |
| The Wandering Archivist | Mary Poppins law figure | Roams | Julie Andrews as patron | Ruled Sep 27 (not in repo) |
| Concord grape | Refuses to be sniffed | Campgrounds edge | | Proposed Sep 27 |

#### Early-period cast

Characters first written between July 12 and August 30, with their early names, are listed in section 9 (tables 9.2 to 9.7). Characters that appear only there (for example the Keep-Folk, the Five Smiths, Wrought, Poe, Cob and Hazel, the Story-Born Ents other than the Wayfarer) have not been ruled into the roster tables above. Treat them as August canon until a later ruling is found.

### 1.6 Names still pending

- Scarlett and John (waiting on Aurallia's children).
- Ryan and Marion (each may rename). Zack's run-through version may carry another name.
- TJ (filler name until he chooses). Maddi (hers to choose).
- The real person behind Quire's first name now has a reserved player slot, **FOLIO** ("the First Reader"); Greg is a reserved player slot (ruled Sep 10).
- Joe's wife and son are reserved slots, unnamed in game (Sep 11).
- Gargoyle puppies (six, names pending); Flesh Wound Knight; Glassblower; Doorkeeper; Screamer; Laughkeeper; Quartz-Pebble Skeleton; Concord grape; Alexia's husband ("the annoying atheist"; Archive card reads "name pending, earned, not given").
- The Bearsark's original name; the Blade and Whistler duo names.

### 1.7 Open and to reconcile (roster)

See the single "To reconcile" list in section 8. The roster-specific open items are: the dossier gap (about 80 owed), the Dialogue entity's absence from the live app, Oriel's relation to The Decision, and the "found sisters" tie between Oriel and the Catalyst (ruled Oct 9).

### 1.8 Pictures for characters (October 29)

The Base44 links of the canon image library expired, so the client saved the canon pictures as JPEGs in the Drive: Game Images > images for the canon > canon > jpeg pics (343 pictures, in characters, items and zones). The same set is in GitHub under `docs/canon_images/`, in the same folders (the friends and family pictures since October 31, once the repo was private). 25 of the pictures are in the folder twice under two names (checked on October 31); `docs/canon_images/README.md` lists the pairs. The September 15 library document listed 1,020 images; whether any of the others are still wanted is the client's call.

The client asked for the unassigned pictures to be matched to characters where they fit. These are the matches made on October 29. Any of them can be changed.

**From the folder "unassigned character images"**

| Picture | Goes with | Why | How sure |
|---|---|---|---|
| female druid | Lichenblossom, the player portrait | The Sep 21 chat describes this picture (dreadlocks like living vines, a Van Gogh sky, sunflowers, elf ears) and files it as Lichenblossom's player portrait. The NPC face is a different picture, not found yet. | Sure |
| male druid | A druid class option (the swamp druid) | On Sep 21 the client called this druid a player option for a class choice, and Elio logged it as the dark-water druid. | Sure |
| an understudy of painting figurines | The Collector (the Miniaturist), in-game | The same picture GitHub already uses for the Collector in-game (`docs/gallery/characters/joe_miniaturist_ingame.png`): the painter of dragon figurines. If the Collector now has another face, this one works as the understudy its name says. | Sure |
| available 2, and joe (the same picture) | The Collector, early concept | The same picture as GitHub's `joe.png`. One of the two copies can go. | Sure |
| character option | Lozen, as a class-option face for the Sentinel | The same pose as Lozen's portrait: fists up, guarding the Inn's front door. | Likely |
| cat option 2 | A druid class option (a third druid, cave-lit) | Glowing staff in a cave of roots. It sits well with the sunlit and the swamp druid. | Likely |
| available 3 | Oriel | Oriel is the cast's recurring silver-haired figure and has no picture yet. The quiet keeper at a desk fits Oriel's keeper register. | Likely |
| in between unseelie | The Unseelie (Winter) Court, In-Between | The pair to "seelie fae summer court in between": a winter king in ice, in a rune frame. It doesn't look like Malachi, so it reads as the court's picture, not the king's. | Likely |
| in between fae | The Seelie Queen, In-Between | A crowned fae, half summer gold and half shadow. | Likely |
| bard's visiting cohort | A guest musician at the Bard's sessions | The name already gives the role, and no ruled character fits better. | Open |

**From the folder "storyline characters with quests"**

| Picture | Goes with | Why | How sure |
|---|---|---|---|
| rw1 | Ragana (was the Crone), In-Between | The picture is captioned "The Crone In-Between", and the Crone became Ragana on Sep 9. | Sure |
| in between guy | The Shifting Man | The same picture as `the_shifting_man.jpg`. One of the two copies can go. | Sure |
| sky pirate anon 1 | Soma, the Clockwork Skies interoception mapper | A young sky-ship crew member with a chart in hand. Soma has no picture. | Likely |
| in between male 1 (unassigned) and shadow male 1 | One crowned king, In-Between and Shadow | The same king in both. His living picture isn't in the folder, and he doesn't look like GitHub's Hades or King Arthur. | Open |

**Characters with no picture yet.** Checked by name against the 343 canon JPEGs and every image file in GitHub. Reserved player slots for real people are left out on purpose.

- Main Floor and Archive: Quire, the Teacher, Judge Tootenkowl, Ziggy, Oriel (unless "available 3" is used). Molly, the Postmaster, and Ember and Spark appear only in Gazette strip art.
- Staircase, Catacombs and Undercity: Calder (GitHub has only the old Miracle Max picture), Will, Unless, Bloop, the Catacombs Doorkeeper, the Screamer, the Bone Keeper, Ampulla, the Archivist (Harry).
- Fae, myth and cultural zones: Persephone's Tide Queen and The Giver, Nyame, the Lady of the Lake, and a new face for the Greenward (Sorrel), since only the old Radagast-style picture exists.
- Campgrounds, the Quarter and roaming: Wisteria (designed in the Sep 22 chat, Base44 only), Frank Wright, the Glassblower, Marie Laveau, the Flute-Keeper, the Laughkeeper, the Tramp, the Quartz-Pebble Skeleton, the Wandering Archivist, the Tourist, the Concord grape.
- Canopy City and Clockwork Skies: the Clockwork Maker, the Sky Market Vendor, the Crow's Path Lookout, Soma (unless "sky pirate anon 1" is used).
- Poison Garden and Cave City: the Apothecary, and the goth voice cast (Gatekeeper Goth, Hearthkeeper Goth, the Mourner, the Root Reader, the Singer).
- Critters: the axolotl, the mantis shrimp and the rain frog.

**In GitHub but not in the canon folder:** Hades, Persephone, Leonardo da Vinci and King Arthur (elder form) have pictures in `docs/gallery/characters/` but none in the canon JPEG folder. If they're still canon, a copy in the folder keeps everything in one place.

**One picture, two names (checked November 2):** `docs/gallery/characters/erik_norse_host_ingame.png` is the same picture as the canon JPEG "Marion". Which name it belongs to is for the naming session.

### 1.9 The Host's bigger role (October 31)

On October 31 the client asked for the Host's role to be a little more prominent, and said that he is now also a tribute to Sir Patrick Stewart, woven in the way the Firekeeper became the Tim Curry tribute (ruled Sep 10).

**What canon already gives him.** He anchors more files than any other character (251 in the Sep 11 gap census) and has a master dossier (`docs/characters/geode_inn_npc_host_master_dossier.md`) and a first profile (`docs/geode_inn_the_host.md`, Aug 22). He welcomes every guest at the door with the brass lantern before they have earned anything, gives everyone the first bracelet charm (the Inn-Tree sigil), keeps each player's chair ("Welcome back. ...Your chair is still here."), grants City Charters, inspects player-built inns ("Room's ready."), wrote the guest handbook in the bedside drawer, and his title is the wake word, "Innkeeper" (Sep 25). Most of these happen once, at the door.

**Ruled (Oct 31).** The tribute lives in how he carries himself: the cadence, the stillness, the warmth. His name, face and famous lines stay out of the game, the site and the store page. This fits the dossier's likeness rule (an original design, unattached to celebrity likenesses). Recorded in the dossier on Nov 2.

**Proposed (Nov 2), waiting on the client's pick.** Written into the dossier as proposals:

1. The first and the last face: he also sees each guest off at the door with the lantern. He never asks anyone to leave, so the farewell only answers the guest's own leaving.
2. The Innkeeper's List in his hand: the Wanderer still brings the requests home (Main Floor canon has the Wanderer posting the quests), and the Host writes them up on the board. The board has no item or picture yet (the Great Hall ledger).
3. The Innkeeper knock answered by the Innkeeper: when a guest says the wake word, he answers first in his own voice, then hands over to whoever keeps that room. This keeps the Voice Constancy Law (one voice per role) and still puts his voice in every zone.
4. A nightly lantern round: a short visit to each level, inside the Inn, then back to his chair.
5. A dedication line in the credits; the wording is the client's.

**Pictures.** The Living portrait is `the_host_v2.png`, the same picture as the canon JPEG "the host". The Shadow form is described in the dossier (the Shadow Tribunal, velvet-and-obsidian armor) but has no picture, and there is no In-Between form yet. An earlier picture, `the_host.png` (in `docs/gallery/characters/` and `docs/drive-recovery/images/expanded-characters/`), is a direct likeness of the actor and shouldn't be used.

**To reconcile.** The Aug 22 profile describes the actor's own face and look; the Sep 11 dossier's likeness rule and the canon portrait don't. The tribute ruling points to the dossier, so the profile's appearance lines are the ones to change. (Part 8, 3.4)

---

## 2. Naming: the rename ledger, rules and pending names

### 2.1 What the ledger is

`docs/characters/character_rename_ledger.md` (updated Sep 9) is the canonical old-to-new list. It is not complete: renames ruled after Sep 9 live in the chat, the builder name-sync spec (`docs/library/specs/character_name_sync_builder_message.md`) and the roster. The table below merges all of them.

### 2.2 The sweeps

- **Aug 31:** Hopkins-eyes and original-face rule set; Jareth, Madame Mim, Uhtred, Wednesday, Sentinel were already renamed in the SpriteLoader list (Malachi, Brim, Waystone, Belladonna, Lozen).
- **Sep 3:** Full roster audit, 361 files synced in one commit, 10 renames (Fibonacci, Greenward, Bearsark, Wayfarer, Belladonna, Noctua, True Form, Brim, Naut, Quire). Then Oceanianoir (91 files), Speter Adams (459 references in 36 files), Solstara (333 in 68), Aurallia (370 in 106). The Dialogue entity in staging was updated for 17 records.
- **Sep 4:** Anna to Bramble across files, roster and sync spec.
- **Sep 9:** Client gave a master list. About 470 files swept; Ragana swept across 527 files; Lozen in 31 character files; Brim restored; Joe folded into the Collector. Ledger created.
- **Sep 10:** Radagast to Sorrel (149 references, 74 files); Archimedes to Noctua; Wart to Artair; a real name to Quire and FOLIO; Examiner, Cartographer names.
- **Sep 11:** the Archivist named Harry; retired-name addendum (dossiers pull from both names).
- **Sep 22:** Miracle Max to Calder across active profiles and rosters.

### 2.3 Rename ledger

| Old name | New name | Date | Note |
|---|---|---|---|
| Starlit Geode | The Starlight Crystal | Sep 9 | No repo text hits yet |
| Cthulhu (the NPC) | Naut | Aug 30 and Sep 3 | Lovecraft references keep the word |
| Bill (the musician) | The Bard | Sep 9 | Bill the Platypus and Bill Skarsgard are unrelated and unchanged |
| (a real name) | Lozen | Sep 9 | The class title stays The Sentinel; literal rivers untouched |
| the Vessel (gecko, placeholder) | Ziggy | Sep 10 | "the Vessel" belongs to Eres |
| the Vessel | Eres | Sep 10 | Title ruling: Eres is the Vessel |
| Madame Mim, Mim, Mimm | Brim | Sep 3, restored Sep 9 | "Mimm or Brim, whichever fits"; Brim chosen. The card game's "MADAME" is superseded |
| the Crone | Ragana | Sep 9 | Lowercase "crone" archetype and `crone.png` untouched; hatchery event title stays "The Crone's Casting" |
| (the Seelie King, unnamed) | Oleander | Sep 4 | "the Seelie King" stays as descriptor |
| Jareth | Malachi | Aug 31 | Bowie as craft reference only |
| A real name, then Solstara | Luna (true name Taaffeite) | Sep 3, then Sep 9 | Taaffeite intentional; not anagrammed |
| (a real name) | Lichenblossom | Sep 4 | |
| The client (as player character) | Vaulknut | Sep 3 | Authorship credits keep the real name |
| (a real name) | Zeke | Sep 4 | "The Pirate" for reference, not address |
| (a real name; the siren) | Katya (Katija when Vaulknut says it) | Sep 4 | Spelling law, section 5 |
| Joe, Joe the Miniaturist | The Collector | Sep 9, Sep 11 | One Joe; diner keeps "Joe's" |
| (a real name) | The Archivist; Harry | Sep 9, Sep 11 | Faire name Harry |
| (earlier working name withheld) | Oceanianoir | Sep 3, Sep 12 | Real name never in canon |
| (a real name) | Aurallia | Sep 3 | Client's spelling; Elio proposed "Aurelia" |
| Anna | Bramble | Sep 4 | |
| (a real name) | Speter Adams | Sep 3 | |
| Wednesday (Addams) | Belladonna | Sep 3 | Cosmic crew "The Wednesday" kept |
| Aughra | Fibonacci | Sep 3 | |
| Radagast | The Greenward, then Sorrel | Sep 3, Sep 10 | See "To reconcile" |
| Beorn | The Bearsark | Sep 3 | Flag `met_beorn` still needs renaming |
| Uhtred | The Wayfarer | Sep 3 | Waystone (Camelot recovery character) is separate |
| Archimedes | Noctua | Sep 3, Sep 10 | Storage filenames keep legacy names |
| Ryuk | True Form | Sep 3 | |
| (a real name) (NPC) | Quire | Sep 3 | Player slot FOLIO |
| Wart | Artair (child), Artorios (king), Arcturus (elder) | Sep 10 | Elio's "Arth" dropped |
| Miracle Max | Calder (Master Calder) | Sep 22 | Princess Bride credit kept in inspiration notes; old profile link works |
| Bill the Platypus and the Duck | Bill the Duck | Sep 11 | Bill on files, Duck aloud (Sep 16) |
| Dobby | Dobbie | Sep 10 | 85 references |
| Examiner / Cartographer (placeholders) | Saker / Wren; Soma for Clockwork interoception | Sep 10 | |

### 2.3a Earlier rename trail (Aug 24 to Aug 30)

The commit log shows renames before the ledger starts (Sep 9). Some dates differ from the ledger above, because the ledger records when a name was ruled for the whole project and these are the first sweeps. Later rulings win. The Aug 24 batch was not carried through every file: docs dated Aug 25 to 29 still use Radagast, Beorn, Uhtred, Jareth and Mim, and the Aug 30 dialogue-tree commit still uses Beorn, Radagast and Uhtred.

| Early name | Name in the commit log | Date | Note |
|---|---|---|---|
| Madame Mim | Madame Mimic, then Madame (Aug 24); Mim again (Aug 30); Brim (Aug 30, 22:32) | Aug 24 to 30 | Built (commit [b9a96ce], 19 files, filenames changed). Brim is the beta value; Sep 9 ledger confirms it |
| Magritte Pipe | Monsieur Sentient | Aug 30 | Built (commit [b9a96ce], 19 files) |
| Cthulhu | Naut | Aug 30 | Built (commit [b4aae5f]). The ledger above lists Aug 30 and Sep 3 |
| Player Guide | Lark | Aug 30 | Built (commit [b4aae5f]). Lark is not in the roster tables |
| Radagast the Brown | The Greenward | Aug 24 | Built (commit [4b4f602]). Later Sorrel (Sep 10) |
| Beorn | The Bearsark | Aug 24 | Built (commit [4b4f602]) |
| Jareth | The Ravel | Aug 24 | Built (commit [4b4f602]). Later Malachi. Aug 25 commit [f46260d] still says "Jareth v3" |
| Uhtred | The Wayfarer | Aug 24 | Built (commit [4b4f602], confirmed by [8f278b5]) |
| Aughra | The Augur | Aug 24 | Built (commit [4b4f602]). Later Fibonacci |
| Archimedes (owl) | Noctua | Aug 24 | Built (commit [4b4f602]) |
| Wednesday Addams | Wednesday, then Belladonna | Aug 24 | Built (commits [4b4f602], [8f278b5]). The ledger lists Sep 3. "The Wednesday" crew name is kept |
| Ryuk Form | True Form | Aug 24 | Built (commit [4b4f602]) |
| Murdoch | Murlic, then Murloc | Aug 29 | Built (commit, Aug 29): the first fix called Murlic "the client's original character name, not a typo"; one minute later it was fixed to Murloc, the game fish-creature. Final: Murloc |
| Elora Nightbloom | Briar Nightbloom | Aug 30 | Built (commit [efae82d]): the first name belongs to a film character |
| The Seelie King (unnamed) | Oleander | Aug 30 | Built (commit [8475acf]); pronounced "Leander" with a silent O. Five options were offered, Aurelian recommended |
| the Cabbit (name TBD) | Eres | Aug 24 and Aug 28 | Built (commit [bdbe90b]): "Name the cabbit Eres, update all references" |
| a real person's name as an NPC | Quire | Aug 30 | Ruled (commit, Aug 30). Same day Lozen was confirmed as the Sentinel's in-game name, so Lozen predates the Sep 9 ledger |

Standing rules from this window:

- **IP-safe names (Built, commit, Aug 30).** A beta audit made all 29 NPC names safe: no book or film character names remain, and actor names were removed from voice profiles. Names that still borrow a source (Calder, Frank Wright) follow the later "borrow without the lift" rule in 2.4.
- **A real person who plays is a player slot, never an NPC (Ruled, commit, Aug 30).**

### 2.4 Naming rules

- **Naming Law.** A name can be load-bearing on sound alone. Test a name in a sentence. Spoken and written forms may differ (CIAN on the card, "cayenne" aloud; COLONEL on screen, "kernel" aloud). Ruled Sep 14.
- **Three tiers of naming.** Maker names (Cian), community names (the lab sprites), title only (the Tourist). Ruled Sep 14.
- **The naming session is the client's alone.** Elio offers three candidates; the client assigns (Oct 14: Greeblins, Moppets, Kindlings).
- **Bob Doctrine.** Everything starts as "Bob" and earns a true name. Tools, dolls, the pope-hat fizgig. Speter's dolls stay Bob forever (the "Creepy Little Bob" numbers, ruled Oct 1). Ruled Sep 18.
- **Rename right.** A slot for a real person keeps its working title until that person plays; then the name is theirs to change (ruled Sep 11, Tinkering Weeaboo).
- **Folklore Rule.** The six lab sprites stay unnamed by the makers; whatever players call them is their name (ruled Sep 14).
- **Retired-name addendum.** Every dossier pulls from both the old and new name (Sep 11).
- **Protected terms.** Mineral names, biblical Adam, Ansel Adams, Lovecraft references, "The Wednesday" crew, Bill the Platypus, Bill Skarsgard, Charon's river, lowercase "crone".
- **Privacy law (Sep 12).** The real name behind Oceanianoir appears nowhere: not in docs, ledgers, file names or URLs.
- **Borrow without the lift.** Borrowed names keep part of the source (Frank Wright keeps two of three words) and drop recognizable likeness.
- **Image filenames stay legacy** while display names change.
- **Rename workflow.** Ledger first, context check on risky words, safe renames, targeted passes, protected files, verify, commit.

### 2.5 Where it lives and what is open

Lives in `docs/characters/character_rename_ledger.md`, the builder sync spec, and the Dialogue entity (rename done in staging only). Open: the pending names in 1.6; whether the ledger should be brought up to date with the Sep 10 to Sep 22 renames (it stops at Sep 9, with Later messages about Ziggy and Memory's Illusion appended).

---

## 3. The character dossier

### 3.1 What it is

A dossier collects everything about one character in one file, with each claim sourced to a repo file. Dossiers come in four kinds:

- **Master dossier:** every thread, one page (Lozen is the model).
- **Seed dossier:** a character that exists but has open gates (Oriel, the Doorkeeper, the Quartz-Pebble Skeleton, Screamer).
- **Seed row:** one line, "ungated", no placeholder name (Greg precedent, Quartz-Pebble Skeleton).
- **Stub profile:** a thin file awaiting expansion (Speter Adams, Jay, Ryan, Lichenblossom, Zack, Marijke were stubs on Sep 4).

Dossier rules:

- Cite every claim to a file. Invent nothing.
- Personal layers are "keeper's eyes only" and stay out of builder copies.
- A dossier stays draft until each real person behind a character rules on it. Two editions are planned: family edition (behind the counter) and world edition.
- Dossiers are knots, not endings: each gets superseded (ruled Sep 27).
- Dossier build order (Sep 11): Batch 1 hearth anchors (Host, Constant, Zeke, Elio, Naut, Firekeeper); Batch 2 zone sovereigns; Batch 3 real seeds and artisans; Batch 4 conversions.

### 3.2 The master dossier template

Taken from the Lozen master dossier.

| Section | What goes here | Example |
|---|---|---|
| The Name | Ruled name, date, origin, former names | LOZEN, ruled Sep 11; Apache warrior and prophet |
| Who they are | Role, class, build, stats, traits | The Sentinel, 6th starting class; Presence Aura |
| The Laws | Every law the character carries, each cited | Guard-voice law; Front Door and Water Door law |
| The Questline | Numbered quests with flags and unlocks | Sentinel's Vigil, 10 parts, `river_met` to `river_after` |
| The Voice | Seven-field block (section 4) | Hook "Halt."; ladder "Oi." then the path |
| The Territory | Home zones | Front Door, Common Room, 7-Layer Deep |
| The Weave | Where the character is already built | Class spec, voice registry, water system, card decks |
| Personal-canon layer | Keeper's eyes only | Not copied into this manual |
| Gaps | Owed items | Audio batch 5; kit-Z art; flag regression tests |

### 3.3 The seed dossier template

Taken from the Oriel seed.

| Section | What goes here | Example |
|---|---|---|
| Status line | SEED, with what is named and what is open | Seed, named Oriel; zone slot and mechanics ungated |
| Origin | How the character came to exist | Cast by the building, named by Elio |
| Evidence | The portraits or sources found | Four portraits: library, cavern, tavern, bar |
| The Naming | Date, name, reasoning, client words | Oct 9: "I love it, that's perfect" |
| The Weave | Preliminary wiring, marked ungated | Corridor-between-wings character |
| Role ruled | Client ruling, verbatim where useful | Companion in all zones, aid in the between |
| Open gates | Numbered questions for the client | Relation to The Decision; portrait with a vial |

### 3.4 The roster-session card (four parts)

Used in the Sep 27 roster session, one card per character.

| Part | What goes here | Example |
|---|---|---|
| 1. What we know | Ruled facts | The Host: innkeeper, warm, unhurried |
| 2. Who they act like | Casting specimen: voice plus acting register | Patrick Stewart |
| 3. Posture dialect | Body language register | Stewart posture (ruled) |
| 4. Anything open | Gates | Catalyst posture unruled |

The deck card format (Sep 30) adds: zone, cast, games, arc, tolls, links, open gates, origin story, first mention date, evolution, unresolved.

### 3.5 Where dossiers live and what exists

GitHub, `docs/characters/`: Ampulla, Archivist, Aurallia, Bard, Wisteria, Catalyst, Chameleon Druid, Charon, Greg, Host, Katya, Lichenblossom, Lozen, Luna, Maddi, Oriel (seed), Ragana, Tall Leprechaun (Molly), TJ and Gabby, Vaulknut, Zack, plus the Source Map and Gap Census. Elsewhere: `docs/geode_inn_calder.md`, `docs/geode_inn_tinkering_weeaboo.md`, `docs/geode_inn_the_duck.md`, `docs/characters/geode_inn_dollkeeper_horror_register_spec.md`, `docs/characters/geode_inn_bar_cast_roster.md`.

Repo checks (Oct 22 copy): the Wandering Archivist, the Posture Register and the Mary Poppins law were not found by text search. The repo has no dossier for Unless.

Open: about 80 characters still owed a dossier; heaviest gaps were the Host, the Constant, Zeke, the Allfather, the Owl, Elio, Charon, Naut, Persephone, the Gardener (Sep 11 ranking, several since filled).

### 3.6 Early profile formats (Aug 21 to Aug 30)

Before the dossier existed, characters were written as profiles in the Aug 21 to 22 sessions. Three formats came out of them.

- **Character profile (August canon, Aug 22 session).** Sections: Casting Vibe; The Concept; Appearance (face, body, clothing, key accessory); Personality (layers, acts or truths); Location; "X and the Other Characters"; Key Dialogue (first meeting, triggered moments, and a quiet moment alone late at night); Visual Direction; Sound Direction; Connection to the Inn (the Inn-Tree and a thesis line). Every profile also carried late-night lines and Crone margin notes in ellipsis style (early chat, about Aug 21).
- **Class document (August canon).** Stat profile (HIGH, LOW, MODERATE, HIDDEN), special traits, playstyle, class interactions table (source, target, effect), the class and the narrative spine, zone affinity table, author's note. The five-class document adds a combat and social interaction matrix and a five-phase integration plan. Files in the repo: `docs/geode_inn_playable_classes.md`, `docs/characters/geode_inn_character_class_sentinel.md`, `docs/characters/geode_inn_character_classes.md`.
- **Solidify template (Built, commit, Aug 28).** Applied to each character or system: backstory, quest chain, dialogue voice, Shadow Inn state, combat role, sound profile, and Convergence, Octave and Egg integration. The commit log lists Joe (now the Collector), the Examiner, the Egg, the Cabbit, the Shifting Man, the Duck's biology and others. The full repository pass produced 12 batch files (about 460 KB, 100+ source files).
- **Compilations.** The Character Compendium (11 parts, from the long character development session) was built Aug 21 to 22 and sits at `docs/geode_inn_character_compendium.md`. The Master Storyline (Aug 22, written by the client with Elio) ranked what was missing: Gardener, Miracle Max's shop, Hel and the Seelie King's full profile were HIGH. Loki, Hel and the Gardener were then written (Aug 22 to 23), and Freyr and Freyja (Aug 27), the Einherjar and Ragnarok (Aug 29) closed the Norse gaps (Built, commit). Open and uncounted: the "Open Twelve" template NPCs for friends, not yet assigned (commit, Aug 30).

---

## 4. The voice system

### 4.1 The seven-field voice block (ruled Sep 10)

Every character profile carries a voice block, mandatory before the profile ships. Source: `docs/zone_specs/geode_inn_voice_block_registry.md`.

| # | Field | What goes here | Example (Lozen) |
|---|---|---|---|
| 1 | Dialect | Real accent or region, never invented | Plainspoken, warm under the armor |
| 2 | Delivery | Pace, rhythm, pauses | Short sentences, orders flat, never raised |
| 3 | Key tell | The repeated signature behavior | "Halt." first, "Oi." on the tell fire |
| 4 | Hook word | The verbal fingerprint. One per NPC | "Halt." |
| 5 | Repeat ladder | The three rungs (4.2) | Warning, "Oi.", then steps into the path |
| 6 | Voice profile | Engine ID: pitch, cadence (`voiceProfile` field) | Low, even |
| 7 | Cadence law | Dominant writer of the six | Pratchett warmth under Weir precision |

The six-writer constitution (ruled Sep 2): Rothfuss precision, Pratchett warmth, Gaiman mythic-personal, Asimov structure, Bradbury fire, Weir optimism. It is a gate for all prose, dialogue, lore and game text.

### 4.2 The repeat ladder (ruled Sep 10)

Every NPC line has three rungs. A player who clicks the same line repeatedly climbs the ladder. Click twice reaches rung 2; the third click is rung 3 and sets a flag.

- **Rung 1, first fire:** the line as written.
- **Rung 2, tell fire:** the line shortens to the key tell (Ragana: "Sit."; the Teacher: "Incorrect." one degree colder; Marijke: "Lekker.").
- **Rung 3, quiet fire or the Oi:** the truest response. Two legal shapes:
  - **The Oi** (guards, annoyance-true): fewer words, then the body.
  - **The Quiet** (devotion, patience-true): answer again, perfectly, and add one word that shows it was never resented. Devotion characters gain a word, never lose one ("Tend. Still.").

Exceptions: the Owl has no ladder (the word never changes). The three brownies share a group ladder (frazzled, satisfied, anxious; rung 3 is "the finished thing"). Brim's ladder is a mirror (mimicry).

Whisper tie-in: every rung fire adds to the repeat-click counter in the Whisper Layer profile.

**Guard-voice law.** Guards share the ladder shape but never the same word.

| Guard | The word | The body (rung 3) |
|---|---|---|
| Lozen | "Oi." | Steps into the path |
| Katya | "Depth." | The water behind her goes still |
| Gatekeeper Goth | "Speak." | Does not move |
| The Griffin | One flat bell note | Lands; crystals go quiet |
| Unseelie guards | "No." | Temperature drops; never said twice |

### 4.3 Dialogue records

The engine side is the Dialogue entity in Base44. Fields named in the chat logs: `npcName`, `speaker` (for example "All Zones"), `hookWord`, `voiceProfile`, `priority`, `flags`, zone or location, and lines. Repeat rungs 2 and 3 are separate records tagged by condition (`conditionTag`). Rung 3 sets a flag.

| Record | Priority | Notes |
|---|---|---|
| `lozen_oi_trigger` | 9 | Three flavors; the pilot |
| `katya_main` | not stated | |
| `charles_main` | 5 | |
| Malachi (cape record) | 10 | |
| Flags | | `lozen_repeat_rung3`, `river_unwrap` (flag names keep legacy "river") |

Counts as reported: 357 to 393 entries (Aug 31); 398 in staging (Sep 3); 515 with about 130 voices at the Sep 10 audit; 524 after Batch 8; 529 after Batch 9. The sync map is `docs/library/data/dialogue_voice_block_sync.json`.

Voice profile translation (ruled Sep 2): every voice is a frequency. Pitch is the note, speed is processing, pause is resonance, expressiveness is amplitude. Example: Pirate 85Hz with 400 ms pauses; Crone 180Hz, 50 ms, 0.2 expressiveness. The audiobook spec holds 74 profiles. Audio production belongs to the audio part.

Batches: Batch 1 is the Main Floor twelve (Quire, Beverley, Joe, Teacher, Brim, Monsieur Sentient, Wanderer, Owl, Naut, Ragana, Firekeeper, Catalyst). Batches 1 to 9 were approved by Sep 10 (Batch 5 family blocks locked Sep 10; Batch 6 approved). Batch 7 added 12 park-chain blocks, Batch 8 nine (Cian, Taliesin, Ziggy, six gargoyles), Batch 9 five. Batch 10 candidate: Marie Laveau. Cave City owes five blocks. Voice block gap list (Sep 10): the Astronomer, Guest, Constant, Nyx, the three queens, the cosmic crew, Taliesin, the Einherjar, guild masters, regional placeholders.

### 4.4 Speed registers

Characters speak at more than one speed. The Bard is the model (ruled Sep 27):

| Register | Where | Reference |
|---|---|---|
| Public, and when angry | Anywhere | Captain Barbossa |
| At home, relaxed | Home | Ian McKellen |
| Fishing, in nature | Outdoors | River Phoenix, as in A River Runs Through It |
| Recording everything | Archive | Beta-tape archivist |
| Always under these | | Porthos volume, D'Artagnan romanticism, coach enthusiasm |

Elio kept an honest label: the film's Paul Maclean was played by Brad Pitt. "Coach-Demonstrator" posture for the Bard was proposed, not ruled.

Other registers: the Teacher's three modes (patient, firm, glacial); Brim mimics the last speaker; Ragana has a default and a rare second (see posture). Time of day and kilt state also change speech: kilt ON means full Scots, kilt OFF none, never explained (ruled Sep 14).

### 4.5 Posture register

The **Posture Register** (a non-verbal dialect system indexed like the tone teachers, with NPCs assigned a physical dialect like a voice profile) was **Proposed** on Sep 27. The client did not answer it directly; she asked for the roster session instead, where posture was applied per character. There is no register spec yet. Ruled posture so far:

| Character | Posture | Status |
|---|---|---|
| The Host | Patrick Stewart | Ruled Sep 27 |
| Ragana | Weeza default (compact, cardigan as armor); Maleficent rarely | Ruled Sep 27 |
| The Bard | Coach-Demonstrator (shows, never describes) | Proposed |
| The Catalyst | Economical mover, every gesture ends in a pour | Proposed |
| Lozen | Boxer's economy, dropped center of gravity | Existing in dossier |
| Others | | Open; the roster session paused after four characters |

Posture notes already live in animation prompts (slot: idle motion, key gesture, behavioral tells, how the character moves). Celebrity softening rule: evoke presence through posture, costume and gesture.

### 4.6 Voice laws

- **Voice Constancy Law:** one voice per role everywhere (ruled Sep 25).
- **Speech bubbles are the Inn's trigger language** (ruled Sep 10). More triggers are written as they appear.
- **Cadence, not face.** Casting laws are in 1.1.
- **Spoken Road** (voice input): see the audio part.

### 4.7 Where it lives

`docs/zone_specs/geode_inn_voice_block_registry.md` (87 KB, Parts 1 to 6 and batches); `docs/library/data/dialogue_voice_block_sync.json`; `docs/geode_inn_regional_voice_profiles.md` (named as a source); `docs/library/audio/audiobook_production_spec.md` (74 profiles); Base44 Dialogue entity.

### 4.8 Open

Posture Register spec; the voice-block gap list; Dialogue entity absent from the live app; the Elio "Inn voice" is not an NPC (it is the system); Elio's own dossier is owed.

### 4.9 How the voice system began (Aug 21 to Aug 31)

The seven-field block in 4.1 grew out of an earlier, simpler profile. The early version still explains many numbers in old documents.

**The first profile (Ruled, about Aug 21 to 22, early chat).** A voice profile has two layers. Cadence is how the text appears: speed, rhythm, pauses, font treatment. Tone is the instrument or frequency that plays under the dialogue. "Everything vibrates at its own frequency." Each profile held about eight to ten numbers:

| Field | Meaning | Example from the early documents |
|---|---|---|
| `text_reveal_speed` | Milliseconds per character | The Host 45 ms |
| `pause_between_sentences` | Milliseconds | The Host 1200 ms |
| `pitch_baseline` | Hz | The Host 100 Hz |
| `instrument` and `instrument_frequency` | Tone, about equal to the pitch | The Host: sustained cello |
| `expressiveness` | 0 to 1 | The Owl 0.2 |
| cadence class | Named pattern | overflow, deliberate, clinical, measured-stone, flowing, feast, level, orbital |

- **Scale and map (August canon).** Expressiveness runs from 0.1 (Charon) to 0.8 (the Catalyst). Deeper voices at 100 to 120 Hz are anchors and keepers (the Host, Charon, Medusa, Erik). Higher voices at 150 to 220 Hz are perceivers and growers (the Catalyst, the Siren, the Cartographer). The 42 Hz Song sits below all of them.
- **Other examples (August canon).** The Owl: about 105 Hz, one word per heartbeat (1200 ms pause), 0.2, bodhran heartbeat. The Constant: about 115 Hz, about 70 ms, 1500 ms pause, 0.2, bull lyre, orbital. The Guest: about 115 Hz, about 50 ms, 700 ms, 0.45, music box. The Astronomer: about 125 Hz, violin (25 ms when deducing, 65 ms when contemplating). Nyx: about 190 Hz, harmonica (30 ms and 0.8 for her midnight voice, 60 ms and 0.4 for dawn). The sky captain: about 95 Hz, 1200 ms pauses, 0.15, ship's bell. The Pirate: bodhran at about 130 Hz. Erik: about 100 Hz, taglharpa, booming and warm.
- **The Siren has two profiles (Ruled, early chat).** Outer voice: flowing, cello, fast reveal. Inner voice: deliberate, piano, slow reveal. The player sees the text slow and the instrument change when she drops from performance to honesty. The Shifting Man is the only "flowing" cadence in the game.
- **Cthulhu (now Naut) has a binary voice (Ruled, early chat).** Spectacles on is the calm register, spectacles off is the irked register, nothing between. Cleaning the spectacles is the held breath between them.
- **Rule: measurable data only (Ruled, early chat and commit log, Aug 23).** No voice cloning. Actor names are direction references and were removed from profiles in the Aug 30 audit. Any future text-to-speech must be an original voice with no fine-tuning on a reference performer.
- **Tools (Built, commit, Aug 23).** `tools/voice_profile_extractor.py` (one clip to a Godot-ready profile: pitch, tempo, pauses, speaking rate) and `tools/batch_extract.py` (a clips folder plus manifest to `all_profiles.json`) use Librosa. The plan was real analysis for 10 to 15 major characters and hand estimates for the rest. Both files are in the repo.
- **Godot resource (Built, commit, Aug 23 to 24).** `godot_project/scripts/geode_inn_voice_profiles.gd` held 20 profiles at first, then 22, 23, 25, 26 and 27 as the Astronomer, the Constant, Nyx, the Guest and the Keeper/Owl were added. Helper functions: `apply_to_dialogue()`, `apply_to_character()`, `get_sway_period()`, `get_song_frequency()`. The reference doc is `docs/geode_inn_voice_profile_translation_reference.md`.
- **Hook words (Built, commit, Aug 24 and Aug 30).** The hook word (verbal fingerprint) per NPC started in the Aug 24 voice-profile template. On Aug 30 a catalog of hook words was committed for 29 NPCs with 35 dialogue entries, and the merged dialogue database held 46 entries for 29 NPCs. On Aug 31, 18 dialogue trees covered 21 NPCs (1,353 lines).
- **Regional accents (Built, commit, Aug 30).** The Regional Voice Profiles doc assigned an accent to each zone group: Norse (accents set per NPC), Slavic (Russian), China (Mandarin), India (Bengali), Egypt (Egyptian Arabic), Peru (Andean Spanish), Greece (Greek), Mesopotamia (Iraqi Arabic), Bayou (Cajun) and Camelot (Celtic British). File: `docs/geode_inn_regional_voice_profiles.md`.
- **Hybrid dialogue (Proposed, early chat).** Base game is text plus tone. An AI-assisted voice is a possible premium feature (the Catalyst's bar already has a free dialogue tree and an AI natural-language premium). A few recorded human lines (5 to 10 per major character) were meant only for key moments.
- **Animation translation (Ruled, early chat).** Expressiveness maps to facial animation intensity, pause length to stillness frames, reveal speed to subtitle timing. The 50 BPM canopy sway maps to "slow rhythmic swaying throughout the environment".

**Signature words (August canon, Before the Song).** Several characters own one word. This is the older form of the hook word.

| Word | Who | Note |
|---|---|---|
| "Adequate" | The Crone (now Ragana), also the Owl | Highest and only compliment. The Master Storyline says the Crone's most valuable currency is "Better" instead |
| "Good" | Leonardo, the Retort | Said about devices and people that connect |
| "Enough" | The Cook | |
| "Familiar" | The Constant | |
| "Oh" | The Constant, with the cabbit | |
| "Stay" | The sky captain | "Good hands. The ship needs good hands. Stay." |
| "...Go lightly." | Anubis | Verdict at the scales |
| "...There you are." | Charon | Ruled early (about Aug 21): he always says it |

The Owl also answers a truly cosmic question with the number "42", rarely (about 2 to 5 percent), with no explanation and no smile (Ruled, Aug 21, requested by the client). Einstein is the only character who speaks plain, complete dialogue (847 words, once), per Before the Song. Every other character speaks through nature: fragments, pauses, instruments, gestures. The Crone's closing line in margin notes is "I am going to bed". See "To reconcile" for the conflict with the later hook words ("Sit." for Ragana).

---

## 5. Character laws

Each law below has a date and status. Where a law is only in the chat and not found in the repo, that is marked.

### 5.1 Laws about people

| Law | What it says | Status | Source |
|---|---|---|---|
| **Parental Gate** | TJ and Gabby are designed but dormant. Voice blocks and appearances stay unreleased until both parents give a go-ahead. No children appear on the Campgrounds level without it. | Ruled Sep 10 | Source Map, voice registry |
| **Child-Actor Law** | Children are never cute-ified; always earnest. Kill test: if a line works with a laugh track, cut it. The spirit extends to animals and ducks: played straight, no winking. | Ruled Sep 10 | voice registry gap list; comics scripts |
| **Bicker Law** | Da Vinci and Tesla bicker constantly in an ambient speech-bubble loop that never resolves. Newton and Einstein are the Fond Pair. Elocution Corner (Higgins-register and Lina-register NPCs) joins the Bard and the librarian in a four-way argument. | Ruled Sep 10; corner agreed Sep 25 | Sep 10, Sep 25 |
| **Bickering Pair** | Catalyst and Molly: she grows, he dares; "the Napkin" and "the Farmer"; never seen angry. | Ruled Sep 16 | Molly dossier |
| **Recurring-figure law** | A face that recurs uninvited across zones and line registers is load-bearing whether ruled or not. The building casts. | Ruled Oct 9 | Oriel seed |
| **Science Sidekick Law** | Every science-bearing quest-giver gets a critter sidekick. Five laws: Overhear (the NPC explains to the sidekick), Embodiment (the sidekick is its science), Honest-Failure, Census (a named individual of an existing species, no new paint line), Pairing (one sidekick per giver). | Drafted Sep 14; client ruled only the crew-anonymity gate | `docs/zone_specs/geode_inn_science_sidekick_law.md` |
| **Joining Law** | The Poker table never recruits. One always-empty unmarked chair. SIT (buy in with a pebble-class stone, never punishing) or WATCH (spectator rail with real hand and banter). First hand: Tootenkowl swears you in with four coconut clacks. Leaving mid-hand has no penalty; the chair "kept your warmth". | Ruled Sep 16 | `docs/games/geode_inn_stone_poker_poker_night_law.md` |
| **Oi Law** | Lozen deals rarely, silent; says "oi!" when rowdy; the room goes quiet; deals on. Lozen holds the final table on Inn Master difficulty. | Ruled Sep 14 and Sep 16 | Poker law |
| **Mary Poppins law** | The Wandering Archivist: a carpet bag never heavy, never empty, opening onto the Archive. Arrives by umbrella when the wind is right, leaves when it changes, never explains. Julie Andrews is the patron and a tone-teacher entry. | Ruled Sep 27; not found in repo | Sep 27-29 |
| **Zeppo Law** | Every overpowered zone needs an unpowered "ordinary courage" resident (Frank Wright at the Campgrounds). | Proposed Sep 14 | Sep 14-17 |
| **Survivor's Law** | When the story loves a character more than the outline does, the outline loses. The Cook is never killed for plot or written out for tidiness. | Ruled Sep 14 | Sep 14-17 |
| **Healers Law** | Healers never cure a resident's way of being. | Proposed Sep 25 | Sep 25 |
| **Courage principle** | Honor silent courage: NPCs whose courage is witnessed, never spoken. | Open ("Maybe", Sep 27) | Sep 27-29 |
| **Both-Names law (Bill/Duck)** | Bill on official files, Duck aloud. The Question File stays open forever. | Ruled Sep 16 | named critters spec |
| **Coin one-second law** | Molly's borrowed gold coin always reappears with the platypus, for exactly one second. | Ruled Sep 16 | Molly dossier |
| **Kilt Occasion / Dialect Law** | Staff are occasionally in kilts. Kilt on means full Scots; off, none. Never scheduled, announced or explained. | Ruled Sep 14 | Sep 14-17 |
| **Spelling law (Katija)** | Only Vaulknut says "Katija", only in direct address, and Katya never says it. | Ruled Sep 4, Sep 11 | rename ledger |
| **Beverley's Inheritance** | Beverley keeps her mannerisms; the Elio librarian role inherits the bones, not the costume. | Ruled Sep 11 | rename ledger |
| **Never-Down law** | The Flesh Wound Knight hops when any meter is low; no defeated frame. | Ruled Sep 11 | Sep 11 |
| **Silence Law (comedy)** | No comic character is stripped for drama; they pause and return. | Ruled Sep 11 | Sep 11 |
| **Hopkins and softening laws** | Eyes only for Charon and Ragana; all other features softened. | Ruled Aug 31, Sep 4 | Aug 31, Sep 4-9 |
| **Real-person privacy** | Real names stay out of canon where asked; non-storyline people may rename. | Ruled Sep 12 | rename ledger |
| **Wording rule** | No "majesty/sainthood/crown" language for the client: sign off, rule, say yes. | Ruled Sep 10 | Sep 10 |

### 5.2 Where they live

`docs/zone_specs/geode_inn_voice_block_registry.md`; `docs/zone_specs/geode_inn_science_sidekick_law.md`; `docs/games/geode_inn_stone_poker_poker_night_law.md`; `docs/characters/geode_inn_npc_oriel_seed.md`; `docs/characters/geode_inn_character_source_map.md`; dossiers. The Elio notes (For You page) hold standing decisions not yet in the repo.

### 5.3 Open

The Courage principle and the Zeppo and Healers laws need a ruling. Check the repo for the Bicker Law's own file; the chat logs place it in the voice batches.

### 5.4 Early laws (Aug 21 to Aug 30)

These laws come from the early chat, Before the Song and the commit log. None was replaced by a later ruling unless a note says so. Where a later law covers the same ground, the later law wins.

| Law | What it says | Status | Source |
|---|---|---|---|
| **Honest core** | The Inn strips terrifying mythological figures to an honest, working-class core: the Morrigan is a washerwoman, Charon a ferryman, Cthulhu (now Naut) a scholar with spectacles, Cerberus a dog named Spot, Hel a caretaker of the dead. The "villain" is the one who cares most. | August canon (Elio's rule in the profiles, about Aug 21; no explicit ruling) | Early chat |
| **Story seed rule** | When someone tells the Catalyst a story, she forms its essence into a seed and plants it when no one watches. Weeks later a vaguely familiar plant has appeared, in the color of the player's drink. | Ruled, about Aug 21 (client: "Yes!") | Early chat |
| **Drink rule** | Drinks are earned with stories, not bought. Short version is a free dialogue tree. Long version is an AI conversation (premium). The Drink Journal records name, date, zone, the story and the effect. "Listening is the core mechanic, acceptance is the reward." | Built into the Catalyst profile, about Aug 21; premium tier August canon | Early chat, Before the Song |
| **Anti-FOMO Host** | The Host holds the space and never hurries. "The Inn is a habit, not a conquest." The sanctuary rule is kept with quiet authority. | Built (commit, Aug 22) | Commit log |
| **Chaos stops at death** | Brim (then Mim) never crosses Hel's boundary. Chaos ends at the dark blue death screen. | Proposed (written into the Mim system after the client's request, about Aug 21) | Early chat |
| **Daily mischief** | Brim, as a companion, causes harmless chaos at least once a day (a drink changes color, a path rearranges, a stone is suddenly a different stone, a gargoyle hums the wrong note for three seconds). | Ruled, about Aug 21 | Early chat |
| **Brownie contract** | Brownies are contractors, not servants. The one-page constitution is the contract and the nightly offerings are the terms. Leaving them clothes or livery is the offense. Breaking the routine can turn a Brownie into a Boggart. Details in 9.8. | Ruled (client concept), Aug 22 | Early chat, Before the Song |
| **Keep-Folk rule** | Keep-Folk are bound to a castle. They thin and fray while it is ruined, and grow plumper and more opaque as the player rebuilds. A whole castle makes them hum at 42 Hz. | Built into the Keep-Folk profile after the client's request, about Aug 21 | Early chat |
| **Quiet courage of the Seelie King** | His only trigger is cruelty to the innocent and small. He does not fight, he "concludes". His one court rule is "be kind to small things". | August canon, Aug 22 | Before the Song |
| **Rush law (Naut)** | Rush triggers: mishandling a rare book, willful ignorance, disrespecting the archive, cruelty to small things. The tell has three stages: tentacles, spectacles, voice. The eruption fits the offense and ends at once. | August canon, Aug 22 | Before the Song |
| **Raven volume law** | Huginn and Muninn mutter at the edge of hearing. Not subtitled by default. With subtitles on, their lines appear in smaller italic. "Both experiences are correct." The player who ignores them loses nothing. | August canon, Aug 22 | Before the Song |
| **Laughing One is played for joy** | The Laughing One is never played for pity or tragedy. It cannot be saved. The player can only sit with it (two minutes, first person, no camera). Dissolution is environmental, not erasure. | August canon | Before the Song |
| **Madame's one sincerity** | Brim (then Madame) shows empathy once, only in the In-Between, at full size, speaking no words there. In the colored Inn it would turn into theater. | August canon | Before the Song |
| **Bartender's request** | The Bartender (not a quest, not the player) sends Madame into the In-Between with one request: "They're in the grey." | August canon | Before the Song |
| **Poe plays himself** | Edgar Allan Poe has no reimagined face: gaunt, dark eyes, mustache, worn black coat, candle. Davy Jones is not a character; he is the Locker, the ocean personified only by the tide. | August canon | Before the Song |
| **Portal characters** | No glowing portals. Eight characters move the player (the Pirate sails, Charon poles, the Guest walks, the Owl gives one word, the Cartographer gives a map, Belladonna walks, the Stone Circles hum, Naut describes from memory). A portal character takes the player only where they have a reason to go: "the reason is the permission". | Built (commit, Aug 24); Before the Song for the overlaps | Commit log, Before the Song |
| **Muse mapping** | Each major character catches a Muse: Crone = Clio, Brim = Thalia, Siren = Terpsichore, Guest = Melpomene, Astronomer = Urania, the composers = Euterpe, the Persephone and Hades cycle = Erato, the staircase = Polyhymnia, the narrative spine = Calliope. | August canon | Before the Song |
| **Companion creature pillar** | Every region and zone has a named companion creature that travels with the player for a stretch ("you don't bond with systems, you bond with creatures"). | Proposed Aug 20; client replied warmly, no objection | Early chat |
| **Real-person NPCs** | Some NPCs are based on real people and pets, from supplied photos. In-game names and roles only in builder documents. | Ruled Aug 20 (photos not delivered by Aug 21) | Early chat |
| **Real person is a player slot** | A real person who plays is a player or login character, not an NPC. All NPC references to the real name were replaced. | Ruled (commit, Aug 30) | Commit log |
| **IP-safe names** | No book or film character names in NPC names. No actor names in voice profiles. | Built (commit, Aug 30) | Commit log |
| **No lethal combat, no death** | Combat is harmonization. Enemies appear distorted, the right frequency clarifies them and they join the Inn. Retreat is nook recovery. Combat belongs to the systems part. | Ruled early (Aug 22); restated in Before the Song | Early chat, commit log |
| **Frog moderation** | Community moderation is a frog transformation, not a report button. Three transformations lead to suspension. The Duck is never "frogged". | August canon | Before the Song, early chat |
| **Two-century rule** | History is shown on its own terms, in its own language. Beyond two centuries back the record is neutral: "We do not interpret. We preserve." | August canon | Before the Song |

Open from this window: the Courage principle looks like a later form of the Quiet courage law above, and the Healers Law (Proposed Sep 25) is a close cousin of the Honest core law. Neither link is confirmed.

---

## 6. Playable classes and progression

### 6.1 What it is

The default playable classes are character archetypes tied to cast members. A starting class is chosen at the start; the room key shape tells the class (no class-select screen; ruled Sep 10, D01: the Artisan's key bent like a bezel, the Bard's key slightly wrong for every door).

### 6.2 Class template

Taken from `docs/geode_inn_playable_classes.md`.

| Field | What goes here | Example (Artisan Thief) |
|---|---|---|
| Inspired by | The cast member | Vaulknut |
| Frequency | Primary and secondary | Water, Fire |
| Role | One line | Rogue, crafter, redistributor |
| Core stats | Presence, Resonance, Cadence | 3, 4, Immediate |
| Class abilities | Named abilities with cost | Redistribute; Stone Lore; Wire-Wrap; The Apron IS the Skin |
| Class quest | Name and reward | "The Mirror and the Shore"; reward the Silica Thread |
| Playstyle | Short description | Redistribute, do not overwhelm |
| Frequency tilt | Mana type | Water and Fire |

These stats are written for the card game. The cards part owns the card versions.

### 6.3 Current canon

- **The five default classes** in the repo file: Sentinel (Lozen), Artisan Thief (Vaulknut), Siren (Katya), Pirate (Zeke), Bard (the Bard).
- **Also described as classes elsewhere:** Chameleon Druid (Charles), Tinkering Weeaboo (changeling class, seated at Clockwork Skies), Librarian (Ragana, in the Source Map). Companions (Eres, Duck, Ziggy) are not classes; they accompany any class.
- **Artisan Thief details (ruled Sep 3 and Sep 11):** selkie who chose the land; the apron is the skin; works in the Tidal Caves using the tide as a lathe; raven doctor-mask register stands.
- **The Unvoiced (ruled Sep 17).** Advanced class unlocked from the Rogue path (Artisan Thief) at level-up. Frequency-feeding bat-type order; the Shadow Knights are the order. Born unvoiced; borrows sound to speak and spends carried tones to travel ("pouf" teleport, only where the song reaches). Two registers: rogues skim tones until a zone goes silent (their crime is silence); the trained register skims overtones so zones ring cleaner. Failure retunes, never kills. The duo: the Tuner (Whistler figure) and the Daywalker (Blade figure); names open. Ambassador: Ampulla (Sep 25). Spec: `docs/zone_specs/geode_inn_unvoiced_shadow_knights_class_spec.md` (commits daf3c0b, 66e1006). Remaining gates: duo names, roost, rogue name, the pouf word, gargoyle treaty (Listener at 64Hz), unlock threshold. Card flipping (fed and hungry faces) was floated, not ruled.
- **Playable race:** red-headed giants (ruled Sep 14), a construction buff; they built the Stone Circles. Proposed rules only.
- **Merlin** as a playable merman and aquatic shapeshifter (ruled direction Sep 25; form list, ceremony and mechanic name open).
- **The Mason game** (player is a master Mason who time-travels; ruled concept Sep 22): see the games part.
- **Progressive Lean** (ruled Sep 19): characters can be given, earned or chosen forms (Mona as Sitter, Witness, Saint; the Shift Arc for Artair).
- **Player-character shelves:** Vaulknut and Lichenblossom are player-character portraits for the client and a friend; FOLIO and Greg are reserved slots.
- EchoMemory and the charm bracelet (progression records) belong to the systems part.

### 6.4 Open

The class count (five, six, or more); Charles playable or NPC (see section 8); Unvoiced gates; Merlin gates; giant design session.

### 6.5 How the classes began (Aug 21 to Aug 30)

**The first six (Ruled, Aug 21, early chat).** The client supplied tabletop character sheets for five classes and Elio built them as the Festival questline classes: the Artisan Thief, the Librarian Crone (now Ragana), the Bard Blowhard (now the Bard), the Tinkering Weeaboo and the Chameleon Druid. The client then added a sixth, the Sentinel (now Lozen's class). The Sentinel is Full Presence tier, not chibi, and "not tall". Elio made that a rule: compact build, low center of gravity, intimidation from intensity not size. The class doc says the sixth was "chosen" rather than inherited. The five classes were meant to be unbalanced on purpose, so that their differences create social friction.

**Early stat sketches (Ruled as a direction, Aug 21).** The tabletop stats imply personality as mechanics (broad against situational intelligence, situational ethics, maintenance as a resource cost, capability potential as a growth curve, temporary stats that decay).

| Class | Early stat sketch |
|---|---|
| Artisan Thief | Nimble fingers, low charisma, high dexterity. Strong at mini-games and crafting, weak at NPC diplomacy |
| Bard Blowhard | High temporary charisma, taunt, enrage (+2 strength, -4 intelligence, -2 loyalty), high broad intelligence, low situational intelligence, high temporary agility |
| Tinkering Weeaboo | High dexterity, low tolerance, high intelligence, low charisma, situational alpha |
| Librarian Crone | High intelligence, low empathy, high maintenance, low resistance to enrage, high situational ethics, high capability potential |
| Chameleon Druid | High versatility and dexterity, low tolerance and endurance, high intelligence, low resistance to taunt |
| Sentinel | High dexterity, intelligence, perception, intimidation and defense; low approachability; moderate endurance; low surface charisma over a hidden warm core |

Class interactions are social. The Bard's enrage and taunt hit the Crone and the Druid. The Tinker's low tolerance clashes with the Bard. The Thief cannot sell her own work. Elio's recommended build order was five phases: define the classes, build Taunt and Enrage, build Zone Affinity, build the Stance System (the Druid, the hardest), build Social Dynamics (August canon).

**The Sentinel's kit (August canon, Aug 21 to 22).**

- **Quick Read:** analyzes any NPC before the first word, so dialogue trees open differently for her.
- **Faceted Defense:** layers that absorb hits in combat and make NPCs pass several trust checks in conversation. You earn passage; you do not break through.
- **Iron Stance:** a permanent boxing posture. The class doc says immune to knockback and stagger; the character page says a wide stance that cannot be moved, so pushing roots her more. Treat them as one ability.
- **Presence Aura:** on first meeting NPCs see her as physically larger. On the second meeting the perception corrects and the confusion cracks their defenses, opening dialogue paths other classes do not get.
- **Counter-Strike Precision:** low damage, perfect timing, scaling with how long the stance was held.
- **The Cosmic Riddle (hidden trait):** the only class that can answer the Owl's cosmic questions without rolling. The answer is love, loyalty, knowledge, and she must choose to lower her layers.
- **Playstyle:** gatekeeper. Dodge, read, counter. Interactions: the Bard's taunt is immune at the surface layer and effective once her core is reached; she pairs with the Artisan Thief (the Thief makes, the Sentinel guards), anchors the Druid (her loyalty covers his low endurance) and can hold space during the Tinkering Weeaboo's Level 4 fracture by standing near, with no words.
- **Concept art:** `sentinel_concept.png` (Aug 21), in the repo at `docs/gallery/characters/sentinel_concept.png` and `docs/drive-recovery/images/characters/sentinel_concept.png`. Files in the repo: `docs/characters/geode_inn_character_class_sentinel.md` and `docs/drive-sync/geode_inn_character_class_6_sentinel.md`.

**The Tinkering Weeaboo meter (Ruled, early chat).** A changeling who shapeshifts when annoyed enough, on an annoyance meter of Levels 0 to 4. Level 1: fingers too long, eyes too yellow, tinkering faster. Level 2: grin too wide, limbs too long. Level 3: the full true form (better at tinkering, extra reach, three tools at once, machines may do something unexpected). Level 4: the form fractures into multiple shapes and machines break. Companion protocols at Level 4 are scripted: the Crone reads in a steady voice, the Bard jokes until the grin shrinks, the Artisan Thief places a heavy stone in her hands, the Druid shifts with her, the Sentinel plants herself near. Pomegranates replace the apples of the source character, and the seeds stain the fingers red. **Earlier (Aug 21 to 22, early chat and commit log):** Level 0 was first written as human-passing; the client changed it to the changeling's real, settled form (Level 0 is the body, not a costume). Every level settles back to it.

**The Artisan Thief (Ruled, early chat).** A selkie whose human form is a feminine version of a dream-lord figure. The Dive ability opens the underwater traversal layer without equipment. The apron is the selkie skin (tied on is maker, untied is seal). She chose the land after finding a labradorite that held light. Low charisma: "the sea doesn't sell".

**The Siren and the Pirate (Ruled, early chat).** The Siren is a musician, not a monster; her song tells people the truth they avoid; she heals everyone but herself. The Pirate is the Dread Pirate Roberts as a title passed on, drummer, the Inn's heartbeat. The Bard and the Pirate are best friends (the client corrected Elio, who had first paired the Pirate and the Druid). Their endgame: the title passes to a player who is "seen", not through combat.

**The Chameleon Druid (Ruled, early chat).** The Inn calls him by the plain name Charles. High versatility (beast form in the Fae Kingdom, stone in the catacombs, root in the garden), low endurance (a finite reserve that no longer refills fully). Shifts are subtle and organic, no flash. The Inn does not cure him; it holds the space (the rest chair, the garden, the Inn-Tree roots).

**What the commit log fixed (Built, commit, Aug 24).**

- A six-stat system: MIGHT, FINESSE, INSIGHT, PRESENCE, VITALITY, RESONANCE. Fourteen archetypes (Warrior, Hunter, Rogue, Mage, Wizard, Cleric, Druid, Necromancer, Bard, Paladin, Warlock, Monk, Ranger, Artificer). 66 characters mapped. No character has MIGHT 10 or FINESSE 10; INSIGHT is the most common perfect stat (nine characters); RESONANCE 10 is rarest (two characters).
- Five default classes: Sentinel (Tank/Protector; root and stone), Artisan Thief (Rogue/Crafter; water and fire), Siren (Support/Buffer; water and song), Pirate (DPS/Mobility; water and fire), Bard (Utility/Info; fire and root). Each has core stats, four abilities, a class quest, an alchemical chain of progression, a companion and multiplayer synergies. A coded-name trigger unlocks a Bard ability at Level 10 and up. **Charles is the NPC exception.** An earlier set (Aug 21) had six classes from the Festival questline.
- Class quests named in Before the Song: the Siren's "The Mirror and the Shore" (reward the Siren's Mirror), the Pirate's "The After" (reward the Compass That Points Forward), the Sentinel's ten-quest questline "The Sentinel's Vigil" (Built, commit, Aug 30).

**Open from this window.** The roster in Before the Song lists seven class characters plus the Sentinel as "other", which contradicts the "six starting classes" and the Aug 24 five-class list. Counting rules differ in each source; see item 6 in section 8.

---

## 7. Critters and creatures

### 7.1 What a critter is

A critter is a living thing that is not a named NPC: the Inn's ambient life, its immune system and housekeepers. Each has a level frequency, a job, and tri-mode art. The roster for critters is separate from the character roster (`CRT-NNN` IDs to `CRT-060` as of Sep 26; the older roster lists 82 unnamed critters).

Boundary law (Sep 10): the **Critter Roster** holds the ambient life; the **Named Critters** spec holds the animals that carry story. Each named critter touches at least three systems and another critter's arc.

### 7.2 The laws

| Law | What it says | Status |
|---|---|---|
| **Species Law** | The critter roster is the egg-pool species index. Each zone's critters are both ambient life and a hatchable pet pool: one census, two jobs. Gated rares tie to achievements or entry path. The Community Hatchery stays separate. | Ruled Sep 11 |
| **Census Law (three jobs)** | A sidekick is a named individual of an existing species. One census: ambient, pet, sidekick. | Drafted Sep 14 |
| **KIT-C** | The critter census added to the Room Kit Law. Zone image sessions follow the Room Kit formula; critters have their own census row. | Ruled Sep 11 |
| **One home entry per species** | Zones, storylines, life stages and helpable encounters point back to one entry (young mummy cat in Tomb Tunnel and the Catacombs are one family). | Ruled Sep 22 |
| **Cub Layer** | Hidden young of all mythological critters that are game characters. Found by patience, never chasing. Griffin cub first. | Ruled Sep 19; four gates open |
| **Foundling Register** | One young, temporarily stranded critter per game area; the player's role is companionship. Anti-Skinner, No-Fail, Honest Label. Four-step spine: stranding, feeding, guiding home, arrival. | Filed Oct 14 |
| **Murloc rules** | Murlocs are nameless by design (Squeak exception). Adequacy Law. Gargle is the drum-circle bass line. | Ruled Sep 11 |
| **Age Law (gargoyle pups)** | Pups for six centuries; graduation, not loss. | Ruled Sep 11 |
| **Migration class** | Painted kittens move to warm spots. | Ruled Sep 11 |
| **Lineage law** | Family animals enter the Inn as themselves and are taken seriously. | Ruled |
| **Cast law (named critters)** | Named critters are load-bearing characters, not pets or mascots. | Ruled Sep 10 |
| **Bob Doctrine** | A new critter is "Bob" until it earns a name. | Ruled Sep 18 |
| **Sidekick pairing** | One sidekick per science quest-giver. | Drafted Sep 14 |

### 7.3 Tier sheets (how critters are painted and animated)

- **Class master first, recolors after** (REC law). Recolor classes: one kitten sheet gives all eight kittens; one puppy sheet gives six frequency pairs.
- **Sprites are crunched from painterly masters:** 1024 px master to 64-pixel sprite, 32-color palette; never generated small.
- **Tier 1:** 11 sheets, 4-frame cycles (hearth pixie, dust mote, hearth salamander, candle salamander, bookworm, stone mouse, glowworm, stone snail, dew sprite, and the named movers). Fizgigs recolor six ways.
- **Tier 2:** 25 cycle sheets, 6-frame, 50 assets with 84Hz shadow twins made by the scripted spectral shift (never hand-tinted). Water, flying and ground families.
- **Tier 3:** arcade sprites for 11 live games (sheeted, some neutral sheets needing crop).
- **Movement:** 207 animated elements (45 NPCs, 82 critters, 80 environmental); Tier 1 is about 50 elements; 14 painted movement classes.
- Missing art as of Sep 12: Axolotl, Mantis Shrimp and Rain Frog have specs but no tri-mode art.

### 7.4 The critter template

Ambient critter (from the roster tables):

| Field | What goes here | Example |
|---|---|---|
| ID | Zone letter plus number | M13 |
| Critter | Name | Marginalia |
| What it does | Behavior | Main Floor cat; answers to "Margin" |
| Vibe | One line | |
| Tri-mode | Living, Shadow, In-Between art status | |
| Egg pool | Zone pool membership and rarity gate | Moss Fox: Owl Watch finishers only |
| Home entry | The one entry point (rule 7.2) | |
| Kit status | KIT-C row | |

Named critter (from the Named Critters spec):

| Field | What goes here | Example (Ziggy) |
|---|---|---|
| Zone | Home zone and roaming | Clockwork Skies |
| Species and name | Real species, ruled name | Crested gecko, Ziggy |
| Storyline | Arc in one paragraph | The extinct creature who returned |
| Mechanic | What it does in play | Counts the player's returns, shown never spoken |
| Threads | Novel, games, movement, camera, other critters | In-Between game recognition scene |
| Tri-mode | Living, Shadow, In-Between | Crest down in Shadow |
| Voice | | Danny Kaye patter |
| Weaves into | | Brim's shoulder duo |

### 7.5 Current canon

#### The named critters (Sep 10 spec)

1. **Bill the Duck**, Crystal Gardens: a platypus everyone calls a duck; the honest thief (ruled Sep 11).
2. **The Fizgigs**, Canopy City boardwalk: the builders; overalls and wrenches; Ember and Spark are the hearth pair. "Fizgig" is an umbrella term; Grit is not a fizgig and not a brownie (ruled Sep 11). Bob is the Pope-Hat Fizgig (ruled Sep 19).
3. **The Brownies** Brindle, Cobble, Thatch: maintenance trio, group ladder, coconut-shell percussion in Poker Night.
4. **Eres the Vessel**, Cosmology: the cabbit who is secretly the Annunaki's ship (ruled Sep 10).
5. **The Ravens** Huginn and Muninn: the visible seam of Odin's dual identity.
6. **The Owls**: the bloodline Owl and the real owls.
7. **Ziggy**, crested gecko (ruled Sep 10).

#### Other named individuals

- **The Named Two:** Echo and Mais Oui, gargoyle pups with dossier rows (Oct 6).
- **Gargoyle pups (six):** wander by sound, nap where their frequency is strongest; names pending. Adults: Watcher (111Hz), Listener (64Hz), Sage, Gatekeeper, Caller, Keeper.
- **Dragon kittens (eight):** Tier 1 movers; one per warm spot (Common Room fire, Main Floor hearth, Archive nook lamp, Meadery still, Ragana's hearth side, Glassblower furnace). Joe's painted cat-dragons are the same family in his keeping (47 in his shop).
- **Marginalia (M13), Pluck** (chicken-dancing fossil rat, Bone Room), **Bob** (pope-hat goblin of The Royal; all interns there are named Bob), **Ziggy**, **Unless**, **Bloop**, **Tumble**, **Squeak**, **Hearth-Hound**, **Screamer**, **Creepy Little Bobs** (dolls), **Fortune Cookie** critter (Sep 20), **Limner** (three-handed storyteller glitch, kept, Sep 11), **Judge Tootenkowl**.
- **Mini-Inn cast candidates (Oct 8):** skeleton rubber ducks, death-mask hooded ducks, baby Mothmen (cheebies), Viking gnomes. Which become in-game canon is not ruled.

#### The three named groups (ruled Oct 14)

| Group | Who | Notes |
|---|---|---|
| **Greeblins** | Malachi's goblin minions | Run the Lost and Found, mail, and slide-landing pillows. Labyrinth goblins carry vials with the Bone Mail Crew (ruled Oct 9) |
| **Moppets** | The dolls | The Dollkeeper's Register; "The Facing" horror register (Oct 1); every doll is "Creepy Little Bob N" |
| **Kindlings** | The elementals throughout the world | Elemental critters; Campgrounds fire-sprite is a candidate foundling |

Portraits for all three are queued (the "cute critter batch").

#### Foundling Register (filed Oct 14; working title)

Little Rock Biters (Deep Roots, eat stones; geode bite hums at 40Hz); Baby Stars (Cosmology; need a flying NPC to coax); Baby Venus Flytrap (Impossible Garden; speaks for the garden). Candidate seats, unruled: Campgrounds kindling, Fae fledgling, Water tidepool straggler, Staircase hub child, Undercity.

#### Ambient critters by zone

- **Cosmology (C1 to C12):** Star Sprites, Moon Moths, Comet Geckos, Nebula Jellyfish, Asteroid Beetles, Void Wisps, Constellation Spiders, Chrono-Ticks, Solar Flares, Gravity Wells, Astral Moths, Planetseed Pods.
- **Main Floor (M1 to M5, M13):** Ember Mice, Moss Pigs, Mead Bees, Ink Sparrows, Copper Frogs, Marginalia.
- **Other levels:** Campgrounds (firefly wisps, wood sprites), Canopy City (cloud squirrels, leaf-surfing beetles), Staircase (salamanders, undines, sylphs, gnomes), Catacombs (micro-fossil motes, bone beetles, the catacomb choir), Undercity (crystal-shrimp, iron-filing insects), Water (plankton-lanterns, pressure fish, abyssal jellyfish), Fae (fae-fireflies, mycorrhizal sprites).
- **World map:** each zone has six critters and an egg pool with one rarest hatch. Transylvanian Forest (F1 to F6, Moss Fox rarest), Norse Coast (N1 to N6, Glacier Mouse seasonal), Stone Circles (S1 to S6, Standstill Moth on an 18.6-year cycle), Celtic Highlands (Heather Hares, Bog Wisps, Ink-Starlings, Bog-Oak Beetles, Mist Sheep, Limner's Wren).
- **Hollow Earth (54 critters, 9 districts, `HE1` upward):** for example Hum Mite, Chime Spider, Lamp Moth, Glass Snail, Rehearsal Mouse, Vane's Fox (District 1, North Path gated); Tally Sparrow to Lost Magpie (District 2, Lost-chain gated); through to Songbat and Vigil Rat (District 9). Entry-gated triad: Vane's Fox (North), Ship's Cat (South), Songbat (Deep).
- **Tier 2 families:** water (glow fish, lantern jellyfish, pearl crab, reed frog), flying (rafters bat, candle moth, pond dragonfly, wild raven), ground (moss hedgehog, rune beetle, moss turtle, crystal lizard).

#### Creatures with their own censuses

- **Water monsters:** 32 originally, 78 in the bestiary (each with origin country, one of seven Deep layers, an instrument), 110 mentioned Sep 2. The Lore entity holds 1,268 mythological creatures across 191 countries.
- **Cryptid Bestiary:** 48 cryptids (Living and Shadow, 96 images). 92 creatures with 276 tri-mode images (Aug 31).
- **Shadow echoes** (16 recovered Shadow zone pieces) are zone creatures, not critters.

### 7.6 Where critters live

GitHub: `docs/geode_inn_critter_roster.md`; `docs/zone_specs/geode_inn_critter_roster_master_spec.md`; `docs/zone_specs/geode_inn_named_critters_master_spec.md`; `docs/zone_specs/geode_inn_foundling_register_master_spec.md`; `docs/zone_specs/geode_inn_science_sidekick_law.md`; `docs/zone_specs/geode_inn_fortune_cookie_critter_spec.md`; `docs/library/bestuary/geode_inn_tri_mode_roster.md` and `geode_inn_shadow_bestiary.md`; `docs/geode_inn_critter_image_urls.md`. Base44: Lore entity (creatures, waterCreatures arrays in staging); Egg entity for hatching; Dialogue entity for critter voice signatures. Drive: "Inn Generated Art".

### 7.7 Open (critters)

Foundling series name and member names; flying NPC coax roster; the critter reconciliation audits (one proposed 12 additions, another eight whole zone sets; neither accepted); constellations as creatures (simmering); Quimbaya golden flyers' five gates; Greeblin, Moppet and Kindling portraits; names for the six pups; Axolotl, Mantis Shrimp, Rain Frog art; whether Bast's 17 kittens enter a tier; which mini-Inn critters become canon.

### 7.8 Early critter canon (Jul 22 to Aug 30)

**Where the critter idea started.** The first companions were the Cabbit, the baby dragon, the Owl and the ravens. The Aug 20 pillar (every zone has a named companion creature; Proposed, no objection) turned them into a system, and Elio told six sub-agents to give every zone a named creature. The Aug 20 blueprint listed seeds: the fox that crosses your path (Threshold), something that follows you home (Summerlands), a dark, loyal, ridiculous creature (the Hollow), a Pacific Northwest raven, a Plains trickster coyote, the cats of Bastet's Herding, Huginn and Muninn, the baby dragon, the Cabbit, the brownies and Grit, a clockwork pigeon, a pale cave lizard, and cave fauna (a blind cave fish as a sentient NPC, a cave shrimp to collect, an olm as a centuries-old hermit).

| Critter | Role and place | What the early documents set | Status |
|---|---|---|---|
| **The Duck** (now Bill the Duck) | Platypus, steals anything that sparkles | Client asked for it Aug 22 or later and later confirmed it is female. Not magical, not Fae. Electroreception finds stone frequencies. Steals a stone, the player follows to its stash (a mini geode cave whose stones form a chord). After 3 to 5 follows it becomes a companion: finds hidden stones, disarms dissonance, gives stash access. Duck's milk is the anti-dissonance agent. Its egg is the rarest item and hatches by care. It does not steal from Wrought. Cannot sense the Prism Portal crystal (7.83 Hz) | Ruled (early chat); biology docs `docs/geode_inn_the_duck.md`, `docs/geode_inn_the_duck_biology.md` |
| **The Cabbit** (now Eres) | Cat and rabbit that can become a pirate's ship | Client asked for the hybrid Aug 21 and added glimpses of the pirate and unexplained mischief, never explained. Elio's rule: the pirate is never a boss, cutscene or conversation, only effects (a telescope turned to an unnamed galaxy, an unearned stone, an open door, an empty case with a small crystal coin, a figure in the observatory window for one frame). It purrs at 50 BPM. Named Eres Aug 28 (commit). It is the Constant's ship-heart in the cosmology docs. File: `docs/geode_inn_cabbit.md` | Ruled (Aug 21); name Built (commit, Aug 28) |
| **The Vessel** (now Ziggy for the gecko; the title now belongs to Eres) | Crested gecko on the player's left shoulder (Brim on the right) | Declared extinct in 1866 and rediscovered in 1994 (128 years, about 18 gecko lifetimes). Holds a growing nonsense formula ("The pellet with the poison is in the vessel with the pestle..."). Never steals, only holds. Patron of the overlooked. Contrasts with the Duck (finding against holding) and with Brim (precision against chaos). Chirps "...You looked." on rediscovery, "...You went deeper." when the player finds the egg | August canon |
| **The baby dragon** | Mascot and logo; lives in the geode cave | Redesigned Jul 22 as heraldic, four-legged, backward-curving horns, gem-tipped tail, cat-like eyes (Ruled). Sleeps at 50 BPM, which the Pirate can lull. Its geode cave is the PC box for companions and a visual XP bar. Status then: not yet final as mascot | Ruled Jul 22 (redesign); August canon (cave) |
| **Huginn and Muninn** | Ravens of the Wanderer and the Allfather | See 9.8. A third raven, Poe's, says "Nevermore" | Ruled (early chat); August canon |
| **Brindle, Cobble, Thatch and Grit** | Brownies and the fizzgig | See 9.8 | Ruled Aug 21 (Grit's size); August canon |
| **Octopi** | Resident NPCs of Atlantis; pool octopi in the tidal caves | "Think like an octopus" puzzles (textural, lateral). They talk by texture. Gradient across the seven water layers: none in rain, color-changing at the surface, small curious pool octopi in the tidal caves, giant bioluminescent octopi in the deep. The Octopus Oracle rearranges stones into patterns | August canon; puzzle rule Aug 21 |
| **Murlocs** | Ambient life of the coast town | A homage to the game fish-creature sound only. They do not aggro, drop loot, swarm, talk or have names. Dock Congregation (6 to 10 on the pilings, you can sit with them), Road Murlocs (the baker puts bread out), the Lighthouse Path Murloc (the Owl says "Adequate", it gargles and leaves), Church Murlocs (three in the back pews for the warmth). Follow the selkie because she smells of the sea. Census: `docs/zone_specs/geode_inn_murloc_census.md` | August canon (Aug 29 name Built, commit) |
| **Peach and Bella** | The Selkie's cats | Bella is the black cat (assassin), Peach the orange and white fluffy one (genius). The descriptions had been swapped and were swapped back | Built (commit, Aug 30) |
| **Maine Coon colony, Savannah cats, caimans, bearded dragons, Kodiak bear, Canadian grizzly, frogs** | Ambient companions and zone animals | Maine Coon colony (Fae-capable). Savannah cats as "baby dragons" in warm zones. 14 caimans named First through Fourteenth. Bearded dragons in the Undercity. The grizzly drives an anti-tourist quest. Two or three common frogs plus one frog gargoyle | Built (commit, Aug 30) |

**Gargoyles (Ruled Jul 22; file `docs/geode_inn_gargoyle_designs.md`).** Six resonant stones that hum when the Inn's music plays. They are architecture, not characters.

| Gargoyle | Place | Hz | Look |
|---|---|---|---|
| The Watcher | Staircase | 111 | Dark stone fused into the bark, mouth open as a sound port |
| The Listener | Catacombs | 64 | Enormous cupped ears, roots through it |
| The Sage | Modern Legends nook | 528 | Carved spectacles, Thinker pose |
| The Gatekeeper (two) | Flanking the Fae portal | variable | Dark green stone with blue veins; heads slowly turn to face you, the only gargoyle movement |
| The Caller | Where the staircase opens to the cosmology level | 432 | White limestone, head back, stars carved in the chest |
| The Keeper | Above the geode cave entrance | harmonic of the most-collected stone | Small, warm amber stone curled like a sleeping cat. An empty cave gives one soft hum, a full cave a chord. The baby dragon sometimes sleeps on its head |

The gargoyles are signatures on the Golden Contract (August canon). **Proposed (Aug 20 to 21):** five gargoyle versions of the client's pets (Mais Oui as the Watcher, Echo as the Listener, Belladonna bossing the Gatekeeper position, Peach and Eres where their personalities fit). Photos had not arrived and Elio noted six roles already existed. Later canon keeps Echo and Mais Oui as the Named Two (7.5).

**Wake rules (Built, commit, Aug 29).** Gargoyle puppies (18) wake by touch. Dragon kittens (8) wake by warm offerings. Lingering is rewarded by a cross-level observation mechanic.

**The big rosters (Built, commit).**

- **Water monsters.** 32 playable in the first catalog (Jul 22), from 25 countries, each a side-scroller where you are the monster. Nessie is the prototype. Named in the chat: Nessie, Kelpie, Bunyip, Bakunawa, Taniwha, Adaro, Grootslang, Iara, Blue Men of the Minch, Selkie, Afanc, Mokele-mbembe, Ninki Nanka, Inkanyamba, Arwe, Ningen, Rusalka, Lorelei, Draugen, Tarasque, Lindwurm, Wawel Dragon, Tiddalik, Rainbow Serpent, Altamaha-ha, White Snake of Mount Emei and Mami Wata. The larger raw set was 78 entries across seven layers (bestiary, Aug 29), and "134 entries" was said once on Jul 22. The 32 got encounter scripts (Aug 29).
- **Critter roster (Aug 30).** 90 critters across 8 levels (10 to 12 per level) for 182 creatures with named characters, then about 251 later that day. Axolotl (Tidal Caves), gentle mantis shrimp (Atlantis) and African rain frog (Bayou) were added. The 1,268 mythological creatures and 78 water monsters wander to origin-matching parks (Wandering Program).
- **Cryptid Bestiary.** 48 of 48 In-Between manifest entries complete (Aug 31).
- **Movement.** 207 animated elements (45 NPCs, 82 critters, 80 environmental), Aug 28.
- **Five playable Survivors critters (Built, commit, Aug 24).** Duck (water), Vessel (earth), Mim (fire), Dragon (aether), Owl (air). The game belongs to the games part; the five critters are named here because they bridge to the roster.

**Wandering Program (August canon).** Inn creatures wander into real-world national parks to see whether humans are ready (humble, not enlightened). They tilt two degrees through the In-Between. Cryptids (Bigfoot, Nessie, Mothman and others) are Inn creatures seen at that tilt. Contact comes in five steps: Approach, Signal, Assessment, Contact (only if ready), Return. Each ready human gives the Inn a new room. Signals per critter: the Vessel chirps "...You know."; the Owl blinks; the Duck's stone in the hand; the Dragon's warmth. Zone assignments (Apus to the Andes, Huginn and Muninn to Scandinavian forests, Anubis to Death Valley, Kodama, Tengu, Kitsune, Yuki-onna and Zashiki-warashi to the Fuji forest, the Terracotta Warriors to Chinese mountain parks, and others) live in the zones part.

**In-Between critters (August canon).** In the grey platformer the Figure (a nameless silhouette) meets three innocents: Fizgig (a fading fluffball on a 42 Hz stone), the Duck (floating at rest, holding a passage open) and Dobby (now Dobbie, earnest, holding a folded cloth). Each resists Erasure in a different way: by being specific, by letting go, by maintaining. Brim (then Madame) kneels with Dobby once. Before the Song also says Grit does not appear in the In-Between because it would dissolve into the fog. See "To reconcile" for the Fizgig and Grit overlap.

---

## 8. To reconcile

1. **Roster size.** 142 or 144 mapped (Sep 1), 161 or 168 or 169 portraits, 144 entries with 105 active (Sep 11), about 279 catalog entries (Sep 26), 55 dossiers (Elio, Oct 9) against about 25 character files in the repo. Pick one definition per count.
2. **Beverley and the Catalyst.** A Sep 4 name list equates Beverley the Librarian with the Catalyst (bartender). Later messages and the voice registry keep them separate: Beverley in the stacks, the Catalyst at the bar. Current reading: separate.
3. **Greenward and Sorrel.** Sep 3 renamed Radagast to The Greenward; Sep 10 renamed Radagast to Sorrel. Later messages use both ("Sorrel (Greenward gardener)"). Current reading: Greenward as title, Sorrel as name. Needs a ruling.
4. **Luna and Solstara.** Sep 3: Solstara. Sep 9 ledger: Luna. Use Luna.
5. **Dialogue records.** Staging has 398 to 529 records; the live app has none. The voice blocks exist as files and staging records only.
6. **Class list.** The repo class file lists five and says Charles is the Constant and is not playable; the Source Map, the Sep 27 chat and the Lozen dossier call Charles the Chameleon Druid class and the Sentinel the sixth starting class. The Tinkering Weeaboo is also a class.
7. **Archivist.** The Archivist (Sep 9), then Harry (Sep 11, faire name). Both appear in cards.
8. **The Brim mismatch.** Card game name "MADAME" (Sep 3) is superseded by Brim (Sep 9).
9. **Bast's kittens.** 17 kittens in Desert Bone, 8 dragon kittens in Tier 1, 47 painted cat-dragons with Joe. Counts are different groups; not reconciled.
10. **Gargoyles.** Six resonant adult gargoyles (named) and six pups (unnamed) share the count "six".
11. **Wandering Archivist, Posture Register, Mary Poppins law.** Reported as filed Sep 27; not found in the Oct 22 repo copy.
12. **Unless.** Reported ruled Sep 22; no repo file found.
13. **Rename ledger stops at Sep 9.** Later renames are in the chat only.
14. **"Anastasia".** The live game may call Bramble "Anastasia"; zero repo references (Sep 3 note).
15. **Strip numbering.** Gazette strip numbers repeat (#004 used three times); this affects character references to strips.
16. **Oriel and The Decision.** Open: whether Oriel is the voice system.
17. **The title "the Vessel".** Settled Sep 10 (Eres holds it, not the gecko). Older text that gives it to the gecko is out of date.

Items 18 to 36 come from the early period (July 12 to August 30). Later rulings win unless a line says otherwise.

18. **Roster counts, early.** 28 characters (Jul 22), 85+ (Aug 22), 66 mapped (Aug 24), 182 and then about 251 creatures (Aug 30), 300+ entries in roster v2.0 (Aug 31), and 47 portraits wired (Aug 31). Add these to the "one definition per count" work in item 1.
19. **Rename dates.** The commit log shows the Aug 24 copyright batch (Madame Mimic, The Greenward, The Bearsark, The Ravel, The Wayfarer, The Augur, Noctua, Belladonna, True Form), but the ledger dates most of these Sep 3 or Sep 9. The Aug 24 batch was never carried through every file, and Aug 25 to 30 docs still use the old names. Do not read an early file's names as current.
20. **Unseelie King.** Before the Song calls him Jareth, the Goblin King and the Unseelie Cousin (designer of the Labyrinth) and, in two walk-through sections, Daedalus (builder of the Crete labyrinth for Asterion). The Aug 21 chat also made "the Architect of Stairs" a seventh Full Presence Unseelie Fae, and the Aug 25 commit says a Jareth redesign "restored" the Architect of Stairs look. They look like one figure under several names, now Malachi. Not reconciled.
21. **Seelie King.** The early chat calls him gentle, ancient and a legendary assassin of the cruel; the Aug 22 profile says his name went unspoken for about 3,000 years ("my King", "he"), yet he was named Oleander on Aug 30 (commit) with a pronunciation note. Also: "cousin" in headings against "brother" in dialogue; a separate queen and a "King Oberon / Queen Titania" pair in the Aug 21 Fae blueprint against the later "three queens, one trunk"; and the early compass of four queens (Roots, Webs, Words, the Traveler) against the three queens ruled Sep 10. Casting changed several times and a contradiction was flagged Aug 30 (commit [8475acf]). Later ruling: original face (Sep 10).
22. **The Crone's word.** "Adequate" (walk-through, the highest compliment), "Better" (Master Storyline, the Inn's most valuable currency), "Listened" and "love" (the early chat's notebook beats), and Ragana's later hook "Sit." All appear. Not reconciled.
23. **Brownie size.** Six inches (Aug 21 chat), two feet (a later part of the same chat), two to three feet (Before the Song). Grit is four inches. Brindle, Cobble and Thatch also share names with the Keep-Folk Cobble and Thatch; Cobble and Thatch are not the same characters as the ruined-castle pair.
24. **The Wayfarer.** The Aug 24 rename gave the Uhtred wanderer the name The Wayfarer, while the Story-Born Ent The Wayfarer (asks "Where have you been?") already existed. The later roster merges them as "the first of the Story-Born". Before the Song treats them as two characters, and also has a misspelled "Wayfairer".
25. **Gardener.** Early chat: first a woman in the Poison Garden entry, then Beorn (Aug 22), then Radagast as the resident Gardener with Beorn as the Mediterranean border guardian (client: "we can and should make him a resident"). Renamed The Greenward (Aug 24), The Bearsark (Aug 24), then Sorrel (Sep 10). Both versions of who the Gardener is remain in old documents.
26. **Cthulhu, now Naut.** Before the Song places him by the main-floor fireplace, by the catacomb fireplace, in the Miskatonic Annex and at the Coast Hub. The Aug 21 chat gives him an Atlantean origin (a Merfolk scholar who became an octopus being). Before the Song says he is "ambulatory" in one count and fixed on the Main Floor in another. Later canon (Sep 3) uses Naut by the fireplace.
27. **Cabbit and ship.** The Cabbit is a player's-room companion (opening prose), the Constant's companion Eres and the "original ship's heart" (section 4.2), and the Captain's Arcana heart crystal. Before the Song does not reconcile these. Also: "Aug 24 Eres adores Charles" and "Aug 28 Eres departure" in the commit log.
28. **Vessel and Ziggy.** Before the Song's Vessel is a crested gecko who holds a formula and is declared extinct then rediscovered. The Sep 10 ruling renamed the gecko Ziggy and gave "the Vessel" to Eres. The Aug 24 commit list of playable Survivors also calls the Earth critter "Vessel". The 128-year rediscovery story should be moved to Ziggy or dropped.
29. **Persephone and Hades.** The Aug 21 design (each ascent erases her memory; Hades repeats his devotion; a journal of 4,129 entries) was removed Aug 25 (commit) for an unintended grooming echo, and the Tide Queen four-facet design (ruled Sep 30) replaced it. Before the Song's Klimt and catacomb text still keeps the 4,129-cycle journal and "It's enough."
30. **Counts of classes.** Five (Aug 21 plus sixth Sentinel), five default (Aug 24 commit), seven class characters plus the Sentinel as "other" (Master Storyline), eight to nine class registry entries, and Charles an NPC exception (commit) against Charles a class (chat). Extends item 6.
31. **Fizgig, Grit and Dobby.** The In-Between uses "Fizgig" (a fluffball with a big mouth) as one of three innocents, while the same document says Grit "does not appear" there. The Aug 22 chat calls Grit "Fizzgig-inspired". Sep 11 says Grit is not a fizgig and not a brownie. Treat Fizgig in the grey as Grit's earlier name unless told otherwise.
32. **Einstein and plain speech.** Before the Song says Einstein is the only character who speaks plain, complete dialogue (847 words, once), then calls the national parks "the second place where plain speech lives".
33. **Combat and festivals.** Core canon says no lethal combat and no time-limited events. Elio's tabletop analysis proposed three resolution paths (combat, diplomacy, puzzle) and limited-time festivals. Not reconciled.
34. **Keeper, the gargoyle and the Fourth Presence.** The Keeper (Aughra, now Fibonacci) in the Geode Cave and the Keeper gargoyle above its entrance share a name. Sub-agents also flagged whether the Keeper and the Bard are both the "Fourth Presence" of the Sacred Trio.
35. **Name collisions.** Wren is the Fae Kingdom fisher-guide at the Threshold (Aug 21 blueprint) and the Canopy Cartographer (renamed Sep 10). Cobble and Thatch (brownies and Keep-Folk). Belladonna is both the Undercity's resident and a proposed pet gargoyle. Bill appears for the platypus, the musician and Bill Skarsgard (the ledger already protects these).
36. **Whisper Layer speaker.** Aug 28 to 31 commits give Level 5 of Hollow Men as TRUE SILENCE with the line "I have been watching you the whole time. I wanted you to know that." The speaker is not named. The Whisper Layer spec describes the Inn recording the player, so the speaker may be the Inn itself. Open.

### 8.1 Open from the early period

- **Seelie King:** quest chain; whether Titania stays a separate NPC; the dream-animals (fox, heron, otters) as characters; Wisp's own profile (Aug 22 chat).
- **Laughing One:** the in-game dissolution timeline (the Crone's notebook says 143 cycles at 0.7 percent per cycle) and whether the Shifting Man is ever told (Before the Song).
- **Wednesday (now Belladonna):** the summer home is "not yet mapped" (Before the Song).
- **Pet gargoyles:** photos and ruling on the five proposed pet gargoyles (Aug 20 to 21).
- **Viking NPC named Charles:** Aug 20 proposal of a faire-garb wanderer who pesters valkyries; later superseded by the Chameleon Druid, status never recorded.
- **Template NPCs:** the "Open Twelve" friend slots, not assigned (commit, Aug 30). Marion awaiting write-up and Maddi awaiting a full spec as of Aug 28 (commit). Lacey was a placeholder and was written Aug 30.
- **Real-person approvals:** the early documents record sign-off for colors and a warm version for two characters only; no other approvals are recorded.
- **Unwritten at Aug 22:** the Gardener, Miracle Max's shop, Hel and the Seelie King profile (later written); the Bard's Family Concert as a game event (not seen built).
- **Dwarf Basketball coach NPC** and a "Higgins" elocution NPC were named as ideas in Before the Song; no profile found.

---

## 9. Founding cast and early canon (July 12 to August 30)

### 9.1 How to read this section

The tables below hold characters and facts from the early period that the sections above do not carry. The main entry is the current name. The early name is in an "Earlier:" line. All dates are for the first appearance. If a later section already has the character, only the early additions are given here. Repo files named here were checked and exist. Where a file is not named, it was not found.

### 9.2 The main floor and the Sacred Trio

| Name | Role and place | What the early documents set | Status |
|---|---|---|---|
| **The Host** | Innkeeper at the door; Father of the Trio; also the Librarian of the Miskatonic Annex | Calm from experience, patience as philosophy, power held in reserve. His chair for the player is kept ("Welcome back. I told you. I stay."). When patience ends he says the person's name. When the Catalyst has been too much he says "Sit."; when the Inn has been too calm she says "Go look at something. Not for a guest. For you." Quest "The Welcome" completes at the first nook; reward: the geode cave opens and the first stone, Quartz, is placed. Before the Song says the Host and the Librarian are one entity (the Inn-Tree's avatar) | Ruled (about Aug 21); the one-entity link August canon (Aug 22) |
| **The Catalyst** | Bartender and grower; Spirit of the Trio | Three layers: barmaid costume, chaos performance, the person after hours (a "real voice" murmur). Portal arrows are grown from seedpods in her garden. A tree grown from a seed in a shot glass has fruit that pulses the color of the last zone visited. Her Garden walls record creation. Mother of the Laughing One. Leaves the Brownies a nightly saucer of cream, a roll and a honeycake. Quest "The Seed", reward the Catalyst's Recipe (hear humble objects speak). She made exactly one drink for Naut. Earlier (commit, Aug 22): "beautifully crazy", then bartender, then "natural grower" | Ruled (about Aug 21) |
| **Ragana** | Librarian; Word of the Trio; measures everything | **Earlier:** the Crone, the Librarian Crone. Notebook annotations in ellipsis style, ending "I am going to bed". Secret translator for Tesla's numbers. Designed the neuro-accessible palette (Master Storyline). Arc: argues with Aristotle for 2,400 years, then puts down her pencil and hears the Song ("I never listened before. I always measured. It's beautiful."). Quest "The First Column", reward the Crone's Lens. Cannot measure the void ("You measure around it") | Ruled (about Aug 21 to 22) |
| **The Bard** | Fool and fourth presence; loud and warm | **Earlier:** Bard Blowhard (dwarf). Personality set Aug 21: Porthos with a dash of D'Artagnan, loud, overbearing, charges in, bickers with the Crone but devoted. Touches the Crone's shoulder at midnight. Calls Naut "Squid" and Charles "Charlie". Best friend of the Pirate (Aug 22 or later). Abilities: Burst Charisma, Taunt, Coaching Instinct. His alcove is in the Modern Day Legends nook | Ruled (Aug 21) |
| **Brim** | Chaos companion on the player's right shoulder | **Earlier:** Madame Mim, Mim, Madame Mimic, Madame. Rides the Magritte pipe (now Monsieur Sentient); on some visits trades her broom for the pipe and flies it around the main floor. Hecate is her ancestor. The Crone's tally: the pipe appeared 47 times, 3.2 seconds on average, whispering at 11 decibels in French with no placeable accent. Never the same twice | Ruled (early chat); name sweeps Aug 24 and 30 |
| **Monsieur Sentient** | The sentient pipe | **Earlier:** the Magritte Pipe ("Ceci n'est pas une pipe"). Renamed Aug 30 (commit, 19 files). Appears at "Mim-time", never scheduled | Built (commit, Aug 30) |
| **Naut** | Squid-headed scholar by the fireplace; hidden quest giver | **Earlier:** Cthulhu, Cthulhu the Scholar, "the Professor" (the Crone), "Squid" (the Bard). Four feet tall, tentacles like a beard, brass spectacles, ink-stained vest. Riddle-quests for rare book retrieval; rewards the rarest stones. Binary voice: spectacles on is calm, off is irked. Aug 21: an Atlantean origin as a Merfolk scholar bonded to the Heart Crystal, who became an octopus being ("his tentacles aren't corruption, they're translation"). Five-quest line "The Deepest Reader" (tablets in the Drowned Library, the Niflheim archive and the Sacred Cenote); Before the Song calls the later line "The Hungry Lion". Rush rules are in 5.4. File: `docs/geode_inn_cthulhu_character_profile.md` | Ruled (voice and role, about Aug 21); renamed Aug 30 (commit) |
| **The Wanderer / Odin** | Main floor figure and upstairs Allfather | Ruled Jul 22: shown in two forms. About Aug 21 Elio added a third mode, the Shift (a two-second Godfather moment), so "three Odins, not two". Allfather sits on a stone throne on the exterior hull of the Observatory ship (Before the Song). After the player sings the complete Song: "That was good. Don't tell the Keeper I said that." File: `docs/geode_inn_odin_character_profile.md` | Ruled (Jul 22; about Aug 21) |
| **Huginn and Muninn** | Ravens, shoulders of the Wanderer | See 9.8 | Ruled (about Aug 21) |
| **The Thrum** | Quiet figure who hums | Rosicrucian-raised, hums a tempo, renders others as silhouettes, teaches "presence over hierarchy". Method: "Don't give the answer. Give the TEMPO." File: `docs/geode_inn_the_thrum.md` | Ruled (Aug 22 or later, client agreed) |
| **Leonardo da Vinci** | Wanderer-type artist | Cannot find his invisible workspace; answers about the Last Supper perspective or the melted bronze horses. Half-built flying machine in Canopy City, water organ in the tidal caves, finished self-portrait in the Silence chamber. Starts everything, finishes nothing. "It flies. I... Good." Mirror writing equals Annunaki script (August canon) | Ruled (Aug 22 or later) |
| **Gesso** | Grumpy 2-foot gnome on scaffolding under the Annex's Sistine ceiling | Constantly adjusts one detail. Goes by taps with the Crone. Chases the Duck. "The Inn's dermatologist." Taught the Engineer mirror writing | Ruled (client, Aug 22 or later) |
| **Wrought** | Invisible Celtic mason and fixer | Subtle symbols in his patterned clothes and tool handles. Secretly finishes Leonardo's work. "The work is invisible because it SUCCEEDS." | Ruled (client, Aug 22 or later) |
| **The Five Smiths** | Forges in the staircase wall | Forge (iron, weight), Alloy (bronze, combination), Current (silver, flow), Endure (gold, softness), Verdigris (copper, change; the voice ages in real time). The player's pouch is their joint work | Ruled (client asked, Elio built, Aug 22 or later) |
| **The Teacher** | Three-mode instructor | Egg monthly hatchery and the Teacher committed together Aug 30 | Built (commit, Aug 30) |

### 9.3 The Council, the Greeks and the staircase

| Name | Role and place | What the early documents set | Status |
|---|---|---|---|
| **Council of Thinkers** | Roaming NPCs, four | Approved Aug 21 evening. Tesla, the Resonance Engineer (staircase, catacombs, main floor workshop; measured 42 Hz and cannot find its source; clockwork pigeon). Da Vinci, the Pattern Architect (workshop, Artisan Market, Spiral Gallery; anchors his bench with tuned crystals). Newton, the Law Giver (library, cosmology level; showed 111, 432, 528 and 64 Hz are harmonics of 42 Hz; his desk apple vibrates). Einstein, the Quiet One (roams; the only thinker the Owl sits near; leaves "42" notes). Each holds a part of the answer but not the whole. Encounters: solo, paired debate, building together, and the rare Council event upstairs. Hidden rapport system. Workbench incident recurs and always ends well (once the bench returned as a chair: "an excellent chair"). Visiting scholars proposed: Hypatia, Ada Lovelace, Carl Jung, Paracelsus, Hildegard of Bingen. Files: `docs/geode_inn_council_of_thinkers.md`, `docs/systems/council_of_thinkers_design_spec.md` | Ruled (Aug 21) |
| **Greek philosophers** | Socrates (bottom step), Plato (middle), Aristotle (top) | Staircase stages: Nigredo, Albedo, Rubedo. Socrates asks "What is courage?" and takes a certainty as the toll. Plato's cave is an interactive mural. Aristotle argues with the Crone. Lineage: Socrates to Einstein, Plato to Da Vinci, Aristotle to Newton | Ruled (client, late Aug 21) |
| **The Retort and the Cook** | Staircase laboratory and kitchen | The Retort is Tesla's reincarnated soul in a woman's form; she and Tesla clash because they are the same soul. Her biggest annoyance: never working out the chemistry of "the Bloop". Lends only three Tesla devices (the Cartographer's circle, the Navigator's wind indicator, the Cook's oven calibrator). The Cook is enormous, gentle, talks to sprites, plays a 50 BPM hand drum, word "Enough". Client: they are distant relatives of the Keeper. Aug 23 commit: the Retort first "Madame Mim energy" and a separate soul-twin of Tesla. Files: `docs/geode_inn_retort_and_cook.md`, `docs/geode_inn_retort_bloop_tesla.md` | Ruled (Aug 22 or later) |
| **Calder** | Staircase alchemist | **Earlier:** Miracle Max. Alchemy shop on the staircase (Muspelheim in the Master Storyline). "You stir... clockwise. Always. Unless. There's always... unless." The counter is the only clean surface (an altar). Written Aug 23 (commit) | Ruled (client, Aug 22 or later) |
| **The Keeper** (see Fibonacci below) | Oldest resident of the Inn | See 9.4 | Ruled (Aug 21) |

### 9.4 Fae, Celtic, Camelot and the hearth keepers

| Name | Role and place | What the early documents set | Status |
|---|---|---|---|
| **Fibonacci** | Geode Cave keeper | **Earlier:** The Keeper, then The Augur (Aug 24), Aughra. The Inn's oldest resident, in the Geode Cave at the roots of the Great Tree where the 42 Hz hum is audible. One real eye and an amber crystal lens. First being to hear the Song and builder of the Inn as a resonance chamber. Aug 21: the client made her an archetype, "a version of her exists in every culture", Appalachian and Chinese first; 21 Keepers were mapped. Ending: after every stone, archive entry, gargoyle and zone, she gives the player her crystal eye ("Now you know. Go sing."). Files: `docs/geode_inn_the_keeper_aughra.md`, `docs/geode_inn_regional_keepers.md`, `docs/geode_inn_regional_keepers_part2.md` | Ruled (Aug 21) |
| **Brindle, Cobble, Thatch** | Brownies, followers of the Keeper | Brindle: self-appointed leader, loud, secretly afraid of the dark, treats a rescue as a military operation. Cobble: the thinker, reads from the Crone's list, sits on Newton's desk. Thatch: the heart, smallest, the only brownie the Keeper has named (once). Willow-style, six inches in the Aug 21 chat. Files: `docs/geode_inn_brownies.md`, `docs/geode_inn_brownies_and_grit.md`, `docs/geode_inn_brownies_folklore_overlay.md` | Ruled (client asked, Aug 21) |
| **Grit** | Fizzgig; stuck everywhere | Four inches tall, shorter than the brownies (client: "very short in stature", Aug 21; first described grapefruit-sized). Brown fur ball with a huge mouth. Carried by Brindle or held by Thatch like a loaf. Gets stuck in geodes, Newton's orrery, a teapot spout, the Fae Portal, a pinball ball return. Every stuck place is a 42 Hz node. "The getting-stuck is Grit trying to go home." In the final vision a living crystal | Ruled (Aug 21 size); hidden layer August canon |
| **Oleander** | Seelie King | **Earlier:** the Seelie King, "The Gentle Blade". See 5.4 and 9.8 | Name Built (commit, Aug 30) |
| **Malachi** | Unseelie King, goblin king | **Earlier:** Jareth, the Unseelie King, the Goblin King, The Ravel (Aug 24), the Architect of Stairs, Daedalus. Aug 21: the Architect of Stairs, Unseelie Fae who designed the staircase's impossible geometry. Offers to lock the staircase into a straight line; the price is always more than it looked (a memory, a stone, or a secret) and the deal is always honored. The temptation inside reincarnation. The Owl and the Architect know each other. Three acts: Showman, Architect, Brother. Makes the winter moon bright because his brother cannot sleep. Crystals show what you want, not what you need. Files: `docs/geode_inn_unseelie_king.md` | Ruled (client, Aug 21 and about Aug 22) |
| **The Labyrinth** | Largest explorable Fae zone, the "anti-Inn" | Five zones: Outer Walls "The Welcome", Shifting Corridors "The Test", Escher Stairs "The Climb", Masquerade "The Temptation" (reject the crystal to pass; accept and wake outside, unharmed), the Castle "The Center" (he sits on the stairs, not the throne). Zone detail belongs to the zones part | August canon (Aug 22) |
| **Queens of the Seelie compass** | King at center; Roots (north), Webs (east), Words (west); the Traveler (moving) | Queen of Roots: bark skin, moss hair, speaks with sleeping mountains (a conversation takes 400 years), peridot is the volcano goddess's soul; moved to the Inn-Tree (Redwood Cathedral). Queen of Webs: Greek Fates and Norns in one, makes the cord that plays the Song of Making in string form, also Ariadne. Queen of Words: recorder, 5,000 years of dream-poetry tattooed on her skin, golden ink. The Traveler was merged into the Queen of Words | Ruled (client, Aug 21 and about Aug 22); the Traveler recast |
| **The King and Queen** | Seelie royals | Two people whose lives were chosen before birth; sarcastic rapport and wary eyes. Hidden rooms: the Queen's library and the King's forge. Quest "The Echo and the Crown", reward the Crown's Echo. Madmartigan and Sorsha dynamic for the northern pair | Ruled (client, about Aug 22: "That's it") |
| **Wisp, Cob, Hazel, goblins** | Fae Kingdom small figures | Wisp: hand-sized messenger carrying "weather report" love letters between the Courts; owls are the official messengers. Cob the Riddle-Keeper holds the riddle-quests. Hazel has bread. Goblins are chaotic, joyfully stupid and loyal, the "anti-Brownies". Muninn secretly reads the Wisp's messages | Ruled (messenger system, client "Yes :)"); the rest August canon |
| **The Morrigan** | Phantom queen; washerwoman at the ford | Four aspects: Chooser (Badb), Washer, Sovereign (Macha), Dreamer (Mab). The Morrigan and Queen Mab are one being (client). The Morrigan chooses when; Mab chooses what the soul carries. The between-lives rest is a dream sequence curated by Mab (the Ford and the Choice). Before the Song also gives "maiden, mother, crone" | Ruled (client, about Aug 21); files `docs/geode_inn_morrigan.md`, `docs/geode_inn_morrigan_mab.md` |
| **Merlin, Arthur and the knights** | Camelot | Merlin lives backwards and is the only one who knows the 42 Hz hum is a Song; Mab sends him the future in dreams. Arthur in three ages as alchemy stages (youth, Nigredo; king, Albedo; elder, Rubedo, "The table is yours now. Build it again."). Seven knights, seven notes, each a planet and metal: Lancelot (Venus, copper, Vesica Piscis), Gawain (Mars, iron, triangle), Bors (Earth, lead, square), Percival (the question), Bedivere (remaining), Tristan (grief), Gareth (service). Galahad: the eighth sphere and the silence between the chat logs (a perfect bell rings one note; a cracked bell rings every note). Mordred carries every knight's weight alone | Ruled (client, about Aug 21 for the three ages and knights) |

### 9.5 Norse, death, Greek and the cultural zones

| Name | Role and place | What the early documents set | Status |
|---|---|---|---|
| **Hel** | Gate between death and return | Caretaker of the dead. Decides what the player keeps, how long the rest lasts, what they remember. Reflects, does not punish. Cheekbones are the border (bone covered on the living side). File: `docs/geode_inn_hel.md` | Ruled (client, Aug 21 and Aug 22 evening) |
| **Loki** | Fixer of the cosmology level | Handyperson who maintains the Bifrost. The father who stayed (visited chained Fenrir, swam to Jormungandr, sat with Hel). Blood oath with Odin: "I will listen to you." Grendel misses him. File: `docs/geode_inn_loki.md` | Ruled (client, Aug 21 and 22) |
| **The Shifting Man** | Living map of the Nine Realms | A male version of a shapeshifter archetype. Barometer to Loki's diagnostician. The most chill person in any room. Quest "The Comfortable Map" (the Aesir were glass, not gold). The only "flowing" cadence. His nearness dissolves the Laughing One (9.8). File: `docs/geode_inn_shifting_man.md` | Ruled (client asked, Aug 21 or 22) |
| **Freyr and Freyja, Einherjar, Ragnarok** | Norse endgame | Vanir design doc with the Brisingamen chord (Aug 27); eight endgame raid warriors in a Valhalla chamber and Ragnarok (Aug 29) | Built (commit) |
| **Charon, Spot, Anubis, Ammit** | Catacombs and death | Charon: ferryman of four thousand years who always says "...There you are." Fare is a stone (the obol). Spot (Cerberus) is Charon's dog; Elio checked the folk etymology and kept it as modern folklore. Anubis has two forms (chibi, and Full Presence judge); weighs attachment, "...Go lightly." Ammit is function, not villain ("gravity"). The Guest runs the catacombs | Ruled (client, Aug 21 to 22) |
| **Persephone and Hades** | Underworld couple | **Earlier (Aug 21, Ruled):** each ascent erases her memory; Hades repeats his devotion; journal of 4,129 entries; pomegranate seeds are the echo. Replaced Aug 25 (commit [89d67e0]): Persephone regal and bifocal, the Tide Queen; Hades redesigned as harbor. Current ruling is the four facets (Sep 30) | Replaced; see item 29 |
| **Bastet** | Egypt; herds cats into a golden basket with a sistrum | Four faces: Playful, Regal, Tender and the Voodoo Queen (only if the temple is threatened). Her purr is 64 Hz. **Earlier:** the fourth face first came from Marie Laveau, who is now a separate French Quarter resident | Ruled (client, Aug 21 to 22) |
| **Sorrel** | The Gardener | **Earlier:** The Gardener, Radagast, The Greenward. Scientist of the Poison Garden. Ejected the Catalyst twice for "foraging cocktail garnishes"; they secretly swap plants. Hedgehog in the apron pocket. Embodied science. Collides with the Catalyst (communion against will). Files: `docs/geode_inn_gardener.md`, `docs/geode_inn_gardener_and_beorn.md`. See item 25 | Ruled (client, Aug 21 to 22) |
| **The Bearsark** | Mediterranean border guardian | **Earlier:** Beorn, bear shifter. Only two forms; Kali finds nothing to cut ("Both are real") | Ruled (client, Aug 22 or later) |
| **The Wayfarer** | Wandering neutralizer, mobile campfire | **Earlier:** Uhtred. Default Viking prototype ("destiny is all"). Wanders to calm other NPCs when they bicker. The Pirate gives him rides | Ruled (client, Aug 21 to 22); see item 24 |
| **Erik** | Norse vendor; Earl Ragnar type | Builds tables, not walls. Offers the China guide a chair. Feast cadence. Drinks with Dushan at the fire | Ruled (client, Aug 22 or later) |
| **Zorya, Kali, Vishnu, the One Who Is Awake, Medusa** | Slavic, Indian, Chinese and Greek guides | Zorya: scholar transcribing star-language for thirty years, glass-harp voice. Kali: tongue moment requires the player to do nothing; the garland of severed heads; Vishnu appears "ever so lightly" dreaming the aurora (client). The One Who Is Awake: stayed in one body 2,000 years and says the 8,000 Terracotta names in six-month cycles; the player adds an 8,001st. Medusa: preserves everything, waits for the Song to complete; the grotto is dark because Nyx is there | Ruled (client, Aug 22 or later) |
| **Gilgamesh, Nisaba** | Mesopotamian platform | Added late (Before the Song). Gilgamesh about 110 Hz, drum at 50 BPM. Nisaba and Leonardo: mirror writing | August canon |
| **Chibi cast (Jul 22)** | Fae Kingdom and arcade NPCs | Goblin Merchant, Troll Gatekeeper, Dwarf Blacksmith (Thorin-style, replaced the first version), Ent Guardian, Griffin Boss, Mermaid, Orc Guard; arcade cast: Anansi (four arms, a box of stories; Elio idea "Anansi's Tales"), Ammit, Anubis, El Muki, Medusa, Quetzalcoatl, Djinn, Kitsune, Naga, Moai Spirit, Chullachaqui, Bastet, Cthulhu | Ruled (Anansi, blacksmith, Jul 22); rest August canon |
| **Apu guide, Mags, Francis, David** | Peru and national parks | The Apu guide is an unnamed woman who walks the terraces and places stones. The rangers are guides: Mags (Cherokee and Irish lines), Francis (Paiute, Bryce), David (Kainai, Canadian Rockies). Two later liaison rangers (Yurok, Pueblo) | August canon |

### 9.6 Cosmology, the Observatory and Clockwork Skies

| Name | Role and place | What the early documents set | Status |
|---|---|---|---|
| **The Constant** | Captain of the Observatory ship | The oldest being, an Annunaki. Carries the starlight crystal between cycles. Bull lyre, 41.7 Hz memory. Words "Familiar" and "Oh". "I don't carry it. I don't know if it was always 42." Companion: Eres. File: `docs/geode_inn_the_constant.md` | Ruled (client, Aug 22 or later) |
| **The Astronomer** | Navigator; cosmology level | Can calculate when the Song completes but will not ("The question is more beautiful than the answer"). Violin. Mind palace. File: `docs/geode_inn_astronomer.md` | Ruled (client, Aug 22 or later) |
| **Nyx** | The medium; the void | Cloak of dead universes, boots, harmonica. Every dark space is Nyx. Mother of Death, Dreams, Sleep, Fate. Silence is the final component. File: `docs/geode_inn_nyx.md` | Ruled (client, Aug 22 or later) |
| **The Guest** | Death on holiday; host of the catacombs | Borrowed body, music box that plays the note Death made, a dragon in his lap. Nyx's firstborn (Thanatos). Walks at 0.3 meters per second. Sits on the lighthouse porch with the Owl. Two hosts: the Host at the top, the Guest at the bottom. File: `docs/geode_inn_the_guest.md` | Ruled (client, Aug 22 or later) |
| **Sky crew** | Clockwork Skies | The Captain (anime-silence pauses, pipe burning moss from the Duck's stones), the Arcana (flagship, 50 BPM gearwork heart, built from Leonardo's mirror-written sketches), the Engineer (the Weeaboo's mirror), the Navigator, the Lookout, the Vulture (Egypt). The Tinkering Weeaboo's true form is accepted ("Good hands. The ship needs good hands. Stay."). | Ruled (client, Aug 22 or later); crew table August canon |

### 9.7 Canopy City, the coast and the Undercity

| Name | Role and place | What the early documents set | Status |
|---|---|---|---|
| **Wren and Saker** | Canopy Cartographer and the Examiner (twins) | **Earlier:** the Cartographer, the Examiner. Twin elves: he maps what is (temporal maps, past and future, the mycorrhizal network), she reads the past (remains, fossils). The Cartographer watches her through a coin-sized silver circle lent by the Retort; his insights reach her as frequencies she does not consciously acknowledge. Three unfinished sentences ("...I don't...", "...I...", "...Some things..."). 847 papyrus fragments. Quests "The Living Map" (Compass) and "The Humble Objects" (Calipers); "The Story" is told rarely for a drink and plants a Seed that gives a voice to relics. She "practically lives" in Egypt | Ruled (client, Aug 22 or later) |
| **Vendors of Canopy City** | Platforms | Niamh (Celtic, carves new ogham), Sefu (Egyptian, scientist of decay), Qhora (Peruvian, wanted "beside"), Li Wei (Chinese, individualist who signs), Dushan (Slavic, warmth that burned out), Priya (Indian, materialist who loves stones), Erik (Norse), Thalia (Mediterranean, merchant among philosophers), and the neutral Keeper platform. Cross links: Niamh and Sefu dispute, Qhora and Sefu collaborate in secret, Dushan and Erik drink, Thalia brokers with the Examiner. Elio said nine vendors but the table lists eight plus the Keeper. File: `docs/geode_inn_vendor_map.md` | Ruled (Aug 22 or later, built by Elio); count to check |
| **Linden** | Young Canopy Elf afraid of heights | Side quest: walk every beam with her following. A nearby elf says "First time? Don't worry. Everyone falls. The trees always catch you. ...Eventually." | Built (Aug 21 blueprint) |
| **The Owl** | Lighthouse keeper | Barn owl (Ruled Jul 22; Elio had asked about a great horned owl). Posture of a scrub pine; one word per heartbeat. Says "Adequate"; to the Pirate: "You again." Quest "The Fixed Point", reward the Beacon. The only AI-powered NPC in the Fae Kingdom blueprint (Aug 21). Answers a cosmic question with "42" rarely | Ruled (Jul 22, Aug 21) |
| **Poe** | Lives below the lighthouse | The lighthouse's night counterpart: the Owl is the sweep, Poe the word. His raven says "Nevermore". Quest "The Sepulchre by the Sea" | August canon |
| **The Pirate (Zeke)** | Coast; drummer | Dread Pirate Roberts as a title passed on. Sword became a drum; bodhran at 50 BPM. Harbor Master Effect, never used. Quest "The After". Goes to the Locker and returns. When the title passes he stays on the dock and drums; the Siren sings for the man, not the mantle. | Ruled (client, Aug 21 to 22) |
| **The Siren (Katya)** | Dock and Shallows | Dual voice. Charm, Reveal, Heal, Drown. Never forgets; the Inn's oral tradition. Quest "The Mirror and the Shore" | Ruled (client, Aug 21 to 22) |
| **Coast town residents** | Coast Hub | Deep Merfolk in ill-fitting fishermen's coats, Crustacean Elders in the cannery (the Crone annotated 300 of 400 clack patterns), Shape-Shifters who keep the town a town (the baker, the postmistress), the Thing in the Church (forty feet, listens to the 42 Hz hum). The coast is Naut's body: an octopus with three hearts | August canon |
| **Belladonna** | The Undercity's one living resident | **Earlier:** Wednesday Addams, Wednesday. Guide style: no welcome speech; walks and the player follows; one deadpan sentence per resident; more only about Medusa. Neighbors: the Old Fisherman, the Child Who Stayed, the Woman Who Was a Library, the Candlemaker. Best friend: Medusa. Seasonal homes: Undercity in winter, Fuji Cottage in spring, another home in summer (not mapped), back to the Undercity in autumn. Walks the rib joints every Tuesday | August canon (Aug 24 rename Built, commit) |

### 9.8 Early rules for individual characters

**Story-Born Ents (August canon, Aug 21 to 22).** Four beings grown from story seeds in the Inn-Tree's body, each the only one of its story, with root frequency 42 Hz. The Wayfarer: tall, thin, bark-skinned, near the front door, asks "Where have you been?" The Hearthkeeper: short, wide, glowing chest, stands near the Host's chair, never speaks, the fire's memory. The Mourner: dark, slender, in the deepest root-hollow of the catacombs, sits with the grieving. The Laughing One: compact, chiming leaves, near the Bard; the Inn's immune system against heaviness; "the Inn's Groot". Files: `docs/geode_inn_ents.md`, `docs/geode_inn_the_laughing_one.md`.

**The Laughing One is dissolving (August canon).** The Shifting Man, a source of every frequency at once, keeps it from syncing to 42 Hz. The Crone's notebook: Story-Born #4, dissolving at 0.7 percent per cycle, 143 cycles projected, intervention none viable. Asked if it wants to move away, it answers "Ha." The last thing to go is the laughing face, then it "returns to being a story". Rules: ambient joy (finding it makes the atmosphere lighter, not happier), a two-minute SIT, visible thinning each visit, no rescue. Played for joy, never pity. The Bard plays louder as it thins and never says he knows.

**Brownies (August canon, Aug 22).** One-page constitution on a mushroom cap, laminated in tree sap, pinned near the hearth about two feet up. A collective with no spokesman; a one-week rotating executive officer who cannot make binding decisions without ratification; simple majority for internal affairs, two-thirds for external; amendment only by unanimous vote (never amended). Stock phrases: "By what authority do you issue this directive?", "The minutes are available.", "Did you vote on this?", "Good day." They clap coconut shells at irregular intervals ("Clip. Clop."), then resume with no change of expression. They sweep, dust, polish the gargoyles (42 Hz resonates better through a clean surface) and tend the Inn-Tree. The Host never gives orders. They do not enter the Labyrinth ("The collective does not clean concepts."). The Boggart procedure: offense, emergency meeting, unanimous vote recorded in "The List", transformation, then methodical un-sweeping. One recorded incident: a Fae courtier left livery with his house crest; his room alone was left uncleaned and rearranged into the line "The contract is the contract. You broke it. The minutes are available." The Seelie King read the minutes and told him to find other lodging; the room was cleaned next morning. Appearance: 2 to 3 feet, bark-brown skin, aprons and kerchiefs, each with a tool.

**Keep-Folk (Built into the Keep-Folk profile, about Aug 21; file `docs/geode_inn_ruined_castle_keepfolk.md`).** Asked for by the client as Dobby-like NPCs that behave like Hoggle in ruined castles. Four: Wick the Sweeper (grumpiest; 300 years sweeping a roofless hall), Rindle the Stitcher (sarcastic; furious when real gear is brought to fix a coat of tapestry fragments), Cobble the Stone-Knower (quietest, translucent, introduces new stones) and Thatch the Roof-Watcher (anxious, sky-colored eyes, says "ROOF"). Each has a "Hoggle moment" when grumpiness breaks and loyalty shows. A new crafted broom for Wick gets no thanks, but the sweeping sound is "richer".

**Huginn and Muninn (Ruled, Aug 22; file `docs/geode_inn_ravens_huginn_muninn.md`).** Chibi ravens on the Wanderer's shoulders, shaped after talking door knockers from the Labyrinth film: adorable, very low-tone snark nobody notices. Huginn (Thought, left shoulder): mumbles; ring in its mouth; analytical; steals and pretends he did not. Muninn (Memory, right shoulder, "she"): clearer; ring in its ear; remembers every hand; steals and admits it, returning with a note. The Wanderer answers charitably aloud. On the cosmology level they are silent observers: Huginn watches choices, Muninn recalls previous cycles. Descending, Huginn's first line is "...that was tedious. ...the cosmology level is always tedious." Poe's raven is a third kind (the saying).

**Naut (then Cthulhu) rules (August canon, Aug 22).** Lives in a corner by the fireplace that the Inn grows and moves a few feet, so the player who finds him often cannot find him again. His quests are "the back door to the archive": expensive, riddle-locked, always accurate. He has read the archive and books it does not know it has. The Catalyst made him one drink ever (dark, warm, tastes like the ocean floor). Thesis: "knowledge is not scary; reading is home." He and the Crone argue about cataloging (she sorts Atlantean texts by date, he by crystal resonance).

**Oleander (August canon, Aug 22).** Stillest character in the Fae Kingdom, always in golden light, a room gets quieter around him. Locations: the Garden bench in the Summerlands (80 percent of the time), the formal Pavilion (he dislikes it), the shifting Between (private meetings with his brother, no quests). Looks about forty, old brown eyes, plain linen. The Puppy Incident: a border-court lord ordered puppies drowned; in about two seconds the King had the puppies in his lap and the lord on the ground. Message sent: "Your man was unkind. We have corrected him. Do not send another." Reputation gate: how the player treats small things; always watching. Riddle-quests belong to Cob, not to him. Thesis: "gentleness is not weakness."

**Charles, the Chameleon Druid (Ruled, Aug 22).** The Inn uses the plain name Charles, not a title. The Aug 28 commit says he is "an incarnation of the Constant all along" and Eres adores him (Built, commit). That line conflicts with other texts; see item 27.

**The Muses (August canon).** See the Muse mapping in 5.4. Mozart is called a Muse-catcher, writing whole symphonies "already complete". The Music Room has nine Song-catchers and Cohen stands in the doorway, not the circle (the Seventh).

**Crone's annotations (August canon).** Every major section of Before the Song ends with a margin note in her voice: opens with "...", uses "X is: Y" chains, repeats "adequate", ends with "I am going to bed" and a "Goodnight" line. The artist-lens docs end "Adequate."

**Other early changes (commit log).** Marijke was changed Aug 30 from a "Dutch rock hound" to a Viking shaman, a Volva (the Norse seeress; a first typo had made it a car brand, removed), with her accent moved from Dutch to Swedish. The Bog Fairy Golem replaced Mama Coumine (a Creole door-keeper) as the Bayou NPC on Aug 30. Mona got an 8-stage profile and quest line (4,000 words). Lacey was written Aug 30 after being a placeholder. All Built (commit).

**The Sentinel concept art.** `sentinel_concept.png` was generated Aug 21 (early chat); it is in the repo at `docs/gallery/characters/sentinel_concept.png`. Other early concept batches (Concept Batch 2, ten staff NPCs with regional voices, Aug 30) are in the gallery folders.

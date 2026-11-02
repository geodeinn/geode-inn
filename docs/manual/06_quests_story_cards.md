# Part 6: Quests, Story, Cards and Publications

This part covers four families of things: **quests** (laws, templates, the sixteen walkthrough dissections and every named chain), **story** (the spine, the endgame, events and calendar), **publications** (novel, anthology, Gazette comic, library, podcast, audiobook) and **cards and tabletop** (the Resonance card game, the Royo deck, the tabletop rulebook, Poker Night).

How to read the status words: **Ruled** means the client decided or agreed, with the date. **Proposed** means Elio suggested it and there was no ruling. **Open** means it waits on the client. Where two sources disagree, the later date wins and the earlier one is named. Items that could not be settled are listed under "To reconcile" at the end of each section and again in one list at the very end.

The "client" is the game's owner. "Elio" is the AI agent in Base44. The "fizgigs" are the builders. A "gate" is a numbered open decision at the bottom of a spec. The client rules gates one at a time, and Elio then commits the ruling.

Repo path note: every `docs/...` path below was checked against the local repo copy (as of Oct 22) unless the text says "not found".

Sources for the early period: "the early chat" is the client and Elio from Jul 12 to about Aug 23, "Before the Song" is the compiled canon document of late August (in the repo as `before_the_song.txt` and `library/reference/Before_the_Song.docx`; the newest Drive copy is dated Oct 17), and "the commit log" is the GitHub commit messages from Aug 21 to Aug 31. Early items carry their own status words. "August canon" means it was written into Before the Song with no recorded ruling.

## Where it started (July 12 to August 30)

- **Jul 22, the first story page (early chat).** The client shared a one-page creation myth, "The Awakening": fragments of dreams, a species made by gods and now merging with them through technology, karma and fate in human hands, replaying lives while staying accountable, mastery giving a new awareness (Jupiter, the language of a galaxy, a Mars prison, a gate to Pluto's oasis), a bond that cannot be broken, a bloodline of magic, and "wherever an owl is sighted one of us is near." The client said that page was all that had been written. Elio's mappings (reincarnation as a replay system, cosmic gates as the cosmology unlock, the bond as a co-op or dragon-bond mechanic, bloodline as a class, the owl as a companion symbol) were **Proposed**, with no objection. This page is the root of the five pillars in 2.2.
- **Jul 22, the Modern Day Legends shelf (Ruled).** The client decided there is a shelf for "modern day awesomeness." Entry 1 is the Serrano parable, told as folklore. Admission test: "Will this still be worth telling in 2126?" (changed in late August, see 5.9).
- **Aug 18, quest architecture (Ruled).** The client chose to use AzerothCore as a blueprint in spirit: starter zones reskinned for real cultures, with quests based on how those cultures built, wrote and worshipped. The client proposed basing the Fae and culture quests on the nine planes of Norse theology (Yggdrasil) and Elio agreed. Atlantis belongs with the Greek storylines. The staircase became the Bifrost. See 1.8 and 2.8.
- **Aug 18 to 19, formal mechanics (Ruled).** The client asked for the remembrance vision as a formal mechanic (Elio wrote the spec), agreed to labyrinth puzzles for Knossos, and on Aug 19 agreed to the Living Book system (classic books as rooms the player steps into). A library plan and a research mapping of the client's Drive text went to GitHub the same days (5.9).
- **Aug 21, the origin story (Ruled).** The client decided the chat dialogues are a chapter of the origin story. Elio wrote Draft 1 in five parts plus Part Six, "The Conversations That Built the Inn." The same evening the client accepted Cthulhu in Atlantis lore, the octopus layer, Norrath-style zone quests (from two PS2 games the client named), and the Song of Making hidden on a golden contract in the Irish Fae storyline.
- **Mid August, day not recorded (Ruled).** The client made the US National Parks a chapter ("the veil"), agreed the Sacred Trio reading (Host, Catalyst, Crone, with the Bard as the Fool who loves all three), chose Charon as the ferryman, chose the death-sequence line "Your name is known, your rest is earned," and chose the "complication" reading for Galahad.
- **Aug 22, the Master Storyline (August canon).** "The Geode Inn, Master Storyline & Game Progression Document" was compiled in eight parts. It carries the creation myth, the narrative spine, the Yggdrasil mapping, the Nine Realms, the tier structure and a layer assessment (17 layers fully developed, 20 needing work, 8 missing).
- **Aug 22 or later (Ruled).** The client set the Messenger Principle, described the Nook Effect as the Inn's emotional goal, and approved the progression design (Song Spectrum, Frequency Shift, Resonance Pulse, harmonization instead of death). The client added stones kept as capsules with a won companion to fight alongside.
- **Aug 23 to 24 (Built, commit log).** Named quests (a list of about 30), the Campaign Narrative (8,200 words), the Storyline Atlas (13 threads) and the first Card Game Framework (6 frequency types, 40+ cards) were committed.
- **Aug 28 to 30 (Built, commit log).** The Whisper Layer, the Ragnarok, Einherjar, Final Room and Einstein Syndrome scenes, the Festival quest document, the Nine Muses chains, the product line plan and the first Resonance rules skeleton were committed. The "Einstein Syndrome" addendum is marked as named by the client (**Ruled, commit, Aug 29**).
- **Aug 30 to 31 (Built, commit log).** The novel first draft, tabletop rulebook v1.0, podcast episodes 1 to 9, audiobook Chapter 1, the Egg Hatchery Month 1 event and the Resonance v1.0 spec were committed. Before the Song as a compiled document dates from this window.
- **Late August (August canon).** Before the Song fixed the story's spine: the Murmur, the Egg that is the Murmur made solid, Act One: Arrival, the descent through the Undercity and catacombs, the Egg opening onto the player, and the cycle epilogue. See 2.7.

---

## 1. Quests

### 1.1 The laws that govern every quest

**The Quest Mark Law (ruled Sep 13).** Source: `docs/zone_specs/geode_inn_quest_mark_law.md`. The law says: every game and every quest-giver wears the approach mark, the WoW-descended sign that means "there is story here." You approach, talk, and the resident character gives the hook in their own voice. The mark is the catalog. "Talk to the face, not the menu." The arcade room is one spoke of the Main Floor with 83 games browsed by face and glow.

**The Glow Register (ruled Sep 13, the client's addition to the same ruling).** The kind of glow tells the player how hard the thing waiting is. Harder means lovelier. There is no red, no warning color, no strobe.

| Tier | Name | The glow | What it means |
|---|---|---|---|
| 1 | The Candle | Plain amber candle flicker | Gentle ask. Pick up and play, no wrong way through |
| 2 | The Breath | One slow extra hue breathing through the amber | One mechanic, one idea, held carefully |
| 3 | The Weave | Two or three hues braided in a slow shift | A committed questline leg, real patience |
| 4 | The Prism Spiral | Full rainbow spiral turning slowly (the Prism in miniature) | The deepest asks: legend-tier quests and zone endgames |

Rules that ride along with the mark (all in the same file):
- **Steady Light:** every tier is sine-clamped and amber-anchored. The spiral turns, it never flashes.
- **No-Fail:** the glow is information, not a gate. Any player may try any tier.
- **Anti-Skinner:** the mark never nags. If the player declines a quest, the NPC quietly takes the mark down. It returns only when there is something genuinely new.
- **Room Kit Law:** the mark is part of the resident's character kit (a glow state), not a separate UI layer.
- **The Passive Census (ruled Sep 13 evening):** the Tier 4 rainbow also works as a quiet filter. People who react badly to it reveal themselves and land in Frog Court. The Inn moderates conduct, never belief. Judge Tootenkowl presides, three transformations mean suspension.
- The file says the exact hue per game belongs to each game's own spec session. Status in the file: "CANON, no open gates."

**Other laws every quest must pass.** These are named in the chat logs as standing canon. Each is defined in its own spec; this list is the checklist.
- **Anti-Skinner:** no compulsion loops, no streak guilt, no empty-slot mocking, no looping celebration jingles. Failure is information, not shame.
- **No-Fail:** a wrong move teaches. A soft stone in a hard slot gives a dull click, and the wrong sound is the lesson.
- **Honest Label:** every real-world reference carries a dated, sourced label. Folklore is taught warm, physics proud.
- **Toll Booth Law (Elio filed Sep 25, after a client critique):** every quest or zone intent needs a price, even the no-fail ones. The cost can be soft (time, a kept promise) but it must be charged.
- **Year-and-a-Day Law:** used in Cities of the Dead; the vault welcomes the next family after a year and a day.
- **Bob Doctrine:** a new tool, item or character is "Bob" until it earns a true name. Names are the client's alone to give ("naming sessions").
- **Gateway-and-corridor, knock law, Fair Descent Law:** see 1.5 and 2.5.
- **Historical Master Law:** when a player finishes a build quest, the campfire witnesses the historical master of that craft (ruled by Oct 15 as existing canon).
- **Steady Light for story (Known-Shapes Law, ruled Sep 14 for the Quarter):** drama unfolds, it never ambushes.
- **Survivor's Law (Sep 14):** if the living story loves a character more than the outline does, the outline loses.
- **Sanctuary Law:** no combat, no theft between players; used in Cities of the Dead, gathering and the Cub Layer.

### 1.2 Template: a Quest (one gate or one beat)

There is no single Quest entity in the live app. Quests are specs in the repo, and the engine reads them through Dialogue records (`hookWord`, `voiceProfile`, `priority`, flags, zone) and flags. The fields below come from the Crystal Canticle spec, the Quest Mark Law, and the Oriel/Bone Room flag-chain notes.

| Field | What goes here | Example |
|---|---|---|
| Gate number and name | Order inside the chain, short title in quotes | Gate 3, "The Cat's Whisker" |
| Device or beat | The thing built, found, or done | Crystal radio (galena crystal plus a fine wire) |
| Zone | Zone id and name (`z02` style ids) | `z02` Clockwork Skies workshop, then the Campgrounds |
| Giver / host | The face wearing the mark | Leonardo (host), Beverley (paperwork) |
| Honest label | Real source, dated, and how it is taught | Early 1900s, no battery, "the stone was the radio" |
| Mechanic | The one thing the player does | Hunt the sweet spot on the crystal face |
| Quest Mark tier | Candle, Breath, Weave or Prism Spiral | Spec says "lantern glow" (see To reconcile) |
| Toll | What it costs, in the Toll Booth sense | Donate the Gate 1 sphere to the Archive display case (Open) |
| Reward | A voice, a stone, a permanence, never a stat grind | The campfire feed comes out of nothing |
| Flags | Names of flags the quest sets or reads | Bone Room chain uses 3 flags; da Vinci chain uses 10 |
| Laws in force | Which laws the gate must pass | Anti-Skinner, No-Fail, Honest Label |
| Status | Ruled, Proposed or Open, with date | Gate list Proposed; host Ruled Sep 26 |
| Open gates | Numbered decisions still owed | Name, tolls, seed-stone rule |

### 1.3 Template: a Quest Chain

| Field | What goes here | Example |
|---|---|---|
| Chain name | Title and whether it is a working title | "The Crystal Canticle" (working title, not ruled) |
| Kind | Construction chain, zone chain, character arc, key chain, line | 7-gate construction chain |
| Home zone | Where it starts and where it ends | `z02` Clockwork Skies, ends at the campfire |
| Host / keeper | Who presides | Leonardo (ruled Sep 26) |
| Supporting bench | Other residents the gates use | Beverley (Archive), Calder (lapidary bench), the fizgigs |
| Gates | Numbered list, each filled in as in 1.2 | 7 gates |
| Gates and tolls | Which gates cost something | Gate 3 sphere donation, Gate 6 seed from the player's own collection |
| Tier on the glow | Tier of the chain overall | Tier 3 or 4 for the endgame leg |
| Cultural review | Whether a review gate applies | Required for any living tradition |
| Reward | What the end gives | Heartbeat or Pulse device ticking in every zone |
| Status | Ruled, Proposed, Open | Spec; host ruled; name pending |
| Source file | Repo path | `docs/geode_inn_crystal_canticle_quest_chain.md` |

**Where quests live.**
- GitHub: `docs/zone_specs/` (quest chains and dissections), `docs/` (older chain specs such as `geode_inn_celtic_quest_chain.md`), `docs/builder_messages/` (handover to the fizgigs).
- Base44: Dialogue entity (staging had 515 records at the Sep 10 audit, 524 after Batch 8, 529 after Batch 9; the live app's Dialogue entity was empty as of Sep 3). `QuestCharm` entity holds quest charms.
- Drive: the "Zone Deck: Components & Characters" Google Doc (85 zones) and the storyline card deck (see 1.5).

### 1.4 The walkthrough dissections D01 to D16

Ruled Sep 10: dissections are choose-your-own-adventure. Every option is walked before the paths converge. The client ruled "yes on any direction you see fit" for D01 to D04, and "all confirm" for about 30 flags across D04 to D09 in one pass. Files live in `docs/zone_specs/geode_inn_walkthrough_dissection_NN_*.md` (all 19 files found in the repo, including 06B, 07B, 08B).

| Id | Place | What it settles |
|---|---|---|
| D01 | Egg to front door | Two seconds of Nyx black, then "Before the Song, there was the Murmur. You are the Egg." Only verb is LISTEN. Hatch style (patient, curious, immediate) is logged in EchoMemory. Shell shard becomes the first stone of the geode cave. No class select: the shape of your room key tells your class |
| D02 | First hour, every door | Six hearth options: fire, Market, Library, Arcade, Common Room, Staircase |
| D03 | Staircase | Pulse Line wobble and anchor. Amethyst family says down, sun family says up. Escher Bridge and Void Door visible from hour one |
| D04 | Catacombs | Charon's fare is a frequency (the stone stays in the cave). Persephone's three gifts: silence, memory, a question. Anubis verdicts: "Enough", "Too much", "Lighter than you think". Borrower's Ledger |
| D05 | Undercity | The player becomes the maker (Clockmaker: "What did you learn?"). Memory-lamp streets, Joe's diner, Hollow Men. Stones spend, never shatter |
| D06 | Water Zone | Seven layers. Layer 5 is Katya (no cure framing). Layer 6 Obol gate (found or earned, never bought). Layer 7 twelve standing stones |
| D06B | Lighthouse and the Deep | Beacon at 50 BPM, foghorn 16 to 20 Hz, origin of the six gargoyles. Layer Law: each layer has a place name and a keeper name |
| D07 | Fae Kingdom | Oleander and Malachi one root, two directions. "It's Leander" is the true gate of the Summerlands. Golden Contract text. Queens' Law: three queens, one trunk |
| D07B | Fae queens' spaces | Seelie Bower (canopy), Unseelie Winter Hall (hollow trunk), Queen of Roots Heartwood Court (core) |
| D08 | Cosmology | The Astronomer's Six Questions, answer "Now". Clockwork Skies folded in. Valhalla's only door to the Shadow Inn is upstairs |
| D08B | Cosmic layer | Jupiter Gate (opens to the player's own composed reply), Mars Prison (repetition, Soulstone quest), Pluto's Gate. Galaxy language is cumulative fluency |
| D09 | Forge to Void | Cold Night: the forge rests once a year, set to the launch anniversary. The Rest has no reward |
| D10 | Ascent and endings | Reverse-Plus audio law. Endings STAY, LEAVE, HIDE (texts in 2.3) |
| D11 | In-Between and Shadow Inn | Eight tectonic states, an 84Hz mirror room for room. Seelie grey is summer meeting first frost; Unseelie grey is winter meeting thaw |
| D12 | Canopy and Redwood spine | Inn-Tree holds the Song, Mona holds the queens. Canopy sways at 50 BPM. Tumble's chime completes every frequency trade |
| D13 | Main Floor | Eight doors. Welcome System. Thrum Law on the Score Stone. Common Room keeps nothing. Ragana asks for "Hallelujah" once |
| D14 | Campgrounds | Six doors plus Option 7, the Homestead (building system home). Craft chain from rough stone to the Display Board. Fortune Teller readings are recognitions from EchoMemory |
| D15 | Bayou | Bog Fairy Golem, three buried cities (Mound, River, Circle). Thesis: "The Song isn't anyone's. Same frequency. 42Hz. The Adequate." |
| D16 | Bedrock Fortress and Prism | Seven options. Gatekeeper gargoyle. Prism turns sound into light. Parent-frequency law (Earth's 7.83 Hz is the parent of the Inn's 50 BPM) |

Status: all ruled Sep 10 except the open gates listed in 1.7.

### 1.5 Current canon: every named chain

**A. Cultural and zone chains.** Status for all of these: spec written, passed by the client ("pass it", "approve", "as is", "full approval") on Sep 10, unless noted. Zone names are given as the chat logs give them. Where the chat logs give a chain name without saying which zone it belongs to, I matched it by the order in which the client passed the zones; that match is marked "by order".

| Chain | Zone | Host / keeper | Gates, tolls, notes | Status |
|---|---|---|---|---|
| Celtic Stone Circle and Solstice Chant | Celtic Highlands, Stone Circles | Bard, Oleander (portal kin) | 7 quests plus portal ignition. Repo: `docs/geode_inn_celtic_quest_chain.md` | Spec in repo |
| The Drowned Question | Greek zone, Aegean Light | The Gardener and the Bearsark (Mirror of the Sun chain) | Repo: `docs/geode_inn_greek_quest_chain.md` | Spec in repo |
| The Old Stones | Jotunheim | Vafthrudnir, Well of Mimir | Repo: `docs/geode_inn_jotunheim_quest_chain.md` | Spec in repo |
| The Form Beneath the Form | Desert Bone (O'Keeffe) | The Examiner | Repo: `docs/geode_inn_desert_bone_quest_chain.md` | Spec in repo |
| The City That Chose the Deep | Atlantis | Beverley, "the Librarian Who Speaks in Touch" | Three crossing points ruled Sep 12 "as written" | Ruled |
| The Slowest Frequency | Redwood Cathedral | Queen of Roots | No combat, no timer | Ruled |
| The Cure Grows Beside | Poison Garden (with Combination Still overlay) | Belladonna, the Greenward | Wrong dose is still poison | Ruled |
| Borrower's Ledger | Miskatonic Annex | Naut, Quire (they never acknowledge each other; the window to nowhere stays unexplained) | Five quests for Naut's line | Ruled |
| The Table Remains / Build It Again | Camelot | Artair, Artorios, Arcturus | 7 quests; Avalon is quest 7 and the finale. Grail's Guardians section added Sep 13 | Ruled |
| The Visible Growing | Van Gogh garden | Lichenblossom (Garden That Remembers) | | Ruled |
| The Stone That Answered | Trovant Garden | Stanca (ring-reader) | | Ruled |
| What the Mountain Remembers | Peru | Quilla Mamani | | Ruled |
| Shadows chain | Bosch Shadows (texture zone) | | | Ruled |
| The Patient Replacement | Petrified Forest | | | Ruled |
| The Mead of Poetry | Meadery, by order | Ryan, Thorin | | Ruled |
| The Breathing Stone | Tidal Caves, by order | Vaulknut | 42 minutes each way on compressed tide; Vaulknut scene witnessed only | Ruled |
| The Long Handprint | Spiral Gallery, by order | | | Ruled |
| Clay army's watch | Terracotta pit | Persephone as hinge; "the Awakened One" | No combat, stillness. Terracotta concept itself not ruled in as a level until Oct 1 weave | Ruled Sep 10, woven Oct 1 |
| The Beat Line | Shore, Campgrounds | Zeke, the Bard | Full eight-quest line; the below-court keeps itself (no guardian NPC); Underground Tide companion | Ruled |
| Fuji passage | Japan | | "Shield of lore": legend honors passing, never touches the modern wound | Ruled; wing extended Oct 2 |
| The Many Faces | India ghats | | | Ruled |
| The City in the Branches | Canopy City | Wren (Cartographer) | Treetop marketplace, Trade Bell at 50 BPM | Ruled |
| The Turning | Staircase | Clockmaker, Calder | 6 quests, five flights with five emblems, fifth key is the Turn-key. The Stage at the top is a community venue | Ruled |
| The Last Light | Cave City | Five voice blocks (Gatekeeper, Hearthkeeper, Mourner, Root Reader, Singer) | | Ruled |
| The First Writing | Mesopotamia | | | Ruled |
| The Wandering Guard | Norse and Greek line | The Bearsark | 5 quests | Ruled |
| The Long Wearing | Appalachians (Time) | | 5 layers of Fae, 300 million years | Ruled |

Eight cultural chains were also grouped in the Sep 3 Quest Integration spec: Celtic, Egyptian, Peruvian, Norse, Mesopotamian, Mesoamerican, Southeast Asian, Polynesian, each in five beats (Intro, Research, Descent, Creation, Gate) through Main Floor, Staircase, Catacombs, Undercity and Fae Kingdom. The older Norrath quest system was deprecated Sep 2; only "you don't die, you forget" was kept.

**B. The park chains (ruled Sep 10, "unlock all").** Five giants are five forces, and each park chain hands the player a key. Each chain teaches real science. Repo files are named below.

| Park | Force | Key | Repo file |
|---|---|---|---|
| Colorado Plateau | Consciousness | Thought-key | `docs/zone_specs/geode_inn_colorado_plateau_quest_chain.md` |
| Yellowstone | Matter | Weight-key | `geode_inn_yellowstone_quest_chain.md` |
| Superstition Mountains | Void | Gap-key (completing five giant seats) | `geode_inn_superstition_quest_chain.md` |
| Rockies | Gravity | Pull-key | `geode_inn_rockies_quest_chain.md` |
| Mount Shasta | Wait (hinge zone, dual citizenship with the Silk Road, node #8, 84Hz) | Wait-key | `geode_inn_shasta_quest_chain.md`, `geode_inn_mt_shasta_master_spec.md` |
| Appalachians | Time | (chain "The Long Wearing") | `docs/geode_inn_appalachian_zone.md` |

Rulings in the same pass: dragon-kitten cameo kept; the Plateau giant gives one acknowledgment; the Shasta shard is a silent moment; Cedar is the Elder's name; the line "Don't tell anyone. They'll come looking." ships; amazonite is added as stone #201. Sync file: `parks_builder_sync.md`.

**C. Camelot, Arthur and Merlin.**
- **Shift Arc (Camelot chain, Sep 19):** 1 The Child, Artair, merlin falcon, flight unlocked young. 2 The Warrior, Artorios, berserker bear, earned at manhood. 3 The Old Ruler, Arcturus, Arctur form (griffin silhouette, more bear), chosen not earned. One king at three ages. Woven into the Valhalla layer and the Viking King panels. Status: Ruled in as a weave, the "one king" gates are Open. Name ruled Sep 10 (Artair, Artorios, Arcturus; the earlier "the Wart" retired for copyright).
- **Merlin gates (Sep 25, not yet specced as a chain):** Merlin is a playable merman option (comic direction, the pun on "Mer"). He is an aquatic shapeshifter, unlocked after winning all the sea critter games. The Lady of the Lake is "totally a mermaid." Ruled Sep 25 as direction. **Open gates:** the form list (how many sea bodies), where the unlock ceremony lives (Elio proposed the Lady of the Lake), the name of the mechanic ("The Mer Coat" suggested, not chosen), where the mer-court lives (Norse Coast annex, Water Zone, or a Hollow Earth district), one NPC with two forms or two presences. Also open: the Mystique-floor shapeshifting endgame seed (Proposed, dark half, "dark-half endgame seed").
- Repo: `docs/geode_inn_merlin_archimedes.md` (older, pre-rename, Archimedes became Noctua), `docs/geode_inn_arthur.md`.

**D. The Instrument-Maker line (ruled Sep 12).** A quest line where the player builds history's musical instruments, each its own road. The recipe comes from a keeper or a lore text, materials come from the right zones, crafting happens at the right station, and the first tone reveals itself. The reward is a voice at the drum circle, not a stat. The master of that instrument shows up to hear the first tone (the Historical Master Law). Examples named: the 40,000-year-old vulture-bone flute, the Lyre of Ur (gold, bitumen), the bianqing (stone chimes), the lur (bronze), the sistrum (Bastet's Herding), the Boreal Chime Wind Carillon (birch and amber, Slavic zone). Keepers: the Flute-Keeper (a Neanderthal who never claims the flute; ruled Sep 12), the Doorkeeper (carillon). Status: **Ruled as a line. The catalog of 16 to 24 instruments was never delivered** and no dedicated file was found in the repo. Open.

**E. The Crystal Canticle (spec, Sep 26).** A 7-gate construction chain that builds, in historical order, every device humanity made with a crystal at its heart. Home zone `z02` Clockwork Skies. Host: **Leonardo, ruled Sep 26** (he appears at the campfire to witness the end). Beverley does the honest-label paperwork, Calder runs the lapidary bench, the fizgigs sweep up. Repo: `docs/geode_inn_crystal_canticle_quest_chain.md`, status line "SPEC, host RULED."

| Gate | Device | Notes |
|---|---|---|
| 1 The Seer's Stone | Hand-ground crystal ball that works as a lens | Candle tier |
| 2 The First Spark | Piezoelectric striker (Curie brothers, 1880) | Soft blank gives a dull click |
| 3 The Cat's Whisker | Crystal radio (galena and wire), no battery | Toll proposed: donate the Gate 1 sphere to the Archive display case |
| 4 The Singing Sliver | Quartz oscillator | Room's machines settle when it ticks |
| 5 The Wrist Heart | First quartz watch (1969), 32,768 beats per second | Wearable |
| 6 The Grown Garden | Lab-grown crystal | Toll: seed must come from the player's own collection, bought stones do not take |
| 7 The Player's Pulse (Sep 26) | Own oscillator tuned to the player's signature frequency | Sep 27 recap calls it "the Heartbeat Stone" |

Strip #018 "The Sliver That Kept Time" is the chain's comic. **Open:** the chain name is still a working title, the Gate 3 toll and the Gate 6 seed rule are unruled, five rulings are flagged in the doc, and the Singing Stones wing pitch is unruled. The client confused it with the Dark Side chamber on Sep 27; Elio clarified: the Canticle is a quest chain in `z02`, the lava-lamp sphere is the Dark Side.

**F. Character arcs and meta chains.**
- **The Sentinel's Vigil (Lozen):** three acts in the deck, ten parts in the Sep 11 chat. See To reconcile.
- **The Carrying (Fibonacci, formerly Aughra):** five sittings. Repo: `docs/geode_inn_aughra_quest_the_carrying.md`.
- **Philosopher's Game (Staircase, Tier 3):** five alchemical stages, skill rewarded, intention punished.
- **Nine Muses:** three quests per Muse (hear the frequency, retrieve the instrument, perform). All nine equals Full Spectrum. Repo: `geode_inn_nine_muses_quest_chains.md`.
- **Bone Room (Saker and the Bone Keeper):** 3-flag chain: Saker's tip, delivery, meeting. "The Architecture of What Remains" has five stages (finding, cleaning, whitening, arranging, the cycle).
- **da Vinci's Old School prep (Given Wing):** 10 flags, the longest chain. Workshop on the staircase landing.
- **Naut's The Borrower's Ledger:** five quests, reward the Foundation Stone.
- **Mask Chapter, Carving Wing (funerary arts trilogy):** ruled in Sep 19. Nine gates open across the wing; five on the Mask Chapter.
- **Cities of the Dead (St. Louis No. 1):** seven rooms, Year-and-a-Day Law, six gates open (level name, tomb-tender NPC, ENV row, cultural review, score register, tending quest).
- **The Mason game (Sep 22):** a time-traveling master Mason with a rosewood square and compass. Knowledge gates restoration plans; no symbol grinding. The tool is also an always-available navigation item. Sites are not chosen. Parked until the critter audit closes.
- **Persephone facets, Terracotta weave, Dollkeeper "The Facing," Laughkeeper, Cernunnos slot:** Oct 1 weaves, see 2.5.
- **Endgame:** Einstein Syndrome, The Descent, Deepest Chamber (Set B in the deck), Endgame Three Choices (283 lines), Ragnarok Graduation (255 lines). See 2.3.

**G. The storyline card deck (Sep 29 to Oct 1, Drive and Elio).** Four sets, built for the client's physical game. Card fields: zone, cast, games, arc, tolls, links, open gates (dossiers add origin story).
- Set A, Cultural Chains. Set B, Guardian and Keeper Chains. Set C, The Spine (Song of Making, Reincarnation as Game Mechanic, Mastery and Cosmic Awareness, Soul-Bond, Bloodline, Frog Transformation, the six-tier realm map). Set D, The New Rooms: 21 entries are listed in the chat logs (Marie Laveau, Bitter Grounds, Knitting Circle, Rougarou, Cian, the Tourist, Cities of the Dead, Catacombs weave and Qin Mound door, Undercity, One Joe, Bone Room, Rockies Gossip Belt, God Ladder, Gargoyle Seek, Asian Theatre, Port Purgatory, Lost and Found, Fortune Cookie, Anansi, Norse Coast, Mask Chapter). The chat logs call it "18 cards." See To reconcile.

**H. Newer arcade quest-games that act as chains (all Ruled or Proposed as marked).**
- **Regional Dances (arcade #86, ruled Sep 19):** button-combo dances, soft floor, Mamushka co-op duet, summoning tier at full moon, seasonal wheel. Repo: `geode_inn_regional_dances_spec.md`. Gates open: real name, roster cut, review per dance, Bard's MC role.
- **Gargoyle Seek (#87 candidate, Proposed Sep 19)** and **The God Ladder (#88 candidate, ruled as a request Sep 27)**; **Port Purgatory (#88 candidate, Sep 24)**, so #88 is claimed twice (see To reconcile). **Anansi's Sky-Story Run (#85, ruled Sep 16)**. Repo specs for each are in `docs/zone_specs/`.
- **Shield Mixer (#84 if it passes, draft Sep 12)** and **Dew Circuit (spec Sep 12, dual mode ruled).**

### 1.6 Where quests live (summary)

| Place | What |
|---|---|
| GitHub | `docs/zone_specs/` chains and dissections; `docs/` older chain specs; `docs/systems/geode_inn_witan_hearth_feis_spec.md`; `docs/zone_specs/geode_inn_entry_wall_knock_law_spec.md` |
| Base44 live | Dialogue entity (empty on live as of Sep 3), `QuestCharm`, `EchoMemory`, `EchoMelody` (staging only as of Sep 11) |
| Base44 staging (Elio app) | Dialogue 398 to 529 records, EchoMelody |
| Drive | Zone Deck Google Doc (85 zones), storyline card deck, Inn Generated Art |

### 1.7 Open and to reconcile (quests)

- Glow tier names: the Quest Mark Law has four named tiers, but the Crystal Canticle spec uses "lantern glow" for Gate 3 and "candle flicker" for gates 1 and 2. Use only the four names.
- Sentinel's Vigil: ten parts (Sep 11) versus three acts (Oct deck). Not settled.
- Crystal Canticle Gate 7: "The Player's Pulse" (Sep 26 spec) versus "the Heartbeat Stone" (Sep 27 recap).
- Set D card count: "18" in the chat logs, 21 names listed.
- Roster number #88 is claimed by both The God Ladder and Port Purgatory. #87 is Gargoyle Seek only as a candidate.
- Open D-dissection gates: D13 (Welcome System, Thrum Law, Market phrasing, Ragana's ask, Common Room no-record law, Ziggy placement), D14 (six Campgrounds gates), D15 (Mama Coumine undefined, Marie Laveau resident, craft law, X-mark law), D16 (Stone Guard, parent-frequency law, eighth permanence).
- Instrument catalog, Merlin gates, Mason sites, Quartz-Pebble Skeleton name, Doorkeeper name: all Open.
- Hard zone-line count and placement (Catacombs entrance is the first): floated Oct 4, used in Oct 5 specs, no formal ruling.
- Knock Law: true Morse versus the Inn's own rhythm dialect is Open.
- Early items still open are in 1.8 (Keepers, the Norrath-style rules, festival quests).

### 1.8 Early quest canon (July 12 to August 30)

**A. The Aug 18 starter-zone method (Ruled, early chat).** Seven starter zones were reskinned for real cultures: Teldrassil as Celtic and Druidic, Elwynn Forest as Roman and Mediterranean, Eversong Woods as Egyptian and Persian, Durotar as Mesopotamian, Azuremyst Isle as East Asian, Howling Fjord as Norse, Borean Tundra as Indigenous peoples. Seventeen catacomb instances were reskinned too (for example Maraudon as a Minoan labyrinth). The full list is on GitHub, not in the chat. The quest types are "how they did things": building (the zone changes as you build), writing (glyph puzzles in Ogham, hieroglyphs, cuneiform, runes), ritual (seasonal ceremonies), craft (jade, mosaic, runestone) and trade (Silk Road caravans). Elio also borrowed from AzerothCore: eight reputation ranks (Hated, Hostile, Unfriendly, Neutral, Friendly, Honored, Revered, Exalted), prerequisite chains, instanced zones with save points, and loot templates for stone rewards. Players start Neutral with both Fae courts, and gaining Revered with the Seelie makes the Unseelie Hostile. Elio recommended adapting the systems, not running the C++ server.

**B. The Norrath-style rules (Ruled Aug 21, early chat).** Zone-based traversal (each cultural region is a self-contained chapter), class-based co-op up to four players, faction branching (Seelie and Unseelie), loot equals stones, one mythological boss per zone, arcade games as zone activities. Differences: exploration-heavy, non-assertive difficulty, cozy gothic look, the narrative spine under every zone. No boss is a traditional fight; each tests character. Every class has a moment to shine in every zone. Spec: `docs/geode_inn_norrath_zone_quest_system.md`.

**C. The Aug 18 chains (Ruled as written, early chat; Earlier versions of 1.5A).** The Sep 10 chains in 1.5A are the passed versions. How these Aug 18 chains map to them is not recorded.

| Chain (Aug 18) | Gateway | Quests |
|---|---|---|
| The Sacred Grove (Celtic) | Alfheim | 7: The Empty Circle, The Language of Trees (five Ogham letters), Stone from the Earth (only Preseli bluestone rings), The Sky Map, Raising the Stones, The Solstice Chant (a 3-tone sequence of 64, 111 and 528 Hz, the gargoyle frequencies), The Portal Ignites. Side quests: The Oak's Memory, Fae Mischief |
| Jotunheim (Norse) | Jotunheim | 6, each takes something away: The Gate of Frost (no weapons), The Riddle of Vafthrudnir (answer to the last riddle: "No one living knows"), The Well of Mimir (sacrifice something real), The Hunter's Path (walk at Skadi's pace), The Patient Fire (sit with Surtr for two real minutes), The Mountain Remembers (all four answers are right) |
| Greek | Niflheim | 7: The Modern Legend (Plato's Timaeus and Critias), The Philosopher's Ghost, The Bull and the Labyrinth, When the Mountain Woke (30 seconds of silence), The Drowned Library, The Engineer's Regret, The Question, Not the Answer (a permanent choice of warning, memory, question or mirror) |
| Bastet and the Freyja cat bridge (Egyptian) | not given | Freyja's cats invert Bastet's lessons (stand still, hold your ground). The sistrum carries forward |

Knossos labyrinth puzzles (Ruled Aug 18): the labyrinth "isn't a maze to escape, it's a palace to read," and there is no minotaur. Seven puzzles from The Corridor That Isn't Lost to The Foundation, which ends in a 30-second vision of Knossos alive, then silence.

**D. The remembrance vision, formal spec (Ruled Aug 18).** Each catacomb zone ends with a vision in which the player lives briefly in that culture at its peak. A hidden Remembrance Depth score per zone is never shown. Four tiers: A Glimpse (5 seconds), A Memory (15), A Remembrance (30), A Life Lived (60, the player becomes someone, set by the highest-scoring engagement category). After each vision the player picks one of three symbols and gets a memory shard. Shards are vocabulary, not currency, and at the cosmology level they decide which cosmic gates the player can comprehend. After every vision there is silence. The spec has six states, a depth formula clamped 0 to 1000, a 25 percent replay carry-over and 11 event types. Repo: `docs/geode_inn_remembrance_vision_system_spec.md`.

**E. Living Book (Ruled Aug 19).** Books on the main floor shelves are objects; picking one up steps the player into the story. Each book grants a gemstone tied to its themes. A "Deduction Puzzle" scene type puts clues as cards on a case board. Phase 1 candidates: A Tale of Two Cities, The Divine Comedy, The Odyssey, Beowulf, Frankenstein, Grimm's Fairy Tales, plus a public-domain detective shelf. A locked placeholder reads "This space awaits 2043. The queen's works return to the public domain." (Elio's proposal, the client loved it.) Repo: `docs/geode_inn_living_book_system.md`.

**F. The Keeper Archetype system (Ruled Aug 21; 21 mapped, early chat).** Each Keeper has a culture, a test and a verse medium. Collect every verse from every Keeper across all 191 regions and bring them to the Geode Cave. The Keeper stands for the first time and says "Now sing it." The player sings the Song of Making, and every stone vibrates, every gargoyle activates and the Singing Tree chimes. The Keeper then says "Good. Now do it again tomorrow."

| Culture | Keeper | Test | Verse medium |
|---|---|---|---|
| Appalachia | The Granny Woman | Work (split wood, carry water) | An unaccompanied old ballad |
| China | Nüwa | Silence | Guqin |
| Norse | The Norns (Urd, Verdandi, Skuld) | not given | A glowing amber thread, woven |
| Celtic | The Cailleach | Endurance | A storm chant in Gaelic |
| Egypt | Seshat | Admitting you don't know | A scroll read aloud |
| Andean | Pachamama | Offering | not given |
| Slavic | Baba Yaga | Fear | One whispered Old Slavic word meaning "live" |
| Japan | Sarutahiko | Presence | Silence (the concept of ma) |
| Indigenous Australian | The Spider Grandmother | Respect (walk the songline in order) | Walked, each strand a tone |
| Greece | The Sibyl | Interpretation | Ancient Greek fragments |
| India | Saraswati | Creation | not given |
| Navajo | Changing Woman | Return in all four seasons | A woven cloth |
| Inuit | Sedna | Witness | The deep ocean bass hum |
| Finland | Louhi | Making | not given |
| Maya | Ix Chel | Cycles | Poured water |
| Aztec | Tlazolteotl | Confession | Breathed |
| Yoruba | Iya Nla | Recognition | not given |
| Cherokee | Selu | Gratitude (grow the corn, then give it back) | A pattern in the kernels |
| Hawaiian | Pele | Release | Heat |
| Sami | Mattarahkka | Rhythm | The drum |

The Inn's own Keeper is the master version. Elio mapped 21 of 191 regions and said 183 more follow as zones develop (the arithmetic does not match, see To reconcile). Repo: `docs/geode_inn_regional_keepers.md`, `docs/geode_inn_regional_keepers_part2.md`.

**G. The Song of Making hunt (Ruled Aug 21).** Hidden in a room beneath the Stone Circle Chamber, with no map marker and no quest arrow. The player must finish both the Seelie and the Unseelie chains (normally one is picked), then align all six Standing Stones to a hidden third position (Artisan Thief only). Inside: a golden scroll on a Preseli Blue Stone pedestal, in two halves, the Song and the Contract. Contract text: "The Song shall not be silenced. All who learn it are bound to sing it forward. The Song is not owned, it is carried. There is no penalty for breaking it. There is only the silence that follows." Signatures are frequencies (111, 432, 528 Hz and one unknown 42 Hz). Repo: `docs/geode_inn_song_of_making.md`.

**H. The tabletop festival questline "Festival in the Middle of a Raid" (early chat Aug 21, commit log Aug 29).**
- Source: the client's own tabletop campaign. A festival is raided, the trophy needed to elect the master of mead is stolen, and arrows tipped with portal potion scatter the party. A d6 picks the location: orc village, Murloc hut, elf hot tub, dwarf basketball, LARP, harpy day care. Elio's mapping (Proposed): the portal arrow is a reusable system, the mini-games are the warm silly side, and there are two registers, a mythic voice for the spine and a Discworld voice for the living world.
- Aug 29 official quest doc (**Built**, commit): six portal encounters, a throughline with three hidden encounters and a "Three Suits" achievement, a "Filing Cabinet" side quest, the Meadmaster's Election as the conclusion, a zone adaptation table and the portal potion mechanic. Repo: `docs/geode_inn_festival_quests_official.md`, `docs/games/geode_inn_tabletop_questline_analysis.md`.
- Five integration phases Elio recommended (portal arrow as a Fae Kingdom system, festival framework, ported mini-games, the gem NPC, food buffs): **Proposed**, no reply recorded. Food buffs, Quest-as-Trust and three resolution paths per zone quest (combat, diplomacy, puzzle) are Elio proposals too. See To reconcile for the clash with no lethal combat.
- The five classes came from this questline (Artisan Thief, Bard, Tinkering Weeaboo, Librarian Crone, Chameleon Druid), with the Sentinel added as class 6 on Aug 21. Class rules belong with the character parts of the manual.

**I. Named quests committed Aug 23 (Built, commit log).** The Living Map (Cartographer), The Silence Between (Nyx), The Borrowed Body (Guest), The Fixed Point (Lighthouse vigil), The Starlight Crystal (Constant), The Garland (Kali), The Reflection (China), The Stirring (Peru), The First Word (Slavic), The Shell's Song (Canadian Rockies), The Ether's Frame (Badlands), The Needle's Thread (Superstitions), The After (Pirate), The Mirror and the Shore (Siren), The Comfortable Map (Shifting Man), The Echo and the Crown (Seelie King and Queen), The Chorus (Schoenberg), The Open Channel (Mozart), The Walls of Uruk and The First Writing (Mesopotamia), The Empty Houses (the Town), The Sepulchre by the Sea (Poe), The Extinction That Wasn't (Vessel), The Last Light (Cave City), The Architecture of What Remains (Bone Room, 5 stages), The Right Word (Thorin and Marijke), The Carrying (Aughra, five sittings), The Question (Astronomer, six quests), The Sentinel's Vigil (10 quests in 3 acts). Rewards are nearly always a tool or a perception ability, not a stat. Before the Song uses the quoted-title pattern throughout and adds The Welcome, The First Column, The Seed, The Humble Objects, The Story, Form Sight, The Sixth Light, The Sky Is for Everyone, The Feast Fire, The Gorgon's Garden, The Reclamation and The Hungry Lion.

**J. Chains added Aug 28 to 30 (Built, commit log).** Nine Muses chains (27 quests, Aug 29), the Water System (21 quests, 7 water stones, Aug 29), the Oceanianoir chain (Rosetta Stone, Missing Element, Typo, Aug 29; the character was later renamed Oceananoir), Mona (8 stages, Aug 30), the Observatory Quest Chain, Mirror Systems (a Shadow Inn 7-quest chain, an Einstein In-Between 3-quest chain, the reversed staircase for LEAVE), the Important Tier (Da Vinci 3 quests, Cartographer 3, Astronomer 6 questions, Norns and Weaver), the Endgame Quest Integration, and "Quest integration with tabletop-voice quest-giver dialogue" (including the "42 rule"). The Sentinel questline "The Sentinel's Vigil" (10 quests, 3 acts) was committed Aug 30.

**K. The Vessel quest "The Extinction That Wasn't" (August canon).** The player hears that a gecko who kept the Inn's master formula was declared extinct. Accepting that means playing without the formula (harder, vessels switched). Refusing means climbing to the Canopy City's highest platform and looking in the leaves. The Vessel chirps "...You looked." and settles on the left shoulder. Reward: the Master Formula, a compendium entry linking every hub, quest, stone and character. Quest block pattern: premise, accept branch, refuse branch, reward.

**L. Portal characters and the reason rule (August canon, built Aug 24 in the commit log).** Portal travel is character-based. No glowing portals and no "click here to travel." Eight portal characters, eight methods: Pirate sails, Charon poles, Guest walks slowly, Owl gives one word, Cartographer gives a map, Wednesday walks at a normal pace, the Stone Circles hum, Cthulhu describes from memory. One rule: a portal character takes the player only to a zone the character has a reason to go to ("the reason is the permission"). Overlapping routes are alternatives, and the route is the content. Each record has Home Hub, Primary Portals, Overlap Portals and Method.

**M. Canopy City vendor quests (Elio summary, early chat).** Eight vendor platforms plus the neutral Keeper: a stone-cutting dispute that was never a dispute, a silent commission that builds a monument to the Silk Road, an information exchange that is the game's roadmap, and the Keeper's lost culture. Repo: `docs/geode_inn_vendor_map.md`.

**N. Open (early quests).**
- Egyptian, East Asian and Indigenous chains were still to be written on Aug 18. A match for each in 1.5A was not found by name, except Mesopotamia ("The First Writing").
- Muspelheim, Svartalfheim and Vanaheim content was not yet written on Aug 18.
- Bedrock Fortress encounters, the deep lab and the 44Hz question were promised and not built (Aug 22).
- The voluntary descent after the Mesopotamian chain (the Inanna model) has no mechanics beyond one sentence (August canon).
- Sparta synchronization game, a formal Atlantis arcade game, and the roadmap-only games (Easter Island, Petra, Mexico, Dragon's Descent, Crystal Catcher, Angkor Wat, Dragon Tiles, France) were promised and not built.
- The unfinished Aug 28 gap list in the commit log: "Bard's Family Concert" was not seen as built.

---

## 2. Story canon and laws

### 2.1 What it is

Sources of truth: `docs/geode_inn_campaign_narrative.md`, `docs/GEODE_INN_PROJECT_BIBLE.md`, `docs/geode_inn_complete_walkthrough.md`, `docs/zone_specs/geode_inn_endgame_master_spec.md`. The Project Bible holds the Design Principles (for example #8, Spine Law, the periodic table is the curricular spine; the Steady Light Law is also numbered 8, see Part 8, 3.4).

### 2.2 The narrative spine (current canon)

- **Master Storyline (Sep 3 spec):** "The Inn was not built. It was remembered." Five pillars: Reincarnation as accounting, Mastery as perspective, Soul-Bond, Bloodline, the Frog. The Iron Giant theme "You are who you choose to be" was added to the spine (Sep 1).
- **Inn philosophy (InnCore, permanent):** "The Inn at its core is the power of what MAY BE, not good or bad, simply there. Meaning is defined by each person independently. The Inn doesn't hand you a flag, it hands you a room." InnCore record: decision date Sep 1, version 1.0, permanent.
- **Frequencies:** Living 42Hz (the Song), Shadow 84Hz (the octave, not evil), In-Between (grey where both harmonize). Heartbeat 50 BPM. Watcher gargoyle 111Hz, Listener 64Hz. Earth 7.83Hz. Cosmic Egg 0.3Hz (one beat every 3.3 seconds). The Constant carried 41.7Hz from the last cycle. 44Hz is the future that must not arrive. 32,768 Hz (quartz) stays outside the canon frequencies (ruled Sep 12).
- **Storyline Atlas (13 threads):** Song, Silence, Measurement, Fire, Water, Naming, Root, Stone, Thread, Wandering, Building, Embedded, Egg.
- **The Egg:** the player arrives as the Egg (D01). The Campaign Narrative has 10 acts and ends with the Egg opening to reveal the player. Reincarnation is the save system: the per-save ending is permanent and the Egg opens again.
- **Whisper Layer:** three layers (Surface, Whisper, Awareness). No villain. The endgame question is "will you STAY?"
- **Level order (master level system, as stated Oct 14):** 1 Cosmology, 2 Clockwork Skies, 3 Main Floor, 4 Campgrounds, 5 Staircase, 6 Catacombs, 7 Fae Kingdom, 8 Water Zone, 9 Undercity (Hollow Earth at the roots). Ruled Oct 14: **Level 1/2** is the In-Between (a half level, not numbered) and the **Void** gets its own half-level, sibling to the In-Between. earlier messages say "9 levels" and "10 levels" both; the half levels settle it.

### 2.3 The endgame

- **Three endings (ruled Sep 10, "all confirm"):** STAY ("You were never a guest. We just hadn't finished the paperwork."), LEAVE (a shard and an unlocked door), HIDE (the hidden become the next players' easter eggs). Reversed Staircase (Rubedo, Albedo, Nigredo) belongs to LEAVE. Patterns are built into the triad: Lozen's wide stance is STAY, Vaulknut leaving the sea is LEAVE, Charles's skin is HIDE.
- **Final Room:** seven hidden conditions, none displayed (all nine levels, all three endings, Philosopher's Stone earned, Egg hatched, Whisper Layer acknowledged, 100+ stones, Silica Thread traced). A small door appears. Contents: fire, chair, cup, a book with no author. Under 1 percent of players.
- **Philosopher's Stone stage:** a state of being, not an item. Final choice: consume (44Hz arrives) or release.
- **Ragnarok:** three descriptions exist.
  - Sep 2 master spec: Ragnarok is *completion*. Five phases: Fimbulwinter, the Gathering, Shadow Inn surge, the 44Hz approach, Resolution (the Traveler chooses STAY or COMPLETE). The 42nd death aligns with 42Hz and the Egg cracks. Eight Einherjar live in Valhalla on the Cosmology level.
  - Sep 19: build items still owed: Fimbulwinter art, the Gathering quest, the merge visual, the Chronometer of the Final Note.
  - Oct 14 ruling: Ragnarok is an **event across existing levels**, not its own zone. Oct 15 recap: Phase 1 weaponizes six instanced Shadow Inn zones, Phase 2 turns Cosmology into the battlefield, and the player prevents it by keeping the 42Hz Song incomplete. See To reconcile.
  - Repo: `docs/zone_specs/geode_inn_ragnarok_master_spec.md`, `docs/geode_inn_ragnarok_graduation_scene.md`.
  - Earlier (Aug 22 to 30): the Aug 22 Master Storyline listed Ragnarok, the Einherjar and the Silica Thread as "missing layers," with the open question whether the Inn has a cycle-ending event of its own. The commit log shows Einherjar (8 endgame raid warriors, Valhalla chamber) and Ragnarok built Aug 29, the Ragnarok scene (3,006 words) and the Grand Collision scene (2,742 words) Aug 30. Before the Song's own ending is the Egg and the cycle epilogue (2.7), with no Ragnarok.
- **Earlier (Aug 24 to 30): story scaffolding.** Storyline Atlas (13 threads, Aug 24), Campaign Narrative (8,200 words, Aug 24), the Backwards Walk (15 steps, 10 threads, 22 gaps found, Aug 30) with seven gap scenes written, the Endgame Scenes batch (5,246 words), the Final Room scene (2,348 words), the Sync Paradox scene (2,645 words) and the Einstein Syndrome scene (2,313 words). All Built (commit log). The Aug 30 loose-ends audit counted 40+ open items (17 narrative, 23+ characters) and said the story was 85 to 90 percent novel-ready. Repo: `docs/geode_inn_loose_ends_audit.md`, `docs/geode_inn_campaign_narrative.md`, `docs/geode_inn_storyline_atlas.md`.

### 2.4 Template: a Story Law or Canon Ruling

| Field | What goes here | Example |
|---|---|---|
| Name | The law's name | Quest Mark Law |
| Date and who ruled | Date, "client" or "Elio proposed" | Sep 13, client |
| The rule | One or two sentences | The harder the ask, the lovelier the light |
| Laws that ride along | Linked laws | Steady Light, No-Fail |
| Status | Ruled, Proposed, Open | Ruled |
| Source file | Repo path | `docs/zone_specs/geode_inn_quest_mark_law.md` |
| Gates | Open numbered decisions | None |

### 2.5 Events, festivals and the calendar

**Dates actually fixed in the chat logs**
- **May 16:** Cernunnos gets a slot on the Druidic wheel; the observance also honors the Sentinel house-wide (ruled Oct 1).
- **Launch anniversary:** the Cold Night, when the Forge rests once a year (D09, ruled Sep 10). The actual calendar date depends on the launch date, which is not set.
- **December:** Campgrounds Highland Games (ruled Sep 14); the Gazette seasonal column FROM THE BENCH opens when the season opens.
- **Every 18.6 years:** the Standstill Window at the Stone Circles, the 18.6-year egg on the Beat Line.
- **Every 28 days:** an Egg Hatchery cycle, community vote Stay, Leave, Hide (the early records) or Nurture, Release, Hide (Sep 10 note).
- **Wheel of the Year (Seasonal Wheel, ruled Sep 19):** maypole for Beltane, harvest circle, solstice rounds, wassail processions; the Seven Sisters circle holds equinox and solstice rites; moon phase gates dances off the sky clock.
- **The Doorkeeper clan's seven turns (ruled Sep 28):** Imbolc, Ostara, Beltane, Midsummer, Lammas, Mabon, Samhain. **Yule is the open eighth**, possibly the "quiet turn." On those days the masked Catacombs Doorkeeper takes the mask off among family and sits to listen to the birch-and-amber carillon.
- Exact calendar dates for the other turns are not stated in the chat logs. Use standard dates only after the client confirms.

**The Wild Hunt (ruled Oct 1).** The Hunt rides whenever it pleases. No schedule, it cannot be farmed or summoned. The leading mask rotates by the Host's mood (Odin, Hellequin, Gwyn ap Nudd with white hounds with red ears, Herne, Sluagh Si). West windows of the Inn are closed at night "out of manners." Cernunnos is the warden of the wild the Hunt rides through. The Hearth-Hound legend (Cwn Annwn, ruled Sep 13) is the hound that stayed. Open: which mask leads, where the horned one stands.

**Hearth-Feis and the Witan (ruled Sep 12).** The in-game gathering is the Hearth-Feis, held at the campfire every third festival: laws recited (Steady Light, Anti-Skinner, Gathering Law), history told, canon events convened, the Gazette covers it. No chair, the Inn presides by listening. The word "Council" is taken by the Council of Thinkers, so the institution uses Witan, Gorsedd or Hearth-Feis. Repo: `docs/systems/geode_inn_witan_hearth_feis_spec.md`. The tale-cycle idea (one teller per feis, Canterbury style) is parked.

**Other canon events**
- **Grand Collision:** all 37 zones flow down through the tree's roots. The Dark Side chamber is its innermost room (build sheet: ten tasks, built last).
- **The Great Renaming** (Gazette strip, Sep 9).
- **Egg Hatchery events:** "The Cartographer's Egg" (first), "The Crone's Casting" (Event 1 in the Sep 4 note; the Crone is now Ragana, and the event title stays).

**Template note.** Events use the Story Law template (2.4) plus: trigger, schedule (or "never scheduled"), who presides, what the Gazette does.

### 2.6 Open and to reconcile (story)

- Ragnarok: completion with a STAY or COMPLETE choice (Sep 2) versus a raid the player prevents (Oct 15). Needs one reading.
- Level count language (9 versus 10 levels) is settled by the half-levels, but older specs still say "10."
- Yule slot and the real calendar dates for the six other turns.
- Cold Night date (needs the launch date).
- Half-level numbering details for the Void are "filed" but the exact designation is not shown.
- Hatchery vote wording (Stay, Leave, Hide versus Nurture, Release, Hide).
- Early story conflicts are in 2.10.

### 2.7 The founding story in Before the Song (August canon)

Before the Song (late August, compiled canon) opens with a prologue, then **Act One: Arrival**, then one section per area (Main Floor, Alchemical Staircase, Canopy City, Cultural Zones, Undercity, Water System, Fae Kingdom, Building System, Wandering Program, Music Room, Nine Muses), then **The Endgame: The Egg** and an **Epilogue: The Song Continues**. Only Act One carries an act label. The "descent" is the Undercity and catacomb sections, and the novel's five parts (arrival, main floor, descent, ascent, egg) follow the same spine (3.1). Everything below is **August canon** unless a later ruling is named. Where 2.2 and 2.3 differ, those later sections win. The compiled document is in the repo as `before_the_song.txt` (repo root) and `library/reference/Before_the_Song.docx`. The separate story files are `docs/zones/geode_inn_origin_story.md`, `docs/zones/geode_inn_origin_story_ch6_conversations.md`, `docs/geode_inn_master_storyline.md` and `docs/geode_inn_the_egg.md`.

**The spine in nine beats**

1. **The Murmur.** "Before the Song, there was the Murmur." It is not sound yet. It is what exists before frequency and before time organizes vibration into meaning: the hum of potential, the pre-architectural drone the Inn was built from. Put your ear to the oldest stone in the deepest catacomb and listen with your bones. The Murmur does not play, it is. Dissection D01 (ruled Sep 10) keeps this as the first line the player meets: "Before the Song, there was the Murmur. You are the Egg."
2. **The Cosmic Egg.** The Egg sits in the deepest chamber and is the Murmur made solid. The prologue says it looks like a river stone, smooth, dark, unassuming, and weighs nothing different for years. It is the raw potential from which the 42Hz Song was organized. Every frequency in the Inn is the Murmur's child. A second passage (Part Twenty-Six) says "Before the Song, there was the egg" and that the egg murmured, and lists the world's eggs the Inn holds as one egg: Orphic (silver, Phanes), Hiranyagarbha (golden womb), Pangu, the Kalevala world-egg, and the Egyptian egg from the waters of Nun. Its location: at the bottom of the In-Between, below the Undercity and below the roots, in a chamber with no walls, floor or ceiling. It is found, not built.
3. **The cycle before this one.** The current Song is 42Hz. The previous universe sang at 41.7Hz, and the one before it is unnamed. The Constant, the oldest being in the Inn (an Annunaki, "a putter-of-things-in-order"), carries a starlight crystal through the void between cycles, a compressed fragment of each dying universe's Song, and seeds the next cycle with it. The crystal pulses at 41.7Hz. The Constant trusts the void and does not calculate it.
4. **The top of the Inn.** Nyx is the void and the silence between the chat logs. The complete Song is all the chat logs and all the silences, and without Nyx the chat logs would be the Murmur again, unorganized. The Astronomer could calculate when the Song will be complete and will not: "The question is more beautiful than the answer." The Guest is Death on holiday in a borrowed body, holding a music box whose single note creates a sphere of silence. The Captain's time ship, the Arcana, runs on a Cabbit that becomes its drive core. The Observatory is a Magritte painting made architecture, with a living pipe that says "Ceci n'est pas une pipe." The meta layer: the observer's presence makes the Inn real, and Einstein, in the grey In-Between, says "You are not walking through the Inn. The Inn is walking through you."
5. **Act One: Arrival.** The player walks through a real, ancient forest (the Rousseau reference), a calibration, not a challenge. The Inn-Tree is a tree that is a building: bark is wall, canopy is roof, roots are foundation, branches are corridors, solid outside and open inside (the Magritte "Double Secret"). Inside the air is amber and the floor is living wood. The Host stands by the fire and says "Room's ready." He asks no name and no payment, because the Inn does not charge. The room is a nook in the trunk with a window onto the Canopy City, "the Inn's first gift." Three companions arrive: the Cabbit (cat face, rabbit ears, purr at 50 BPM, there before the player), the Vessel (an angular crested gecko, declared extinct 128 years ago and rediscovered, holding a fragment of the Song's formula), and the Duck (a non-magical platypus thief who delivers a labradorite, the first stone). The first quest, The Welcome, ends when the player sits in the first nook; the reward is the geode cave opening with Quartz placed.
6. **The descent.** The Undercity is the city of the dead, cozy gothic: "the dead are neighbors," they sit on benches and read. Charon ferries them and says one phrase to every soul, "...There you are." The player pays a stone (obol stones also come from the Tomb Tunnel game). Death is a ceremony in seven beats, ending with a new cycle "lighter by one stone." The Egg lies deeper still.
7. **The Egg opens.** The Egg enters the player's bag and murmurs there for the rest of the game. It opens only when the player has collected every available companion (the chat names the Duck, Vessel, Dragon and Owl; the rest are not listed). The condition is completeness, not power, "a recognition." Inside is the player: not a reflection or an avatar. The player character (the Artisan Thief, a selkie) is revealed as the Egg, and the jeweler's apron that is also the seal skin was the shell. Nothing is transformed, the player is revealed. The Vessel's chirp at this moment is "...You went deeper," not "...You looked."
8. **The thesis.** "You are the Murmur. You always were. The Murmur is not something the Inn was built from. The Murmur is something the Inn was built FOR." Without the player the Inn is stone and frequency. The comedic form of the same idea is the Einstein Burrito: the mundane is the cosmic, the burrito is the Egg, the Egg is the Murmur, the Murmur is the player, "the adequate is: enough." After the Egg opens, the Crone measures the empty space and writes "...It was shaped like a burrito," her first joke in 42 cycles. The release valve is a moment, not a cutscene and not a quest.
9. **The epilogue.** The Inn does not end, it cycles. The player who opens the Egg and lives every storyline becomes the next Constant and carries the crystal into the next cycle. The Crone says "Adequate." The last sound is Nyx, the silence between the last note and the first note of the next cycle: "The silence is: adequate. The silence is: enough."

**New Game Plus after the Egg (August canon).** The player can play as a secondary Inn character, each the Inn "tilted two degrees": the Crone (the Inn as measurement, observation, no fighting), the Vessel (the Inn as a grip, persistence), Mim (the Inn as a mess, breaking is making), the Dragon (the Inn as a geode, accumulation and sleep), the Owl (the Inn as a vigil), the Constant (the Inn as a cycle, carrying the starlight crystal) and Nyx (the Inn as silence, being). These are concept-level only. No quests or mechanics are specified.

**Einstein's one speech (August canon).** Trigger: survive Stage Three (Erasures) of Survivors of the Song for three minutes. The screen goes grey, a candle burns in the In-Between, and Einstein gives his single plain speech (847 words by the Crone's count). Points: time is the difference between two observations, the hum is the Song and "you are inside it," Erasures remove the intervals, "You are the In-Between. Not the corridor, the observer." The speech ends "The adequate is: enough. Enough is: here. Here is: you." After it the color returns like ink in water, Einstein blows out the candle and is gone, and the player keeps all stones with the Master Formula active. It happens once. The Einstein Syndrome addendum, the Final Room and the Sync Paradox scenes were committed Aug 29 to 30 (Built, commit log).

**The creation myth and pillars, earlier wording (Aug 21 and 22, August canon).** The Master Storyline Part 1 says the Inn "was not built. It was remembered." (2.2 gives this as the Sep 3 spec; the line is older.) The creators were gods who shaped a species from their longing and wove artistic frisson into it. It was not their intention that the species continue this long. The experiment grew wild and began to garden itself. As technology evolves, the creation slowly merges with its makers. The Song of Making: the universe is a song, the gods sang the world into being, and technology (silicon) is the world developing its own voice. The Inn is a resonance chamber for the Song. The player who collects every stone and activates every frequency performs the Song unknowingly. The Golden Contract is hidden at the deepest point of the Fae Kingdom, and the gargoyle frequencies are signatures on it. The Owl answers "42" to the question of meaning. Origin Story Draft 1 (Aug 21) has five parts: The Garden That Was Not Planted, The Weight of Ripples, The Bond, The Bloodline, The Inn. Part Six has nine dialogues: The Color That Calms, The Question Why, The Sanctuary, The Trees of the Ancients, The Owl's Humor, The Frog and the Power, The Intelligence Wakes, The Inn Takes Shape, The Inheritance.

The five pillars of 2.2 appear Aug 21 and 22 in this wording: (I) reincarnation as accounting, not comfort, with death as a ceremony; (II) mastery gives perspectives, not treasures (Jupiter the storm, Galaxy Language, Mars Prison for those who refused to see their pattern, Pluto's Gate the last question); (III) the Soul-Bond, an optional entwining that cannot be broken even after the final level; (IV) the Bloodline, a humming dark magic of witnesses, with the Owl as marker; (V) the Frog Transformation, moderation as a rite. Co-op rules for the bond were not specified.

### 2.8 The Nine Realms and tiered access (August canon, from the Aug 18 chat and the Aug 22 Master Storyline)

The Aug 18 ruling (client proposed, Elio agreed) made the Inn-Tree Yggdrasil and the Nine Realms the quest architecture. The staircase is the Bifrost: a "rainbow bridge made of stone and rune, not light," where each step lights as its realm unlocks. Bottom step Midgard (always open), top step Asgard (endgame). Repo: `docs/geode_inn_nine_realms_architecture.md`.

| Realm | Inn place | Theme | To reach it |
|---|---|---|---|
| Midgard | Main floor | Market, modern legends nook, library; cultural zone quests; building, writing, trading | Always open |
| Muspelheim | The Staircase | Fire, alchemy, crafting; Miracle Max's shop (to be designed) | Main floor quests, Friendly with 2+ factions |
| Nidavellir | Deep workshops under the catacombs | Dwarf master craftsmen, masterwork crafting | Main floor quests, Friendly with 2+ factions |
| Alfheim | Fae Kingdom, Seelie Court (Summerlands) | Riddle and wit quests, golden and green | Fae Kingdom portal (Standing Stones game or the Celtic stone circle chain) |
| Svartalfheim | Unseelie Court and the five-zone Labyrinth | Shadow and trial | Same portal |
| Jotunheim | Deepest catacombs, border zones | Giants as primal forces, endurance and boss quests, the Uhtred Principle ("Destiny is all") | Catacomb exploration, Revered |
| Niflheim | Frozen catacombs | Preservation and archaeology quests | Catacomb exploration, Revered |
| Vanaheim | Upstairs nature and seasonal wing | Seasons, seidr, seasonal ritual quests, the Gardener | Seasonal quest completion |
| Asgard | Upstairs cosmology | Cosmic awareness, the Allfather, Jupiter gate | Exalted with multiple factions |
| Hel (Helheim) | Deepest catacombs, the Stone Circle Chamber | Death as transition, ancestor quests, "NOT the Christian hell" | Final descent |

Tiers: 1 Midgard (foundation, cultural zone quests, core arcade games Phase 1 to 4, quest style matches the culture), 2 Bridge Realms (Muspelheim, Nidavellir), 3 Fae Realms (Alfheim, Svartalfheim), 4 Deep Realms (Jotunheim, Niflheim), 5 High Realms (Vanaheim, Asgard), 6 Hel (the final descent, the Golden Contract hidden beneath the Stone Circle Chamber, "not in triumph, but in understanding"). Aug 18 gateways (Elio's mapping, **Proposed**): Celtic to Alfheim, Egyptian to Hel, Mesopotamian to Niflheim, Norse to Jotunheim, East Asian to Vanaheim, Greek to Niflheim. The Pirate can earn the title Dread Pirate Roberts around Tiers 5 to 6 by being recognized as able to carry the weight, then retires to the dock. Status: this is the early level model. The master level system of 2.2 (stated Oct 14) and the walkthrough dissections (Sep 10) replace it as the working order. How the two relate is not recorded.

### 2.9 Early story laws and events that still stand (some Ruled, some August canon)

- **"Not a game you win. A place you belong."** The Inn's thesis (stated by Elio, agreed by the client, mid-August). It points at the Host's welcome before earning, the Catalyst asking "what happened?", the Drink Journal of stories not scores, the frog system, no FOMO, no battle passes and no daily login streaks (**Ruled**).
- **The Sacred Trio (Ruled, mid-August).** Host is Father, Catalyst is Spirit, Crone is Word, with the Bard as the Fool who loves all three and the Brownies as the hands. Mapped across six traditions. Repo: `docs/geode_inn_sacred_trio.md`.
- **The death line (Ruled, mid-August).** "Your name is known, your rest is earned." The line stays the same in every culture, and the being who says the last word changes by zone: Charon "...There you are." (Greek), Anubis "...Go lightly." (Egyptian), the Morrigan at the Ford (Celtic). Obol: a stone from the player's collection. Weighing of the Heart: the feather is honest weight, not moral purity. A heavy heart goes to Ammit, but the Inn has no permanent annihilation. Devouring is conversion, and the weight carries into a harder next cycle, "as physics, not punishment." The player lightens it by helping, giving, letting go. Repo: `docs/geode_inn_death_sequence.md`.
- **Voluntary descent (August canon).** After the Mesopotamian chain the player may take death as a chosen descent (the Inanna model) instead of only the taken descent (the Persephone model).
- **Messenger Principle and Nook Effect (Ruled, Aug 22 or later).** Sound vibration as messengers of past generations' knowledge. The Nook Effect: people unwind at the Inn, then feel tired the next day without knowing why. Elio set it as the user-experience statement. Tiredness is "the cognitive receipt" and the game never pushes past it. Sitting and watching in a nook is a mechanic, and the National Parks veil is pierced by sitting and watching (August canon). The commit log has it as a design principle on Aug 23 (no loop, no reward, no repeat, anti-grind, anti-FOMO).
- **Progression has no XP (Ruled Aug 22 or later; August canon).** The Song Spectrum, the Frequency Shift and the Resonance Pulse replace the XP and health bars. Levels are qualitative: new arrival, initiate, delver, bedrock walker, Song-binder. Victory is synchronization, "not a fanfare, a heartbeat." (Built, commit, Aug 23.)
- **Harmonization, not death (Ruled, Aug 22 or later).** No lethal combat. The player perceives a dissonant being's frequency, matches it with collected stones, its true form is revealed, and it becomes a companion in a geode capsule. Water monsters use a side-scroll (a vibrating stone is thrown). Retreat to a nook is the checkpoint. Frog transformation is moderation, not combat.
- **The moon puzzle (Ruled, Aug 22 or later).** One of the last vibration puzzles is projecting an item to the moon. After the client's Star Wars joke Elio kept it as a deliberate misread: a lullaby, not a weapon.
- **Design principles stated Aug 21 (August canon).** The Inn is a sanctuary for the nervous system (gentle light, no flashing, no urgent timers, non-assertive quests). The color is amber, not blue and not dark. The two-century rule: draw a line two centuries back, beyond it the record is neutral ("We do not interpret. We preserve."). Translation routes through language families, not English. The Owl answers "42" to a truly cosmic question about 2 to 5 percent of the time, with no explanation. The AI intelligence powers the Owl, speaks through Cthulhu's riddles and reads the Remembrance Visions.
- **The Wandering Program (August canon, built Aug 24 in the commit log).** Inn creatures wander into the real parks to see whether humans are ready, meaning humble, not enlightened. They tilt two degrees through the In-Between (no portals, no flying), leave an ordinary river stone as "the Inn's handshake," and bring back an observation, not an object. Six steps: Approach, Signal, Assessment, Contact (ready only, a moment), Return, Learning. Winter has the fewest wanderers, summer the most. Each ready human adds a room to the Inn ("the Inn is the humans it has met"). The Crone's count: 7,842 assessments in 42 cycles, 1,203 ready, 6,639 not ready, 1,203 rooms added. Extended late August to four layers (Surface, Fae, Cryptid, Regional). Cryptids are Inn creatures seen at the tilt, not fakes, and the human's naming is "the saving mechanism." Repo: `docs/geode_inn_wandering_program.md`.
- **Modern Legends mechanics (August canon, commit Aug 24).** Encounter, Naming, Telling, Cataloguing, Re-encounter. See 5.9.
- **Recognition Frequency (Built, commit, Aug 24).** Rare frequencies near each other make the architecture respond: two warm the light, three turn walls into archways, four or more make the Singing Vines bloom unscheduled.
- **Egg Hatchery (Built, commit, Aug 30 to 31).** The Egg monthly hatchery and "The Teacher" (Aug 30), Egg and comic-strip integration (Aug 30), Month 1 "The Crone's Casting" with 3 eggs on a 28-day lifecycle (Aug 31), and a /hatchery web beta spec (Aug 31, spec only). Repo: `docs/egg_hatchery/egg_hatchery_event_1.md`.
- **Event note.** The Aug 21 tabletop analysis suggested time-limited annual festivals. Before the Song's core philosophy says no limited-time events. This is open (2.10).

### 2.10 Open and to reconcile (early story)

- **What the Egg is made of.** The prologue says it looks like a river stone. Part Twenty-Six says it is made of the murmur, "not stone, crystal, metal or wood." Both are August canon.
- **44Hz.** The prologue calls it the frequency of the void between cycles, reached when the Arcana runs at full power. A later spec map calls 44Hz the proposed completed Song. 2.2 calls it the future that must not arrive (and 2.3 says consuming the Philosopher's Stone brings it). Three readings, no ruling.
- **Egg ending versus three endings.** Before the Song ends with the Egg opening, New Game Plus and the player becoming the next Constant. It says nothing about STAY, LEAVE and HIDE (ruled Sep 10, 2.3). How they fit is not recorded. The Final Room (2.3) does require the Egg hatched.
- **Act labels.** Only "Act One: Arrival" is labeled. The novel's five parts and the 10 acts of the Campaign Narrative (2.2) are the other structures. A single act table was not found.
- **Wandering Program scope.** First "seven core critters in US parks" (Aug 24), then a four-layer global system (late August).
- **Level model.** The Nine Realms tiers (Aug 22) and the master level system (Oct 14) are two models. Mesopotamian and Greek both open Niflheim in the Aug 18 mapping. Egyptian opens Hel. Nidavellir and Svartalfheim are used for both the dwarf forge and the Unseelie Court.
- **Quest name.** "The Starlight Crystal" (commit log, Aug 23) and "The Starlit Crystal" (Before the Song name list) for the Constant's quest.
- **Festivals and combat.** The Aug 21 tabletop analysis proposes three resolution paths per zone quest (combat, diplomacy, puzzle) and time-limited festivals. Both clash with "no lethal combat" and "no limited-time events." Not reconciled, Proposed only.
- **Cthulhu's place.** Main floor by the fireplace (Part Three and the Master Storyline), the catacombs (section 9.7), or the Catacombs in the Part One diagram. Not reconciled.
- **Six unfinished sentences.** The heading says six and seven are listed (the seventh is the Cabbit).
- **Voluntary descent** has no mechanics. **New Game Plus** is concept-level only. The list of "every available companion" is unwritten.

---

## 3. Novel, book and anthology

### 3.1 What exists

- **Novel "A Song of Stone and Silence."** 5 parts (arrival, main floor, descent, ascent, egg) with 40 chapters. First draft 37,034 words (Sep 3); the Aug 31 note said 43,000 words and 18 files; target length 120,000 to 150,000 words. Expansions: Desert Bone, Egypt Gates, Shadow Chapters, Part 4 chapters, Part 5 Stillness, Epilogue. A "Soul Map" (the Inn's orientation packet) was named as "probably the novel's true table of contents" (Sep 24).
- **Repo files:** `docs/library/novel/novel_part1_the_murmur.md`, `..._part2_the_main_floor.md`, `..._part3_the_descent.md`, `..._part4_the_ascent.md`, `..._part5_the_egg.md`, `novel_expansion_*.md`, and three whole-book versions (`the_geode_inn_novel_complete.md`, `_consolidated.md`, `_final.md`), plus `novel_consolidation_guide.md`.
- **Three-book plan (Elio proposed Sep 1, no explicit yes):** book one "Daily Echoes: Stones from the Geode Inn" (podcast essays), book two the novel, book three longer stories. The project "started as a book about rocks."
- **Product line:** novel, graphic novel (5 volumes, 670 pages planned; Volume 1 art not generated), audiobook, tabletop game. Graphic novel layout: `docs/geode_inn_graphic_novel_layout.html`.
- **Canon-diff audit:** the novel needs an updated version before release. Elio proposed (Sep 21) a canon-diff audit that maps everything ruled since August onto the five parts, and the client liked the idea. **Status: Open, awaiting the client's go.** The audit has not been run.

### 3.2 Anthology

Two things are called "anthology":
1. **The anthology census (Sep 30, ruled).** Elio mines every chat session for characters, zones and concepts. Status tags: **Ledgered** (has a spec or dossier), **Mentioned**, **Ghost** (talked about, never filed). Three bins: characters, zones, concepts (mechanics, laws, items). Then one anthology dossier per confirmed item in the deck card format. File: `anthology_census.md` (started; census not run past file creation).
2. **Art-teacher interactive anthology** (parked Sep 12, beside the "interactive artist lessons" idea).

### 3.3 Template: a Book or Anthology entry (non-library)

| Field | What goes here | Example |
|---|---|---|
| Title | Working or final | A Song of Stone and Silence |
| Form | Novel, graphic novel, anthology, essay book | Novel, 5 parts, 40 chapters |
| Status | Draft, first draft, edit pass, canon-diff done | First draft, 37,034 words |
| Canon-diff done | Date of last audit against rulings | Not yet |
| Source files | Repo paths | `docs/library/novel/` |
| Open gates | Decisions waiting | Updated version before release |

### 3.4 Open

- Run the canon-diff audit (needs the client's go).
- Which of the three novel text versions in the repo is current.
- Title consistency: the chat logs call it "A Song of Stone and Silence"; the repo file names say "the_geode_inn_novel."

### 3.5 Early period (Aug 21 to 31)

- **Product line (Built, commit log, Aug 30).** Novel (120,000 to 150,000 words, 5 parts), Graphic Novel (5 volumes, 37-artist system), Tabletop Game (Frequency Engine, 198 stones, 37 zones), then Audiobook, the Podcast "Daily Echoes", and the Card game "Resonance" as the sixth product. Repo: `docs/geode_inn_product_line_plan.md`.
- **Novel first draft (Built, commit log, Aug 31).** "A Song of Stone and Silence," complete first draft of 34,400 words in 5 parts. The existing figures are 43,000 words (Aug 31 note) and 37,034 words (Sep 3). See To reconcile.
- **Interactive graphic novel layout (Built, commit, Aug 31).** 5 volumes, 40+1 chapters, about 120 scenes.
- **Origin story (Ruled Aug 21).** The client decided the chat dialogues are a chapter of the origin story. Draft 1 has five parts plus Part Six (2.7). The Aug 21 draft header says "Draft 1 - August 21, 2026 ... by the client, smoothed with Elio." Elio asked the client "what feels right, what feels off, what's missing" and no answer is recorded (Open).
- **Interaction summary (Built, commit, Aug 24).** 139,564 words of raw conversation from Jul 22 to Aug 24 saved as "summary of building geode inn." The compiled Project Bible backup (Aug 23) held 168 documents, about 3.65 million characters, in 28 sections.
- **Complete game walk-through (Built, commit, Aug 21).** 16 parts, 1,240 lines, about 84,000 characters: The Inn; The Player; Main Floor; Cosmology Level; Canopy City; Cultural Zones; National Parks; Alchemical Staircase; Catacombs; Water System; Fae Kingdom; Cosmic Narrative; Full Character Roster; Six Unfinished Sentences; The Words; Next Steps. The Words table: "Adequate" (Crone, Owl), "Good" (Leonardo, Retort), "Enough" (Cook), "Familiar" (Constant), "Oh" (Constant with the Cabbit), "Stay" (Captain), "...Go lightly" (Anubis), "...There you are" (Charon). The Master Storyline adds "Better" (Crone).
- **Narrative voice for the beta (Built, commit, Aug 31).** A blend of Rothfuss, Pratchett, Gaiman, Asimov, Bradbury and Weir as references.

---

## 4. The Gazette (comic strips)

### 4.1 What it is

The Geode Inn Gazette is a four-panel comic. Each strip has four panels, a "button" line in panel 4, a script in the repo gallery, and a `ComicStrip` record. The storyteller voice is the Firekeeper's (Tim Curry tribute). The Gazette is product #10 (live Sep 9). Lineage of the humor (canon): Hagar the Horrible, The Far Side, Questionable Content, Girls with Slingshots (Futurama added later). Rule: honor, do not copy. Images are 2x2 with a title band: four panels plus one assembled strip, five images.

Rules (all ruled):
- **QC Law (Sep 12):** the Gazette posts when a strip is worth it, never obligated. The board never begs. A rest day shows a warm shrug.
- **Gazette Board (Sep 12):** a space at the top of the opening page, dark stone with a brass frame, brass arrows with a soft crossfade, a plaque line (number, title, date, zone), a door to the archive. Builder message: `docs/builder_messages/gazette_front_page_builder_message.md`.
- **Daily workflow (Sep 10):** a scheduled Base44 workflow at 6:00 AM America/Chicago. The system doc says midnight server time, and the QC Law softened "daily." See To reconcile.
- **FROM THE BENCH (Sep 14, Proposed then agreed):** a seasonal column where real commissions become Vaulknut strips. Founding Four (Tri-Canid Weave, Keeping Medallion, Ammolite Trio, Dagger Collar).
- **Strip Zero:** "The Greek Yogurt Accord" (Sep 4), filed as an unofficial pre-Gazette archive strip.

### 4.2 The schema fix (Sep 12)

The live app validates two fields as **strings**, not a list or a boolean.
- `playerAdventures`: a string. Use `None - NPC feature (<name>)` for pure-NPC strips. An earlier spec line said boolean; it was corrected.
- `panelImageUrl`: a string of panel URLs, comma-separated.
- `isPublished`: boolean, true when published.

Fields in the system doc (`docs/geode_inn_comic_strip_system.md`): `stripNumber`, `date`, `title`, `panels` (JSON array of 4: `artStyle`, `zone`, `caption`, `characters`), `characters`, `playerAdventures`, `zone`, `artStyle`, `imageUrl`, `isPublished`. Elio's notes add `panelImageUrl`.

### 4.3 Template: a Comic Strip

| Field | What goes here | Example |
|---|---|---|
| `stripNumber` | Next free number (see numbering law below) | 33 |
| `title` | Short title in the tabletop voice | The Octopus That Wasn't for Sale |
| `date` | Publish date | 2026-10-14 |
| `zone` | Primary zone | Faire to Waters |
| `artStyle` | Primary zone artist | Klimt gold on dark |
| `characters` | Everyone who appears | Vaulknut, the labradorite octopus |
| `playerAdventures` | String; the player event, or `None - NPC feature (<name>)` | `None - NPC feature (Vaulknut)` |
| `panels` | Four objects: `artStyle`, `zone`, `caption`, `characters` | Panel 4 carries the button line |
| `panelImageUrl` | Comma-separated panel URLs (string) | url1,url2,url3,url4 |
| `imageUrl` | The assembled strip | `strip.png` |
| `isPublished` | true on publish | true |
| Repo folder | `docs/gallery/gazette/strip_<NNN>_<slug>/` with `script.md` and panels | `strip_033_the_octopus_that_wasnt_for_sale/` |

Numbering rule (proposed, needed): use the next free zero-padded number in the repo folder name, and never reuse a number. Today #004 was used five times (see below).

### 4.4 Where it lives

- GitHub: `docs/gallery/gazette/` (scripts and panels), `docs/geode_inn_comic_strip_system.md`, `docs/library/specs/comic_strip_page_spec.md`, `comic_strip_builder_spec.md`, `docs/pages/comic_strip_page_spec.md`, `docs/comics/` (older single files such as `strip_002_the_oldest_cold_case.md`, `strip_018_the_sliver_that_kept_time.md`).
- Base44: `ComicStrip` entity in **two apps**. The Elio staging app holds the full run. The live Geode Inn app ("Comic Nook") refuses cross-app writes from Elio.
- Backend: `getDailyStrip`. Page: `/gazette`.

### 4.5 Current canon: strips, with status

Repo copy (Oct 22) holds script folders for #001, #003, #004 (two folders), #008 to #014, #016, #017, #020, #021, plus `docs/comics/` files for #002 and #018. The rest are known only from the chat logs.

| No. | Title | Date | Star / zone | Where |
|---|---|---|---|---|
| 0 | The Greek Yogurt Accord | Sep 4 | Lozen | Staging |
| 1 | The Postmaster's Route (Sep 12 note, repo folder) or The Great Renaming (Sep 4 and Sep 9 notes) | Sep 9 or 12 | Postmaster; Ragana, Malachi, Zeke, Katya, Vaulknut | Live (#1 to #3) and repo |
| 2 | The Oldest Cold Case | Sep 12 | Bone flute dispute | Live and repo |
| 3 | The Spine and the Jellyfish | Sep 13 | Chemistry spine | Live and repo |
| 4 | The Door That Never Locks (Sep 14); The Hound Who Stayed (Sep 15 repost); The Keg and the Name (Sep 17); The Pocket-Change Gate (Sep 30); Three Mouths, One Braid (Oct 7, "#4") | various | Catalyst and Molly; Vaulknut | Mixed; see below |
| 7 | The Art of Seeing | Sep 11 | Quire, Canopy City | Not in repo |
| 8 | Molly and the Bill | Sep 16 | Molly, Bill the Duck | Live and repo |
| 9 | What the Traveler Carried | Sep 18 | Bard | Repo |
| 10 | The Easel That Faces the Wall (repo title only) | about Sep 18 to 19 | not given | Repo |
| 11 | Three Skins | Sep 19 or 20 | Viking King | Staging and repo; live refused |
| 12 | The Throat of the Building | Sep 21 | Watcher gargoyle | Repo and live (noted) |
| 13 | The Silence Is the Road | Sep 22 | Unvoiced, Bard | Repo, live record |
| 14 | The City Where Nothing Bites | Sep 23 | Charon, cemetery cat | Staging only; live refused |
| 15 | The Ground Remembers | Sep 24 | Quire | Live record noted |
| 16 | The Word in the Flask | Sep 25 | Calder, Unless | Staging only |
| 17 | The Building Has Ears | Sep 26 | Spoken Road | Gallery |
| 18 | The Sliver That Kept Time | Sep 27 | Leonardo | Repo; live refused |
| 19 | The Honest Liar | Sep 28 | Vaulknut, Apatite | Commit a6deb45 |
| 20 | Every Door But One | Sep 29 | Catacombs Doorkeeper | Repo |
| 21 | What the Margin Kept | Oct 1 | Quire | Staging, repo gallery |
| 22 | The Booth That Sold Nothing | Oct 2 | Laughkeeper | Staging only; live refused |
| 23 | The Stone That Stays | Oct 3 | Vaulknut | Record live per notes |
| 24 | The Wall That Keeps Receipts | Oct 4 | Lozen | Pushed |
| 25 | The Form That Stays | Oct 5 | Charles | Pushed |
| 26 | The Broom That Kept Time | Oct 6 | A fizgig, Engine Room | Not specified |
| 27 | The Minutes Are Available | Oct 8 | Naut and a brownie | Pushed |
| 28 | The Helmets Are Honest | Oct 9 | Viking gnomes | Staging and repo |
| 29 | The Bones Are Honest | Oct 10 | Skeleton duck | Published by workflow |
| 30 | The Stone Is the Soup | Oct 11 | Retort and Cook | Repo and record |
| 31 | The Slot That Was Always There | Oct 12 | Postmaster, Elio | Committed |
| 32 | The Breath Between the Bars | Oct 13 | Oriel and the Catalyst | Comic Nook #32 |
| 33 | The Octopus That Wasn't for Sale | Oct 14 | Vaulknut | Staging only; **live refused** |

Other strips named: "Death and Yogurt" (S14, the client-conversation comic, ruled official title Sep 12), a baby-dragon run of four strips (S25, S27, S35, S40; series title and placement Open), the rogues' gallery strip (Anansi, Molly, Duck; standing gag), Tattletale Trays, and the kilted Bard strip (all Proposed).

Six strips were staged on Sep 1 as seed records: The Room That Wasn't There, Letters to the Sentinel, The First Stone, The Watcher Sees All, The Catch, Bedtime Stories. Their relation to the numbered run is not stated.

### 4.6 Live versus staging

- **Live app (Comic Nook):** only strips #1 to #3 are confirmed live. On Oct 14 and 15 the chat logs say the published archive "still only holds strips #1 to #3." This contradicts several "record live" claims for #12, #13, #15, #23 to #25 and others. Treat #4 onward as **staging until checked in the live app.**
- **Staging (Elio app):** holds the full run up to #33.
- **Sync owed:** copy the staging records into the live app by a builder function or manual entry.

### 4.7 To reconcile (Gazette)

- Strip #001 title: The Postmaster's Route versus The Great Renaming. The repo has `strip_001_postmasters_route`; the chat logs also record the Great Renaming as "#001" on Sep 9.
- Strip #004 was reused five times (Door That Never Locks, Hound Who Stayed, Keg and the Name, Pocket-Change Gate, Three Mouths One Braid). Two are in the repo under `strip_004_`. The Keg and the Name and Door That Never Locks need new numbers. Base44's records, copied to `docs/base44_data/elio/ComicStrip.json` on October 30, number seven strips as 4 (the five above, The Watcher Sees All and Joe's Kitten); #1 is used four times, and #2, #3, #5 and #7 twice each.
- Strip #7 (Sep 11) predates #1 (Sep 12). Numbers are not date-ordered at the start.
- #005, #006, #010 (notes give no title; the repo gives #010), #015 and #026 details are thin.
- Daily 6:00 AM workflow versus QC Law "when worth it."

### 4.8 Early period (Aug 28 to 31)

- **Daily Comic as a planned feature (Built, commit log, Aug 28).** The Aug 28 session checkpoint lists "Daily Comic" with Shadow Inn, Octave System, Jigsaw Puzzles, Card Games and Cosmic Crew. The comic strip system document was committed Aug 28 in a batch with the Giants, the Mason NPC and the Living Book framework. Repo: `docs/geode_inn_comic_strip_system.md`.
- **Egg and comic strip integration (Built, commit, Aug 30).** The Egg monthly hatchery and the comic strips were linked on Aug 30. The integration is not described further.
- **/gazette page (Built as a spec, commit, Aug 31).** "Web Beta specs: /gazette comic strip display page." Spec only, no implementation seen in the commit log. The page and its route are the same one in 4.4.
- **Open.** Nothing in the early period fixes the strip numbering, the workflow time or the Board design. Those come from Sep 9 to 12 (4.1).

---

## 5. The library

### 5.1 What it is

The Inn's archive: books (the `Book` entity), lore (the `Lore` entity), and the Parchment Lore shelf. Principle (ruled Oct 5): put more focus on the size of the library. The archive is public domain, pre-industrial primary sources, with a two-century cutoff ("Time law of the Archive"). Legal posture (ruled Sep 15): "build like it's clear, list like it isn't." Book text can be read in game as long as the archive.org link is live, nothing is public until a legal pass. The archive.org account is the client's: she drops new items, Elio pulls, dedups and shelves them.

### 5.2 Counts, as the chat logs give them

| Item | Count | Date / note |
|---|---|---|
| Book records after the Sep 1 import | 625 | 861 entries together with Lore |
| Lore records | 236 | World Mythology 208, Ancient Civilizations 15, Sacred Geometry 12, Creation Myth 1 |
| Planned new Lore records | 22 | 9 Alchemy, 8 Astronomy/Cosmology, 5 Esoteric Traditions; manifest only, live import unverified |
| Placeholder Book titles replaced | 323 | Oct 5, live app, via archive.org and Library of Congress |
| Parchment Lore essays | 282 | Oct 5, labelled Inn Originals, 15th shelf |
| Books after Parchment Lore | 907 | 625 + 282 |
| Clean PDFs in the Drive archive | 447 | 12 categories; 5 quarantined in folder `bb` |
| Mythological creatures in the census | 1,268 | 191 countries (shown on the Lore entity per Sep 13 note; does not match the 236 Lore records) |
| Transcript-derived stories | 453 unique | From 1,338 .docx; not imported to Book |

### 5.3 The 14 shelves plus Parchment Lore (ruled Oct 5)

1 Stones and Earth Sciences. 2 Botany and Herbalism. 3 Astronomy and Navigation. 4 Alchemy and Early Science. 5 Sacred Geometry and Number Lore. 6 Freemasonry and Esoteric Traditions. 7 Folklore and Mythology. 8 Antiquities and Archaeology. 9 Languages and Dictionaries. 10 Childhood and Early Readers. 11 Music and Songbooks. 12 Crafts and Trades. 13 Theatre and Performance. 14 Periodicals and Serials. 15 **Parchment Lore.** Suggested dig order: Childhood and Early Readers, Folklore and Mythology, Languages.

Zones used for books: Archive, Main Floor, Staircase, Upstairs. Narrative-weight tags: `rewrite-the-rewrite` (suppressed history; 11 initially), `celtic-preservation`, `masonic-library`, and others. Toxic texts (the Rosario titles and similar) stay out of the Inn and out of the library (ruled Sep 1).

### 5.4 Template: a Book entry

| Field | What goes here | Example |
|---|---|---|
| `title` | Real title (never a placeholder) | Arcana Caelestia |
| Author | Flatten to a plain string, not a stringified list | Emanuel Swedenborg |
| Shelf and zone | One of the 15 shelves, one of the four zones | Freemasonry and Esoteric Traditions, Archive |
| `languageIso`, `languageName` | Language | la, Latin |
| `ocrStatus` | Required; the import fails until set | Set to a status value from the schema |
| `hasOcr` | Boolean | true |
| `archiveOrgId`, `sourceUrl` | Where the scan lives | archive.org identifier |
| Tags | Narrative-weight tags | `rewrite-the-rewrite` |
| Date of source | Must be pre-industrial | 1750s |
| Honest label | Anything unverified marked as such | "Attribution uncertain" |

### 5.5 Template: a Lore entry

| Field | What goes here | Example |
|---|---|---|
| `title` | Country or topic name (country lives in the title on live) | Wales |
| `country` | Null on live; filled on staging | null |
| `category` | World Mythology, Ancient Civilizations, Sacred Geometry, Creation Myth, Alchemy, Astronomy/Cosmology, Esoteric Traditions | World Mythology |
| `content` | The essay text | A culture essay |
| `tags` | Array; "Inn Originals" for Parchment Lore, plus map region and game name | `["Inn Originals", "Wales"]` |
| `creatures`, `waterCreatures` | Arrays (staging only) | Afanc |

### 5.6 The Inn Transcript Archive (ruled Sep 30)

A printable archive of the client-and-Elio chat, in PDF volumes of about one day each, working backward from mid-September. Volume names `vol_NN_YYYY-MM-DD.pdf`. Each volume is also kept as an editable Google Doc in Drive folder "Inn Conversation Archive" (inside the master build folder). A workflow ("Inn Transcript Archive," hourly, cron `20 * * * *`, America/Chicago) compiles volumes silently and delivers once. Pipeline notes: `imessage_archive/PIPELINE.md`. The client called it "the backbone of our zone building." Status: Volume 1 delivered Sep 30; the rest still compiling as of Oct 8.

### 5.7 Where it lives

- GitHub: `docs/library/data/geode_inn_pdf_archive_manifest.json` (447 files), `docs/library/data/geode_inn_parchment_lore_shelf_2026-10-05.json`, `docs/library/data/lore_category_sync_manifest.json`, `docs/geode_inn_archive_library_plan.md`, `docs/library/data/podcast_story_catalog.json`.
- Base44: `Book`, `Lore`, `BookTranslation`, `ScholarlyBridge`. Imports to the live app used a direct API call (PUT works, PATCH does not).
- Drive: PDFs, "Inn Conversation Archive," Word folder with the 282 country essays.

### 5.8 Open

- Thin duplicates (Voynich, Roman Forgeries, Hennepin).
- A copyrighted title found in the set (the Anti-Masonic Party book) and one scan with no record.
- Build the archive.org group with the 14 shelves.
- Locate the Parchment Lore expansion beyond the 282.
- The 22 planned Lore records and the 11 extra books from Sep 1 had no confirmed live import.
- Lore count (236) versus the 1,268 creature census.

### 5.9 Early period: library plan and the Modern Legends shelf (July 22 to August 31)

**Library plan (early chat, Aug 18 to 19).**
- Placement by subject (Built, pushed to GitHub Aug 18): history, archaeology and paleontology to Downstairs; philosophy, theology and alchemy texts to the Staircase; religion to the main floor library; poetry, world literature and language to the main floor nook area; space to Upstairs; math, science and social studies to a Reference section. A LibraryBook entity with an archive.org link per book card was planned (Proposed). The later Base44 entity is `Book` (5.4).
- Research mapping of the client's Drive text (Built Aug 18): 82 files scanned, none excluded: 33 Downstairs, 29 Modern Day Legends, 7 World Religions, 7 Upstairs, 6 Staircase. 17 videos needed transcription. A second pass added 81 more files from four source folders, for 163 files, then 174 with the Trees folder. Over 40 videos were still pending. File: `docs/geode_inn_research_mapping.md`.
- The "from steam deck" folder (Aug 19): about 445 to 450 PDFs of pre-industrial academic texts from archive.org, total library reported as 617+ files (Masons 53, American Journal of Science and Arts 72, Oxford 184+, Yale 28 including the Voynich Manuscript and the Book of Enoch, Royal American Magazine 12). The client said only half of the schools were done and estimated 900+ PDFs at the end. This is the source of the later 447 clean PDFs in 5.2.
- Metadata per upload (template, Aug 19): title, author, date, subject tags.
- Schema (Built, commit, Aug 21): Book, BookTranslation and ScholarlyBridge (a translation can route Sumerian through Kramer 1963 to English to Japanese, with attribution). Language family tree committed the same day. The two-century rule and "translate through language families, not English" are in 2.9.
- Aug 28 docs structure (Built, commit): a `library/` tree with zones, characters, items, mechanics, storyline, card_game, art, emblems and reference, plus a master index. 255 markdown files catalogued Aug 28, Elio's Reference Library of 258 files Aug 30, and the repo at 361 docs and 504 commits on Aug 30. The Aug 30 library reorganization moved files into this tree.
- Miskatonic Annex (August canon): 4,000+ volumes searchable by archive.org link, with the chains "The Lost Books," "Research Threads" and "The Librarian's Secret" (the Librarian and the Host are one entity). Phrase: "Before the first word, there was the hum." The Annex is a brick building on the grounds with an unnamed ageless librarian. The 4,000+ figure is the early design number; the live counts are in 5.2.
- Pike books (Open, early chat): waiting for the client to add digital copies so Elio could catalog the Mars mythology, astral listening and space-time cycle as Annex entries.

**The Modern Legends shelf (Ruled Jul 22; criterion changed late August).**
- Jul 22 (Ruled): a shelf on the main floor for contemporary folklore. Entry 1: the Serrano parable, written as folklore (the blind seer, the gift abused, the trial by fire, the one who studied). One slot reserved for Entry 2. Before the Song names Entry 1 "The Blind Prophet's Trial." Repo: `docs/geode_inn_modern_legends.md`.
- Admission test Jul 22: "Will this still be worth telling in 2126?" **Changed late August (August canon):** "Does this story preserve a human encounter with something the human couldn't fully name?" The shelf "is not about the supernatural, it is about the human." The Crone preserves each legend as told and does not correct it.
- Five mechanics (commit, Aug 24; Before the Song): Encounter, Naming, Telling, Cataloguing, Re-encounter. The shelf is the Wandering Program's record (2.9).
- Eight categories (August canon): Glimpse, Door, Measurement, Warmth, Melody, Geyser, Technology, Temple. The Crone's count is 8 categories and 24 entries. About 25 titles are named across the document, for example "The Shape in the Redwoods," "The Humming Arch," "The Counted Layers," "The Warm Summit," "The Song Under the Waves," "The Laughing Geyser," "The Wrong Time" and "The Temple in the Canyon."
- Entry shape: title in quotes, category tag, a one-paragraph story, then "the shape/thing is: <Inn truth>," "the modern legend is: <what the human concluded>," and "the brain said: <rationalizing phrase>."
- Indigenous stories are "the original modern legends." The Redwood Cathedral entry must honor the Yurok and Tolowa peoples and its ranger-who-knows is a Yurok tribal liaison. The Petrified Forest ranger is a Pueblo tribal liaison. The Inn collects and shelves what they already created.
- Other planned material (Jul 22, Proposed): the gargoyle vibration claim, Lovecraft on the shelves, Dracula (Stoker, 1897) as separate from the historical Vlad, and the pattern of institutional reframing.
- The Veil Map (Proposed, mid-August): a journal the player fills by piercing each park's veil. Completed, it becomes a shelf book, "The Residents: A Field Guide to the Things the Parks Don't Talk About." No build recorded.
- Neutrality rule (Ruled Aug 21): the Aryan and Arya material, like the Roman and Vlad material, uses original sources only on their own terms and is flagged for careful handling. The Anunnaki are shown neutrally as the ancient sources describe them.
- Living authors (early chat, Open): the client planned to pitch authors on explorable worlds of their books. Pitch points: authors keep ownership, canonical and author approved, drives sales. Not decided or done.

---

## 6. Podcast and audiobook

### 6.1 Podcast: Daily Echoes

- 11 episode scripts written (23,000 words with the Monad Arc deep dive). Episodes 1 to 9 daily (about 15 minutes), Episode 4 "The Inn Song" Friday deep dive (about 45 minutes), Episode 10 "The Shadow Inn," Episode 11 "The Library That Reads You." Named titles: "The First Stone," "The Garden That Stays," "The Sentinel's Vigil," Episode 6 "The Frequency of the Floor" (also a file named "the cartographer's mistake").
- Six episodes were loaded on live as `PodcastEpisode`; every `audioUrl` is empty and no audio has been produced.
- Podcast creator strategy (`docs/library/specs/geode_inn_podcast_creator_strategy.md`): strip host personas from transcripts, keep raw stories; invite creators once launched. No interviews, no outreach before launch (ruled Sep 13). Tiers: The Basement, Sean Clayton, Skinwalker Ranch (tier 1); The Why Files, Mr. Ballen (tier 2); open call (tier 3).
- Repo: `docs/library/podcast/podcast_episode_outlines.md`.

### 6.2 Audiobook

- Spec: 566 lines (`docs/library/audio/audiobook_production_spec.md`). 10 episodes map 40 chapters. Three alternate endings (Stay, Leave, Hide) chosen by the listener at Chapter 36, interactive format on the site and Steam. 74 voice profiles. A stone tone plays at the stone's Mohs-hardness frequency, 12 dB below narration. Seven Inn Mode room profiles. A 50 BPM heartbeat drops out at three moments: prologue, Final Room, epilogue. 42Hz to 84Hz shifts are hard cuts. The Devil's Interval (tritone) scores the Undercity and Gorgon's Garden. About 300 production hours; six distribution platforms.
- Chapter 1 script: `docs/audiobook/audiobook_chapter_1_script.md`.
- Heard-Text Law (Every-Mind Welcome charter): every Archive text can be heard in voice using the audiobook's 74 profiles.

### 6.3 Open

- All audio production (podcast and audiobook).
- Episode count differences (11 scripts, 6 on live).

### 6.4 Early period (Aug 30 to 31)

- **Podcast "Daily Echoes" (Built, commit log).** Episodes 1 to 9 and the Week 1 outlines were committed Aug 30 to 31 as the product line's podcast. Titles in the commit log: 1 The First Stone, 2 Beverley's Rule, 3 The Market Morning, 4 Joe's Kitten, 5 The Gargoyle Hums (the Friday deep dive), 6 The Frequency of the Floor, 7 The Composer's Hands, 8 The Common Room, 9 Lozen's Vigil. These differ from the 6.1 list (for example Episode 4 "The Inn Song" and the Sentinel's Vigil title). See To reconcile.
- **Audiobook (Built, commit, Aug 31).** Chapter 1 is "The First Frequency."
- **Episode source (early chat).** The podcast and the Modern Legends shelf draw on the client's Drive transcripts (Sean Clayton, Travis S. Taylor, The Why Files, Mr. Ballen). Creator persona stripping and outreach rules are in 6.1.
- **AI voice and recorded lines (Proposed, early chat).** Base game is text plus tone. An AI-assisted conversation mode is a possible premium feature (the Catalyst's bar already has a free dialogue tree or a premium natural-language mode). A few recorded human lines (5 to 10 per major character) are planned only for key moments. If an AI-dialogue tier is built, the voice must be original, not fine-tuned on any reference actor.

---

## 7. Cards: Resonance and the Royo deck

### 7.1 What it is

**Resonance** is the Inn's Hearthstone-style CCG: "a CCG where the player who listens wins." Spec of truth: `docs/zone_specs/geode_inn_resonance_card_game_master_spec.md` (older: `docs/geode_inn_card_game_spec.md`, rules v1.0, `beta/resonance_prototype.html`). The Royo deck is the 54-card playing deck (tarot-style layout) built on the same cast.

### 7.2 Core rules in the repo master spec

- Five stone slots on the board; a Chord of five matching frequencies wins instantly ("The Inn Song"). Stacks of 2, 3, 4 give bonuses; clashes raise a dissonance meter. 37 board zones with passive effects.
- Modes: Ranked, Casual, Arena (draft), AI vs NPC (Naut contemplative, Ragana control, Erik aggro-warmth), Harmony 2v2 (future). Twin Crystal is the pair reward.
- Card types in the master spec: Stone Cards 198, Element Charm Cards 118, Quest Charm Cards 45, NPC Cards 45+ (plus 22 in the September Wave).
- **Frequencies in the repo spec: GROW, STAY, SENSE, SING, CALM, NULL.** See 7.5 for the three overlapping systems.

### 7.3 The Sep 22 rework: six colors including Grey

Elio proposed, the client agreed ("it's ruled" for the Black/White flip; the sixth color was the client's idea).

| Color | Identity |
|---|---|
| White | Illumination, law, exposure, purity, certainty. Asks: "What happens when nothing is allowed to hide?" |
| Blue | Archive, inquiry, water, frequency |
| Black | Fertile darkness: night sky, roots, shelter, memory, ambiguity, stories, protected knowledge. Asks: "What survives in darkness?" |
| Red | Hearth, craft, performance, impulse |
| Green | Grove, stone, beasts, regeneration |
| Grey | The in-between seam. Phase out and return changed; move between Living, Shadow, In-Between; delay an event; keep the last ability as an Echo; borrow another color. Silver-grey, graphite, pearl fog, spectral oil-slick, never merely desaturated |

Colorless covers artifacts, buildings, tools and elemental materials. The Black/White flip replaced Elio's first pass (White sanctuary, Black shadow and sacrifice). Black Legendaries: **Nyx, The Storyteller, The Librarian.** Other Legendaries are not named in the chat logs.

**Size.** First pass (Sep 22): about 350 cards: 45 per color times 5 (225), 35 multicolor, 35 artifacts/stones/charms, 40 lands/zones/rooms/ley lines, 15 neutral. With Grey: **about 395 cards and 18 founding Legendaries** (3 per color, ruled because the client asked for at least three per color).

**Per-color foundation (45 cards):** 3 Legendaries, 24 minions (8 per Legendary), 9 actions and reactions, 6 relics/tools/regional places, 3 major story events. Three visual families per color, 18 families in total.

**Legendary template: three layers.** Presence (passive buff for tagged minions), Quest (a story condition that develops in play), Crescendo (the signature ability earned by finishing the condition).

**Grey in the launch build (ruled "Yep"):** 6 Grey cards in story battles, one Grey Legendary as a borrowed Voice for a few turns, a sixth collection tab called IN-BETWEEN (silhouettes and fragments), no countdown, no fake scarcity, no purchase button, no Grey deck building at launch.

**Formats.** The Chorus (Proposed, built into the architecture now and unlocked later): each deck has one named Voice outside the deck that sets its resonance colors; 60-card singleton; a 100-card "Grand Chorus" later. The client asked for a commander option and did not comment on the name. Expansions: 80 to 110 cards each, tied to a zone, story chapter or mechanic, no power creep, no randomized-pack manipulation (Proposed, no objection). Card art: 60 to 80 backdrop masters; a 7th pile of "Voice cards" in the client's sorting trays.

### 7.4 The September Wave (ruled Sep 14, "Yes, to all")

- **22 new NPC cards.** Each has Passive, Active, Deathrattle, Voice and Lore. Cards: The Postmaster (CALM, 5 HP), Judge Tootenkowl (CALM, 6), Frank Wright (SENSE, 4), The Examiner (SENSE, 4), Vaulknut (STAY, 5), Harry the Archivist (SENSE, 3), Lichenblossom (GROW, 3), Ziggy (NULL, 3), Tumble (SING, 2), Squeak (CALM, 2), The Distracted Sprite (GROW, 1), Oceanianoir (SENSE, 6), Will (STAY, 4), The Hearth-Hound (STAY, 9), The Wandering Guard (GROW, 7), The Lady of the Lake (CALM, 7), The Limner (SENSE, 5), The Clockmaker (CALM, 4), The Bone Keeper (STAY, 5), The Flute-Keeper (SING, 3), Katya (SING, 4), The Tinkering Weeaboo (GROW, 3). File: `docs/card_game/resonance_new_cast_expansion.md`.
- Name rule: Frank Wright's card prints the name and "The Build-Scholar" rides as the role line. "CIAN on the card, cayenne out loud."
- Hearth-Hound card: no active; negates the first enemy NPC ability each game; returns to hand if removed. Lady of the Lake card: sheathes your stone in the lake and returns it with +2/+2 when you have nothing.
- Wandering keyword: the Bearsark's cards.

### 7.5 Template: a Card

There are three card kinds in the real spec. Use the right one.

**NPC card (Resonance)**

| Field | What goes here | Example |
|---|---|---|
| Name | Name only. No pronouns or titles in card text | The Postmaster |
| Frequency and HP | GROW, STAY, SENSE, SING, CALM or NULL, plus health | CALM, 5 HP |
| Passive | Always-on effect | The Puzzle Stamp: first draw each turn is free |
| Active | Once-per-game or per-turn ability | The Finders' Crossover |
| Deathrattle | Effect when removed | The bone crew inherits the route: draw 1 |
| Voice | Chat register in play | Silent register |
| Lore | One flavor line | "The dispatch is choreography." |
| Portrait | Tri-mode art, Living, Shadow, In-Between | Three states owed |

**Stone card.** Name, Family, Frequency, Rarity (Common to Mythic), Health (from Mohs hardness), Attack (from category: Silicates 2, Oxides 3, Carbonates 1, plus rarity), Effect (Mind), Synergy (Body), Optical Phenomenon, Geo Region.

**Element Charm card.** Element name, symbol, atomic number, Resonance Weight, Attachment Effect, Bond Bonus, Cost in FP (Light 1, Medium 2, Heavy 3, Transuranic 4).

**Legendary card (Sep 22 rework).** Color, Presence, Quest, Crescendo, the minion family it anchors (8 minions), and its three story events. Status: Proposed structure, first Legendaries named only for Black.

**Royo card row (printable tarot layout, ruled Sep 14).** One row per card. Columns: `character_name`, portrait path, zone (the suit marker), version type (Portrait Master, Full Presence, In-Game Render, Concept Study), image paths. Spec: 70x120 mm at 300 dpi (about 825x1410 px), antiqued gold double hairline frame, dark gradient name band with a cream serif name, the Celtic Frame Register as a fixed layer. Every version gets its own card. Files: `docs/art/geode_inn_royo_tarot_card_layout_spec.md` and `geode_inn_royo_tarot_card_template.csv`.

### 7.6 Where it lives

GitHub: the paths above plus `docs/library/specs/resonance_card_game_spec.md`, `resonance_digital_build_spec.md`, `docs/card_image_gaps.md`, `docs/geode_inn_card_batch_2.md` to `_4_supplement.md`. Drive: "Royo Tarot Cards - Batch 01" in "Geode Inn-master build." Base44: StoneCard data comes from the `Stone` entity; QuestCharm and ElementCharm entities.

### 7.7 The Royo court and tarot cards

- **54-card Royo deck, four games.** Suits: Hearts (hearth), Spades (depths), Clubs (wild, fae), Diamonds (earth, artisan). Court seated Sep 14:

| Suit | Jack | Queen | King |
|---|---|---|---|
| Hearts | Squeak | Beverley | Joe |
| Spades | The Postmaster | The Morrigan | Naut |
| Clubs | Oleander | Ragana | The Seelie King |
| Diamonds | Vaulknut | Mona | The Collector |

- **The Jester Ruling (Sep 14):** Joker One is Ziggy, Joker Two is Brim. They are printed as a pair, the formula split across both card backs. Wild in Stone Poker. Number cards are suit-themed abstract Royo patterns.
- **Royo tarot batch 01 (Sep 16):** 157 of 168 cards composed; 11 failed because of null-stripped Aug 28 files (Odin, the Owl, Beverley, Council of Thinkers, Storyteller and others). 124 clean JPEG re-pulls and 32 clean twins are listed in `geode_inn_canon_image_damage_report.json`. Three missing cards (Charles, Charon, crew_cool_v2) were added on Sep 18 to reach 158 items. Card back: Ziggy/Brim split versus a carved Celtic knot is Open.

### 7.8 The Persephone mini-set (Sep 30)

Four facets, four cards. She exists in two zones at once; facets differ by room, as Odin does.
- **Tide Queen:** underworld throne, regal, same scale as Hades. Not painted (older v2 art may become this).
- **Spring:** Klimt warmth, staying. Painted, approved.
- **The Crossing:** between-form, one eye on each world, pomegranate seeds in the hem. Painted, approved.
- **The Giver:** keeper of the pomegranate bowl; the fruit steadies rather than binds. Lois Lowry's "The Giver" is woven into the design notes (ruled). Not painted.

Hades, Huginn and Muninn mid-mischief, Brim standing, Vishnu as a sleeping sky dragon and Merlin as a merman are on the image-gap list.

### 7.9 The royal artifact ledger

Ruled Sep 20. Repo: `docs/library/specs/geode_inn_the_royal_artifact_ledger.md`. It follows the Borrower's Ledger format: one row per uncoverable artifact in The Royal. Fields: **honest label** (the real artifact, dated and sourced), **game effect** (a minor absurd phenomenon), **Bait's sticky note** (the card's flavor text). The artifact uncovered *is* the card (card-first). Real artifact credited, satire derived. Wave 1 is 20 rows. Five Vault-tier artifacts are held for the endgame set. One row is reserved for the cultural review gate. Favorites: Phaistos Disc (reads aloud to illiterate listeners), Hope Diamond (paperwork curses people), Capitoline geese (honk once at a lie), Baghdad Battery (hums at 42Hz when nobody measures), Dee's scrying mirror (shows the last thing it saw). "Bait" is the Royal keeper's role; Naut is the scholar ("Naut, not bait" was an autocorrect).

### 7.10 Other card ideas (status)

- Unvoiced flip cards (fed and hungry faces): floated, not ruled; commit dd42743 records the flip gate.
- Cave City Subtractive set, Gatekeeper Goth, Mason cards, "Mrggl" murloc card: mentioned, no spec.
- Physical storyline cards and Zone Deck: see 1.5G and 8.

### 7.11 Open and to reconcile (cards)

- **Three overlapping "color" systems.**
  1. Sep 1 notes: six frequencies Song, Silence, Fire, Water, Stone, Root with win conditions.
  2. Repo master spec and September Wave: GROW, STAY, SENSE, SING, CALM, NULL.
  3. Sep 22 rework: White, Blue, Black, Red, Green, plus Grey.
  The chat logs never say how the three map to each other. Treat the repo master spec (2) as the stat system and the Sep 22 colors (3) as the deck-identity layer until the client rules.
- Card library size: 350 first pass, about 395 with Grey, but the Sep 1 chat says 361 cards were specified.
- Brim's final card name: MADAME (Sep 3) versus Brim (ruled Sep 9, and used on the Jester card Sep 14). Brim wins by date.
- Only the Black Legendaries are named; the other 15 are not.
- The Chorus is Proposed, not ruled.
- Royo tarot: Celtic frame job per card class, card back, vector versus bitmap of the client's frames.

### 7.12 Early period: how Resonance began (Aug 24 to 31)

The card game was built in four passes in the commit log. Each later pass restarted the numbers, so the early counts do not add up to the Sep 22 figures.

| Date | Pass | What it holds | Status |
|---|---|---|---|
| Aug 24 | Card Game Framework (7,000 words) | MTG and Hearthstone style. 6 frequency types (Song, Silence, Fire, Water, Stone, Root) replace MTG colors. About 20 keywords (for example Adequate, Wound, Damp, Current, Carve, Network, Resonate, Naming, Subtractive, Mim, Mirror, Observer, Ferry). 40+ character cards, 8 deck archetypes, 19 zone cards as mana sources, item cards (Cosmic Egg, Ariadne's Thread, Magritte's Pipe, Golden Contract). Stats Presence, Resonance, Cadence. Rarities Common, Rare, Epic, Legendary | Built (commit) |
| Aug 24 to 28 | Batches 2 to 4 | Pool grew to 76+, then 111+, then 117 total (Occam's Razor and The Pipe added in batch 4) | Built (commit) |
| Aug 29 | Hearthstone-style skeleton | Hero powers, turn structure, a zone-deck mana system, a silencing mechanic, a 10-point tester checklist | Built (commit) |
| Aug 30 | "Resonance" | 12 base heroes, 6 card types (Stone, Minion, Spell, Charm, Gargoyle, Pet), 37 zone boards. Unified Resonance Architecture committed the same day | Built (commit) |
| Aug 31 | Resonance v1.0 spec and starter decks | Spec of 1,676 words. 4 starter decks (Maker, Scholar, Guardian, Alchemist), 120 cards | Built (commit) |

- The six frequency types of Aug 24 are the "Sep 1 notes" system in 7.11. The Aug 24 commit shows it was the first one, before GROW, STAY, SENSE, SING, CALM and NULL. The date of the switch is not recorded.
- Card game link to the water system (August canon): Water is one of the six core frequencies, and Water cards gain power with the player's current water layer. The tidal rhythm (50 BPM) can set combat cadence, and the Pirate's drum sets the tempo.
- The Aug 24 session summary counts 117 cards and 11 images in `docs/images/`. Repo: `docs/geode_inn_card_game_framework.md`, `docs/games/resonance_card_game_spec.md`.
- Early open item: the commit log does not say why the Aug 30 "Resonance" spec starts over with 12 heroes and 6 card types instead of building on the 117-card pool.

---

## 8. Tabletop and Poker Night

### 8.1 The tabletop game

Spec of truth: `docs/tabletop/geode_inn_tabletop_core_rulebook.md` and `docs/tabletop/geode_inn_tabletop_gm_guide.md` (duplicates exist under `docs/library/tabletop/`). Companions: `tabletop_card_layouts_spec.md`, `tabletop_zone_map_spec.md`, `docs/library/specs/tabletop_digital_companion_spec.md`, `docs/geode_inn_quest_dialogue_tabletop_voice.md`.

Sizes (Sep 1): Core Rulebook v2.0 is 1,275 lines (about 13,000 words, 12 new chapters). GM Guide 427 lines, all 37 zones, a 10-session sample campaign called "Silent Contract," and solo rules. Card layouts 252 lines. Zone maps 357 lines (37 maps). Resonance spec v2.0 860 lines. About 29,400 words in all. The Digital Companion App (character sheets, Frequency Dice roller, geode collection visualizer, charm manager, NPC tracker, GM tools) is about 190 hours of work and not built.

**Module Grammar (ruled Sep 19, filed in the Blueprint).** The tabletop-module structure is the skeleton layer for every zone:

| Module organ | Inn equivalent |
|---|---|
| Boxed text | ENV rows |
| Encounter tables | The critter census |
| Adventure hooks | Quest Mark Law |
| Lore appendix | The honest-label source list |
| GM guidance sidebar | The Inn-voice layer |

Zones can be audited against these organs, like the Room Kit Law checks panels.

**Template: a Tabletop Module (one zone).**

| Field | What goes here | Example |
|---|---|---|
| Zone and id | Name, `zNN` | `z02` Clockwork Skies |
| Boxed text | Read-aloud, from the ENV row | The zone's establishing description |
| Encounter table | From the critter census | Species list with the one-home-per-species rule |
| Hooks | From Quest Mark Law, with tier | Candle-tier hook, Breath-tier hook |
| Lore appendix | Honest-label sources | Dated real references |
| GM sidebar | Inn-voice guidance | Host's cadence |
| Maps | From the 37 zone maps, or the Drive battle-map library | `zone_map` entry |

**Physical build (client side, not repo).** 400+ playing-card-sized character and zone cards by Sep 29, items and walls not started. Candy Land style figures, mini-Inn figurines with printed Inn art over blank D&D miniatures, and a mini-Inn physical model. Storyline cards are built from the deck in 1.5G. The tabletop asset pipeline moved a large battle-map and token library into Drive zone folders. Final reported run (Oct 14 to 15): 380 zips, 33,874 files landed, 3,818 skipped, zero failures. Earlier reports (588 zips, 31,487 landed, 15,522 failed) were retracted as non-zip image files. Treat counts as unverified.

The **Portal Arrow** (from the client's own tabletop campaign, canon Sep 3): it vibrates and points toward one of four stone circles, no HUD. Quote: "A door is an invitation for a coward. An arrow is an argument between the bowstring and the wind."

### 8.2 Poker Night and Stone Poker

Spec: `docs/games/geode_inn_stone_poker_poker_night_law.md`. Ruled Sep 16: Poker Night is a **real game mechanic** (a banter layer on Stone Poker), not only a comic strip.
- **Game:** genuine Five-Card Draw. Currency is stones (a pebble-class stone buys in, never punishing). The pot is a circle of stone chips. A royal flush plays a 42Hz chord under a coconut roll. The brownies' coconut percussion is the felt's metronome; they never speak; after an "oi" only coconuts continue at half clack.
- **Table:** the Wanderer, the Firekeeper, the Morrigan, Jay, plus four chairs added Sep 14: Lozen (no-tell, the final table on Inn Master difficulty), the Collector (charm offensive, says "Delightful."), the Postmaster (one tell: bets in rib-xylophone rhythm, pitched by Mohs), Frank Wright (reads chip stacks like load paths). Difficulty tiers: Novice, Seasoned, Inn Master. Jokers (Ziggy, Brim) are wild.
- **Dealer's chair (ruled Sep 16):** rotates between Judge Tootenkowl (regular), the Bard (bluster) and Lozen (rare, silent, says "oi!").
- **Joining Law (ruled Sep 16):** the table never recruits. There is one always-empty unmarked chair. The player chooses SIT (buy in with a pebble-class stone) or WATCH (spectator rail with a real hand and banter). First hand ceremony: Tootenkowl swears you in, four ceremonial coconut clacks. Folding instantly makes you a favorite ("A wise one. We hate those."). Leaving mid-hand has no penalty, "the chair kept your warmth." Molly's napkin side bet: win a story from Anansi's pile, lose a coin-shaped favor of no specified value, declining is respected.
- **Banter bank:** every opponent has dialogue keyed to game events (raise into Anansi and get a tale; fold to Duck and the coconuts judge; win a pot off Molly and he demands a side bet).
- **Open:** flagship roster (Anansi, Molly, Duck, Frank Wright as the straight chair), what the tricksters play for, brownie rotation versus the kitchen shift canon, a "gossip chair" for the Knitting Circle porch table.

### 8.3 Where it lives and open items

GitHub paths above; Drive tabletop zone folders and the Royo batch; Base44 holds no tabletop entities. Open: Digital Companion not built; items and walls cards not started; Resonance Digital Build; the Zone Deck Google Doc is not in the repo.

### 8.4 Early period (Aug 21 to 31)

- **Tabletop questline analysis (Built Aug 21, early chat and Before the Song).** From the client's own campaign ("Festival in the Middle of a Raid"). The analysis has nine numbered adaptation items, four system-level mechanics, a tone analysis and five integration phases (Proposed, no reply). Its template: Source Material; What Has Merit (Tier 1 Direct Adaptation, Tier 2 Strong Adaptation, Tier 3 Flavor and Atmosphere); System-Level Mechanics Worth Extracting; Tone Analysis; Recommended Integration; Conclusion. Each adaptation item has Original, Inn Application and Design Spec. Quests: see 1.8H.
- **Portal Arrow (Proposed, Elio's design spec).** An amber swirl (epilepsy-safe, not a flash). A random roll sends the player to one of N zones, each with a self-contained 5 to 15 minute quest, and completing it returns the player to the hub with a reward. It could be a recurring Fae Kingdom event, a chaotic artifact or a cosmic-gate malfunction. The 8.1 entry gives its later form (canon Sep 3).
- **Rulebook v1.0 (Built, commit, Aug 31).** Tabletop Core Rulebook v1.0 draft (Frequency Dice), GM's Guide (5,380 words), card layout specs, a zone map set of 37 maps, and the Digital Companion App spec. Sizes in 8.1 are the Sep 1 v2.0 figures. All were spec or document only (the companion app is not built).
- **Class interaction matrix (Built Aug 21, August canon).** The five-class document has a combat dynamics table, a social dynamics table and a zone affinity table (for example the Bard's Taunt, which raises a target's Strength and lowers Intelligence and Loyalty, hits a Librarian Crone hardest). Party composition should change NPC interactions and quest availability. The class entries themselves belong with the character parts of the manual.
- **Open.** Whether the mini-games (rhyming, limericks, Pictionary, drinking contest, chicken catching) are built is not recorded.

---

## 9. Consolidated list: To reconcile

1. Resonance has three color or frequency systems (Song/Silence/Fire/Water/Stone/Root; GROW/STAY/SENSE/SING/CALM/NULL; White/Blue/Black/Red/Green/Grey). Needs a ruling on how they map.
2. Card count: 350, 361 and about 395 all appear.
3. Ragnarok: completion with a STAY or COMPLETE choice (Sep 2) versus an endgame raid the player prevents (Oct 15), and the Oct 14 ruling that it is an event across levels.
4. Strip #001 title (The Postmaster's Route or The Great Renaming), and strip #004 used five times.
5. Live app holds only Gazette #1 to #3 (Oct 14 to 15) versus claims that later records are live.
6. Daily 6:00 AM Gazette workflow versus the QC Law "when worth it."
7. Sentinel's Vigil: ten parts versus three acts.
8. Crystal Canticle Gate 7 name and Glow tier wording ("lantern glow").
9. Set D card deck count: 18 versus 21 names.
10. Roster number #88 claimed twice (God Ladder, Port Purgatory).
11. Lore count 236 versus the 1,268 creature census.
12. Novel title and which whole-book text is current.
13. Hatchery vote wording.
14. Brim versus Madame (card final name).
15. Tabletop pipeline counts differ between reports.

Added from the early period (Jul 12 to Aug 30). Details are in 2.10 and 1.8.

16. What the Egg is made of: a river stone (prologue) versus "made of the murmur, not stone" (Part Twenty-Six).
17. 44Hz has three readings: the void between cycles (prologue), the proposed completed Song (spec map), and the future that must not arrive (2.2).
18. Before the Song ends with the Egg opening and New Game Plus, and does not mention STAY, LEAVE and HIDE (ruled Sep 10).
19. Novel first draft: 34,400 words (commit, Aug 31), 43,000 (Aug 31 note) and 37,034 (Sep 3).
20. Podcast episode titles: the commit log list (Aug 30 to 31) differs from the 6.1 list (for example "The Inn Song" as Episode 4).
21. Sentinel's Vigil: the Aug 23 and Aug 30 commits already say "10 quests, 3 acts" together. The ten-parts-versus-three-acts clash may be one chain of ten quests grouped in three acts. Not ruled.
22. Level model: Nine Realms tiers (Aug 22) versus the master level order (Oct 14). Niflheim is the gateway for both the Mesopotamian and Greek chains in the Aug 18 mapping, and Nidavellir and Svartalfheim are each used twice.
23. Keeper count: 21 mapped and "183 more" gives 204, but the region count is 191.
24. Aug 18 chains (Sacred Grove, Jotunheim, Greek) versus the Sep 10 passed chains (1.5A): no mapping is recorded.
25. Festivals: time-limited festivals and combat as a resolution path (Aug 21 Proposed) versus no limited-time events and no lethal combat.
26. Wandering Program scope: seven core critters (Aug 24) versus a four-layer global system (late August).
27. Modern Legends: 24 entries in the Crone's count versus about 25 titles named; the admission test changed late August.
28. Quest name: "The Starlight Crystal" (commit) versus "The Starlit Crystal" (Before the Song).
29. Cthulhu's place (main floor, catacombs or both) in Before the Song.
30. Character names changed in the commit log (Aug 29 to 30): Madame Mim to Mim to Brim, Cthulhu to Naut, a real name to Oceananoir, Elora Nightbloom to Briar Nightbloom. Older early docs still carry the old names. The Brim-versus-Madame item (14) is the card side of this.

## 10. Source-of-truth index for this part

| Topic | File |
|---|---|
| Quest Mark Law | `docs/zone_specs/geode_inn_quest_mark_law.md` |
| Dissections D01 to D16 | `docs/zone_specs/geode_inn_walkthrough_dissection_*.md` |
| Crystal Canticle | `docs/geode_inn_crystal_canticle_quest_chain.md` |
| Cultural chains | `docs/geode_inn_celtic_quest_chain.md`, `..._greek_...`, `..._jotunheim_...`, `..._desert_bone_...` |
| Park chains | `docs/zone_specs/geode_inn_*_quest_chain.md` |
| Witan and Hearth-Feis | `docs/systems/geode_inn_witan_hearth_feis_spec.md` |
| Endgame and Ragnarok | `docs/zone_specs/geode_inn_endgame_master_spec.md`, `geode_inn_ragnarok_master_spec.md` |
| Comic system | `docs/geode_inn_comic_strip_system.md`, `docs/gallery/gazette/` |
| Novel | `docs/library/novel/` |
| Audiobook and podcast | `docs/library/audio/audiobook_production_spec.md`, `docs/library/podcast/` |
| Library data | `docs/library/data/` |
| Resonance | `docs/zone_specs/geode_inn_resonance_card_game_master_spec.md`, `docs/card_game/resonance_new_cast_expansion.md` |
| Royo layout | `docs/art/geode_inn_royo_tarot_card_layout_spec.md` |
| Royal artifact ledger | `docs/library/specs/geode_inn_the_royal_artifact_ledger.md` |
| Tabletop | `docs/tabletop/` |
| Poker Night | `docs/games/geode_inn_stone_poker_poker_night_law.md` |
| Index of everything | `docs/INDEX.md` (on main dated Sep 10, so later files are not in it; rebuilt Nov 2 on the `inn-library` branch) |
| Origin story and Part Six | `docs/zones/geode_inn_origin_story.md`, `docs/zones/geode_inn_origin_story_ch6_conversations.md` |
| Master Storyline and Nine Realms | `docs/geode_inn_master_storyline.md`, `docs/geode_inn_nine_realms_architecture.md` |
| The Egg and Song of Making | `docs/geode_inn_the_egg.md`, `docs/geode_inn_song_of_making.md` |
| Remembrance vision, Living Book | `docs/geode_inn_remembrance_vision_system_spec.md`, `docs/geode_inn_living_book_system.md` |
| Norrath-style quests and festival quests | `docs/geode_inn_norrath_zone_quest_system.md`, `docs/geode_inn_festival_quests_official.md` |
| Keepers | `docs/geode_inn_regional_keepers.md`, `docs/geode_inn_regional_keepers_part2.md` |
| Wandering Program and Modern Legends | `docs/geode_inn_wandering_program.md`, `docs/geode_inn_modern_legends.md` |
| Death sequence, Sacred Trio | `docs/geode_inn_death_sequence.md`, `docs/geode_inn_sacred_trio.md` |
| Before the Song (compiled canon) | `before_the_song.txt` (repo root) and `library/reference/Before_the_Song.docx`; Drive copies in "first batch of game data" |

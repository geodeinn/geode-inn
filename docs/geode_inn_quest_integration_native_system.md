# Geode Inn — Quest Integration: From AzerothCore to Native Systems
## Tied to the Catacombs & Undercity

---

## OVERVIEW

This document takes every quest chain originally designed for the AzerothCore prototype framework and translates it into the Geode Inn's native game architecture. No WoW zone names. No emulator dependencies. Every quest now lives inside the Inn's own three-level structure (Main Floor → Staircase → Catacombs → Undercity → Fae Kingdom), uses the tri-mode frequency system (42Hz Living / 84Hz Shadow / In-Between), and ties directly into the Catacombs (memory/archive) and Undercity (invention/workshop) as structural anchors.

The AzerothCore docs were the scaffolding. This is the building.

---

## ARCHITECTURE: HOW QUESTS FLOW THROUGH THE INN

```
[Main Floor] — Hub, market, NPC introductions, arcade games
     |
[Staircase] — Alchemical transition, philosophy, bridge texts
     |
[Catacombs] — Memory layer: ancient civilizations, primary sources,
     |          sealed sections, the Crone's archive, Beverley's navigation
     |          Charles's Natural Archive, the Deep (Fae Kingdom connection)
     |
[Undercity] — Invention layer: workshops, Bead Board crafting, Goldsmith,
     |          Hall of Unfinished Designs, Scarlett's Room, the player's room
     |          The Garden of Gold, the Bone Room
     |
[Fae Kingdom] — The deep mythological layer, accessed through the Catacombs
                  Stone Circle Chamber — the portal from the Deep
```

### The Key Structural Shift

In the AzerothCore docs, each cultural zone was a reskinned WoW starter zone — separate areas on a world map. In the native system, each cultural quest chain **descends through the Inn's levels**:

1. **Introduction** — Main Floor (NPC encounter, quest hook)
2. **Research** — Staircase (philosophy, alchemy, bridge texts)
3. **Descent** — Catacombs (primary sources, archaeology, the civilization's actual remains)
4. **Creation** — Undercity (the player builds/crafts something from what they learned)
5. **Mythological Gate** — Fae Kingdom (the deep connection between human culture and the Fae)

This means every cultural quest chain touches every level of the Inn. The Catacombs aren't just "the downstairs zone" — they're the essential research layer every quest passes through. The Undercity isn't just "the workshop" — it's where the player's knowledge becomes a creation.

---

## THE TRI-MODE FREQUENCY SYSTEM IN QUESTS

Every quest chain operates across the Inn's three frequency modes:

| Mode | Frequency | Quest Function | Player Experience |
|------|-----------|---------------|-------------------|
| Living Inn | 42Hz | Exploration, puzzle, learning, crafting | The default state — warm, inviting, the Inn breathes |
| Shadow Inn | 84Hz | Challenge, trial, the civilization's dark side, confrontation | The Inn's petrification frequency — things get hard, still, heavy |
| In-Between | Variable | Transition moments between learning and trial | The frequency fluctuates — the player must adapt |

### How It Works in Practice

A quest chain starts in 42Hz (Living) — the player arrives, learns, explores. When the chain hits its crisis moment (the volcanic eruption, the cave-in, the weighing, the riddle), the frequency shifts to 84Hz (Shadow) — the environment changes, the Inn's warmth recedes, the player faces the challenge alone. After the crisis resolves, the frequency settles back to 42Hz — but the Inn is slightly different. The player changed it. The Whisper Layer recorded what happened.

The In-Between mode activates during transitions — the staircase descent, the moment before a boss encounter, the walk from the Catacombs to the Undercity. The frequency line at the bottom of the screen flickers between 42Hz and 84Hz, and the environment reflects the instability.

---

## CULTURAL QUEST CHAINS — NATIVE TRANSLATION

### 1. CELTIC: "The Stone Circle"
**Inn Path: Main Floor → Staircase → Catacombs → Fae Kingdom Portal**

**Theme:** How ancient peoples built sacred spaces — language, astronomy, acoustics, community.

**Quest 1: "The Empty Circle" (Main Floor)**
- **Giver:** Elder Cian, encountered near the Modern Legends nook
- **Hook:** A foundation marker has appeared in the floor of the Inn — three depressions in the stone, forming a triangle. The Inn is remembering something it was.
- **Objective:** Find 3 foundation markers in the Main Floor (compass points N, SE, SW). Listen to the earth at each (audio cue — different tone at each, the 64Hz Listener frequency).
- **42Hz Mode:** Pure exploration. The Inn is warm, inviting. The markers are subtle — the player must pay attention to the floor.
- **Catacomb Connection:** The markers match foundation patterns in the Catacombs' pre-language section. The Crone has catalogued similar triangles. The player can visit the Catacombs to see the pattern — but the Crone won't explain it. "I catalogue. I don't interpret. That's the Staircase's job."
- **Reward:** 50 reputation with Druidic Circle, "Grove Walker" title

**Quest 2: "The Language of Trees" (Staircase)**
- **Giver:** Taliesin, the Ogham scholar, found on the Staircase among the alchemical texts
- **Hook:** The stones won't hold their place unless they know their names. The druids spoke with trees, not ink.
- **Objective:** Learn 5 Ogham letters (Beith/Birch, Luis/Rowan, Fearn/Alder, Saille/Willow, Nion/Ash). Find 5 Ogham-inscribed stones in the Staircase alcoves. Identify each correctly.
- **42Hz Mode:** Language puzzle. Wrong answers give hints, not penalties. The Staircase music literally ascends in key as the player climbs to each alcove.
- **Catacomb Connection:** The Ogham stones in the Staircase are reproductions. The originals are in the Catacombs' pre-language section. The player can visit them — sealed behind the Allfather's Gaze requirement. If the player has the Gaze, they can see the original carvings and compare.
- **Undercity Connection:** The Artisan Thief class can carve new Ogham letters at the Undercity's workbench. The Tinker class can calculate the letter-to-tree correspondence using the Sonic Mineral Codex.
- **Reward:** 75 reputation, Ogham Primer (usable item — reveals hidden Ogham in all zones)

**Quest 3: "Stone from the Earth" (Catacombs — Charles's Natural Archive)**
- **Giver:** Branwen, the stone mason, found in Charles's Natural Archive section
- **Hook:** The right stone must sing. Not any rock — Preseli bluestone, the resonant stone. Charles's archive has samples.
- **Objective:** Identify the correct stone from 4 options by striking them. Only bluestone rings clear (the others produce dull thuds). Mine 5 bluestone blocks from the Natural Archive's quarry extension (a side chamber).
- **42Hz Mode:** Material identification through sound. The player listens — the Inn's acoustic alchemy system made tangible.
- **Catacomb Connection:** This quest IS in the Catacombs. Charles's Natural Archive is the geological memory. The bluestone samples are real — Charles catalogued them by Mohs hardness AND by frequency. The Specimen Wall shows the resonant stones.
- **Undercity Connection:** The mined bluestone blocks go to the Undercity for shaping. The Goldsmith can apply gold leaf to the finished stones — adding the 170Hz Freyr layer to the 111Hz resonance.
- **Reward:** 100 reputation, 5 Preseli Bluestone Blocks (quest item)

**Quest 4: "The Sky Map" (Catacombs — Star Chart Section)**
- **Giver:** Arianrhod, the astronomer, found in a sealed astronomy section of the Catacombs
- **Hook:** A circle of rock is just a fence. What makes it sacred is the sky. The sun moves. The stones must catch it.
- **Objective:** Observe accelerated sunrises from 3 positions in the star chart section. Identify solstice and equinox alignments. Place alignment markers.
- **42Hz Mode:** Astronomical observation. Time accelerates. The Catacomb ceiling opens to a projected sky (the archive's star chart — a real artifact, not a simulation).
- **Catacomb Connection:** The star charts are primary sources — Sumerian, Egyptian, and Celtic astronomical records, all shelved in the same section. Arianrhod has been studying them. The player uses the actual charts to find the alignments.
- **Reward:** 100 reputation, Sky Map (usable item — reveals solar alignment lines)

**Quest 5: "Raising the Stones" (Main Floor → Catacombs → Fae Kingdom Portal)**
- **Giver:** Elder Cian, returned to the Main Floor
- **Hook:** The stones, the words, the sky — all assembled. Now build. Place the bluestones where the sky tells you.
- **Objective:** Place 5 bluestone blocks at 5 alignment markers. Phased construction — the zone visually changes as each stone goes up. The Inn's Main Floor transforms: more light, more color, chibi Fae begin appearing.
- **In-Between Mode:** As the stones go up, the frequency fluctuates. The 42Hz wobbles. The Inn is becoming something new. The Whisper Layer activates — the Ceiling Gnome tracks the player's position, the Owl watches from the rafters, the Pulse Line flickers.
- **Undercity Connection:** Each stone can be shaped and enhanced at the Undercity workbench before placement. The Goldsmith's gold-leaf enhancement (170Hz) is optional but makes the activation cutscene more dramatic — gold-enhanced stones produce a warmer, richer resonance.
- **Reward:** 200 reputation, "Stone Raiser" title

**Quest 6: "The Solstice Chant" (Main Floor — The Stone Circle)**
- **Giver:** Elder Cian
- **Hook:** Stone is dead matter without voice. The 3-tone sequence wakes the circle.
- **Objective:** Learn the 3-tone sequence (64Hz earth, 111Hz resonance, 528Hz transformation). Sing each tone at each of the 5 stones in the correct solar alignment order.
- **84Hz Shadow Mode (brief):** The moment of the chant, the Inn shifts to Shadow. The warmth recedes. The player is alone in the circle, singing into the dark. The stones respond — they glow and hum. After the chant completes, the 42Hz returns. The Inn is different. The portal is close.
- **Catacomb Connection:** The 3 tones are the gargoyle sentinel frequencies. The Watcher (111Hz) was the archive's guardian. The Listener (64Hz) was the Fae Kingdom's gatekeeper. The Sage (528Hz) was the transformation frequency. The player has been hearing these tones throughout the Catacombs — now they learn what they're for.
- **Reward:** 150 reputation, Solstice Chant (emote — usable at any stone circle)

**Quest 7: "The Portal Ignites" (Main Floor → Fae Kingdom)**
- **Giver:** Elder Cian
- **Hook:** The stones sing. The sky is mapped. You are the key. Stand in the center. Speak the names.
- **Objective:** Recite the 5 Ogham tree names in order. Each name lights a stone. After all 5, the portal ignites — a cutscene: blue-white energy, light through water, chibi Fae swarming, the ground trembles at 111Hz.
- **In-Between Mode → 42Hz:** The portal activation is the In-Between at its most intense — 42Hz and 84Hz simultaneously, the two frequencies harmonizing for the first time. When the portal stabilizes, it settles to 42Hz. The Inn breathes.
- **Catacomb Connection:** The portal opens directly above the Deep — the Catacombs' lowest point. The Fae Layer seal breaks. The player can now travel in both directions: down from the Main Floor through the portal, or up from the Catacombs' Deep through the same portal.
- **Reward:** 500 reputation (Exalted), "Circle Keeper" title, Preseli Blue Stone (geode cave), Fae Kingdom permanently unlocked

**Side Quest: "The Oak's Memory" (Catacombs — Sealed Section)**
- **Giver:** The Oak, an ancient tree spirit found in a hidden grove off the Catacomb's deepest path
- **Objective:** Recover 3 lost acorns. Each triggers a Remembrance Vision:
  1. The Builders — Neolithic people constructing the original circle
  2. The Ceremony — A solstice ritual with hundreds gathered
  3. The Forgetting — The stones being taken down over centuries
- **Catacomb Connection:** The visions are the archive's deepest function — the Remembrance System. The Crone's archive doesn't just store texts; it stores experiences. The acorns are archive triggers — the Catacombs remembering through the player.
- **Reward:** 100 reputation, "Memory Keeper" title, lore entry in the archive

---

### 2. GREEK: "The Drowned Question"
**Inn Path: Main Floor → Staircase → Catacombs → Undercity → Fae Kingdom (Niflheim gate)**

**Theme:** Hubris as pattern, not sin. What happens to a civilization that gets too comfortable in its power.

**Quest 1: "The Modern Legend" (Main Floor — Modern Legends Nook)**
- **Giver:** A librarian NPC in the Modern Legends nook
- **Hook:** Everyone knows Atlantis. Nobody asks where the story came from. Start with Plato — not the city, the person.
- **Objective:** Travel to the Staircase. Find Plato's Timaeus and Critias on the philosophy shelf. Read the original Atlantis passages with annotations.
- **42Hz Mode:** Research and reading. The player navigates the Staircase, finds the texts, reads Plato's actual words.
- **Reward:** 50 reputation with Hellenic faction, "Reader" title

**Quest 2: "The Philosopher's Ghost" (Staircase)**
- **Giver:** Plato's ghost, appears when the player reads the Timaeus a second time
- **Hook:** "I wrote about a pattern, not a place. The Minoans made their choice before I was born. Find them below."
- **Objective:** Answer Plato's philosophical question. The correct answer: "The story was never about Atlantis." Plato phases through the floor, leaving a scroll: "The route to Knossos."
- **In-Between Mode:** The moment Plato phases through the floor, the Staircase temperature drops. The 42Hz wobbles. The player is transitioning from learning to descent.
- **Catacomb Connection:** Plato's scroll is a key — it unlocks the Minoan section of the Catacombs. The Staircase is the bridge between the Main Floor's modern understanding and the Catacombs' primary sources. Plato's ghost is the bridge itself — a philosopher who exists between the levels.
- **Reward:** 75 reputation, "Philosopher's Student" title, Route to Knossos (unlocks catacomb entrance)

**Quest 3: "The Bull and the Labyrinth" (Catacombs — Minoan Section)**
- **Giver:** Ariadne, found in the Minoan section (fresco-painted walls, double-axe symbols)
- **Hook:** The Greeks wrote about a monster in a labyrinth. We had a palace with a thousand rooms. The "monster" was the bull. We danced with it.
- **Objective:** Explore the Knossos reconstruction. Each room reveals Minoan culture (Throne Room, Grand Staircase, Fresco Hall, Storage Magazines, Shrine). Find 5 memory fragments. After all 5: the rooms shake. A volcanic rumble. The vision: Thera erupting.
- **42Hz → 84Hz Mode:** The exploration is 42Hz — warm, discoverable, the archive sharing its memories. The eruption is the shift to 84Hz — sudden, unpreventable. The temperature drops. The frescoes crack. The player doesn't fight the volcano. They witness it. The Shadow Inn mode is not combat here — it's being present for a catastrophe you can't stop.
- **Catacomb Connection:** This is deep Catacomb territory. The Minoan section is a sealed area — the Knossos reconstruction is built INTO the Catacombs' architecture. The labyrinth is the archive itself — a thousand rooms, and the player is lost in it the way they're lost in the Stacks. Beverley can navigate it. The player without Beverley finds the memory fragments by wandering.
- **Reward:** 100 reputation, 5 Minoan Memory Fragments, "Palace Walker" title

**Quest 4: "When the Mountain Woke" (Catacombs — Deep Section)**
- **Giver:** Thera — the island's voice, heard through cracked Catacomb walls
- **Hook:** "I was beautiful before I was fire. The people on my slopes had indoor toilets before the Greeks had writing. They were not prepared. How do you prepare for something that has never happened to you? You don't. You live. And then the mountain remembers what it is."
- **Objective:** Witness the eruption sequence (30-second cutscene: ash, pumice, the sea pulling back, the tsunami). After the eruption: 30 seconds of absolute silence. No music. No UI. No ambient sound. Just ash particles falling in the Catacombs. The longest silence in the Inn.
- **84Hz Shadow Mode:** The deepest Shadow mode in the game. The 84Hz frequency is the volcano's frequency — deep, tectonic, unrelenting. The Catacombs shake. The Crone's lamp flickers. Beverley stops moving. The archive itself is experiencing the catastrophe.
- **Catacomb Connection:** The eruption is the Catacombs' most dramatic archive event — the Remembrance System at full power. The player doesn't just read about Thera. They experience it. The archive doesn't protect you from the memory. It gives you the memory whole.
- **Undercity Connection:** After the eruption, the player can take volcanic ash (a physical item from the Catacombs) to the Undercity. The Goldsmith can fuse volcanic ash into glass beads — the Glass Blower's Studio creates Minoan-style glass from the catastrophe's remains. The destruction becomes material. The Undercity's thesis: what falls can be remade.
- **Reward:** 150 reputation, Volcanic Ash (crafting material), "Witness" title

**Quest 5: "The Drowned Question" (Undercity → Fae Kingdom Gateway)**
- **Giver:** Daedalus, ghost-engineer in the drowned ruins beneath the Undercity
- **Hook:** The drowned ruins of a civilization wait not as treasure to loot but as a question to sit with. What happens when a civilization gets too comfortable?
- **Objective:** The player descends from the Undercity into a submerged extension — the drowned ruins. Not a combat zone. A contemplation zone. The Siren (not a monster — a librarian of the deep) keeps the last records. The player reads the final records of the Minoan civilization and answers the Drowned Question: "Who is the city?"
- **84Hz → 42Hz Mode:** The drowned ruins are 84Hz — cold, dark, weighted. The answer brings the 42Hz back. The warmth returns. The archive absorbed the loss, and the Inn breathes again.
- **Catacomb Connection:** The drowned ruins are physically beneath the Undercity, which is beneath the Catacombs. The descent is: Main Floor (learning) → Staircase (philosophy) → Catacombs (primary sources, eruption) → Undercity (transforming the ash into glass) → Drowned Ruins (the question). Every level of the Inn is part of this chain.
- **Undercity Connection:** The Glass Blower's Studio creates the glass beads from the volcanic ash. The player's room can display the Minoan Memory Fragments. The Hall of Unfinished Designs holds Daedalus's blueprints — impossible designs, never completed, the engineer's ghost still sketching.
- **Fae Kingdom Connection:** The drowned ruins connect to Niflheim — the Norse realm of the dead. The gateway between the Mediterranean catastrophe and the Norse underworld is water. The Siren's song opens the passage.
- **Reward:** 200 reputation, "The One Who Sits With the Question" title, Drowned Glass (rare crafting material from the ruins), Niflheim gateway unlocked

---

### 3. NORSE/JOTUNHEIM: "The Old Stones"
**Inn Path: Main Floor → Staircase → Catacombs → Fae Kingdom (Jotunheim gate)**

**Theme:** Mastery is not domination — it's the humility to listen to something older and wiser than yourself.

**Quest 1: "The Gate of Frost" (Catacombs — Norse Section)**
- **Giver:** A chibi Troll at a frozen waterfall in the Catacombs' Norse section
- **Hook:** The old ones want to see what you are before they decide what to do with you. Walk forward. Do not draw your weapon.
- **Objective:** Survive 3 environmental trials without combat:
  - The Wind: a blizzard that pushes back. Walk into cover, not fight the wind.
  - The Crevasse: a gap too wide to jump. Find a path down and through, not across.
  - The Silence: all sound stops. Walk slowly. Running causes disorientation.
- **84Hz Shadow Mode:** The entire Jotunheim chain is predominantly 84Hz — this is the Shadow Inn's deepest exploration. The cold, the silence, the weight. But it's not hostile — it's just the frequency of ancient stone. The giants ARE the 84Hz. They are petrification incarnate — not as threat, but as patience.
- **Catacomb Connection:** The frozen waterfall is in the Catacombs' Norse section — the geological archive of Scandinavia. Charles's Natural Archive has glacial specimens. The ice is real — the archive's temperature control is malfunctioning in this section, and the Crone hasn't fixed it because the ice is supposed to be there.
- **Reward:** 50 reputation with Jotunheim, "Frost Walker" title

**Quest 2: "The Riddle of Vafthrudnir" (Catacombs — Deep Section)**
- **Giver:** Vafthrudnir, sitting in a throne carved from glacier ice (in the deepest Catacomb section)
- **Hook:** "Odin sat where you sit and barely left with his pride. I will ask you what I asked him, and what he could not answer."
- **Objective:** Answer 3 riddles. The third is the trap: "What did Odin whisper into Baldur's ear on his funeral pyre?" The correct answer: "No one living knows." Admitting ignorance is the lesson.
- **84Hz Mode:** The riddle contest is pure Shadow — no combat, no warmth, just the giant's presence and the player's wits. The 84Hz hum is Vafthrudnir's voice. The ice vibrates.
- **Catacomb Connection:** Vafthrudnir's riddles are drawn from the Vafthrudnismal — an actual Eddic poem in the Catacombs' archive. The Crone has the original text. The player can read it before the encounter if they find it. But the riddles can't be answered by looking them up — the third riddle has no answer. The archive can teach you everything except what nobody knows.
- **Undercity Connection:** The Tinker class can use Vafthrudnir's Riddle Book (reward) at the Undercity workbench to craft a Riddle Charm — an item that lets the player trade riddles with any NPC across all zones. The Charm is a social tool, created in the Undercity's workshop from knowledge gained in the Catacombs.
- **Reward:** 100 reputation, Vafthrudnir's Riddle Book

**Quest 3: "The Well of Mimir" (Catacombs — The Deep)**
- **Giver:** Mimir's Well, a stone well with a face at the waterline, in the Deep
- **Hook:** "Odin gave his eye for a drink. What will you give? Not an eye — you are not Odin. But something."
- **Objective:** Choose what to sacrifice:
  - A memory (a completed quest's visual reward disappears from the zone)
  - A comfort (no fast-travel for the rest of the chain)
  - A name (lose current title, earn new ones through remaining quests)
- **In-Between Mode:** The sacrifice moment is the In-Between at its most personal — the frequency flickers between 42Hz and 84Hz based on the player's choice. The Well responds to who the player is, not what they've done.
- **Catacomb Connection:** The Well is IN the Deep — the Catacombs' lowest point, the same location as the Fae Layer seal. Mimir's Well and the Fae Kingdom portal are in the same physical space. The Well is older than the portal. The archive was here before the Fae.
- **Reward:** 150 reputation, "Well Drinker" title, Fragment of Cosmic Awareness (+5% XP across all realms)

**Quest 4: "The Hunter's Path" (Catacombs → Undercity)**
- **Giver:** Skadi, found on a ridge tracking a shadow wolf
- **Hook:** "I do not hunt to kill. I hunt to keep moving. If I stop, it catches me. The hunt is the purpose, not the kill."
- **Objective:** Walk with Skadi through 3 environments at her pace. Too fast — you sink. Too slow — the shadow wolf closes. Match her footsteps.
- **In-Between Mode:** The walk is the In-Between — not quite 42Hz (too cold), not quite 84Hz (too alive). The frequency matches Skadi's footsteps. The player's movement IS the mechanic.
- **Undercity Connection:** At the walk's end, Skadi stops. The shadow wolf sits down beside her. This moment of stillness is the Undercity's frequency — the private space, the room that's yours. Skadi's lesson is the same as Scarlett's: the value of a space that's yours, where nobody asks you to perform.
- **Reward:** 150 reputation, "The One Who Walks" title

**Quest 5: "The Flame Watcher" (Fae Kingdom — Muspelheim Gate)**
- **Giver:** Surtr, waiting at the edge of Muspelheim
- **Hook:** "I have waited since before your world had a name. I am not patient — I am certain. The fire will come. Not today. But it will. Everything you build, I will unmake. Not from malice. From thermodynamics."
- **Objective:** Sit with Surtr. No combat. No puzzle. The player must simply sit with the knowledge that everything ends. The 84Hz frequency is Surtr's presence — deep, tectonic, inevitable. After sitting long enough, Surtr says: "You sat. Most don't. Most run, or fight, or bargain. You sat. That is the only thing I respect."
- **84Hz Mode:** Pure Shadow. No warmth. No escape. The longest single moment of 84Hz in the game. The player's reward is the understanding that the Shadow Inn is not the enemy — it's the truth that everything the 42Hz builds, the 84Hz will eventually reclaim. The Inn's answer to this is the archive: we cannot save everything, but we can remember everything.
- **Catacomb Connection:** Surtr's truth is the Catacombs' truth. The archive exists because civilizations fall. The Crone catalogues the dead because the dead are coming for everything. The archive is not a denial of entropy — it's the Inn's answer to it.
- **Undercity Connection:** The player can take a flame fragment from Surtr's edge to the Undercity. The Glass Blower can forge Surtr's fire into a bead — a "Necessity Bead" that carries the 84Hz frequency as a wearable reminder. Not a weapon. A truth.
- **Reward:** 200 reputation, "The One Who Sits With Fire" title, Flame Fragment (crafting material), Muspelheim gateway unlocked

---

### 4. EGYPT: "The Sistrum and the Star"
**Inn Path: Main Floor → Catacombs → Undercity → Fae Kingdom (Hel gate)**

**Theme:** Understanding as the measure of worth — not power, not wealth, but comprehension.

**Quest 1: "The Sistrum's Call" (Main Floor — Market)**
- **Giver:** Bastet, encountered in the artisan market area
- **Hook:** Find the sistrum. Learn to use it. Herd 3 cats back to the golden basket.
- **42Hz Mode:** Pure Living Inn — warm, playful. The embedded Bastet's Herding arcade game.
- **Class Roles:** Artisan Thief (best herding), Bard (taunts stubborn cats), Druid (shapeshifts to lure), Sentinel (calm zone), Tinker (frequency puzzle), Crone (reads hieroglyphs)
- **Reward:** Cat's Eye Chrysoberyl, 50 reputation with Bastet's Temple

**Quest 2: "The Seven Cats" (Catacombs — Egyptian Section)**
- **Giver:** Bastet, who follows the player into the Catacombs
- **Hook:** 7 cats, each in a different temple area of the Egyptian archive section, each with a unique personality.
- **42Hz Mode:** Exploration. Each cat responds to a different class approach. The Egyptian section of the Catacombs is warm — golden, sunlit (projected), cat-populated. The archive's Egyptian wing is the warmest Catacomb section.
- **Catacomb Connection:** The cats are the archive's guardians — they've been here since the Egyptian section was catalogued. They are Beverley's only weakness: Beverley will not admit it, but the cats follow Beverley around when no one is watching. The Crone has catalogued each cat with Hopkins precision: "Specimen 1: Aloof. Specimen 2: Playful. Specimen 3: Dormant..."
- **Reward:** 7 cat tokens, 100 reputation

**Quest 3: "The Weighing of Understanding" (Catacombs — Anubis Chamber)**
- **Giver:** Anubis (Full Presence), found in a sealed weighing chamber
- **Hook:** 7 questions about Egyptian culture, based on what the cats taught. Anubis weighs your understanding against the feather of Ma'at.
- **84Hz Shadow Mode:** Ammit sits beneath the scales. Not a fight — a test. If understanding is insufficient, Ammit gets closer. She doesn't attack. She waits. The 84Hz is Ammit's patience — the heavy, still frequency of something that has all the time in the world.
- **Catacomb Connection:** The weighing chamber is a sealed section — the Anubis Chamber. The Crone has the key, and the Crone trades it for the player's journal (the same trade as the Brísingamen ring). The archive doesn't give access freely — the player must contribute their own story to access the deeper chambers.
- **Undercity Connection:** The Crone's Case (storage charm) is upgraded after the weighing — the player can now store frequencies, not just items. The Undercity's workbench can craft frequency-charged beads from stored tones.
- **Reward:** Ankh Stone, 150 reputation, passage to the Sirius Chamber

**Quest 4: "The Flood" (Catacombs → Undercity → Fae Kingdom Gate)**
- **Giver:** Sirius rises. The Nile comes.
- **Objective:** A Remembrance Vision — the player experiences the annual flood. Navigate rising water, reading stars and river together. All classes must work together.
- **In-Between → 84Hz → 42Hz:** The flood is the In-Between at its most dynamic — the frequency shifts with the water level. The rising flood is 84Hz (heavy, overwhelming). The receding flood returns to 42Hz (warm, fertile, the Inn breathing again).
- **Boss: Ammit (Full Presence)** — Not a fight. A choice. "Will you be weighed?" Submit (Seelie favor, humility) or refuse (Unseelie favor, autonomy). Either path is valid.
- **Catacomb Connection:** The flood is the Catacombs' most immersive Remembrance Vision. The archive doesn't just show you the Nile — it floods. The player's feet get wet. The Crone's lamp goes out. The archive is not a museum; it's a time machine.
- **Undercity Connection:** The flood leaves silt in the Catacombs. The player can collect silt and take it to the Undercity. The Glass Blower creates Egyptian faience from the silt — the same material the Egyptians used for amulets and beads. The Undercity transforms the flood's residue into wearable art. The catastrophe and the creation are the same material.
- **Fae Kingdom Connection:** The flood opens a gateway to Hel — the Norse realm of the dead. The water recedes to reveal a passage. The connection between Egyptian afterlife (the weighing) and Norse afterlife (Hel) is water — the universal boundary between life and death.
- **Reward:** Nile Jasper, 200 reputation, passage to Hel, zone complete

**Stones Dropped:**
| Stone | Source |
|-------|--------|
| Cat's Eye Chrysoberyl | Bastet's Herding (Quest 1-2) |
| Ankh Stone | Weighing of Understanding (Quest 3) |
| Nile Jasper | The Flood (Quest 4) |
| Lapis Lazuli | Hidden in the Hieroglyph Library |
| Carnelian | Cat tokens (random) |
| Peridot | Rare drop in the flood silt |

---

### 5. PERU: "The Andean Highlands"
**Inn Path: Main Floor → Staircase → Catacombs → Undercity → Fae Kingdom (El Muki's gate)**

**Theme:** Non-greed. The mountain gives what you need, not what you want.

**Quest 1: "The Altitude" (Staircase)**
- **Giver:** Killa the Viscacha (companion creature — not speaking, but guiding)
- **Hook:** Ascend from the Staircase to a high-altitude Andean section. The altitude is a real mechanic — movement slows, vision narrows. Coca leaf mechanic restores stamina (historically accurate).
- **42Hz → 84Hz Mode:** The higher the player climbs, the thinner the 42Hz gets. At the top, it's nearly pure 84Hz — the air is thin, the warmth is gone, only the stone and the sky. The altitude IS the frequency shift.
- **Catacomb Connection:** The Andean section is the highest point in the Catacombs — an anomaly. The Catacombs are underground, but this section ASCENDS. The Crone has noted the impossibility: "Shelf 7, row 14, section Peru. Elevation: impossible. Status: catalogued anyway."
- **Reward:** Andean Opal, 50 reputation with Apu spirits

**Quest 2: "The Chasqui Trail" (Catacombs → Main Floor arcade)**
- **Giver:** A Chasqui NPC at the trailhead in the Andean section
- **Hook:** Run the Chasqui Trail — the Andean Run arcade game, embedded as a story activity. Deliver a message to the next tambo before sunset.
- **42Hz Mode:** Pure arcade action. The Andean Run is the Living Inn at its most active — fast, bright, kinetic. The 42Hz is the runner's heartbeat.
- **Catacomb Connection:** The Chasqui Trail runs through the Catacombs' Andean section — the ancient Inca road system, reproduced in the archive. The road is a primary source — the archive preserved the road itself, not just texts about it.
- **Reward:** Peruvianite, 100 reputation, Andean Run unlocked as repeatable arcade game

**Quest 3: "The Offering to Apu" (Catacombs — Summit Chamber)**
- **Giver:** An Apu (mountain spirit — Full Presence, emerges from the Catacomb ceiling)
- **Hook:** Create an offering that honors the mountain. Gather coca leaves, corn beer, a carved stone. Perform the ritual at the summit.
- **In-Between Mode:** The ritual is the In-Between — the player's offering bridges 42Hz (the living mountain) and 84Hz (the ancient stone). The ritual frequency is 63Hz — exactly between the two. The Apu responds to the midpoint.
- **Undercity Connection:** The carved offering stone is crafted at the Undercity workbench. The Artisan Thief carves it; the Goldsmith can enhance it with gold leaf. The offering's quality (determined by crafting care) affects the Apu's response — not mechanically, but narratively. A beautifully crafted offering gets a warmer response.
- **Reward:** Apu's Blessing Stone, 150 reputation

**Quest 4: "The Mine of El Muki" (Catacombs — Deep Section → Fae Kingdom Gate)**
- **Giver:** A Quechua miner NPC at the mine entrance in the Deep
- **Hook:** Enter the mine to find the rarest stones. El Muki guards the deepest vein.
- **Boss: El Muki (Chibi → Full Presence)** — A negotiation and self-control test. El Muki offers more stones than you need. Taking too much triggers a cave-in (not lethal — you forget some progress). The trick: take only what you need.
- **84Hz Shadow Mode:** The mine is pure Shadow — dark, deep, the 84Hz is El Muki's lure. The stone veins glitter in the dark. The temptation is the enemy, not the creature.
- **Catacomb Connection:** The mine is IN the Deep — the same physical space as Mimir's Well and the Fae Layer seal. The Deep is the Catacombs' universal connection point: Celtic portal, Norse well, Egyptian flood, and now the Andean mine. The Deep is where every cultural chain converges before entering the Fae Kingdom.
- **Undercity Connection:** The stones from El Muki's mine go to the Undercity for cutting and polishing. The Glass Blower can create Andean-style turquoise beads. The player's room can display the mine's rarest stones. The Hall of Unfinished Designs holds El Muki's own abandoned project — a sculpture of the mountain itself, never completed because El Muki could never decide how much was enough.
- **Faction Branch:**
  - Take only what you need → Seelie favor (restraint)
  - Take extra and share → Seelie favor (generosity)
  - Take everything and escape → Unseelie favor (cunning, but lose Apu reputation)
- **Reward:** Peruvian Pink Opal, 200 reputation, zone complete

**Stones Dropped:**
| Stone | Source |
|-------|--------|
| Andean Opal (Blue) | Quest 1 (altitude) |
| Peruvianite | Quest 2 (Chasqui Trail) |
| Apu's Blessing Stone | Quest 3 (offering) |
| Peruvian Pink Opal | Quest 4 (El Muki) |
| Sodalite | Random drop from terraces |
| Rhodonite | Hidden in mine (Tinker only) |

---

## THE CATACOMBS AS STRUCTURAL ANCHOR

### How Every Quest Chain Uses the Catacombs

The Catacombs are not optional. Every cultural quest chain passes through them. Here's the unified map:

```
[Catacombs — The Deep]
  |
  ├── Celtic: The Fae Layer seal → Portal to Fae Kingdom
  ├── Greek: The Drowned Ruins → Gateway to Niflheim
  ├── Norse: Mimir's Well → Gateway to Jotunheim/Muspelheim
  ├── Egyptian: The Anubis Chamber → Gateway to Hel
  └── Peruvian: El Muki's Mine → Gateway to the Andean Spirit Realm
```

The Deep is the hub. Every culture's deepest layer meets in the same physical space — the lowest point in the Inn. The Crone's archive holds all of them. Beverley can navigate to all of them. The 42Hz rumble is loudest here, and the 84Hz Shadow frequency is born here.

### The Sealed Sections — Unified Access

The Catacombs' sealed sections now gate cultural quest progression:

| Sealed Section | Key Required | Quest Chain |
|---------------|-------------|-------------|
| Pre-Language Section | Allfather's Gaze | Celtic (Ogham originals) |
| Minoan Section | Route to Knossos (Plato's scroll) | Greek (Knossos reconstruction) |
| Norse Frozen Section | Natural anomaly (the ice) | Norse (Jotunheim trials) |
| Egyptian Section | Crone's trade (player's journal) | Egyptian (Anubis weighing) |
| Andean Section | Altitude tolerance (Quest 1) | Peruvian (El Muki's mine) |
| Fae Layer | All 6 gargoyle awakenings | All chains (Fae Kingdom access) |
| Visitors' Section | Crone's permission (Celtic Quest 7) | All chains (previous players' journals) |

---

## THE UNDERCITY AS CREATIVE RESOLUTION

### How Every Quest Chain Uses the Undercity

The Undercity is where knowledge becomes creation. Every cultural quest chain has a crafting component that uses the Undercity's workshops:

| Cultural Chain | Undercraft | Workshop | Material |
|---------------|-----------|----------|----------|
| Celtic | Gold-enhanced bluestones | Goldsmith's Studio | Preseli Bluestone + gold leaf |
| Greek | Minoan faience glass beads | Glass Blower's Studio | Volcanic ash from Thera |
| Norse | Necessity Bead (84Hz wearable) | Glass Blower's Studio | Surtr's flame fragment |
| Egyptian | Egyptian faience amulets | Glass Blower's Studio | Nile flood silt |
| Peruvian | Andean turquoise beads | Glass Blower's Studio | El Muki's mine stones |

The Undercity transforms every chain's catastrophe or discovery into a wearable object. The pattern is consistent: the Catacombs give you the experience (the eruption, the flood, the mine, the ice), and the Undercity gives you the material to make something from it. The archive remembers; the workshop creates.

### The Hall of Unfinished Designs — Cultural Echoes

Each cultural chain leaves an unfinished design in the Hall:

| Culture | Unfinished Design | Original Designer | Player's Revival Task |
|---------|------------------|-------------------|----------------------|
| Celtic | A half-built stone circle model | Elder Cian's apprentice | Complete the model using the Ogham Primer |
| Greek | Daedalus's impossible blueprints | Daedalus (ghost) | Interpret the blueprints using the Sonic Mineral Codex |
| Norse | An uncarved runestone | Vafthrudnir (before he became ice) | Carve the rune using the Riddle Book |
| Egyptian | An incomplete faience amulet | An Egyptian priestess | Complete the amulet using the cat tokens |
| Peruvian | El Muki's unfinished mountain sculpture | El Muki | Complete the sculpture using stones from the mine |

The Revival Desk in the Hall of Unfinished Designs is where the player completes these abandoned projects. Each completion earns the original designer's gratitude (or the Archivist's, if the designer is no longer in the Inn) and unlocks a unique charm.

---

## THE FACTION SYSTEM — UNIFIED

### Reputation Tracks

| Faction | Zone of Origin | Friendly Unlock | Exalted Unlock | Rare Stone |
|---------|---------------|----------------|----------------|------------|
| Druidic Circle | Celtic | Stone circle access | Portal ignition | Preseli Blue Stone |
| Hellenic Assembly | Greek | Philosophy shelf access | Niflheim gate | Drowned Glass |
| Jotunheim Elders | Norse | Frost passage | Muspelheim gate | Norwegian Sunstone (Iolite) |
| Bastet's Temple | Egypt | Cat Gardens | Hel gate | Cat's Eye Chrysoberyl |
| Apu Spirits | Peru | Andean Run | El Muki's vein | Peruvian Pink Opal |
| Seelie Court | Fae Kingdom | Summerlands quests | Crystal Gardens | Rainbow Moonstone |
| Unseelie Court | Fae Kingdom | Hollow quests | Crystal Gardens | Labradorite |

### Faction Branching (Seelie vs. Unseelie)

Each cultural chain has a faction branch — a choice that affects Seelie vs. Unseelie reputation globally:

| Chain | Seelie Choice | Unseelie Choice |
|-------|---------------|-----------------|
| Celtic | Build the circle for community | Build the circle for personal power |
| Greek | Submit to the Drowned Question | Carry the question without judgment |
| Norse | Answer Vafthrudnir's riddles honestly | Trade riddles for advantage |
| Egyptian | Submit to Anubis's weighing | Refuse the weighing (autonomy) |
| Peruvian | Take only what you need | Take everything and escape |

No choice is wrong. The Inn doesn't punish. The faction choice changes which Fae Court favors you, which quests unlock in the Fae Kingdom, and which rare stones you can access. Both paths complete the game.

---

## THE CLASS SYSTEM IN QUEST CONTEXT

### Zone-Specific Class Affinity

Each cultural chain has a class that "shines" — the situational alpha:

| Chain | Alpha Class | Why |
|-------|-------------|-----|
| Celtic | Tinker | Geometry, astronomy, Ogham patterns |
| Greek | Crone | Archive access, philosophical comprehension |
| Norse | Sentinel | Willpower, stillness, resistance to 84Hz |
| Egyptian | Druid | Shapeshifting to match each cat's personality |
| Peruvian | Artisan Thief | Precision carving, narrow paths, mining |

In co-op, the alpha class leads while others support. In solo, the zone scales — the player's class gets a "zone affinity" buff that partially compensates for not being the alpha.

### Undercity Class Functions

Every class has a unique Undercity crafting ability:

| Class | Undercity Specialty |
|-------|-------------------|
| Artisan Thief | Precision carving (Ogham, runes, offering stones) |
| Bard Blowhard | Composition of "Wearable Songs" (frequency arrangements) |
| Tinkering Weeaboo | Frequency calibration (tuning beads to specific Hz) |
| Librarian Crone | Archive-infused crafting (items that carry archive knowledge) |
| Chameleon Druid | Adaptive materials (materials that shift properties by zone) |
| The Sentinel | Structural crafting (stones, findings, architectural elements) |

---

## ARCADE GAMES — EMBEDDED, NOT SEPARATE

Every arcade game is embedded in its cultural quest chain, not a separate menu item:

| Arcade Game | Cultural Chain | Quest Where Embedded | Post-Quest Mode |
|------------|---------------|---------------------|-----------------|
| Bastet's Herding | Egypt | Quest 1-2 | Endless score mode (3-min timer) |
| Andean Run | Peru | Quest 2 | Endless runner with leaderboard |
| Standing Stones (Tetris) | Celtic | Quest 5 (stone raising) | Score-based with leaderboard |
| Tomb Tunnel (Dig Dug) | Egypt | Quest 3 (mine exploration) | Score-based with leaderboard |
| Monster of the Deep | Greek | Quest 4 (flood) | Score-based with leaderboard |
| Viking Boat Race | Norse | Quest 4 (Skadi's path) | Time trial with leaderboard |

The arcade games are the 42Hz at its most kinetic — fast, bright, fun. They exist within the cultural zones as activities the player encounters naturally, not as a separate arcade menu. After the quest, they become repeatable for scores (Leaderboard entity).

---

## STONE REWARDS — COMPLETE MAP

| Stone | Chain | Quest | Geode Cave Slot |
|-------|-------|-------|-----------------|
| Preseli Blue Stone | Celtic | Quest 7 (Portal) | #1 |
| Ogham Primer Stone | Celtic | Quest 2 (side) | #2 |
| Drowned Glass | Greek | Quest 5 (Drowned Question) | #3 |
| Nile Jasper | Egyptian | Quest 4 (Flood) | #4 |
| Cat's Eye Chrysoberyl | Egyptian | Quest 1 (Herding) | #5 |
| Ankh Stone | Egyptian | Quest 3 (Weighing) | #6 |
| Andean Opal (Blue) | Peruvian | Quest 1 (Altitude) | #7 |
| Peruvianite | Peruvian | Quest 2 (Chasqui) | #8 |
| Apu's Blessing Stone | Peruvian | Quest 3 (Offering) | #9 |
| Peruvian Pink Opal | Peruvian | Quest 4 (El Muki) | #10 |
| Norwegian Sunstone (Iolite) | Norse | Quest 1 (Gate of Frost) | #11 |
| Lapis Lazuli | Greek | Hidden (Hieroglyph Library) | #12 |
| Carnelian | Egyptian | Cat tokens (random) | #13 |
| Peridot | Egyptian | Flood silt (rare) | #14 |
| Sodalite | Peruvian | Terrace random | #15 |
| Rhodonite | Peruvian | Mine hidden (Tinker) | #16 |

---

## WHAT REMAINS FROM AZEROTHCore (REFERENCE ONLY)

The AzerothCore docs remain in the repository as design reference. They served their purpose:
- The zone-by-zone mapping taught us how to structure cultural content
- The reputation system template (8 tiers) was directly translated
- The hub-and-spoke quest flow informed the Inn-level progression
- The "how they did things" quest philosophy is preserved exactly

What was REMOVED:
- All WoW zone names (Teldrassil, Elwynn, Durotar, etc.)
- All AzerothCore-specific technical references (Docker, client protocol, 3.3.5a)
- All instance names (Maraudon, Scarlet Monastery, etc.)
- The phased construction system (replaced by the Inn's own environmental transformation)

What was ADDED:
- The tri-mode frequency system (42Hz/84Hz/In-Between) applied to every quest
- The Catacombs as the universal research/descent layer
- The Undercity as the universal crafting/resolution layer
- The Whisper Layer's awareness tracking during quest moments
- The Deep as the convergence point for all cultural chains
- The Hall of Unfinished Designs as a cross-cultural crafting meta-quest
- The class system's zone-specific roles from the Norrath template
- The embedded arcade game structure

---

## NEXT STEPS

1. **Create a Quest entity** in the Geode Inn database to store quest chains, objectives, rewards, and faction data
2. **Write the tabletop-narrative dialogue** for each quest giver in the Inn's established voice (Rothfuss cadence)
3. **Design the Deep's convergence space** — the physical room where all 5 cultural gates are visible
4. **Map the Undercity crafting recipes** — one per cultural chain's catastrophe-material
5. **Generate concept art** for: the Deep (5 gates visible), the Drowned Ruins, Jotunheim ice throne, El Muki's mine, the Anubis Chamber
6. **Build the quest chain UI** — a journal/quest log that tracks progress through the Inn-level progression
7. **Send the fizgigs a quest log implementation batch** — the builder can create the quest tracking system

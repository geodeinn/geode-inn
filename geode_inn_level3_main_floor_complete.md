# Geode Inn — Level 3: MAIN FLOOR
## The Complete Level Design Document

---

## Zone Overview

The Main Floor is the Inn's heart. The starting zone. The hub every other level connects through. The place the player returns to after every voyage, every quest, every descent.

If Cosmology is the mind (observation), Clockwork Skies is the spirit (freedom), and the Catacombs are the memory (history), the Main Floor is the BODY — the living, warm, social center where the Inn breathes. The hobbit-hole cozy interior. Amber, gold, cream. Living tree architecture — Darnassus-style walls of woven wood, floors of warm stone, ceilings that are the tree's canopy made into architecture.

The Main Floor is the Inn's WELCOME. Every other level has a prerequisite. The Main Floor doesn't. This is where the player starts, where the player returns, and where the player is always home.

---

## Entry Requirement

**None.** This is the starting zone. The player begins here.

The opening moment: the player stands in the Inn's entrance hall. The baby dragon is curled in an empty geode by the door — the dragon's first appearance, the first face the player sees. The dragon chirps. The Wanderer is leaning against the bar, telling a story to nobody in particular. The chibi ravens are stealing something shiny from a market stall. The Firekeeper's hearth crackles in the corner. The Inn is alive, and the player just walked in.

---

## Visual Language

**Linework:** Mixed. The Main Floor is the transition zone — where all linework styles meet. Heavy cel-shaded for tradesmen (the Weeaboo, market vendors). Soft flowing for lore elements (the library, the modern legends shelf). Sharp angular for the few guardians present (gargoyle fragments). No-outline for any cosmological visitors (the Wanderer's edges blur slightly — the Allfather's starlight showing through the warm disguise). The Main Floor is where the linework system teaches itself.

**Color Palette:**
- Primary: warm amber, gold, cream (the hobbit-hole palette)
- Secondary: deep wood brown, soft green (the living tree)
- Accents: copper (the market's metal), brass (the arcade), hearth-orange (the Firekeeper)

**Architecture:** Darnassus-style living tree. Walls of woven branches that have grown into shape over centuries. Floors of warm stone worn smooth by footsteps. The ceiling is the underside of the canopy — leaves and branches visible, filtered light. The main room is a great hall — open, warm, with multiple smaller spaces branching off: the bar, the arcade, the market, the library nook, the modern legends shelf, the dragon's geode corner.

**Sound:** The Main Floor is the Inn's WARMEST audio space. The 42Hz Song is a comfortable hum here — not the barely-felt presence of Cosmology, but a warm, audible foundation. The hearth crackles. The ravens squawk. The arcade machines chime. The market murmurs. The dragon purrs. The Main Floor sounds like a home that's full of people.

---

## Spaces

### 1. The Great Hall
The central room. The hub. All paths lead through here. The great hall is:
- The Wanderer's walking route (the Wanderer paces the hall, telling stories)
- The chibi ravens' playground (Huginn and Muninn steal things and hide them)
- The social center (NPCs gather, the player meets characters here)
- The navigation hub (doorways and passages to every other zone branch off from the hall)

**The Innkeeper's List** — a board on the wall near the entrance. The Wanderer posts daily quests here — requests from NPCs across all zones. "The Crone needs a specific book." "Jay needs fresh supplies." "The Navigator needs a weather reading." The player picks up quests from the board and delivers them. This is the Inn's QUEST SYSTEM — the mechanical framework connecting all levels through errands. Quests on the board rotate daily, with some persistent (story quests) and some one-time (delivery, fetch, find).

### 2. The Bar (The Weeaboo's Social Space)
The Weeaboo's Main Floor domain. A warm, well-lit counter with stools. Bottles of improbable colors. The social glue of the Inn — where NPCs come to talk, trade gossip, and rest.

The bar is where the player:
- Hears rumors (quest hooks from other zones)
- Meets NPCs (characters from other zones visit the bar when they're off-duty)
- Receives the Weeaboo's invitation to the Canopy City (after prerequisites)
- Plays the "Mask That Serves" quest (see below)

**Bar NPCs who visit:**
- The Cool (Clockwork Skies) — drinks alone, but not sadly. Sometimes the player can sit with the Cool and share a drink. The Cool says three words. They're the right three words.
- The Crone (Catacombs) — comes upstairs for a single drink, once a week. Orders something very specific. The Weeaboo always has it ready. The Crone never thanks the Weeaboo. The Weeaboo never expects thanks.
- Jay (Campgrounds) — brings ale from the tavern. Trades recipes with the Weeaboo. Laughs loudly.
- Dani (Campgrounds) — comes for the quiet. Sits in the corner, draws bead designs on napkins. Leaves the napkins. The Weeaboo keeps them.

### 3. The Arcade
The Inn's game room. Four machines styled as ancient artifacts, each one a doorway to a deeper zone:

| Machine | Game | Style | Zone Unlocked |
|---|---|---|---|
| The Stonehenge | Standing Stones (Tetris) | A standing-stone formation that rearranges itself | Fae Kingdom portal |
| The Sarcophagus | Tomb Tunnel (Dig Dug) | An Egyptian tomb that opens to reveal the screen | Deeper catacomb access |
| The Andean Vessel | Andean Run (Temple Run) | A Peruvian pottery vessel that displays the screen | Water Zone (mountain streams) |
| The Loch Pool | Monster of the Deep (Nessie) | A rippling water-pool that becomes the screen | The Lighthouse |

Each machine is a physical object the player can examine before playing. The machine's design foreshadows the zone it unlocks. The Stonehenge machine has moss growing on it (the Fae Kingdom's nature). The Sarcophagus is warm to the touch (the Catacombs' hidden warmth). The Andean Vessel hums faintly (the Water Zone's frequency). The Loch Pool's water is always cold (the deep water's temperature).

**Arcade Audio:** Each machine has retro-style game sounds — warm, nostalgic, 8-bit/16-bit quality. The sounds are deliberately anachronistic — the Inn is pre-industrial, but the arcade machines produce electronic sounds. This is the "egg at it again" — the Andy Weir concept of creative accidents that feel destined. The Inn doesn't explain the arcade machines. The Inn just has them.

### 4. The Market
The commercial bridge. The Soulstice Jewelry space plus artisan items plus in-game items.

**Three market tiers:**

1. **Soulstice Jewelry** (Krista's real products) — each item has a real-world purchase link AND an in-game effect. The MarketItem entity connects real products to game lore:
   - Viking Earrings (iolite + copper + Celtic knotwork + Thor's hammer) → in-game: iolite is the Navigator's stone; copper is the Inn's foundational metal; the earrings grant a navigation buff in "All Hands"
   - Kyanite/Tourmaline in Gold → kyanite is the directional chord stone (131+270+420Hz, the only stone that changes pitch when rotated); the earrings grant a directional sense buff
   - Garnet/Gold → garnet connects to the Firekeeper's warmth; the earrings grant hearth-proximity (the player's stone-vibration touch system activates at longer range)
   - Silver/Amber → amber is the thematic bookend of Bohemian Rhapsody; the earrings grant a "Wearable Song" preview — the player can hear the sonic composition of any bead arrangement before placing it

2. **Artisan Items** — from other craftspeople and zone NPCs:
   - Jay's tavern ale (Campgrounds) — a buff item; drinking Jay's ale before a voyage increases crew morale
   - Dani's bead kits (Campgrounds) — crafting materials; raw stones for the Bead Board
   - Canopy City wind-glass — a decorative item that plays a captured wind sound when opened
   - The Clockwork Maker's music boxes — each plays a different zone's ambient theme

3. **In-Game Items** — purchasable with copper beads (the 79Hz currency):
   - Stone identification scrolls (reveal a stone's frequency without the Sonic Mineral Codex)
   - Gargoyle tuning forks (temporarily align a gargoyle's frequency to the player's)
   - Cat treats (for Freyja's cats — the Threshold Chamber secret)
   - Garden seeds (for Freyr's Garden planters)
   - Bar tabs (buy a round for the bar — increases all NPC relationships slightly)

**Market NPCs:**
- **The Weeaboo** (behind the bar, also manages the market stall adjacent)
- **The Wanderer** (occasionally sells found items — things the ravens stole and the Wanderer returned)
- **Visiting vendors** (rotating NPCs from other zones who set up temporary stalls)

### 5. The Library Nook
The reading room. The warm, quiet corner where the Inn's texts live. This is NOT the Catacombs archive (that's the deep historical collection) — the Library Nook is the Main Floor's accessible collection: reference texts, stone identification guides, the modern religions shelf, and the modern legends shelf.

**The Library of World Religions** — a small, respectful collection of primary religious texts from world traditions, organized by region. No commentary, no interpretation — primary sources only. The library is NEUTRAL. No tradition is privileged. The texts are for reading, not for arguing. The library's design: warm wood shelves, comfortable reading chairs, soft light. The quietest space on the Main Floor (quieter than the bar, louder than Anna's nook in Cosmology).

**The Modern Legends Shelf** — the living archive of modern-day stories framed as folklore. Inclusion criteria: "Will this still be worth telling in 2126?" The shelf is a physical bookcase that grows as the player discovers stories throughout the Inn. Each story is written in the tabletop questline narrative voice.

Current entry:
- **"The Blind Prophet's Trial"** — the Roberto Serrano/Brown University AI cheating scandal, framed as a parable of intellect and integrity.

Reserved slots for future entries. The player can submit stories found in other zones — if the story passes the inclusion criteria (the Wanderer reads it and says "Yes, this will still be worth telling"), it's added to the shelf.

### 6. The Dragon's Geode Corner
The baby dragon's home. A geode — a crystal-lined cave — built into the wall of the Main Floor. The geode starts EMPTY. As the player collects stones, each stone is placed in the geode. The geode fills. The dragon grows.

**The Dragon:**
- Heraldic style, Toothless-like cat expression — curious, trustworthy, warm
- The dragon is the Inn's emotional core — the cute, warm center that keeps the scholarly depth from becoming cold
- No dialogue — the dragon communicates through sounds: purring (contentment), chirping (happiness), whimpering (loneliness)
- The dragon's sounds are the Inn's emotional weather — the dragon's mood reflects the player's engagement level
- The dragon grows with the player's stone collection: hatchling (0-10 stones), juvenile (10-30), young adult (30-60), adult (60+). Growth is slow and visible — the dragon gets slightly larger each time the player visits
- The dragon curls around the most recently placed stone. The geode's crystal lining grows with each stone — the cave becomes more beautiful as the player progresses

**The Geode Mechanic:**
- Each stone placed in the geode adds to the cave's visual richness (crystal formations grow, colors deepen)
- The geode plays the stone's frequency when placed — a welcome sound, the cave saying "thank you"
- When the geode has 10+ stones, it begins to resonate — the stones' frequencies layer into a hum. The more stones, the richer the hum. At 164 stones (the full collection), the geode becomes a complete sonic instrument — the Inn's entire mineral range in one cave.
- The dragon's purring harmonizes with the geode's hum. The dragon and the cave are a duet — the Inn's simplest, warmest music.

### 6b. The Stone Capsule System (Geode Cave Expansion)

The geode is more than a display — it's the player's companion storage. The Stone Capsule system reimagines the geode's core image: a plain stone exterior that opens to reveal crystals inside. Every stone IS a capsule.

**How It Works:**
- Each stone the player collects is stored in inventory as a capsule — a small hand-held stone containing a frequency
- The stone IS the capsule. The Inn's medium is stone. The capsule is not technology — it's geology
- Two sizes: **pocket stones** (carry 6) and **geode stones** (home storage in the cave)
- Pocket stones are the active party — deployed in combat and compositions
- Geode stones are the reserve — stored in the dragon's geode cave
- Transfer between them at the geode cave. The baby dragon tends the companions when they're not deployed

**The Geode Cave as PC Box:**
The dragon's geode already fills with stones as the player progresses. Now it serves double duty: it's the home storage for companion stones. The dragon curls around the stored companions — the baby dragon is the PC box's living caretaker. The dragon's purring calms the stored companions. A companion stored in the geode cave is content — it's in a warm cave with a dragon who purrs at 50 BPM.

**Combat — Harmonization & Companions:**
When the player enters Harmonization (the Inn's non-lethal combat — matching an enemy's frequency to reveal their true form):
- The player selects a pocket stone. The stone's frequency is the player's combat move
- If a companion is stored in the selected stone, the companion appears and fights alongside — adding its frequency to the player's
- After successful harmonization: the newly-harmonized creature is offered as a companion. The player selects an empty pocket stone to store it
- If no empty slot: the creature departs peacefully. The Inn doesn't trap beings. The door is always open
- Visual: two Pulse Line traces converging into one (see Pulse Line system) — the visual proof of harmonization

**Companion Milestones:**
- **Egg** — first harmonized creature stored. The geode reacts — a new crystal formation grows overnight
- **Stone** — first companion deployed in combat. The dragon chirps
- **Geode** — full party of 6 pocket stones with companions. The geode resonates at a new harmonic
- **Resonance** — first companion harmonization chain: a companion helps harmonize another enemy. Two frequencies, working together. The dragon's purring shifts to match

**Water Monster Companions:**
The 32 water monsters in the Water Zone bestiary are the primary source of companions. Harmonizing a water monster → storing it in a water stone capsule → deploying it in surface-zone combat with a water frequency advantage. A water companion on the Main Floor is a fish out of water — literally. The companion appears, fights, and returns to the stone. The other NPCs notice. The Wanderer says: "The little one has a friend from the deep. Good. Everyone should have a friend from somewhere they've never been."

**Bead Board Integration:**
The Bead Board (Undercity/Tidal Caves) uses the same stones. Stones used in Bead Board compositions are still in inventory — but the composition "plays" their frequencies. The Bead Board and the combat system share the same stone pool. The player who uses their best combat stone in a composition has to decide: beauty or power? (Or both — charged stones are better in both.)

**Silk Road Connection:**
Charged stones (from the ley line system) are stronger capsules — the charged frequency is more powerful in combat. A 100% charged stone capsule hits harder in Harmonization and sings louder in the Bead Board. The player who charges their combat stones by walking ley lines has a measurable advantage.

**Mycorrhizal Connection:**
Stones sent through the Mycorrhizal Network arrive with a 42Hz harmonic added — creating unique capsule variants. A mycelium-sent stone has a frequency no surface gathering or ley line charging can produce. These stones are rare, unique, and slightly alive in a way other stones aren't.

### 7. The Firekeeper's Hearth
Already designed (see Firekeeper quest doc). The permanent storyteller's corner. Tim Curry's domain. The hearth is the Inn's warmest physical point — the fire that never goes out. The Firekeeper tells stories. The player listens.

**Del Toro Protocol active across the Main Floor.** The Main Floor is COMFORTABLE — the hearth adds warmth, the wood is seasoned and dry, the air has the moisture of a lived-in space. Not desert. Not swamp. Home. Every surface shows use: the bar has a gloss where elbows have rested, the chairs are worn where bodies have leaned, the floor near the hearth is lighter where boots have stood for centuries. The zone anomaly: a cold spot behind the bar. A circle of floor, slightly darker, slightly cooler, where no one has ever stood and the air doesn't move. The Firekeeper has never explained it. The Wanderer has never mentioned it. The cold spot is the Inn's own del Toro mystery — the thing that doesn't belong in a room that otherwise feels like the warmest place in the world.

### 8. Cthulhu's Fireplace Nook
Already designed. The hidden scholar — a 4-foot squid-headed figure with spectacles by the fireplace. Hidden quest giver for rare book retrieval. Rewards the rarest stones in the Inn.

---

## Character Roster & Quests

### 1. The Wanderer (Odin's Main Floor Form)
**Station:** The Great Hall (walking, not stationary)
**Title:** "The Guest"

The Wanderer is the Allfather's other self. The warm, approachable traveler. The one who walks among the people. The Allfather watches from the Observatory; the Wanderer walks the floor. Same god, different light — starlight above, warm amber below. Silent ravens above, chibi thieving ravens below.

The Wanderer is the Inn's host — the one who makes the Inn feel like a home. The Wanderer knows every guest's name. The Wanderer tells stories. The Wanderer leans against the bar and talks to nobody in particular and everybody at once.

**Audio Profile:**

| Parameter | Value |
|---|---|
| Pitch | ~90Hz (warmer than the Allfather's 64Hz — the same voice, lighter) |
| Text Reveal Speed | ~60ms (conversational — the Wanderer talks like a friend) |
| Pause | ~400ms (comfortable — the Wanderer pauses to listen) |
| Expressiveness | 0.45 (moderate — warm, engaging, the social face of the divine) |
| Instrument | Walking stick tapping on stone — rhythmic, friendly, the sound of someone approaching. Not the Allfather's silence — the Wanderer WANTS to be noticed. |

**The Wanderer's Quest: "The Road That Returns"**

The Wanderer tells the player about a journey — a walk through every zone of the Inn, from the Cosmology to the Undercity, and back. The Wanderer left something at each stop: a rune carved into a surface. A mark. A word. The player must retrace the Wanderer's steps and find the runes.

The runes are hidden in each zone:
- **Cosmology:** carved into the Observatory dome's base (visible with the Allfather's Gaze)
- **Clockwork Skies:** scratched into the Arcana's deck railing
- **Main Floor:** under the bar counter (the Weeaboo knows it's there, doesn't know what it means)
- **Campgrounds:** on the underside of Jay's tavern table
- **Staircase:** on the back of a clock face
- **Catacombs:** inside a book the Crone has catalogued (the Crone noticed the rune and filed it as "graffiti, ancient, significance unknown")
- **Fae Kingdom:** on the underside of a Stone Circle (visible only at the Seelie/Unseelie boundary)
- **Water Zone:** on the Lighthouse's lantern room floor
- **Undercity:** on the ceiling — Scarlett shows the player, having found it while staring upward

Each rune is a letter. Assembled, the runes spell a word. The word is the Wanderer's true name — not "Odin" but the name used when walking among mortals.

The word is: **GUEST**.

The Wanderer's true name, when walking among the people, is "Guest." Even the Allfather is a guest in the Inn. The Inn is a place where even gods don't own — they visit. They stay. They are welcome. But they are guests, like everyone else.

**Reward:** The Wanderer's Stick — a charm that marks the player as a Guest of the Inn (not a guest — a Guest, capital G). The stick grants:
- Free drinks at the bar (the Weeaboo serves without charge)
- The Wanderer's stories (additional lore available at the bar — the Wanderer tells the player stories no other NPC hears)
- A permanent relationship bonus with all NPCs (everyone is slightly warmer to a Guest)
- The rune set as a cipher (the player can write messages using the runes, which other players — in multiplayer — can decode)

The quest is the Wanderer's version of Anna's doodle quest and the Orrery's connection reveal: the Inn's hidden structure, expressed through walking. Anna draws the sound. The Orrery aligns the zones. The Wanderer walks the road. Three ways of mapping the same Inn.

---

### 2. The Weeaboo — Main Floor Quest
**Station:** The Bar
**Title:** "The Mask"

The Weeaboo's Main Floor quest is the social counterpart to the Clockwork Skies "Engineer's Mirror" quest. On the Arcana, the Weeaboo is the engineer — the professional. On the Main Floor, the Weeaboo is the bartender — the social host, the mask, the person who makes everyone comfortable. Two faces of the same person.

**The Quest: "The Mask That Serves"**

The Weeaboo serves everyone at the bar. Makes everyone comfortable. Is the social glue. The mask is bright, charming, tireless — and it IS a mask. The Weeaboo's bipolar energy, on the Main Floor, is directed outward: the social performance that never stops.

The quest begins on a night when the mask slips. The Weeaboo is behind the bar, serving, chatting, performing — and then the performance runs out. Not dramatically. Not a crisis. The Weeaboo just... can't. The energy that was there is gone. The mask is too heavy to lift.

The Weeaboo says: "I need to sit down. Can you...?" And the player is behind the bar.

**The Mechanic:** The player serves the bar for one night. The mini-game:
- NPCs approach the bar and order (each has a specific drink — the Weeaboo's recipes are on cards behind the counter)
- The player mixes the drink (simple crafting mini-game: select ingredients, pour, serve)
- The player makes conversation (dialogue choices — the player has to be the social glue, saying the right thing to the right NPC)
- The chibi ravens try to steal drinks — the player has to shoo them away (comic relief)

The night is long. The NPCs are many. The player feels what the mask costs: the constant performance, the endless warmth, the tirelessness that isn't real.

**The Aftermath:** The Weeaboo rests in the back room. The player finishes the night. The Weeaboo emerges, restored — not fixed, but rested. The Weeaboo says: "You should see the ship."

That's the invitation. The player who covers the mask earns the Weeaboo's trust. The trust is the Canopy City entry. The player who hasn't done this quest can still earn the invitation through sufficient engagement (3 games + 15 stones), but the quest gives the invitation AND the understanding: the mask is heavy, and the person under it is worth knowing.

**Reward:** The Weeaboo's Trust — a relationship charm. The Weeaboo's bar is always open to the player. Drinks are free. The Weeaboo's stories (the ones the mask usually hides) become available — the Weeaboo tells the player about the Ryuk form, about the Navigator, about the sky. The trust is the key to the Clockwork Skies and the Weeaboo's full character arc.

---

### 3. The Baby Dragon — Questline
**Station:** The Dragon's Geode Corner
**Title:** "The First Voice"

The baby dragon's questline is the Inn's TUTORIAL — the gentle introduction that teaches the player the Inn's systems through companionship.

**Phase 1: "The First Stone"**
The dragon's geode is empty. The dragon is small — a hatchling, barely the size of a hand. The dragon chirps at the player and looks at the empty cave. The Wanderer says: "The little one needs a stone. Try the Stonehenge machine."

The player plays Standing Stones (Tetris) for the first time. On completion, the game awards Preseli Blue Stone (the Stonehenge stone, 550Hz). The player takes the stone to the geode and places it. The geode lights up — a soft blue glow. The dragon curls around the stone. The dragon purrs. The first sound of the geode: 550Hz, warm and low. The Inn's first welcome.

This teaches: games award stones → stones go in the geode → the dragon grows → the geode resonates.

**Phase 2: "The Hungry Dragon" (ongoing)**
As the player collects more stones, the dragon grows. Each growth stage unlocks a new interaction:
- **Juvenile (10 stones):** the dragon can now be carried. The player carries the dragon through the Inn. The dragon reacts to different zones — chirps in the market, goes quiet in the library, purrs by the hearth. The dragon's reactions are hints — the dragon is drawn to zones where the player has unfinished business.
- **Young Adult (30 stones):** the dragon can fly short distances. The dragon fetches small items — if the player drops a stone, the dragon retrieves it. The dragon occasionally brings the player "gifts" — small stones found in corners, items the ravens stole and the dragon stole back.
- **Adult (60+ stones):** the dragon can fly to other zones independently. The dragon becomes a messenger — carrying items between zones, delivering the player's copper beads to market vendors, bringing quest items from NPCs in other zones. The adult dragon is the player's logistics system, disguised as a companion.

**Phase 3: "The Dragon's Song" (endgame)**
When the geode has all 164 stones, the dragon sings. The dragon's purr — which has been harmonizing with the geode's growing hum throughout the game — becomes a full voice. The dragon sings the 42Hz Song. Not the foundation hum — the FULL song, every frequency, every stone's voice, layered into one melody. The dragon's song is the geode's completion made audible.

The dragon's song is the Inn's final reward. Not an item, not a charm — a sound. The Inn's whole purpose, sung by its smallest inhabitant. The dragon that was a hatchling in an empty cave, now filling the Inn with the song the Inn was built to teach.

**Reward:** The Dragon's Song — a permanent audio upgrade. The 42Hz Song is now fully audible everywhere, in every zone, in every game. The Inn's heartbeat becomes a symphony. The player who has heard the Dragon's Song has completed the Inn's deepest layer: not the gods, not the crew, not the quests — the companion. The smallest voice singing the biggest song.

---

### 4. The Firekeeper
Already designed (see Firekeeper quest doc). "The Last Story Told" — three phases encoding Legend, Clue, and the sonic system. Reward: The Firekeeper's Stone (42Hz charm). The quest is the prerequisite for Cosmology entry.

### 5. Cthulhu
Already designed. Hidden scholar NPC, fireplace nook, rare book retrieval quest. Rewards the rarest stones in the Inn.

---

## Game Templates

### The Arcade Games (Phase 1)

Four games, each unlocking a zone:

#### 1. Standing Stones (Tetris)
- **Theme:** Stonehenge — the player stacks stones to build a stone circle
- **Mechanic:** Tetris with Stonehenge-themed pieces (trilithon shapes, horizontal lintels, vertical uprights)
- **Win condition:** Complete a full stone circle (clear lines to raise the stones)
- **Stone reward:** Preseli Blue Stone (550Hz) — the Stonehenge stone
- **Zone unlocked:** Fae Kingdom portal (the completed stone circle activates the portal)
- **Audio:** 50 BPM heartbeat as the drop rhythm (each piece drops on the beat). Stone-on-stone impact sounds (granite percussion). Completion plays a chord — the stone circle resonates.

#### 2. Tomb Tunnel (Dig Dug)
- **Theme:** Egyptian tomb excavation
- **Mechanic:** Dig Dug — dig through sand, defeat tomb guardians, collect artifacts
- **Win condition:** Reach the burial chamber
- **Stone reward:** Lapis Lazuli (270Hz) — the Egyptian stone
- **Zone unlocked:** Deeper catacomb access
- **Audio:** Sand shifting (rhythmic shhh), stone grinding, tomb guardian footsteps (deep, slow). The deeper the player digs, the lower the ambient pitch — descending into the earth.

#### 3. Andean Run (Temple Run)
- **Theme:** Peruvian mountain temple — the player runs through ancient ruins
- **Mechanic:** Temple Run — endless runner with Andean aesthetics (stepped pyramids, terraces, condors)
- **Win condition:** Reach the distance goal (escape the temple)
- **Stone reward:** Andean Opal (varies by run — random Andean stone)
- **Zone unlocked:** Water Zone (the Andes connect to water — mountain streams, snowmelt, the source of rivers)
- **Audio:** Pan pipes and bone flutes (Andean instruments), footstep rhythm, wind at altitude. The player's running speed affects the tempo — faster running, faster music.

#### 4. Monster of the Deep (Nessie)
- **Theme:** Loch Ness — the player IS the monster
- **Mechanic:** A simulation game — the player controls the Loch Ness monster, navigating the loch, avoiding detection, hunting, surfacing
- **Win condition:** Survive for the full day cycle (day to night to day)
- **Stone reward:** Water-worn Quartz (varies by depth — deeper = rarer)
- **Zone unlocked:** The Lighthouse
- **Audio:** The loch's ambient sound — water lapping, distant sonar, the monster's own heartbeat (slower than 50 BPM — the deep water's tempo). Each water monster has a signature lead instrument over the same base track.

### The Innkeeper's List (Quest Board)
Not a game per se — the quest system. Daily and story quests posted on the board. The Innkeeper's List is how the player discovers which zones need help and which characters have quests available. Quests are categorized:
- **Story quests** (persistent — the character quests designed above)
- **Delivery quests** (one-time — carry an item from Zone A to Zone B)
- **Fetch quests** (one-time — find a specific stone or item)
- **Discovery quests** (one-time — find an Anna doodle, a Wanderer rune, or a modern legend candidate)

---

## Interactive Items Summary

| Item | Location | Function |
|---|---|---|
| The Innkeeper's List | Great Hall entrance | Quest board — daily and story quests |
| The Bar | The Weeaboo's counter | Social hub, rumors, drinks, the "Mask That Serves" quest |
| The Arcade Machines | Arcade room | Four games, each unlocking a zone |
| The Market Stalls | Market area | Three tiers: Soulstice, Artisan, In-Game |
| The Library Nook | Reading room | World religions, modern legends shelf, reference texts |
| The Dragon's Geode | Geode Corner | Place stones, grow the dragon, build the Inn's simplest music |
| The Firekeeper's Hearth | Hearth corner | Stories, the "Last Story Told" quest, the Inn's warmest point |
| Cthulhu's Nook | Hidden fireplace nook | Rare book retrieval quest, rarest stones |
| The Wanderer's Walking Stick | Leaning against the bar | Pick it up — ravens steal it back. The stick is the "Road That Returns" quest item |
| The Chibi Ravens | Great Hall | Steal shiny things, hide them, provide comic relief. Items can be retrieved by finding the ravens' stash |
| The Modern Legends Shelf | Library Nook | Read entries, submit new stories, the Wanderer judges inclusion |
| The Climbing Passage | Upper rafters | The Weeaboo's route to the Canopy City (Clockwork Skies entry) |

---

## Zone Audio Profile

### Ambient Sound

| Layer | Sound | Source |
|---|---|---|
| Foundation | 42Hz hum (comfortable, audible — the Inn's heartbeat) | The Inn itself |
| Warmth | Hearth crackling (the Firekeeper's fire) | The hearth |
| Social | Bar clinking, market murmuring, NPC conversations | The people |
| Play | Arcade chimes, retro game sounds | The arcade machines |
| Nature | The dragon purring, ravens squawking, wind through the tree canopy | The living Inn |
| Navigation | The Wanderer's walking stick tapping on stone | The Wanderer's patrol |

### Zone Music

The Main Floor's music is the Inn's WELCOME THEME — the melody that says "you're home." It's warm, simple, and the player hears it every time they return from another zone. The theme is a variation of the Cosmology theme (the Brísingamen chord as melody) but in a major key, with warmer instrumentation — acoustic guitar, soft percussion, the hearth as rhythm.

The Main Floor music changes with the time of day:
- Morning: bright, gentle, acoustic
- Afternoon: busy, layered, the market sounds integrated
- Evening: warm, quiet, the bar sounds foregrounded
- Night: minimal — the hearth, the dragon's purr, the 42Hz hum. The Inn at rest.

---

## Connections to Adjacent Levels

**UP to Clockwork Skies (Level 2):**
- The climbing passage in the rafters (the Weeaboo's invitation)
- The Weeaboo is the bridge character

**UP to Cosmology (Level 1):**
- The staircase (through the Staircase level) — the Firekeeper's quest is the prerequisite
- The Wanderer is the Allfather's other self — the connection is narrative, not physical

**OUT to Campgrounds (Level 4):**
- The front door of the Inn — the exterior access

**DOWN to Staircase (Level 5):**
- The staircase entrance — a passage behind the library nook

**DOWN to Catacombs (Level 6):**
- Through the Staircase — the descending path

**DOWN to Fae Kingdom (Level 7):**
- The Stonehenge arcade machine — completing Standing Stones activates the portal

**DOWN to Water Zone (Level 8):**
- The Andean Vessel arcade machine — completing Andean Run unlocks the Water Zone

**DOWN to Undercity (Level 9):**
- Through the Catacombs — the deepest descent

---

## Level 3: Main Floor — Complete Checklist

| Component | Status |
|---|---|
| Zone overview & mythology | ✅ Complete — the Inn's body, the warm center |
| Visual language & lighting | ✅ Complete — mixed linework, hobbit-hole palette, living tree |
| Entry requirement | ✅ None (starting zone) |
| The Great Hall | ✅ Complete — hub, quest board, social center |
| The Bar | ✅ Complete — Weeaboo's domain, visiting NPCs, social hub |
| The Arcade | ✅ Complete — 4 games, 4 zone unlocks, themed machines |
| The Market | ✅ Complete — 3 tiers (Soulstice, Artisan, In-Game), NPCs, commercial bridge |
| The Library Nook | ✅ Complete — world religions, modern legends shelf, reading room |
| The Dragon's Geode | ✅ Complete — growth mechanic, sonic resonance, 3-phase questline |
| The Firekeeper's Hearth | ✅ Complete (from existing doc) |
| Cthulhu's Nook | ✅ Complete (from existing doc) |
| Character: The Wanderer | ✅ Complete — quest, audio, items, reward |
| Character: The Weeaboo | ✅ Complete — Main Floor quest (Mask That Serves), audio |
| Character: The Dragon | ✅ Complete — 3-phase questline, growth mechanic, geode system |
| Character: The Firekeeper | ✅ Complete (from existing doc) |
| Character: Cthulhu | ✅ Complete (from existing doc) |
| Game templates | ✅ Complete — 4 arcade games + Innkeeper's List quest board |
| Interactive items | ✅ Complete — 12+ items across all spaces |
| Audio profile (zone) | ✅ Complete — ambient layers, time-of-day music variations |
| Audio profiles (characters) | ✅ Complete — Wanderer, Weeaboo (Main Floor), Dragon |
| Reward structure | ✅ Complete — Wanderer's Stick, Weeaboo's Trust, Dragon's Song, arcade stones, zone unlocks |
| Connections to adjacent levels | ✅ Complete — all 8 connections mapped |

**LEVEL 3: MAIN FLOOR — COMPLETE.**


## Kubrick Composition
The main hall from the entrance, centered: fire at the far end, stairs visible on both sides, symmetrical, deep focus. 15-second held frame. This is the Inn's book cover — the painting that started everything. The player is standing inside the image they first saw. The dominant palette is amber and dark wood. The anomaly: the cold spot behind the bar (blue-gray discoloration). 90% amber, 8% brass, 2% wrong.

## Coppola Composition
The First Night at the Inn is a Coppola long scene — the player's first time staying past sunset. The Main Floor transitions from day to night in real time. NPCs change behavior. The hearth becomes the center. The Staircase darkens. The Catacombs get colder. The Blue Box keeps blinking. One continuous experience from sunset to the player's decision to sleep (save point) or keep exploring. 12-20 minutes. This is the Inn's Godfather wedding — the thing that looks normal and contains everything.

Coppola light: the hearth (warmth, community) vs. the back corners and the cold spot (what the Inn hides). The border: the zone halfway between hearth and cold spot where the warmth thins. That's where the player feels the Inn's moral architecture — the building is warm, but it's warm because someone tends the fire. If the Firekeeper stopped...
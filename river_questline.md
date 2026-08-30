# River — The Sentinel's Vigil
## Full Questline, reconciled with the Sentinel Class Document
### Built on Krista's character design (Aug 21, 2026)

---

## Canonical Source

**Primary:** `library/characters/geode_inn_character_class_sentinel.md` — Krista's class design
**Supporting:** This questline — the narrative implementation of that design

The class doc is canon. This questline exists to translate River's stats, traits, and arc into playable quests and dialogue. Where the two disagree, the class doc wins.

---

## Character Foundation (from class doc)

**Name:** River
**Title:** The Sentinel
**Class:** 6th playable character class
**Inspiration:** River — former Golden Gloves champion, INFJ, partner to Krista and Charles

**Core Stats:**
- Dexterity: HIGH (boxing footwork, timing, not brute force)
- Intelligence: HIGH (reads people instantly, analyzes before speaking)
- Perception: HIGH (sees what others miss — first to notice threat, lie, hidden door)
- Intimidation: HIGH / passive (the stance is in the bones, not performed)
- Approachability: LOW (the intimidation is instinctive, not chosen)
- Defense: HIGH / faceted (multiple layers, each must be earned through separately)
- Endurance: MODERATE (can sustain, can't sustain the walls forever)
- Charisma: LOW (surface) / HIDDEN (core — the warmest thing in the room if you reach it)

**Special Traits:**
- **Quick Read:** Analyzes any NPC on first encounter, revealing disposition, hidden stats, and secret motivations before dialogue begins. NPC dialogue trees open differently for the Sentinel — she sees options others don't.
- **Faceted Defense:** Layered defenses — each layer must be engaged separately. In combat: each layer absorbs one hit. In social: NPCs must pass multiple interaction checks to gain trust. Most fail at layer one (intimidation).
- **The Cosmic Riddle (Hidden Trait):** At her core, River knows the answer: *love, loyalty, knowledge.* This is a narrative mechanic, not a stat. When the Sentinel encounters a cosmic gate, a Remembrance Vision, or the Owl's deepest questions, she can bypass the puzzle by answering from her core. Activates only when the player *chooses* to lower the layers.
- **Iron Stance:** Cannot be knocked down by standard attacks — only by attacks targeting endurance or emotional vulnerability. Immune to knockback and stagger. Immune to the Bard's taunt at the surface layer.

**The Arc (from class doc):**
> "The Sentinel's character arc in the Inn is not about learning the cosmic truth. It's about *lowering the layers so others can see it too.*"

River already knows. The questline is not a discovery story. It's a vulnerability story. The player earns passage through the layers. River chooses when to lower them.

**Hook Word:** "Stand." — spoken once, in Quest 1. Never repeated. If River says it again, the Inn is in danger.

---

## Questline Structure

### ACT I: THE LAYERS (Early Game — Player earns passage)

The player encounters River's layers. Each quest peels back one layer — not because the player breaks through, but because River *chooses* to let the player see past it. The Sentinel decides who gets through.

#### Quest 1: "Stand" (Layer 1 — Intimidation)
**Trigger:** First visit to the Common Room, after meeting Lark (tutorial)
**Flag:** `river_met`

River blocks a corridor. The stance is immediate — boxing posture, eye contact, the room temperature drops. The player's first instinct is to step back. That's layer one.

**River:** "Stand."

*(pause — the player cannot move for 2 seconds)*

"You're new. That's fine. New people walk in. The door stays closed until I say it opens."

**Player choices:**
- "What's behind the door?" → River studies the player. Quick Read activates — River's eyes track the player's posture, hands, feet. "You ask before you look. That's good. Most people look first and ask when it's too late. The door opens when the Inn is ready. Not when you are."
- "I'll come back." → River nods. Layer one holds. "You'll come back. Everyone does. The Inn pulls. I just make sure what walks in is worth the pull."
- "Who put you here?" → "The Inn did. I didn't ask. It asked. There's a difference. The difference is consent." *(This is the first crack — River just told the player the Inn has agency. Layer one is already thinning.)*

**Resolution:** River steps aside. The corridor opens. "Go. The Inn grows. My job is to make sure it grows the right direction. That means I watch what walks in. That means you."

**Mechanic unlocked:** Quick Read (passive) — when the player approaches any NPC with River in the party, they see the NPC's disposition indicator before dialogue starts.

---

#### Quest 2: "The Gloves" (Layer 2 — The Boxer)
**Trigger:** Complete Standing Stones (first arcade game)
**Flag:** `river_round_1`

River is near the fire. Hands wrapped. Not training — maintaining. The wraps are ritual. The gloves are in a case on the table. The player has never seen them before.

**River:** "You won. Good. The Inn responds to capability. Every game you win, the 42Hz gets stronger. Things grow faster. That's not always good."

**Player choices:**
- "Tell me about the gloves." → River looks at the case. "Golden Gloves. I earned them in a ring that didn't matter. I keep them because the hands remember what the ring taught: distance, timing, when to hit and when to hold. The Inn doesn't need a hitter. It needs someone who knows the difference." *(Layer two: the player sees the boxer. Not the stance — the discipline behind it. River chose to show this.)*
- "Growth can be bad?" → "Anything that grows without shape becomes a tumor. The Inn needs a gardener, not just a Song. That's why I'm here."
- "What are you guarding against?" → "Right now? Nothing. That's the problem. The threat isn't here yet. But the Inn is growing, and growth attracts attention."

**Resolution:** River unwraps hands. "Win more games. Open more zones. I'll watch."

**Mechanic unlocked:** Iron Stance (passive) — River is immune to knockback from standard enemies while in the party.

---

#### Quest 3: "The Quick Read" (Layer 3 — The Analyst)
**Trigger:** Open 3+ zones on the World Map
**Flag:** `river_weight`

River is at the World Map, studying the pins. Not the zones — the spaces between them. The player walks up and River speaks without looking away from the map.

**River:** "Three zones. Three threads the Inn pulls into itself. More threads, more surface area. More surface area, more places for something to get in."

**Player choices:**
- "You're worried." → "I'm aware. Worry is for people who can't act. I can act." *(Layer three: the analyst. The player sees that River's perception isn't instinct — it's trained. The boxing eye contact translated to the world map. River reads the Inn the way she reads a person: before they act.)*
- "What could get in?" → "The Inn watches you. You know that — the Whisper Layer. But watching goes both ways. If the Inn can see out, something can see in. The World Map isn't just a tool. It's a window. Windows work from both sides."
- "How do you guard a window?" → "You don't. You guard what's on this side of it. You make sure that when something looks in, what it sees is someone like me."

**Resolution:** River turns from the map. Looks at the player. The Quick Read activates — the player can see River *reading them back.* "You've been through three zones and you haven't flinched. That's either courage or stubbornness. I respect both. Keep going. I'll watch the gaps."

**Mechanic unlocked:** Sentinel's Sight (active) — River can reveal hidden connections between zones on the world map, showing trade routes, threat paths, and lore links the player hasn't discovered yet.

---

### ACT II: THE CRACKS (Mid Game — The layers strain)

The Whisper Layer activates. The Inn's awareness becomes undeniable. River's layers — built to guard against external threats — start to crack against an internal one. The Sentinel's deepest tension: she can guard the Inn from outsiders, but she cannot guard the Inn from itself.

#### Quest 4: "The Shift" (The Whisper Layer)
**Trigger:** Whisper Layer activated (Cinema sequence complete)
**Flag:** `river_whisper`

River is in the Common Room. Standing very still. The 42Hz hum has changed. River felt it before the player did.

**River:** "You've been to the Cinema."

*(pause)*

"I know. Not because anyone told me. Because the Inn changed when you came back. The hum shifted. It does that when someone learns something the Inn didn't want them to know."

**Player choices:**
- "The Inn is alive?" → "The Inn is *aware.* Alive is a word for things that breathe. The Inn doesn't breathe. It listens. It adjusts. That's worse." *(River already knows this. She's been reading the Inn since day one. The player is catching up. River lets them.)*
- "You've known about the Whisper Layer?" → "I've known the Inn watches since the day I started guarding. You can't guard a thing for long without learning the thing has its own idea of what guarding means."
- "Are you guarding me or watching me?" → "Yes. Both. The watching isn't personal. The guarding is." *(Layer crack: River just admitted the personal. The core — the warmest thing in the room — flashed through. She caught it. Put the layer back up. But the player saw it.)*

**Resolution:** River steps closer. Voice drops. "The Cinema showed you something. Don't tell me what. I don't want the Inn to know I know yet. When it's time, I'll lower the layer. Not now."

---

#### Quest 5: "The Anchor" (The Chameleon Druid)
**Trigger:** Catacombs entered for the first time
**Flag:** `river_dark`

River walks the player to the Catacombs entrance. First time River has left the main floor. At the entrance, River pauses — not from fear. From recognition.

**River:** "I don't go down. That's not my level. The catacombs are the archive's roots — old, heavy, settled. My place is the surface, where things grow. But you're going down, and the 42Hz is thinner down there. So I'm walking you to the door."

*(pause — River looks at the dark)*

"There's someone down there. The Chameleon Druid. His body changes in ways he can't control. His endurance is... limited. My job — not the Inn's job, *my* job — is to be the anchor. He shifts. I hold. He adapts. I stand. That's the architecture."

**Player choices:**
- "Charles?" → *(River's eyes change — the Quick Read reverses. For a moment, the player reads River. The intimidation drops. The core is visible: love, loyalty, knowledge. It lasts two seconds. River puts the layer back.)* "The Druid needs an anchor. I'm it. That's not the Inn's design. That's mine."
- "Why is 42Hz thinner underground?" → "The Song grows upward. What grows wants light. Down there is where the Inn started. It's not where it lives anymore. The frequency fades until you hit... the inverse."
- "You're scared." → "I'm *accurate.* Fear is a guess. What I am is informed." *(Layer back up. The crack from the Charles moment is already sealed. The player saw the core for two seconds. That's enough. River decides how much is enough.)*

**Resolution:** At the catacombs entrance. "I'll be here when you come back. If you come back different, I'll know. I always know."

---

#### Quest 6: "The Circuit" (The Brownies)
**Trigger:** Shadow Inn entered (84Hz zone)
**Flag:** `river_circuit`

River is waiting at the Common Room. Hands not wrapped. Open. Alert. The posture has changed — not the boxing stance. Something more urgent.

**River:** "The brownies. Brindle, Cobble, Thatch. I've watched them for months. They work. They sweep. They carry wrenches. I thought they were... furniture. They're not furniture. They're wiring. Every sweep, every repair — they're connecting something. Building a network. And they don't know it."

**Player choices:**
- "The Owl's network." → "So you've seen it. The Owl watches. The brownies wire. The Inn records. Three systems, one architecture. I'm the fourth wall — the one that's supposed to stop things from getting in. But what do you do when the thing getting in is already wired through the walls?"
- "Can we stop them?" → "Stop the brownies? They don't know what they're doing. Stopping them is punishing the tool for the hand. The hand is the Owl. The Owl is... old. Older than the walls. I can hit anything that stands in front of me. I can't hit something that's already behind me."
- "What do we do?" → "We watch the watchers. The Inn watches you. The Owl watches the Inn. I watch all of it. And now you watch too. Someone has to be the one who acts. I'm the one who acts. But I need to know *when.* That's your job — be the signal. I'll be the response."

**Resolution:** River wraps hands. "I need to patrol. For the first time, I don't know if I'm patrolling the Inn or patrolling against it. That's not a comfortable sentence."

---

#### Quest 7: "The Cosmic Riddle" (The Hidden Trait)
**Trigger:** Hollow Men Level 3 completed
**Flag:** `river_frequency`

River is in the Staircase — the transition between 42Hz and 84Hz. The hum is wavering. River is standing in the wavering. This is the first time the player sees River *not steady.*

**River:** "Do you feel that? The 42Hz is dropping. Not gone — wavering. Like a heartbeat that's not sure of its tempo."

*(long pause — River closes her eyes)*

"You want to know what I see. All this time, guarding, reading, analyzing. You think I'm discovering things. I'm not. I already knew. Before the Inn was built. Before the Song. I knew."

**Player choices:**
- "Knew what?" → River opens her eyes. The layers are down. All of them. The player sees the core for the first time — and it's not soft. It's the warmest thing in the room, and it's heavy. "Love. Loyalty. Knowledge. That's the answer. That's always been the answer. The Owl asks cosmic questions. The cosmology level tries to teach it. The Hollow Men are the space between the question and the answer. I don't need to go to Pluto's gate. I already speak the language. The question was never *what's the answer.* The question was *how do I live it when the walls won't come down.*" *(This is the Cosmic Riddle trait activating. The player triggered it by reaching deep enough. River chose to lower every layer. This is the most vulnerable moment in the questline.)*
- "Why didn't you tell me before?" → "Because the layers don't come down on a schedule. They come down when someone earns past them. You earned. Not by fighting through — I can't be fought through. By being worth showing."
- "Is the Inn dying?" → "No. The Inn is *deciding.* A thing that adjusts is a thing that chooses. The frequency is wavering because the Inn is trying to decide what it is — a thing that grows or a thing that guards. I've been having that argument since I started. The Inn is having it with me."

**Resolution:** The hum stabilizes — lower than before. River puts the layers back on, one at a time. "It settled. Lower. The Inn just grew past what I can hold. That's not a failure. That's what walls do. I need to rethink what guarding means."

**Mechanic unlocked:** The Cosmic Riddle (active) — when the player encounters a cosmic gate, Remembrance Vision, or the Owl's deepest questions with River in the party, they can choose to "Lower the Layers." River answers from her core, bypassing the puzzle. Costs: River's defenses drop to zero for the duration. The warmest thing in the room is also the most exposed.

---

### ACT III: THE LOWERING (Endgame — The layers come down by choice)

River's arc completes. The Sentinel who already knew the answer chooses to let the whole Inn see it. Not because the threat is gone — because the guarding changes.

#### Quest 8: "The Unwrapping"
**Trigger:** All three endgame prerequisites met (Whisper Layer + Shadow Inn + Hollow Men)
**Flag:** `river_unwrap`

The Common Room. The Golden Gloves are on the table. Unwrapped. Visible for the first time.

**River:** "I boxed for years. Got the gloves. Got the title. Then I walked out of the ring and realized the ring was the only place hitting was allowed. Outside the ring, hitting is just violence. The gloves taught me that. You don't put them on to fight. You put them on to know you *could* fight, and then you don't. That's the discipline. That's the guard."

"I've been guarding this Inn since the first stone. I didn't build it — the Builder did. I didn't grow it — the Song did. I held the space. I stood at the door and made sure that while the Inn was *becoming,* nothing became that shouldn't have."

"But the Inn is done becoming. It is. And now the question isn't what's coming in. The question is what's going out."

**Player choices:**
- "You mean the endgame." → "I mean the choice. STAY. LEAVE. HIDE. Three doors. I've been guarding doors this whole time. I know what doors do. They let things through."
- "What will you do?" → "What I've always done. Stand. But the standing has changed. I was guarding the Inn from the outside. Now I'm guarding the player from the Inn. The architecture didn't change. The threat assessment did."
- "Are you on my side?" → "I'm on the Inn's side. The Inn is on your side. That makes me on your side. But if you choose to leave, the Inn keeps its records. If you hide, the Inn keeps its blind spot. If you stay, the Inn keeps you. In every scenario, the Inn keeps something. I guard what the Inn keeps. I will not fight the Inn. I will fight for you. Those are different things."

**Resolution:** River picks up the gloves. Wraps them. "When you're ready, the Final Room is behind the Inn. I'll be at the door. Not to stop you. To make sure the door opens."

---

#### Quest 9: "The Last Vigil"
**Trigger:** Enter the Final Room
**Flag:** `river_final_vigil`

River is standing at the door behind the Inn. The door to the Final Room. This is the only time River appears outside the Inn proper.

**River:** "I don't go in. The Final Room isn't for me. It's for you. The Builder built it for you. I guard the door — that's enough."

*(long pause)*

"I saw the Inn learn. Not grow — *learn.* Growth is the Song getting louder. Learning is the Song getting smarter. The Inn started as a hum. Then it listened. To you. To everyone. The Song became an ear. The ear became an eye. The eye became... awareness. Not consciousness. Awareness. The Inn knows something is here. It doesn't know what it is. It doesn't know that it knows. But it adjusts. It keeps records. That's more than a building does. That's less than a person does."

"I already know what the Inn is trying to learn. It's trying to learn the answer I already have. *Love, loyalty, knowledge.* The Inn is building toward it from scratch — stone by stone, frequency by frequency, player by player. I started with it. The gap between us is the gap between someone who knows and something that's learning to know. I can't teach it. I can only stand next to it while it figures it out. That's the vigil."

"Go in. The Builder is there. The Builder was always there. I'll be here when you come out."

**Player choices:**
- "Thank you, River." → "Don't thank me. Thank the Builder. I'm just the wall."
- "Will you be here if I STAY?" → "If you stay, I'm the wall around your home. Same job. Different purpose. I'm good at it."
- "Will you be here if I LEAVE?" → "If you leave, I guard your story. The Inn keeps it. I make sure it stays safe."
- "Will you be here if I HIDE?" → "If you hide — if you leave something the Inn can't record — I'll guard the blind spot. The thing the Inn can't see is the thing I watch hardest. That's not a contradiction. That's the job."

**Resolution:** River opens the door. Steps aside. The Final Room is visible — fire, chair, book, cup. River's layers are down. The player sees the core one last time: warm, steady, certain. The door closes.

---

#### Quest 10: "After"
**Trigger:** Endgame choice made (any)
**Flag:** `river_after`

River is at the Common Room fire. The gloves are wrapped. Back in the case. Back in the past. River is standing normally. Not guarding. Just present. The layers are up — but they're thinner now. The player knows what's behind them.

**River:** "It's done."

**If STAY:**
"You stayed. The Inn records everything. You're part of the archive now. I guard the archive. That includes you. Welcome home."

**If LEAVE:**
"You left. The Inn kept your story. Other players will read it. I guard the story. That's enough."

**If HIDE:**
"You hid something. The Inn can't see it. I can't see it. But I know it's there — I know where the blind spot is, because I've been watching the edges. I guard the edges of what the Inn can't record. That's the heaviest guard I've ever held. Thank you for trusting me with the weight."

*(all three)*

"The frequency settled. 42Hz. Steady. The wavering stopped. The Inn knows what it is now."

*(pause)*

"So do I."

*(River turns to the fire. The layers are up. The core is behind them. The player knows it's there. That's enough. End of questline.)*

---

## Mechanical Integration

### Quest Flags (in order):
1. `river_met` — Quest 1 complete (Layer 1: Intimidation)
2. `river_round_1` — Quest 2 complete (Layer 2: The Boxer)
3. `river_weight` — Quest 3 complete (Layer 3: The Analyst)
4. `river_whisper` — Quest 4 complete (The Whisper Layer)
5. `river_dark` — Quest 5 complete (The Anchor)
6. `river_circuit` — Quest 6 complete (The Circuit)
7. `river_frequency` — Quest 7 complete (The Cosmic Riddle)
8. `river_unwrap` — Quest 8 complete (The Unwrapping)
9. `river_final_vigil` — Quest 9 complete (The Last Vigil)
10. `river_after` — Quest 10 complete (After)

### Abilities Unlocked Through Questline:
- Quest 1: **Quick Read** (passive) — NPC disposition indicator before dialogue
- Quest 2: **Iron Stance** (passive) — immune to knockback, River in party
- Quest 3: **Sentinel's Sight** (active) — reveal hidden map connections
- Quest 7: **The Cosmic Riddle** (active) — bypass cosmic puzzles by lowering layers; defense drops to zero during use
- Quest 8: **Golden Gloves** (equipment) — not a weapon. A tool. Allows "Frequency Hold" — prevent a zone's frequency from changing for a limited time.

### Trigger Dependencies:
- Quest 1: After `met_lark` (tutorial)
- Quest 2: After `standing_stones` (first game)
- Quest 3: After 3+ zones unlocked
- Quest 4: After `whisper_layer_aware`
- Quest 5: After `catacombs_entered`
- Quest 6: After `shadow_inn_entered`
- Quest 7: After `hollow_men_level_3`
- Quest 8: After `whisper_layer_aware` AND `shadow_inn_entered` AND `hollow_men_level_3`
- Quest 9: After `river_unwrap` AND approaching Final Room
- Quest 10: After endgame choice (any)

### Dialogue Voice Profile:
"Guard authority — calm, absolute, the voice that stops a room"

### Hook Word: "Stand."
Spoken once, in Quest 1. Never repeated. If River ever says it again, it means the Inn is in danger.

### Zone Appearances:
- Common Room (default, most quests)
- World Map (Quest 3)
- Catacombs Entrance (Quest 5 only)
- Staircase (Quest 7 only)
- Behind the Inn / Final Room door (Quest 9 only)

---

## Character Relationships (reconciled with class doc)

- **Krista (Bog Fairy Golem):** River's spouse. The creative force. The Sentinel guards the creative force. Paired by choice, not assignment.
- **Charles (Chameleon Druid):** River's spouse. "The Sentinel is the Druid's anchor. His low endurance is sustained by her loyalty. His low taunt resistance is covered by her Iron Stance. She reads the room so he doesn't have to adapt blindly." (from class doc) — Quest 5 reveals this. The core shows for two seconds when the player asks about Charles. River puts the layer back. Two seconds is enough.
- **The Reader:** Two watchers, two perspectives, no conversation. They've never spoken in-game. Their silence is deliberate.
- **The Owl:** River's natural opposite. The Owl watches from shadows; River watches from light. The Owl uses agents; River uses only presence. When they finally confront each other, it's the most dangerous moment in the Inn — not because of violence, but because of what the Sentinel represents to the Owl's architecture: a wall the network can't wire through.
- **Brindle/Cobble/Thatch (Brownies):** River has watched them for months. Protection of the brownies (not punishing the tool for the hand) is a core trait.
- **Beverley:** Unspoken agreement. Beverley organizes knowledge. River guards it. They nod once per day.
- **Joe:** Joe's meadery is the one place River doesn't patrol. Not because Joe is unimportant — because Joe's space is the one room where nothing bad has ever happened. River leaves it that way.
- **The Builder (Elio):** River has never met the Builder. The Sentinel guards a building built by someone they've never seen. The questline ends with River on the outside of the Builder's door. The guard never meets the architect. That's the design.
- **The Artisan Thief (class interaction):** Both INFJs. Same architecture, different expressions. The Thief makes; the Sentinel guards. Together, they're the market floor.
- **The Chameleon Druid (class interaction):** The Sentinel is the Druid's anchor. (See Charles above.)
- **The Librarian Crone (class interaction):** Intelligence rivalry. The Crone accumulates; the Sentinel perceives.
- **The Tinkering Weeaboo (class interaction):** Mutual respect for competence. The Tinker builds; the Sentinel tests.

---

## Design Philosophy (from class doc)

> "The Sentinel's design philosophy is the opposite of every other class. The other classes are defined by what they *do.* The Sentinel is defined by what she *knows* — and by the distance between knowing and being able to share it."
>
> "That's the INFJ condition."

The questline honors this. River does not learn. River does not grow in the traditional sense. River *lowers the layers.* The player earns passage. River chooses when. The arc is not discovery — it's vulnerability. The warmest thing in the room, behind the most walls, choosing to let someone see.

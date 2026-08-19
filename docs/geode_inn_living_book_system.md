# Geode Inn — The Living Book System
## Design Specification
## August 2026

---

## Overview

The Living Book system transforms classic public-domain literature from passive reading into interactive experiences. Books on the Main Floor library shelves are physical objects the player can pick up. When opened, the player steps *into* the story — walking through key scenes, talking to characters as NPCs, and making choices that affect how the narrative unfolds.

Each Living Book is a self-contained interactive module that connects to the Base44 backend for dialogue data, character profiles, and player progress tracking.

---

## Core Philosophy

- **Fidelity to the source text.** Character dialogue is drawn from or inspired by the original writing. The author's voice is preserved — NPCs speak like their literary counterparts, not generic chatbots.
- **Key scenes, not full retellings.** We don't recreate every chapter. We select 3-7 pivotal moments that define the story and let the player experience them.
- **Player agency within fixed narrative.** The story's outcome doesn't change — Sydney Carton still goes to the guillotine — but *how* the player experiences that moment depends on their choices and relationships with the characters.
- **Thematically resonant with the Inn.** Books are selected not just for literary merit but for how they connect to the Inn's themes: resurrection, sacrifice, ancient knowledge, the weight of history, reclaiming power.

---

## Technical Architecture

### Base44 Backend (Data Layer)

**New Entity: `LivingBook`**
```
Fields:
- title (string) — Book title
- author (string) — Original author
- pubYear (number) — Original publication year
- innLocation (string) — Where the book sits in the Inn (e.g., "main-floor/library")
- sceneCount (number) — Number of interactive scenes
- themes (array) — Thematic tags (e.g., ["resurrection", "sacrifice", "revolution"])
- coverImage (string) — URL to generated book cover art
- bookDescription (string) — Short description for the shelf
- isAvailable (boolean) — Whether the book is unlocked
- unlockRequirement (string) — What the player needs to do to access it
```

**New Entity: `BookScene`**
```
Fields:
- bookId (string) — Reference to LivingBook
- sceneNumber (number) — Order in the story
- sceneTitle (string) — Name of the scene
- sceneSetting (string) — Description of the location/environment
- sceneSummary (string) — What happens in this scene (for the loading screen)
- backgroundArt (string) — URL to scene background image
- characters (array) — Character IDs present in this scene
- dialogueTreeId (string) — Reference to the dialogue tree for this scene
- interactiveType (string) — "dialogue" | "exploration" | "choice" | "puzzle"
- rewardStone (string) — Stone rewarded for completing this scene (if any)
```

**New Entity: `BookCharacter`**
```
Fields:
- bookId (string) — Reference to LivingBook
- name (string) — Character name
- role (string) — Character role (protagonist, antagonist, mentor, etc.)
- personality (string) — Personality description for dialogue generation
- appearanceNotes (string) — Visual description for character art
- dialogueStyle (string) — How this character speaks (e.g., "formal, melancholic", "cold, precise")
- spriteImage (string) — URL to character sprite
- firstScene (number) — First scene this character appears in
- isChibi (boolean) — Whether this character uses chibi art style
```

**New Entity: `DialogueTree`**
```
Fields:
- treeId (string) — Unique identifier
- bookId (string) — Reference to LivingBook
- sceneNumber (number) — Which scene this tree belongs to
- nodes (array) — Array of dialogue nodes:
  - nodeId (string)
  - speakerId (string) — Character ID
  - text (string) — The dialogue line
  - sourceReference (string) — Chapter/page from original text this is drawn from
  - choices (array) — Player response options:
    - choiceText (string)
    - nextNodeId (string)
    - moodEffect (string) — How this choice affects NPC mood
    - flagSet (string) — Any story flag this sets
  - isAuto (boolean) — If true, advances automatically (no player choice)
  - isEndNode (boolean) — Ends the scene
```

### Godot Frontend (Experience Layer)

**Scene Structure:**
```
res://living_book/
├── LivingBookManager.gd       — Main controller, loads book data from Base44
├── BookShelf.gd               — The shelf UI in the library, shows available books
├── BookReader.gd              — The "opening the book" transition animation
├── SceneView.gd               — Renders the current scene (background + characters)
├── DialogueBox.gd              — The dialogue UI (text display, choices, portraits)
├── CharacterSprite.gd         — Handles character animations/expressions
├── SceneTransition.gd         — Transitions between scenes within a book
└── BookCompletion.gd          — End-of-book screen, rewards, progress save
```

**DialogueBox.gd — Core Dialogue UI:**
- Portrait of speaking character on left
- Text appears with typewriter effect (speed adjustable)
- Character name displayed above text
- Up to 4 choice buttons at bottom when player input is needed
- Mood indicator (subtle visual cue showing NPC reaction)
- "Skip" button for re-reading players who want to move faster

**SceneView.gd — Scene Rendering:**
- Background image fills the screen (hand-drawn or AI-generated scene art)
- Character sprites positioned based on scene data
- Ambient effects per scene (rain, firelight, crowd noise — tied to music system)
- Clickable hotspots for exploration-type scenes (click on objects to examine)

**API Integration:**
```
# LivingBookManager.gd — Data loading flow
func load_book(book_id: String) -> void:
    var book_data = await APIManager.get_entity("LivingBook", book_id)
    var scenes = await APIManager.query_entity("BookScene", {"bookId": book_id})
    var characters = await APIManager.query_entity("BookCharacter", {"bookId": book_id})
    # Sort scenes by sceneNumber
    # Load first scene
    enter_scene(scenes[0])
```

**PlayerProgress Integration:**
```
# When a book is completed
func complete_book(book_id: String, scenes_completed: int) -> void:
    var progress = await APIManager.get_player_progress()
    progress.booksCompleted.append(book_id)
    progress.totalScore += book_reward_points
    await APIManager.update_player_progress(progress)
```

---

## The Player Experience

### Step 1: Discovery
The player explores the Main Floor library. Books sit on shelves with visible spines. Some glow softly (available), others are dimmed (locked). The player walks up to a shelf and sees book covers with titles and short descriptions.

### Step 2: Opening the Book
The player clicks a book. A transition animation plays — the book opens, pages turn, the screen fades into the first scene. A brief loading screen shows the scene title and a quote from the original text.

### Step 3: Experiencing the Story
The player is now *in* the story. They see the scene background, character sprites, and can interact. Depending on the scene type:

- **Dialogue scenes:** Characters talk to each other and to the player. The player makes choices that affect how NPCs respond to them. A gruff character might warm up if the player shows empathy, or shut down if the player is dismissive.
- **Exploration scenes:** The player clicks on objects in the environment to learn more. Clicking a wine cask in a Dickens tavern reveals historical context. Clicking a guillotine in a Tale of Two Cities scene shows its mechanical detail.
- **Choice scenes:** Major narrative moments. The player doesn't change the outcome, but they choose *how* they experience it. Do they try to warn Darnay? Do they comfort someone? The story proceeds regardless, but the emotional journey differs.
- **Puzzle scenes:** Rare, but some stories have natural puzzle moments. A cipher in a Poe story. A riddle from a Sphinx. Solving it unlocks the next scene.

### Step 4: Scene Transitions
Between scenes, a brief text passage from the original book appears — like chapter breaks. This grounds the experience in the source material and reminds the player this is a real literary work.

### Step 5: Completion
When the player finishes the last scene, the book "closes." A completion screen shows:
- Scenes experienced
- Characters met
- A stone reward (each book grants a gemstone tied to the story's themes)
- A literary note about the author and historical context
- The book returns to the shelf, now marked as "read" with a small gem on its spine

---

## Book Selection Criteria

A book qualifies for the Living Book system if:

1. **Public domain** — No copyright restrictions
2. **Pre-industrial setting or publication** — Fits the Inn's cutoff (pre-1850s for setting; publication date flexible if the story is set in the right era)
3. **Thematic resonance** — Connects to the Inn's core themes (resurrection, sacrifice, ancient knowledge, reclaiming power, mythology, alchemy)
4. **Strong characters** — The story has memorable characters with distinct voices that can become NPCs
5. **Pivotal scenes** — The story has 3-7 moments that are dramatically compelling enough to experience interactively

---

## Phase 1 Book Candidates

### 1. A Tale of Two Cities — Charles Dickens (1859)
**Setting:** French Revolution (1789) — at the Inn's cutoff
**Themes:** Resurrection, sacrifice, resurrection, the weight of history
**Scenes:**
1. "The Mail" — The Dover mail coach journey (atmosphere, introduction)
2. "The Wine Shop" — Paris wine cask scene (exploration, meet Defarge)
3. "The Trial" — Charles Darnay's trial in London (dialogue, courtroom drama)
4. "The Bastille" — Storming of the Bastille (exploration, revolution)
5. "The Knitting" — Madame Defarge's knitting register (dialogue, tension)
6. "The Letter" — Darnay's return to France (choice, consequence)
7. "The Far Better Rest" — Carton's final scene (emotional climax)
**Reward Stone:** Bloodstone (associated with sacrifice and courage)
**Characters:** Sydney Carton, Charles Darnay, Madame Defarge, Doctor Manette, Lucie Manette

### 2. The Divine Comedy — Dante Alighieri (1320)
**Setting:** Afterlife journey through Hell, Purgatory, Paradise
**Themes:** Spiritual transformation, the weight of sin and redemption, cosmic architecture
**Scenes:**
1. "The Dark Wood" — Lost in the wood (introduction)
2. "The Gate of Hell" — "Abandon all hope" (atmosphere, threshold)
3. "The Circles" — Descending through layers (exploration — maps directly to the Inn's downstairs/catacombs structure)
4. "Meeting Virgil" — The guide (dialogue)
5. "The Frozen Center" — Lucifer at the bottom of Hell (confrontation)
6. "The Mountain" — Purgatory begins (transition, hope)
**Reward Stone:** Obsidian (associated with deep transformation and shadow work)
**Characters:** Dante (player character), Virgil (guide NPC), various historical figures as encounter NPCs
**Special:** The descent through Hell maps perfectly to the Inn's catacombs — could function as a bridge between the library and the downstairs level

### 3. The Odyssey — Homer (c. 8th century BCE)
**Setting:** Ancient Greek world — Mediterranean voyage
**Themes:** The journey home, encounter with the unknown, reclaiming what was taken
**Scenes:**
1. "Calypso's Isle" — Trapped with the goddess (dialogue, temptation)
2. "The Lotus Eaters" — Land of forgetfulness (choice)
3. "The Cyclops" — Polyphemus encounter (puzzle/escape)
4. "Circe's Hall" — The enchantress (dialogue, transformation)
5. "The Underworld" — Consulting the dead (exploration)
6. "The Return" — Coming home to Ithaca (confrontation)
**Reward Stone:** Sardonyx (associated with courage and protection on journeys)
**Characters:** Odysseus (player), Circe, Calypso, Polyphemus, Teiresias, Penelope

### 4. Beowulf (c. 700-1000 CE)
**Setting:** Scandinavia, pre-Christian warrior culture
**Themes:** Monster-slaying, the weight of kingship, facing mortality
**Scenes:**
1. "Heorot" — The mead hall (introduction, atmosphere)
2. "Grendel's Attack" — The first monster (combat-as-dialogue)
3. "Grendel's Mother" — The underwater lair (exploration, descent)
4. "The Dragon" — The final battle (choice, sacrifice)
5. "The Funeral" — Beowulf's sendoff (emotional resolution)
**Reward Stone:** Garnet (associated with warrior courage and blood)
**Characters:** Beowulf, Hrothgar, Wiglaf, Unferth
**Special:** Connects to the catacombs level — the underwater lair maps to the water monster game themes

### 5. Frankenstein — Mary Shelley (1818)
**Setting:** Late 18th century Europe
**Themes:** Creation, responsibility, the boundary between human and divine
**Scenes:**
1. "The Letters" — Walton's Arctic voyage (framing, atmosphere)
2. "The Workshop" — Victor's creation moment (choice, horror)
3. "The Awakening" — The creature opens its eyes (perspective shift — player sees through the creature's eyes)
4. "The Flight" — The creature in the wilderness (exploration)
5. "The Demand" — The creature asks for a mate (dialogue, moral choice)
6. "The Confrontation" — Victor and creature on the ice (emotional climax)
**Reward Stone:** Galena (associated with alchemy and transformation of matter)
**Characters:** Victor Frankenstein, The Creature, Walton, Elizabeth
**Special:** Sits on the staircase — Frankenstein is literally an alchemical text about the bridge between matter and life

### 6. Grimm's Fairy Tales — Jacob & Wilhelm Grimm (1812)
**Setting:** European folklore
**Themes:** Power reclaimed, transformation, the uncanny
**Format:** Anthology — each tale is a short interactive vignette rather than a full book
**Scenes:** Short — 2-3 scenes each
**Tales for Phase 1:**
- The Frog King (directly ties to the Inn's frog transformation mechanic)
- Hansel and Gretel (children reclaiming power from a predator)
- Rumpelstiltskin (the power of knowing a true name)
- The Six Swans (transformation, endurance)
**Reward Stone:** Peridot (associated with protection and transformation)
**Characters:** Varies by tale
**Special:** The Frog King is a direct thematic match for the Inn's frog transformation moderation system — players who experience this story understand the mechanic's folklore roots

---

## Scene Types in Detail

### Dialogue Scene
The most common type. 2-4 characters are present. The player either participates as a character or observes as a "witness." Characters speak based on their dialogue trees. Player choices branch the conversation but converge on the same narrative endpoint.

**Example (A Tale of Two Cities — The Wine Shop):**
```
MADAME DEFARGE: "It is not often that strangers visit our shop twice in one week."
→ "I'm just passing through." → [Defarge nods, Madame watches]
→ "Your wine is exceptional." → [Madame smiles thinly, says nothing]
→ "I'm looking for someone." → [Madame's knitting pauses. Defarge changes subject]
```

Each choice sets a mood flag. If the player picks "looking for someone," Madame becomes cooler in later scenes. If they pick "your wine is exceptional," she remembers them and offers a small kindness later.

### Exploration Scene
No dialogue. The player clicks on objects in the scene to reveal text — historical context, character thoughts, environmental detail.

**Example (The Divine Comedy — The Circles):**
- Click on the river Acheron → "The river that must be crossed to enter Hell. Charon ferries souls across, but only the dead may ride his boat."
- Click on a soul in the crowd → A brief description of who this person was in life
- Click on the architecture → Notes on how Dante's Hell is structured (concentric circles, each with a specific sin)

### Choice Scene
A pivotal moment. The player faces a significant choice. The story proceeds regardless, but the emotional context changes. There is no "wrong" answer — the choice reflects the player's own values.

**Example (Frankenstein — The Demand):**
```
THE CREATURE: "You must create for me a companion. I am alone, and alone I am monstrous."
→ "I will not play God again." → [The creature's expression hardens. "Then I will make you as alone as I am."]
→ "I... will try." → [The creature's eyes fill with something like hope. But Victor's hands shake.]
→ "You don't deserve companionship." → [The creature stares. "That is not yours to decide."]
```

### Puzzle Scene
A mini-game integrated into the narrative. Must be solved to proceed. Short — no more than 2-3 minutes.

**Example (The Odyssey — The Cyclops):**
The player must figure out how to escape Polyphemus's cave. Options: fight (fails — too strong), run (fails — boulder blocks exit), trick (correct — give him wine, blind him, tie under sheep). The puzzle is about choosing the right approach, not about mechanical skill.

---

## Art Direction

- **Book covers:** Hand-illuminated style — gold leaf, aged parchment, ornate borders. Each cover reflects the book's themes.
- **Scene backgrounds:** Painterly, atmospheric. Warm for domestic scenes, cold for tragic ones. Style consistent with the Inn's overall aesthetic (amber, gold, cream tones for warmth; deep blues and greens for tension).
- **Character sprites:** Two styles:
  - **Full Presence** for major characters (Carton, Dante, Odysseus, Frankenstein's Creature) — detailed, expressive
  - **Chibi** for minor characters and comedic moments — consistent with the Inn's existing chibi system
- **UI:** Parchment-textured dialogue boxes with ornate borders. Choice buttons styled as wax-sealed letters.

---

## Music Integration

Per the Geode Inn music direction document:

- Each book has a theme instrument matched to its cultural origin
- Scene music shifts with emotional tone — dialogue scenes use ambient tones, choice scenes drop to near-silence with a single instrument, puzzle scenes add a rhythmic element
- Book completion plays a brief musical flourish using the book's theme instrument

**Examples:**
- A Tale of Two Cities: harpsichord (Paris) + string quartet (London)
- Divine Comedy: plainchant choir descending in pitch as you go deeper into Hell
- The Odyssey: lyre + aulos (ancient Greek instruments)
- Beowulf: deep throat singing + bone flute
- Frankenstein: glass harmonica (ethereal, alchemical sound)
- Grimm's: music box (uncanny, childlike-but-wrong)

---

## Implementation Phases

### Phase 1: Proof of Concept
- Build the LivingBook, BookScene, BookCharacter, and DialogueTree entities in Base44
- Implement DialogueBox.gd and SceneView.gd in Godot
- Create ONE complete book: **A Tale of Two Cities** (7 scenes, 5 characters)
- Test the full flow: shelf → open → scenes → completion → reward

### Phase 2: Expansion
- Add 2 more books: **The Divine Comedy** and **Grimm's Fairy Tales** (frog king tale connects to moderation mechanic)
- Implement exploration and puzzle scene types
- Add mood tracking — NPC reactions carry across scenes

### Phase 3: Library
- Add remaining Phase 1 candidates (Odyssey, Beowulf, Frankenstein)
- Implement the full shelf UI with book selection
- Add unlock requirements — some books require stones or progress from games
- Connect to PlayerProgress entity for cross-system tracking

### Phase 4: Community
- Allow players to "bookmark" favorite scenes
- Add a "reading room" where completed books can be re-entered at any scene
- Special dialogues unlock when a player has completed multiple thematically linked books (e.g., completing both Frankenstein and The Divine Comedy unlocks a special dialogue about the ethics of creation)

---

## Connection to Inn Architecture

| Inn Location | Living Book Function |
|-------------|---------------------|
| Main Floor (Library) | Book shelf — where books are discovered and accessed |
| Main Floor (Legends Nook) | Grimm's Fairy Tales connects to the modern legends framework |
| Staircase (Alchemy) | Frankenstein and alchemical texts as bridge between matter and life |
| Downstairs (Catacombs) | Divine Comedy's descent through Hell as a bridge to the catacombs level |
| Downstairs (Catacombs) | Beowulf's underwater lair connects to water monster themes |
| Cosmology (Upstairs) | Dante's Paradiso ascent as bridge to the upstairs level |

The Living Book system doesn't just sit in the library — it creates **bridges between levels of the Inn**. A player who reads Dante's Inferno in the library can then discover that the catacombs downstairs are structured the same way. A player who reads Beowulf recognizes the water monster game as an echo of the original monster-slaying story. The books make the Inn's architecture legible.

---

## Changelog

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-08-19 | Initial design spec. Living Book system architecture, 4 entity types, 4 scene types, 6 Phase 1 book candidates, music/art direction, implementation roadmap. |

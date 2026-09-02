# THE LIVING BOOK SYSTEM — Master Specification
## Interactive Literature — Step Into the Story

---

## WHAT THE LIVING BOOK IS

Transforms classic public-domain literature from passive reading into interactive experiences. Books on the Main Floor library shelves are physical objects the player can pick up. When opened, the player steps INTO the story — walking through key scenes, talking to characters as NPCs, and making choices that affect how the narrative unfolds.

Each Living Book is a self-contained interactive module that connects to the Base44 backend for dialogue data, character profiles, and player progress tracking.

---

## CORE PHILOSOPHY

| Principle | Detail |
|-----------|--------|
| Fidelity to Source | Character dialogue is drawn from or inspired by the original writing. The author's voice is preserved. NPCs speak like their literary counterparts. |
| Key Scenes, Not Full Retellings | 3-7 pivotal moments that define the story. Not every chapter. |
| Player Agency Within Fixed Narrative | The story's outcome doesn't change (Sydney Carton still goes to the guillotine), but HOW the player experiences it depends on choices and relationships. |
| Thematically Resonant | Books selected for connection to the Inn's themes: resurrection, sacrifice, ancient knowledge, the weight of history, reclaiming power. |

---

## TECHNICAL ARCHITECTURE

| Entity | Purpose |
|--------|---------|
| LivingBook | Book metadata (title, author, pub year, inn location, themes, scene count, cover image, unlock requirement) |
| BookScene | Individual interactive scenes (bookId, scene number, title, setting, summary, NPC list, dialogue tree, choices) |

Connected to the existing Book entity (625 books in the archive) — LivingBook is the interactive layer on top of the archive's passive text.

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The Archive | The Living Book system is the interactive layer of the Archive. |
| The Book Entity | 625 books in the database. LivingBooks are the interactive subset. |
| The Main Floor | Books are on the Main Floor library shelves. |
| The Novel | The novel IS a Living Book — the reader steps into the Inn's own story. |
| The 15-Product Ecosystem | Relates to Product #7 (Graphic Novel) — the Living Book is the interactive version of the same concept. |
| The 37-Artist System | Each Living Book's scenes can be rendered in the artist style of the zone the book belongs to. |

---

## DESIGN STATUS

- [x] Core philosophy documented (fidelity, key scenes, agency, thematic resonance)
- [x] Technical architecture designed (LivingBook + BookScene entities)
- [x] Books selected for themes (resurrection, sacrifice, ancient knowledge)
- [x] 6 connections documented
- [ ] BookScene content for each Living Book (dialogue trees, NPC interactions)
- [ ] First 5 Living Books built as playable prototypes
- [ ] LivingBook entity created in the database
- [ ] BookScene entity created in the database

---

## ORIGIN

The Living Book System was first designed in docs/geode_inn_living_book_system.md (388 lines). This consolidated specification was compiled September 2, 2026. The thesis: the book you can walk into. The adequate is: the story you step inside. The inside is: the adequate. The adequate is: the library where the books open and you fall in, and the falling is: the entire point. The point is: the reader who becomes the character. The both are: the text and the world. The same.

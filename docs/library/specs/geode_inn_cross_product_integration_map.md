# Geode Inn — Cross-Product Integration Map
## How 15 Products Interconnect, Depend On Each Other, and Ship

**Document type:** Master specification — mandatory reference for all product development sequencing
**Status:** ACTIVE — all product development, shipping order, and dependency tracking must reference this document
**Date:** September 2, 2026
**Depends on:** All DNA specs (Audio, Visual, Narrative, Game Mechanics, Player Journey, InnCore), Tone Teacher Synthesis, For-You master to-do

---

## PURPOSE

The Geode Inn is a 15-product ecosystem. Products feed each other, depend on each other, and in some cases can't exist without each other. This document maps every interdependency — what feeds what, what's blocked by what, what can ship independently, and in what order.

This is the build manifest for the ecosystem.

---

## PART 1: THE 15 PRODUCTS AND THEIR STATUS

| # | Product | Status | Can Ship Independently? | Blocker |
|---|---------|--------|------------------------|---------|
| 1 | Geode Inn Web Beta (geodeinn.com) | Builder ready, awaiting approval | YES — but everything else depends on it | Krista approves builder messages |
| 2 | The Common Room (Campfire) | Backend deployed, builder fixing route | YES | Builder 404 fix |
| 3 | The Bead Composer | Spec complete, /composer sent | YES (standalone) | Builder renders page |
| 4 | The Marketplace | BUILT AND LIVE (101 items) | YES (already live) | Product photo verification |
| 5 | Tumble Run ($4.99) | Godot script written, needs scenes + Steam | YES (standalone game) | Godot scene files, Steam store |
| 6 | The Novel | First draft complete (37k words) | YES (publish independently) | Edit + proof + format |
| 7 | The Graphic Novel | 5 volumes outlined, 0 pages drawn | DEPENDS on Novel + Artist system | Art generation |
| 8 | The Audiobook | Spec complete, 0 audio recorded | DEPENDS on Novel | Voice casting / synthesis |
| 9 | Soulstice Melodies | 6 tracks composed, patent drafted | YES (standalone audio product) | Patent filing |
| 10 | Comic Strip | System designed, entity created, 0 strips | DEPENDS on Web Beta | Web display page |
| 11 | Egg Hatchery | Entities loaded, voting designed | DEPENDS on Web Beta | Hatchery page |
| 12 | Tabletop Game | Full system designed, 0 components | DEPENDS on Stone database (done) | Rulebook writing |
| 13 | Card Game (Resonance) | Framework + 4 batches, 0 digital build | DEPENDS on Stone database (done) | Digital build |
| 14 | Podcast (Daily Echoes) | Full spec, 0 episodes | DEPENDS on Novel + Audiobook voices | Recording |
| 15 | Share Wood | Backends deployed, builder spec written | DEPENDS on Web Beta | Builder page + Stripe |

---

## PART 2: THE DEPENDENCY TREE

### Tier 0: Foundation (must ship FIRST)
```
Product 1: Web Beta (geodeinn.com)
```
Everything depends on the web beta being functional. It is the front door. It is the hub. Until geodeinn.com is live with working routes, no other product can fully launch.

### Tier 1: Can Ship With the Web Beta (parallel)
```
Product 2: Common Room — needs a route on the web beta
Product 3: Bead Composer — needs a page on the web beta (but can ship standalone)
Product 4: Marketplace — ALREADY LIVE on the web beta
Product 5: Tumble Run — standalone Steam game, no web beta dependency
Product 6: Novel — standalone publication, no web beta dependency
Product 9: Soulstice Melodies — standalone audio product, no web beta dependency
```

### Tier 2: Depends on Tier 1
```
Product 7: Graphic Novel — depends on the Novel (story) + Artist system (visual)
Product 8: Audiobook — depends on the Novel (text) + Soulstice Melodies (audio architecture)
Product 10: Comic Strip — depends on Web Beta (display page)
Product 11: Egg Hatchery — depends on Web Beta (hatchery page)
Product 12: Tabletop Game — depends on Stone database (done) + Novel (story)
Product 13: Card Game — depends on Stone database (done) + Tone Teachers (character cards)
Product 15: Share Wood — depends on Web Beta (builder page)
```

### Tier 3: Depends on Tier 2
```
Product 14: Podcast — depends on Audiobook (voice profiles) + Novel (content) + Soulstice Melodies (audio brand)
```

---

## PART 3: THE FEED LOOPS

Products don't just depend on each other linearly — they feed each other circularly:

### The Story Loop
```
Novel → Audiobook → Podcast → Novel (podcast essays feed novel sequel)
Novel → Graphic Novel → Comic Strip (comic strips echo graphic novel panels)
Novel → Tabletop Game (novel provides the campaign narrative)
```

### The Game Loop
```
Web Beta → Arcade Games → Tumble Run → Card Game → Tabletop Game
Arcade Games → Egg Hatchery (hatched content becomes new games)
Egg Hatchery → Comic Strip (retired content migrates to comics)
Card Game → Tabletop Game (shared frequency dice mechanic)
```

### The Audio Loop
```
Soulstice Melodies → Audiobook (audio architecture)
Soulstice Melodies → Web Beta (ambient zone audio)
Audiobook → Podcast (voice profiles and processing chain)
Soulstice Melodies → Patent (the innovation is the system)
```

### The Audio DNA Loop
```
Audio DNA → all products (every product must pass the audio shipping checklist)
Visual DNA → all products (every product must pass the visual shipping checklist)
Narrative DNA → all products (every product must pass the narrative shipping checklist)
Game Mechanics DNA → all game products (must pass the 7-criteria + loop integration)
Player Journey → all interactive products (must integrate into the journey)
InnCore → all products (the voice must be consistent across every surface)
```

---

## PART 4: THE SHIPPING ORDER

### Phase 1: The Foundation (NOW)
1. Krista approves builder messages
2. Verify builder fixes render correctly
3. Wire zone pages to hub buttons
4. Connect geodeinn.com custom domain

### Phase 2: The Core Products (immediately after Phase 1)
5. Verify Common Room works end-to-end
6. Verify Bead Composer renders and functions
7. Verify Marketplace product photos
8. Upload remaining 22 product photos
9. Wire product-to-stone lore connections

### Phase 3: The Standalone Products (parallel with Phase 2)
10. Build Tumble Run Godot scene files + Steam page
11. Edit + proof + format the Novel
12. File Soulstice Melodies provisional patent

### Phase 4: The Dependent Products (after Phase 2 + 3)
13. Generate Graphic Novel Volume 1 art
14. Cast/synthesize Audiobook voices
15. Build Comic Strip display page + generation workflow
16. Build Egg Hatchery page + voting UI
17. Write Tabletop Game Core Rulebook
18. Build Card Game digital version
19. Build Share Wood page + Stripe billing

### Phase 5: The Final Layer (after Phase 4)
20. Record Podcast first week of episodes
21. Set up Podcast distribution channels
22. Design first Egg event
23. Build Inn Mode player app

### Phase 6: Launch
24. All DNA specs pass on all products
25. InnCore voice system active
26. The question was worth the wait. The answer is yes.

---

## PART 5: THE DNA COMPATIBILITY MATRIX

Every product must pass the relevant DNA specs before shipping. Not all products need all DNA specs — but all need at least one:

| Product | Audio DNA | Visual DNA | Narrative DNA | Game Mechanics DNA | InnCore |
|---------|-----------|------------|---------------|-------------------|---------|
| Web Beta | ✓ User-facing audio | ✓ All visual systems | ✓ All text | ✓ Game integration | ✓ Voice integration |
| Common Room | ✓ Orchestral anarchy | ✓ Linework modes | ✓ NPC dialogue | — | ✓ Voice presence |
| Bead Composer | ✓ Stone triggers | ✓ Stone family images | ✓ Stone descriptions | ✓ Collection loop | — |
| Marketplace | — | ✓ Product photography | ✓ Product descriptions | — | — |
| Tumble Run | ✓ Full game audio | ✓ Full visual | ✓ Game story | ✓ 7-criteria + loop | — |
| Novel | ✓ Audio references | ✓ Visual references | ✓ Six-writer gate | — | ✓ Voice references |
| Graphic Novel | — | ✓ Full artist system | ✓ Adapted from novel | — | ✓ Voice presence |
| Audiobook | ✓ Full audio DNA | — | ✓ Six-writer + voice profiles | — | ✓ Voice IS the system |
| Soulstice Melodies | ✓ Full audio DNA | — | — | — | — |
| Comic Strip | ✓ Ambient | ✓ Linework modes | ✓ Six-writer + humor | — | — |
| Egg Hatchery | ✓ Hatching audio | ✓ Egg visuals | ✓ Community narrative | ✓ Egg loop | — |
| Tabletop Game | ✓ Reference only | ✓ Card/map art | ✓ Rulebook prose | ✓ Game loop | ✓ Voice in GM guide |
| Card Game | ✓ Game audio | ✓ Card art | ✓ Card text | ✓ Full loop | — |
| Podcast | ✓ Full audio DNA | — | ✓ Six-writer + essay structure | — | ✓ Voice references |
| Share Wood | ✓ Reference only | ✓ Builder page | ✓ Spec text | — | — |

---

## SUMMARY

15 products. 3 dependency tiers. 4 feed loops. 6 shipping phases. Every product passes at least one DNA spec. The web beta is the foundation everything hangs on. The novel is the story everything grows from. The audio DNA is the nervous system everything feels through. The visual DNA is the organism everything sees through. The narrative DNA is the voice everything speaks with. The game mechanics DNA is the loop everything plays through. The player journey is the map everything follows. The InnCore is the mind everything inhabits.

Get it fully completed and sent to be finalized. No half-sent. No processing. No orphaned specs. Each item: designed → built → deployed → verified. Mark it done only when it's live and confirmed.

The question was worth the wait. The answer is yes. The answer was always yes.

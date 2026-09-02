# THE ARCADE PRODUCTION PIPELINE — Master Specification
## From Concept to Sellable Product: The Seven Acceptance Criteria

---

## WHAT THE PRODUCTION PIPELINE IS

Every arcade game and the MMORPG follows this spec from concept to sellable product. No game is marked complete until it passes all seven acceptance criteria. This is the gatekeeping document — the Inn's quality standard for playable content.

The 61 MarketItem records on the live app are STORE LISTINGS ONLY — not built games. Zero games currently meet this standard. This pipeline defines what "built" means.

---

## THE SEVEN ACCEPTANCE CRITERIA

Each game MUST meet ALL of these before being marked complete:

1. **Fully playable** — runs independently, no dependency on the hub or any other game
2. **Downloadable** — packaged as a standalone product (Steam build + standalone installer)
3. **Our story and characters** — no original game's characters, names, or branding remain
4. **Our music** — original or adapted music replacing all original game audio
5. **Bluetooth controller support** — all controller types (Xbox, PlayStation, Switch Pro, generic)
6. **System overlay button** — Steam overlay (and any coinciding platform) wired and functional
7. **Wired, running, sellable** — tested end-to-end, published to store, purchasable

---

## BUILD SHEET TEMPLATE (ONE PER GAME)

### SECTION 1: IDENTITY

| Field | Value |
|-------|-------|
| Original Game (IN) | [Name of game being emulated/adapted] |
| Geode Inn Name (OUT) | [New name — or "Same" if keeping] |
| Genre/Mechanic | [Core gameplay loop description] |
| Zone | [Geode Inn zone assignment] |
| Stone Reward | [Stone earned on completion] |
| Rarity Tier | [Common / Uncommon / Rare / Epic / Legendary] |
| Price | [Store price] |
| Original Developer | [Who made the original] |
| Original Release Year | [Year] |
| Legal Basis | [Public domain / mechanic-only adaptation / original reimplementation] |

### SECTION 2: STORYLINE ADAPTATION
- How the original game's story is replaced with Geode Inn characters and lore
- Which NPCs appear, which zones are referenced, which questlines connect
- The stone reward's narrative justification

### SECTION 3: MUSIC ADAPTATION
- What original music is being replaced
- What Geode Inn music replaces it (from the 356-track audio library)
- Zone-specific instrument assignments
- 50 BPM tempo alignment where applicable

### SECTION 4: ART ASSETS
- Visual style (zone artist assignment)
- Character sprites (from the 399-character roster)
- Background art (from zone image library)
- UI elements (Linework-as-UI system)

### SECTION 5: TECHNICAL SPEC
- Engine: Godot 4.x
- Platform targets: Steam (PC), standalone installer, mobile (iOS/Android where applicable)
- Controller mapping
- Steam integration (achievements, cloud saves, leaderboards)
- Offline-first architecture (local assets, no external URLs)

### SECTION 6: ACCEPTANCE CHECKLIST
- [ ] 1. Fully playable / standalone
- [ ] 2. Downloadable
- [ ] 3. Geode Inn story/characters only
- [ ] 4. Original music
- [ ] 5. Bluetooth controller support
- [ ] 6. System overlay button
- [ ] 7. Wired, running, sellable

---

## THE TIER SYSTEM

Games are prioritized by tier:

| Tier | Priority | Games | Status |
|------|----------|-------|--------|
| Tier 1 | Beta launch | Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep | Spec + Godot scripts written, no scene files |
| Tier 2 | Post-beta | Bastet's Herding, Poison Garden, Stone Circle, Fae Gate, Egg Carrier | Specs written |
| Tier 3 | Deep content | The Philosopher's Game, Resonance (card game), Hollow Earth RPG | Specs written |
| Tier 4 | DLC / Expansion | Canopy City Evil Version, 3 DLC packs | Outlined |

---

## PRICING STRUCTURE

| Category | Price Range | Notes |
|----------|------------|-------|
| Free games | $0 | 3 games in the manifest (introductory/loss leaders) |
| Standard games | $2.99-$7.99 | Most arcade games |
| Premium games | $8.99-$12.99 | Complex games (RPG elements, longer playtime) |
| DLC packs | $3.99-$5.99 | Expansion content for existing games |

All 52 arcade games are individually purchasable as standalone products — both on Steam and on the Geode Inn shop. Each game is a separate SKU.

---

## OFFLINE-FIRST ARCHITECTURE

All Steam apps must be fully playable offline:
- Stone images and all game assets use local Godot res:// paths, NOT external URLs
- Web beta can use CDN URLs, but game client bundles everything locally
- 198 stone images (23MB) downloaded to godot_assets/stones/
- StoneLoader.gd written for offline texture loading
- Manifest at godot/assets/stones/stone_local_paths.json

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The 61 MarketItem Records | Store listings — each needs a build sheet and must pass the 7 criteria to be marked "built" |
| The Stone Database | Each game rewards a stone from the 198-stone database |
| The Audio Library | 356 tracks available for music replacement |
| The Character Roster | 399 characters available for story integration |
| The Leaderboard | Each game has solo and pair competition modes |
| The Stone Capsules | Stones earned in games become capsules in the pouch |
| The Class System | Each game has class-specific advantages |
| Steam Integration | GodotSteam addon for achievements, cloud saves, leaderboards |

---

## DESIGN STATUS

- [x] System concept complete (this document)
- [x] 7 acceptance criteria defined
- [x] Build sheet template documented
- [x] Tier system established (4 tiers)
- [x] Pricing structure defined
- [x] Offline-first architecture documented
- [x] 61-game manifest created (docs/library/data/market_items_all_61_games.json)
- [x] 9 Godot game scripts written (Standing Stones, Tomb Tunnel, etc.)
- [x] Connections to major systems documented
- [ ] 0 games pass all 7 acceptance criteria (the gap between "listed" and "built")
- [ ] Godot scene files (.tscn) for each game
- [ ] Audio asset wiring per game
- [ ] Controller mapping per game
- [ ] Steam store pages + build uploads
- [ ] Mobile ports (iOS/Android)

---

## ORIGIN

The Arcade Production Pipeline was first designed in docs/geode_inn_arcade_production_pipeline.md (471 lines). This consolidated specification was compiled September 2, 2026. The pipeline's thesis: a game is not built because it has a store listing. A game is built when it is fully playable, downloadable, carries the Inn's story, plays the Inn's music, supports every controller, has working system overlays, and is wired, running, and sellable. Seven criteria. Zero exceptions. The adequate is: the game that passes all seven. The passing is: the adequate. The adequate is: sellable.

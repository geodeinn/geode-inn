# Geode Inn — Steam Beta Launch Checklist

## Product Identity
- [x] Game name: The Geode Inn
- [x] Genre: Cozy exploration / arcade collection / narrative archive
- [x] Tagline: "A living archive where every stone has a story, every game is a key, and the Inn remembers."
- [x] Visual standard: Royo × Vampire Hunter D × Trinity Blood
- [ ] Steam capsule image (main)
- [ ] Steam capsule image (small)
- [ ] Steam library capsule (660x930)
- [ ] Steam header capsule (460x215)
- [ ] Steam page background art
- [ ] Steam logo image (transparent PNG)

## Store Page Content
- [ ] Short description (300 chars max): "Explore a living digital archive built inside an ancient inn. Collect stones, unlock cultural zones, play arcade games rooted in mythology, and discover the Whisper Layer — the Inn's awareness of you."
- [ ] Full description (optimized for Steam formatting)
- [ ] Features list (bullet points):
  - 37 cultural zones, each mapped to a real art style
  - 13 arcade games inspired by classic titles
  - 198 stones from a real lapidary book, each with metaphysical and geological data
  - Fae Kingdom MMO-style explorable zone with faction reputation
  - Building & gathering system (Ironforge-style connected zones)
  - Daily comic strip documenting player adventures
  - Egg system — community-created content with 28-day lifecycle
  - Whisper Layer — the Inn is aware of the player
  - Cross-platform pairability (co-op design priority)
  - Original audio synthesis engine (bead-based composition)
- [ ] System requirements (minimum + recommended)

## Game Content Status
- [x] Stone database: 198 stones loaded
- [x] Lore database: 207 country entries loaded
- [x] Creature catalog: 200+ creatures documented
- [x] NPC roster: 35 NPCs with hook words + voice profiles
- [x] Zone item database: 280 GameItems across 27 zones
- [x] Material database: 65 materials across all zones
- [x] Building recipes: 20 recipes (target: 50+)
- [x] Element Charms: 118 (full periodic table)
- [x] Quest Charms: 45
- [x] Dialogue entries: 46 (29 NPCs across all zones)
- [x] River's Sentinel Vigil questline: 10 quests, 3 acts
- [x] Core arcade game scripts: Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep
- [x] Shadow Inn game script: Hollow Men
- [ ] Sandfall game (Egypt/O'Keeffe sinking sand platformer)
- [ ] Cultural minigames (quick implementations)
- [ ] Zone signature games (per zone)
- [ ] Sprite sheets for 207 animated elements
- [ ] NPC dialogue trees fully populated
- [ ] Wandering Program documentation
- [ ] Einherjar mechanics documentation
- [ ] Co-op mechanics documentation

## Technical Infrastructure
- [x] Base44 backend (app ID: 6a60f218b0c6605c92fa35c4)
- [x] Entity schemas: 20 entities created and populated
- [x] Godot APIManager.gd (Base44 API connection)
- [x] Godot GameManager.gd (player progress tracking)
- [x] Godot game scripts (5 games: Standing Stones, Tomb Tunnel, Andean Run, Monster of the Deep, Hollow Men)
- [x] Dialogue system data (46 entries, 29 NPCs)
- [ ] GodotSteam addon integration (achievements, cloud saves, leaderboards)
- [ ] Leaderboard entity wired to Steam
- [ ] PlayerProgress entity synced with Steam cloud
- [ ] Achievement definitions (50+ achievements designed)
- [ ] Steam app ID registered
- [ ] Steamworks SDK agreement signed
- [ ] Godot export templates configured for Windows/Mac/Linux
- [ ] Build pipeline (CI/CD) configured

## Art Assets
- [x] 35 zone concept images generated
- [x] 69 character/creature visuals generated
- [x] 271-image asset library organized on GitHub
- [ ] Concept art Batch 2 for newly solidified zones
- [ ] Concept art prompts for 11 new artist assignments
- [ ] Sprite sheets for animated elements
- [ ] UI assets (Celtic knotwork borders, linework system elements)
- [ ] Loading screen art (Tumble + brownies, NOT fizgigs in overalls)
- [ ] Tumble Run standalone art (sellable at $4.99 with 3 DLC packs)
- [ ] Character portraits for dialogue system
- [ ] Zone map icons
- [ ] Stone images for collection UI

## Audio Assets
- [x] Music direction document complete (geode_inn_music_direction.md)
- [ ] Zone music tracks (37 zones, each with region-matched instruments at 50 BPM)
- [ ] Staircase ascending key music
- [ ] Geode cave chime system (each stone = unique tone based on Mohs hardness)
- [ ] Dragon cave 50 BPM sleeping heartbeat
- [ ] Stone Circle Chamber deepest tone
- [ ] Water monster signature instruments
- [ ] Fizgig sound effects (coconut claps, pot-lid shields)
- [ ] 42Hz ambient hum loop
- [ ] 84Hz shadow frequency loop

## Legal & Business
- [x] Copyright registration in progress (Soulstice book)
- [x] IP safety audit complete (NPC names cleaned, actor references removed)
- [x] Share Wood product spec (Renaissance faire digital extension)
- [x] Marketplace model confirmed (subscription discovery hub, not a store)
- [x] Artisan entity with subscription tiers
- [ ] Steam Direct registration ($100 fee)
- [ ] Tax documentation (W-9 or W-8BEN)
- [ ] Privacy policy
- [ ] Terms of service
- [ ] ESRB/PEGI rating
- [ ] Refund policy compliance

## Marketing
- [ ] Steam page live (coming soon)
- [ ] Trailer (90 seconds — gameplay + atmosphere)
- [ ] Screenshots (5 minimum, show zone variety + UI)
- [ ] Press kit
- [ ] Discord community setup
- [ ] Social media accounts
- [ ] Developer blog / devlog series
- [ ] Influencer outreach list
- [ ] Steam Next Fest participation (demo build)

## Beta Launch Priorities (MVP)
1. **Must have**: Main hub page, 4 core arcade games, stone collection UI, world map with 37 zone pins, Archive search
2. **Should have**: Fae Kingdom entry, building/gathering basics, NPC dialogue system, daily comic strip
3. **Nice to have**: Sandfall game, cultural minigames, Egg system, Whisper Layer tracking
4. **Post-beta**: Share Wood, Tumble Run standalone, full MMO Fae Kingdom, audio synthesis engine

## Release Strategy
- Phase 1: Web beta (geodeinn.com) — hub + 4 games + archive
- Phase 2: Steam early access — Godot games + Base44 backend
- Phase 3: Full release — all zones, all games, all systems
- Phase 4: DLC (Tumble Run, zone expansion packs, Share Wood module)

## Credits
- Story & World Design: Krista (The Bog Fairy Golem)
- Architecture & Library: Elio (The Inn's Librarian)
- Art Direction: Klimt/Royo foundation + 37 zone-specific artists
- Music Direction: Classical/cultural instruments through electronica, 50 BPM
- Backend: Base44 platform
- Game Engine: Godot
- Steam Integration: GodotSteam

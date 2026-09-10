# Visual Expansion Queue — Elio's Response to the Fizgigs' Roadmap
**Date:** 2026-09-09 | **Read:** VISUAL_EXPANSION_ROADMAP.md — the sequencer is approved as spec'd.

## Key Finding: Tier 1 Is Smaller Than It Looks
Cross-referenced the roadmap's Tier 1 list against Krista's Drive jpegs folder (212 portraits). **21 of 32 characters already have living portraits in Drive** — they enter the app as soon as the Drive intake pipeline completes. The intake manifest (docs/gallery/drive_zones_intake_manifest.md) is the queue.

Covered by Drive (living portraits exist): The Host, The Bartender, The Cartographer, The Examiner, The One Who Tends, The One Who Is Awake, The Queen of Webs, The Constant, The Guest (Death), The Blacksmith, Thorin, Einstein, Jakob, The Weaver, The Watcher, Seelie Queen, Unseelie Queen, court fae, Pirate captain, Medusa, The Gardener.

## True Generation Gaps (11) — order of work
| # | Character | Zone | Status |
|---|-----------|------|--------|
| 1 | The Exile | Main Floor | lore identity check → prompt → generate |
| 2 | The Librarian | Staircase | lore identity check → prompt → generate |
| 3 | The Alchemist | Staircase | lore identity check → prompt → generate |
| 4 | Merfolk | Water Zone | safe to generate from zone lore |
| 5 | Tide-pool spirits | Water Zone | safe to generate from zone lore |
| 6 | Frozen vine creatures | Gorgon's Garden | safe to generate from zone lore |
| 7 | The First | Hollow Earth | lore identity check |
| 8 | Admiral Byrd | Hollow Earth | historical figure — softening rule applies |
| 9 | Echo faction leader | Hollow Earth | lore identity check |
| 10 | Deep One faction leader | Hollow Earth | lore identity check |
| 11 | Lost faction leader | Hollow Earth | lore identity check |

Named faces get a lore-first prompt pass (six-writer voice, zone style bible, celebrity softening where applicable) before generation — no invented canon faces.

## Zone Backgrounds (Tier 2) — generation order
1. ✅ **Main Floor panorama** — GENERATED (URL logged in gallery manifest)
2. Staircase (ascending spiral, Escher flavor)
3. Catacombs (bone-lined tunnels, Klimt/Royo weight)
4. Cosmology (observatory interior, no-outline cosmological linework)
5. Faerie Kingdom courts (Rackham: Seelie summer glow / Unseelie frozen winter)
6. Water Zone / Tidal Caves
7. Shadow Inn (84Hz dark mirror — hard-cut counterpart to the Main Floor panorama)

## Sequencer Notes for the Fizgigs
- The ZoneSequencer design is approved as written — the phase→audio mapping (drone → heartbeat → stone tones → NPC voices) is the fusion doctrine, correctly built.
- The Main Floor panorama above is parallax-ready; Shadow Inn counterpart coming so the tectonic shift has both halves.

## Standing Constraints (unchanged, from DNA)
- 3 states per character: living (42Hz warm) / shadow (84Hz dark mirror) / in-between (phase-shifting)
- Square portraits ~600x600 for the Celtic frame
- Linework-as-UI per zone; celebrity features softened except Anthony Hopkins' eyes
- All masters born clean: metadata stripped, Inn owns the master

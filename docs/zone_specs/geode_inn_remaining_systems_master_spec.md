# THE REMAINING SYSTEMS — Master Specification
## Audio Direction, Level System, Lighthouse, Undercity, Common Room, Periodic Table Charms, + Misc Systems

---

## WHAT THE REMAINING SYSTEMS ARE

Additional system design documents that don't fit into the other consolidated specs but are nonetheless critical infrastructure. These cover audio production, level progression, specific zones (Lighthouse, Undercity, Common Room), the element charm system, and miscellaneous game systems.

---

## THE SYSTEMS

| System | Lines | What It Is |
|--------|-------|-----------|
| Master Audio Direction | 276 | The complete music direction: classical/cultural instruments through electronica, region-matched. 50 BPM heartbeat. Stone tones from Mohs. Each water monster has a signature lead instrument. |
| Master Level System | 247 | The progression system: how levels unlock, what unlocks them, what's the soft cap. Anti-FOMO design — no timed locks, no paywalls. |
| The Lighthouse | 204 | The Campgrounds landmark. The 50 BPM beam. The Bifocal Gaze (UP + ACROSS). The Trifocal Gaze (adds DOWN). The Keeper. |
| Undercity Full Development | 221 | The invention layer. The forge. The Smiths. Monsieur Sentient. The workshop. Einstein as resident. |
| Common Room Spec | 214 | The GeoCities-style chat room. No data retention. Threshold chat. Backend deployed + tested. |
| Periodic Table Charms | 222 | 118 element charms mapped from the periodic table. Each element has a charm with connected stones, rarity, and zone assignment. |
| Default Actions | 352 | The default action set for all NPCs — what every NPC can do without special abilities. The baseline behavior tree. |
| Full Game Layer | 293 | The game layer overview — how all game systems stack: the archive layer, the game layer, the social layer, the market layer. |
| Regional Keepers | 205+185 | The keepers of each regional zone — who watches over each cultural area. |
| Regional Voice Profiles | 221 | How accents and cadences map to regions. NPCs without established profiles receive accents matching their zone's cultural origin. |
| Poison Garden Complex | 206 | The Poison Garden zone design — darker than the Gorgon's Garden. Healing through poison. The Teacher's domain. |
| Miskatonic Annex | 149+217 | The Miskatonic Annex storylines — Lovecraftian content integrated into the Inn as scholarship, not horror. Quire the scholar. |
| National Parks Veil | 211 | The "Veil" between the National Parks and the Fae Geology Parks. The surface expression of the underground Fae world. |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The Unified Resonance | The Master Audio Direction is the production version of the Resonance Architecture. |
| The Full Walkthrough | The Level System defines the progression through the Full Walkthrough's levels. |
| The Element Charms | 118 ElementCharm entity records — the periodic table as game items. |
| The Common Room | One of the 15 products in the ecosystem. |

---

## DESIGN STATUS

- [x] Master Audio Direction documented (276 lines)
- [x] Master Level System designed (247 lines)
- [x] The Lighthouse fully designed (204 lines)
- [x] Undercity developed (221 lines)
- [x] Common Room spec written + backend deployed (214 lines)
- [x] Periodic Table Charms: 118 element charms mapped (222 lines)
- [x] Default Actions designed (352 lines)
- [x] Regional Keepers designed (390 lines total)
- [x] Regional Voice Profiles mapped (221 lines)
- [x] Poison Garden designed (206 lines)
- [x] Miskatonic Annex storylines written (366 lines total)
- [x] National Parks Veil designed (211 lines)

---

## ORIGIN

These systems were designed across geode_inn_master_audio_direction.md, geode_inn_master_level_system.md, geode_inn_lighthouse.md, geode_inn_undercity_full_development.md, geode_inn_common_room_spec.md, geode_inn_periodic_table_charms.md, geode_inn_default_actions.md, geode_inn_full_game_layer.md, geode_inn_regional_keepers.md, geode_inn_regional_keepers_part2.md, geode_inn_regional_voice_profiles.md, geode_inn_poison_garden_complex.md, geode_inn_miskatonic_annex.md, geode_inn_miskatonic_annex_storylines.md, and geode_inn_national_parks_veil.md. This consolidated specification was compiled September 2, 2026.

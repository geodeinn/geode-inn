# Geode Inn — Zone Mapping Template

## Purpose

This document defines the standard structure for every zone in the Geode Inn ecosystem. Every zone — whether part of the core Inn, a Share Wood extension, or a future expansion — follows this template. This ensures consistency across art, audio, narrative, gameplay, and database integration.

The fizgigs can use this as a checklist when building any new zone. If a field doesn't apply, mark it N/A rather than skipping it.

---

## Zone Template

### ZONE ID: z## — [Zone Name]

#### 1. Identity
| Field | Value |
|-------|-------|
| Zone Number | z## |
| Zone Name | [Name] |
| Level | Upstairs / Main Floor / Staircase / Downstairs / Underground / Water / Exterior / Fae / Cosmology / Share Wood |
| Parent Zone | [Which zone connects to this one above, or "Root" for top-level] |
| Connected Zones | [List of zones reachable from this one] |
| Map Pin | [lat, lng] or "N/A — interior zone" |
| Frequency | 42Hz (Living) / 84Hz (Shadow) / In-Between / Variable |
| Inn Mode DSP Profile | [Which of the 7 audio room profiles applies] |

#### 2. Visual Style
| Field | Value |
|-------|-------|
| Primary Artist | [Artist name — the foundational visual language] |
| Secondary Artist | [Optional accent/blend artist] |
| Linework Style | Heavy cel-shaded (tradesmen) / Soft flowing (lore) / Sharp angular (guardians) / No-outline (cosmological) / Fragmented (crisis) |
| Color Palette | [Dominant colors, accent colors, e.g. "Deep blue-black with gold and silver star points"] |
| Texture | [Background texture, e.g. "Celtic knotwork gold-on-dark-stone" or "Old paper grain"] |
| Lighting | [Warm amber / Cold blue / Firelight orange / Starlight silver / etc.] |
| Reference Image | [Filename or URL of the zone visual] |

#### 3. Audio
| Field | Value |
|-------|-------|
| BPM | [Tempo — most zones use 50 BPM] |
| Key Instruments | [Primary instruments for this zone] |
| Ambient Layer | [Background sound: wind, water, fire crackle, stone hum, etc.] |
| Signature Sound | [Unique audio element — e.g. "stone circle resonance at 42Hz"] |
| Inn Mode DSP | [Reverb time, room character — from the 7 DSP profiles] |
| Frequency Behavior | [How the zone sounds in Living vs Shadow vs In-Between states] |

#### 4. Characters
| Field | Value |
|-------|-------|
| Primary NPCs | [Characters who live here] |
| Visiting NPCs | [Characters who pass through] |
| Creatures | [Critters, cryptids, or fauna native to this zone] |
| Portrait Set | [Which frequency portraits are needed: Living / Shadow / In-Between] |
| NPC Roster IDs | [Reference to npc_master_urls.json entries] |

#### 5. Gameplay
| Field | Value |
|-------|-------|
| Arcade Game(s) | [Game(s) hosted in this zone, or "None"] |
| Game Archetype | [Tetris / Dig Dug / Temple Run / etc.] |
| Reward Stone | [Stone earned from completing the game] |
| Quest Lines | [Quest chains that pass through this zone] |
| Crafting Stations | [If any — forge, loom, apothecary, etc.] |
| Gatherable Materials | [Resources players can collect here] |
| Puzzles | [Any puzzle mechanics specific to this zone] |
| Combat | [Yes/No — and what type if yes] |

#### 6. Narrative
| Field | Value |
|-------|-------|
| Zone Description | [1-2 sentences: what this place feels like when you walk in] |
| Story Function | [What role this zone plays in the larger narrative] |
| Whisper Layer | [Does the Whisper Layer manifest here? How?] |
| Lore Connections | [Which mythology/culture this zone draws from] |
| Books | [Book entity records assigned to this zone via inGameZone] |
| Novel Chapters | [Which novel chapters take place here] |
| Comic Potential | [Is this zone good for Gazette comic strips? Why?] |

#### 7. Data
| Field | Value |
|-------|-------|
| Entity References | [Which database entities are active in this zone] |
| Market Items | [MarketItem records assigned to this zone] |
| Board Skins | [BoardSkin records that match this zone's aesthetic] |
| Building Recipes | [Recipes craftable in this zone, if any] |
| Dialogue Entries | [Dialogue entity records for this zone] |

#### 8. Share Wood Compatibility
| Field | Value |
|-------|-------|
| Available as Share Wood Template | Yes / No |
| Tier Required | The Clearing ($29) / The Village ($79) / The Kingdom ($199) |
| Customization Points | [What a faire owner can change vs what stays Inn-canonical] |
| Vendor Booth Capacity | [Max booths if used as a Share Wood zone] |
| Climate Preset | [If this zone's environment can adapt to a faire's physical location] |

---

## How to Use This Template

1. Copy the template above for each new zone
2. Fill in every field — use "N/A" if something doesn't apply, don't leave blanks
3. The Zone ID (z##) must be unique and sequential
4. The Primary Artist must come from the Inn's 37-artist catalog
5. The Frequency must be one of the three established states
6. Reference file paths (not descriptions) for images, manifests, and data files

## The 37 Established Zones

| ID | Zone | Level | Artist | Frequency |
|----|------|-------|--------|-----------|
| z01 | Cosmology | Upstairs | Dali | 42Hz |
| z02 | Clockwork Skies | Upstairs | Da Vinci | 42Hz |
| z03 | The Observatory | Upstairs | Escher | 42Hz |
| z04 | The Main Floor | Main Floor | Matisse / Van Gogh | 42Hz |
| z05 | The Archive | Main Floor | Gorey / Dore | 42Hz |
| z06 | The Marketplace | Main Floor | Canaletto | 42Hz |
| z07 | The Common Room | Main Floor | Rockwell | 42Hz |
| z08 | Joe's Studio | Main Floor | Van Gogh | 42Hz |
| z09 | The Garden | Main Floor | Monet | 42Hz |
| z10 | The Campgrounds | Main Floor | Bierstadt / Carr | 42Hz |
| z11 | The Workshop | Main Floor | Wyeth | 42Hz |
| z12 | The Upper Staircase | Staircase | Rackham | In-Between |
| z13 | The Middle Staircase | Staircase | Escher | In-Between |
| z14 | The Lower Staircase | Staircase | Klimt Death+Life | In-Between |
| z15 | The Catacombs | Downstairs | Klimt Death+Life | 84Hz |
| z16 | Egypt | Downstairs | O'Keeffe | 42Hz |
| z17 | Peru | Downstairs | Bierstadt | 42Hz |
| z18 | Celtic Lands | Downstairs | Book of Kells | 42Hz |
| z19 | Japan | Downstairs | Hokusai | 42Hz |
| z20 | Greece | Downstairs | Moreau | 42Hz |
| z21 | Norse Lands | Downstairs | Rousseau | 42Hz |
| z22 | India | Downstairs | Tagore | 42Hz |
| z23 | Mesopotamia | Downstairs | Roerich | 42Hz |
| z24 | Mesoamerica | Downstairs | Mulan | 42Hz |
| z25 | Fae Kingdom — The Threshold | Fae | Lee | In-Between |
| z26 | Fae Kingdom — The Summerlands | Fae | Bauer | 42Hz |
| z27 | Fae Kingdom — The Hollow | Fae | Gothic | 84Hz |
| z28 | Fae Kingdom — The Crystal Gardens | Fae | Carr / Escher | In-Between |
| z29 | Gorgon's Garden | Underground | O'Keeffe x Klimt | 84Hz |
| z30 | The Shadow Inn | Underground | Klimt Death | 84Hz |
| z31 | The Loch | Water | Royo | 42Hz |
| z32 | The Abyss | Water | Lewis | 84Hz |
| z33 | The Siren's Coast | Water | Waterhouse | 42Hz |
| z34 | The River Underneath | Water | Hokusai | 42Hz |
| z35 | The Spiral Gallery | Exterior | Escher / Rothko | 42Hz |
| z36 | The World Map | Exterior | O'Keeffe / Monet / Hokusai | 42Hz |
| z37 | The Final Room | Cosmology | Rothko | Variable |

## Share Wood Zone Extensions

Share Wood zones use the same template but with these modifications:

- Zone IDs start at sw01 (Share Wood zones are separate from Inn canonical zones)
- The Primary Artist is selected by the faire owner from the 37-artist catalog
- Tier 1 (The Clearing) can choose from 8 styles: Klimt, Royo, Van Gogh, O'Keeffe, Bierstadt, Rackham, Hokusai, Dore
- Tier 2 (The Village) can choose from all 37 styles
- Tier 3 (The Kingdom) can blend 2 styles (primary + accent)
- Characters are N/A (faire owners populate their own vendors)
- Gameplay is N/A unless the faire owner requests arcade integration
- Narrative is owner-defined (the copyright shield ensures they use Inn art styles, not copyrighted ones)
- The Inn's frequency system still applies — zone ambient audio follows the 42Hz/84Hz/In-Between model

## Foundational Visual DNA

All zones share two foundational artists regardless of their assigned style:

- **Klimt** — Stillness, weight, staying. The feeling of being somewhere that has existed for a long time.
- **Royo** — Movement, drama, arriving. The feeling of something coming toward you.

These two are the coin. Every other artist is a room flavor built on this foundation.

## Linework-as-UI System

Each zone uses one of five linework approaches:

1. **Heavy cel-shaded** — Tradesmen, workshops, functional spaces. Clean borders, practical energy.
2. **Soft flowing** — Lore spaces, archives, gardens. Lines that breathe.
3. **Sharp/angular** — Guardians, combat zones, borders. Lines that warn.
4. **No-outline** — Cosmological spaces, dream zones. Form without boundary.
5. **Fragmented** — Crisis zones, Shadow Inn, Gorgon's Garden. Lines that break apart.

## Audio Architecture

The Inn IS a transducer. Every zone maps to an IEM driver type:

- **Dynamic Drivers** = Stones, matter, physical zones (frequencies you feel)
- **Balanced Armature** = Characters, voices, social zones (frequencies you hear)
- **Electrostatic** = Cosmology, observatory, upper zones (frequencies you sense)
- **Bone Conduction** = Catacombs, underground, 42Hz Song (frequencies you know)

System constants across all zones:
- 42Hz Song (Living)
- 84Hz Shadow Inn inverse
- 111Hz Gargoyle watchers
- 50 BPM canopy sway
- 7.83Hz Schumann calibration

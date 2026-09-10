# BUILDER SYNC — CHARACTER NAME ROSTER UPDATE
## Priority: HIGH — Affects all character references site-wide
## Status: Awaiting Krista's approval

---

The character roster has completed a full naming audit (September 3, 2026). Seventeen character renames are now canonical. Any character references in live pages, components, NPC profiles, dialogue displays, card galleries, or hardcoded content must be updated to the new names.

## CANONICAL CHARACTER NAMES (effective immediately)

| Old Name | New Name | Notes |
|----------|----------|-------|
| Jaime / Oceananoir | **Oceanianoir** | Spelling correction — always with the i. The Living Archive, walking periodic table, Atlantis resident. Pirate-hacking backstory is IRL-only, NOT game data. |
| Krista (as character) | **Vaulknut** | In-game name for the Bog Fairy Golem / Artisan Thief / Selkie. Authorship credits and real-world references remain "Krista." |
| The Sentinel | **Lozen** | Lozen's character. Class title was "The Sentinel"; character name is Lozen. |
| Malachi | **Malachi** | The Unseelie King. |
| Mim / Madame Mim | **Brim** | The pipe-smoking chaos agent. (The card game's card is named MADAME — that's the card name only.) |
| Cthulhu | **Naut** | The squid-headed scholar. Naut the Scholar, by the fireplace, Archive keeper. |
| Radagast (the Gardener) | **SORREL (the Greenward)** | Ruled by Krista 2026-09-10: a flowing name for a mellow little guy — the rhythm of a name defines how a person sees them (Krista's law). Sorrel is the soft garden green AND the old word for warm reddish-brown: the Gardener's green and the Catalyst's red held in one word, the complementary pair that IS their friendship. Swept 2026-09-10: all references renamed, the Sylvester McCoy casting retired (original face, the Oleander precedent). |
| John Myers (NPC) | **Quire** | The Lovecraftian scholar NPC. |
| John Myers (player slot) | **FOLIO — the First Reader** | Reserved player slot for Krista's real-life friend John Myers — the one who found Lovecraft for her. Named of Quire's ilk: a quire is the folded stack of sheets, a folio is made of quires — kin terms in the bookmaker's craft. Slot saved in staging (playerId: player_slot_folio). Ruled by Krista 2026-09-10. |
| Sorrel | **The Greenward** | The Gardener. Nature keeper. |
| Beorn | **The Bearsark** | The skin-changer. |
| Uhtred | **The Wayfarer** | The Saxon warrior, walks between zones, the pressure release valve. |
| Aughra | **Fibonacci** | The Keeper who collects planetseed pods and reads the spiral patterns. |
| Wednesday Addams / Wednesday | **Belladonna** | The goth character, Undercity host, Poison Garden matron. One character (roster entries merged). |
| Noctua (owl) | **Noctua** | Merlin's owl companion. |
| Eileen | **Aurallia** | The Hearth — cave painter, art teacher, the warm maternal presence. Mother of the four NPCs: Speter Adams, Bramble (chosen), Scarlett (pending), John (pending). The real person keeps her own name. |
| Dani | **Luna** | The zen jeweler, Campgrounds, Jay's counterweight. Flowing fae-rave name (chosen 2026-09-03). The real person keeps their own name. |
| Adam | **Speter Adams** | The Chameleon / The Dollkeeper — chosen name (2026-09-03). The doll-with-souls collector, zone-shifting performer. |
| Anna | **Bramble** | The Seer / The Doodler — chosen name (2026-09-04). The quiet one in the Cosmology nook, drawing the Inn in fragments that turn out to be the whole blueprint. The real person keeps their own name. |
| "Ryuk form" | **True Form** | The Tinkering Weeaboo's transformation. Never use the copyrighted name — describe as "the shinigami archetype: tall, angular, yellow-eyed, too-wide grin, too-long fingers." |

## IMPORTANT DISTINCTIONS

1. **Waystone ≠ The Wayfarer.** Waystone is a SEPARATE character — the recovery character in the Camelot healing hall (named for the Waystone Inn). The Wayfarer (formerly Uhtred) is the wanderer between zones. Do not merge them.

2. **The Wednesday (Cosmic Crew) stays.** "The Metronome / The Wednesday" in the Clockwork Skies cosmic crew is a different character — a crew member named for the day. Only the goth character (formerly Wednesday Addams) is Belladonna.

3. **Lovecraft mythos references stay.** Text about "Lovecraft's Cthulhu" or "the Cthulhu mythos" as literary source material keeps the original word. Only the Inn's NPC is Naut.

4. **Image filenames are legacy.** Files in Base44 storage keep their original names (jaime_concept_art.png, the_keeper_aughra.png, uhtred_v2.png, etc.). They are asset references only — display names must use the new character names.

5. **Real players keep real names.** John Myers the player, Lozen the person (Lozen is the character), Krista the builder (Vaulknut is the character).

## WHAT TO UPDATE

- Any NPC name displays on zone pages, character galleries, or profile cards
- Dialogue system references (npcName fields when dialogue is wired)
- Card game displays (Brim's card is MADAME; the character elsewhere is Brim)
- Quest text, flavor text, and NPC titles
- The Egg Hatchery egg attributions (Brim's Egg, Naut's Egg, Waystone's Egg)
- Any leaderboard, inventory, or progress references using character names

## FULL ROSTER REFERENCE

The canonical roster lives in the repo at docs/geode_inn_master_character_roster.md (361 files synced, commit 36effb4). When in doubt, the roster is the source of truth.

---

## UPDATE — 2026-09-09 (supersedes rows above where noted)

New canonical renames applied across all repo text. Full ledger: `docs/characters/character_rename_ledger.md`.

| Old Name | New Name | Notes |
|----------|----------|-------|
| Madame Mim / Mim / Mimm | **Brim** | Sept 3 choice stands, confirmed by Krista 2026-09-09 ("whichever fits best" — Brim chosen: original, avoids the Disney witch name, fits the brimstone chaos-agent energy). |
| Solstara | **Luna** | Supersedes Sept 3 "Dani → Solstara." Goes by Luna; true name Taaffeite. She may still choose a different name for her non-storyline character. |
| Andra | **Katya** | The Siren / water guardian. SPELLING RULE: when Vaulknut addresses her directly in dialogue, spelled "Katija." |
| Zee | **Zeke** | The Pirate — "the Pirate" remains correct as reference. Full name Zaragoza. Gag: when annoyed, his NPC calmly reveals his full name is actually Ezekiel, as he sails away. |
| Katy | **Lichenblossom** | Volunteer NPC, artisan. |
| Bethany | **Wisteria** | Tavern keeper's wife (Jay's campsite tavern). |
| Jareth | **Malachi** | Residual references swept — Sept 3 row now fully applied. |
| Evan | **The Archivist** | The chess wizard. Real person keeps "Evan" in real-world contexts. |
| (unnamed) | **Oleander** | The Seelie King's name. Title "the Seelie King" remains valid as descriptor. |
| Joe | **The Collector** | Undercity NPC. Wife Siobhan, son Liam. |
| Starlit Geode | **The Starlight Crystal** | Wherever the name appears. |

**Files renamed:** `river_questline.md` → `lozen_questline.md`; `river_dialogue_entries.json` → `lozen_dialogue_entries.json`.

**Pending — do NOT hardcode yet:** Scarlett, John, Ryan, Marian/Marion, Zack (run-through alt name), Luna's possible self-rename, the Ragana's Latvian name (chosen by Krista's mom, pending).

**Characters to create:** TJ (Jay's tavern family, 12, filler name, very smart + quiet about it, really cool kid), Maddi (Zack's wife, future Inn employee, old-school computer fluency, MySpace empire, charismatic double agent — names hers to choose), Folio the First Reader (the player slot for the real John Myers — CREATED 2026-09-10, distinct from the NPC Quire), Greg (Wisteria's brother, Luna's husband, skilled artisan — confirm NPC status).

**Open questions for Krista:**
1. Brim vs the Ragana — same character or separate? (Egg Hatchery Event 1 + card decks currently tie them; the Ragana's new Latvian name is pending, suggesting separate.)
2. RESOLVED 2026-09-09: Joe the Miniaturist/Painter IS The Collector (confirmed by Krista). Display names updated; "Joe Black" (Meet Joe Black energy, the Guest) references unchanged.

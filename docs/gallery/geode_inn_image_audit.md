# Geode Inn — Image Placement Audit Report
## Generated: 2026-08-31

The "Rubik's Cube" of image data. This document maps every character to its visual assets, flags duplicates, identifies missing pieces, and tracks tri-mode completion.

---

## 1. UPLOADED NPC IMAGES: 161 files

### Characters with Multiple Variants (REVIEW NEEDED): 29 characters

These characters have 2+ image files. During placement review, you'll need to decide which version is canonical for each frequency state.

**jareth_unseelie_king** (3 versions):
  - jareth_unseelie_king.png
  - jareth_unseelie_king_v2.png → revision
  - jareth_unseelie_king_v3.png → third revision

**nyx** (3 versions):
  - nyx.png
  - nyx_ingame.png → in-game render
  - nyx_v2.png → revision

**the_constant** (3 versions):
  - the_constant.png
  - the_constant_ingame.png → in-game render
  - the_constant_v2.png → revision

**charon** (2 versions):
  - charon.png
  - charon_v2.png → revision

**hades** (2 versions):
  - hades.png
  - hades_v2.png → revision

**hel** (2 versions):
  - hel.png
  - hel_v2.png → revision

**jaime** (2 versions):
  - jaime_concept_art.png → concept art
  - jaime_concept_art_v2.png → revision

**kali** (2 versions):
  - kali.png
  - kali_v2.png → revision

**persephone** (2 versions):
  - persephone.png
  - persephone_v2.png → revision

**queen_of_webs** (2 versions):
  - queen_of_webs.png
  - queen_of_webs_v2.png → revision

**seelie_king** (2 versions):
  - seelie_king.png
  - seelie_king_v2.png → revision

**seelie_queen** (2 versions):
  - seelie_queen.png
  - seelie_queen_v2.png → revision

**the_astronomer** (2 versions):
  - the_astronomer.png
  - the_astronomer_v2.png → revision

**the_bard** (2 versions):
  - the_bard.png
  - the_bard_v2.png → revision

**the_cartographer** (2 versions):
  - the_cartographer.png
  - the_cartographer_v2.png → revision

**the_catalyst** (2 versions):
  - the_catalyst.png
  - the_catalyst_v2.png → revision

**the_cook** (2 versions):
  - the_cook.png
  - the_cook_v2.png → revision

**the_crone** (2 versions):
  - the_crone.png
  - the_crone_v2.png → revision

**the_examiner** (2 versions):
  - the_examiner.png
  - the_examiner_v2.png → revision

**the_gardener_radagast** (2 versions):
  - the_gardener_radagast.png
  - the_gardener_radagast_v2.png → revision

**the_guest_death** (2 versions):
  - the_guest_death.png
  - the_guest_death_v2.png → revision

**the_host** (2 versions):
  - the_host.png
  - the_host_v2.png → revision

**the_one_who_is_awake** (2 versions):
  - the_one_who_is_awake.png
  - the_one_who_is_awake_v2.png → revision

**the_one_who_tends** (2 versions):
  - the_one_who_tends.png
  - the_one_who_tends_v2.png → revision

**the_pirate** (2 versions):
  - the_pirate.png
  - the_pirate_v2.png → revision

**the_retort** (2 versions):
  - the_retort.png
  - the_retort_v2.png → revision

**the_siren** (2 versions):
  - the_siren.png
  - the_siren_v2.png → revision

**thorin** (2 versions):
  - thorin_v2.png → revision
  - thorin_v3.png → third revision

**uhtred** (2 versions):
  - uhtred.png
  - uhtred_v2.png → revision


---

## 2. TRI-MODE COMPLETION STATUS

| Category | Living (42Hz) | Shadow (84Hz) | In-Between | Total Images |
|----------|:---:|:---:|:---:|:---:|
| NPC Main Cast (~60) | ✅ All | ✅ 48 generated | ⚠️ Only Belladonna | ~108 |
| Critters (12) | ✅ All | ✅ All | ✅ All | 36 |
| Water Monsters (32) | ✅ All | ✅ All | ✅ All | 96 |
| Cryptids (48) | ✅ All | ✅ All | ✅ All | 144 |
| Items & Artifacts (25) | ✅ All | ✅ 14 generated | ❌ Not started | 39 |
| Zone Backgrounds | N/A | N/A | N/A | 52 |
| Stone Images | N/A | N/A | N/A | 198 |
| Supply Icons | ✅ 76 generated | N/A | N/A | 76 |
| **TOTAL** | | | | **~749** |

### What's Missing for Full Tri-Mode:
- **~59 NPC In-Between versions** (only Belladonna done)
- **11 Item In-Between versions** (none done)
- **3 critter specs without images**: Axolotl, Mantis Shrimp, Rain Frog
- **~17 more cryptids** from Wikipedia roster (optional expansion)

---

## 3. IMAGE NAMING ISSUES (The Rubik's Cube)

These are the sorting problems that need manual review:

### A. Old Names That Need Renaming
- `madame_mim.png` → should be **Brim** (renamed)
- `jareth_unseelie_king*.png` → should be **Malachi** (renamed, 3 versions exist)
- `uhtred*.png` → should be **Waystone** (renamed)
- `wednesday_addams.png` / `belladonna_v2.png` → should be **Belladonna** (1 each, need consolidation)
- `the_brownies.png` → rejected design (looked like Daleks), kept for record only
- `madame_holding_dobby.png` → unclear if this is Brim holding something
- `river_sentinel_*.png` / `sentinel_concept.png` / `the_sentinel_river.png` → all are **Lozen**, 3+ files need consolidation

### B. Characters with "In-Game" vs "Concept" Variants
- `charon.png` + `charon_v2.png` → which is canonical?
- `crone.png` + `crone_v2.png` + `crone_full_presence_ingame.png` + `crone_ACCIDENTAL_CANONICAL.png` → 4 versions!
- `nyx.png` + `nyx_ingame.png` + `nyx_v2.png` → 3 versions
- `the_constant.png` + `the_constant_ingame.png` + `the_constant_v2.png` → 3 versions
- `erik_earl_ragnar.png` + `erik_norse_host_ingame.png` + `erik_v2.png` → 3 versions
- `pirate_cabbit_ingame.png` + `the_pirate.png` + `the_pirate_v2.png` → 3 versions
- `bog_fairy_golem_ingame.png` → separate from other Bog Fairy Golem images?
- `joe_miniaturist_ingame.png` + `joe.png` → 2 versions
- `kathy_druid_dryad_ingame.png` → is this a separate character from Charles?

### C. Crew Member Naming
Clockwork Skies crew has inconsistent naming:
- `crew_cool_v2.png` → **The Cool** (no v1 uploaded, only v2)
- `crew_goku.png` → unclear which crew member this is
- `crew_mamoru.png` → unclear which crew member
- `crew_motoko.png` → unclear which crew member
- `crew_philosopher_v2.png` → **The Philosopher**
- `crew_protector_v2.png` → **The Protector**
- `crew_pure_hearted_v2.png` → **The Pure-Hearted**
- `crew_reluctant_v2.png` → **The Reluctant**
- `crew_ryoko.png` → unclear
- `crew_shinji.png` → unclear
- `crew_spike.png` → unclear
- `tinkering_weeaboo.png` → is this one of the crew?

### D. Real People vs Characters
- `jaime_concept_art*.png` (3 files) → Oceanianoir is a real person? Which character?
- `katy.png` / `kathy_druid_dryad_ingame.png` → same person? Different characters?
- `ryan.png` → real person? Which character?
- `mason.png` → real person? Which character?
- `scarlett_standing_profile.png` → real person? Which character?
- `joe.png` → Joe the Miniaturist (confirmed NPC)

### E. Items vs Characters (files that could be confused)
- `dragon_mascot.png` → is this Tumble? Same as `tumble_ingame.png`?
- `figure_in_fog.png` → which character? The Shifting Man? The Wanderer?
- `the_weaver.png` → not in roster — is this Queen of Webs? Or new character?
- `asterion.png` → minotaur? Not in roster explicitly
- `bill_platypus.png` → not in roster — joke character?
- `duck_on_grey_water.png` → The Duck? Or different?
- `the_laughing_one.png` → matches roster Tier 11

---

## 4. PLACEMENT REVIEW CHECKLIST

When ready to do the visual review, go through these steps:

### Step 1: Consolidate Variants
For each character with multiple versions, pick the canonical Living (42Hz) image.
Archive the others (don't delete — they may be useful as Shadow or In-Between references).

### Step 2: Rename Old Character Names
Update all filenames to current canonical names:
- Madame Mim → Brim
- Jareth → Malachi
- Uhtred → Waystone
- Wednesday → Belladonna
- The Sentinel / River Sentinel → Lozen

### Step 3: Identify Crew Members
Map crew_goku, crew_mamoru, crew_motoko, crew_ryoko, crew_shinji, crew_spike
to their canonical crew names (The Cool, The Philosopher, The Protector, etc.)

### Step 4: Sort Real People from NPCs
Confirm which uploaded images are real-world player characters vs NPCs.
Real players: Krista, River/Lozen, Charles, John Myers

### Step 5: Generate Missing In-Between Versions
~59 NPC In-Between versions needed (biggest gap in the tri-mode set)

### Step 6: Map Each Image to Its Zone and Frequency State
Assign every image to: character → zone → frequency state (Living/Shadow/In-Between)
This becomes the SpriteLoader configuration for the game engine.

---

## 5. FILE INVENTORY SUMMARY

| Source | Count |
|--------|-------|
| NPC portraits uploaded | 161 |
| Zone backgrounds | 52 |
| Stone images | 198 |
| Audio files | 188 |
| Supply icons | 76 |
| Tri-mode creatures (critters + water + cryptids) | 276 |
| Shadow NPC echoes | ~48 |
| Item portraits | ~25 |
| Shadow item echoes | ~14 |
| **TOTAL IMAGE ASSETS** | **~850+** |

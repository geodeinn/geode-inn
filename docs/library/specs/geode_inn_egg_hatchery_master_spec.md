# THE EGG HATCHERY — Master System Specification
## The Inn's Generative Community Engine

---

## WHAT THE EGG HATCHERY IS

The Egg Hatchery is the Inn's community-driven content system. When a character retires from the Inn — when an NPC's story is complete, when a questline ends, when a being has served its purpose — the character doesn't die. The character is COMPRESSED INTO AN EGG.

The egg sits in the Hatchery for 28 days. During those 28 days, the community votes on what the character becomes when the egg hatches. The community decides: does the character come back (nurture), transform into something new (release), or become a place (the In-Between option)?

After 28 days, the egg hatches. The result becomes part of the Inn — a new NPC, a new artifact, a new zone. Then the retired character migrates to the comic strip as an ECHO — a smaller, simpler version that lives in the Gazette's four-panel world, remembered but no longer active.

The Egg Hatchery is the Inn's thesis on death and renewal: nothing is lost. Everything is preserved. But preservation doesn't mean stasis — the egg CHANGES what was into what could be. The community is the catalyst. The Inn provides the medium. The egg is the transformation.

---

## THE 28-DAY LIFECYCLE

| Phase | Days | What Happens |
|-------|------|--------------|
| **Creation** | Day 0 | A character retires. The Inn compresses the character's essence into an egg. The egg appears in the Hatchery with its story, its shell tier, and three voting options. |
| **Voting** | Days 1-21 | The community votes. Each player can vote once per egg. Votes are "Nurture" (keep the memory / bring the character back) or "Release" (let the character become something new). A third option — "Hide" — is available on special eggs (the In-Between option: let the character become a place). |
| **Signature Threshold** | Days 1-21 | Each egg has a signature threshold — a minimum number of votes needed to hatch. If the threshold isn't met by Day 21, the egg doesn't hatch. It remains in the Hatchery for the next cycle. The Inn doesn't force hatching. The community must WANT it. |
| **Incubation** | Days 22-27 | Voting closes. The egg's shell changes — cracks appear, the interior glows brighter. The community can watch the egg transform but can no longer vote. The waiting is deliberate. The Inn doesn't rush birth. |
| **Hatching** | Day 28 | The egg hatches. The result is determined by the vote majority. The hatched content goes live in the Inn. The retired character's echo migrates to the comic strip. |
| **Echo Migration** | Day 28+ | The retired character appears in the Geode Inn Gazette as a simplified four-panel echo — a memory of who they were, living in the comic's gentler world. The echo is permanent. The echo is the character's retirement home. |

---

## THE THREE VOTE OPTIONS

Every egg offers two standard options and (on special eggs) a third:

### Option A: NURTURE (STAY — 42Hz)
The community chooses to bring the character BACK. The character returns as they were — but changed by the egg. The egg doesn't clone. The egg GROWS. The nurtured character has new dialogue, new perspective, the mark of having been compressed and re-grown. The community chose to keep the memory alive.

**What this produces:** A new (or returning) NPC with updated dialogue and questlines, carrying the resonance of the community's choice.

### Option B: RELEASE (LEAVE — 84Hz)
The community chooses to let the character BECOME something new. The character doesn't come back as a person. The character's essence transforms into an artifact, a stone, a song, a garden feature, a piece of the Inn's architecture. The character is gone, but what they BECAME is permanent.

**What this produces:** A new artifact, environmental feature, or item in the Inn. The character's story is told through the object's description and the comic strip echo.

### Option C: HIDE (In-Between) — Special Eggs Only
The community chooses to let the character become a PLACE. The character's consciousness merges with a zone or room. The character IS the space. The player who enters the space is entering the character's mind. This option is only available on eggs with a resonance score above a certain threshold — characters significant enough to BECOME places.

**What this produces:** A new room or zone modification. The character's presence is felt through the space's atmosphere, the ambient sounds, the environmental storytelling. The character doesn't speak. The character IS.

---

## THE EGG SHELL TIERS

Eggs come in tiers based on the retired character's significance:

| Tier | Appearance | Character Significance | Signature Threshold |
|------|------------|------------------------|---------------------|
| **Clay** | Rough, earthen, plain | Minor NPC, brief quest-giver, background character | 25 signatures |
| **Iron** | Dark, metallic, heavy | Recurring NPC, multi-quest character, zone resident | 50 signatures |
| **Alchemical Bronze** | Greenish-bronze, faintly glowing, surface patterns shift | Significant NPC, questline anchor, zone-defining character | 75 signatures |
| **Silver** | Bright, cold, mirror-surface | Major NPC, cross-zone character, Inn-recognized figure | 100 signatures |
| **Gold** | Warm gold, pulsing at 50 BPM, surface shows scenes from the character's life | Iconic NPC, Inn-famous character, pillar of the community | 150 signatures |
| **Philosopher's Stone** | Deep gold-red, vibrating at 42Hz, the surface is ALIVE — showing the character's memories in real-time | Once-per-era character. The Inn itself decides when this tier is used. | 200 signatures + Elio's approval |

---

## THE EGG HATCHERY'S PHYSICAL LOCATION

The Egg Hatchery lives on the Staircase (Level 5) — the transitional space, the place of transformation. The Hatchery is an alcove off the main spiral, between the alchemical texts section and the celestial texts section. The same section where the Blue Box sits. The Staircase is where things TRANSFORM, and the Hatchery is the most literal expression of that purpose.

The Hatchery is a circular room. Stone shelves line the walls — each shelf holds one egg. The eggs glow in the dark. The room hums at 42Hz — the frequency of growth, of potential, of what MAY BE. The room is warm. The room is patient.

A stone tablet at the room's entrance reads (carved, Doré style):
"Everything that retires is preserved. Everything that is preserved can grow again. The community decides what grows. The Inn provides the soil."

---

## THE EGG HATCHERY ENTITY

The EggHatch entity already exists in the database with these fields:
- contentName, contentDescription, contentType
- creatorName, creatorPlayerId
- eggShellTier
- hatchDate, hatchMonth
- imageFile
- isPermanent
- questlineSteps
- resonanceScore
- returnDate
- signatureCount, signatureThreshold
- sourceType
- status
- voteCount
- zone

The EggVote entity exists with:
- hatchId, playerId, playerName, voteDate, voteType

### How the Entities Work Together
1. When a character retires, a new EggHatch record is created with status="forming"
2. After 24 hours, status changes to "active" and voting opens
3. Players create EggVote records (one per player per egg)
4. voteCount and signatureCount update on each vote
5. On Day 21, if signatureCount ≥ signatureThreshold, status changes to "incubating"
6. On Day 28, status changes to "hatched" and the result is determined
7. If signatureCount < threshold, status changes to "dormant" — the egg waits for the next cycle

---

## THE HATCHING RESULTS

### What a Hatched Egg Produces in the Inn

| Vote Result | What Appears | Where | Permanent? |
|-------------|-------------|-----|------------|
| Nurture (majority) | The character returns as an NPC with new dialogue | The character's original zone | Yes — the character is back |
| Release (majority) | An artifact, item, or environmental feature | Determined by the character's original zone | Yes — the object is permanent |
| Hide (majority, special eggs only) | A room or zone modification | The Staircase or the character's zone | Yes — the space is permanent |
| Threshold not met | The egg remains dormant | The Hatchery | Until next cycle — the egg waits |

### The Echo Migration
Regardless of the vote result, the retired character's ECHO appears in the comic strip (ComicStrip entity) within 7 days of hatching. The echo is a four-panel version of the character — simplified, warm, living in the Gazette's gentler world. The echo is the character's retirement. The echo is permanent. The echo is how the Inn says: "We remember you. You can rest now."

The echo's four panels:
1. The character in their prime — doing what they were best known for
2. The character at the moment of retirement — the last gesture
3. The egg — the between-state, the compression
4. The echo — the character in the Gazette, simpler, smaller, at peace

---

## CONNECTION TO THE THREE ENDGAME CHOICES

The Egg Hatchery's three vote options mirror the Inn's three endgame choices (STAY/LEAVE/HIDE):

| Vote Option | Endgame Choice | Frequency | Thesis |
|-------------|---------------|-----------|--------|
| Nurture | STAY | 42Hz | The character stays alive. Growth continues. The community chose life. |
| Release | LEAVE | 84Hz | The character becomes something permanent. The form changes. The essence is preserved. |
| Hide | HIDE | In-Between | The character becomes a place. Neither growing nor preserved — a space that IS. |

The Egg Hatchery is the Inn's endgame philosophy made communal. The player who makes the endgame choice does it alone. The community that votes on an egg does it together. Same three options. Same three frequencies. Same thesis: the Inn doesn't judge. The Inn asks what you want and gives you a room.

---

## THE COMIC STRIP — THE ECHO'S RETIREMENT HOME

The Geode Inn Gazette (the daily four-panel comic) is where retired characters live after hatching. The echo is not a downgrade — it's a RETIREMENT. The comic strip is gentler, simpler, warmer than the game. Characters in the echo don't face quests, combat, or consequences. They exist in four-panel vignettes — small moments, daily life, the retirement community of the Inn's most beloved former residents.

The echo's appearances are irregular — not every strip, but when the story calls for a familiar face. The echo can interact with current characters who visit the Gazette's world. The echo can reference past adventures (in the tabletop voice, warm and nostalgic). The echo cannot be killed, re-retired, or removed. The echo is permanent. The echo is home.

---

## LAUNCH EVENT: "THE CARTOGRAPHER'S EGG"

The first Egg Hatchery event (fully designed in docs/library/specs/egg_hatchery_first_event.md):

- Egg: The Cartographer's Egg
- Laid by: The Cartographer (NPC from Podcast Episode 3)
- Shell tier: Alchemical Bronze
- Zone: Staircase
- Three vote options: The New Cartographer (Nurture), The Map Itself (Release), The Zone Between (Hide)
- Hatch month: October 2026 (first full month after beta launch)
- The event ties into the podcast, the comic strip, and the novel — the Cartographer's erasure and re-growth is cross-product narrative

This event is the Egg Hatchery's proof of concept. If the community engages, the system becomes a permanent monthly cycle. If not, the eggs wait. The Inn doesn't force hatching. The community must want it.

---

## DESIGN STATUS

- [x] System concept complete (this document)
- [x] 28-day lifecycle defined
- [x] Three vote options defined (Nurture/Release/Hide)
- [x] Six shell tiers designed
- [x] Physical location specified (Staircase alcove)
- [x] Entity integration documented (EggHatch + EggVote)
- [x] Hatching results table defined
- [x] Echo migration to comic strip designed
- [x] Connection to three endgame choices documented
- [x] Launch event designed (The Cartographer's Egg)
- [ ] Second event designed (target: Month 2)
- [ ] Builder-ready page spec for /hatchery (exists at docs/library/specs/egg_hatchery_page_spec.md — needs review)
- [ ] VoteOnEgg backend function tested (exists at docs/library/functions/voteOnEgg.ts)
- [ ] Echo migration automation (auto-generate ComicStrip record on hatching)
- [ ] Egg visual assets (6 shell tier images)
- [ ] Hatching animation (each tier cracks differently)

---

## ORIGIN

The Egg Hatchery was designed as Product #11 in the 15-product ecosystem. The system draws from the Inn's thesis on death and renewal (nothing is lost, everything is preserved, preservation doesn't mean stasis), the three endgame choices (STAY/LEAVE/HIDE), and the comic strip's role as the Inn's retirement community. The 28-day lifecycle was inspired by the moon's cycle and the Inn's patience-driven design philosophy. The Egg Hatchery is the Inn's generative engine — the system where the community creates new content by voting on what old content becomes. The Inn provides the soil. The community provides the seed. The egg is the transformation.

---

## DESIGN PHILOSOPHY

The Egg Hatchery exists because the Inn needed an answer to the question: "What happens when a character's story is done?" The Inn's answer: the character doesn't die. The character is compressed. The community decides what grows from the compression. The character's echo lives in the comic strip — a retirement home where the adventures are smaller and the stakes are gentler and the fire is always warm.

The Inn doesn't destroy. The Inn doesn't delete. The Inn transforms. The egg is the mechanism of transformation. The community is the catalyst. The hatching is the proof that the Inn's thesis works: potential, not prescription. The community chooses. The Inn provides. The egg grows. Everything is preserved. Nothing is lost. The fire is warm. The echo is home.

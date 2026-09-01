# Egg Hatchery — First Monthly Event: "The Crone's Casting"
# Geode Inn Egg Hatchery
# Event Design Document
# Product #11 — Egg Hatchery System

---

## EVENT OVERVIEW

**Name:** The Crone's Casting
**Month:** Launch Month (Month 1)
**Theme:** Mim, the Crone, has cast three stones into the deep. Each stone is becoming something. The community decides what.

**Duration:** 28 days (standard egg lifecycle)
**Format:** 3 active eggs, community voting, 1 egg hatches per week for first 3 weeks, final week = reveal + echo migration

**Hook:** "Mim says the stones chose what they wanted to be. Mim is lying. The stones chose nothing. You choose. That's the whole trick."

---

## THE THREE EGGS

### Egg 1: "The Old Smith" (Week 1 hatch)
**Shell Tier:** Iron — dark, metallic, heavily textured
**Zone:** Main Floor (forge area)
**Description:** A stone that Mim found in the forge's deepest ash. It's been cooking for years, absorbing the heat of every fire, every struck piece of metal, every spark that landed wrong. The stone is warm. The stone is patient. The stone wants to be something useful.

**Community Vote Options:**
- **NURTURE** (keep it in the Inn): The Old Smith becomes a permanent NPC — a retired blacksmith who lives by the forge and gives metalworking quests. Low-key, warm, smells like iron.
- **RELEASE** (let it go): The Old Smith becomes a wandering traveler NPC who visits different zones. Players can encounter the Smith in the wild, trade forged items, and hear stories about the old forge days.

**Threshold:** 50 signatures
**Vote Source:** Community — all registered players
**Hatch Result:** The Old Smith is a permanent NPC regardless of vote outcome. The vote determines BEHAVIOR, not existence. This is the Egg Hatchery's core philosophy: the community shapes characters, but the Inn keeps them all.

---

### Egg 2: "The Silent Bard" (Week 2 hatch)
**Shell Tier:** Crystal — translucent, pale blue, humming faintly at 432Hz
**Zone:** Common Room
**Description:** A stone that was once part of a singing bowl. Mim found it in pieces and glued it back together with resin and spite. The stone remembers being part of something that made sound. The stone wants to make sound again.

**Community Vote Options:**
- **NURTURE**: The Silent Bard becomes a permanent NPC in the Common Room — a musician who plays background music for chat sessions. The Bard's instrument changes based on the room's acoustic profile.
- **RELEASE**: The Silent Bard becomes a traveling performer NPC who appears at random in different zones, playing short musical interludes. Players who hear the Bard gain a temporary "resonance buff" (+1 to next frequency match).

**Threshold:** 75 signatures
**Hatch Result:** The Silent Bard is permanent. Vote determines location behavior. The Bard's music is real audio — processed through the Inn's DSP, and in Inn Mode, the Bard plays the listener's stone collection as an instrument.

---

### Egg 3: "The Sixth Gargoyle" (Week 3 hatch)
**Shell Tier:** Stone — heavy, gray, vibrating at an unmeasured frequency
**Zone:** Staircase (bottom)
**Description:** The Inn has five gargoyles. The Staircase has a gap — a place where a sixth sentinel could stand. The stone has been sitting at the bottom of the Staircase since before the Inn had a Staircase. It hums, but not at any frequency anyone can measure. Not 111Hz. Not 64Hz. Not 528Hz. Not 432Hz. Not the Keeper's infrasound.

Something new.

**Community Vote Options:**
- **NURTURE**: The Sixth Gargoyle becomes the seventh sentinel — permanently installed at the bottom of the Staircase. It guards the transition to the deepest catacombs. Its frequency is determined by the community's collective vote pattern (the majority vote determines the gargoyle's frequency).
- **RELEASE**: The Sixth Gargoyle becomes a mobile sentinel — it doesn't stay on the Staircase. It wanders the Inn, appearing in different zones on different days, humming its unknown frequency wherever it goes. Players who find it gain a rare "Unmeasured" charm.

**Threshold:** 100 signatures (highest threshold — this is the most consequential egg)
**Hatch Result:** The Sixth Gargoyle is permanent. This is the most significant Egg Hatchery event because it ADDS to the Inn's architecture. The gargoyle's frequency is new — it doesn't match any existing frequency in the Inn's system. This is by design. The Inn grows. The Inn's nervous system grows with it.

---

## WEEK 4: REVEAL & ECHO MIGRATION

After all three eggs have hatched:
1. **Reveal Ceremony**: A page on the Inn showing all three hatched characters with their final forms, vote tallies, and the community's choices.
2. **Echo Migration**: Any retired characters from previous story arcs migrate to the Comic Strip as recurring characters. For Month 1 (launch month), there are no retired characters — the Echo Migration system is demonstrated with a placeholder: "No characters have retired yet. The Inn is young."
3. **Next Month Teaser**: "Next month: The Alchemist's Egg. Something is forming on the Staircase. It smells like sulfur and old gold."

---

## MECHANICS

### Voting System
- Each player gets ONE vote per egg (nurture or release)
- Players must have at least 1 stone in their collection to vote (stake = participation)
- Players can see the current vote tally in real time
- When threshold is reached, the egg hatches immediately (doesn't wait for the week to end)
- If threshold is NOT reached by end of week, the egg hatches with the default (nurture — the Inn keeps everything)

### Signature System
- A "signature" = a vote with an optional written reason
- Players who provide a written reason count as 2 votes toward the threshold
- This encourages thoughtful participation over button-clicking
- Written reasons are displayed on the egg's page after hatching (anonymized)

### Zone Effects
While an egg is active in a zone:
- The zone's ambient frequency shifts slightly (the egg's presence affects the room)
- The zone's background gets a subtle new visual element (the egg, sitting there, glowing faintly)
- Players who visit the zone while the egg is active get a "witness" badge (cosmetic, recorded in PlayerProgress)

---

## DATA STRUCTURE

### EggHatch Records (already created in database)

| Field | Egg 1 | Egg 2 | Egg 3 |
|-------|-------|-------|-------|
| contentName | The Old Smith | The Silent Bard | The Sixth Gargoyle |
| contentType | NPC (Blacksmith) | NPC (Bard) | Sentinel (Gargoyle) |
| eggShellTier | Iron | Crystal | Stone |
| zone | Main Floor | Common Room | Staircase |
| status | active | active | active |
| hatchDate | +7 days from launch | +14 days from launch | +21 days from launch |
| signatureThreshold | 50 | 75 | 100 |
| signatureCount | 0 | 0 | 0 |
| voteCount | 0 | 0 | 0 |
| creatorName | Mim | Mim | Mim |
| creatorPlayerId | system | system | system |
| questlineSteps | ["forge_01", "forge_02", "forge_03"] | ["bard_01", "bard_02"] | ["sentinel_06_01", "sentinel_06_02", "sentinel_06_03"] |
| resonanceScore | 42 | 432 | 0 (unmeasured) |
| sourceType | community_vote | community_vote | community_vote |
| isPermanent | true | true | true |

---

## FUTURE EVENTS (TEASERS)

### Month 2: "The Alchemist's Egg"
- Found on the Staircase
- Shell: Sulfur-yellow, warm to the touch
- Theme: Transformation — this egg's outcome changes based on which zone it's voted into

### Month 3: "The Fae Egg"
- Found in the Fae Kingdom
- Shell: Iridescent, shifting colors
- Theme: Riddles — the vote is phrased as a riddle, and the community must solve it together

### Month 4: "The Hollow Egg"
- Found in the deepest catacombs
- Shell: Black, cold, silent (no frequency)
- Theme: Shadow — this egg hatches into a Shadow-frequency character (84Hz)
- Consequence: First Shadow NPC in the Inn's public spaces

---

## DESIGN PHILOSOPHY

The Egg Hatchery is the Inn's community engine. It exists to:
1. Give the community agency over the Inn's growth (characters are community-shaped)
2. Create monthly events that bring players back (28-day lifecycle = natural return cycle)
3. Introduce new characters through ritual, not just spawning
4. Allow the Inn to grow organically (new gargoyles, new NPCs, new quest-givers)
5. Connect to the Comic Strip (retired characters migrate — nothing is lost, everything echoes)

The key insight: **the community never destroys.** Nurture and release are both forms of keeping. The Inn doesn't delete characters. The Inn transforms them. This is the same philosophy as the Archive (Beverley's Rule: you earn the restricted books by reading the unrestricted ones) and the Marketplace (the Inn introduces, doesn't sell). The Egg Hatchery asks: you earn the character's form by participating in its birth.

---

## BACKEND INTEGRATION

The voteOnEgg backend function is already deployed and tested. It:
- Accepts a hatchId, playerId, voteType (nurture/release), and optional written reason
- Checks the player hasn't already voted (one vote per egg per player)
- Increments the egg's voteCount and signatureCount
- If signatureCount >= signatureThreshold, marks the egg as "hatching"
- Returns the updated egg state and a confirmation message

The getHatcheryData backend function is deployed and returns:
- Active eggs (with daysRemaining and voteProgress)
- Hatched archive (paginated)
- Stats (active count, hatched count, total votes)

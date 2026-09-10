# THE GEODE INN — Voice Block Registry & Character Voice Sync
## The dialect + repeated dialogue specs, woven into every character profile.
### Written 2026-09-10. Consolidates three existing specs into one applied standard: the regional voice profiles doc (dialect, delivery, key tells — docs/geode_inn_regional_voice_profiles.md), the hook word system (GEODE_INN_MASTER_BUILD.md NPC roster), and the 74 audiobook voice profiles (docs/library/audio/audiobook_production_spec.md). Repeated dialogue law built on the Lozen trigger pilot (movement wiring spec, dialogue record lozen_oi_trigger).

---

## PART 1: THE VOICE BLOCK STANDARD

Every character profile carries a VOICE BLOCK — seven fields, mandatory before the profile ships:

| # | Field | What It Is | Source Spec |
|---|-------|-----------|-------------|
| 1 | **Dialect** | The character's actual accent/region — authentic, never invented. NPCs tied to a cultural zone speak that zone's accent. | Regional voice profiles |
| 2 | **Delivery** | Pace, rhythm, pause habits — how the words move, not just where they're from. | Regional + audiobook profiles |
| 3 | **Key tell** | The repeated signature behavior that identifies the character mid-sentence: a word, a pause, a laugh, a silence. | Regional voice profiles |
| 4 | **Hook word** | The verbal fingerprint — the line that tells you who's talking before the name appears. ONE primary hook per NPC. | Hook word system (Master Build roster) |
| 5 | **Repeat ladder** | The three-rung repeated-dialogue behavior (Part 2). | The repeat-line law (this doc) |
| 6 | **Voice profile** | The engine-facing ID — pitch, cadence, the voiceProfile field in the Dialogue entity. | Voice profile translation master spec |
| 7 | **Cadence law** | Which writing voice dominates this character's lines (six-writer constitution: Rothfuss precision / Pratchett warmth / Gaiman mythic-personal / Asimov structure / Bradbury fire / Weir optimism). | Narrative DNA |

---

## PART 2: THE REPEAT-LINE LAW (repeated character dialogue spec, canon)

Every NPC line has THREE RUNGS. The player who clicks the same line repeatedly climbs the ladder. The ladder is character-consistent — an NPC's annoyance, patience, or obliviousness is performed, not scripted generically.

**RUNG 1 — FIRST FIRE.** The line as written. Full delivery, full warmth, the complete performance.

**RUNG 2 — TELL FIRE.** The line shortens to its key tell. The NPC noticed the repeat. The tell is the character's own: the Ragana's second fire is just "Sit." (the pause carries the look); the Teacher's second "Incorrect." is colder by exactly one degree; Marijke's second answer is just "Lekker." (meaning: you already asked).

**RUNG 3 — QUIET FIRE (or the Oi).** The character's truest response to repetition. Two legal shapes:
- **The Oi** (annoyance-true): Lozen's ladder — the one-syllable warning, then no more words, then standing in the path. Reserved for guard-temperament characters.
- **The Quiet** (patience-true): the NPC simply answers again, perfectly, as many times as asked — but the final beat adds one unscripted word that reveals the repetition was never resented. The Firekeeper's third "Tend." gains a tiny "still." — "Tend. Still." Reserved for devotion-temperament characters.

**THE WHISPER TIE-IN:** every rung-fire increments the repeat-dialogue click counter in the Whisper Layer resonance profile — the Inn learns the player's favorite voices by which lines they click twice.

---

## PART 3: THE REGISTRY (consolidated — known assignments + gap flags)

### Batch 1 — THE MAIN FLOOR TWELVE (full blocks below in Part 4)
| NPC | Hook Word | Dialect | Key Tell | Repeat Rung 3 | Status |
|-----|-----------|---------|----------|--------------|--------|
| The Reader (Quire) | "Noticed." | British, soft-archival | Pauses before key words | The Quiet | ✅ block below |
| Beverley | "Obviously." | Australian | Brisk finality — sentences end with the period visible | The Oi (polite) | ✅ |
| Joe (the Collector) | "Delightful." | British smooth (Lucifer cadence) | Every answer is a small gift being wrapped | The Quiet | ✅ |
| The Teacher | "Incorrect." | Canadian (Kathy Bates 3-mode) | Three modes; the third repetition gets the coldest mode | The Oi | ✅ |
| Brim | "Watch this." | Unclassifiable — mimic-shifting | Mimics the player's last phrase back | Mimicry IS the ladder | ✅ |
| Monsieur Sentient | "Absurd." | French, faint | Steam punctuation — the pipe sighs between clauses | The Quiet (a long smoke) | ✅ |
| The Wanderer | "Passing through." | No fixed accent — borrowed from every road | One word per village | The Quiet ("Passing. Still.") | ✅ |
| The Owl | "Watching." | Pre-linguistic — one word per heartbeat | The single word, exactly 50 BPM apart | No ladder — the word does not change | ✅ |
| Naut | "Fascinating." | Neutral scholarly, fireplace-quiet | The Rush binary: tentacles move before the voice does | The Quiet (Oldman stillness) | ✅ |
| The Ragana | "Sit." | West Country English, crackling-warm | The unblinking pause before invitations | The Quiet ("Sit. Still.") | ✅ |
| The Firekeeper | "Tend." | Quiet devotion, low | Never asks questions — only tends | The Quiet ("Tend. Still.") | ✅ |
| The Catalyst | "What changes?" | Neutral American, warm underneath | Repeats the player's question back as an answer | The Quiet (asks it of herself) | ✅ |

### Batch 2+ — REGISTRY PENDING BLOCKS (assignments known, full blocks to write)
Priority order: Lozen (pilot, mostly done), the Selkie, Thorin, Marijke, Lichenblossom, the Cartographer, the Norns (Urd/Verdandi/Skuld), Oleander, Malachi, the Bog Fairy Golem, Charles (Chameleon Druid), the Fizgig brownies (Brindle/Cobble/Thatch share a group ladder), Wisteria, Jay, TJ, Gabby, Lark, Zack, Maddi, Will, the Archivist, Stephanie, Tumble (*chime* — the only nonverbal hook), Kathy, Eres, Briar Nightbloom, Rachel Kaiser, Quire-as-narrator.

### THE GAP LIST (needs casting — no dialect/tell/repeat assigned yet)
- The Astronomer (voice profile exists: vague Eastern European, fast-when-deducing — needs tell + ladder)
- The Guest, the Constant, Nyx (pre-linguistic profiles exist — need in-game ladders, not just audiobook)
- The three Fae Queens (raven-feather cape canon; voices uncast)
- The cosmic crew ×8 (running gags ARE the tells — need dialect pass)
- The Varda weave: Elder Cian, Taliesin (tabletop voices exist; accents implied Celtic — formalize)
- The Tavern children (TJ/Gabby have hooks; delivery needs child-actor law: never cute-ified, always earnest)
- The Einherjar ×8, the Guild masters, the Watch (guard-voice law: one Oi template, eight variations)
- The regional zone NPC placeholders ("Sam Elliott," "Edward James Olmos," etc. — actor-refs only, need named characters)

---

## PART 4: BATCH 1 — FULL VOICE BLOCKS

**THE READER (QUIRE)** — Dialect: British, soft-archival, Gaiman-adjacent. Delivery: measured, pauses before key words, the hush of someone used to reading over a sleeping library's shoulder. Key tell: "Noticed." — spoken as both observation and compliment. Hook: "In the margins." (quest context) / "Noticed." (ambient). Repeat ladder: 1) the full marginal note; 2) "Noticed."; 3) THE QUIET — the Reader simply marks the page for the player and keeps reading nearby. Cadence: Gaiman mythic-personal. Voice profile: quiet, precise, archival.

**BEVERLEY** — Dialect: Australian, Anne Robinson briskness. Delivery: fast, organized, warm underneath — the librarian who shushes with one eyebrow. Key tell: "Obviously." — the period is visible. Hook: "Obviously." Ladder: 1) the helpful full answer; 2) "Obviously." (you know this); 3) THE OI, POLITE — Beverley answers correctly a third time, then adds "…and you knew that." Cadence: Pratchett warmth. Voice profile: brisk, kind.

**JOE (THE COLLECTOR)** — Dialect: British, smooth — the Tom Ellis Lucifer cadence. Delivery: unhurried, every answer a small gift being wrapped. Key tell: "Delightful." — means the object pleased the collector; silence means the opposite. Hook: "Delightful." Ladder: 1) full appraisal with story; 2) "Delightful." alone; 3) THE QUIET — Joe shows the player the item's shelf instead of speaking. (Joe's repetition is never boredom — it's curation.) Cadence: Gaiman. Voice profile: warm velvet, faint smile audible.

**THE TEACHER** — Dialect: Canadian, three-mode (patient → firm → glacial). Delivery: Kathy Bates range — each mode one degree colder. Key tell: "Incorrect." — never cruelty, always calibration. Hook: "Incorrect." Ladder: 1) the correction with the lesson; 2) "Incorrect." (mode 2); 3) THE OI — mode 3: the Teacher says nothing, points to where the answer was, once. Cadence: Asimov structure. Voice profile: measured, precise, three temperatures.

**BRIM** — Dialect: unclassifiable — mimic-shifting, borrowed accents. Delivery: erratic, playful, sometimes alarming; matches whoever spoke last. Key tell: "Watch this." Hook: "Watch this." Ladder: 1) the full performance; 2) Brim repeats the PLAYER'S last words back in the player's own cadence; 3) THE MIMIC RUNG — Brim does a perfect impression of the player clicking Brim. (Chaos companion: the ladder is a mirror, not a wall.) Cadence: Pratchett. Voice profile: mimicry, shifting pitch baseline.

**MONSIEUR SENTIENT** — Dialect: French, faint — whispered sardonic. Delivery: quick, dry, philosophical; steam punctuation between clauses. Key tell: "Absurd." — the pipe's whole worldview in two syllables. Hook: "Absurd." Ladder: 1) the existential riff; 2) "Absurd."; 3) THE QUIET — the pipe forms a question mark in steam, dissolves it, and has answered. Cadence: Gaiman. Voice profile: whispered, sardonic.

**THE WANDERER** — Dialect: no fixed accent — one borrowed word per village, a patchwork of roads. Delivery: warm, unhurried, always leaving. Key tell: "Passing through." Hook: "Passing through." Ladder: 1) the road story; 2) "Passing through."; 3) THE QUIET — "Passing. Still." (the Inn is the one place the Wanderer repeats — the joke is the Wanderer keeps not-leaving.) Cadence: Bradbury fire-that-doesn't-burn. Voice profile: warm traveler, no region.

**THE OWL** — Dialect: pre-linguistic. One word per heartbeat, exactly 50 BPM apart. Key tell: "Watching." Hook: "Watching." Ladder: NONE — the word does not change. Repetition is not detected because repetition is the Owl's native state. (The only NPC for whom the repeat-line law is a constant, not a ladder.) Cadence: none — pure presence. Voice profile: sub-bass, single-syllable, resonant.

**NAUT** — Dialect: neutral scholarly, fireplace-quiet. Delivery: lean-in quiet; the Rush binary (tentacles first, spectacles second, voice third — no middle ground). Key tell: "Fascinating." Hook: "Fascinating." Ladder: 1) the full theory, quiet; 2) "Fascinating."; 3) THE QUIET — Oldman stillness: the tentacles rest, the spectacles stay on, Naut returns to reading. The player realizes the conversation ended a sentence ago. Cadence: Asimov. Voice profile: quiet theatrical binary.

**THE RAGANA** — Dialect: West Country English, ancient and crackling-warm. Delivery: slow, riddle-paced, laughs often — the unblinking pause before invitations. Key tell: "Sit." (also "Sit down, love." at full warmth). Hook: "Sit." Ladder: 1) the full riddle-welcome; 2) "Sit."; 3) THE QUIET — "Sit. Still." — and tea arrives anyway. The repetition was never rudeness on the player's side; it's the Ragana's chair, and the chair knows. Cadence: Pratchett. Voice profile: ancient, warm, riddle-paced.

**THE FIREKEEPER** — Dialect: quiet devotion — low, ember-soft, regional-neutral. Delivery: never asks questions; only tends. Key tell: "Tend." Hook: "Tend." Ladder: 1) the full tending, with the fire's story; 2) "Tend."; 3) THE QUIET — "Tend. Still." — the law holds: devotion-temperament characters gain a word, never lose one. Cadence: Bradbury. Voice profile: low, warm, unhurried.

**THE CATALYST** — Dialect: neutral American, organized, warm underneath. Delivery: fast, philosophical; answers questions with better questions. Key tell: "What changes?" Hook: "What changes?" Ladder: 1) the full alchemical answer; 2) the question returned to the player; 3) THE QUIET — the Catalyst asks the question of herself, softly, and the bar hears it. Cadence: Weir optimism with Asimov structure. Voice profile: brisk, kind, curious.

---

## PART 5: THE SYNC ORDER (how the registry gets finished)

1. Batch 1 shipped (this doc — Main Floor twelve).
2. Batch 2: guard-voice law + Lozen ladder formalized + the Selkie/Thorin/Marijke/Norns/Cartographer (regional doc blocks, formalized into the seven fields).
3. Batch 3: the kings and queens (Oleander, Malachi, three Fae Queens) — royal dialects (Latvian-royal thread for Katija handled per the spelling law).
4. Batch 4: the cosmic crew (running gags as tells), the Astronomer, the Guest, Nyx, the Constant.
5. Batch 5: family characters (Krista's Varda, River/Lozen, Charles) — most carefully; these blocks are personal canon.
6. Then the gap list: named characters for the actor-ref zone placeholders, the Einherjar, the Guild masters, the children.
7. Engine sync: every block's fields map to the Dialogue entity (voiceProfile, hookWord as the first lines entry, repeat ladders as conditionTag'd second/third entries).

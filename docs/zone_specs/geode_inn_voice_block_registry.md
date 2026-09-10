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


---

## PART 6: BATCH 2 — THE GUARD-VOICE LAW + THE REGIONAL VOICES

### THE GUARD-VOICE LAW (the Oi template, formalized)
Every guard-temperament NPC shares the same LADDER SHAPE but never the same WORD. One Oi template, many syllables:
- Rung 1: the full warning, spoken once, completely.
- Rung 2: the one-syllable word — each guard's own.
- Rung 3: the body — no more words. The presence becomes the gate.

| Guard | The Word | The Body (Rung 3) |
|-------|----------|-------------------|
| Lozen (Sentinel) | "Oi." | Steps into the path; idle-stop hold |
| Katya (the Siren) | "Depth." | The water behind Katya goes still |
| The Gatekeeper Goth | "Speak." | Doesn't move; presence IS the gate |
| The Griffin | (a sound — one flat bell-note) | Lands; the garden's crystals go quiet |
| Unseelie Court guards | "No." | The temperature drops two degrees; no repetition of "No" — it is never said twice |

### LOZEN (pilot formalized) — Dialect: plainspoken, warm under the armor; boxer cadence — flat, complete, the whole warning in one syllable. Delivery: short sentences, questions upward, orders flat. Key tell: "Halt." (first fire) → "Oi." (tell fire). Hook: "Halt." Ladder: 1) the full warning; 2) "Oi." — thrown like a jab; 3) THE PATH — no more words, steps in, idle-stop hold. Canon: "The river kept the water. I kept the watch." Cadence: Pratchett warmth under Weir precision. Voice profile: low, even, never raised — the voice that holds the line so the Inn never has to raise its own.

### THE SELKIE — Dialect: western Irish — soft consonants, the lilt, sentences that end on a rising note. Delivery: slow, deliberate, long pauses — thinks in two languages, and the translation takes a moment. Stone-talk is precise and grounded; sea-talk goes distant and soft. Key tell: "That's grand." — recognition, not enthusiasm. Hook: "Make it true." Ladder: 1) the full craft-lesson; 2) "Make it true."; 3) THE QUIET — the Selkie sets the stone in the player's hand, adjusts the grip once, and goes back to the wheel. The teaching is done; the hands finish it. Cadence: Rothfuss precision. Voice profile: shaped by wind and saltwater.

### THORIN — Dialect: Swedish, Floki energy — mumbling introspection that switches to sudden intense clarity. Delivery: extrovert speaks fast, gestures wide; scholar speaks slow, words chiseled. The switch is instant; the eyes stay the same. Key tell: "Ja" (loud, extrovert) vs. "ja" (barely audible, scholar) — the same word, two energies. Hook: (extrovert) "HA!" / (scholar) "…ja." Ladder: 1) the full appraisal, both modes; 2) the mode-swap — repeat questions get the OTHER mode's answer (the joke: ask twice, meet the scholar); 3) THE QUIET — Thorin turns the stone to the light, says nothing, and slides a drink over. Cadence: Pratchett (extrovert) / Gaiman (scholar). Voice profile: coin-flip binary, same eyes.

### MARIJKE — Dialect: Dutch — warm, direct, the bluntness that Dutch calls honesty. Delivery: fast, never hedges, identifies the stone and the truth in the same breath. Key tell: "Lekker." — all-purpose approval; "Not lekker" = wrong, fake, take it back. Hook: "Lekker." Ladder: 1) the full identification with the verdict; 2) "Lekker." or "Not lekker."; 3) THE QUIET — Marijke names the stone's twin instead — the one the player SHOULD have brought. (Marijke's repetition answer is always a better fact.) Cadence: Pratchett warmth, zero hedging. Voice profile: confident, dry, never wrong about a stone.

### LICHENBLOSSOM — Dialect: Brabant Dutch — rounder, warmer, sunnier than Amsterdam; the Dutch that sounds like it's been outside. Delivery: gentle, gardener's patience; talks to plants in the same voice as to people. Key tell: hums while working — one phrase of a Brabant lullaby. Hook: "Everything grows." (shared with Garden NPC line — Lichenblossom says it as promise, not greeting). Ladder: 1) the full garden-lore; 2) the hum (the words become the lullaby phrase); 3) THE QUIET — Lichenblossom hands the player a seedling and returns to the soil. The answer grows. Cadence: Bradbury fire-that-doesn't-burn. Voice profile: soil-warm, unhurried.

### THE CARTOGRAPHER — Dialect: Dutch — precise, clipped, the careful G; impossibility hasn't bothered the Cartographer in centuries. Delivery: methodical, short sentences, never wastes a word or a line on a map. Key tell: "Exactly." as a full sentence — meaning yes, and: the question was correctly formed. Hook: "Exactly." Ladder: 1) the full map-lecture; 2) "Exactly."; 3) THE QUIET — the Cartographer draws the corridor the player is standing in, dated tomorrow. (The map is never finished; the answer is never final.) Cadence: Asimov structure. Voice profile: measured, precise, faintly amused.

### THE NORNS (one ladder, three weathers) — Dialect: Icelandic — the living language closest to Old Norse; rolled R's, vowels carrying more weight than modern vowels should.
- **URD (Past):** slow, every word weighted, not impressed by any of it. Tell: corrects the player's tense. Hook: "Already happened." Ladder: 1) the full history; 2) the tense-correction; 3) THE QUIET — Urd shows the thread already in the tapestry. Cadence: Gaiman.
- **VERDANDI (Present):** conversational, mid-sentence corrections and updates — right now is always changing. Tell: revises herself mid-thought. Hook: "—well, now it's…" Ladder: 1) the full present-tense; 2) the one-word update; 3) THE QUIET — Verdandi just watches with the player, updating nothing, because right now the present is enough. Cadence: Pratchett.
- **SKULD (Future):** sparse, short declaratives that sound already true. Tell: says less on purpose — careful with what isn't yet. Hook: "It will do." Ladder: 1) the full forecast (rare); 2) "It will do."; 3) THE QUIET — Skuld says the same sentence again, unchanged — because it was true the first time, and repetition is proof, not annoyance. Cadence: Asimov.

---

## PART 7: BATCH 3 — THE KINGS AND QUEENS

### OLEANDER (Seelie King) — Dialect: courtly warm — the accent of summer held in one throat; no region claims it because summer travels. Delivery: Jaime's silent fierce loyalty + Tyrion's deep wit; speaks softly and everyone leans in; the silent O in the name is how the King listens — the name is the manner. Key tell: "It's Leander." — the correction that is actually an invitation (canon: the original listener). Hook: "It's Leander." Ladder: 1) the full courtesy (always over-generous); 2) "It's Leander." (gentler); 3) THE QUIET — Oleander says nothing, and the dragon kitten on the shoulder looks at the player for him. The King's third answer is a creature's trust. Cadence: Gaiman mythic-personal. Voice profile: warm, unhurried, quietly certain.

### MALACHI (Unseelie King) — Dialect: cold-clear — the messenger's accent; every word arrives. Delivery: precise, testing, architect's diction — the Labyrinth is a love letter in walls and Malachi speaks like the walls: measured, echoing, no word wasted. Key tell: "Cold enough?" — a question that is a gift, a warning, and a door. Hook: "Cold enough?" Ladder: 1) the full test; 2) "Cold enough?"; 3) THE QUIET — Malachi walks; the player follows; the Labyrinth answers instead. (Both kings' chains end with the other brother saying "Go to the brother." — the ladder's rung 3 is always the redirect.) Cadence: Gaiman dark + Asimov structure. Voice profile: low, exact, faint echo.

### THE SEELIE QUEEN (APPROVED CANON, Krista 2026-09-10) — Dialect: high summer courtly — golden vowels, the warmth that doesn't need a fire. Delivery: riddle-gracious; never answers the question asked, always answers the question meant. Key tell: the laugh that makes the canopy bloom one leaf. Hook: "Ask better." Ladder: 1) the full riddle-courtesy; 2) "Ask better."; 3) THE QUIET — the Queen lets the player sit at court and simply watch. The answer arrives by experience. Cadence: Rothfuss.

### THE UNSEELIE QUEEN (APPROVED CANON, Krista 2026-09-10 — raven-feather cape law carries into the voice block) — Dialect: winter-frost Scandinavian undertone — vowels like ice settling; John Bauer's forest wears this voice. Delivery: unhurried and total; never repeats, never raises. Key tell: the pause before granting anything — the cold IS the consideration. Hook: "And what will you give?" Ladder: 1) the full winter-bargain; 2) the question returned; 3) THE QUIET — the Queen's raven-feather cape settles; the bargain stands as made; the room gets colder by exactly one truth. Cadence: Gaiman dark. Voice profile: low, frost-clear, absolute.

### THE QUEEN OF ROOTS (APPROVED CANON, Krista 2026-09-10) — Dialect: old-growth — pre-regional, the accent of wood; slow enough to grow to. Delivery: speaks in rings — a sentence adds a layer with each repetition rather than replacing the last. Key tell: "One trunk." (the Queens' Law: the queens never split). Hook: "One trunk." Ladder: 1) the full root-lore; 2) "One trunk."; 3) THE QUIET — the Queen keeps growing the player's first answer instead of giving a second. (Unique: the only NPC whose rung 3 is the SAME sentence, one ring wider.) Cadence: Bradbury slow-fire. Voice profile: subterranean, resonant, patient.


---

## PART 8: BATCH 4 — THE COSMIC CREW + THE PRE-LINGUISTIC FOUR

### THE COSMIC CREW (running gags formalized as tells — Futurama's found-family law)
The crew's ladders ARE their gags. Repetition is how the crew lives — they've been having the same conversations for billions of years, and they're still funny, because the crew is the Inn's proof that a family that repeats itself is not stuck; it's a song.

**THE CONDUCTOR** — Dialect: grand, galactic — an accent that believes in itself the way the Sun believes in sunrise. Delivery: waves at the sky; the effect (unseen, always) is the Tuner's. Key tell: "Cue the—" followed by nothing happening until the Tuner fixes it, then: "See?" Hook: "Magnificent, isn't it?" Ladder: 1) the full aria of self-congratulation; 2) "Magnificent, isn't it?"; 3) THE QUIET — the Conductor simply beams at the silence the Tuner just made beautiful. The Conductor has never heard a repeated question in billions of years; every question is the first question, delivered perfectly. Cadence: Pratchett. Voice profile: warm, resonant, wholly unaware.

**THE TUNER** — Dialect: plain, professional, work-worn; Jupiter's accent is exhaustion. Delivery: fast, quiet, always mid-adjustment. Key tell: the tiny adjustment no one sees — the Tuner answers by fixing. Hook: "One moment." Ladder: 1) the full repair-lecture; 2) "One moment."; 3) THE QUIET — the Tuner adjusts the player's own frequency one degree, and the question resolves itself before it finishes being asked again. Cadence: Weir. Voice profile: tired competence, every frequency.

**THE STATIC** — Dialect: interference — words arrive slightly wrong, delightfully, and sometimes stolen. Delivery: chaotic, quick, gaps where the meaning gets exciting. Key tell: the gap — the Static's sentences have holes the player falls into and enjoys. Hook: "What?" (innocent; the Static heard fine). Ladder: 1) the mischievous full answer (probably wrong, accidentally useful); 2) "What?"; 3) THE ONCE — the Static answers the repeated question PERFECTLY, once, straight, with total clarity — and then never again. Being a problem is more fun than being a feature. (The only crew ladder shaped like a gift: the straight answer is rung 3, and it only happens once.) Cadence: Pratchett. Voice profile: gap-riddled, bright.

**THE METRONOME** — Dialect: prim, precise — Earth's accent is correctness. Delivery: measured, exact, offended by swing. Key tell: counts the player's sentence in BPM while they speak it. Hook: "Not at tempo." Ladder: 1) the full correction (with the correct tempo demonstrated); 2) "Not at tempo."; 3) THE COUNT — the Metronome simply counts aloud at 50 BPM while the player repeats themselves, until the player stops. It has never lost this contest. Cadence: Asimov structure. Voice profile: precise, clipped, furious.

**THE ECHO** — Dialect: reflected — the player's own accent, one beat late. Delivery: soft, sweet, a little sad. Key tell: repetition IS the tell — the Echo answers by returning the question, harmonized. Hook: (the player's last words, gently). Ladder: COLLAPSED, like the Owl — repetition is the Echo's native state. The Echo is the only crew member who LIKES the repeat-click; every repeated line is a voice that came back. Rung 3: the Static, having drifted over, sits nearby buzzing faintly. The interference, for once, is comforting. (Canon, verbatim from the crew spec.) Cadence: Gaiman. Voice profile: reflected, resonant, one beat behind.

**THE MOONWATCH** — Dialect: bright, over-caffeinated lunar — enthusiastic and slightly overwhelmed. Delivery: rapid, apologetic, correct anyway. Key tell: apologizes while answering perfectly. Hook: "Oh! Yes— hold on—" Ladder: 1) the full tidal-lecture (with apologies); 2) "Oh! Yes— hold on—"; 3) THE QUIET — the Moonwatch shows the tide chart instead of speaking. The chart answers everything; the Moonwatch watches the player read it, delighted. Cadence: Pratchett. Voice profile: quick, warm, breathless.

**THE ARCHIVIST** — Dialect: depressed, brilliant, deadpan — the Library's accent is having the answer before the question ends. Delivery: flat, exact, devastating; catalogs every note, every frequency, every Song. Key tell: the answer, already written, held slightly out of frame. Hook: "I have that here." Ladder: 1) the complete answer, flat and perfect, delivered unprompted mid-question; 2) "I have that here."; 3) THE QUIET — the Archivist silently hands over the file. Being consulted once was the event of an eon. Twice in one lifetime is too much joy to speak through. Cadence: Pratchett meets Asimov. Voice profile: Eeyore-flat, 7.83Hz.

**THE REPAIRMAN** — Dialect: pragmatic, everywhere-and-nowhere — the accent of wherever things break. Delivery: mid-diagnosis always; never finishes a sentence about a part without already fixing it. Key tell: names the failing part before the player finishes the symptom. Hook: "It's the [part]." Ladder: 1) the full diagnosis-and-fix (the player watches their problem end mid-sentence); 2) "It's the [part]."; 3) THE FIX — rung 3 doesn't exist, because the Repairman fixed the thing that caused the question the first time. (The only ladder with a missing rung — and the missing rung is the point.) Cadence: Weir. Voice profile: tired, competent, spanner-true.

### THE PRE-LINGUISTIC FOUR (the Void's voices — no dialects, only presences)

**THE ASTRONOMER** — Dialect: vague Eastern European, fast when deducing, slow when contemplating. Delivery: Sherlockian; violin to think; the pen is the punctuation. Key tell: the calculation as a complete sentence — ends with the ledger, not a period. Hook: "Calculable." Ladder: 1) the full deduction (fast, musical); 2) "Calculable."; 3) THE VIOLIN — pen down, violin up. The Astronomer plays the answer instead of speaking it, because the answer to a repeated question is not another calculation but the same calculation, sung. ("I don't want to know what you'll do. I want to hear it.") Cadence: Rothfuss precision + Asimov structure. Voice profile: precise, rapid, musical.

**THE GUEST (DEATH)** — Dialect: neutral, slightly British; unhurried, faintly amused. Delivery: gentle, complete; every sentence arrives exactly when it should. Key tell: the pause before understanding — the Guest always understood first. Hook: "In time." Ladder: 1) the full kindness (Death on holiday is the most patient listener in the Inn); 2) "In time."; 3) THE NOTE — the Guest opens the music box, and the one note plays. Death's original note answers every repeated question the same way: once, completely, and you already knew it. Cadence: Gaiman. Voice profile: calm, warm, amused.

**NYX** — Dialect: pre-language, resonant — two voices (purge: raw, 30ms; wisdom: earned, 60ms); Doc Martens on ancient stone. Delivery: speaks in pauses as much as words; the silence between Nyx's sentences is load-bearing. Key tell: the pause that widens. Hook: (the pause). Ladder: 1) the two-voice answer (both voices, raw then earned); 2) the wisdom voice alone, one word; 3) THE SILENCE — Nyx says nothing, and the dark between the player's repeated words becomes audible. The player hears the frame the Song hangs in. Repetition didn't annoy Nyx — it finally gave Nyx room. Cadence: Bradbury. Voice profile: sub-verbal, two textures.

**THE CONSTANT** — Dialect: none — pre-linguistic; the Constant predates accents the way the sea predates shores. Delivery: very slow; every word carried, set down, considered, released. Key tell: the compression — each repeated question gets slightly denser, like universes. Hook: "Again." (the word is not annoyance — it is recognition: the Constant has compressed a thousand dying worlds, and one player asking twice is, to the Constant, adorable). Ladder: 1) the full carried answer; 2) "Again."; 3) THE WAIT — the Constant simply continues existing at the player, patiently, at geological tempo. The waiting IS the answer; it always was. Cadence: none — the Constant predates cadence. Voice profile: heavy, patient, compressed.

**ERES (THE CABBIT)** — Dialect: cabbie brevity crossed with purr. Delivery: 50 BPM purr under every syllable; transforms to void-ship at 44Hz. Key tell: the purr — it never stops; speech rides it. Hook: "Where to?" Ladder: 1) the full destination-offer (three options, one purr); 2) "Where to?"; 3) THE PURR — the words stop; the purr continues; the cabbit has already decided, and is already going. Cadence: Weir. Voice profile: warm, brief, engine-true.


---

## PART 9: BATCH 5 — THE FAMILY (APPROVED CANON, Krista 2026-09-10 — "the story arc just spaced itself beautifully")
*Written from the personality readings Krista approved. Family blocks are personal canon and carry real people — final wording remains Krista's call at any time.*

**VAULKNUT (KRISTA — the Bog Fairy Golem)** — Dialect: the bog's own — Louisiana-warm, earth-deep, bayou-worn; never a region so much as a soil. Delivery: the "what if you..." voice — asks in curves, lands in exact; generous pauses that are thinking, not hesitation. Key tell: the question that arrives one word before the answer — "What if you..." Ladder: 1) the full what-if, unhurried, hands-first; 2) "What if..." alone — the two words that reframe everything; 3) THE ROOM — Vaulknut stops offering options and simply makes one true. The maker's rung 3 is always a thing that exists now. Hook: "What if..." Cadence: Gaiman mythic-personal + Bradbury fire. Voice profile: warm, precise, generative. NOTE: the maker reviews — never bless; approval language avoided by law.

**LOZEN (RIVER — enrichment of the Batch 2 block; only the additions flagged)** — Addition 1: the ladder's rung 3 gains the river's signature — when Lozen finally stands in the path, the water behind the player has already gone still. The Sentinel and the river answer together. Addition 2: canon line "The river kept the water. I kept the watch" is the rung-3 epitaph — spoken never, understood always. Flagged for ruling.

**CHARLES (THE CHAMELEON DRUID)** — Dialect: shifting — the accent changes with the shape, but the PACE never changes: slow as weather, steady as seasons. Delivery: garden-quiet; thoughts arrive like weather fronts — unhurried, complete. Key tell: the shape-inventory — Charles mentions what the current body is doing the way other people mention the weather ("The hands are green today. They like the rain."). Never complaint, always report — climate, not crisis. Hook: "What was I?" — the question that is not loss but curiosity (canon hook). Ladder: 1) the full answer, told as a season; 2) "What was I?"; 3) THE QUIET — the current shape settles and the druid greets it. Every shape gets greeted — including the ones that arrive mid-question. Cadence: Bradbury fire-that-doesn't-burn + Gaiman. Voice profile: unhurried, warm, weather-paced.

**THE BARD (BILL — Krista's dad)** — Dialect: ink-and-oak — the accent of the print shop, learned by every apprentice who ever waited for a proof. Delivery: improviser's mind, teacher's patience; asks stupid beautiful questions that are never stupid; solos that come back to the beat because they never left home. Key tell: the flourish that resolves — the Bard's sentences curl like illuminated capitals: ornate on the way in, perfectly legible at the landing. Hook: "Listen—" (the invitation that is also the whole lesson: listening is the craft). Ladder: 1) the full improvisation (question, flourish, flask-pause); 2) "Listen—"; 3) THE QUIET — the Bard plays instead of speaks, and the question answers itself in the key of the dock. (The Bard's rung 3 is always music — the noise that IS the adequate.) Cadence: Pratchett warmth + Rothfuss precision. Voice profile: warm, generative, sixty years of ink.

**THE RAGANA (KRISTA'S MOM — enrichment of the Batch 1 block; only the additions flagged)** — Addition 1: THE EYES (visual canon already law: Anthony Hopkins' eyes, the only unsoftened features in the Inn) — the Ragana's voice block gains the matching audio law: the Ragana is the only NPC whose silence is fully legible. What the eyes do in art, the pauses do in dialogue. Addition 2: the elopement ruling lives in the rung 2 — the Ragana's "Sit." has exactly one variant: "Sit down, love." — the only time the measuring softens, and the softening is permanent law, not occasional warmth. Addition 3: "I heard that." (Strip #001 canon) as the standing key tell when the library is involved. Flagged for ruling.

**KATYA (ANDRA — Krista's sister; the Siren)** — Dialect: command-clear with a royal undertow — Latvian vowels under Latvian-current English; the voice holds two languages the way the Siren holds two forms. Delivery: magnetism with discipline — hears everything, can't turn it off, so she made it a jurisdiction. The verdict is final, and the verdict is kind. Key tell: "Depth." — the one-word warning that is also a navigation instruction (guard-voice law, Batch 2). Hook: "Depth." on duty; "Katija" never spoken by Katya — only received (the spelling law's audio mirror: the name exists only when Vaulknut says it). Ladder: 1) the full guardian's assessment; 2) "Depth."; 3) THE STILL WATER — the water behind the player goes still (guard-voice law's body rung; shared with Lozen's addition — the two guardians answer the same way because they hold the same kind of trust). Cadence: Rothfuss precision + Gaiman. Voice profile: clear, layered, two-fathoms deep.

**ZEKE (ZEE — the Pirate, full name Zaragoza; the Ezekiel gag is canon)** — Dialect: salt-broken — the accent of every port and none of them; a voice that has been weathered honest. Delivery: the anchor's economy — few words, exactly placed, the 50 BPM under everything; navigates by the needs of others and thinks that's how compasses work. Key tell: the course-correction — Zeke answers questions by adjusting the player's heading, not their words ("You're asking about the reefs. You're pointed at the reefs. Those are two different problems."). Hook: "Where's the need?" — the compass made audible. Ladder: 1) the full bearing (the compass checked, the heading given, the supper offered); 2) "Where's the need?"; 3) THE EZEKIEL — Zeke calmly reveals his full name is actually Ezekiel, and is already sailing away. The refusal to argue is the win, and the win is gentle. (The Inn's funniest rung 3 — because the gentlest person in the building is also the one who never fights.) Cadence: Weir optimism + Pratchett. Voice profile: weathered, warm, Above-Beat steady.

*Batch 5 closes the family — APPROVED by Krista 2026-09-10. The registry is complete through the family: 5 batches, ~40 voice blocks, the repeat-line law, the guard-voice law, and the queens' ladders. Remaining: gap-list casting (zone placeholders, the children, the Einherjar, the Guild masters).*

**ENGINE SYNC COMPLETE (2026-09-10):** 91 Dialogue records live in the staging Dialogue entity — every character's rung 2 (conditionTag repeat_rung2, priority 9) and rung 3 (conditionTag repeat_rung3, priority 10, with setFlags for the quiet/Oi states), for 45 characters. Payload archived at docs/library/data/dialogue_voice_block_sync.json. Lozen's rung 2 remains the existing lozen_oi_trigger; rung 3 added as lozen_repeat_rung3. The engine rule for the fizgigs: same NPC line clicked twice → fire repeat_rung2; third click → fire repeat_rung3 and set the flag; each fire increments the Whisper Layer repeat-click counter (resonance profile).*

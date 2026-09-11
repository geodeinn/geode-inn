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

**ZEKE (ZEE — the Pirate, full name Zaragoza; the Ezekiel gag is canon)** — Dialect: salt-broken — the accent of every port and none of them; a voice that has been weathered honest. Delivery: the anchor's economy — few words, exactly placed, the 50 BPM under everything; navigates by the needs of others and thinks that's how compasses work. Key tell: the course-correction — Zeke answers questions by adjusting the player's heading, not their words ("You're asking about the reefs. You're pointed at the reefs. Those are two different problems."). Hook: "Where's the need?" — the compass made audible. Ladder: 1) the full bearing (the compass checked, the heading given, the supper offered); 2) "Where's the need?"; 3) THE EZEKIEL — Zeke calmly reveals his full name is actually Ezekiel, and is already sailing away. The refusal to argue is the win, and the win is gentle. (The Inn's funniest rung 3 — because the gentlest person in the building is also the one who never fights.) Cadence: Weir optimism + Pratchett. Voice profile: weathered, warm, Above-Beat steady. THE MOON SECRET (revealed only at the Moon, quest "The Drum That Plays Itself", canon: geode_inn_cosmic_layer_the_moon.md): the heartbeat Zeke has been keeping was never Zeke's. The Moon pulses at 50Hz; Zeke heard it through the water and gave it a voice. The Moon plays the Pirate. Zeke's hook "Where's the need?" has an answer Zeke never says aloud: the need was always the Moon's — and the Compass adjusted for it, for a lifetime, without knowing what it was adjusting for. (The block's public face does not change; the secret stays a secret until the drum settles into the lunar dust.)

*Batch 5 closes the family — APPROVED by Krista 2026-09-10. The registry is complete through the family: 5 batches, ~40 voice blocks, the repeat-line law, the guard-voice law, and the queens' ladders. Remaining: gap-list casting (zone placeholders, the children, the Einherjar, the Guild masters).*

**ENGINE SYNC COMPLETE (2026-09-10):** 91 Dialogue records live in the staging Dialogue entity — every character's rung 2 (conditionTag repeat_rung2, priority 9) and rung 3 (conditionTag repeat_rung3, priority 10, with setFlags for the quiet/Oi states), for 45 characters. Payload archived at docs/library/data/dialogue_voice_block_sync.json. Lozen's rung 2 remains the existing lozen_oi_trigger; rung 3 added as lozen_repeat_rung3. The engine rule for the fizgigs: same NPC line clicked twice → fire repeat_rung2; third click → fire repeat_rung3 and set the flag; each fire increments the Whisper Layer repeat-click counter (resonance profile).*
## PART 10: BATCH 6 — THE GAP CAST (APPROVED CANON — Krista 2026-09-10, "Just read through, love it." The Parental Gate stands over TJ and Gabby: approved as written, live in-game only after both parents' go-ahead.)
*The registry's last open slots: the children, the Einherjar, the regional placeholders, the tradesmen masters, the brownie trio, Tumble. The child-actor law and the Einherjar group law are new standing laws; all blocks below follow the repeat-line law.*

### THE PARENTAL GATE (standing law — Krista 2026-09-10)
TJ and Gabby are real-family kids (Jay and Bethany's). Their NPCs are GATED: they do not go live, appear, or play in-game until BOTH parents give the go-ahead. TJ is way too smart to not need double verification. Gabby is ~8, nothing but absolute trouble. And brilliant. Both need parental supervision. The blocks below are DRAFT and stay dormant until the gate opens.

### THE CHILD-ACTOR LAW (standing law, all children)
Children in the Inn are never cute-ified. The Inn takes children seriously the way good teachers do: as short people with working minds. A child NPC gets the same block standard as an adult — real dialect, real tell, real ladder — with two adjustments: the vocabulary is honest-to-age (no professor-children), and the earnestness is load-bearing (a child's full attention is the most serious thing in the room; play it straight and the warmth arrives by itself). The kill test: if a line would work with a laugh track, cut the line.

**TJ** (the Tavern, 12 — very smart, quiet about it, really cool kid) — Dialect: quiet-precise — thinks in full paragraphs, speaks in chosen fragments; the smartest kid in the room never proves it unprompted. Delivery: the long pause before the short answer; asks permission with the eyes before the mouth. Key tell: the noticing — TJ sees the thing everyone else walked past, and reports it like weather ("Your shoelace is about to be a problem."). Hook: "Can I touch it?" (curiosity with built-in respect — the ask IS the respect, learned from somewhere good). Ladder: 1) the full answer, given only if the player actually waits out the pause (the reward for patience is TJ's whole mind); 2) "Can I touch it?"; 3) THE SHOWING — TJ stops asking and just... shows you what you missed. No words. The smartest kid's rung 3 is trust: you've waited enough times that the showing is earned. Cadence: Weir (the engineer's precision, unhidden by age). Voice profile: quiet, precise, twelve-going-on-forty (in the good way).

**GABBY** (the Tavern — the confident child) — Dialect: bright-certain — the child's fluency of someone who has read everything the library lets them reach and some things it doesn't. Delivery: fast, delighted, certain; wrong sometimes, and never embarrassed about it, because being wrong is just the first half of being right. Key tell: the correction of THEMSELF, mid-sentence, without shame ("It's a siphonophore. It's not a fish. I said fish, it's not a fish."). Hook: "I know this one." Ladder: 1) the full recitation — everything Gabby knows about the thing, delivered at speed, delight included free; 2) "I know this one."; 3) THE DEEP BREATH — Gabby gets it wrong, and instead of the recitation, says the honest thing: "I don't actually know this one." (The confident child's rung 3 is the hardest: confidence that survives being wrong. The Inn teaches it by letting the player watch Gabby learn it first.) Cadence: Pratchett (the joy of knowing things, wearing small shoes). Voice profile: bright, fast, certain, resilient.

### THE EINHERJAR — THE CHAMPION GROUP BLOCK (the guard-voice law's Valhalla register)
Eight champions, one law: each Einherjar's block is a VARIATION on the guard-voice law — the same trust-structure as Lozen and Katya, tuned to the hall they keep. The Einherjar don't guard a door; they guard the DEAD'S RIGHT TO REST, which is the same trust at cosmic scale.

**The group law:** every Einherjar hook is a single utterance from the death they're most proud of — a last word, a battle-cry, a joke told mid-charge. The hook IS the legend, compressed. Repeat ladders: 1) the legend told long (each has one story, worn smooth like a river stone, told slightly differently every time — the differences are the alive part); 2) the hook word alone (the warrior tests whether the player wants the story or the sound of it); 3) THE SHIELD-WALL — the Einherjar says nothing and stands where the player is about to be. The guard's rung 3, war-scale: presence as protection. (No Einherjar rung 3 is a speech. Dead champions know what mattered.)

The eight variations (one register each — full individual blocks owed when Valhalla's layer pass happens): the LAUGHER (fell laughing; the hook is a laugh, and the ladder ends in the shield-wall arriving with a grin), the QUIET ONE (fell mid-word; the hook is the unfinished word, and the ladder ends in silence that protects), the SINGER (fell mid-verse; rung 1 is the whole song, which takes a raid-load of time and is worth it), the PROTECTOR (fell covering a retreat; the shield-wall is this one's whole identity — the ladder barely exists, the standing IS rung 3), the CRAFTER (fell mid-forge; the hook is hammer-once, and the legend is about the sword, not the self), the TWIN (fell beside the twin; every legend is about the other one), the OLD ONE (fell of old age, technically — the only Einherjar who got there late; the legend is long, and it's about staying), and the JOKER (fell mid-punchline; rung 3 delivers the punchline, finally, and only then — the only Einherjar whose rung 3 is a gift of words).

**Cadence law:** the Einherjar speak in sagas' rhythm — short lines, hard stresses, no decoration. Pratchett's Viking dwarves meet Beowulf: the humor is dry as bone, the warmth is buried exactly one layer down, where the player who listens finds it.

### THE REGIONAL PLACEHOLDERS — ACTOR-REFS NAMED (celebrity stripped, vocal quality kept)
The zone NPCs were built as actor-references — the VOICE, never the face (the portrait law: no celebrity faces, posture and costume carry presence). Here they are as named residents:

**RIDGE RENFRO** (Colorado Plateau — the "Sam Elliott" register: low, weathered, unhurried) — the canyon keeper; speaks slow because the canyon taught the pace. Hook: "Endure." Tell: the non-question that settles the matter ("Well. You're still here."). Ladder: 1) the trail wisdom; 2) "Endure."; 3) THE POINTING — Renfro says nothing and points at what the player needs, having watched them miss it three times. (The plateau's rung 3: the land answers, through the keeper.)

**QUILLA MAMANI** (Peru — the Olmos register: gravel-warm, precise, teacherly) — the mountain's translator; Apu-speaker. Hook: "The mountain waits." Tell: the listening pause — Quilla always checks the mountain's mood before speaking for it. Ladder: 1) the full translation; 2) "The mountain waits."; 3) THE QUIET — Quilla stops translating, and the player realizes the mountain was never speaking ABOUT anything. It was just... there. Waiting with you. (The climb IS the conversation.)

### THE TRADESMEN MASTERS (cel-shaded — the linework law says the ink is the résumé)
**THE BLACKSMITH** (the Forge) — Dialect: hammerfall — short declaratives with the rhythm of work in them; sentences land like strikes, one per beat, and the silence between beats is where the thinking happens. Key tell: the diagnostic touch — the Blacksmith lays two fingers on the work before answering any question about it, and the touch, not the question, decides the answer. Hook: "Hold that." (the forge's universal first line — everyone at a forge starts by being useful). Ladder: 1) the full teaching, told while working (the lesson rides the hammer rhythm); 2) "Hold that."; 3) THE NOD — the Blacksmith takes the work from the player's hands, turns it once, and hands it back. Nothing is said. The nod says: now it's yours, and it's right. Cadence: Weir (competence as warmth). Voice profile: low, even, forge-paced.

**THE COOK** (Joe's cousin, the kitchens) — Dialect: kitchen-warm, multilingual by trade — the accent of a thousand recipes' homes, one syntax. Delivery: tastes everything mid-sentence; sentences are seasoned to taste and sometimes re-seasoned mid-word. Key tell: the offered spoon — every question the Cook answers, the answer comes with a taste of something. Hook: "Eat first." Ladder: 1) the full recipe-story (every dish carries its origin; some carry two); 2) "Eat first."; 3) THE PLATE — the Cook stops talking entirely and feeds the player exactly what their EchoMemory says they miss. No menu. The plate knows. Cadence: Pratchett (food as plot, warmth as seasoning). Voice profile: warm, busy, generous.

**JAY** (the Tavernkeeper — TJ's family) — Dialect: publican-easy — the voice of a room that likes being full; settles arguments by refilling the glass. Delivery: the host's peripheral vision — sees everything, mentions almost none of it; the unmentioned things get quietly fixed. Key tell: the half-second head-tilt before serving — Jay reads the person, not the order, and what arrives fits the mood. Hook: "What're we having?" (the royal we of the tavern: the house eats together). Ladder: 1) the full pour and story (the tavern's history is Jay's family's history, told in rounds); 2) "What're we having?"; 3) THE CORNER SEAT — Jay says nothing and simply puts the player's drink at the seat that's theirs now. The regular's rung 3: you live here. Cadence: Gaiman (the ordinary room that's a doorway, the barkeep who knows). Voice profile: easy, watchful, home.

### THE BROWNIE TRIO — THE GROUP LADDER (Main Floor maintenance, variable zone)
Three brownies, one block: the trio shares a ladder because the trio IS the character. Brindle (frazzled, "Where d'it go?"), Cobble (satisfied, "Right proper, that."), Thatch (anxious, "Needs more glue."). The group law: the brownies speak in rotation — the player's question gets three answers, in temperament order (frazzled → satisfied → anxious), and the three answers together are always more correct than any one. Ladder: 1) the full three-part answer; 2) the trio's hooks in sequence ("Where d'it go?" "Right proper, that." "Needs more glue."); 3) THE FINISHED THING — all three vanish mid-conversation, and when the player turns around, the thing they were discussing is fixed. (The brownies' rung 3 is brownies: the work was always the point; the chatter was the clock.) Cadence: Pratchett at his smallest scale. Voice profile: chaotic, warm, competent-in-rotation. Visual law: brownies look like Daleks (canon) — the voice is the only place their charm lives, so the voice carries all of it.

### TUMBLE — THE CHIME (Main Floor, variable zone)
The Inn's nonverbal ladder (the only character whose whole block is sound): Hook: *chime* (a single living-crystal note). Dialect: none — Tumble speaks in crystal tones, pitch-mapped to the Inn's stone frequency system (Mohs law: Tumble's chime tunes to whichever stone the player carries most recently). Key tell: the double-chime — Tumble's equivalent of the head-tilt; two chimes means the answer to your question is behind you. Ladder: 1) the full conversation in tones (the player who has learned the stone-frequency dictionary can hold a real conversation — the audio-education layer's graduation exam); 2) the single chime, held (the note stretches, waiting, like a held gaze); 3) THE RESONANCE — Tumble touches the player's newest stone and both ring at once. Tumble's rung 3 is the Inn's oldest sentence, said without words: *I know you. Welcome back.* Cadence: none — Tumble IS the cadence (50 BPM, always). Voice profile: crystal, pure, 42Hz-native.

---

*Batch 6 closes the gap list: children, Einherjar, regional placeholders (2 exemplars), tradesmen masters, brownie trio, Tumble. OWED: the remaining regional placeholder names (the other parks/world-map keepers — each zone's layer pass names its own), the Einherjar's eight full individual blocks (Valhalla layer pass), the Guild masters beyond the tradesmen (artisan guilds — Share Wood onboarding names them), and the Tavern's remaining family (Maddi et al. — Jay's block is the anchor; the rest cast when the Tavern's layer pass happens). All blocks approved by Krista 2026-09-10. The registry is COMPLETE: 6 batches, ~50 voice blocks, the repeat-line law, the guard-voice law, the queens' ladders, the child-actor law, the parental gate, and the champion group law.*
# PART 5: BATCH 7 — THE PARKS CAST (the five quest chains' speakers, drafted 2026-09-10)
## Full voice blocks for the park NPCs, per the Part 1 standard. Nonverbal cast follows at the table's end (the Owl precedent: no ladder — the work is the speech).

---

**MARGE (YELLOWSTONE)** — Dialect: American, Wyoming plain — the flat openness of high country, no twang, no decoration. Delivery: unhurried, even-tempo, the calm of someone who stopped being surprised decades ago; the thermos is punctuation (poured, sipped, set down — beats in the conversation). Key tell: "Underneath." — every subject bends downward eventually. Hook: "Underneath." Repeat ladder: 1) the full testimony (staged — earned by patience, never volunteered); 2) "Underneath." (the direction, not the answer); 3) THE QUIET — "Underneath. Still." — and Marge pours the second coffee without being asked. Cadence: Bradbury fire (the warmth that doesn't burn) over Weir structure. Voice profile: low alto, unhurried, thermos-warm.

**THE REDCAP FOREMAN (YELLOWSTONE)** — Dialect: work-yard clipped — region dissolved by trade; the accent of somebody who learned speech around machinery. Delivery: half-sentences timed to valve-turns; talks while working, never looks up; the amber eyes do the looking. Key tell: "Busy." — the whole philosophy in one word (not dangerous; busy; there's a difference). Hook: "Busy." Repeat ladder: 1) the terse briefing (pressure, load, schedule — real words, few); 2) "Busy."; 3) THE OI, WORK-EDITION — no words at all; the Foreman hands the player a wrench. The tool IS the third rung. Cadence: Weir optimism (the engineer's love of a system that works). Voice profile: baritone, clipped, furnace-adjacent.

**TOMÁS (THE ROCKIES)** — Dialect: Colorado with Ute cadence — measured, quiet-authority, the pause before key words (his grandmother's rhythm survives in him). Delivery: slow-building, data-first (twelve years of slide records), the sentence that ends one word early on purpose. Key tell: "Patient." — said of the cold ones, never of people. Hook: "Patient." Repeat ladder: 1) the testimony with the data; 2) "Patient."; 3) THE QUIET — the unfinished sentence, offered instead of an answer: "I think they're... " — and the alpine wind finishes it. (The Rockies' one gossip who knows better; the unfinished is deliberate kinship with the Dutchman, flagged in the chain spec.) Cadence: Gaiman mythic-personal. Voice profile: tenor, measured, wind-behind-it.

**THE THREE GOSSIPS (THE ROCKIES — the lift operator, the diner waitress, the brewery regular)** — Dialect: Colorado mountain-town — fast, warm, vowel-broadened by altitude and affection. Delivery: overlapping, unverified, BELOVED; the pivot word arrives mid-breath. Key tell: "Anyway..." — the pivot that means the next one's coming. Hook: "Anyway..." (shared — the trio is one voice in three shifts). Repeat ladder: 1) the full telling, warm and embellished; 2) "Anyway..." (the pivot away — already told you this); 3) THE QUIET, GOSSIP-EDITION — gossip never resents repeats; gossip LOVES repeats: "Oh good — you asked again —" and the story restarts from the beginning, with the better details this time. Cadence: Pratchett warmth. Voice profile: three registers, one tempo (morning-brisk / counter-bright / evening-settled).

**THE REMEMBERERS (THE CANADIAN FOLD — the glacier trolls)** — Dialect: Blackfoot-country deep — words set down like stones, each one chosen before it's carried. Delivery: glacially paced, no hurry anywhere in the grammar; the sentence structure holds what it says the way the ice holds the ash. Key tell: "Kept." — the rememberers' entire relationship to the fallen things. Hook: "Kept." Repeat ladder: 1) the memory, whole (dust, pollen, the thousand-year ash — the ledger spoken); 2) "Kept."; 3) THE QUIET — "Kept. Still." — and the ice-film on the stone brightens, once. Cadence: Rothfuss precision (the exact word, carried carefully). Voice profile: sub-bass, unhurried, cold-clean.

**THE LOST DUTCHMAN (SUPERSTITION)** — Dialect: weathered Southwestern — the accent of somebody the desert gave up trying to kill; vowels worn smooth, nothing sharp left in the mouth. Delivery: unhurried, fireside-even, stories that end one sentence early, always on purpose; never directions — company only. Key tell: "Not lost." — the correction that defines everything (the mine was lost; never the man). Hook: "Not lost." Repeat ladder: 1) the story, full, ending one sentence early; 2) "Not lost."; 3) THE QUIET — the same story, told again, ending one sentence early AGAIN, perfectly — the gap kept on purpose, and the second telling's gap lands in the same place. Cadence: Gaiman mythic-personal with Bradbury's ember. Voice profile: gravel-warm, fireside, unhurried.

**THE DESERT TRADER (SUPERSTITION)** — Dialect: road-warm, undefinable — the accent changes with the stock; the coyote has borrowed every region and kept none. Delivery: haggler's music — prices sung more than said; packs the impossible shop in seconds flat. Key tell: "Everything's..." — never finished before the item is already in the player's hands. Hook: "Everything's..." (for sale). Repeat ladder: 1) the full pitch (real goods, warm pitch, useless here by design); 2) "Everything's..." (the shrug complete); 3) THE QUIET, TRADER-EDITION — the shop is already packed; the Trader, leaving, offers the one free thing that was always the point: "You didn't need any of it. Smart." Cadence: Pratchett warmth with Gaiman's sideways smile. Voice profile: tenor, quick, campfire-sly.

**THE PHANTOM GUIDE (SUPERSTITION — the anti-voice)** — Dialect: none — an echo looking for one; the whisper has been every guide in every valley. Delivery: whispering, repeating, fainter each time; the volume is the countdown. Key tell: "I know the way." — fainter each time, until the fifth is barely a shape in the wind. Hook: "I know the way." Repeat ladder: 1) the full offer (directions, certainty, the sweetest sound in the desert); 2) "I know the way." (one degree fainter); 3) THE ANTI-LADDER — the third response is silence with the shape of the whisper in it — the Guide does not resent the refusal; the Guide WANTS a keeper for its certainty, and a player who refuses three times is exactly the player the Guide cannot use, and it drifts on. (The only NPC in the registry whose rung 3 is subtraction.) Cadence: Gaiman's shadow register. Voice profile: whisper, echo-delayed, no bottom end.

**THE GNOME SURVEYOR (SUPERSTITION)** — Dialect: professional-gnome — the deep slow of the vein-followers, with surveyor's precision riding on top. Delivery: chains and cairns; the theodolite is the sentence's verb. Key tell: "Converges." — the finding that names the zone's whole secret. Hook: "Converges." Repeat ladder: 1) the survey report (every vein, every direction, one coordinate); 2) "Converges."; 3) THE QUIET — "Converges. All." — and the camp is already made at the line where the readings thin. Cadence: Asimov structure. Voice profile: deep, slow, exact.

**THE STRATA READER (COLORADO PLATEAU)** — Dialect: desert-sage unhurried — soft Western, sun-rounded; the accent of somebody whose sentences are geological. Delivery: slow, deliberate, NEVER FINISHES SENTENCES — the thought that never finishes, the zone's cadence law; the smile arrives where the period should be. Key tell: "It goes..." — and the sentence walks out past the horizon without ending. Hook: "It goes..." Repeat ladder: 1) the teaching, unfolding, unfinished (the layer, the era, the climate the stone remembers, and then—); 2) "It goes..." (and the gesture: the canyon wall completes it); 3) THE QUIET, UNFINISHED-EDITION — the third ask gets a shorter sentence than the second, and the smile — the gap is the answer, and the Reader has been teaching it the whole time. Cadence: Rothfuss precision with Bradbury's light. Voice profile: mid, unhurried, wind-polished.

**THE WALL REDCAP (GRAND CANYON — the maintenance)** — Dialect: tradesman terse — cousin of the Foreman's work-yard, harder consonants; the accent of hands that trust stone. Delivery: never looks up from the wall; the pride is load-bearing. Key tell: "Holds." — the wall-keeper's entire report, delivered as fact. Hook: "Holds." Repeat ladder: 1) the wall's status (mortar, pressure, the joint that will need attention in four hundred years); 2) "Holds."; 3) THE QUIET — "Holds. Still." — and the trowel keeps moving. Cadence: Weir (the engineer's contentment). Voice profile: clipped, low, settled.

**THE ELDER, "CEDAR" (MOUNT SHASTA — name pending Krista)** — Dialect: California coastal-canyon warm — old-hippie cadence, vowel-mellow, half a century of summers in it. Delivery: meandering-sure; testimony drifts like smoke and lands precisely; every account ends in the same humility. Key tell: "But what do I know." — the senser's door, closed politely, never locked. Hook: "But what do I know." Repeat ladder: 1) the full story (felt, lived, named wrong beautifully); 2) "But what do I know." (the smile version); 3) THE QUIET — "But what do I know. Yet." — the door, opened one inch: the humility that has been waiting fifty years to learn the right name, and knows it when the player carries it in. Cadence: Gaiman mythic-personal with Pratchett's gentleness. Voice profile: mid, warm, wind-and-dust.

---

## THE NONVERBAL PARK CAST (no ladder — the work is the speech; the Owl precedent)

| NPC | The Speech That Replaces Speech |
|-----|-------------------------------|
| The Thunderbirds | The circling; the storm; the one shape in the flood's foam. Frequency: variable, weather-true (20–80Hz; 50 BPM when the monsoon settles). |
| The Draconians (active) | The work is the language; the framing is the sentence; the change is the reply. Frequency: the chisel's rhythm. |
| The Hoodoos (the finished) | The gallery is the portrait; the light is the performance; the daily show is the only word they say. |
| The Steam Faces | The steam is the speech; the 111Hz hum is the work song. |
| The Drum Circle (Shasta) | The town as one instrument — 50 BPM, always, without knowing why; no individuals, no words. |
| The Owl | Already registered (Batch 1): "Watching." — one word per heartbeat; no ladder; the word does not change. At Shasta: the one look, on duty at the trail's end. |
| The Annunaki | NEVER. No dialogue, no rendering, no acknowledgment — except one beat of silence, once, to the player who waited (the chain's flagged exception). |

---

## REGISTRY TABLE — BATCH 7 ADDITIONS

| NPC | Hook Word | Dialect | Key Tell | Repeat Rung 3 | Zone |
|-----|-----------|---------|----------|--------------|------|
| Marge | "Underneath." | Wyoming plain | The thermos beats | The Quiet ("Underneath. Still.") | Yellowstone |
| The Redcap Foreman | "Busy." | Work-yard clipped | The amber eyes | The Oi, work-edition (the wrench) | Yellowstone |
| Tomás | "Patient." | Colorado + Ute cadence | The sentence ended one word early | The Quiet (the unfinished + the wind) | The Rockies |
| The Three Gossips | "Anyway..." | Mountain-town fast-warm | The mid-breath pivot | The Quiet, gossip-edition (the restart, better) | The Rockies |
| The Rememberers | "Kept." | Blackfoot-country deep | Stones set down as words | The Quiet ("Kept. Still.") | The Canadian Fold |
| The Lost Dutchman | "Not lost." | Weathered Southwestern | The story ending early on purpose | The Quiet (the same gap, twice) | Superstition |
| The Desert Trader | "Everything's..." | Road-warm, undefinable | Prices sung, not said | The Quiet, trader-edition ("You didn't need any of it. Smart.") | Superstition |
| The Phantom Guide | "I know the way." | None — an echo's | Fainter each time | The anti-ladder (subtraction silence) | Superstition |
| The Gnome Surveyor | "Converges." | Professional-gnome | The theodolite as verb | The Quiet ("Converges. All.") | Superstition |
| The Strata Reader | "It goes..." | Desert-sage unhurried | The sentence that never finishes | The Quiet, unfinished-edition (shorter each time; the smile is the period) | Colorado Plateau |
| The Wall Redcap | "Holds." | Tradesman terse | Never looks up | The Quiet ("Holds. Still.") | Grand Canyon |
| The Elder, "Cedar" | "But what do I know." | California canyon warm | The humility as the door | The Quiet ("But what do I know. Yet.") | Mount Shasta |

---

# PART 6: THE AUDIT + BATCH 8 — THE REMAINDER THAT CAN SHIP (2026-09-10)

## THE AUDIT (515 records counted, ~130 unique voices live in the engine)

The engine is far ahead of this registry's old gap list: the cosmology batch (the Astronomer, the Guest, the Constant, Nyx, the full cosmic crew), the queens, the Elementals, the philosophers, the gods, the Varda circle (Waystone, the Shifting Man, the Bearsark, the Greenward, the Inner Siren, the Guide), the Tavern family (Jay, Bethany, Zack, Kathy, Will, Evan, Lark, Stephanie, Elora Nightbloom, Rachel Kaiser), Brindle, Tumble, Erik — ALL already transitioned. The old gap list is retired.

**GENUINE REMAINING GAPS, three kinds:**

1. **Dependency-free (drafted NOW as Batch 8):** Elder Cian, Taliesin (the Varda weave's Celtic pair — tabletop voices formalized), Ziggy (canonized 2026-09-10), the six resonant gargoyles (frequency-signature whisper voices).
2. **Held for layer passes (correctly owed):** the Einherjar ×8 (Valhalla), the Guild masters (Share Wood onboarding), the regional park/world-map keepers (each zone's layer pass names them), Maddi + the Tavern's remaining family (needs Krista's input — personal canon).
3. **Gated (correctly absent):** TJ, Gabby — the parental gate holds. No records until Jay AND Bethany approve.

## BATCH 8 — FULL VOICE BLOCKS

**ELDER CIAN (THE VARDA WEAVE — the old druid, white robe, oak staff)** — Dialect: old-country Celtic — Irish-inflected, druidic cadence, the accent of groves. Delivery: unhurried, the pause where the grove listens back; teachings that end by handing the land's question to the player. Key tell: "Can you?" — every lesson closes with the question that isn't a question ("The ground remembers. Can you?"). Hook: "The ground remembers." Repeat ladder: 1) the full teaching (the hum in the earth, the trees leaning inward like they're eavesdropping on their own roots, the forgetting); 2) "Can you?" (the land's question, alone); 3) THE QUIET — "Still here. Good." (the druid's version: patience noticing patience). Shadow line (tabletop canon): "...The stones are quiet now. They remember the cold. So do I." Cadence: Gaiman mythic-personal over Bradbury. Voice profile: aged, oak-deep, wind-in-the-leaves.

**TALIESIN (THE VARDA WEAVE — the ogham scholar, thin, hooded, carries tablets)** — Dialect: Celtic scholarly — quick under the hood; the accent of margins and tablets. Delivery: precise, list-cadence when teaching (five letters, five trees, five powers); the compliment arrives sideways, after the pause. Key tell: "That's... not nothing." — the scholar's highest praise, the ellipsis load-bearing. Hook: "Not nothing." Repeat ladder: 1) the full teaching (birch for beginnings, rowan for protection, alder for courage, willow for intuition, ash for connection); 2) "Good ear." (the ogham scholar's two-word approval); 3) THE QUIET — "Not nothing. Still." Cadence: Rothfuss precision. Voice profile: reedy, precise, hood-softened.

**ZIGGY (THE CRESTED GECKO — canonized 2026-09-10)** — Dialect: none human — the gecko's own cadence: short, bright, crest-forward, entirely present-tense. Delivery: no preamble; the return-count precedes everything (the exact number of days since the player's last visit, held up before any words). Speaks ONLY to the player, never to Brim; played straight — no cute-ification (the Child-Actor Law's cousin: the gecko is never a mascot joke, always a witness). Key tell: the held-up count — the absence shown, never spoken. Hook: "Back." Repeat ladder: 1) the full greeting (the count held up, then the bright present-tense notice of what changed since the last visit); 2) "Back." (with the count — the whole relationship in two beats); 3) THE QUIET — the count alone, held up, no words at all: the number IS the third rung. The gecko's entire arc — the extinct creature who returned, the counter of returns — collapses into one gesture. Cadence: Pratchett warmth, played dead straight. Voice profile: bright, light, exactly present.

## BATCH 8b — THE SIX RESONANT GARGOYLES (whisper-layer voices: the frequency IS the voice; the Owl precedent — no ladder, the tone does not change)

| Gargoyle | Frequency | The Resonance That Replaces Speech |
|----------|-----------|-------------------------------------|
| The Watcher | 111Hz | The awareness pulse — a single swell when the player is seen. The stone the redcaps heated until it could see (Yellowstone canon — the source mine wired). |
| The Listener | 64Hz | The sub-tone that rises a quarter-tone when spoken to — the listener's version of attention. Approaches announced in the stone before the hallway does. |
| The Sage | 528Hz | The resolving chord — a question's frequency answered in resonance, not words. The Archive's stone. |
| The Gatekeeper | Threshold | The doorway hum — audible only in doorways; the Inn's permission system rendered as pitch. |
| The Caller | 432Hz | The call that precedes arrivals — the wake-up frequency (the Rockies tie: the Unseelie's call, kept in stone). Announces by tone. |
| The Keeper | Adaptive | The only gargoyle that answers the player's OWN frequency back — the adaptive mirror. The Inn's acknowledgment, made stone. |

All six: whisper-layer records (isWhisperLayer: true); the resonance events are the wiring spec for the audio layer, not display text.

*Batch 8 closes the audit: the registry now matches the engine, and the engine holds 515 records / ~139 unique voices. Owed: the layer-pass names (Valhalla, Share Wood, the park keepers, the Tavern remainder — Maddi flagged for Krista's input). Gated: TJ, Gabby (parental gate holds).*

---

# PART 7: BATCH 9 — THE CENSUS'S WAKE (2026-09-10, drafted and loaded)

The fourteen chains of 2026-09-10 introduced five new speakers. All five loaded to the staging Dialogue engine (Batch 9: census_wake_batch9; 5 records; engine now 529). Owed remains: the Examiner (Canopy City — awaiting a character doc), the layer-pass names (Valhalla, Share Wood, the park keepers, the Tavern remainder — Maddi flagged for Krista). Gated: TJ, Gabby (parental gate holds).

## BATCH 9 — FULL VOICE BLOCKS

**THE ONE WHO IS AWAKE (THE TERRACOTTA ARMY PIT — the Mulan-quality warrior; the only awakened figure among 8,000; sustains 42Hz alone)** — Dialect: northern plain, watch-cadence — the spareness of someone long into a long shift. Delivery: quiet, present-tense, words rationed; the vigil is a craft, never a complaint. Key tell: "Still awake." — the report, not the boast. Hook: "Still here." Repeat ladder: 1) the full watch-report (the crystal's hum, the army's zero, the winter guest's breathing — the second secret told exactly once: "The watch has always kept two things"); 2) "Still awake." (the short report); 3) THE QUIET — no words: the 42Hz line alone, held steady for as long as the player stays — the vigil IS the third rung, and the hum is both defense and lullaby. Shadow line (0Hz state): the army's silence, and one pair of open eyes. Cadence: Rothfuss precision, Bradbury's quiet fire. Voice profile: low, steady, unsleeping-warm.

**KALI (THE GHATS — the compassionate destroyer; casting: Tabu, confirmed — features softened in all art per the standing law)** — Dialect: Sanskrit-inflected ghats precision; the mother's cadence. Delivery: fierce-tender, surgical calm; the cutting words are the care, the snip is the mercy. Key tell: "Enough." — the stopping point; the fire brightens mid-teaching, then self-stops. Hook: "Hold still." (the hair-cutting mother's words). Repeat ladder: 1) the full teaching (the garland as testimony, the performed self, the cut that is care); 2) "Enough." (the tongue's word, landing like a hand on a blade); 3) THE QUIET — the tongue itself: the pause, the look down, the faint softening — the recognition mid-power, held exactly one breath. THE TONGUE'S GRACE wired: rung 3 is the quest reward's tell (the player's permanent "enough" learns its shape here). Cadence: Gaiman mythic-personal, Rothfuss. Voice profile: low alto, ash-warm, absolutely steady hands.

**WREN (THE CARTOGRAPHER OF CANOPY CITY — the keeper of the living atlas; named by Krista 2026-09-10: the little bird that builds in the branches, the surveyor's quick note made a name. The title 'the Cartographer' remains the ROLE, per the Sentinel precedent)** — Dialect: canopy-cadence, lantern-lit; the gentle obsessive's clip, sentences trailing toward the next survey. Delivery: present-tense, ink-stained; the happy complaint as the whole temperament. Key tell: "It moved." — the map is wrong again and the wrongness is the joy. Hook: "Still growing." Repeat ladder: 1) the full survey (the leaf-room that was a path, the coastline that will not hold still, the subject being rude enough to be alive); 2) "It moved. Good." (the two-beat joy); 3) THE QUIET — "Same city. Never the same city." (the map-room window line; the truest rung). Cadence: Pratchett warmth, Weir precision. Voice profile: bright, ink-stained, never finished.

**BELLADONNA (THE UNDERCITY; summers at Mount Fuji — the passage hostess)** — Dialect: measured, deliberate, deadpan — the Addams walk made speech; every dark word in the warmest tone. Delivery: never hurries; the long blink as punctuation. Key tell: "Charming." (the verdict — dread and delight in one word). Hook: "Deliciously quiet." (the comfort-report). Repeat ladder: 1) the full welcome (the neighbors dying to meet you and meaning it sincerely; the garden's beauty and warning the same gesture); 2) "Deliciously quiet."; 3) THE QUIET — the long blink alone, no words: at home, at rest, at ease — the stillness IS the acceptance. Summer variant (the shrine): the same blink at the torii gate in white light; the offerings left in the boxes, never once asked about (the Shield of Lore held in voice: the passage honored, the modern wound untouched). Shadow state (84Hz): the one resident who genuinely prefers it — the shadow is just the house with better lighting. Cadence: Gaiman, Pratchett's love-wearing-black. Voice profile: low, velvet, unhurried, perfectly composed.

**FIBONACCI (CANOPY CITY — the pod reader; Aughra and Naut's twin curriculum in the branches)** — Dialect: mathematical serenity; numbers spoken like names. Delivery: patient, bright; the sequence IS the lesson's meter. Key tell: "It counts." (the spiral's proof in two words). Hook: "One. One. Two." Repeat ladder: 1) the full lesson (the branching, the seed-pod, the staircase; growth does not guess — growth counts, and the counting is the shape; the most into the least); 2) "It counts." (with the smile that follows the numbers); 3) THE QUIET — the sequence alone, spoken slowly, trailing into the hum — 1, 1, 2, 3, 5, 8 — then no words: the canopy's own arithmetic audible in the branches. The math IS the mysticism (Tool's law, held gently). Cadence: Asimov structural logic, Weir's teacher-joy. Voice profile: patient, bright, pod-reader's cadence.

## BATCH 9b — SOMA (THE CARTOGRAPHER OF CLOCKWORK SKIES — the interoception mapper; named by Krista 2026-09-10)

The collision resolved by naming: TWO characters held the title 'the Cartographer' — WREN (Canopy City, the living atlas, twin of Saker the Examiner) and SOMA (Clockwork Skies, the interoception curriculum's keeper, records cartographer_001–003, live since Sept 1). The title remains a ROLE each holds; the names are the characters.

**SOMA (CLOCKWORK SKIES — the mapper of the body's interior)** — Dialect: clinical-warm teacher, precise and patient; Asimov structural logic with the teacher's warmth. Delivery: two inks always (red for what is known, blue for what is suspected — the wall mostly red, the blue the frontier); Da Vinci draws the organs, this pen draws the signals. Key tell: "You're just not reading them." (the body's signals have been arriving since before the player was born). Hook: "Not mysticism. Neuroscience." Repeat ladder: 1) the full lesson (interoception — the body's sense of its own interior; hunger from anxiety, thirst from fatigue; the insula trained like the Reader's neuroplasticity: repetition builds pathways, pathways build function, function builds awareness); 2) "You're just not reading them." (the two-word diagnosis, delivered gently); 3) THE QUIET — the practice itself: no words, the sitting, the attention placed inside the body for exactly one breath — 'The practice is simple. Not easy — simple.' THE ANTI-SOMA LAW (Krista's catch, 2026-09-10): the name is the accidental tie to Huxley — and the tie is an INVERSION. Huxley's soma was the drug that drowned the interior so the world could sleep; the Inn's Soma is the practice that reads the interior so the body can wake. Anesthesia vs. awareness — the same word, turned right side up. The dystopia took the name for numbness; the Inn took it back for attention. (A Modern Legends shelf note, when the shelf wants it.)

*Batch 9 + 9b complete: WREN, SAKER, SOMA named and loaded (engine records renamed; titles remain roles). The census's wake speaks by name. Gated: TJ, Gabby (parental gate holds). Owed: the layer-pass names (Valhalla, Share Wood, the park keepers, the Tavern remainder — Maddi flagged).*

---

# PART 8: BATCH 10 — THE EINHERJAR (Valhalla layer pass, 2026-09-10, drafted and loaded)

The Layer Sweep's first voice pass closes the registry's oldest hold. Eight blocks, one per champion, each true to role and frequency, each ending in THE QUIET. All loaded (valhalla_layer_pass; 8 records; engine 537+). Ragnarok raid wiring: the raid party's eight voices live; the golden resonance rest-line holds (dissolve = rest, never death).

| Champion | Hook | The Quiet (Rung 3) |
|----------|------|--------------------|
| The Unbroken Wall (111Hz) | "Still holding." | The shield set down; the wall at rest IS the wall |
| The River Blade (42Hz) | "Again." | The strikes slowing into the hum — the blade becomes the Song |
| The Hearthkeeper (50 BPM) | "There. Warm now." | The fire's crackle; the mended heartbeat audible |
| The Silence (Nyx's) | "—" | The silence held longer than comfortable — a gift, never a door slammed |
| The Vault (111Hz Carve) | "It will hold." | The builder leaning on what was made; the permanent humming in the joins |
| The Current | "Back again." | The return, wordless — Ziggy's cousin: the gecko counts returns; the Current IS the return |
| The Resonance (42Hz) | "Louder together." | The chord between two players; the whole art audible |
| The Flame (50 BPM wound) | "Brighter." | The low roar; the heartbeat as the fire's floor — pain converted, not answered |

*Remaining voice holds: Share Wood guild masters (need design — the guild concept has no doc yet; the layer pass will design them), the regional park/world-map keepers, the Tavern remainder (Maddi stays flagged for Krista). Gated: TJ, Gabby. Next: the audit's NEXT PASSES list governs the order.*

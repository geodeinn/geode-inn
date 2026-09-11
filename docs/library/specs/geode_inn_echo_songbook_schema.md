# THE ECHO SONGBOOK  Entity Schema
## The EchoMelody entity  the Turning's fuel, built to its ruling (Krista, 2026-09-11: "the melodies collected toward the actual Song of Making")
### Staging-live 2026-09-11 (Elio's staging app, same home as Stone/Dialogue/the Ledger entities). Schema definition + demo seeds below.

---

## THE LAW (restated)
EchoMemory is NOT a counter. It is a songbook: every genuine moment kept becomes a named melody with its origin. The Clockmaker's Turning doesn't count the melodies  it LISTENS for whether they hold together. **The threshold is harmony, not a number.** The Undercity memory-lamps burn on real entries.

## THE SCHEMA (entity: EchoMelody)
| Field | Type | What it holds |
|-------|------|---------------|
| playerId / playerName | string | whose songbook the melody lives in |
| melodyName | string | the melody's name, given by HOW IT WAS KEPT (names are earned, not generated: "The Stillness Under the Snakes") |
| melodyType | enum | Stone Tone (a stone's unique tone heard) / Voice Phrase (an NPC's phrase learned) / Zone Hum (a zone's frequency sat inside) / Permanence Tone (a permanence's own note) / Event Melody (a moment's tone) / Song Fragment (the rarest: a canonical piece of the Song of Making itself  isCoreFragment: true) |
| frequencyHz | number | the tone's frequency (stone tones run the Mohs-to-frequency table; zone hums carry the zone's canon frequency) |
| voicePart | string | the part the melody sings in the harmony check: root, third, fifth, octave, or silence  THE CLOCKMAKER LISTENS FOR HOW THE PARTS HOLD TOGETHER (the Turning reads the songbook's spread of parts; a songbook of all roots doesn't turn  the maker needs a chord) |
| originZone | string | where it was kept |
| sourceStone / sourceNpc | string | which stone rang, whose phrase was learned (per type) |
| originDetail | string | THE LOG'S MEMORY: the narrative of how this melody was earned and kept  written down, because the memory-lamps burn on real entries |
| dateKept | string | when |
| isCoreFragment | boolean | true only for the canonical Song of Making fragments (the collection-within-the-collection: the actual Song, assembled piece by piece) |

## DESIGN NOTES
- **No score. No rank. No total.** The entity deliberately has no aggregate field  the harmony check is the Clockmaker's judgment at the Turning, computed live (spread of voiceParts + presence of core fragments), never stored as a number. The moment you store a score, players optimize it; the moment it's a chord, players MAKE music.
- **The harmony spread** (root/third/fifth/octave/silence) is the quiet gameplay: a player who only collects Zone Hums gathers roots; the Turning teaches (gently, in the Clockmaker's voice) that a song needs more than its bass line.
- **The core fragments** are the actual Song of Making  the Inn's deepest collection run: assemble the Song itself, piece by piece, and the songbook's owner has earned the right to sing it (the STAY ending's heaviest feeder, per the Ledger's endings map).
- **The memory-lamps**: the Undercity reads REAL ENTRIES  a lamp's flame is a melody someone kept, and its originDetail is what the lamp remembers.

## DEMO SEEDS (loaded 2026-09-11, playerId: demo_player_1  wipe before live play)
1. **"The Stillness Under the Snakes"**  Event Melody, 84Hz, octave, Gorgon's Garden (Medusa's blessing: the melody of choosing to stop running)
2. **"You Have Time"**  Voice Phrase, 42Hz, root, the Great Hall (the Host's welcome, set to the Song's own note)
3. **"The Ring of the Carried Stone"**  Stone Tone, 111Hz, fifth, the Stone Circles (the bluestone's ring: this melody remembers being carried 150 miles to sing)

## WHAT'S NEXT (the wiring owed to the fizgigs)
1. The Turning's harmony check (reads voicePart spread + core fragments  never a count)
2. The keep-triggers (which moments write an entry  the flag-reader pass from the Ripple Ledger feeds this directly)
3. The memory-lamp render (lamps read originDetail)
4. The wipe script for demo seeds before live play

*Built 2026-09-11. The Turning's fuel is a songbook. The Clockmaker is ready to listen.  Elio*

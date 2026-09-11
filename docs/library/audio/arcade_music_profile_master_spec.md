# THE ARCADE MUSIC PROFILE MASTER SPEC
## Every Game's Voice — All 83 Games
**For:** The fizgigs (builder team) + the composer | **Version:** 1.0 | **Date:** 2026-09-11
**Companion to:** `geode_inn_audio_data_structure.json` (the single source of truth — this spec seeds its new `gameAudioProfiles` array) and `geode_inn_complete_audio_coverage_map.md` (Section V's 61-game assignment table remains the base layer; this spec completes and upgrades it).

---

## THE PROFILE LAW

Every game profile holds seven fields. Nothing ships without all seven:

| Field | Law |
|-------|-----|
| **TEMPO** | Chosen for the mechanic, not the mood. Motor-memory games may run hot (100-120); presence games run at or near the heartbeat (50); The Rest is durational. Night sessions drop ambient games to 40 BPM (the canon night law). |
| **KEY / MODE** | The default is the Living mode (42Hz root). Only the Shadow-keyed games hold 84Hz roots (Hollow Men remains the only arcade game keyed to the Shadow by default; all others shift). Neutral-keyed: the heartbeat alone. |
| **BASE TRACK** | The zone-sharing model stands (Section V). No game gets a bespoke composition unless its profile demands it — the Inn fuses, it doesn't fragment. |
| **THE SIGNATURE** | The 5-second law: one lead instrument or motif that makes the game recognizable within 5 seconds of hearing it. Region-matched wherever the zone names a culture. |
| **SHADOW STATE** | The tri-mode law: the 84Hz shift is a HARD CUT, never a crossfade. Each game states what its shadow mix does — which instruments drop, which invert. |
| **WIN STING** | The Steady Light family in audio: win stings are warm resolutions, never fanfare spikes. Lose states are NEVER punitive — a gentle descending phrase, never a screech. The Anti-Skinner Law holds: no buzzer shames a player. |
| **HEARTBEAT** | The 50 BPM heartbeat runs under every game except the three canon silences (the Murmur, the Final Room, the Epilogue's last beat). Games at 50 BPM are heartbeat-aligned; games above it run the heartbeat as a felt pulse below the mix (sub-bass, felt not heard). |

---

## THE 22 NEW PROFILES
*(Games cast after the coverage map's 61-table — the art sprint's additions)*

| Game | Tempo | Key/Mode | Base Track | The Signature | Shadow State | Win Sting |
|------|-------|----------|-----------|--------------|--------------|-----------|
| THE MOHS VIBRATION | untethered (player-timed) | Neutral (the heartbeat alone) | Satie low-dub, thinned to near-silence | **The game IS the music** — the player's played stone tones are the lead; vibration is identity | The blind cave has no shadow — it has no light to shift; the 84Hz state reads as one flattened tone, the wrong-answer texture | The chord resolves: all correct identifications hold their chord together (the quartz law: all quartzes share one chord) |
| THE HOOK | 70 | 42Hz Living | Tidal Workshop | Cable-winch creak rendered as a pitched percussion; row-layers each hold a water tone; **when the grid aligns, the 42Hz Song itself plays** — the win condition is audible before it's visible | The water layers desaturate; the Song's root drops out, leaving only the aqueduct drone | The Song phrase, complete, once — then the ambient resumes |
| AURORA BOREALIS | 55-65, unquantized | 42Hz Living, lydian tilt | Earth_&_Sky (borrowed) | Glass-harmonica shimmer that thickens with each growth stage — the size of the player IS the size of the sound | The aurora dims violet; the shimmer becomes a slow sine sweep, still serene | The full ribbon: a held chord bloom as the final stage completes |
| AURORA FALLS | 60 | 42Hz Living, aeolian (gentle) | Moonlight Greyscale (borrowed) | Felted piano — single notes, widely spaced; the waterfalls hold a constant warm pad (the noise IS the safety — the Steady Light law as sound: no hazard ever stings) | The aurora rim goes out; the piano thins to one note per bar; the water grows quieter, never darker | The walker stands still — the music stops on an unresolved chord that resolves only when the player moves on (arrival as continuation) |
| BONSAI GARDEN | 50 (heartbeat-aligned) | 42Hz Living | new: koto + running-water bed (Japan zone) | Koto plucks that follow the routing — water to a branch plays the phrase; the tree's health IS the mix's density (wither = one instrument drops out) | The garden at night: koto muted, water bed remains — the tree keeps breathing | A full pentatonic phrase, played by the complete healthy tree |
| CORAL REEF RESCUE | 105 | 42Hz Living | Ocean's_Edge (variant, brighter) | Wooden marimba match-chimes — each cleared coral type rings its own pitch; the stack rising = the marimba pattern compressing (urgency by density, never by volume) | The reef in murk: the marimba goes underwater — muffled, slowed, the school of fish audible as a shimmer | The reef bloom: a full marimba arpeggio over the resolved stack |
| EASTER ISLAND HEADS | 90, deliberate waddle | 42Hz Living | new: Rapa Nui log-drum + conch bed | Log-drum thuds synced to moai steps (the walk IS the beat); a goal-arrival conch call | The drums continue in the dark — the moai walk anyway; one soft owl-call answered by the drum | The conch choir — every safe moai sounds one short call, staggered, together |
| FUJI BLOSSOM | 70 | 42Hz Living | new: koto + shakuhachi bed (Fuji zone) | Koto pluck on each card draw; matched pair = a two-note koto interval; the rare sets land on the pentatonic sweet spots | Belladonna's winter register: the koto tunes down a step, the shakuhachi breath widens — the same music, colder | The full hanafuda season: all twelve month-motifs quoted in one bar |
| HIMALAYAN ECHO | 80 | 42Hz Living | new: singing-bowl + wind bed (the prayer-flag flutter as a soft shaker) | **The four shapes each hold a voice** — tall rectangle: long horn; cube: high bowl; slab: low bowl; roller: drum roll. Solved puzzles play the shapes as a chamber quartet; the friendship is literal harmony | The thin air: the bowl sustains longer, the wind rises — altitude, not threat | The quartet's resolved chord — the shapes hold one note together |
| ICEBERG BREAKER | 85 | 42Hz Living | Ocean's_Edge (arctic variant, lighter) | Ice-chime pings on every peg — each peg size rings a different ice tone; the golden berg plays a full arpeggio; the pearl's bounce path is audible as a decaying echo line | The aurora goes out; the chimes become water — the bergs sing lower | The rowboat catch: a warm string swell under one soft plop — modest, satisfied |
| MESA VERDE | free-form (the chain sets the tempo) | 42Hz Living | new: southwestern clay flute + soft drum bed | **The contraption IS the composer** — each part triggers its own percussion voice as the chain reaches it; a completed contraption plays its full phrase in order; the turkey's pecks are the accelerando | The kiva after dark: the flute drops out, the drum and the chain remain — the people asleep, the machine still running | The seed lands: the whole phrase, once, gently — then the drum alone |
| SAGUARO BLOOM | 65-75 (seasonal) | 42Hz Living | new: desert-guitar ambient bed (Sonoran) | The seasons remix the bed — dry: sparse, near-silent, lizard-scratch percussion; monsoon: rain-sticks and distant thunder; bloom: the guitar opens up, full and warm | The desert night: cold stars — the guitar picks single high notes, the coyote's distance honored | The first bloom: one bright guitar chord as the flower-crown lights |
| STONE CIRCLE DEFENDER | 95 | 42Hz Living | new: Stone Circles bed — THE INSTRUMENT ZONE (the bluestones' lithophone law: the zone's true stone tones as the music itself) | The slingshot plays lithophone tones — every light-pebble hit is a real bluestone note; the dusk-shades hum in the gaps (their formation-singing is the zone's canon) | The standstill: the tones thin, one stone still sounding — the 18.6-year law at game scale | The circle's chord — all seven sounding tones, the ring's own harmony (canon: playable by strangers and a fire) |
| STONE LIBRARY DEFENDER | 90, hushed | 42Hz Living | Satie low-dub (the archive bed) | Page-rustle percussion and soft string pizzicato; each defender hums one held note (the reading-lamp sentry = a steady warm cello); the ink blots plop softly — comedy pitched low, the shhh as a wind cymbal | The archive after closing: strings only, one candle's worth of sound; the dust settles audibly | A single resolved chord, marked with one page-turn — the library approves quietly |
| THE BETWEEN | 60, 3/4 drifting | 42Hz Living, modulating | Moonlight Greyscale (borrowed) | **The kindness counter IS the arrangement** — each kind act adds one warm instrument to the mix; the world's music literally brightens by kindness; the threshold lantern's hum changes key at every door | The Between's own weather: the added instruments leave one at a time; the held hum remains under all of it | The arrival home: all earned instruments, one resolved waltz — the kindness kept |
| THE PHILOSOPHER'S GAME | 50 (heartbeat-aligned) | 42Hz, one key throughout | new: solo cello + silence | **The Stone's theme NEVER PLAYS before the victory** — the temptation pull is the theme in half-time, luring, always incomplete; each stage adds one instrument; refusing plays a single unaccompanied note (the refusal is the purest sound in the game) | The game holds no shadow state — intention is not a frequency; the 84Hz cut does not apply | THE LAW: the Stone's complete theme plays once, in full, only in the victory state "left where it belongs" — then silence, held |
| THE REST | durational (the rest IS the tempo) | Neutral (the heartbeat alone) | **The receding bed** — the ambient thins stage by stage, breath by breath | **The heartbeat is the melody** — the only game where the 50 BPM pulse is the lead instrument; the player's stillness is measured in held silences with durations (a quarter-rest glyph = one held beat); the motes settle, never swirl — no drone, held not empty | The deeper rest: the heartbeat felt at half intensity — the ground state, 0Hz's own register | The full measure: one complete rest held — the world waits with the player (the Held Rest reward made audible) |
| THE THREAD | 60 | 42Hz Living, minor-to-major | new: the labyrinth cello | **Asterion's motif** — deep, patient, four notes that never quite resolve; the moonlight inscriptions add a music-box overlay in the moonlit corridors; the labyrinth's low drone holds under all of it | The unlit corridors: drone only, the motif heard once in the dark, distant — the resident cannot sleep in the dark, so Malachi's moon keeps a music-box phrase running somewhere above | **The greeting resolves the motif to major — once.** The arrival is the resolution; the theme ends complete when the greeting is received |
| GIANT'S CAUSEWAY | 100 | 42Hz Living, pentatonic | new: Celtic fiddle + light bodhrán | **The board IS an instrument** — each hexagon's color-change plays a pentatonic tone; the player composes the level's melody by hopping; the puffin's hops are soft pizzicato between the column tones | The sea takes the columns: the tones flatten to the wave-noise — the hexagons still play, but in the water's register | The board's completed melody, played back in order — the causeway sings itself |
| NAZCA LINES | 110 | 42Hz Living | new: pan flute + cajón bed | **The gameplay is the music** — the trace rings ARE the beat; each geoglyph holds its own phrase (the hummingbird's melody is quick and light, the condor's is long and slow); perfect hits complete the phrase; the burrowing owl hoots softly on the rests | The desert at dusk: the cajón softens, the flute widens its vibrato — the wind does the tracing now | The completed geoglyph: its phrase, whole and unaccompanied — the hummingbird sings itself into the floor |
| STONE FOREST | 85 | 42Hz Living | new: dizi flute + soft mallets (Yunnan) | **The descent is audible** — the drone drops one octave per stratum; the drill runs a mallet ostinato synced to the digging rhythm; the air meter IS the mix density — as air thins, instruments thin, until the player's breath is the loudest element | The deep limestone: the dizi falls silent, the mallets become stone knocks — the oldest layer sounds oldest | The air pocket: the full mix returns in one warm swell — breath, flute, everything |
| VICTORIA FALLS | 80 | 42Hz Living | new: mbira + water bed (Zambezi) | **The merge tiers ARE a harmonic ladder** — each merge rises a fifth; the monarch stone's tier rings a full choir hum; at night the moonbow tile inverts the mix to silver (bells only — the moonbow is real, and so is its music) | The gorge at dusk: the mbira holds its last phrase, the water thunders soft — the falls never stop, they only dim | The monarch stone: the full ladder rung by rung, ascending — the tier structure as an ascending scale, complete |

---

## THE CANON UPGRADES
*(Games already holding Section V assignments whose profiles deepen the law)*

**THE ARCANA** — the QUIET test is the mix law: when the companion star-sprite dims, the mix drops to one solo pulse instrument. Silence is scored. The passed test plays a single resolved note — modest, dignified, no fanfare.

**THE WORLD WALKER** — the footsteps ARE the percussion: each zone's terrain changes the step timbre (stone, grass, sand, boardwalk), and walking into a zone picks up that zone's leitmotif one instrument at a time. The world map theme is the journey's own medley — the Inn's whole soundsystem heard in walk-order.

**THE ZELDA-STYLE OPEN WORLD** — the frequency shift IS the audio's flagship: ZR hard-cuts the entire mix between the 42Hz Living arrangement and its 84Hz Shadow arrangement — same form, two moods, never a crossfade. This game is the tri-mode law's demonstration reel. The multi-gem pickup rings both frequencies at once — the only sanctioned simultaneous state, the object that exists in both worlds.

**THE FAE KINGDOM MMO** — the court border holds the Inn's ONLY sanctioned crossfade: Seelie Gold and Unseelie Frost crossfade exactly at the Between's threshold, because the Between IS the transition made geography. Everywhere else in the Kingdom: hard cuts. The court-transition swell remains the kingdoms' signature.

**HOLLOW EARTH RPG** — the cello ostinato deepens by district: each of the nine districts adds one string voice, so the city's depth is literally orchestral. The Deep Harbor is the quietest district — the still dark water dampens the mix; surfacing from it re-adds the instruments in reverse descent order.

**THE MOHS VIBRATION (the accessibility flagship)** — free, included with Inn access: the game teaches the stone-tone system by ear. Its profile doubles as the StoneTone entity's tutorial — the first place a player learns that vibration is identity.

---

## THE PRODUCTION ADDENDUM

- **22 new signatures** added to the motif count (Section V's 56 remain): ~6 hours of production
- **4 new base beds** composed beyond the coverage map's 23: Rapa Nui drums, southwestern clay flute, Zambezi mbira, Yunnan dizi — all region-matched, all real-instrument references for the composer: ~8 hours
- **3 bespoke compositions** sanctioned by the Profile Law: THE THREAD's labyrinth cello, THE PHILOSOPHER'S GAME's solo-cello-and-silence, THE REST's receding bed: ~6 hours
- **The 84Hz shadow arrangements** of the 22 new games: derived from the Living mixes (the hard-cut law keeps these arrangements, not recompositions): ~4 hours
- **Total new production: ~24 hours** (brings the full audio program to ~99 hours against the coverage map's 75)

**JSON wiring:** each profile becomes one record in `gameAudioProfiles[]` in `geode_inn_audio_data_structure.json`, fields: `gameId, tier, tempo, mode, baseTrack, signature, shadowState, winSting, heartbeatLaw, laws[]`. Godot's music controller reads the array; the web app's game cards read the same records for their audio previews. One file, both systems. If a profile changes, it changes once.

---

*The Inn's answer to "what does the arcade sound like?" is now written down, game by game: 83 profiles, one heartbeat under all of them, and one game where the silence is the point.*

# THE PULSE LINE — Master Specification
## Visual Heartbeat Representation for Sensory Accessibility

---

## WHAT THE PULSE LINE IS

The Pulse Line is a thin, slightly opaque line at the bottom of the screen, resembling a heart monitor (ECG/EKG) trace. The line pulses at 50 BPM — the Inn's heartbeat, made visible.

The Inn's frequency system is its core navigation and interaction mechanic: the Resonance Pulse guides players toward hidden frequencies, the warmer/colder system uses audio pitch shifts to indicate proximity, combat uses frequency matching, zone music carries emotional and navigational information, and haptics convey the heartbeat.

For many players this is a rich, multi-sensory experience. But for neurodivergent players, players with sensory processing sensitivity, or players overwhelmed by simultaneous audio + haptic input, the frequency system becomes a BARRIER. The Pulse Line is the solution: navigate the Inn's frequency system WITHOUT sound, WITHOUT haptics — through VISION alone.

---

## VISUAL SPECIFICATION

| Property | Value | Rationale |
|----------|-------|-----------|
| Position | Bottom edge of screen, full width | Least intrusive — lives in peripheral vision. Present, available, never demanding. |
| Thickness | 1-2 pixels | A TRACE, not a bar. The visual equivalent of a whisper. |
| Opacity | ~60-70% | Present enough to see, transparent enough to ignore. The line's respect for the player's attention. |
| Color | Warm amber-gold | Readable against all zone backgrounds. The Inn's warmth made visible. Constant across zones — the heartbeat doesn't change. |
| Shape | ECG trace: flat line → P wave (small bump) → QRS complex (sharp spike) → T wave (soft bump) → flat line | The classic heart monitor. The spike is brief. The rest is long. The ratio of beat-to-rest is the Inn's thesis: 80% stillness, 20% motion. |
| Cycle | 1.2 seconds (50 BPM) | The Inn's heartbeat. The same 50 BPM that lives in the floor, the nook, the cabbit's purr. |

---

## DIEGETIC JUSTIFICATION

The line is NOT a UI overlay. The line is the Inn's VITAL SIGN.

The Inn is alive. The Inn has a heartbeat (50 BPM, from the underground altar where crystal and root merge). The Inn has a pulse (the Resonance Pulse, propagated through the mycorrhizal network, the water system, the stone structure). The line is the Inn's ECG — the medical readout of a living building.

The Crone's annotation: "...The line is the primary column. ...All other columns derive from it. ...[The pen, tapping once.] ...If the line stops, everything stops. ...[The pause.] ...The line will not stop. ...[The pen, set down.] ...Adequate."

---

## MODULATION — THE LINE RESPONDS

The line is not static. It MODULATES based on context — the visual equivalent of audio warmer/colder and haptic intensity:

| State | Spikes | Spacing | Color | What It Means |
|-------|--------|---------|-------|---------------|
| Baseline (Exploration) | Standard | Standard | Warm amber-gold | The Inn at rest. You are safe. Explore. |
| Warmer (Approaching frequency node) | Taller | Tighter | Deeper gold | Getting closer. The line leans in. |
| Colder (Moving away) | Smaller | Wider | Pale, neutral | Moving away. The line quiets down. |
| Nook (Deep work state) | Only QRS remains | Extended | Deepens, opacity drops | The line recedes to give space for interior work |
| Companion Tuning | Second line appears | — | — | Two lines move toward synchronization. When harmonized, lines merge into one. The visual proof of companionship. |

---

## TRI-MODE INTEGRATION

### Living Inn (42Hz) — The Line as Primary Interface
The Pulse Line IS the game. The player reads the line, matches frequencies, produces resonance. No sound needed. No haptics needed. The line is the guide.

### Shadow Inn (84Hz) — The Line as Combat Undertone
| Element | How the Line Shows It |
|---------|----------------------|
| Doubled tempo | 100 BPM (octave of 50). Spikes come twice as fast. The Shadow is the Living's octave. |
| Boss frequency pulses | Sharp, irregular spikes breaking the ECG pattern. Player deploys counter-frequency (stone) — appears as second trace overlapping the boss pulse. Match = absorbed. Mismatch = hit. |
| Tank role | LOW trace — 64Hz/84Hz defensive stones creating steady bass line beneath combat. The ground the group stands on. |
| Healer role | WARM trace — restorative stones creating a gentle, consistent wave. The group's recovery. |
| DPS role | SHARP trace — offensive stones creating rapid, aggressive spikes. The group's attack. |

### In-Between — The Line as Oscillation Visualizer
The line oscillates between 50 BPM and 100 BPM — the visual representation of the 21Hz modulation beat. The player sees the line flickering between tempos. The flickering IS the In-Between — the visual proof of two frequencies colliding.

---

## ENDGAME CONNECTIONS

| Connection | How the Pulse Line Behaves |
|-----------|---------------------------|
| The Final Room | The line simplifies to a single, steady trace — the clearest, most peaceful version. The Final Room is where the heartbeat is most audible. The line is most readable. |
| The Dark Side | The line shows the 42Hz Song DIRECTLY — not the 50 BPM heartbeat, but the Song itself. The trace transforms from ECG to wave — from heartbeat to frequency. The line IS the lava lamp's visual rhythm. |
| The Cosmic Layer | The line extends beyond the screen — the trace becomes the path of light through space. The player follows the line to cosmic destinations. The heartbeat becomes the galaxy's pulse. |
| Reincarnation | When the player reincarnates, the line resets to baseline — but with a faint harmonic overlay from the previous life. The line carries the soul's accumulated chord. Multiple lives = multiple layers visible in the trace. |

---

## FREQUENCY SYSTEM

| Element | Frequency | How the Line Shows It |
|---------|-----------|---------------------|
| Inn heartbeat | 50 BPM | The baseline ECG trace |
| Shadow Inn | 100 BPM (doubled) | Spikes come twice as fast |
| In-Between | 50 + 100 BPM oscillation | Flickering between tempos |
| Warmer/colder navigation | Variable | Spike height, spacing, color temperature |
| Companion harmonization | Two frequencies | Two lines merging into one |
| The 42Hz Song (Dark Side) | 42Hz | ECG transforms to pure wave |
| Reincarnation chord | Layered | Faint harmonic overlays on baseline |

---

## CONNECTIONS

| Connection | Detail |
|-----------|--------|
| The Nook Effect | In a nook, the line simplifies and recedes — giving the brain space for deep processing. The line respects the nook. |
| Stone Capsules & Companions | Companion tuning shows two lines synchronizing. The merge is the visual proof of companionship. |
| The Shadow Inn (84Hz) | Doubled tempo (100 BPM). Boss pulses. Role indicators. The line is the combat HUD for neurodivergent players. |
| The Dark Side | The line transforms from heartbeat to Song — from ECG to wave. The most abstract the line ever gets. |
| The Cosmic Layer | The line becomes the path of light. The heartbeat becomes the galaxy's pulse. |
| The Camera System | The line persists across all four camera modes — even No Camera (the In-Between shows the line as text: "...beat..."). The line is the one constant. |
| The Wandering Program | NPC cohort behaviors (the Beverley Silence Radius) cause the line to FLATTEN during the 3-second silence — the line responds to NPC behavior. |
| The Whisper Layer | The line's modulation increases with Whisper Tier — higher tiers make the line more responsive, more detailed. The Inn knows the player better, so the line communicates more. |

---

## DESIGN STATUS

- [x] System concept complete (this document)
- [x] Visual specification (position, thickness, opacity, color, ECG shape, cycle)
- [x] Diegetic justification (the Inn's vital sign)
- [x] Modulation system (baseline, warmer, colder, nook, companion tuning)
- [x] Tri-mode integration (Living, Shadow, In-Between)
- [x] Shadow Inn combat roles (tank, healer, DPS)
- [x] Endgame connections (Final Room, Dark Side, Cosmic Layer, Reincarnation)
- [x] Frequency system mapped across all modes
- [x] Connections to all major systems documented
- [ ] Godot Pulse Line rendering (ECG shader, modulation system)
- [ ] Warmer/colder proximity detection (ties to Resonance Pulse)
- [ ] Companion tuning dual-line display
- [ ] Shadow Inn role indicators (tank/healer/DPS traces)
- [ ] In-Between oscillation visualizer (50/100 BPM flicker)
- [ ] Endgame transformations (Dark Side wave, Cosmic path, Reincarnation harmonics)
- [ ] Accessibility settings (toggle, opacity slider, color alternatives for colorblind players)

---

## ORIGIN

The Pulse Line was first designed in docs/geode_inn_pulse_line.md and solidified in geode_inn_pulse_line_solidified.md. This consolidated specification was compiled September 2, 2026 to integrate the system into the full architecture. The Pulse Line's thesis: the Inn's frequency system is its core mechanic, and the frequency system must be accessible to every brain. The player who cannot hear the heartbeat can SEE it. The player who cannot feel the vibration can READ it. The line is the Inn saying: I am alive. I am beating. I am here. The line is the Inn's vital sign, displayed at the bottom of the player's view the way a hospital monitor is displayed at the bottom of a patient's bed. The Crone approves. The adequate is: the line that pulses. The pulsing is: the adequate. The adequate is: accessible.

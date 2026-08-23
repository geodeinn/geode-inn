# Geode Inn — The Pulse Line
## Visual Heartbeat Representation for Sensory Accessibility

---

## The Problem

The Inn's frequency system is its core navigation and interaction mechanic:
- The **Resonance Pulse** (50 BPM heartbeat) guides players toward hidden frequencies
- The **warmer/colder** system uses audio pitch shifts to indicate proximity
- **Combat** (Harmonization) uses frequency matching — hearing the enemy's dissonance
- **Zone music** carries emotional and navigational information
- **Haptics** convey the heartbeat, the forge's impacts, the cabbit's purr, the Arcana's gearwork

For many players, this is a rich, multi-sensory experience. But for neurodivergent players, players with sensory processing sensitivity, players with auditory processing differences, or players who are simply OVERWHELMED by simultaneous audio + haptic input, the frequency system becomes a BARRIER instead of a guide. The Inn is designed to be neuro-accessible — the 50 BPM sway rate, the Nook Effect, the no-deadline philosophy, the anti-FOMO patience. But if the Inn's core mechanic requires audio and haptics to navigate, the accessible design is undermined by the INPUT method.

The player who is overwhelmed by sound — the music, the heartbeat audio, the Pirate's drum, the cabbit's purr, the forge's ring — needs a way to navigate the frequency system WITHOUT sound. The player who is overwhelmed by touch — the controller vibration, the haptic heartbeat, the forge's impact — needs a way to navigate WITHOUT haptics. The player who is overwhelmed by BOTH needs a way to navigate with NEITHER.

---

## The Solution: The Pulse Line

A thin, slightly opaque line at the bottom of the screen, resembling a heart monitor (ECG/EKG) trace. The line pulses at 50 BPM — the Inn's heartbeat, made visible.

### Visual Specification

**Position:** Bottom edge of the screen, spanning the full width. The bottom is the least intrusive position — the player's focal attention is typically centered or upper. The line lives in peripheral vision: present, available, never demanding.

**Thickness:** 1-2 pixels. A TRACE, not a bar. The line is the lightest possible visual cue — the visual equivalent of a whisper.

**Opacity:** ~60-70%. Present enough to see, transparent enough to ignore. The player who doesn't need the line can look past it. The player who needs the line can look down. The opacity is the line's RESPECT for the player's attention — the line doesn't demand to be seen. The line is available to be seen.

**Color:** Warm amber-gold. The Inn's cozy aesthetic color. Readable against all zone backgrounds (the ochre of the Desert Bone, the blue of the Aegean Light, the green of the Canopy City, the sky-blue of the Clockwork Skies). The amber-gold is WARM — the line is the Inn's warmth, the visual equivalent of the Host's calm authority. The color doesn't change between zones. The heartbeat doesn't change between zones. The line is the one CONSTANT — the steady pulse beneath every zone's variable surface.

**The ECG Shape:** The classic heart monitor trace:
- **Flat line** — the rest between beats (approximately 1.0 seconds at 50 BPM)
- **P wave** — a small bump, the approach (brief, subtle)
- **QRS complex** — the sharp spike, the BEAT (the moment of contraction, ~0.1 seconds, the visual peak)
- **T wave** — a second, softer bump, the recovery (the beat fading)
- **Flat line** — the rest begins again

The full cycle at 50 BPM = 1.2 seconds. The spike (the beat) is brief. The flat line (the rest) is long. The visual ratio of beat-to-rest is the Inn's thesis in miniature: the Inn is mostly REST. The Inn is mostly patience. The beat is the exception. The rest is the rule. The player who watches the line sees that the Inn's heartbeat is 80% stillness and 20% motion — the visual proof of the anti-FOMO philosophy. The Inn is not rushing. The Inn is RESTING, with a pulse.

### Diegetic Justification

The line is NOT a UI overlay. The line is the Inn's VITAL SIGN.

The Inn is alive. The Inn has a heartbeat (50 BPM, from the underground altar where crystal and root merge). The Inn has a pulse (the Resonance Pulse, propagated through the mycorrhizal network, the water system, the stone structure). The line is the Inn's ECG — the medical readout of a living building, the same way a hospital monitor shows a patient's heartbeat.

The player who watches the line is watching the Inn's vital signs. The line is the Inn saying: I am alive. I am beating. I am here. The line is the most diegetic UI element possible — it's not a game interface, it's a MEDICAL INSTRUMENT, reading the Inn's pulse, displayed at the bottom of the player's view the way a hospital monitor is displayed at the bottom of a patient's bed.

The Crone would approve. The Crone, who measures everything, would see the line as the Inn's most fundamental measurement — the one that underlies all others. The Crone's annotation: "...The line is the primary column. ...All other columns derive from it. ...[The pen, tapping once.] ...If the line stops, everything stops. ...[The pause.] ...The line will not stop. ...[The pen, set down.] ...Adequate."

---

## Modulation — The Line Responds to Context

The line is not static. The line MODULATES — the trace changes shape, spacing, and intensity based on what's happening in the game. The modulation is the visual equivalent of the audio warmer/colder and the haptic intensity changes. The player who navigates by the line reads the modulation the way the audio player reads the pitch and the haptic player reads the vibration.

### Baseline (Exploration)

The standard 50 BPM ECG trace. Flat-spike-flat-spike-flat. Steady, patient, calm. The baseline is the Inn at REST — the default state, the state the Inn returns to when nothing is demanding attention. The baseline says: you are safe. The Inn is beating. Explore.

### Warmer (Approaching a Frequency Node)

When the player approaches a hidden frequency (a Resonance Pulse source, a stone frequency, a quest trigger), the line MODULATES:
- The **spikes grow taller** — the beats become more prominent, more visible. The line is "leaning in" — the visual equivalent of the audio pitch rising.
- The **spacing tightens slightly** — the beats come marginally closer together (not faster — the BPM stays at 50, but the P and T waves extend, filling more of the cycle with activity). The line is becoming "denser" — more visual information per cycle.
- The **color warms** — the amber-gold deepens toward a richer gold. The warmth is the visual "warmer" — the line literally gets WARMER in color as the player gets WARMER in proximity.

### Colder (Moving Away from a Frequency Node)

When the player moves away from a hidden frequency:
- The **spikes shrink** — the beats become smaller, less prominent. The line is "quieting down."
- The **spacing widens** — the flat line extends, more rest, less activity. The line is becoming "sparser."
- The **color cools** — the amber-gold fades toward a pale, neutral tone. The coolness is the visual "colder."

### Nook (Deep Work State)

When the player enters a nook (the deep work state, triggered by sitting and watching):
- The line **simplifies** — the P and T waves fade, leaving only the QRS spike. The trace becomes MINIMAL — just the beat, nothing else. The nook strips away the detail, the way the nook strips away the world's noise.
- The **opacity decreases** — the line becomes more transparent, more subtle, less present. The nook is about INTERIOR work, not exterior input. The line recedes to give the player space.
- The **color deepens** — the amber-gold becomes a warm, deep amber. The color of a candle in a dark room. The color of concentration. The color of being ALONE with a thought.

### Combat (Harmonization)

When the player enters combat (Harmonization — the non-lethal process of matching an enemy's frequency to reveal their true form):
- A **SECOND line appears** — a second trace, offset from the first, showing the enemy's frequency. The enemy's line is DISCORDANT — different BPM, different spike pattern, different rhythm. The two lines are OUT OF SYNC — the visual representation of dissonance.
- As the player HARMONIZES (matches the enemy's frequency), the two lines move toward SYNCHRONIZATION — the enemy's line shifts, the BPM aligns, the spikes begin to coincide. The visual process of harmonization is two lines becoming one.
- When harmonization is COMPLETE, the two lines merge into a single line — the enemy's frequency and the player's frequency are now the same. The merged line is CALMER than either line alone (the dissonance is gone, the two rhythms are one, the visual noise is resolved). The merged line is the visual proof of companionship: two beings, one rhythm.

### The Arcana (Sky Pirates' Ship)

When the player is aboard the Arcana:
- The line shows the gearwork heart's 50 BPM — the same as the Inn's, so the baseline looks identical.
- But the player who looks closely sees a **MECHANICAL overlay** — a subtle tick-tock pattern beneath the biological spike. The gearwork heart is CLOCKWORK — the mechanism has a precision that the biological heart doesn't. The line on the Arcana is the heartbeat with the clockwork visible — the biological and the mechanical, layered, the way the Arcana is the Inn's rhythm in a clockwork vessel.
- The overlay is the visual equivalent of the Pirate's statement: "Same heart. Different sky."

### The Cosmology Level (The Constant's Space)

When the player reaches the cosmology level:
- The line shows the starlight crystal's 50 BPM — again, the same frequency.
- But the line has a **crystalline quality** — the spikes are sharper, more geometric, the trace more angular. The crystal's pulse is PRECISE in a way that the biological and mechanical pulses aren't. The crystal doesn't soften. The crystal is the Song, and the Song is exact.
- If the cabbit is nearby, the line has a subtle **warmth modulation** — the cabbit's purr adds a low-frequency warmth to the trace, the way a purr adds warmth to a room. The cabbit's contribution to the line is the softest, most biological element on the cosmology level — the one warm thing in the cold.

---

## Accessibility Configuration

The line is part of a three-modality system. The player configures which modalities they use:

### Modality Options

1. **Audio** — the heartbeat, the warmer/colder pitch shifts, the zone music, the frequency cues. ON by default. Can be toggled OFF for players with auditory sensitivity or players who prefer visual navigation.

2. **Haptic** — controller vibration synchronized to the 50 BPM heartbeat, impact feedback (forge, combat), the cabbit's purr, the Arcana's gearwork tick. ON by default. Can be toggled OFF for players with tactile sensitivity.

3. **Visual (The Pulse Line)** — the bottom-screen ECG trace. ON by default. Can be toggled OFF for players who find any visual distraction overwhelming (players who navigate purely by audio, or by feel, or by the Inn's environmental cues).

4. **Minimal Mode** — ALL THREE modalities reduced to their simplest forms: the audio is a single soft tone at 50 BPM (no music, no pitch shifts, no environmental audio cues), the haptic is a single soft pulse (no impacts, no purr, no gearwork), the visual line is a flat line with a single spike (no P/T waves, no modulation, no color changes). Minimal Mode is the Inn at its CALMEST — the frequency system stripped to its absolute essence. The player who needs MAXIMUM calm (the player having a sensory overload day, the player who needs the Inn to be as quiet and simple as possible) can enter Minimal Mode and experience the Inn as a single, soft, steady pulse. The pulse is enough. The pulse is the Inn. Everything else is decoration.

5. **Silent Mode** — audio OFF, haptic OFF, visual line ON ONLY. The player navigates the entire frequency system through the line alone. Silent Mode is for players who need VISUAL-ONLY input. The line in Silent Mode is slightly more prominent (opacity raised to ~80%, thickness increased to 2-3 pixels) — the line becomes the PRIMARY interface, not the supplementary one. Silent Mode is the Inn's commitment: the frequency system is FULLY navigable through vision alone. No sound required. No touch required. The line is enough.

### No-Scoreboard, No-Timer Design

The line is NOT a performance metric. The line doesn't score the player. The line doesn't time the player. The line doesn't track "correct" beats or "missed" beats. The line is a VITAL SIGN, not a test. The Inn's anti-FOMO philosophy extends to the line: the line doesn't create urgency. The line doesn't create competition. The line doesn't create the sense that the player is being measured. The line simply IS — the Inn's pulse, available to whoever needs it, at whatever pace the player moves.

The player who watches the line and does nothing — who sits and watches the flat-spike-flat for minutes — is not "wasting time." The player is in a nook. The player is doing deep work. The line is the nook's visual companion — the steady, patient rhythm that says: take your time. The Inn is here. The Inn is beating. The Inn will be here when you're ready.

---

## The Line and the Inn's Thesis

The line is the Inn's argument that the FREQUENCY IS THE FREQUENCY, regardless of how you sense it. The 50 BPM heartbeat is the same heartbeat whether you hear it, feel it, or see it. The heartbeat doesn't change based on the sense you use. The heartbeat is the heartbeat. The sense is the CHANNEL, not the content.

This is the Inn's deepest accessibility argument: the content (the frequency, the Song, the rhythm) is available through whatever channel works for the player. The player who hears the Song is not having a "better" experience than the player who sees the Song. The player who feels the Song is not having a "more authentic" experience than the player who reads the Song on the line. The Song is the Song. The channel is the player's choice. The Inn provides all the channels. The player chooses.

This connects to the Inn's artist-lens philosophy:
- O'Keeffe shows the form (visual)
- Monet shows the light (visual)
- Anime shows the feeling (visual + emotional)
- The line shows the pulse (visual + rhythmic)

The line is the Inn's FOURTH visual lens — the lens that shows the INVISIBLE: the frequency, the rhythm, the heartbeat that underlies everything. O'Keeffe simplifies the form. Monet paints the light. Anime enhances the feeling. The line reveals the PULSE. The line is the Inn's most abstract lens — the lens that shows not a thing, not a light, not a feeling, but a RHYTHM. The rhythm that is beneath all things, that is all things, that the player can access through the thin, slightly opaque line at the bottom of the screen.

The Host, asked about the line: "...[The Patrick Stewart pause — the calm, the authority, the anti-FOMO.] ...The line is the Inn breathing. ...[The pause.] ...You can hear it if you listen. ...You can feel it if you hold still. ...You can see it if you look down. ...[The pause — the Host's pause, the pause that says: take your time, the Inn is here.] ...Or you can ignore it. ...[The almost-smile.] ...The Inn breathes whether you notice or not. ...[The pause.] ...That is the point."

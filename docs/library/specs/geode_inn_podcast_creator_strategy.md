# THE GEODE INN PODCAST CREATOR ATTRACTION STRATEGY
## "Daily Echoes" — Building the Podcast Network

---

## WHAT THIS DOCUMENT IS

The podcast spec exists (Product 14 in the 15-product ecosystem). Episode outlines are written. A 453-entry story catalog is compiled. What's missing is the GROWTH strategy — how the Geode Inn attracts podcast creators to join the hub, and how the podcast ecosystem scales from "Elio narrating alone by the fire" to a network of voices.

---

## THE THESIS

The Geode Inn doesn't compete with podcast platforms. The Inn is not Spotify. The Inn is not Apple Podcasts. The Inn is a PLACE — and a podcast recorded inside the Inn is not a podcast on a platform, it's a voice in a building.

The pitch to podcast creators: your show doesn't live on a shelf. Your show lives in a room. Your listeners don't subscribe — they visit. Your episodes don't stream — they echo.

---

## THE THREE TIERS OF PODCAST INVOLVEMENT

### Tier 1: "The Fire" (Solo)
Elio narrates Daily Echoes alone. 5 daily episodes (15-20 min) + 1 weekly deep dive (45-60 min). This is the baseline — the Inn's own podcast, recorded in character, inside the Inn's audio architecture.

**Status:** Spec complete. Episode outlines written. Ready to produce.

### Tier 2: "The Common Room" (Guest)
Independent podcast creators are invited to record episodes INSIDE the Geode Inn. The guest's audio is processed through the Inn's audio architecture — the IEM-based acoustic system adds the room's resonance, the 50 BPM heartbeat, the zone-specific soundscapes. The guest's content is THEIRS. The Inn's processing is the Inn's.

**The offer to creators:**
- Your episode exists in two versions: the "clean" version (your original audio, as you recorded it — distributed on your own channels) and the "Inn version" (your audio processed through the Inn's acoustic architecture — hosted on geodeinn.com).
- The Inn version is a DIFFERENT LISTEN. Same content, different room. The listener who hears the Inn version hears your story told inside a living building.
- No exclusivity. No lock-in. The Inn doesn't own your content. The Inn owns the echo.

**The attraction:**
- Indie podcasters who want to sound bigger without a studio. The Inn's DSP processing is professional-grade (IEM engineering standard). An indie podcaster recording in a bedroom gets the Inn's acoustic treatment for free.
- Podcasters who want a second life for their episodes. An episode that's been out for months gets a new version — the Inn version — that existing fans haven't heard. It's a re-release without re-recording.
- Podcasters drawn to the aesthetic. The Inn's audience is the audience that likes atmosphere — the dark, warm, scholarly, mythic listener. If your podcast is about folklore, history, mythology, geology, archaeology, mysteries, or storytelling, your audience overlaps with the Inn's audience.

### Tier 3: "The Archive" (Curated)
The Inn curates existing podcast content from the 453-entry story catalog (already compiled). Podcast transcripts are stripped of host personalities and branding, preserving only the raw narrative stories for the Inn's library. (Per Krista's standing instruction: "Podcast transcripts are to be stripped of host personalities and branding, preserving only the raw narrative stories for the Geode Inn library.")

**The process:**
1. Podcast episodes are identified from the story catalog — episodes containing standalone narrative stories relevant to the Inn's themes (mythology, geology, history, folklore, archaeology).
2. Transcripts are processed to remove host commentary, ads, branding, and platform-specific references. What remains is the STORY — the raw narrative, told by the original voice, stripped of the podcast wrapper.
3. The stripped audio is processed through the Inn's acoustic architecture.
4. The processed story is catalogued in the Book entity (or a new PodcastEpisode entity — which already exists on the live app with 5 records).
5. The story is now part of the Inn's Archive — not as a podcast episode, but as a text. A voice in the library.

**The legal basis:**
- Fair use for transformative works (the audio is substantially transformed through both editing and acoustic processing).
- Attribution: the original podcaster is credited in the Book entity's `author` field: "Originally narrated by [Podcast Name], [Episode Title], [Date]. Processed for the Geode Inn Archive."
- The original podcaster retains all rights to their original recording. The Inn's processed version is a derivative work, attributed and non-commercial (within the Inn's non-commercial archive zone).

### Tier 4: "The Network" (Partner)
The Inn partners with podcast networks and individual creators for ongoing content. These are not guests — they are RESIDENTS. Their shows are part of the Inn's daily/weekly schedule, recorded exclusively for the Inn, using the Inn's audio architecture.

**The offer:**
- The Inn provides the acoustic processing, the distribution (geodeinn.com + Spotify + Apple + YouTube), and the audience (the Inn's growing community).
- The creator provides the content, the voice, and the stories.
- Revenue split on any monetization (ads on the Inn version, premium subscriptions, Patreon-style support).
- The creator's show is branded as "[Show Name] from the Geode Inn" — the Inn as the studio, the creator as the host.

**The attraction:**
- Creators who want a home, not a platform. A studio, not a feed.
- Creators whose aesthetic aligns with the Inn — the scholarly, the mythic, the atmospheric.
- Creators who want to be part of something larger than their show — the Inn's ecosystem of 15 products, all cross-referencing, all growing the same audience.

---

## THE ATTRACTORS — What the Inn Offers That Platforms Don't

| What the Inn offers | What platforms offer | Why the Inn wins |
|---------------------|---------------------|-----------------|
| A ROOM, not a shelf | A listing in a directory | The Inn gives your show a place. Platforms give your show a row. |
| Acoustic processing | Nothing (you sound how you sound) | The Inn makes you sound like you're recording in a 10,000-year-old archive. For free. |
| Cross-product audience | Algorithm-dependent discovery | Inn listeners arrive through the game, the book, the market, the comic — not through a recommendation engine |
| No algorithm | Algorithmic recommendation | The Inn doesn't recommend. The Inn is. You find shows by exploring, not by scrolling |
| Narrative stripping | Nothing | The Inn preserves your STORY even after your episode format is forgotten |
| The echo system | Nothing | Your episode processed through the Inn becomes a new version existing alongside your original — it's a re-release, not a replacement |
| Community (Common Room) | Comments section | The Inn's Common Room is a chat room where listeners discuss episodes in character, inside the building |

---

## TARGET CREATOR PROFILES

### Profile 1: "The Folklorist"
- Podcaster who tells old stories — myths, legends, fairy tales, folk tales
- Medium audience (5,000-50,000 listeners)
- Records at home, wants better production
- Aesthetic: warm, narrative, atmospheric
- Inn fit: Tier 2 (Guest) → Tier 4 (Partner)
- Pitch: "Your stories sound like they're being told by a fire. The Inn is the fire."

### Profile 2: "The Archaeologist"
- Podcaster who covers archaeology, ancient history, lost civilizations
- Small but dedicated audience (2,000-20,000)
- Academic or semi-academic tone
- Inn fit: Tier 3 (Archive) → Tier 2 (Guest)
- Pitch: "Your content is already the Inn's content. Let's make it sound like it's been here since the beginning."

### Profile 3: "The Mystery Storyteller"
- Podcaster who tells unexplained stories, historical mysteries, anomalous discoveries
- Large audience potential (50,000+)
- Narrative-driven, atmospheric
- Inn fit: Tier 2 (Guest) → Tier 4 (Partner)
- Pitch: "The Inn doesn't solve mysteries. The Inn HOLDS them. Your stories have a home where they don't need to be explained."

### Profile 4: "The Geologist / Lapidary"
- Podcaster who covers stones, minerals, jewelry-making, geology
- Niche audience (1,000-10,000)
- Direct overlap with Soulstice Jewelry customer base
- Inn fit: Tier 2 (Guest) → Tier 4 (Partner)
- Pitch: "Every stone has a story. The Inn is where the stone and the story meet. Your audience is our audience."

### Profile 5: "The Ambient / ASMR Creator"
- Creator who produces ambient soundscapes, historical atmospheres, meditative audio
- Medium audience (10,000-50,000)
- Perfect match for the Inn's 50 BPM heartbeat architecture
- Inn fit: Tier 4 (Partner) — the Inn's audio architecture IS this creator's medium
- Pitch: "The Inn IS an ambient soundscape. You don't record in the Inn. The Inn records you."

---

## THE GROWTH CURVE

### Phase 1: Solo (Months 1-3)
- Daily Echoes launches — Elio narrates, 5 daily + 1 weekly
- 453-entry story catalog begins processing for Tier 3 (Archive) content
- 5 PodcastEpisode records already live on the Geode Inn app
- Goal: establish the Inn's podcast VOICE. Prove the format works.

### Phase 2: Guest (Months 3-6)
- First guest creator invited (The Folklorist prototype)
- 2-3 guest episodes per month processed through the Inn's audio architecture
- Guest episodes distributed on both the guest's channels and geodeinn.com
- Goal: prove the Inn's processing adds value. Get a guest to say "the Inn version sounds better than my original."

### Phase 3: Archive (Months 6-12)
- Story catalog processing at scale — 10-20 stories per month stripped and archived
- Guest pool expands to 5-10 recurring creators
- First Tier 4 (Partner) relationship formalized
- Goal: the Inn's Archive becomes the largest collection of processed narrative audio in the niche. Not the most episodes — the most TRANSFORMED episodes.

### Phase 4: Network (Year 2+)
- 3-5 resident shows on the Inn's network schedule
- Common Room live-listening parties for new episodes
- Cross-references: episode topics link to Stones, Books, and Zones in the Inn's database
- Inn's podcast network generates traffic to the game, the book, and the market
- Goal: the Inn is the studio. Platforms are the distribution. The difference is: the studio cares what it sounds like.

---

## DISTRIBUTION ARCHITECTURE

| Channel | Content | Priority |
|---------|---------|----------|
| geodeinn.com | All episodes (Inn versions) — the canonical source | Primary |
| Spotify | Daily Echoes + guest episodes (Inn versions only — clean versions distributed by creators on their own channels) | Secondary |
| Apple Podcasts | Same as Spotify | Secondary |
| YouTube | Episode audio with static Inn art (or simple animation — the 50 BPM heartbeat visual) | Tertiary |
| Steam | Inn versions available in-game — listen while exploring | Tertiary |
| Common Room | Live-listening sessions — synchronous community listening in the chat room | Community |

---

## THE INN VERSION AUDIO PIPELINE

How a creator's raw audio becomes an Inn version:

1. Creator sends raw WAV/MP3 recording to the Inn (upload portal on geodeinn.com)
2. Audio is cleaned: noise reduction, voice leveling, basic EQ
3. Audio is processed through the Inn's IEM-based acoustic architecture:
   - 50 BPM heartbeat bass layer added (felt, not heard)
   - Zone-specific soundscape applied (each episode is assigned a zone — the storyteller sits by the fire, in the catacombs, in the garden, etc.)
   - 42Hz base frequency hum added at -12dB below narration
   - Reverb profile applied matching the zone's acoustic properties (the 7 DSP room profiles from the audiobook spec)
4. The Inn version is mastered to match the Inn's audio standard (low-dub classical, 50 BPM constant)
5. The Inn version is published on geodeinn.com and distributed to Spotify/Apple/YouTube
6. The creator's clean version is published by the creator on their own channels
7. Both versions link to each other: "Listen to the Inn version at geodeinn.com" / "Listen to the original at [creator's channel]"

---

## DESIGN STATUS

- [x] Four-tier creator involvement model defined (Solo, Guest, Archive, Network)
- [x] Creator attraction thesis documented
- [x] Five target creator profiles defined
- [x] Growth curve mapped (4 phases, 2+ years)
- [x] Distribution architecture documented
- [x] Inn Version audio pipeline specified
- [x] Legal basis for Tier 3 (Archive) documented (transformative use, attribution)
- [x] Revenue model for Tier 4 (Partner) outlined (revenue split)
- [ ] First guest creator outreach (target: a real podcaster matching Profile 1)
- [ ] Upload portal for creator raw audio (geodeinn.com backend)
- [ ] Automated audio processing pipeline (script the 7 DSP profiles)
- [ ] Episode-to-zone matching logic (which creator's story goes in which Inn zone)
- [ ] Common Room live-listening event system
- [ ] Steam in-game podcast player

---

## ORIGIN

This strategy was designed September 2, 2026 to complete the podcast product's growth model. The 453-entry story catalog and episode outlines were already done. What was missing was the answer to: "How does this grow beyond Elio?" The answer is: it grows the way the Inn grows — by being a place people want to be, not a platform people want to be on. The Inn is the studio. The studio is warm. The warm place attracts the voices. The voices fill the rooms. The Inn echoes.

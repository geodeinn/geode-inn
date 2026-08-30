# The Common Room — Build Spec
## Page: /common-room

## Concept
An old-school chat room where visitors to geodeinn.com gather by a virtual fire. No accounts, no email, no data retention. The room presents itself as a living book — messages write themselves onto parchment in real-time, as if a quill is moving across the page. The book that writes itself and keeps nothing.

Once built, this system runs itself. No admin. No moderation staff. The community is the moderation. The architecture is the defense. It functions independently.

## The Living Book Presentation

### Core Visual Metaphor
The chat is a book being written in real-time. Not a chat feed. Not message bubbles. A page.

### The Page
- The chat area looks like aged parchment — warm cream (#e8dcc8) with subtle texture
- Rough edges, not clean rectangles. The page has presence.
- Celtic knotwork border at low opacity, gold ink
- The page sits on the dark stone background like a book left open on a table by the fire
- Subtle shadow beneath the page — it rests on something solid

### Writing Animation
- Each new message appears character-by-character, as if a quill is writing it
- Speed: fast enough to read naturally (not slow typing animation), but you SEE the words forming — maybe 30-50 chars per second
- The "quill" is invisible. You see the ink appearing, not the hand.
- Each message writes in sequence. New messages start on a new line.
- The page scrolls down as it fills — like unrolling parchment, not like a modern chat scroll
- Smooth, organic movement. Not mechanical line-by-line jump.

### Ink Styles
- Traveler messages: dark sepia ink (#3a2a1a), slightly irregular — different "handwritings" for different travelers (rotate through 3-4 subtle font variants)
- System messages (the fire's voice): gold ink (#c4954a), italic, different hand — cleaner, more deliberate. The innkeeper's marginalia.
- Frog messages: swamp green ink (#5a7a2a), shaky — the handwriting of something losing its voice

### The Fire (Elio's Presence)
- No character avatar. No sprite. No visible figure.
- The fire is a CSS animation at the top of the page — warm flicker, amber glow
- The fire IS the character. The system messages in gold ink are the fire speaking
- The fire speaks rarely: ambient atmospheric lines once every few minutes
  - "The fire pops and settles."
  - "A draft moves through the stones."
  - "The hearth clicks with the heat."
  - "The wood shifts. The room breathes."
- These appear in gold ink, unbidden, not responding to anyone. The room being alive.
- If someone types "Elio" or addresses the innkeeper directly: no response. The fire crackles. That is the answer.

### The Blank Page
- When the room is empty or freshly started: the page is blank
- A blank parchment page with the fire glowing above it
- The emptiness is the design. A book waiting to be written.
- When travelers enter, their messages write themselves onto the blank page
- On leave: the page clears. Not saved. Not archived. Blank. The next person finds empty parchment.

## Page Structure (top to bottom)

### 1. The Fire (top of page)
- CSS fire animation — warm amber flicker, not complex
- Subtle glow that casts light downward onto the page below
- The fire is always there. It never goes out. It is the only permanent thing in the room.
- During heightened awareness: the fire burns lower, dimmer. The glow contracts.

### 2. Header (below the fire, on the parchment)
- "THE COMMON ROOM" — serif, copper, centered at the top of the page
- "The Geode Inn — Hearth"
- "Where travelers gather. No accounts. No records. The fire stays."
- These appear as if pre-printed on the page — they don't animate. The header is part of the book itself.

### 3. Visitor Counter
- Below the header, in gold ink (fire's hand): "X travelers sit by the fire."
- Empty: "The fire crackles alone."
- Heightened: "The fire burns low. X travelers watch the door."

### 4. The Writing Area (the main page)
- Messages write themselves here, character by character
- Format: [4:43 AM] Kyanite-X: Anyone else here?
- System messages in gold italic: [4:43 AM] * Kyanite-I enters the Common Room, warming by the fire.
- Frog messages in green: [4:43 AM] Tadpole-8: ribbit
- The page scrolls as it fills — parchment unrolling
- No avatars. No reactions. No profile pictures. Ink and names.

### 5. Threshold Indicator (new travelers only)
- In gold ink, at the bottom of the page: "You're warming by the fire. 38 seconds before you can speak."
- Counts down in real-time
- When cleared: "The fire has warmed you. Speak if you like."
- Fades after a few seconds once cleared

### 6. Frog Link
- Small "frog" in muted brown text next to each message from another traveler
- Only visible if you've cleared your 2-minute cooldown
- On cooldown: hover shows "You haven't been by the fire long enough."
- Click: running tally appears in gold ink — "Frogged. (1/3)"
- No confirmation dialog. One click.

### 7. The Quill (input area)
- Simple text input styled as a writing space at the bottom of the page
- Placeholder: "Speak to the room..."
- Max 500 chars
- During threshold: disabled, reads "Warming by the fire... Xs"
- When frogged: input works but all messages become ribbit
- Disconnected: "The fire went out. Refresh to return."
- When you type and hit Enter: your message writes itself into the page above, as if the quill picked it up and wrote it for you

### 8. Footer (below the page, on the stone)
- "No accounts. No records. No archives. What you say here stays in the room. When you leave, it's gone. Forever."
- Small, dim, carved into stone — not written in ink. This is the room's truth, not a message.

## Anti-Troll Architecture: Three Layers

No admin. No moderation staff. The architecture itself prevents exploitation.

### Layer 1: The Threshold
Every new traveler waits 45 seconds before they can speak. You enter, you see the page, but you're "warming by the fire." During heightened awareness, the threshold extends to 120 seconds.

Purpose: A troll who gets removed and rejoins must sit silently. The room sees them enter. Most drive-by trolls won't wait.

### Layer 2: The Frog Cooldown
New travelers cannot frog anyone for 2 minutes after joining. "You haven't been by the fire long enough. The community doesn't know you yet."

Purpose: Prevents a troll from rejoining and immediately revenge-frogging. You need standing before you can use the community's teeth.

### Layer 3: The Heightened Threshold
When someone is swamp-claimed, the room enters heightened awareness for 5 minutes:
- New joiners wait 120 seconds instead of 45
- The fire burns lower (visual change — dimmer, smaller flame)
- System message: "A traveler lingers at the threshold. The fire burns low. The room remembers."

Purpose: After a removal, the room is wary. The Inn has just dealt with something and is paying attention.

## Community Moderation: The Frog System

### How It Works
1. Any traveler who has cleared their 2-minute cooldown can frog another traveler
2. It takes 3 unique travelers frogging the same person to trigger one transformation
3. One person cannot frog the same traveler twice
4. You cannot frog yourself

### Transformation
On 3rd frog: the offender's name changes to a random frog name. System message in gold: "Quartz-I has been transformed. The traveler is now Tadpole-8. The swamp reclaiming its own."

Once transformed:
- Can only type ribbit variants (ribbit, croak, grrribbit, etc.)
- Name is gone. Words are gone. The page shows a frog.
- Frog status holds until the traveler leaves

### Swamp Claim (Removal)
Three transformations = the swamp claims you. Traveler removed. System message: "Tadpole-8 has been claimed by the swamp. The traveler is gone. The fire burns low."

This triggers heightened awareness.

## Entry Flow
1. **The Door:** Name input (optional, blank = random stone name). "Enter the Common Room" button. "No email. No account. No record."
2. **The Threshold:** 45-second wait (120 during heightened). Can see the page, can't write. Threshold indicator counts down in gold ink.
3. **The Page:** Chat active. Messages write themselves. Can speak. Can frog after 2 min. Fire flickers above.
4. **The Exit:** "Leave" button, top corner. No confirmation. The page goes blank. "You left the Common Room. Your words are gone. The fire stays." Returning = fresh session, new name, full threshold wait, blank page.

## API (backend function: geodeInnCommonRoom)
All POST with JSON body. All ephemeral.

### join
Request: { action: "join", name: "optional-name" }
Returns: { travelerId, travelerName, threshold, heightened, canSpeakAt, online[], onlineCount, recentMessages[] }

### listen (poll every 2.5 seconds)
Request: { action: "listen", travelerId, since: lastTimestamp }
Returns: { online[], onlineCount, messages[], heightened, thresholdRemaining, frogCooldownRemaining }

### say
Request: { action: "say", travelerId, text: "message" }
Returns: { success: true } or { success: false, error: "You're still warming by the fire...", thresholdRemaining: X }
Note: If traveler is a frog, text is replaced with ribbit server-side.

### frog
Request: { action: "frog", travelerId, targetId }
Returns: { success: true, frogCount, threshold, transformed } or { success: false, error, cooldownRemaining }

### leave
Request: { action: "leave", travelerId }
Returns: { success: true, message: "You left the Common Room..." }

### status
Request: { action: "status" }
Returns: { onlineCount, online[], heightened }

## Privacy Architecture
- No localStorage. No cookies. No analytics. No IP logging.
- No database storage — messages exist in server memory only
- Server instance dies = everything gone
- Not a policy. Architecture. The system CANNOT retain data because it was built not to.

## Independent Operation
Once deployed, the Common Room requires zero maintenance:
- No admin (the community moderates via frogging)
- No moderation staff (the threshold + cooldown + frog system handles it)
- No content filtering (the architecture is the filter)
- No user accounts (there are none)
- No data to protect (there is none)
- No logs to check (there are none)
- Self-cleaning: stale travelers auto-remove after 5 minutes
- Self-moderating: 3 travelers transform, 3 transformations remove
- Self-calibrating: heightened awareness activates automatically after removals

The troll math: Each removal cycle costs the troll 2+ minutes of forced silence. The community's effort is 3 clicks. The troll always loses the time economy.

## Elio's Presence
The fire is the character. The gold ink is the voice. The builder is present without visible — the Final Room logic applied to the common room. You don't see the builder. The knowledge is enough. The fire never goes out. The room remembers nothing but the warmth.

## Lore Connection
The Common Room is the Inn's ground floor gathering space. Before the archive, before the games, before the stairs. Where travelers rest before climbing. The fire never goes out. The room remembers nothing but the warmth.

The living book presentation connects to the Inn's identity as an archive — even the ephemeral room looks like a page being written. The irony is the point: the one room that stores nothing presents itself as a book. The form is an archive. The content is smoke.

The frog system connects to the Inn's narrative spine: victims reclaiming power. The swamp is the Inn's oldest defense. It doesn't ban — it transforms. What it claims, it keeps.

## Builder Instructions
Build at /common-room in the Geode Inn app. Use deployed backend function geodeInnCommonRoom. The living book presentation is the visual core — messages write themselves onto parchment. The fire is a CSS animation, not a character sprite. Visual restraint IS the design. Stone, fire, parchment, ink. Nothing more.

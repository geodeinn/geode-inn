# Geode Inn — Traditional Card Game Templates
## Using the Luis Royo 54-Card Deck

All four games use the same custom deck: 54 cards, Luis Royo dark fantasy art, four suits (Hearts/hearth, Spades/depths, Clubs/wild/fae, Diamonds/earth/artisan). Drag-and-drop mechanics throughout. All framed with the universal Celtic knotwork gold border.

---

## 1. Stone Solitaire (Klondike)

**Setting:** A quiet table near the hearth, candlelight, a single player's table. The intro card game — no stakes, no pressure.

**Mechanic:**
- Standard Klondike layout: 7 tableau columns (1-7 cards, top card face-up), stock pile, waste pile, 4 foundation piles
- Drag cards or sequences between tableau columns (alternating colors, descending order)
- Drag cards to foundations (same suit, ascending Ace through King)
- Tap stock pile to draw; drag from waste to tableau or foundation
- Two jokers act as wild cards — can fill any gap in a sequence (one per foundation run)

**Inn Theming:**
- Foundations are labeled by suit theme: Hearth (Hearts), Depths (Spades), Wild (Clubs), Earth (Diamonds)
- Card backs show the Royo gargoyle splash art
- Completed foundations glow gold (Klimt gold)
- Background: warm hearth firelight, stone table, the Inn's amber tones
- Win animation: all four foundations pulse gold simultaneously, a harmonic chime plays (the 42Hz chord resolved)

**Drag-and-Drop:**
- Long-press to pick up a card or sequence
- Valid drop zones highlight with a gold glow
- Invalid drops bounce back with a soft stone-on-stone sound
- Auto-flip face-down cards when uncovered (with a satisfying flip animation revealing the Royo art)

**Reward:** Completing a game on certain difficulties earns a random card for the player's collection (if they don't already have it)

---

## 2. Inn Blackjack (21)

**Setting:** A table in the tavern area — Jay's Huntsman Tavern or the Main Floor social space. Quick, casual, repeatable.

**Mechanic:**
- Standard blackjack: player vs dealer, closest to 21 without going over
- Player bets stone chips (earned from arcade games, traded from stone collection)
- Deal two cards to player (face-up), two to dealer (one face-up, one face-down)
- Player actions: Hit (drag a card from the shoe), Stand (tap table), Double Down (drag bet forward), Split (if pair — drag cards apart into two hands)
- Dealer hits until 17
- Blackjack (natural 21) pays 3:2

**Inn Theming:**
- The "dealer" is an NPC — rotates between characters (The Wanderer, Jay, The Firekeeper depending on time of day in-game)
- Card shoe is carved stone with gold inlay
- Stone chips are actual tiny mineral pieces (amethyst, quartz, etc.) with different values
- Bust animation: cards shatter like the 7-piece death shattering from Andean Run
- Blackjack animation: the two cards glow gold and a warm chime plays
- Background: tavern interior, warm amber lighting, Royo atmospheric shadows

**Drag-and-Drop:**
- Drag chips to the betting circle to place a bet
- Drag cards to rearrange in split hands
- Tap "Hit" and card slides out — or drag directly from the shoe
- Double-down: drag a second bet chip stack next to the original

**Reward:** Win stone chips (currency). Winning with a blackjack pays bonus chips. Special bonus for getting 21 with three 7s (three Rayo sevens — "The Three Sevens of the Inn" achievement).

---

## 3. Stone Poker (Five-Card Draw)

**Setting:** A back room table — dimmer lighting, higher stakes, more atmosphere. The "serious" table. Royo's chiaroscuro at full power.

**Mechanic:**
- Five-card draw poker: player vs 3 AI opponents (NPCs from the Inn)
- Ante to play, then two betting rounds (one before draw, one after)
- Player can discard up to 3 cards (drag to discard pile) and draw replacements
- Standard hand rankings: pair, two pair, three of a kind, straight, flush, full house, four of a kind, straight flush, royal flush
- Jokers are wild (two in the deck) — can represent any card for hand completion

**Inn Theming:**
- AI opponents are Inn characters with distinct play styles:
  - The Wanderer (Odin): conservative, patient, bluffs rarely but devastatingly
  - The Firekeeper (Tim Curry energy): theatrical, bluffs dramatically, chatty
  - The Morrigan: aggressive, intimidating, raises often
  - Jay: relaxed, reads people well, hard to bluff
- Pot is a circle of stone chips glowing in the center
- Win animation: pot slides to winner, winner's cards flip to reveal Royo art in full
- Card flip reveals are dramatic — each card flips with a flash of gold light
- Royal flush triggers a special animation: all five cards align and pulse the Inn's 42Hz chord

**Drag-and-Drop:**
- Drag chips forward to bet/call/raise
- Drag unwanted cards to the discard pile during the draw phase
- Drag cards to rearrange in hand (purely visual, doesn't affect gameplay)
- Tap "Fold" to muck cards (they slide face-down to the dealer)

**Reward:** Win stone chips. Special hand bonuses:
- Royal Flush: "The Inn's Hand" — massive chip bonus + unique card unlock
- Four of a Kind: bonus chips + achievement
- Using both jokers in a winning hand: "Wild Magic" achievement

---

## 4. Crystal Gin (Gin Rummy)

**Setting:** A two-player table — quieter, more strategic. The thinking person's card game. Played against a single NPC opponent.

**Mechanic:**
- Standard Gin Rummy: 10 cards each, draw from stock or discard, form melds (sets of same rank, or runs of same suit)
- Goal: be first to "knock" (deadwood count ≤ 10) or "go gin" (zero deadwood)
- Player draws by dragging from stock or discard pile
- Player discards by dragging a card to the discard pile
- Knock by tapping the knock button when eligible
- Opponent can lay off cards on knocker's melds

**Inn Theming:**
- Opponent is an Inn scholar character (Beverley the Librarian, or The Crone) — thoughtful, deliberate pace
- Melds glow gold when completed (Klimt gold)
- "Going Gin" triggers a special animation: all 10 cards align into a perfect golden grid, the 42Hz chord plays
- Deadwood cards appear dimmer/darker — unmelded, unresolved
- Stock pile is a stack of face-down cards with the Royo gargoyle back
- Discard pile spreads cards in a fan so both players can see what's been dropped
- Background: a study or archive room — dark wood, brass lamps, old books, the Crone's territory

**Drag-and-Drop:**
- Drag from stock or discard pile to hand
- Drag cards from hand to discard pile (ends turn)
- Drag cards within hand to rearrange
- Melds auto-detect when arranged in valid sets/runs and glow gold
- Tap "Knock" button (appears when eligible) — or drag a card to the "knock" zone

**Reward:**
- Win stone chips
- Going Gin (zero deadwood): "Perfect Resonance" achievement + bonus chips
- Undercut bonus (opponent knocks, you have less deadwood): bonus chips + "The Quiet Win" achievement
- Big Gin (11-card hand with zero deadwood after draw): "Full Chord" achievement + unique card unlock

---

## Universal Card Game UI Notes

### Card Rendering
- All cards use the Luis Royo art (face cards = full character art, number cards = suit-themed abstract Royo patterns)
- Card backs: Royo gargoyle splash art, dark with gold
- Cards have a slight metallic sheen — bronze-tinted edges
- Card flip animation: 3D flip (Y-axis rotation), 300ms, with a soft gold flash on reveal

### Drag-and-Drop Physics
- Cards have weight — slight lag on pickup, settle into place on drop
- Valid drop zones glow gold (Klimt gold)
- Invalid drops: card slides back to origin with a soft stone sound
- Cards stack with a slight offset so both art and suit are visible

### Audio
- Card flip: soft paper-on-stone sound
- Card draw: a dry slide sound
- Card place: a satisfying tap, pitch varies by suit (hearts = warm tone, spades = deep tone, clubs = earthy tone, diamonds = crystal tone)
- Win: 42Hz chord resolution
- Lose: a single low note, gentle, not punishing
- Chip placement: mineral-on-stone clink

### Frame
- All four games use the universal Celtic knotwork gold frame template
- The frame is the table edge — the gold border IS the felt table's trim
- Game-specific UI elements (buttons, chip stacks, scores) sit inside the frame

### Difficulty/Progression
- Solitaire: 3 draw modes (draw-1 easy, draw-3 medium, draw-3 + timer hard)
- Blackjack: dealer stands on 17 (easy) or hits soft 17 (hard)
- Poker: 3 AI skill levels (Novice, Seasoned, Inn Master)
- Gin Rummy: 3 AI skill levels (Apprentice, Scholar, Archive Keeper)

### Reward Integration
- All four games pay out in stone chips (shared currency with arcade)
- Special achievements unlock unique cards for the player's collection
- Collected cards display in a Card Gallery (framed with the universal knotwork border, naturally)
- Completing all four games on hardest difficulty: "The Cardkeeper" title + a unique Royo joker card

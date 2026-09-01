# The Egg Hatchery — Page Spec

## Overview

A community-driven page on the Geode Inn web beta where players vote on retired character eggs. Each egg goes through a 28-day lifecycle: creation → community voting → hatching → the retired character migrates into the comic strip as an echo.

## Route

`/hatchery`

## Layout

### Header
- Title: "The Egg Hatchery" in Inn serif typography
- Subtitle: "Where the Inn's retired characters dream of new lives"
- Celtic knotwork border, dark stone background

### Active Eggs Section (main display)
- Grid of active egg cards (3 columns desktop, 1 column mobile)
- Each card shows:
  - Egg image (from EggHatch entity's imageFile field)
  - Egg name (contentName)
  - Creator name (creatorName)
  - Zone (zone)
  - Vote count (voteCount) vs threshold (signatureThreshold)
  - Progress bar showing vote progress
  - Days remaining (calculated from hatchDate)
  - Two buttons: "Nurture" (vote to keep) and "Release" (vote to let go)
  - Vote count and signature count displayed as a ratio (e.g., "14/25 signatures")

### How It Works Section (below the grid)
- 4-step explanation with simple icons:
  1. A character retires from the Inn
  2. An egg forms — the Inn holds what they were
  3. The community votes: nurture (keep the memory) or release (let it go)
  4. After 28 days, the egg hatches — the character becomes a comic strip echo

### Hatched Eggs Archive (below How It Works)
- Grid of hatched egg cards (smaller than active eggs)
- Each shows:
  - Egg image
  - Content name
  - Hatch date
  - Result (nurtured or released)
  - Link to the comic strip where the character appeared as an echo
- Filter by zone, sort by hatch date

### Sidebar (desktop)
- "Current Egg Cycle" — shows where we are in the 28-day cycle
- "Your Votes" — shows eggs the logged-in player has voted on
- "Past Hatches" — quick stats: total hatched, nurtured vs released ratio

## Data Source

The page reads from two entities:

### EggHatch entity
- `contentName` — what's inside the egg (the retired character's name)
- `contentType` — character type
- `creatorName` / `creatorPlayerId` — who created the egg
- `eggShellTier` — rarity tier of the egg shell
- `hatchDate` — when the egg hatches (28 days from creation)
- `imageFile` — egg image
- `status` — active, hatched, or expired
- `voteCount` — total votes
- `signatureCount` vs `signatureThreshold` — signatures needed to fully hatch
- `zone` — which Inn zone the egg lives in
- `questlineSteps` — if the egg is tied to a questline
- `resonanceScore` — community resonance rating
- `hatchMonth` — month label for the cycle
- `isPermanent` — whether the hatched content is permanent
- `returnDate` — if a released character might return someday

### EggVote entity
- `hatchId` — which egg was voted on
- `playerId` / `playerName` — who voted
- `voteType` — "nurture" or "release"
- `voteDate` — when the vote was cast

## Backend Functions Needed

### getActiveEggs
- Input: none
- Output: All EggHatch records where status = "active", sorted by closest hatchDate
- Logic: Query EggHatch where status = "active", sort by hatchDate ascending

### voteOnEgg
- Input: hatchId, playerId, playerName, voteType
- Output: Updated vote count and confirmation
- Logic:
  1. Check if player already voted (query EggVote for hatchId + playerId)
  2. If not, create EggVote record
  3. Update EggHatch voteCount (+1) and signatureCount (+1 if voteType = "nurture")
  4. If signatureCount >= signatureThreshold, mark egg as ready to hatch early
  5. Return updated egg data

### getHatchedEggs
- Input: page number, zone filter (optional)
- Output: 12 hatched EggHatch records
- Logic: Paginated query where status = "hatched", optional zone filter

## Visual Style

- Background: Dark subterranean stone (matching hub)
- Egg cards: Slightly elevated surface (bg-card equivalent) with antiqued gold borders
- Progress bars: Filled with the Inn's gold/brass primary color
- "Nurture" button: Warm green accent
- "Release" button: Muted blue accent
- Loading state: Fizgigs in overalls animation
- Egg cards should have a subtle pulsing glow (50 BPM rhythm) while active

## Player Interaction Rules

- One vote per player per egg
- Player must be logged in to vote
- Votes are permanent (cannot be changed)
- If an egg reaches signatureThreshold before hatchDate, it hatches early as "Nurtured"
- If an egg reaches hatchDate without enough signatures, it hatches as "Released"
- Released characters may return in future cycles (returnDate field)

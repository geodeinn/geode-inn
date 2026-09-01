# Geode Inn Gazette — Comic Strip Display Page Spec

## Overview

A page on the Geode Inn web beta that displays the daily four-panel comic strip ("The Geode Inn Gazette"). The comic documents player adventures in the Inn, generated from actual gameplay data.

## Route

`/gazette`

## Layout

### Header
- Title: "The Geode Inn Gazette" in the Inn's serif typography
- Date display (today's strip)
- Navigation: Previous strips (archive) | Next strip (if exists)

### Comic Display Area
- Four panels arranged horizontally on desktop (2x2 grid on mobile)
- Each panel: image (from ComicStrip entity's imageUrl field) with caption below
- Panels should have the Inn's dark stone background with antiqued gold borders
- A subtle Celtic knotwork overlay (matching the Inn's ambient texture)

### Below the Comic
- Strip title and strip number (from ComicStrip entity)
- Zone tag (where the adventure took place)
- Character list (who appeared in this strip)
- "Player Adventures" section — if the strip was generated from real player data, show a brief summary of what happened

### Archive Section (below today's strip)
- Grid of thumbnail-sized strips, sorted by date (newest first)
- Each thumbnail shows the first panel + date + title
- Click to view full strip
- Filter by zone (dropdown)
- Pagination (12 strips per page)

### Sidebar (desktop only)
- "About the Gazette" — brief description of the comic system
- "Subscribe" — email notification when new strips are posted
- "Most Popular Strips" — top 5 most viewed strips

## Data Source

The page reads from the **ComicStrip** entity:
- `title` — strip title
- `stripNumber` — sequential number
- `date` — publication date
- `imageUrl` — the comic image (all 4 panels in one image, or 4 separate images)
- `panels` — panel data (JSON array of panel descriptions)
- `characters` — character names that appear
- `zone` — which Inn zone the strip is set in
- `artStyle` — the artistic style used
- `playerAdventures` — text description of the player event that inspired the strip
- `isPublished` — only show published strips

## Backend Function Needed

### getDailyStrip
- Input: date (optional, defaults to today)
- Output: today's ComicStrip record + previous 12 strips for archive
- Logic: Query ComicStrip entity where `isPublished = true` and `date <= today`, sorted by date descending, limit 13

### getStripArchive
- Input: page number, zone filter (optional)
- Output: 12 ComicStrip records for the requested page
- Logic: Paginated query with optional zone filter

## Visual Style

- Background: Dark subterranean stone (matching hub)
- Borders: Antiqued gold/brass (matching hub)
- Typography: Inn serif for titles, readable sans for body
- Celtic knotwork overlay on the comic frame
- Panel transitions: gentle fade between strips when navigating
- Loading state: Fizgigs in overalls animation (canonical loading screen)

## Future Enhancements (not for initial build)
- Comment system on each strip
- "Generate Your Own Strip" — players submit their adventure and get a custom strip
- Comic compilation export (PDF)
- Integration with the tabletop game — strips generated from session summaries

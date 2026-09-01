# Geode Inn Gazette — Builder Spec for /gazette Page

## Overview

Build a comic strip display page at `/gazette` on the Geode Inn web beta. The page displays "The Geode Inn Gazette" — a daily four-panel comic documenting player adventures in the Inn. Reads from the ComicStrip entity in the live database.

## Route

`/gazette`

## Page Structure

### 1. Header
- Title: "The Geode Inn Gazette" in the Inn's serif typography (antiqued gold)
- Subtitle: "Adventures from the Inn, drawn in real time"
- Date display showing the current strip's date
- Navigation arrows: ← Previous Strip | Next Strip → (disabled if no strip in that direction)

### 2. Featured Comic (Today's Strip)
- Large display of the current strip
- Main image from `imageUrl` field (all 4 panels composed into one image)
- Below the image:
  - Strip title (from `title` field) in serif
  - Strip number (from `stripNumber` field) — small, antiqued brass
  - Zone tag (from `zone` field) — pill-shaped, dark stone with gold border
  - Character list (from `characters` field) — comma-separated names, no pronouns
  - Player adventure summary (from `playerAdventures` field) — italic, indented, with a small "Based on a real adventure" label
- Frame: antiqued gold/brass border matching the hub aesthetic
- Subtle Celtic knotwork overlay on the frame corners

### 3. Archive Grid (below featured strip)
- Section title: "The Archive" in serif
- Grid of thumbnail cards (4 columns desktop, 2 tablet, 1 mobile)
- Each card shows:
  - Thumbnail of `imageUrl` (first panel or full strip cropped)
  - Date below thumbnail
  - Title below date
  - Zone tag
- Click any card to load that strip into the featured display area
- Filter bar above grid: All Zones dropdown + date range picker
- Pagination: 12 strips per page with "Load More" button

### 4. Empty State (no strips published yet)
Since there are currently 0 ComicStrip records, the page needs a graceful empty state:
- Centered illustration placeholder: Celtic knotwork frame with "The Gazette has not yet begun publishing" text
- Below: "Once players begin exploring the Inn, their adventures will appear here as daily comic strips."
- Loading state: Fizgigs in overalls animation (canonical loading screen characters)

### 5. Sidebar (desktop only, right column)
- "About the Gazette" — brief text: "The Geode Inn Gazette is a living record of player adventures, drawn daily from real gameplay data. Each strip is rendered in the art style of the zone where the adventure took place."
- "How It Works" — 3 bullet points: Player explores → Adventure logged → Strip drawn
- "Subscribe" — email input field with "Notify me when the Gazette launches" button (stores email for future notification)

## Data Wiring

### Entity: ComicStrip (live app)
Fields available:
- `title` (string) — strip title
- `stripNumber` (number) — sequential strip number
- `date` (string/date) — publication date
- `imageUrl` (string) — URL to the composed 4-panel comic image
- `panelImageUrl` (string) — URL to individual panel image (optional)
- `characters` (string/array) — character names appearing in the strip
- `zone` (string) — which Inn zone the adventure took place in
- `playerAdventures` (string) — text describing the player event that inspired the strip
- `isPublished` (boolean) — only display strips where this is true

### Query Logic
1. **Featured strip**: Get the most recent published strip — `filter({ isPublished: true })`, sort by `date` descending, limit 1
2. **Archive grid**: Get all published strips — `filter({ isPublished: true })`, sort by `date` descending, paginated 12 at a time
3. **Zone filter**: When user selects a zone, add `filter({ zone: selectedZone })` to the archive query
4. **Previous/Next navigation**: Query strips with date less than / greater than the current strip's date

### Backend Function: getDailyGazette

Deploy this function to handle the page's data loading:

```typescript
export default async function getDailyGazette(req, res) {
  const base44 = createClientFromRequest(req);
  
  try {
    // Get the most recent published strip
    const latest = await base44.entities.ComicStrip.list({
      filter: { isPublished: true },
      sort: "-date",
      limit: 1
    });
    
    // Get archive strips (excluding the featured one)
    const archive = await base44.entities.ComicStrip.list({
      filter: { isPublished: true },
      sort: "-date",
      limit: 12
    });
    
    // Get unique zones for filter dropdown
    const zones = [...new Set(archive.records?.map(s => s.zone).filter(Boolean))]; 
    
    res.json({
      featured: latest.records?.[0] || null,
      archive: archive.records || [],
      zones: zones,
      totalCount: archive.count || 0
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}
```

## Visual Style

### Colors
- Background: Dark subterranean stone (#1a1714 or matching hub)
- Text: Warm cream (#e8dcc8)
- Titles: Antiqued gold (#c4a04e)
- Borders: Brass/gold (#8b7530)
- Zone tags: Dark stone with gold border
- Links: Warm gold, underline on hover

### Typography
- Strip titles: Serif (matching hub — Cormorant Garamond or similar)
- Body text: Readable sans-serif (matching hub)
- Strip number: Small caps, antiqued brass color

### Layout
- Featured comic: Centered, max-width 800px on desktop
- Archive grid: Full width below, 4-column grid (gap: 20px)
- Sidebar: 300px right column on desktop (hidden on mobile/tablet)
- Responsive breakpoints: 1024px (tablet: 2-col grid, no sidebar), 640px (mobile: 1-col, stacked)

### Animations
- Strip navigation: Gentle fade transition (200ms)
- Archive card hover: Subtle gold border glow
- Loading state: Fizgigs in overalls animation
- Page load: Fade in from top

### Accessibility
- Alt text on comic images: use `title` field
- Keyboard navigation for strip browsing (left/right arrows)
- Zone filter dropdown: accessible label
- Subscribe form: proper label and button semantics

## Builder Instructions

1. Create the `/gazette` route in the Geode Inn app
2. Build the page layout as described above
3. Wire the page to read from the ComicStrip entity (using the query logic)
4. Deploy the `getDailyGazette` backend function
5. Implement the empty state — this is what users will see first since no strips exist yet
6. Add the zone filter and pagination for the archive
7. Add the email subscribe form (can be a simple entity or just a visual placeholder for now)
8. Ensure the visual style matches the hub: dark stone, gold borders, serif typography, Celtic knotwork
9. Loading state: Fizgigs in overalls (canonical) — NOT brownies

## Important Notes

- Refer to characters by NAME ONLY — no gendered pronouns (standing design rule)
- The comic images will be generated as single composed images (4 panels in one image), stored in `imageUrl`
- `panelImageUrl` is optional and may be used for individual panel close-ups in future
- The page must work gracefully with 0 strips (empty state is the default view for now)
- All zone tags should use the Inn's zone naming convention (e.g., "Main Floor (L3)", "Cosmology (L1)", "Catacombs (L6)")
- The subscribe form is non-functional for now — just collect emails visually

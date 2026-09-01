# Share Wood — Zone Builder Technical Specification

## Overview

The Zone Builder is the interactive tool that faire owners use to construct their digital faire zone. It is the core product feature of Share Wood — the thing that turns a subscription into a tangible digital space. This spec defines the technical architecture and user experience for all three tiers.

## Architecture

### Frontend
- React 18 + TypeScript
- Canvas-based zone renderer (WebGL2 for Tier 3 features)
- Drag-and-drop interface (dnd-kit library)
- Real-time preview (no "render" button — changes appear instantly)
- Auto-save every 15 seconds to FaireVenue entity
- Mobile-responsive (faire owners will manage from phones)

### Data Model
```typescript
interface ShareWoodZone {
  zoneId: string; // sw01, sw02, etc.
  faireId: string; // references FaireVenue entity
  tier: 'clearing' | 'village' | 'kingdom';
  primaryStyle: string; // artist name from 37-artist catalog
  accentStyle?: string; // Tier 3 only
  zones: ZoneArea[]; // 1 for Clearing, 3 for Village, up to 10 for Kingdom
  vendorBooths: VendorBooth[];
  terrain: TerrainConfig;
  audioProfile: string; // which Inn DSP room profile
  customBranding?: BrandingConfig; // Tier 2+
  whiteLabel?: boolean; // Tier 3 only
  publishedAt?: string;
  status: 'draft' | 'published' | 'paused';
}

interface ZoneArea {
  areaId: string;
  name: string;
  background: string; // uploaded photo or Inn template
  boothLayout: BoothPosition[]; // grid coordinates
  transitionPaths?: TransitionPath[]; // Village+ only
}

interface VendorBooth {
  boothId: string;
  vendorName: string;
  category: string;
  description: string;
  externalUrl: string;
  media: BoothMedia; // photo or video
  position: { x: number; y: number };
}

interface TerrainConfig {
  baseType: 'meadow' | 'forest' | 'coastal' | 'mountain' | 'desert' | 'custom';
  waterFeatures?: WaterFeature[]; // Village+ only
  paths?: PathConfig; // Village+ only
  weather?: WeatherConfig; // Kingdom only
  dayNightCycle?: boolean; // Kingdom only
  ambientSoundUrl?: string; // Kingdom only
}
```

## Tier 1: The Clearing ($29/month)

### Builder Interface
- Single zone view (one area)
- 20x20 grid with snap-to placement
- Drag vendor booths from a palette onto the grid
- Upload one background photo (the faire's physical grounds)
- Booth fields: vendor name, category, external URL, photo, description
- No terrain editing — the background photo IS the terrain
- Inn gold knotwork border (always visible — this is the Inn brand frame)
- "Publish" button (no approval needed)

### User Flow
1. Upload background photo (or choose from 3 Inn templates: meadow, forest, coastal)
2. Drag booths onto the grid
3. Fill in booth details for each
4. Choose art style (8 options: Klimt, Royo, Van Gogh, O'Keeffe, Bierstadt, Rackham, Hokusai, Dore)
5. Preview (sees the zone as visitors will see it)
6. Publish

### Visual Rules
- Art style applies a subtle filter/overlay to the uploaded photo
- The filter is non-destructive — the original photo is preserved
- Booth frames adopt the art style's linework approach
- Gold knotwork border wraps the entire zone
- Zone title appears in serif font at top

## Tier 2: The Village ($79/month)

### Builder Interface
- 3 connected zone areas (with transition paths between them)
- Terrain editor: elevation, water features (ponds, streams), paths
- 50x50 grid per zone
- Up to 50 vendor booths total across all 3 zones
- Video upload for booth previews (not just photos)
- Custom branding within Inn framework (choose accent color, custom zone name font)
- World Map integration (faire appears as a pin on the Geode Inn World Map)
- All 37 art styles available
- Transition paths: visual connections between zones (stone paths, bridges, gates)

### Additional Features
- Zone-to-zone navigation for visitors (click a path to walk to the next zone)
- Mini-map showing all 3 zones
- Weather preset (sunny, cloudy, rainy, snowy — affects lighting only, not gameplay)
- Booth categories auto-sort into visual groupings (food, crafts, performance, etc.)

## Tier 3: The Kingdom ($199/month)

### Builder Interface
- Up to 10 connected zone areas
- Full environment editor:
  - Terrain: full elevation, water, vegetation placement
  - Weather controls: real-time weather slider (clear → cloudy → rain → storm → snow)
  - Day/night cycle: 24-hour slider with real-time lighting changes
  - Ambient sound upload (faire owner's own audio or Inn DSP profiles)
- Unlimited vendor booths
- Style blending: primary style + accent style (app layering)
- White-label option: remove Inn gold border, replace with custom border
- World Map featured placement (larger pin, highlighted)
- Zone transitions: custom transition effects (fade, dissolve, walk-through)

### Advanced Features
- NPC placement: place Inn NPCs in the zone as guides/entertainment
- Quest integration: create simple quests for visitors (find 3 booths, collect a stamp)
- Analytics dashboard: visitor count, booth click-through rates, popular paths
- Seasonal overlays: automatically adjust zone for faire season (spring bloom, autumn leaves, winter snow)
- Multi-zone storytelling: create a narrative path through the zones

## Art Style Application System

### How It Works
Each of the 37 art styles is implemented as a CSS/Canvas filter combination:

1. **Color grading:** Adjusts the uploaded photo's color palette toward the artist's signature range
2. **Texture overlay:** Adds a subtle texture matching the artist's medium (oil impasto for Van Gogh, watercolor bleed for Monet, ink crosshatch for Doré)
3. **Border treatment:** Booth frames and zone borders adopt the artist's linework style
4. **Lighting shift:** Adjusts ambient lighting to match the artist's typical lighting (warm for Klimt, cool for Carr, dramatic for Royo)

### Copyright Shield
- Faire owners CANNOT upload their own art styles
- They can ONLY choose from the Inn's 37-artist catalog
- This ensures no copyrighted art style is applied to a commercial zone
- The filter is applied server-side and watermarked in the zone metadata
- If a faire owner cancels, their zone reverts to unstyled (raw photos only)

## Audio Integration

- Each zone defaults to one of the 7 Inn DSP room profiles
- Tier 3: faire owners can upload custom ambient audio
- All zones: background music plays at 50 BPM (the Inn heartbeat)
- Frequency mode: zones can be set to Living (42Hz), Shadow (84Hz), or In-Between
- This affects the audio profile and the visual lighting warmth

## Publishing Flow

1. Faire owner builds zone in the builder interface
2. Auto-saves to FaireVenue entity as draft
3. "Preview" shows the zone exactly as visitors will see it
4. "Publish" makes the zone live at share-wood.geodeinn.com/[faire-slug]
5. No approval process — published instantly
6. "Pause" takes the zone offline temporarily (keeps all data)
7. "Unpublish" removes the zone but keeps the data in the FaireVenue record

## Visitor Experience

- Visitors access the zone via the share-wood URL or the World Map pin
- No login required to browse
- Click a vendor booth → opens booth card with photo/video, description, and external link
- The external link goes to the vendor's actual shop (the Inn never handles transactions)
- Visitors can "favorite" booths (stored in localStorage, no account needed)
- Zone ambient audio plays automatically (can be muted)
- Mobile-optimized (most faire visitors will be on phones)

## Technical Constraints

- Max background photo size: 10MB (auto-resized to 1920x1080)
- Max video size: 50MB per booth (stored in Base44 file storage)
- Max zone areas: 1 (Clearing) / 3 (Village) / 10 (Kingdom)
- Max booths: 20 (Clearing) / 50 (Village) / Unlimited (Kingdom)
- Zone loads in under 3 seconds on mobile (lazy-load media)
- All media served from Base44 CDN

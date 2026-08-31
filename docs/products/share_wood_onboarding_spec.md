# Share Wood — Onboarding Flow & Zone Builder Spec

## Overview

The onboarding flow for Share Wood — the Renaissance faire digital extension product. Faire owners subscribe, choose their tier, pick from the Inn's 37 artist styles, and build their digital faire zone using their own media (videos, photos). Self-service model: no red tape, no approval process.

## Route

`/share-wood`

## Tier System

### Tier 1: The Clearing — $29/month
- Choose from 8 Inn artist styles
- 1 digital zone (single area)
- Up to 20 vendor booths
- Basic zone builder (drag-and-drop layout)
- Inn-branded framework (gold knotwork border)
- Standard support

### Tier 2: The Village — $79/month
- Choose from all 37 Inn artist styles
- 3 connected digital zones
- Up to 50 vendor booths
- Advanced zone builder (terrain, water features, paths)
- Custom branding within Inn framework
- Map integration (faire grounds appear on World Map)
- Priority support
- Subscription billing via Stripe

### Tier 3: The Kingdom — $199/month
- Style blending (choose 2 styles as primary + accent)
- Up to 10 connected digital zones
- Unlimited vendor booths
- Full zone builder (weather, day/night cycle, ambient sound)
- White-label option (remove Inn branding, custom border)
- World Map featured placement
- Dedicated support
- Annual billing option (2 months free)

---

## Onboarding Flow (7 steps)

### Step 1: Welcome
- "Welcome to Share Wood" — Inn serif typography, dark stone background
- Brief video/animation: "What Share Wood does" (60 seconds)
- "Begin" button

### Step 2: Faire Information
- Faire name (required)
- Physical location (optional — maps to digital zone climate)
- Physical season (optional — affects zone lighting)
- Website URL (optional)
- Owner contact name (required)
- Owner email (required)
- Data saves to FaireVenue entity

### Step 3: Choose Tier
- 3 cards side by side: The Clearing / The Village / The Kingdom
- Each shows: price, features list, "Choose" button
- Comparison table toggle
- Subscription billing explanation
- "The subscription is the only barrier. No approval process. No gatekeeping. You publish when ready."

### Step 4: Choose Art Style
- Tier 1: 8 styles shown as thumbnails (Klimt, Royo, Van Gogh, O'Keeffe, Bierstadt, Rackham, Hokusai, Dore)
- Tier 2: All 37 styles shown in a scrollable gallery
- Tier 3: Style blender — pick primary style + accent style, preview the blend
- Each style shows: artist name, example image, zones it works best with
- "This is the copyright shield. You don't upload your own art style. You choose from the Inn's curated catalog. No faire can apply a copyrighted art style to their zone."

### Step 5: Build Your Zone
- Zone builder interface (varies by tier):
  - Tier 1: Simple drag-and-drop. Place vendor booths on a grid. Upload a background photo. Done.
  - Tier 2: Terrain editor. Add water features, paths, elevation. Place booths in a 3D-ish environment. Upload videos for booth previews.
  - Tier 3: Full environment editor. Weather controls, day/night slider, ambient sound upload. Multiple connected zones with transition paths.
- Each vendor booth fields: vendor name, vendor category, external URL (their shop), photo/video, description
- "Publish when ready" button — no approval needed

### Step 6: Connect to World Map (Tier 2+ only)
- Place your faire on the Geode Inn World Map
- Choose a geographic pin (lat/lng)
- Your faire appears as a clickable pin on the world map
- Players discover your faire through exploration

### Step 7: Go Live
- Preview your zone
- "Publish" button — instantly live
- Shareable URL generated (geodeinn.com/share-wood/your-faire-name)
- "Welcome to Share Wood. You're live."

---

## Zone Builder Technical Details

### Tier 1 Builder
- **Layout:** Grid-based (10×10 cells)
- **Elements:** Vendor booth, path, decoration, entrance portal
- **Background:** Single uploaded image (the faire's photo)
- **Output:** Static HTML5 zone page
- **Data:** Stored in FaireVenue entity (zoneAssignment, digitalZoneName, digitalZoneStatus)

### Tier 2 Builder
- **Layout:** Free-form canvas with snap-to-grid option
- **Elements:** Vendor booth, path, water feature, elevation marker, decoration, entrance portal, transition zone
- **Background:** Uploaded image OR Inn-generated terrain
- **Video:** Each booth can have a 15-second video preview
- **Output:** Interactive HTML5 zone with clickable booths
- **Multiple zones:** Up to 3 connected by transition paths

### Tier 3 Builder
- **Layout:** Full free-form canvas
- **Elements:** Everything in Tier 2 + weather controller, day/night cycle, ambient sound layer, NPC placement
- **Background:** Multi-layer (sky, terrain, foreground)
- **Video:** Full video booth previews (30 seconds)
- **Output:** Rich interactive zone with environmental effects
- **Multiple zones:** Up to 10 connected with load transitions
- **White-label:** Custom border replaces Inn gold knotwork

---

## Data Model

Uses existing FaireVenue entity:
- `faireName` — from Step 2
- `physicalLocation` — from Step 2
- `physicalSeason` — from Step 2
- `websiteUrl` — from Step 2
- `ownerNames` / `ownerContact` — from Step 2
- `subscriptionTier` — from Step 3 (The Clearing / The Village / The Kingdom)
- `subscriptionStatus` — active, past_due, cancelled
- `rentalFee` — monthly cost based on tier
- `zoneAssignment` — Inn zone where the faire is located
- `digitalZoneName` — user-named digital zone
- `digitalZoneStatus` — draft, published, archived
- `vendorCount` — number of vendor booths
- `mapPinLat` / `mapPinLng` — World Map placement (Step 6)
- `fairTheme` — chosen art style from Step 4
- `ticketUrl` — optional ticketing link

---

## Backend Functions Needed

### createFaireAccount
- Input: faireName, ownerName, ownerEmail, tier
- Output: FaireVenue record created
- Logic: Create FaireVenue record with subscription info, trigger Stripe subscription setup

### publishFaireZone
- Input: faireId, zoneData
- Output: Published zone URL
- Logic: Validate zone data, update FaireVenue digitalZoneStatus to "published", generate shareable URL

### updateFaireZone
- Input: faireId, zoneData
- Output: Updated zone
- Logic: Update zone data, keep published status

---

## Subscription Billing

- **Stripe integration** (existing Base44 Stripe support)
- Monthly billing on the subscription date
- Failed payment: 7-day grace period, then zone goes to "draft" (unpublished but saved)
- Cancellation: Zone stays live until end of billing period, then archives

---

*"Sherwood isn't a place. It's a sharing. The woods belong to everyone who's willing to stand in them."*

**— Share Wood Onboarding Spec v1.0**

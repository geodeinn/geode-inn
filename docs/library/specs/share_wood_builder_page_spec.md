# Share Wood — Builder Page Spec

## Route: `/share-wood`

## Overview
Share Wood is the Geode Inn's Renaissance faire digital extension. Faire owners subscribe, pick an art style from the Inn's 37-artist catalog, and build their own digital faire zone using a drag-and-drop builder. Self-service, no approval process.

---

## Page Sections

### Section 1: Hero
- Dark stone background, gold Celtic-knotwork border
- Title: "Share Wood" in serif typography (antiqued gold)
- Subtitle: "Sherwood isn't a place. It's a sharing. The woods belong to everyone who's willing to stand in them."
- Call-to-action button: "Begin Your Faire" → scrolls to onboarding flow
- Background image: `https://base44.app/api/apps/6a53cbfe78c5827e0055fffa/files/mp/public/6a53cbfe78c5827e0055fffa/[share_wood_hero]` (use a forest clearing image with warm firelight)

### Section 2: How It Works (3-column)
Three cards explaining the flow:
1. **Choose Your Tier** — "From a single clearing to an entire kingdom. Pick the size of your digital faire."
2. **Choose Your Style** — "Select from the Inn's curated 37-artist catalog. This is your copyright shield — no custom art styles, no infringement risk."
3. **Build & Publish** — "Drag-and-drop your vendor booths, upload photos and videos, hit publish. No gatekeeping, no waiting."

### Section 3: Tier Comparison
Three pricing cards side by side, dark stone with gold borders:

**The Clearing — $29/month**
- 1 digital zone
- Up to 20 vendor booths
- 8 Inn artist styles
- Basic drag-and-drop builder
- Inn-branded framework
- Standard support

**The Village — $79/month**
- 3 connected digital zones
- Up to 50 vendor booths
- All 37 Inn artist styles
- Advanced builder (terrain, water, paths)
- Custom branding within Inn framework
- World Map integration
- Priority support

**The Kingdom — $199/month**
- Up to 10 connected digital zones
- Unlimited vendor booths
- Style blending (2 styles)
- Full builder (weather, day/night, ambient sound)
- White-label option
- World Map featured placement
- Dedicated support
- Annual billing (2 months free)

Each card has a "Choose This Tier" button → opens onboarding flow

### Section 4: Art Style Gallery
- Scrollable gallery showing all 37 Inn artist styles as thumbnails
- Each thumbnail: artist name, example artwork, zones it works best with
- Filterable by category (Main Floor, Underground, Fae, Water, Cosmology, Exterior)
- Note: "This is the copyright shield. Faires choose from curated styles. No uploading custom art."

### Section 5: Onboarding Flow (7-step wizard)
When user clicks "Begin Your Faire" or a tier's "Choose" button, a multi-step wizard appears:

**Step 1: Welcome**
- "Welcome to Share Wood" with brief intro text
- "Begin" button

**Step 2: Faire Information**
Form fields:
- Faire name (required)
- Physical location (optional — maps to digital zone climate)
- Physical season (optional — affects lighting)
- Website URL (optional)
- Owner contact name (required)
- Owner email (required)
- "Continue" button → calls `createFaireAccount` backend function with selected tier

**Step 3: Choose Tier** (if not pre-selected)
Three tier cards (same as Section 3) with "Choose" buttons

**Step 4: Choose Art Style**
- Tier 1: 8 styles shown as clickable thumbnails
- Tier 2: All 37 styles in scrollable gallery
- Tier 3: Style blender — pick primary + accent, preview the blend
- Selected style saved to `fairTheme` field via `updateFaireZone`
- "Continue" button

**Step 5: Build Your Zone**
Zone builder interface (varies by tier):
- **Tier 1**: Grid-based 10×10, drag-and-drop vendor booths, upload background photo
- **Tier 2**: Free-form canvas with terrain, water, paths, up to 3 connected zones
- **Tier 3**: Full environment editor, weather, day/night, ambient sound, up to 10 zones
Each vendor booth has:
  - Vendor name
  - Vendor category (dropdown)
  - External URL (their shop)
  - Photo or video upload
  - Description text

**Step 6: World Map Placement**
- Interactive map (same World Map component used for the Inn's 37 zones)
- Click to place faire pin → saves mapPinLat/mapPinLng
- Tier 1: placement not available
- Tier 2 & 3: faire appears on World Map

**Step 7: Review & Publish**
- Summary of all choices: name, tier, style, vendor count, map location
- "Publish My Faire" button → calls `publishFaireZone` backend
- Success state: "Your faire is live! Share this link with your vendors: [generated URL]"

### Section 6: My Faire Dashboard (for logged-in faire owners)
If user has an existing FaireVenue record:
- Shows their faire zone status (draft/published/archived)
- Vendor count, tier, renewal date
- "Edit Zone" button → returns to Step 5
- "View Published Zone" button → opens their zone page
- "Update Info" button → returns to Step 2

---

## Backend Functions (already deployed)

### createFaireAccount
- POST with: `faireName`, `ownerName`, `ownerEmail`, `tier`, `physicalLocation?`, `physicalSeason?`, `websiteUrl?`
- Creates FaireVenue record with subscription info
- Returns: `faireId`, `monthlyFee`, `digitalZoneStatus: "draft"`

### updateFaireZone
- POST with: `faireId` + optional fields (`zoneName`, `vendorCount`, `fairTheme`, `mapPinLat`, `mapPinLng`, `ticketUrl`, `websiteUrl`, `physicalLocation`, `physicalSeason`, `digitalZoneStatus`)
- Updates zone data on existing FaireVenue record
- Returns: updated `zoneName`, `status`, `vendorCount`

### publishFaireZone
- POST with: `faireId` + optional fields (`zoneName`, `vendorCount`, `fairTheme`, `mapPinLat`, `mapPinLng`, `ticketUrl`)
- Validates subscription is active
- Sets `digitalZoneStatus` to "published"
- Returns: success message with shareable confirmation

---

## Data Model (FaireVenue entity — already exists)
All fields are already defined in the FaireVenue entity:
- `faireName` — string
- `ownerNames` — string (contact name)
- `ownerContact` — string (email)
- `physicalLocation` — string
- `physicalSeason` — string
- `websiteUrl` — string
- `subscriptionTier` — string (The Clearing / The Village / The Kingdom)
- `subscriptionStatus` — string (active / past_due / cancelled)
- `rentalFee` — string (monthly cost)
- `zoneAssignment` — string (Share Wood)
- `digitalZoneName` — string (user-named zone)
- `digitalZoneStatus` — string (draft / published / archived)
- `vendorCount` — number
- `mapPinLat` — number
- `mapPinLng` — number
- `fairTheme` — string (chosen art style)
- `ticketUrl` — string

---

## Subscription Billing
- Use Base44 Stripe integration for subscription billing
- Monthly billing on subscription date
- Failed payment: 7-day grace period, then zone goes to "draft" (unpublished but saved)
- Cancellation: zone stays live until end of billing period, then archives

---

## Visual Style
- Dark subterranean stone background (same as rest of Inn)
- Gold/brass Celtic-knotwork borders
- Antiqued gold serif typography for headings
- Warm firelight accents for CTAs
- Forest clearing imagery for hero section
- Consistent with the Inn's established aesthetic (Klimt stillness + Royo drama)

---

## Existing Assets
- Share Wood product spec: `library/mechanics/share_wood_product_spec.md`
- Share Wood onboarding spec: `docs/library/specs/share_wood_onboarding_spec.md`
- Share Wood zone builder spec: `docs/library/specs/share_wood_zone_builder_spec.md`
- Share Wood demo HTML: `docs/library/html-demos/share_wood_product_demo.html`

All three backend functions are deployed and tested:
- `createFaireAccount` ✅
- `publishFaireZone` ✅
- `updateFaireZone` ✅

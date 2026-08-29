# Geode Inn — Stone Faceting Classification
## Bead Finish Rules & Database Status

---

## THE FACETING RULE

The Geode Inn's Bead Composer uses a strict classification to determine which stones receive faceted beads and which receive smooth beads:

1. **Opaque stones → SMOOTH** (no faceting)
   - Exception: Black Onyx (faceted despite opaque)
   - Exception: All Tourmalines (faceted despite opaque)

2. **Translucent stones → FACETED**
   - Exception: Opals (smooth — EXCEPT Fire Opal, which is faceted)

3. **Fire Opal** is the ONLY faceted opal.

---

## DATABASE STATUS (Aug 29, 2026)

All 164 stones in the Stone entity have been classified with `canFacet` (boolean), `beadFinish` ("smooth" or "faceted"), and `opacity` ("opaque" or "translucent") fields.

### Summary
- **63 smooth stones** (canFacet: false, beadFinish: "smooth")
- **101 faceted stones** (canFacet: true, beadFinish: "faceted")

### Smooth Stone Families
| Family/Category | Count | Stones |
|---|---|---|
| Turquoise | 2 | Turquoise (Americas), Turquoise (Tibetan) |
| Jasper (category) | 7 | Picasso, Picture, Sunset, Bumblebee, Desert, Leopardskin, Ocean |
| Tiger's Eye (category) | 3 | Blue, Brown, Red |
| Sodalite | 2 | Sodalite, Sodalite (African) |
| Volcanic Glass (Obsidian) | 3 | Gold Sheen, Rainbow, Snowflake |
| Coral | 2 | Black, Branch |
| Native Element (Metal) | 3 | Gold, Copper, Platinum |
| Chalcedony (individual) | 5 | Pietersite, Tiger Iron, Hawk's Eye, Bloodstone, Moukaite |
| Silica (Opals) | 4 | Black Opal, Blue Opal (Peruvian), Boulder Opal, Water Opal |
| Single-stone families | 31 | Unakite, Septarian, Shungite, Pearl, Jet, Kammererite, Lepidolite, Malachite, Hematite, Hypersthene, Nuummite, Chinese Writing Stone, Chrysocolla (x2), Chrysanthemum Stone, Covellite, Cuprite, Ammolite, Ammonite, Angelite, Eudialyte, Bronzite, Petrified Wood, Preseli Blue Stone, Charoite, Rhodonite, Staurolite, Azurite, Abalone, Amazonite, Petrified palm wood |

### Faceted Exemptions (opaque but faceted)
| Stone | Family | Reason |
|---|---|---|
| Black Onyx | Chalcedony | Onyx exception — faceted despite opaque |
| Black Tourmaline | Tourmaline | Tourmaline exception — all tourmalines faceted despite opaque |

### Faceted Opal Exception
| Stone | Family | Finish |
|---|---|---|
| Fire Opal | Silica | Faceted (the ONLY faceted opal) |

---

## BEAD COMPOSER INTEGRATION

The `canFacet` field determines which bead shapes are available in the Bead Composer:
- **canFacet: true** → Full shape range including rounds, ovals, cushions, marquise, pear, and fancy cuts
- **canFacet: false** → Smooth shapes only: rounds, barrels, drums, coins, and freeform polished shapes

The `beadFinish` field provides the display label ("smooth" or "faceted") for UI rendering.
The `opacity` field provides additional context for the stone's visual appearance in the composer.

import json

recipes = [
    # ZONE 1: ANCIENT CHINA
    {
        "resultName": "Woven Bamboo & Silk Tea House",
        "buildingTier": 1,
        "materials": ["bamboo", "silk", "lacquer"],
        "quantities": [50, 15, 8],
        "description": "An airy roadside tea house crafted from lightweight split-bamboo screens, painted silk wall hangings, and dark lacquered serving counters.",
        "historicalNote": "Popularized in Song and Ming urban centers, tea houses served as vibrant social hubs where scholars, poets, and merchants gathered over tea brewed near rivers or garden paths."
    },
    {
        "resultName": "Lacquered Pavilion of the Moon",
        "buildingTier": 2,
        "materials": ["bamboo", "lacquer", "silk"],
        "quantities": [70, 30, 20],
        "description": "A circular garden structure featuring arched bamboo lattice windows, vibrant vermilion lacquered pillars, and silk sunshades for stargazing and moonlit poetry.",
        "historicalNote": "Circular moon gates and garden pavilions in Chinese landscape design symbolized completeness, rebirth, and celestial harmony, blending architecture with natural scenery."
    },
    {
        "resultName": "Siheyuan Courtyard Residence",
        "buildingTier": 2,
        "materials": ["brick", "bamboo", "lacquer"],
        "quantities": [120, 60, 15],
        "description": "A traditional four-sided courtyard home featuring grey fired-brick outer enclosure walls, structural bamboo roof rafters, and protective red lacquer finish on entry doors.",
        "historicalNote": "Based on Han-through-Ming residential design, where symmetrical courtyards provided family privacy, solar orientation, and axial harmony according to Feng Shui principles."
    },
    {
        "resultName": "Scholar's Garden Studio",
        "buildingTier": 3,
        "materials": ["bamboo", "silk", "lacquer", "jade"],
        "quantities": [80, 25, 20, 5],
        "description": "An elegant private retreat nestled among garden ponds, constructed from polished bamboo framing, silk window scrims, lacquered writing desks, and carved decorative jade inlay.",
        "historicalNote": "Ming scholars designed private garden studios (Shufang) in cities like Suzhou to contemplate literature, calligraphy, and painting away from official civil service pressures."
    },
    {
        "resultName": "Wind-and-Rain Covered Bridge",
        "buildingTier": 3,
        "materials": ["bamboo", "brick", "lacquer", "copper"],
        "quantities": [140, 180, 25, 15],
        "description": "A sheltered river bridge anchored by heavy fired-brick piers and topped with an ornate bamboo roof pavilion sealed in weather-proof lacquer with copper fittings.",
        "historicalNote": "Built by southern Chinese communities, covered bridges (Fengyu Qiao) provided shelter for travelers, social gathering spots, and weather protection for structural timber framing."
    },
    {
        "resultName": "Multi-Story Brick Pagoda",
        "buildingTier": 4,
        "materials": ["brick", "copper", "lacquer", "bamboo"],
        "quantities": [300, 40, 30, 90],
        "description": "A towering octagonal Buddhist pagoda constructed with heavy fired bricks, bamboo interior scaffolding frames, weather-resistant lacquer sealants, and a gleaming copper spire finial.",
        "historicalNote": "Evolving from Indian stupas, Chinese pagodas like Kaifeng's Iron Pagoda combined durable brick masonry with interlocking timber/bamboo internal frameworks and bronze/copper finials."
    },
    {
        "resultName": "Fortified City Wall Gatehouse",
        "buildingTier": 4,
        "materials": ["brick", "copper", "bamboo", "lacquer"],
        "quantities": [450, 60, 100, 25],
        "description": "A formidable garrison watchtower built over a massive fired-brick rampart, reinforced with copper-sheathed wooden doors, bamboo roof trusses, and dark lacquered beamwork.",
        "historicalNote": "Ming city walls (such as Xi'an and Nanjing) relied on high-kiln fired bricks bonded with sticky rice mortar and crowned with multi-tiered timber watchtowers."
    },
    {
        "resultName": "Imperial Dragon Pavilion",
        "buildingTier": 5,
        "materials": ["brick", "lacquer", "copper", "jade", "silk"],
        "quantities": [200, 80, 50, 20, 40],
        "description": "A grand royal pavilion set atop a raised brick terrace with cinnabar lacquered columns, copper roof ridge ornaments, silk interior canopy drapes, and inlaid jade dragon plaques.",
        "historicalNote": "Forbidden City palace architecture utilized cinnabar red lacquer, copper dragon ridge-beasts, and imperial jade emblems to symbolize supreme royal authority and cosmic balance."
    },

    # ZONE 2: ANCIENT INDIA
    {
        "resultName": "Garden Chhatri Pavilion",
        "buildingTier": 1,
        "materials": ["sandstone", "copper", "indigo"],
        "quantities": [60, 10, 8],
        "description": "An elegant elevated kiosk supported by carved sandstone pillars, capped with a stone cupola dome, a copper spire, and indigo fresco accents under the eaves.",
        "historicalNote": "Chhatri (meaning umbrella or canopy) pavilions were constructed across Rajasthan as royal garden shelters and memorial monuments symbolizing honor and shade."
    },
    {
        "resultName": "Teak & Sandalwood Timber Manor",
        "buildingTier": 2,
        "materials": ["teak", "sandalwood", "copper"],
        "quantities": [110, 35, 15],
        "description": "A traditional Southern Indian courtyard residence built with heavy joinery of monsoon-resistant teak timber, aromatic sandalwood door panels, and copper roof ridge caps.",
        "historicalNote": "Kerala's vernacular Nalukettu architecture utilized indigenous timber joinery engineered to withstand heavy monsoon rains around a central water-harvesting courtyard."
    },
    {
        "resultName": "Monsoonal Indigo Weaver's Workshop",
        "buildingTier": 2,
        "materials": ["teak", "sandstone", "indigo", "copper"],
        "quantities": [75, 50, 30, 12],
        "description": "An artisan studio featuring sturdy teak loom frameworks, a sandstone floor basin for indigo dye vats, indigo-stained drying racks, and copper boiling kettles.",
        "historicalNote": "India was the ancient world's premier exporter of natural indigo dye (Indigofera tinctoria), utilizing specialized stone masonry dye vats across Gujarat, Bengal, and the Deccan."
    },
    {
        "resultName": "Subterranean Stepwell Pavilion",
        "buildingTier": 3,
        "materials": ["sandstone", "copper", "teak"],
        "quantities": [250, 30, 60],
        "description": "A subterranean multi-story water reservoir built with precision-carved sandstone steps, teak structural bracing, and decorative copper water-spouts and lanterns.",
        "historicalNote": "Western Indian stepwells (Baori/Vav, such as Rani ki Vav) served as vital seasonal water storage, subterranean cooling retreats, and ornate sanctuaries dedicated to water spirits."
    },
    {
        "resultName": "Carved Sandstone Haveli",
        "buildingTier": 3,
        "materials": ["sandstone", "teak", "indigo", "sandalwood"],
        "quantities": [200, 90, 15, 10],
        "description": "A grand merchant courtyard residence featuring intricately carved sandstone jharokha balconies, durable teak beams, indigo-pigmented plaster walls, and carved sandalwood doorways.",
        "historicalNote": "Urban havelis in Rajasthan and Gujarat showcased mercantile wealth through delicate stone lattice carving (jali) and central open courtyards designed for natural evaporative cooling."
    },
    {
        "resultName": "Rock-Cut Cave Shrine Sanctuary",
        "buildingTier": 4,
        "materials": ["sandstone", "teak", "indigo"],
        "quantities": [280, 70, 20],
        "description": "A cave sanctuary excavated into cliff faces, reinforced with carved sandstone arch facades, teak vaulted ceiling ribs, and rich indigo-dyed wall murals in the interior chamber.",
        "historicalNote": "Directly inspired by Ajanta and Ellora caves, Buddhist and Hindu rock-cut chaityas featured wooden structural forms carved directly into living rock and decorated with mineral paintings."
    },
    {
        "resultName": "Nagara-Style Stone Temple",
        "buildingTier": 4,
        "materials": ["sandstone", "copper", "sandalwood"],
        "quantities": [350, 45, 25],
        "description": "A majestic northern-style Hindu temple featuring a soaring curvilinear sandstone tower (shikhara), a copper kalasha spire crest, and sandalwood temple doors carved with deities.",
        "historicalNote": "Classical Nagara temples (e.g., Khajuraho and Sun Temple Konark) used interlocking ashlar stone masonry assembled without mortar, crowned with an amalaka disc and copper spire."
    },
    {
        "resultName": "Royal Sandstone Palace & Chhatri",
        "buildingTier": 5,
        "materials": ["sandstone", "teak", "copper", "sandalwood", "indigo"],
        "quantities": [400, 120, 60, 30, 25],
        "description": "An opulent palatial complex topped with domed chhatri pavilions, teak interior pillars, copper-sheathed dome spires, aromatic sandalwood doors, and indigo decorative trim.",
        "historicalNote": "Rajput and Mughal imperial palaces combined indigenous Rajasthani stone craftsmanship and shaded courtyard layouts with ornate metalwork and aromatic timber finishes."
    }
]

# Validation checks
allowed_materials_z1 = {"bamboo", "lacquer", "copper", "jade", "brick", "silk"}
allowed_materials_z2 = {"teak", "sandalwood", "copper", "sandstone", "indigo"}

print(f"Total recipes: {len(recipes)}")
assert len(recipes) == 16, "Should have 16 recipes total (8 per zone)"

for i, r in enumerate(recipes):
    # Check fields
    assert "resultName" in r
    assert "buildingTier" in r
    assert "materials" in r
    assert "quantities" in r
    assert "description" in r
    assert "historicalNote" in r
    
    assert 1 <= r["buildingTier"] <= 5
    assert len(r["materials"]) == len(r["quantities"])
    
    # Check material validity
    if i < 8:
        for m in r["materials"]:
            assert m in allowed_materials_z1, f"Invalid Zone 1 material: {m}"
    else:
        for m in r["materials"]:
            assert m in allowed_materials_z2, f"Invalid Zone 2 material: {m}"

print("All validations passed successfully!")

# Format nicely
output_json = json.dumps(recipes, indent=2)
with open("recipes.json", "w") as f:
    f.write(output_json)

print("Saved recipes.json")

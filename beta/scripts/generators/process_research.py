import json

recipes = [
    # ZONE 1: Ancient Greece
    {
        "resultName": "Limestone Megaron",
        "buildingTier": 1,
        "materials": ["limestone", "olive wood"],
        "quantities": [20, 10],
        "description": "A single-room rectangular hall featuring a central hearth, supported by sturdy olive wood pillars and limestone foundations.",
        "historicalNote": "The megaron was the core architectural unit of Aegean civil architecture, forming the hall of Mycenaean palaces and evolving into early Classical temple plans."
    },
    {
        "resultName": "Olive Wood & Sandstone Shrine",
        "buildingTier": 1,
        "materials": ["sandstone", "olive wood", "copper"],
        "quantities": [15, 12, 4],
        "description": "A modest rural sanctuary built with carved sandstone blocks, olive wood roof posts, and decorative copper offeratory fittings.",
        "historicalNote": "Rural open-air shrines (temene) dedicated to local deities and nature spirits were prevalent throughout ancient Greece, often incorporating sacred olive trees."
    },
    {
        "resultName": "Mycenaean Cyclopean Wall Segment",
        "buildingTier": 2,
        "materials": ["limestone", "sandstone", "bronze"],
        "quantities": [45, 30, 8],
        "description": "A massive fortification wall constructed from unworked limestone boulders bound with sandstone aggregate and reinforced with bronze pins.",
        "historicalNote": "Mycenaean citadel fortifications used colossal, unworked limestone blocks so immense that later Classical Greeks believed they were built by the mythical Cyclopes."
    },
    {
        "resultName": "Classical Stoa Colonnade",
        "buildingTier": 3,
        "materials": ["marble", "limestone", "olive wood", "bronze"],
        "quantities": [35, 40, 25, 12],
        "description": "A covered public walkway lined with elegant marble columns, a limestone rear wall, and olive wood timber rafters decorated with bronze trim.",
        "historicalNote": "Stoas framed the perimeter of Greek agoras, offering sheltered walkways for public assembly, commerce, law courts, and philosophical debate."
    },
    {
        "resultName": "Ancient Greek Stone Theater",
        "buildingTier": 4,
        "materials": ["limestone", "marble", "sandstone", "olive wood"],
        "quantities": [80, 50, 40, 20],
        "description": "A hillside semi-circular theater constructed with tiered limestone seating (theatron), a marble circular orchestra, and olive wood stage structures.",
        "historicalNote": "Greek open-air theaters such as the one at Epidaurus exploited natural slope acoustics to accommodate thousands of spectators during religious dramatic festivals."
    },
    {
        "resultName": "Hellenistic Tholos Sanctuary",
        "buildingTier": 4,
        "materials": ["marble", "limestone", "copper", "bronze"],
        "quantities": [60, 35, 15, 18],
        "description": "An exquisite circular temple surrounded by marble columns resting on a limestone stylobate, topped with decorative copper and bronze roof elements.",
        "historicalNote": "The tholos was a sophisticated circular building type perfected during the Classical and Hellenistic periods, seen in sacred sanctuaries like Delphi and Olympia."
    },
    {
        "resultName": "Grand Marble Parthenon Temple",
        "buildingTier": 5,
        "materials": ["marble", "limestone", "bronze", "copper", "olive wood"],
        "quantities": [120, 70, 30, 20, 40],
        "description": "A monumental peripteral temple featuring fine marble Doric colonnades, internal bronze clamps, copper roof tiles, and carved olive wood interior doors.",
        "historicalNote": "Classical Greek temple architecture relied on ashlar marble blocks tightly fitted without mortar, locked together using internal iron or bronze dowels set in molten lead."
    },

    # ZONE 2: Celtic/Arthurian Britain
    {
        "resultName": "Celtic Wattle & Thatch Roundhouse",
        "buildingTier": 1,
        "materials": ["english oak", "thatch/reed", "heather"],
        "quantities": [15, 25, 10],
        "description": "A traditional circular dwelling constructed from an English oak timber frame with woven hazel/oak wattle, topped by a steep thatched reed and heather roof.",
        "historicalNote": "The roundhouse was the ubiquitous British residential building from the Bronze Age through the Iron Age, designed for aerodynamic wind resistance and thermal efficiency."
    },
    {
        "resultName": "Iron Age Bog Iron Smeltery",
        "buildingTier": 1,
        "materials": ["limestone", "bog iron", "thatch/reed", "english oak"],
        "quantities": [20, 15, 10, 10],
        "description": "A low bloomery furnace crafted from limestone blocks and clay to extract workable iron from bog ore, housed under a simple oak and thatched shelter.",
        "historicalNote": "Early British metallurgists extracted raw iron ore from peat bogs and smelted it using charcoal-fired clay and stone bloomery furnaces to forge tools and weapons."
    },
    {
        "resultName": "Celtic Hillfort Rampart & Gatehouse",
        "buildingTier": 2,
        "materials": ["english oak", "limestone", "bog iron"],
        "quantities": [50, 40, 15],
        "description": "A formidable fortified portal featuring a heavy English oak timber palisade, dry-stone limestone terrace walls, and iron-strapped entry doors.",
        "historicalNote": "Iron Age hillforts like Maiden Castle featured massive earthen ramparts revetted with dry-stone masonry and guarded by heavily timbered gateway structures."
    },
    {
        "resultName": "Arthurian Timber Mead Hall",
        "buildingTier": 3,
        "materials": ["english oak", "thatch/reed", "bog iron", "amber"],
        "quantities": [60, 35, 20, 5],
        "description": "A grand chieftain's hall built with heavy English oak posts and roof trusses, a thick thatched roof, iron hearth fixtures, and carved amber roof finials.",
        "historicalNote": "Timber feasting halls were the focal point of Anglo-Celtic leadership, where rulers entertained warrior bands, dispensed gifts, and held council around central hearths."
    },
    {
        "resultName": "Highland Heather Longbow Range",
        "buildingTier": 3,
        "materials": ["yew", "english oak", "heather", "bronze"],
        "quantities": [25, 30, 20, 8],
        "description": "A dedicated archery training field with carved yew bow racks, heather-packed target butts, and an English oak pavilion anchored with bronze fittings.",
        "historicalNote": "Yew was the premier wood for crafting British longbows due to its dual sapwood/heartwood elasticity, forming the backbone of medieval archery defense."
    },
    {
        "resultName": "Norman Motte & Bailey Fort",
        "buildingTier": 4,
        "materials": ["english oak", "limestone", "bog iron", "thatch/reed"],
        "quantities": [80, 60, 25, 30],
        "description": "A defensive complex featuring an elevated wooden keep on an earthen mound (motte), surrounded by a stone-founded bailey wall and iron-bound timber gate.",
        "historicalNote": "Introduced across Britain during the 11th century, motte-and-bailey fortresses allowed rapid military subjugation of regions using locally harvested oak and limestone."
    },
    {
        "resultName": "Arthurian Limestone Keep & Castle",
        "buildingTier": 5,
        "materials": ["limestone", "english oak", "bog iron", "bronze", "amber"],
        "quantities": [130, 75, 35, 15, 8],
        "description": "A monumental stone stronghold featuring thick limestone curtain walls, iron-sheathed oak portcullises, bronze door adornments, and an amber-inlaid throne room.",
        "historicalNote": "High Medieval stone castles combined military ashlar masonry with luxurious hall fittings, evolving from earlier wooden keeps into enduring symbols of feudal power."
    }
]

# Validation script
allowed_materials_zone1 = {"marble", "limestone", "olive wood", "bronze", "copper", "sandstone"}
allowed_materials_zone2 = {"english oak", "yew", "limestone", "bronze", "amber", "heather", "thatch/reed", "bog iron"}

for i, r in enumerate(recipes):
    # Check fields
    required_fields = ["resultName", "buildingTier", "materials", "quantities", "description", "historicalNote"]
    for f in required_fields:
        assert f in r, f"Recipe {i} missing field {f}"
    
    assert 1 <= r["buildingTier"] <= 5, f"Recipe {i} tier out of bounds"
    assert len(r["materials"]) == len(r["quantities"]), f"Recipe {i} materials/quantities length mismatch"
    assert all(isinstance(q, int) for q in r["quantities"]), f"Recipe {i} non-integer quantity"

    # Zone check
    if i < 7:
        for m in r["materials"]:
            assert m in allowed_materials_zone1, f"Zone 1 recipe '{r['resultName']}' uses invalid material '{m}'"
    else:
        for m in r["materials"]:
            assert m in allowed_materials_zone2, f"Zone 2 recipe '{r['resultName']}' uses invalid material '{m}'"

print("All recipes validated successfully!")
print(f"Total recipes: {len(recipes)}")
print(json.dumps(recipes, indent=2))

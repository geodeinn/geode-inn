import json

recipes = [
    # ZONE 1: Ancient Egypt (8 recipes)
    {
        "resultName": "Papyrus & Sandstone Worker Hut",
        "buildingTier": 1,
        "materials": ["papyrus", "sandstone"],
        "quantities": [20, 10],
        "description": "A modest shelter constructed with woven papyrus reed matting anchored to a rough sandstone rubble foundation.",
        "historicalNote": "Pre-dynastic and early dynastic Egyptian laborers constructed temporary shelters using native Nilotic papyrus reeds and dry-stacked local sandstone before mudbrick standardized residential construction."
    },
    {
        "resultName": "Deir el-Medina Craftsman Dwelling",
        "buildingTier": 2,
        "materials": ["sandstone", "papyrus", "copper"],
        "quantities": [45, 15, 5],
        "description": "A structured domestic residence featuring sandstone foundation walls, papyrus thatch roof mats, and forged copper door fittings and structural clamps.",
        "historicalNote": "Modeled after the artisan village of Deir el-Medina, where royal tomb craftsmen built contiguous stone-and-plaster row houses fitted with copper hardware and timber/reed lintels."
    },
    {
        "resultName": "Planned Workers' Village Quarters",
        "buildingTier": 2,
        "materials": ["sandstone", "papyrus"],
        "quantities": [55, 25],
        "description": "A uniform residential row module featuring durable sandstone foundations, papyrus reed internal partitions, and plaster-lined courtyards.",
        "historicalNote": "Planned workers' villages such as Kahun (Lahun) and Amarna housed laborers and artisans in organized grid layouts near monumental construction sites."
    },
    {
        "resultName": "Karnak Hypostyle Columned Hall",
        "buildingTier": 3,
        "materials": ["sandstone", "copper", "papyrus"],
        "quantities": [120, 20, 30],
        "description": "A monumental colonnaded sanctuary hall featuring massive sandstone columns shaped into papyrus-bud capitals using copper stonemason chisels.",
        "historicalNote": "Hypostyle halls like that of Karnak utilized sandstone columns modeled after papyrus stems in a primordial marsh, symbolizing creation and supporting massive stone architraves."
    },
    {
        "resultName": "Papyrus Expedition Scribe Archive",
        "buildingTier": 3,
        "materials": ["sandstone", "papyrus", "copper", "desert glass"],
        "quantities": [80, 50, 10, 15],
        "description": "An administrative archive constructed of carved sandstone with papyrus scroll storage niches, copper-latched boundary chests, and polished desert glass skylights.",
        "historicalNote": "Egyptian royal scribes recorded trade, quarrying, and grain yields on papyrus scrolls stored in stone chancelleries guarded by administrative seals."
    },
    {
        "resultName": "Desert Glass Sun Sanctuary",
        "buildingTier": 4,
        "materials": ["sandstone", "desert glass", "gold ore", "limestone (imported)"],
        "quantities": [180, 40, 15, 60],
        "description": "An open-air solar chapel built from dressed imported limestone and sandstone, featuring sacred scarab altars inlaid with golden leaf and Libyan desert glass.",
        "historicalNote": "Solar temples dedicated to Ra integrated rare Libyan desert glass—silica glass formed by ancient meteorite impacts in the Western Desert—as sacred cosmic amulets alongside fine imported Tura limestone."
    },
    {
        "resultName": "Gold-Capped Sandstone Obelisk",
        "buildingTier": 4,
        "materials": ["sandstone", "gold ore", "copper", "limestone (imported)"],
        "quantities": [250, 30, 25, 50],
        "description": "A tall, monolithic four-sided sandstone obelisk anchored on a fine imported limestone pedestal and topped with a gold-plated pyramidion.",
        "historicalNote": "Obelisks symbolized frozen sunbeams; their pyramidion tops (benben stones) were covered in gold or electrum leafing so they reflected the sun's first rays at dawn."
    },
    {
        "resultName": "Grand Mortuary Temple Complex",
        "buildingTier": 5,
        "materials": ["sandstone", "limestone (imported)", "gold ore", "copper", "desert glass", "papyrus"],
        "quantities": [400, 250, 50, 40, 30, 60],
        "description": "A grand multi-terraced funerary complex featuring fine imported limestone facings, carved sandstone colonnades, copper portal fittings, gold sacred vessels, and desert glass altars.",
        "historicalNote": "Mortuary complexes like Hatshepsut's at Deir el-Bahari combined high-grade imported limestone from Tura, sandstone terraces, and precious materials to commemorate the divine Pharaoh for eternity."
    },

    # ZONE 2: Ancient Mesopotamia (8 recipes)
    {
        "resultName": "Marshland Reed Mudhif",
        "buildingTier": 1,
        "materials": ["reed", "clay/mudbrick"],
        "quantities": [35, 15],
        "description": "A vaulted communal hall fashioned from bundled giant marsh reeds arched together and plastered with dense alluvial river clay.",
        "historicalNote": "Mudhifs are traditional reed architectural structures built by southern Mesopotamian marsh dwellers for over 5,000 years, relying on abundant marsh reeds and alluvial clay."
    },
    {
        "resultName": "Bitumen-Sealed Domestic House",
        "buildingTier": 2,
        "materials": ["clay/mudbrick", "bitumen", "reed"],
        "quantities": [60, 20, 25],
        "description": "A courtyard residential house built from sun-dried clay mudbricks, using natural bitumen for waterproofing floor layers and reed mats for ceiling support.",
        "historicalNote": "Mesopotamian homes in Ur and Uruk centered around internal courtyards, using naturally occurring petroleum bitumen from Hit as a waterproof sealant against river flooding."
    },
    {
        "resultName": "Bitumen-Sealed Royal Granary",
        "buildingTier": 2,
        "materials": ["clay/mudbrick", "bitumen", "reed"],
        "quantities": [80, 25, 30],
        "description": "A vaulted agricultural storage facility built with thick mudbrick walls, bitumen-lined grain silos, and reed-reinforced roof arches.",
        "historicalNote": "Mesopotamian city-states maintained centralized state granaries sealed with waterproof bitumen to protect grain stores against moisture and pests."
    },
    {
        "resultName": "Bitumen-Baked Brick Rampart",
        "buildingTier": 3,
        "materials": ["baked brick", "clay/mudbrick", "bitumen"],
        "quantities": [150, 100, 40],
        "description": "A heavy city defense wall consisting of a core of packed mudbrick encased in durable kiln-baked bricks set in heavy black bitumen mortar.",
        "historicalNote": "Mesopotamian military engineers protected cities like Babylon by cladding interior mudbrick ramparts with kiln-baked bricks laid in asphalt/bitumen, resisting both battering rams and water erosion."
    },
    {
        "resultName": "Glazed Lapis Gateway Tower",
        "buildingTier": 3,
        "materials": ["baked brick", "lapis lazuli", "bitumen"],
        "quantities": [120, 25, 30],
        "description": "A fortified entryway built of kiln-baked bricks glazed with shimmering deep blue lapis lazuli pigments, mortared together with pitch bitumen.",
        "historicalNote": "Monuments like Nebuchadnezzar's Ishtar Gate utilized cobalt and copper glazes to imitate lapis lazuli—the highly prized gemstone imported from Badakhshan across ancient trade networks."
    },
    {
        "resultName": "Terraced Hanging Garden Vault",
        "buildingTier": 4,
        "materials": ["baked brick", "bitumen", "reed", "clay/mudbrick"],
        "quantities": [200, 70, 60, 120],
        "description": "An elevated terraced vault composed of kiln-baked brick pillars lined with layers of bitumen and thick reed mats to retain rich agricultural soil high above ground.",
        "historicalNote": "The Legendary Hanging Gardens of Babylon featured tiered vaulted gardens where water seepage was prevented by waterproof layers of bitumen, reed matting, and burnt brick tiles."
    },
    {
        "resultName": "Lapis Inlaid Royal Citadel Palace",
        "buildingTier": 4,
        "materials": ["baked brick", "clay/mudbrick", "lapis lazuli", "bitumen", "reed"],
        "quantities": [220, 150, 30, 50, 40],
        "description": "A royal palace complex featuring throne rooms constructed from baked bricks, bitumen-sealed drainage channels, and walls encrusted with deep blue lapis lazuli reliefs.",
        "historicalNote": "Assyrian and Babylonian royal palaces (such as Nineveh and Babylon) showcased wealth through extensive lapis lazuli ornamentation, massive brick throne rooms, and advanced subterranean drainage."
    },
    {
        "resultName": "Great Stepped Ziggurat Temple",
        "buildingTier": 5,
        "materials": ["clay/mudbrick", "baked brick", "bitumen", "lapis lazuli", "reed"],
        "quantities": [500, 350, 100, 45, 80],
        "description": "A monumental multi-tiered stepped pyramid featuring a massive sun-dried mudbrick core, an exterior sheath of bitumen-bonded kiln-baked bricks, reed reinforcement courses, and a lapis lazuli high temple.",
        "historicalNote": "Ziggurats, like the Great Ziggurat of Ur built by King Ur-Nammu, contained millions of mudbricks reinforced with reed matting and sheathed in burnt brick laid in natural bitumen mortar."
    }
]

z1_allowed = {"sandstone", "desert glass", "papyrus", "limestone (imported)", "gold ore", "copper"}
z2_allowed = {"clay/mudbrick", "bitumen", "reed", "lapis lazuli", "baked brick"}

errors = []
for idx, r in enumerate(recipes):
    for field in ["resultName", "buildingTier", "materials", "quantities", "description", "historicalNote"]:
        if field not in r:
            errors.append(f"Recipe {idx} missing field {field}")
    if len(r["materials"]) != len(r["quantities"]):
        errors.append(f"Recipe {r['resultName']} length mismatch")
    if not (1 <= r["buildingTier"] <= 5):
        errors.append(f"Recipe {r['resultName']} invalid tier {r['buildingTier']}")
    
    zone = "Zone 1" if idx < 8 else "Zone 2"
    allowed = z1_allowed if idx < 8 else z2_allowed
    for m in r["materials"]:
        if m not in allowed:
            errors.append(f"Recipe {r['resultName']} uses unallowed material '{m}' for {zone}")

if errors:
    print("VALIDATION ERRORS:")
    for e in errors:
        print("-", e)
else:
    print(f"SUCCESS: All {len(recipes)} recipes validated successfully! ({sum(1 for i in range(8))} Zone 1, {sum(1 for i in range(8))} Zone 2)")
    with open("recipes.json", "w") as f:
        json.dump(recipes, f, indent=2)


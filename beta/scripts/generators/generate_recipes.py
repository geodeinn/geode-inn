import json

zone1_recipes = [
    {
        "resultName": "Ichu & Alder Storage Hut",
        "buildingTier": 1,
        "materials": ["andean alder", "reed (imported)"],
        "quantities": [12, 25],
        "description": "A basic shelter crafted from woven reed thatch supported by an Andean alder wood framework, used for temporary lodging or tool storage.",
        "historicalNote": "Inca folk architecture relied heavily on local timber framing thatched with wild reeds or ichu grass, providing lightweight, flexible shelter suited for high-altitude wind resistance."
    },
    {
        "resultName": "Inca Qullqa Storehouse",
        "buildingTier": 2,
        "materials": ["andesite", "andean alder", "reed (imported)"],
        "quantities": [25, 15, 30],
        "description": "A stone-and-thatch granary built on elevated slopes with ventilated gables to preserve grain and dried potatoes for imperial redistribution.",
        "historicalNote": "Qullqas were state storage units built along the Qhapaq Ñan (Inca road network). Constructed with stone foundations and thatch roofs, their ventilation channels protected food supplies against pests and moisture."
    },
    {
        "resultName": "Andenes Agricultural Terrace",
        "buildingTier": 3,
        "materials": ["andesite", "limestone (imported)", "andean alder"],
        "quantities": [40, 20, 10],
        "description": "A multi-layered agricultural terrace with dry-stone retaining walls and gravel drainage layers that optimize water retention and microclimate warmth.",
        "historicalNote": "Andenes transformed steep Andean slopes into arable land. Retaining walls absorbed heat during the day and radiated it back at night, preventing frost damage to crops like maize and tubers."
    },
    {
        "resultName": "Inca Aqueduct Channel",
        "buildingTier": 3,
        "materials": ["andesite", "limestone (imported)"],
        "quantities": [50, 30],
        "description": "A stone-carved hydraulic channel designed to channel glacial snowmelt into agricultural fields and highland settlements with precise gradient flow.",
        "historicalNote": "Incan hydraulic engineering featured finely fitted stone aqueducts (pukios) capable of conveying water across miles of rugged terrain without mortar, utilizing precise gravity gradients."
    },
    {
        "resultName": "Kallanka Great Hall",
        "buildingTier": 4,
        "materials": ["andesite", "andean alder", "reed (imported)", "limestone (imported)"],
        "quantities": [80, 45, 60, 35],
        "description": "A monumental rectangular hall featuring multiple trapezoidal doors, polished stone walls, and a tall alder timber roof frame capped with thick reed thatch.",
        "historicalNote": "Kallankas were massive communal halls in Inca administrative centers, serving as gathering places for state banquets, military quarters, and official ceremonies."
    },
    {
        "resultName": "Ashlar Stone Platform & Gate",
        "buildingTier": 4,
        "materials": ["andesite", "limestone (imported)", "gold ore"],
        "quantities": [100, 50, 10],
        "description": "An imperial stone gateway featuring polygonal ashlar masonry fitted without mortar, accented with gold ore inlay along the lintel.",
        "historicalNote": "Inca stonemasons crafted mortarless polygonal ashlar masonry using friction fitting and stone hammers. Trapezoidal doors and tightly fitted blocks allowed structures to withstand major earthquakes."
    },
    {
        "resultName": "Imperial Sun Usnu Platform",
        "buildingTier": 5,
        "materials": ["andesite", "limestone (imported)", "gold ore", "andean alder", "reed (imported)"],
        "quantities": [150, 80, 35, 40, 50],
        "description": "A grand multi-tiered ceremonial platform faced with fine ashlar stone and rich gold leaf ornamentation, capped with an imperial canopy for ruler rituals.",
        "historicalNote": "The Usnu was a sacred stepped platform situated in central plazas where the Sapa Inca performed religious rites, libations, and military reviews. At major temples like Coricancha, walls were encased in beaten gold plates."
    }
]

zone2_recipes = [
    {
        "resultName": "Acadian Palmetto & Cypress Shelter",
        "buildingTier": 1,
        "materials": ["cypress", "reed", "bog moss"],
        "quantities": [15, 20, 10],
        "description": "A primitive frontier cabin constructed from split cypress logs, woven reed thatch, and bog moss chinking.",
        "historicalNote": "Early Acadian settlers (Cajuns) in southern Louisiana adapted to the swamp environment by building simple lean-tos and cabins with naturally rot-resistant cypress framing and local thatch materials."
    },
    {
        "resultName": "Bayou Smokehouse & Potager",
        "buildingTier": 2,
        "materials": ["cypress", "bog iron", "spanish moss", "honey"],
        "quantities": [25, 10, 15, 5],
        "description": "A small cypress timber outbuilding with bog-iron hinges and a clay-moss lining for curing meats, paired with a herb and kitchen garden enclosure.",
        "historicalNote": "Smokehouses (boucanières) and kitchen gardens (potagers) were vital components of Creole homesteads for food preservation, using smoke and honey curing techniques alongside ironware."
    },
    {
        "resultName": "Bousillage Shotgun House",
        "buildingTier": 2,
        "materials": ["cypress", "spanish moss", "bog moss", "bog iron"],
        "quantities": [35, 25, 20, 12],
        "description": "A narrow, single-story home featuring room-behind-room alignment, built on elevated cypress stilts with mud-and-spanish-moss bousillage wall infill.",
        "historicalNote": "Shotgun houses were popular folk dwellings in Creole New Orleans and rural bayous, designed for narrow urban plots and long cross-ventilation during hot, humid summers."
    },
    {
        "resultName": "Raised Acadian Cottage",
        "buildingTier": 3,
        "materials": ["cypress", "spanish moss", "bog iron", "reed"],
        "quantities": [55, 30, 18, 25],
        "description": "A cozy elevated cottage resting on rot-resistant cypress piers, featuring bousillage insulation, a steep gabled roof, and a shaded gallery porch.",
        "historicalNote": "Raised cottages elevated living spaces 3 to 6 feet above ground level to escape seasonal bayou flooding, dampness, and pests while maximizing breeze airflow underneath."
    },
    {
        "resultName": "Creole Gallery Plantation House",
        "buildingTier": 4,
        "materials": ["cypress", "spanish moss", "bog iron", "reed", "honey"],
        "quantities": [90, 45, 30, 40, 15],
        "description": "A spacious Creole residence with a surrounding gallery porch, cypress plank siding, hand-forged bog iron fasteners, and honey-treated wood sealants.",
        "historicalNote": "French and Spanish Creole folk architecture featured wide wrap-around galleries (perrons) shaded by deep roof eaves, protecting timber bousillage walls from torrential tropical downpours."
    },
    {
        "resultName": "Bayou Forged Workshop & Forge",
        "buildingTier": 4,
        "materials": ["bog iron", "cypress", "bog moss", "reed"],
        "quantities": [60, 50, 25, 20],
        "description": "A heavy-timbered smithy and workshop outfitted with bog-iron fittings, reinforced hearth walls, and high-ventilation thatched gables.",
        "historicalNote": "Smelting and forging iron ore extracted from local bogs provided nails, strap hinges, sugar-kettle supports, and architectural ironwork essential for French-colonial Creole settlements."
    },
    {
        "resultName": "Grand Creole Plantation Manor",
        "buildingTier": 5,
        "materials": ["cypress", "spanish moss", "bog iron", "honey", "reed", "bog moss"],
        "quantities": [140, 60, 50, 25, 45, 30],
        "description": "An opulent two-story raised Creole mansion featuring colonnaded cypress galleries, intricate wrought bog-iron balustrades, bousillage insulation, and polished honey-waxed finishes.",
        "historicalNote": "Grand Creole plantation houses combined Native American, French, and Caribbean folk traditions. Heavy cypress structural posts (poteaux-sur-sole), mud-and-moss bousillage wall panels, and wrought-iron craftsmanship defined these iconic bayou landmarks."
    }
]

all_recipes = zone1_recipes + zone2_recipes

with open("recipes.json", "w", encoding="utf-8") as f:
    json.dump(all_recipes, f, indent=2, ensure_ascii=False)

print("Saved recipes.json successfully with UTF-8 encoding.")

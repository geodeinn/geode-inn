import json

items = [
    # ==========================================
    # ZONE 1: Garden (Van Gogh)
    # ==========================================
    {
        "name": "Swirling Sunflower Trellis",
        "description": "A high arched garden trellis wrapped in vibrant sunflowers that twist in expressive, thick-painted curves. The flowers seem to follow an invisible sun, glowing with golden warmth even indoors.",
        "itemType": "Furniture",
        "materials": ["Wrought Iron", "Living Sunflower Stems", "Impasto Clay"],
        "zone": "Garden",
        "interactiveProperties": "Climbing plants grow 25% faster when planted nearby. Players can sit beneath the arch to gain a 'Sunlight Warmth' buff (+10% crafting speed for botanical recipes).",
        "basedOn": "Van Gogh's Sunflowers series and organic iron lattice work",
        "variants": ["Golden Bloom", "Midnight Starry Vine", "Autumn Amber Lattice"]
    },
    {
        "name": "Starry Glasshouse Workbench",
        "description": "A heavy oak garden workbench with a cobalt glass inlay top that refracts light into swirling blue and yellow patterns across the studio floor.",
        "itemType": "Furniture",
        "materials": ["Cobalt Glass", "Carved Cypress Wood", "Brass Trim"],
        "zone": "Garden",
        "interactiveProperties": "Acts as a primary crafting station for seed mixtures and botanical pigments. Placing rare herbs on the glass reveals hidden optical traits.",
        "basedOn": "Van Gogh's Starry Night color palette and French artisan workbenches",
        "variants": ["Cobalt Swirl", "Cypress Grain", "Gilded Brass Edge"]
    },
    {
        "name": "Impasto Pigment Distiller",
        "description": "A heated copper distillation apparatus used to boil down garden blossoms into vibrant, oil-thick botanical pigments and fragrant tinctures.",
        "itemType": "Interactive",
        "materials": ["Copper Tubing", "Earthenware Pot", "Botanical Oils"],
        "zone": "Garden",
        "interactiveProperties": "Players insert garden blossoms and fuel (wood or peat) to distill 'Impasto Oils'. Interacting opens a mini-game to balance heat and color density.",
        "basedOn": "Van Gogh's thick oil paint mixing process and herbal alchemy",
        "variants": ["Copper Boiler", "Terracotta Glazed", "Studio Collector"]
    },
    {
        "name": "Swirling Cypress Sky Lantern",
        "description": "A tall cylindrical paper-and-canvas lantern framed in cypress wood, casting swirling impasto light patterns onto surrounding garden walls.",
        "itemType": "Interactive",
        "materials": ["Strained Canvas", "Cypress Resin", "Brass Ring"],
        "zone": "Garden",
        "interactiveProperties": "Can be toggled on or off to change garden lighting. Interacting with 'Rotate Prism' changes the cast shadows from golden daylight to starry cobalt.",
        "basedOn": "Van Gogh's iconic cypress silhouettes against swirling night skies",
        "variants": ["Starry Cobalt", "Sunset Ochre", "Dawn Vermilion"]
    },
    {
        "name": "Vibrant Iris Seedpod",
        "description": "A rare, pulsing seedpod harvested from the deep garden beds. It radiates a deep violet light and hums with natural vital energy.",
        "itemType": "QuestItem",
        "materials": ["Crystallized Plant Fiber", "Iridescent Sap"],
        "zone": "Garden",
        "interactiveProperties": "Quest item required by the Master Herbalist to restore the Starry Glasshouse. Cannot be consumed, but can be analyzed at the Translation Desk.",
        "basedOn": "Van Gogh's Irises and the herbalist quest line for lost hues",
        "variants": ["Royal Violet", "Luminous Cyan", "Gilded Petal"]
    },
    {
        "name": "Wheatfield Sheaf of Abundance",
        "description": "A tightly bound sheaf of golden wheat harvested at peak summer solstice. Each grain shines with an unnatural metallic luster.",
        "itemType": "QuestItem",
        "materials": ["Golden Wheat Stalks", "Twisted Silk Ribbon"],
        "zone": "Garden",
        "interactiveProperties": "Delivered to the Common Room Hearthmaster to initiate the Festival of the Sun quest. Grants temporary harvest aura when carried in inventory.",
        "basedOn": "Van Gogh's Wheatfield series and harvest festival lore",
        "variants": ["Summer Gold", "Stormy Ochre", "Crow-Haunted"]
    },
    {
        "name": "Impasto Palette Knife",
        "description": "A flexible steel palette knife with a carved cypress handle, used to shape botanical resins, scrape rare lichen, and mix paint pigments.",
        "itemType": "Tool",
        "materials": ["Tempered Spring Steel", "Cypress Handle", "Brass Ferrules"],
        "zone": "Garden",
        "interactiveProperties": "Equippable tool used to scrape sap from garden trees without damaging the bark. Unlocks precision sculpting on clay and wax furniture.",
        "basedOn": "Van Gogh's heavy palette knife techniques",
        "variants": ["Standard Steel", "Gold-Leaf Edge", "Damascus Etched"]
    },
    {
        "name": "Starry Night Glass Marble",
        "description": "A smooth glass orb containing a miniature swirling vortex of blue cobalt paint and suspended gold flakes that shift when held.",
        "itemType": "Collectible",
        "materials": ["Blown Cobalt Glass", "Gold Dust Suspension"],
        "zone": "Garden",
        "interactiveProperties": "Can be placed on display pedestals or traded with visiting collectors for rare seed packs. Inspecting displays a brief particle effect.",
        "basedOn": "Van Gogh's Starry Night swirl motifs",
        "variants": ["Cobalt Whirlpool", "Solar Eclipse", "Nebula Gold"]
    },

    # ==========================================
    # ZONE 2: Meadery (Picasso)
    # ==========================================
    {
        "name": "Cubist Fermentation Barrel",
        "description": "A wooden mead barrel constructed with deliberately offset, sharp angular staves. Despite its surreal shape, it ferments honey at an unmatched rate.",
        "itemType": "Furniture",
        "materials": ["Asymmetrical Oak Staves", "Forged Iron Bands", "Honeycomb Seal"],
        "zone": "Meadery",
        "interactiveProperties": "Stores up to 100 liters of aging mead. Interacting allows players to sample the brew and check fermentation age and alcohol percentage.",
        "basedOn": "Picasso's synthetic cubist sculptures and multi-perspective wooden forms",
        "variants": ["Angular Mahogany", "Fractured Birch", "Iron-Bound Cubist"]
    },
    {
        "name": "Multi-Perspective Tavern Bench",
        "description": "A tavern bench that appears to face three directions simultaneously. Sitting on it provides an unusually clear view of the entire room.",
        "itemType": "Furniture",
        "materials": ["Patchwork Walnut", "Brass Rivets", "Leather Padding"],
        "zone": "Meadery",
        "interactiveProperties": "Seats up to 3 players at different geometric angles. Players seated here gain 'Tavern Camaraderie' (+5% charisma in dialogue).",
        "basedOn": "Picasso's cubist seating in Three Musicians",
        "variants": ["Walnut & Brass", "Patched Leather", "Geometric Ash"]
    },
    {
        "name": "Fractured Glass Decanter Array",
        "description": "An array of sharp, geometric glass decanters mounted on a brass rack, allowing patrons to dispense multi-layered honey spirits.",
        "itemType": "Interactive",
        "materials": ["Faceted Lead Crystal", "Brass Spigots", "Amber Mead"],
        "zone": "Meadery",
        "interactiveProperties": "Players can pull levers to blend different mead vintages. Correct geometric combinations yield rare infused cordials.",
        "basedOn": "Picasso's Glass and Bottle of Suze and cubist glasswork",
        "variants": ["Prismatic Crystal", "Smoked Amber Glass", "Gilded Facet"]
    },
    {
        "name": "Geometric Honeycomb Press",
        "description": "A heavy mechanical press featuring interlocking triangular plates used to extract raw honey and royal jelly from geometric comb slabs.",
        "itemType": "Interactive",
        "materials": ["Cast Iron Gears", "Beeswax Plates", "Polished Bronze"],
        "zone": "Meadery",
        "interactiveProperties": "Insert raw honeycomb blocks and turn the crank to refine Pure Honey and Comb Wax. Turning too fast risks crushing the comb structure.",
        "basedOn": "Picasso's analytical cubism and mechanical bee structures",
        "variants": ["Cast Iron Classic", "Bronze Lattice", "Etched Steel"]
    },
    {
        "name": "Fractured Queen's Royal Comb",
        "description": "A slab of honeycomb where every cell forms a perfect mathematical polygon. It smells intensely of wild thistles and fermented nectar.",
        "itemType": "QuestItem",
        "materials": ["Crystallized Beeswax", "Golden Royal Jelly"],
        "zone": "Meadery",
        "interactiveProperties": "Required by Master Brewer Picasso-vane to brew the legendary 'Aura Mead'. Cannot be eaten raw without triggering a quest prompt.",
        "basedOn": "Picasso's Cubist Queen motif and the Meadmaster's secret recipe",
        "variants": ["Golden Polygon", "Amber Prism", "Royal Wax"]
    },
    {
        "name": "Dissonant Cellar Key",
        "description": "An irregular iron key whose bits and wards rearrange depending on the angle at which light strikes the metal surface.",
        "itemType": "QuestItem",
        "materials": ["Fractured Iron", "Brass Tooth Array"],
        "zone": "Meadery",
        "interactiveProperties": "Unlocks the Subterranean Aging Vault beneath the Meadery. Must be rotated 90 degrees in three dimensions during the lockpicking interface.",
        "basedOn": "Cubist key designs with shifting geometry",
        "variants": ["Iron Prism", "Bronze Angular", "Steel Offset"]
    },
    {
        "name": "Asymmetrical Hydrometer",
        "description": "A specialized floating glass hydrometer with a multi-angled scale for measuring sugar content and alcohol proof in fermenting vats.",
        "itemType": "Tool",
        "materials": ["Blown Glass Tube", "Lead Shot", "Mercury Dial"],
        "zone": "Meadery",
        "interactiveProperties": "Equippable tool used on any vat or barrel to reveal exact sugar density, fermentation progress, and potential flavor notes.",
        "basedOn": "Cubist scientific instruments and precise brewing tools",
        "variants": ["Standard Blown Glass", "Gilded Dial", "Mercury Core"]
    },
    {
        "name": "Cubic Amber Mead Crystal",
        "description": "A perfectly square block of dark amber honey crystal formed after a century of evaporation in the deep tavern cellars.",
        "itemType": "Collectible",
        "materials": ["Crystallized Honey Spirit", "Amber Resin"],
        "zone": "Meadery",
        "interactiveProperties": "Can be placed on display stands or gifted to the Meadmaster to unlock historical brewing lore notes.",
        "basedOn": "Picasso's cubist geometric solid representations",
        "variants": ["Deep Amber", "Golden Citrine", "Smoked Honey"]
    },

    # ==========================================
    # ZONE 3: Common Room (Main hub)
    # ==========================================
    {
        "name": "Firekeeper's Grand Carved Throne",
        "description": "A towering carved dark oak armchair cushioned in plush crimson velvet and reinforced with heavy iron scrollwork. It overlooks the entire Common Room.",
        "itemType": "Furniture",
        "materials": ["Ancient Dark Oak", "Crimson Velvet", "Wrought Iron Fittings"],
        "zone": "Common Room",
        "interactiveProperties": "Sitting in the throne grants the 'Hearthmaster's Authority' buff, causing nearby NPCs to treat you with high respect and grant lower vendor prices.",
        "basedOn": "The Firekeeper's chair at the heart of the Geode Inn",
        "variants": ["Crimson & Oak", "Black Velvet & Iron", "Gilded Hearth Edition"]
    },
    {
        "name": "Communal Hearthstone Banquet Table",
        "description": "A long, wide stone table with a fire-warmed central slab. Built to hold endless platters of roasts, flagons of mead, and traveler maps.",
        "itemType": "Furniture",
        "materials": ["Hearthstone Bedrock", "Carved Chestnut Wood", "Brass Brackets"],
        "zone": "Common Room",
        "interactiveProperties": "Up to 6 players can sit together. Food placed on the center slab stays piping hot indefinitely due to internal thermal stone properties.",
        "basedOn": "The central communal tables near the great fire",
        "variants": ["Polished Bedrock", "Chestnut Framed", "Engraved Travelers Map"]
    },
    {
        "name": "The Eternal Hearth Fireplace",
        "description": "A massive floor-to-ceiling stone fireplace housing a pulsing Fire Crystal core that radiates steady amber warmth across the entire hub.",
        "itemType": "Interactive",
        "materials": ["Hearthstone Blocks", "Fire Crystal Core", "Iron Grate"],
        "zone": "Common Room",
        "interactiveProperties": "Players can stoke the fire with different wood logs (Oak, Pine, Crystal-Infused) to alter room lighting, music tempo, and resting buff potency.",
        "basedOn": "The primary architectural centerpiece of the Common Room",
        "variants": ["Grand Arched", "Rough-Cut Granite", "Iron-Gated Furnace"]
    },
    {
        "name": "Amber Crystal Goblet Fountain",
        "description": "A tiered brass fountain holding amber glass goblets that fill continuously with spiced hearth-cider.",
        "itemType": "Interactive",
        "materials": ["Amber Glass", "Polished Crystal Inlay", "Brass Basin"],
        "zone": "Common Room",
        "interactiveProperties": "Players can take a goblet and trigger a 'Raise a Toast' interaction with other players, conferring a party-wide stamina regeneration buff.",
        "basedOn": "The Firekeeper's crystal goblet array and toast mechanics",
        "variants": ["Amber & Brass", "Prismatic Crystal", "Gilded Royal"]
    },
    {
        "name": "Embossed Guest Ledger of the Inn",
        "description": "A massive, iron-clasped leather book containing centuries of traveler signatures, cryptic notes, and hidden floorplan sketches.",
        "itemType": "QuestItem",
        "materials": ["Bound Pigskin Leather", "Gold Leaf Thread", "Vellum Pages"],
        "zone": "Common Room",
        "interactiveProperties": "Required by the Innkeeper to verify the identity of forgotten heroes. Reading it reveals lore entries and unlocks historical quest logs.",
        "basedOn": "The historical register recording every guest who ever crossed the threshold",
        "variants": ["Ancient Pigskin", "Iron-Clasped", "Gold Thread Bound"]
    },
    {
        "name": "Firekeeper's Crest Signet Ring",
        "description": "A heavy iron ring set with a glowing amber stone carved in the shape of the Geode Inn's double-hearth crest.",
        "itemType": "QuestItem",
        "materials": ["Wrought Iron", "Carved Amber Gem"],
        "zone": "Common Room",
        "interactiveProperties": "Unlocks the heavy oak doors leading from the Common Room down into the Catacombs and Bone Room. Cannot be dropped.",
        "basedOn": "The Firekeeper's badge of office and security key",
        "variants": ["Wrought Iron Seal", "Polished Amber Crest", "Gilded Keeper"]
    },
    {
        "name": "Carved Oak Hearth Tongs",
        "description": "Long, elegant iron tongs with smooth oak handles, designed to manipulate glowing embers without transferring heat to the wielder.",
        "itemType": "Tool",
        "materials": ["Hand-Forged Wrought Iron", "Carved Oak Grips"],
        "zone": "Common Room",
        "interactiveProperties": "Equippable tool used to harvest 'Eternal Embers' directly from the Great Hearth or relocate burning fire crystals safely.",
        "basedOn": "The Firekeeper's essential fire maintenance tool",
        "variants": ["Standard Hearth", "Dragonshead Iron", "Gilded Grip"]
    },
    {
        "name": "Prismatic Hearth Ember",
        "description": "A solidified stone ember that glows with a gentle orange-gold pulse, warm to the touch even when submerged in icy water.",
        "itemType": "Collectible",
        "materials": ["Crystallized Ash", "Fire Crystal Dust"],
        "zone": "Common Room",
        "interactiveProperties": "Can be set in lanterns, placed on tables as personal hand-warmers, or displayed in trophy cabinets.",
        "basedOn": "Ember stones that retain heat and light indefinitely",
        "variants": ["Golden Pulse", "Deep Crimson Glow", "Solar Spark"]
    },

    # ==========================================
    # ZONE 4: Bone Room (O'Keeffe×Klimt)
    # ==========================================
    {
        "name": "Gilded Osteo-Lattice Altar",
        "description": "An exquisite altar formed from interlocking bleached bone arches draped in intricate geometric gold leaf mosaic patterns.",
        "itemType": "Furniture",
        "materials": ["Bleached Mammoth Ribs", "24k Gold Leaf", "Calcite Crystals"],
        "zone": "Bone Room",
        "interactiveProperties": "Functions as a ceremonial focus for osteo-synthesis crafting. Placing bone artifacts here cleanses them of dark corruption.",
        "basedOn": "O'Keeffe's skull and bone compositions wrapped in Gustav Klimt's shimmering gold leaf patterns",
        "variants": ["Mammoth Gold Lattice", "Eburnean Mosaic", "Calcite Crest"]
    },
    {
        "name": "Opalescent Vertebrae Bench",
        "description": "A bench sculpted from massive fossilized whale vertebrae, smooth as porcelain, set with glittering opal mosaic tiles.",
        "itemType": "Furniture",
        "materials": ["Fossilized Vertebrae", "Opal Inlay", "Polished Velvet Cushion"],
        "zone": "Bone Room",
        "interactiveProperties": "Provides seating for two. Sitting here grants 'Osteo Resilience' (+15 defense against physical crushed status effects).",
        "basedOn": "O'Keeffe's bone landscapes and Klimt's decorative jewel-tone mosaic patterns",
        "variants": ["Opalized Ivory", "Gold Leaf Vertebrae", "Obsidian Inlay"]
    },
    {
        "name": "Calcite Skull Resonator",
        "description": "A pristine stag skull mounted on dark basalt, its eye sockets filled with cluster crystals that hum when wind or sound passes through.",
        "itemType": "Interactive",
        "materials": ["Bleached Stag Skull", "Growth Calcite Crystals", "Brass Tuning Rods"],
        "zone": "Bone Room",
        "interactiveProperties": "Players can strike the crystal antlers to produce musical tones. Solving tone puzzles unlocks hidden alcoves in the Bone Room.",
        "basedOn": "O'Keeffe's Ram's Head with Hollyhock and Klimt's golden acoustic patterns",
        "variants": ["Stag Calcite", "Bison Gold Horn", "Sabertooth Quartz"]
    },
    {
        "name": "Gilded Bone Loom",
        "description": "A tall vertical loom built from polished longbones and brass gears, used to weave fine golden thread with calcium silk.",
        "itemType": "Interactive",
        "materials": ["Bleached Bone Frame", "Gold Wire Spools", "Ivory Shuttles"],
        "zone": "Bone Room",
        "interactiveProperties": "Allows players to craft gilded textiles and bone-reinforced armor lining. Requires precise timing in a weaving rhythm mini-game.",
        "basedOn": "Klimt's textile motifs combined with skeletal structural framework",
        "variants": ["Gold Thread Loom", "Ivory Fine-Weave", "Mammoth Frame"]
    },
    {
        "name": "Bleached Ram's Horn of Solstice",
        "description": "A massive spiral ram's horn coated in delicate Klimt-style gold leaf scrollwork, ringing with a soft echo when held.",
        "itemType": "QuestItem",
        "materials": ["Ancient Ram Skull Bone", "Gold Leaf Filigree"],
        "zone": "Bone Room",
        "interactiveProperties": "Required to open the Golden Bone Gate leading into the subterranean Deep Catacombs. Sounds a low trumpet call when used.",
        "basedOn": "O'Keeffe's iconic Ram's Head paintings",
        "variants": ["Golden Spiral", "Opaline Horn", "Sun-Bleached White"]
    },
    {
        "name": "Fossilized Ammonite Prism",
        "description": "A perfectly preserved spiral ammonite fossil whose inner chambers have transformed into radiant prismatic calcite crystals.",
        "itemType": "QuestItem",
        "materials": ["Petrified Shell", "Calcite Crystal Matrix"],
        "zone": "Bone Room",
        "interactiveProperties": "Fits into the central altar of the Bone Room to align light beams onto hidden mural walls. Key item for the Archaeologist quest.",
        "basedOn": "Spiral shell geometry and Klimt's metallic organic patterns",
        "variants": ["Prismatic Spiral", "Gilded Ammonite", "Deep Iridescent"]
    },
    {
        "name": "Gold-Leaf Bone Stylus",
        "description": "A sharp ivory stylus tipped with hardened gold alloy, engineered for delicate rune engraving on bone and fossil surfaces.",
        "itemType": "Tool",
        "materials": ["Polished Ivory", "24k Gold Nib", "Silk Wrapping"],
        "zone": "Bone Room",
        "interactiveProperties": "Equippable tool that enables 'Bone Engraving' on raw fossil materials. Increases item quality when crafting osteo-furniture.",
        "basedOn": "Precision carving tools used in gilded osteo-artistry",
        "variants": ["Ivory Gold Nib", "Ebony Silver Tip", "Mammoth Diamond"]
    },
    {
        "name": "Opalized Trilobite Cameo",
        "description": "A tiny prehistoric trilobite fossil that has completely opalized into a fiery display of blue, green, and gold iridescence.",
        "itemType": "Collectible",
        "materials": ["Opalized Fossil", "Gold Leaf Frame"],
        "zone": "Bone Room",
        "interactiveProperties": "Can be framed and hung on walls or traded to the Relic Collector for high-tier crafting recipes.",
        "basedOn": "Prehistoric fossils transformed into luxurious Klimt-style jewelry",
        "variants": ["Fiery Red Opal", "Oceanic Blue-Green", "Gilded Golden Opal"]
    },

    # ==========================================
    # ZONE 5: Cave City (Doré)
    # ==========================================
    {
        "name": "Chiaroscuro Basalt Arch Chair",
        "description": "A massive throne carved from dark basalt, featuring sweeping gothic arches that throw deep, angular shadows across the stone floor.",
        "itemType": "Furniture",
        "materials": ["Volcanic Basalt", "Carved Granite", "Lichen Padding"],
        "zone": "Cave City",
        "interactiveProperties": "Player can sit to gain 'Subterranean Focus' (+10% vision range in dark caves). The chair's surface feels cool and immovably solid.",
        "basedOn": "Gustave Doré's monumental dark architecture and dramatic shadows",
        "variants": ["Basalt Gothic", "Granite Pillar", "Etched Shadow"]
    },
    {
        "name": "Glow-Moss Lit Scholar's Desk",
        "description": "A heavy slate desk built directly into a cave niche, illuminated by a canopy of cultivated bioluminescent green moss.",
        "itemType": "Furniture",
        "materials": ["Subterranean Slate", "Living Glow-Moss", "Iron Frame"],
        "zone": "Cave City",
        "interactiveProperties": "Functions as a research desk for subterranean mapping. Items left on the desk are visible in total darkness due to moss luminescence.",
        "basedOn": "Doré's subterranean scholars and engraver studios",
        "variants": ["Slate & Moss", "Deep Basalt", "Iron-Legged Niche"]
    },
    {
        "name": "Abyssal Chasm Pulley Elevator",
        "description": "A heavy industrial cable system mounted over an abyssal drop, allowing players to lower themselves into lower cave tiers.",
        "itemType": "Interactive",
        "materials": ["Wrought Iron Cable", "Cast Bronze Winch", "Oak Platform"],
        "zone": "Cave City",
        "interactiveProperties": "Interacting allows players to ride between upper Cave City and the Abyss floor. Players can operate the hand crank or lock the brake.",
        "basedOn": "Doré's monumental winches, bridge engineering, and subterranean chasms",
        "variants": ["Industrial Iron", "Bronze Winch", "Dwarf-Engraved Steel"]
    },
    {
        "name": "Bioluminescent Mushroom Lantern Array",
        "description": "A cluster of large blue-glowing cap mushrooms housed inside a protective wrought iron cage to prevent spore escape.",
        "itemType": "Interactive",
        "materials": ["Spore-Cap Fungi", "Iron Mesh Cage", "Moist Soil Base"],
        "zone": "Cave City",
        "interactiveProperties": "Players can tap the cage to trigger a bright pulse of blue light that reveals hidden wall markings and frightens dark pests.",
        "basedOn": "Subterranean lighting in Doré's underground caverns",
        "variants": ["Indigo Spore", "Luminous Cyan", "Amber Cap"]
    },
    {
        "name": "Engraved Basalt Waystone Map",
        "description": "A heavy stone slab etched with microscopic lines depicting the labyrinthine tunnels and hidden aqueducts of Cave City.",
        "itemType": "QuestItem",
        "materials": ["Chiseled Basalt Slab", "Silver Ore Fill"],
        "zone": "Cave City",
        "interactiveProperties": "Delivered to the Cave Cartographer to reveal all fast-travel waypoints across the subterranean zone on the player's map.",
        "basedOn": "Doré's detailed steelplate engravings",
        "variants": ["Silver Inlaid Slab", "Iron Etched", "Dark Basalt"]
    },
    {
        "name": "Subterranean Chime Tuning Fork",
        "description": "A heavy two-pronged bronze fork that rings with a resonant low pitch capable of shattering acoustic granite locks.",
        "itemType": "QuestItem",
        "materials": ["Tempered High-Purity Bronze", "Lead Counterweight"],
        "zone": "Cave City",
        "interactiveProperties": "Used at sealed granite doorways in Cave City. Interacting triggers a reverberation wave that breaks the stone seal.",
        "basedOn": "Acoustic stone-shattering mechanics in deep caverns",
        "variants": ["Deep Bronze", "Tempered Steel", "Resonant Brass"]
    },
    {
        "name": "Engraver's Basalt Chisel Set",
        "description": "A roll of precision steel chisels designed to carve sharp, crosshatched grooves into hard volcanic rock.",
        "itemType": "Tool",
        "materials": ["Hardened Tool Steel", "Ash Handle", "Leather Roll"],
        "zone": "Cave City",
        "interactiveProperties": "Equippable tool used to harvest mineral veins cleanly and carve player custom runes onto stone walls and furniture.",
        "basedOn": "Doré's master engraving techniques transferred to stone carving",
        "variants": ["Master Steel", "Diamond Tipped", "Iron Clad"]
    },
    {
        "name": "Deep-Cave Indigo Spore Globe",
        "description": "A sealed glass sphere containing living indigo spores that float endlessly in a nutrient gel, casting soft blue ripples.",
        "itemType": "Collectible",
        "materials": ["Blown Glass Globe", "Bioluminescent Spores"],
        "zone": "Cave City",
        "interactiveProperties": "Can be placed on tables as a permanent soft light source or gifted to the Botanist to unlock fungal recipes.",
        "basedOn": "Doré's ethereal subterranean light sources",
        "variants": ["Indigo Mist", "Ethereal Cyan", "Deep Violet Wave"]
    },

    # ==========================================
    # ZONE 6: Poison Garden (Gorey)
    # ==========================================
    {
        "name": "Crosshatched Iron Plant Stand",
        "description": "A spindly multi-tiered iron plant stand rendered in sharp, crosshatched black metal, holding potting urns of venomous flora.",
        "itemType": "Furniture",
        "materials": ["Wrought Iron", "Blackened Steel", "Terracotta Pots"],
        "zone": "Poison Garden",
        "interactiveProperties": "Holds up to 4 small potted poison plants. Plants placed here produce venom drops 20% faster.",
        "basedOn": "Edward Gorey's pen-and-ink crosshatched Victorian wrought iron designs",
        "variants": ["Crosshatched Black", "Rusted Victorian", "Gothic Spire"]
    },
    {
        "name": "Velvet-Lined Apothecary Cabinet",
        "description": "A tall, narrow ebonized wood cabinet featuring dozens of tiny drawers labeled with cryptic Victorian latin poison names.",
        "itemType": "Furniture",
        "materials": ["Ebonized Plum Wood", "Dark Purple Velvet", "Brass Drawer Pulls"],
        "zone": "Poison Garden",
        "interactiveProperties": "Provides 30 dedicated storage slots for toxins, seeds, and antidotes. Features a locked secret compartment behind the velvet back panel.",
        "basedOn": "Gorey's sinister Edwardian specimen displays and poison cupboards",
        "variants": ["Ebonized Plum", "Dark Mahogany", "Midnight Velvet"]
    },
    {
        "name": "Thorn-Vine Birdcage Greenhouse",
        "description": "A towering Victorian birdcage converted into a miniature greenhouse to contain a thrashing, carnivorous thorn-vine plant.",
        "itemType": "Interactive",
        "materials": ["Wrought Iron Bars", "Living Thorn Vines", "Lead Glass Base"],
        "zone": "Poison Garden",
        "interactiveProperties": "Players can feed insect specimens or meat to the thorn vine to harvest 'Razor-Thorn Resin'. Careful not to get bitten!",
        "basedOn": "Gorey's ominous aviaries and sinister greenhouse illustrations",
        "variants": ["Iron Aviary", "Crosshatched Black", "Gilded Cage"]
    },
    {
        "name": "Sinister Belladonna Tea Service",
        "description": "An exquisite black china teapot and cup set painted with delicate nightshade flowers and crosshatched vine motifs.",
        "itemType": "Interactive",
        "materials": ["Black Bone China", "Gold Leaf Rim", "Silver Tea Strainer"],
        "zone": "Poison Garden",
        "interactiveProperties": "Players can brew 'Micro-Dosed Herbal Tea'. Drinking grants immune resistance to all poison traps for 15 minutes.",
        "basedOn": "Gorey's dark humor Victorian tea parties",
        "variants": ["Black Bone China", "Nightshade Gold", "Crosshatched Silver"]
    },
    {
        "name": "Bottled Cobra Venom Flask",
        "description": "A triangular glass bottle filled with viscous green liquid, sealed with black wax and stamped with a skull emblem.",
        "itemType": "QuestItem",
        "materials": ["Heavy Blown Lead Glass", "Wax Seal", "Refined Venom"],
        "zone": "Poison Garden",
        "interactiveProperties": "Delivered to the Master Apothecary to brew the Universal Antidote. Highly volatile if opened improperly.",
        "basedOn": "Gorey's alphabet of toxins and Edwardian apothecary lore",
        "variants": ["Viscous Green", "Amber Distillate", "Black Wax Seal"]
    },
    {
        "name": "Edwardian Nightshade Journal",
        "description": "A sinister handwritten field guide containing detailed crosshatched illustrations of lethal flora and their exact antidote formulas.",
        "itemType": "QuestItem",
        "materials": ["Crosshatched Cloth Binding", "Iron Gall Ink", "Pressed Leaves"],
        "zone": "Poison Garden",
        "interactiveProperties": "Reading unlocks all Poison Garden plant recipes in the player's herbology codex. Key quest item for the Herbalist.",
        "basedOn": "Gorey's illustrated books and botanical field notes",
        "variants": ["Cloth Bound", "Leather Clasp", "Crosshatched Ink"]
    },
    {
        "name": "Gravedigger's Pruning Shears",
        "description": "Heavy-duty steel shears with serrated inner jaws designed to snip thick, venomous thorn vines without causing sap splatter.",
        "itemType": "Tool",
        "materials": ["Blackened High-Carbon Steel", "Leather Wrapped Handles"],
        "zone": "Poison Garden",
        "interactiveProperties": "Equippable tool used to clear thorn-vine blockages in the Poison Garden and harvest rare plant cuttings safely.",
        "basedOn": "Gorey's sharp gothic tools",
        "variants": ["Blackened Carbon", "Rusted Gothic", "Silver-Plated Edge"]
    },
    {
        "name": "Crosshatched Poison Ring",
        "description": "A heavy silver signet ring with an intricate crosshatched engraving. The top hinges open to reveal a tiny hidden compartment.",
        "itemType": "Collectible",
        "materials": ["Sterling Silver", "Hinged Onyx Compartment"],
        "zone": "Poison Garden",
        "interactiveProperties": "Can be worn as a cosmetic accessory or used to store 1 dose of powdered potion for quick tactical use.",
        "basedOn": "Victorian secret poison rings in Gorey's murder mystery aesthetic",
        "variants": ["Sterling Onyx", "Gilded Cameo", "Blackened Steel"]
    },

    # ==========================================
    # ZONE 7: Seelie Court (Lee)
    # ==========================================
    {
        "name": "Woven Golden Willow Throne",
        "description": "A high-backed throne woven entirely from living golden willow branches that blossom with fragrant white flowers when sat upon.",
        "itemType": "Furniture",
        "materials": ["Living Summer Willow", "Golden Thread", "Birch Bark"],
        "zone": "Seelie Court",
        "interactiveProperties": "Sitting here grants 'Fae Grace' (+10% movement speed and jump height). The throne gently sways as if caressed by a summer breeze.",
        "basedOn": "Alan Lee's watercolor ethereal wooden architecture and fae thrones",
        "variants": ["Living Willow", "Sunlit Birch", "Gossamer Woven"]
    },
    {
        "name": "Sunlit Gossamer Daybed",
        "description": "A low, elegant daybed framed in carved ash wood and draped with translucent gossamer fabric that catches golden forest light.",
        "itemType": "Furniture",
        "materials": ["Silken Gossamer Thread", "Polished Ash Wood", "Golden Forest Moss"],
        "zone": "Seelie Court",
        "interactiveProperties": "Resting here rapidly restores player health and clears all fatigue debuffs while surrounding the player in golden particle light.",
        "basedOn": "Alan Lee's romantic, soft watercolor interiors",
        "variants": ["Gossamer Ash", "Summer Moss", "Sunlit Gold"]
    },
    {
        "name": "Riddle-Inscribed Sundial Table",
        "description": "A round quartz table etched with delicate Elvish riddles. A golden brass needle casts shadows that point to hidden runes.",
        "itemType": "Interactive",
        "materials": ["Aventurine Quartz", "Golden Brass Gnomon", "Elvish Inscriptions"],
        "zone": "Seelie Court",
        "interactiveProperties": "Players rotate the needle to solve sun-riddles based on current game time. Correct answers unlock secret Seelie treasure caches.",
        "basedOn": "Alan Lee's ancient stone dials and fae riddlelore",
        "variants": ["Aventurine Quartz", "Polished Marble", "Golden Brass"]
    },
    {
        "name": "Gossamer & Birch Wood Harp",
        "description": "A graceful standing harp constructed from curved silver birch wood, strung with luminous gossamer threads that chime without touching.",
        "itemType": "Interactive",
        "materials": ["Silver Birch Wood", "Spun Gossamer Strings", "Gold Leaf Inlay"],
        "zone": "Seelie Court",
        "interactiveProperties": "Players can play melodies on the harp. Playing the 'Summer Carol' causes surrounding flora to bloom instantly and open secret vine gates.",
        "basedOn": "Alan Lee's depictions of elven musical instruments",
        "variants": ["Silver Birch", "Gilded Gossamer", "Ethereal Ash"]
    },
    {
        "name": "Golden Summer Solstice Crown",
        "description": "A circlet woven from threads of pure golden light and preserved solstice leaves that never wither.",
        "itemType": "QuestItem",
        "materials": ["Woven Sun-Gold Wire", "Solstice Oak Leaves", "Dewdrop Crystals"],
        "zone": "Seelie Court",
        "interactiveProperties": "Required by the Seelie Ambassador to complete the Summer Court Alliance quest line. Grants water-walking when equipped.",
        "basedOn": "The Seelie Queen's regalia in Alan Lee's faerie illustrations",
        "variants": ["Sun-Gold Solstice", "Dewdrop Circlet", "Golden Oak"]
    },
    {
        "name": "Dewdrop Crystal Lantern of Truth",
        "description": "A crystal lantern containing a single magnified drop of morning dew that glows with an unwavering warm golden light.",
        "itemType": "QuestItem",
        "materials": ["Hand-Blown Crystal Sphere", "Crystallized Dewdrop", "Birch Handle"],
        "zone": "Seelie Court",
        "interactiveProperties": "Dispel illusions, revealing hidden Seelie pathways and unmasking shapeshifted Unseelie spies in the zone.",
        "basedOn": "Fae magic light sources in watercolor legendry",
        "variants": ["Dewdrop Gold", "Prismatic Birch", "Sunlit Amber"]
    },
    {
        "name": "Golden Oak Tuning Fork",
        "description": "A carved wooden tuning fork that vibrates at the natural frequency of growing plants and trees.",
        "itemType": "Tool",
        "materials": ["Ancient Heartwood Oak", "Golden Brass Collar"],
        "zone": "Seelie Court",
        "interactiveProperties": "Equippable tool used to commune with ancient forest trees, unlocking hidden dialogue and harvesting rare sap.",
        "basedOn": "Subtle natural sound tools in elven lore",
        "variants": ["Heartwood Oak", "Golden Brass", "Willow Leaf"]
    },
    {
        "name": "Prismatic Dewdrop Gem",
        "description": "A gemstone formed from a single drop of Seelie dawn dew, permanently frozen into a brilliant sun-catching crystal.",
        "itemType": "Collectible",
        "materials": ["Crystallized Fae Dew", "Gold Leaf Dust"],
        "zone": "Seelie Court",
        "interactiveProperties": "Can be placed on pedestals to project tiny rainbows across the room or traded for high-tier Seelie enchantments.",
        "basedOn": "Magical dew drops solidified into jewels in fae mythology",
        "variants": ["Solar Gold", "Cyan Aurora", "Rose Solstice"]
    },

    # ==========================================
    # ZONE 8: Unseelie Court (Bauer)
    # ==========================================
    {
        "name": "Frost-Forged Shadow Stone Throne",
        "description": "A massive dark granite seat wrapped in layers of creeping frost and shadow ice. It radiates an ominous, icy authority.",
        "itemType": "Furniture",
        "materials": ["Dark Granite Monolith", "Shadow Ice Inlay", "Runic Iron Brackets"],
        "zone": "Unseelie Court",
        "interactiveProperties": "Sitting grants 'Frost Monarch' (+20% ice damage and resistance to freezing). Non-Unseelie NPCs bow when you sit here.",
        "basedOn": "John Bauer's massive Scandinavian troll thrones carved from mossy boulders",
        "variants": ["Granite Monolith", "Shadow Ice Spire", "Runic Iron Clad"]
    },
    {
        "name": "Glacial Ice Table of the Winter King",
        "description": "A thick slab of dark blue shadow ice supported by rough mossy stone monoliths. The surface never melts, even near flame.",
        "itemType": "Furniture",
        "materials": ["Eternal Shadow Ice Slab", "Mossy Stone Pillars", "Iron Rivets"],
        "zone": "Unseelie Court",
        "interactiveProperties": "Items placed on the table freeze instantly, preserving food and reagents indefinitely without decay.",
        "basedOn": "Bauer's dark fairytale banquet tables in deep Scandinavian forests",
        "variants": ["Glacial Ice Slab", "Mossy Monolith", "Dark Frost Table"]
    },
    {
        "name": "Troll-Carved Rune Monolith",
        "description": "A towering ancient stone monolith etched with deep Scandinavian troll runes that pulse with cold blue luminescence.",
        "itemType": "Interactive",
        "materials": ["Weathered Glacial Stone", "Glowing Runes", "Iron Chains"],
        "zone": "Unseelie Court",
        "interactiveProperties": "Players touch the runes to channel winter frost magic. Solving the rune alignment puzzle summons a temporary Shadow Ice Guard.",
        "basedOn": "John Bauer's iconic mossy boulders and giant troll stone carvings",
        "variants": ["Mossy Monolith", "Blue Rune Granite", "Chained Frost Stone"]
    },
    {
        "name": "Shadow-Ice Anvil of the Anvilmaster",
        "description": "A heavy anvil forged from black iron resting on a pedestal of unmelting shadow ice. Used to craft dark winter armament.",
        "itemType": "Interactive",
        "materials": ["Blackened Meteoric Iron", "Shadow-Ice Base", "Runic Hammers"],
        "zone": "Unseelie Court",
        "interactiveProperties": "Primary crafting station for Unseelie weapons and frost-forged armor. Striking the anvil emits a spray of freezing blue sparks.",
        "basedOn": "Scandinavian dark fairytale blacksmithing and troll craftsmanship",
        "variants": ["Meteoric Black", "Frost Pedestal", "Troll Engraved"]
    },
    {
        "name": "Shadow-Ice Heart Core",
        "description": "A jagged, pulsing crystal of pure shadow ice that freezes the air around it into delicate ice needles.",
        "itemType": "QuestItem",
        "materials": ["Compressed Shadow Ice", "Dark Magic Essence"],
        "zone": "Unseelie Court",
        "interactiveProperties": "Required to break the Frost Curse over the Unseelie Vault and forge the Glacial Broadsword.",
        "basedOn": "The icy heart of the troll king in Bauer's dark folklore",
        "variants": ["Jagged Shadow Ice", "Black Frost Core", "Glacial Blue"]
    },
    {
        "name": "Troll King's Bone & Iron Crown",
        "description": "A heavy, sprawling crown crafted from jagged dark iron and carved troll horn bone, set with raw shadow sapphires.",
        "itemType": "QuestItem",
        "materials": ["Forged Dark Iron", "Troll Horn Bone", "Shadow Sapphires"],
        "zone": "Unseelie Court",
        "interactiveProperties": "Equipped or delivered to the Winter Regent to claim lordship over the Unseelie territory. Unlocks dark combat trials.",
        "basedOn": "John Bauer's oversized ornate troll crowns in Among Goblins and Trolls",
        "variants": ["Dark Iron & Horn", "Shadow Sapphire", "Gilded Frost"]
    },
    {
        "name": "Frost-Forged Iron Warhorn",
        "description": "A heavy iron hunting horn wrapped in frost-coated leather, producing a deep, terrifying blast when sounded.",
        "itemType": "Tool",
        "materials": ["Blackened Iron", "Frost Crystal Trim", "Leather Strap"],
        "zone": "Unseelie Court",
        "interactiveProperties": "Equippable tool used to blow a blizzard call that freezes nearby enemies for 3 seconds and clears shadow fog.",
        "basedOn": "Scandinavian hunting horns in dark fairytale illustrations",
        "variants": ["Black Iron Classic", "Frost Crystal Trim", "Runic Engraved"]
    },
    {
        "name": "Glacial Ice Runestone",
        "description": "A palm-sized fragment of dark glacial ice etched with protection runes that fill with shimmering silver powder.",
        "itemType": "Collectible",
        "materials": ["Carved Shadow Ice", "Silver Powder Fill"],
        "zone": "Unseelie Court",
        "interactiveProperties": "Can be set into weapon sockets for ice damage or displayed on pedestals as a frost trophy.",
        "basedOn": "John Bauer's magical runestones hidden in deep pine forests",
        "variants": ["Silver Rune", "Shadow Blue", "Glacial Frost"]
    },

    # ==========================================
    # ZONE 9: Atlantis (Royo)
    # ==========================================
    {
        "name": "Abyssal Obsidian & Coral Altar",
        "description": "A dark, sleek altar sculpted from polished black obsidian, wrapped in living red coral that pulses with deep sea light.",
        "itemType": "Furniture",
        "materials": ["Volcanic Obsidian", "Bioluminescent Red Coral", "Pearl Dust"],
        "zone": "Atlantis",
        "interactiveProperties": "Functions as an oceanic ritual station. Placing marine artifacts on the altar imbues them with 'Abyssal Resonance'.",
        "basedOn": "Luis Royo's dark fantasy aquatic art and sensuous organic stone shapes",
        "variants": ["Obsidian & Red Coral", "Bioluminescent Cyan", "Pearl Embedded"]
    },
    {
        "name": "Iridescent Pearl Shell Lounge",
        "description": "A luxurious reclining lounge set inside a massive polished giant clam shell, lined with iridescent mother-of-pearl and dark silk kelp.",
        "itemType": "Furniture",
        "materials": ["Giant Clam Shell", "Mother-of-Pearl", "Abyssal Kelp Silk"],
        "zone": "Atlantis",
        "interactiveProperties": "Seats 2 players. Resting here grants underwater breathing and underwater vision for 30 minutes.",
        "basedOn": "Royo's dark sensuous aquatic thrones and pearl resting beds",
        "variants": ["Mother-of-Pearl", "Deep Sea Black Shell", "Golden Nacre"]
    },
    {
        "name": "Tide-Calling Conch Organ",
        "description": "A monumental aquatic organ constructed from giant spiraled sea shells and coral pipes that channel water pressure into deep oceanic notes.",
        "itemType": "Interactive",
        "materials": ["Spiral Conch Shells", "Bioluminescent Sea Crystal", "Coral Pipes"],
        "zone": "Atlantis",
        "interactiveProperties": "Players play hydraulic keys to alter water current direction and drain flooded chambers in the Atlantis ruins.",
        "basedOn": "Royo's biomechanical and organic musical creations",
        "variants": ["Coral & Conch", "Abyssal Obsidian", "Prismatic Nacre"]
    },
    {
        "name": "Bioluminescent Deep Sea Basin",
        "description": "A wide basalt basin filled with pitch-black oceanic water illuminated from within by floating bioluminescent plankton.",
        "itemType": "Interactive",
        "materials": ["Abyssal Basalt", "Deep Sea Water", "Glow-Plankton Crystal"],
        "zone": "Atlantis",
        "interactiveProperties": "Players can peer into the basin to scry distant flooded rooms, revealing enemy locations and submerged chest locations.",
        "basedOn": "Royo's dark glowing water pools and scrying basins",
        "variants": ["Basalt Plankton", "Obsidian Glow", "Pearl Rimmed"]
    },
    {
        "name": "Leviathan Scale Heartstone",
        "description": "A hand-sized dragon scale from an ancient abyss leviathan, hard as diamond and shimmering with deep oceanic teal light.",
        "itemType": "QuestItem",
        "materials": ["Iridescent Leviathan Scale", "Deep Sea Crystal"],
        "zone": "Atlantis",
        "interactiveProperties": "Required to power the Abyssal Engine and unlock the lowest gates of the Atlantis Trench.",
        "basedOn": "Royo's dark aquatic dragons and sea serpent motifs",
        "variants": ["Oceanic Teal Scale", "Abyssal Black", "Bioluminescent Gold"]
    },
    {
        "name": "Golden Trident of the Tide Sovereign",
        "description": "A majestic three-pronged trident forged from gleaming Orichalcum, set with a glowing pearl core at its center.",
        "itemType": "QuestItem",
        "materials": ["Atlantean Orichalcum", "Refined Pearl Core"],
        "zone": "Atlantis",
        "interactiveProperties": "Required to seal the deep-sea abyssal rift during the climax of the Atlantis quest line. Can be mounted as a trophy after.",
        "basedOn": "Royo's dark fantasy royal weaponry",
        "variants": ["Orichalcum Gold", "Abyssal Steel", "Coral Inlaid"]
    },
    {
        "name": "Coral Carving Glass Needle",
        "description": "A needle-sharp instrument made from volcanic sea glass, used to engrave living coral without harming its growth.",
        "itemType": "Tool",
        "materials": ["Obsidian Glass", "Sharkskin Wrap", "Coral Tip"],
        "zone": "Atlantis",
        "interactiveProperties": "Equippable tool used to harvest delicate bioluminescent coral branches and sculpt marine furniture.",
        "basedOn": "Precision aquatic tools in Atlantean artisan craft",
        "variants": ["Obsidian Glass", "Sharkskin Wrap", "Orichalcum Tip"]
    },
    {
        "name": "Tear of the Sea Siren",
        "description": "A teardrop-shaped pearl that glows with an intense sapphire light, capturing the motion of ocean waves within its core.",
        "itemType": "Collectible",
        "materials": ["Crystallized Sea Nacre", "Bioluminescent Fluid"],
        "zone": "Atlantis",
        "interactiveProperties": "Can be placed on display stands or traded to the Sea Collector for legendary Atlantean armor blueprints.",
        "basedOn": "Royo's sensuous siren mythology and dark ocean gems",
        "variants": ["Sapphire Tear", "Black Pearl", "Emerald Abyss"]
    }
]

# Write to zone_items_main_under.json
with open("zone_items_main_under.json", "w", encoding="utf-8") as f:
    json.dump(items, f, indent=2, ensure_ascii=False)

print("Wrote zone_items_main_under.json successfully.")

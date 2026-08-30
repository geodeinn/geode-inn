import json

items = [
    # ==========================================
    # 1. EGYPT (O'Keeffe)
    # Style: Georgia O'Keeffe - Monumental desert forms, magnified organic geometry, sun-bleached hues, red sandstone, papyrus.
    # ==========================================
    {
        "name": "Sun-Bleached Ankh Scepter",
        "description": "A tall ceremonial scepter fashioned from carved red sandstone and wrapped with sun-bleached papyrus cordage. Its contours echo O'Keeffe's stark desert bone shapes.",
        "itemType": "QuestItem",
        "materials": ["sandstone", "papyrus", "gold ore"],
        "zone": "Egypt",
        "interactiveProperties": "When placed upon the Horizon Pedestal, it channels direct sunlight to unlock the Chamber of the Sun.",
        "basedOn": "Egyptian iconography of eternal life rendered through Georgia O'Keeffe's monumental, sun-baked desert bone aesthetic.",
        "variants": ["Ochre Sandstone", "Bleached Bone White"]
    },
    {
        "name": "Papyrus Scroll of the Horizon",
        "description": "An ancient papyrus manuscript adorned with magnified, sweeping red-and-gold pigment lines representing the daily arc of Ra across the desert vault.",
        "itemType": "QuestItem",
        "materials": ["papyrus", "desert glass", "copper"],
        "zone": "Egypt",
        "interactiveProperties": "Can be deciphered at a scholar's desk to reveal the hidden star alignment sequence for the Tomb of the Astronomy Priests.",
        "basedOn": "Ancient Egyptian funerary scrolls synthesized with O'Keeffe's fluid, large-scale sky gradient compositions.",
        "variants": ["Dawn Horizon", "Dusk Horizon"]
    },
    {
        "name": "O'Keeffe Sun-Dappled Sunken Altar",
        "description": "A massive, sculpted sandstone basin featuring smooth organic curves that capture shifting shadows as the desert sun moves overhead.",
        "itemType": "Interactive",
        "materials": ["sandstone", "limestone (imported)", "copper"],
        "zone": "Egypt",
        "interactiveProperties": "Players can pour sacred desert water into the basin to trigger a light reflection puzzle that activates tomb door mechanisms.",
        "basedOn": "O'Keeffe's architectural landforms and desert canyon geometry fused with ancient Egyptian offering tables.",
        "variants": ["Red Canyon Sandstone", "Tura Limestone"]
    },
    {
        "name": "Sarcophagus Scale Puzzle Lock",
        "description": "An intricate stone lock mechanism embedded in tomb entrances, carved with oversized organic lotus blossoms and stylized scarabs.",
        "itemType": "Interactive",
        "materials": ["sandstone", "desert glass", "gold ore", "lapis lazuli"],
        "zone": "Egypt",
        "interactiveProperties": "Players rotate concentric stone rings to align sunburst patterns and open sealed burial vaults.",
        "basedOn": "Ancient Egyptian tomb locks stylized with O'Keeffe's magnified floral and desert landscape contours.",
        "variants": ["Gilded Scarab", "Lapis Petal"]
    },
    {
        "name": "Monolithic Red Sandstone Throne",
        "description": "A high-backed ceremonial seat carved from a single block of desert sandstone, smoothed along organic lines resembling wind-carved desert cliffs.",
        "itemType": "Furniture",
        "materials": ["sandstone", "desert ironwood", "papyrus"],
        "zone": "Egypt",
        "interactiveProperties": "Provides a rested status effect (+15% stamina regeneration) when sat upon by the player or Inn guests.",
        "basedOn": "Pharaonic royal thrones reinterpreted with O'Keeffe's stark Southwest desert canyon sculpture style.",
        "variants": ["Red Sandstone", "Bleached Terracotta"]
    },
    {
        "name": "Magnified Lotus Column Pillar",
        "description": "A towering structural column whose capital flowers outward into sweeping, simplified lotus petals painted in soft desert tones.",
        "itemType": "Furniture",
        "materials": ["sandstone", "limestone (imported)", "copper"],
        "zone": "Egypt",
        "interactiveProperties": "Serves as a structural support in building layouts and radiates ambient warmth to nearby decorative plants.",
        "basedOn": "Karnak temple lotus columns simplified into O'Keeffe's iconic magnified floral forms.",
        "variants": ["Sunrise Rose", "Desert Sand"]
    },
    {
        "name": "Gilded Papyrus Reed Stylus",
        "description": "A precision writing tool crafted from rigid papyrus stalk reinforced with beaten copper and tipped with polished desert glass.",
        "itemType": "Tool",
        "materials": ["papyrus", "copper", "desert glass"],
        "zone": "Egypt",
        "interactiveProperties": "Used to scribe hieroglyphic rubbings from ancient stelae and craft specialized cartouche recipes.",
        "basedOn": "Ancient Egyptian scribe instruments refined for digital archive cataloging in the Geode Inn.",
        "variants": ["Copper Tipped", "Desert Glass Tip"]
    },
    {
        "name": "Desert Glass Scarab Relic",
        "description": "A radiant scarab amulet carved from translucent silica desert glass formed by ancient meteorite impacts in the Libyan desert.",
        "itemType": "Collectible",
        "materials": ["desert glass", "gold ore", "lapis lazuli"],
        "zone": "Egypt",
        "interactiveProperties": "Can be displayed on velvet pedestals inside the Inn to increase room culture rating by 120 points.",
        "basedOn": "Tutankhamun's meteoritic desert glass pectoral amulets matched with O'Keeffe's luminous desert light study.",
        "variants": ["Golden Solar", "Azure Lapis Inlay"]
    },

    # ==========================================
    # 2. GREECE (Monet)
    # Style: Claude Monet - Impressionistic light, soft pastel marble, olive groves, bronze, philosophical garden aesthetics.
    # ==========================================
    {
        "name": "Monet's Olive-Crown Dial",
        "description": "A bronze solar dial surrounded by a wreath of impressionistic bronze and silver olive leaves that catch and refract dappled sunlight.",
        "itemType": "QuestItem",
        "materials": ["bronze", "marble", "silver"],
        "zone": "Greece",
        "interactiveProperties": "Aligning the shadow at solar noon unlocks the lost philosophical discourse of the Academy.",
        "basedOn": "Greek olive wreaths and sun dials rendered in Monet's shimmering, dappled garden lighting style.",
        "variants": ["Verdigris Bronze", "Polished Silver Leaf"]
    },
    {
        "name": "Scroll of the Lyceum's Lost Theorem",
        "description": "A preserved parchment roll bound with woven silk thread, containing Aristotle's lost commentary on natural harmony and geometry.",
        "itemType": "QuestItem",
        "materials": ["parchment", "olive wood", "silk"],
        "zone": "Greece",
        "interactiveProperties": "Delivered to the Inn's Scholar NPC to complete the 'Architecture of Reason' questline.",
        "basedOn": "Classical Greek philosophical manuscripts and Monet's thematic focus on harmony and perception.",
        "variants": ["Parchment Roll", "Gilded Margin Edition"]
    },
    {
        "name": "Impressionist Marble Water Basin",
        "description": "A shallow basin carved from white Parian marble, filled with water reflecting soft impressionist brushstroke ripples of sky and olive branches.",
        "itemType": "Interactive",
        "materials": ["marble", "limestone (imported)", "bronze"],
        "zone": "Greece",
        "interactiveProperties": "Players can float water lilies in the basin or gaze into it to reveal hidden quest clues in the reflections.",
        "basedOn": "Classical Greek nymph fountains merged directly with Monet's iconic water lily and reflection paintings.",
        "variants": ["White Parian Marble", "Rose Pentelic Marble"]
    },
    {
        "name": "Dappled Light Bronze Armillary Sphere",
        "description": "An astronomical instrument of interlinking bronze rings set upon a fluted marble pedestal, casting delicate dappled shadows.",
        "itemType": "Interactive",
        "materials": ["bronze", "marble", "copper"],
        "zone": "Greece",
        "interactiveProperties": "Players can spin the celestial rings to align constellations and project starry light patterns onto room walls.",
        "basedOn": "Hellenistic astronomical instruments rendered through Monet's interest in light diffusion and atmospheric haze.",
        "variants": ["Patinated Bronze", "Gilded Brass"]
    },
    {
        "name": "Sunlit Olive Wood Philosopher Bench",
        "description": "A spacious outdoor bench carved from seasoned olive wood with soft curved backrests designed for long philosophical debates.",
        "itemType": "Furniture",
        "materials": ["olive wood", "bronze", "terracotta"],
        "zone": "Greece",
        "interactiveProperties": "Seats up to three avatars simultaneously and boosts intellectual crafting success rate by 10%.",
        "basedOn": "Agora debate benches from classical Athens softened by Monet's plein-air outdoor furniture aesthetics.",
        "variants": ["Natural Olive Wood", "Bleached Ash Finish"]
    },
    {
        "name": "Fluted Parian Marble Pedestal",
        "description": "An elegant marble column section with delicate fluting that reflects ambient light in soft pastel hues.",
        "itemType": "Furniture",
        "materials": ["marble", "limestone (imported)"],
        "zone": "Greece",
        "interactiveProperties": "Acts as a display platform for artifacts, statues, or urns, increasing nearby item beauty score.",
        "basedOn": "Doric and Ionic classical columns bathed in Monet's soft impressionistic Mediterranean morning light.",
        "variants": ["Parian White", "Ivory Cream"]
    },
    {
        "name": "Bronze Caliper of Golden Ratios",
        "description": "A precise measuring tool crafted from cast bronze and silver rivets, used by ancient architects to calculate divine proportions.",
        "itemType": "Tool",
        "materials": ["bronze", "silver", "olive wood"],
        "zone": "Greece",
        "interactiveProperties": "Equipped while building structures to unlock perfect golden ratio blueprint snapping and bonus stability.",
        "basedOn": "Hellenistic mathematical instruments and Monet's structural canvas compositions.",
        "variants": ["Bronze & Silver", "Aged Brass"]
    },
    {
        "name": "Petrified Olive Leaf Pendant",
        "description": "An ancient olive leaf preserved in clear calcite matrix, hung on a fine bronze wire loop.",
        "itemType": "Collectible",
        "materials": ["olive wood", "marble", "bronze"],
        "zone": "Greece",
        "interactiveProperties": "Can be stored in the archive collection cabinet to unlock the 'Athena's Blessing' lore entry.",
        "basedOn": "Sacred olive groves of Athens and Monet's shimmering foliage textures.",
        "variants": ["Calcite Cased", "Gold Leaf Plated"]
    },

    # ==========================================
    # 3. MESOPOTAMIA (Hokusai)
    # Style: Katsushika Hokusai - Dynamic woodblock wave lines, bold ink contours, bitumen, clay tablets, reed marshes, soaring ziggurat tiers.
    # ==========================================
    {
        "name": "Cuneiform Tablet of the Deluge",
        "description": "A heavy baked clay tablet carved with sharp cuneiform script and bordered by dramatic Hokusai-style swirling wave engravings.",
        "itemType": "QuestItem",
        "materials": ["baked brick", "clay/mudbrick", "bitumen"],
        "zone": "Mesopotamia",
        "interactiveProperties": "Translating the tablet at the Scribe's Desk reveals the location of the Great Marsh Ziggurat.",
        "basedOn": "The Epic of Gilgamesh Flood Tablet combined with Hokusai's iconic Great Wave printmaking aesthetic.",
        "variants": ["Terracotta Red", "Bitumen Black Accent"]
    },
    {
        "name": "Golden Bull Head of Ur",
        "description": "A majestic lyre lyre-ornament depicting a sacred bull with a lapis lazuli beard and sweeping horns rendered in dynamic woodblock-style curves.",
        "itemType": "QuestItem",
        "materials": ["gold ore", "lapis lazuli", "cedar"],
        "zone": "Mesopotamia",
        "interactiveProperties": "Mounted onto the Royal Lyre of Ur to restore ancient Mesopotamian musical acoustics in the Inn.",
        "basedOn": "The Royal Tombs of Ur lyre ornaments stylized with Hokusai's expressive animal silhouettes.",
        "variants": ["Lapis Bearded", "Gilded Ochre"]
    },
    {
        "name": "Bitumen-Sealed Reed Sluice Gate",
        "description": "A heavy marsh floodgate woven from dense river reeds and caulked with dark water-resistant bitumen, featuring stylized wave crests.",
        "itemType": "Interactive",
        "materials": ["reed", "bitumen", "clay/mudbrick"],
        "zone": "Mesopotamia",
        "interactiveProperties": "Players can raise or lower the gate handle to control water flow in the Inn's irrigation canals.",
        "basedOn": "Ancient Sumerian canal management infrastructure drawn with Hokusai's woodblock print outline vigor.",
        "variants": ["Bitumen Black", "Natural Reed Tan"]
    },
    {
        "name": "Hokusai Crested Wave Clay Stamp Wheel",
        "description": "A cylindrical terracotta seal mounted on a wooden spindle, designed to roll intricate wave and ziggurat patterns onto soft clay bricks.",
        "itemType": "Interactive",
        "materials": ["clay/mudbrick", "cedar", "copper"],
        "zone": "Mesopotamia",
        "interactiveProperties": "Interacting with raw mudbrick stacks stamps them with ornamental wave crests prior to kiln firing.",
        "basedOn": "Mesopotamian cylinder seals crossed with Hokusai's thirty-six views wave motifs.",
        "variants": ["Prussian Blue Glaze", "Raw Clay"]
    },
    {
        "name": "Glazed Cobalt Mudbrick Table",
        "description": "A sturdy low table constructed from baked mudbricks glazed in vibrant lapis blue, reminiscent of the Ishtar Gate.",
        "itemType": "Furniture",
        "materials": ["baked brick", "lapis lazuli", "bitumen"],
        "zone": "Mesopotamia",
        "interactiveProperties": "Provides surface storage for up to four small items and grants an ambiance bonus to nearby dining areas.",
        "basedOn": "Babylonian glazed architectural brickwork rendered in Hokusai's intense Prussian blue pigment palette.",
        "variants": ["Ishtar Cobalt", "Sumerian Ochre"]
    },
    {
        "name": "Marsh-Reed Braided Screen Bed",
        "description": "A elevated sleeping couch constructed from bound marsh reeds and bitumen-coated cedar legs, topped with woven linen mats.",
        "itemType": "Furniture",
        "materials": ["reed", "cedar", "bitumen"],
        "zone": "Mesopotamia",
        "interactiveProperties": "Allows avatars to rest and skip night hours in the game cycle.",
        "basedOn": "Sumerian marsh dweller furniture (Madan architecture) with Hokusai's graphic textile patterns.",
        "variants": ["Marsh Green", "Dried Gold Reed"]
    },
    {
        "name": "Bronze Reed Cuneiform Stylus",
        "description": "A bevel-tipped stylus forged from bronze with a carved reed handle, ideal for making crisp wedge marks in soft clay.",
        "itemType": "Tool",
        "materials": ["bronze", "reed", "copper"],
        "zone": "Mesopotamia",
        "interactiveProperties": "Used to write custom archival notes on wet clay tablets or craft tablet recipes.",
        "basedOn": "Traditional Mesopotamian scribal instruments.",
        "variants": ["Polished Bronze", "Raw Copper"]
    },
    {
        "name": "Lapis Lazuli Cylinder Seal",
        "description": "A small carved cylinder of deep blue lapis lazuli engraved with miniature scenes of gods taming roaring wave monsters.",
        "itemType": "Collectible",
        "materials": ["lapis lazuli", "gold ore"],
        "zone": "Mesopotamia",
        "interactiveProperties": "Can be stamped onto wax or clay in the catalog ledger to verify rare document authenticity.",
        "basedOn": "Sumerian and Akkadian cylinder seals showcasing mythic heroism and Hokusai's dynamic monster lines.",
        "variants": ["Royal Lapis", "Gold Cap Inlay"]
    },

    # ==========================================
    # 4. CAMELOT (Moreau)
    # Style: Gustave Moreau - Jewel-toned symbolism, ornate mythical metalwork, dreamlike chivalric mysticism, English oak, stone castles, grail quests.
    # ==========================================
    {
        "name": "Grail Maiden's Enameled Reliquary",
        "description": "An opulent casket of chiseled silver and dark English oak, encrusted with ruby enamels depicting the vision of the Holy Grail.",
        "itemType": "QuestItem",
        "materials": ["english oak", "silver", "stained glass", "granite"],
        "zone": "Camelot",
        "interactiveProperties": "Placing the Chalice of Light inside activates the glowing stained-glass sanctuary doors.",
        "basedOn": "Arthurian grail mythology rendered in Gustave Moreau's jewel-encrusted Symbolist painterly detail.",
        "variants": ["Ruby Enamel", "Sapphire Enamel"]
    },
    {
        "name": "Chivalric Vow Parchment Scroll",
        "description": "An illuminated oath scroll bound in purple velvet and sealed with gold leaf, inscribed with the code of the Round Table.",
        "itemType": "QuestItem",
        "materials": ["parchment", "gold ore", "velvet", "english oak"],
        "zone": "Camelot",
        "interactiveProperties": "Used at the Great Hall Bench to knight companion NPCs and boost their loyalty stat.",
        "basedOn": "Arthurian chivalric romance manuscripts and Moreau's mysterious, dreamlike heraldic symbolism.",
        "variants": ["Crimson Seal", "Royal Purple Seal"]
    },
    {
        "name": "Jeweled Round Table Compass",
        "description": "A heavy table-mounted brass dial set into a starburst pattern of English oak and inlaid silver, pointing toward sacred quest sites.",
        "itemType": "Interactive",
        "materials": ["english oak", "silver", "granite", "gold ore"],
        "zone": "Camelot",
        "interactiveProperties": "Players turn the central needle to reveal quest markers for hidden relics across the world map.",
        "basedOn": "King Arthur's Round Table combined with Moreau's intricate, star-dusted decorative arts designs.",
        "variants": ["Silver Starburst", "Gilded Brass"]
    },
    {
        "name": "Enchanted Sword Stone Anvil",
        "description": "A massive block of carved granite bound with iron bands, bearing a glowing blade socket where Excalibur was once drawn.",
        "itemType": "Interactive",
        "materials": ["granite", "iron", "silver"],
        "zone": "Camelot",
        "interactiveProperties": "Players can insert broken quest blades to forge or repair magical chivalric weaponry.",
        "basedOn": "The legend of the Sword in the Stone cast in Moreau's mystical, dramatic lighting.",
        "variants": ["Dark Granite", "Mossy Castle Stone"]
    },
    {
        "name": "Carved English Oak High Chair",
        "description": "A tall-backed hall chair hand-carved with elaborate heraldic beasts, vine motifs, and stained-glass inlay accents.",
        "itemType": "Furniture",
        "materials": ["english oak", "velvet", "stained glass"],
        "zone": "Camelot",
        "interactiveProperties": "Grants a 'Ruler's Presence' buff to avatars sitting at the head of a banquet hall.",
        "basedOn": "Medieval knightly thrones embellished with Moreau's intricate Symbolist woodcarvings.",
        "variants": ["Dark Forest Oak", "Aged Chestnut Finish"]
    },
    {
        "name": "Stained-Glass Gothic Arch Display Frame",
        "description": "A grand stone arch holding vibrant stained-glass panels that cast mystical red, cobalt, and gold light patterns across the floor.",
        "itemType": "Furniture",
        "materials": ["granite", "stained glass", "iron"],
        "zone": "Camelot",
        "interactiveProperties": "Filters room lighting into rich jewel tones and enhances the display value of adjacent collectibles.",
        "basedOn": "Gothic cathedral windows featured in Moreau's atmospheric religious and mythic canvases.",
        "variants": ["Grail Rose Window", "Lancelot Blue"]
    },
    {
        "name": "Moreau Damascened Iron Broadsword",
        "description": "A ceremonial longsword forged with intricate gold damascening along the fuller, depicting dreamlike dragons and lilies.",
        "itemType": "Tool",
        "materials": ["iron", "gold ore", "english oak"],
        "zone": "Camelot",
        "interactiveProperties": "Can be used to clear dense enchanted brambles or displayed as a wall-mounted weapon.",
        "basedOn": "Chivalric ceremonial weaponry rendered with Moreau's dense gold ornament.",
        "variants": ["Gilded Blade", "Blackened Iron"]
    },
    {
        "name": "Gilded Grail Goblet Fragment",
        "description": "A preserved fragment of a beaten gold chalice inset with cabochon garnets and intricate filigree.",
        "itemType": "Collectible",
        "materials": ["gold ore", "silver", "stained glass"],
        "zone": "Camelot",
        "interactiveProperties": "Increases overall Inn mysticism score when exhibited in the Reliquary Wing.",
        "basedOn": "The Holy Grail motif central to Moreau's late Symbolist masterpieces.",
        "variants": ["Garnet Inset", "Emerald Inset"]
    },

    # ==========================================
    # 5. PERU (Guo Xi)
    # Style: Guo Xi - Soaring mist-shrouded Andean mountain peaks, sweeping ink brushwork, Inca stonework, gold, alder trees, terrace engineering.
    # ==========================================
    {
        "name": "Khipu Knot-Record of the Sun King",
        "description": "An intricate system of knotted cotton and alpaca wool cords dyed in indigo and ochre, recording ancient mountain harvest lore.",
        "itemType": "QuestItem",
        "materials": ["andean alder", "gold ore", "silver"],
        "zone": "Peru",
        "interactiveProperties": "Decoded by the Weaver NPC to unlock high-altitude agricultural terrace blueprints.",
        "basedOn": "Inca khipu record-keeping reimagined through Guo Xi's misty, rhythmic mountain compositions.",
        "variants": ["Indigo & Ochre Cords", "Royal Crimson Cords"]
    },
    {
        "name": "Golden Intihuatana Sun Tether",
        "description": "A sacred carved gold and andesite pillar designed to 'hitch the sun' at the solstice, shaped with soaring mountain contours.",
        "itemType": "QuestItem",
        "materials": ["andesite", "gold ore", "andean alder"],
        "zone": "Peru",
        "interactiveProperties": "When calibrated at noon, it summons solar light trails that reveal hidden mountain passes.",
        "basedOn": "The Intihuatana stone of Machu Picchu stylized with Guo Xi's towering vertical mountain perspectives.",
        "variants": ["Polished Gold", "Raw Andesite Base"]
    },
    {
        "name": "Fitting-Stone Terrace Sluice Lever",
        "description": "A precision-carved stone mechanism fitted seamlessly without mortar, used to control water channels on steep agricultural terraces.",
        "itemType": "Interactive",
        "materials": ["andesite", "limestone (imported)", "andean alder"],
        "zone": "Peru",
        "interactiveProperties": "Players pull the stone lever to irrigate terrace garden beds, doubling crop yield speed.",
        "basedOn": "Inca mortarless masonry and hydraulic engineering framed by Guo Xi's landscape harmony.",
        "variants": ["Grey Andesite", "Dark Basalt"]
    },
    {
        "name": "Mist-Resonating Panpipe Pillar",
        "description": "A vertical stone and alder-wood organ pipe structure that produces deep harmonic tones when mountain mists pass through it.",
        "itemType": "Interactive",
        "materials": ["andean alder", "andesite", "reed (imported)"],
        "zone": "Peru",
        "interactiveProperties": "Playing specific musical notes on the pipes clears surrounding fog and triggers cloud-bridge paths.",
        "basedOn": "Andean panpipes (siku) integrated into Guo Xi's ethereal mist-and-mountain ink atmospheres.",
        "variants": ["Alder Wood", "Andesite Carved"]
    },
    {
        "name": "Polished Andesite Throne Chair",
        "description": "A seat carved directly from volcanic stone with twelve-angled joint motifs and comfortable woven alpaca padding.",
        "itemType": "Furniture",
        "materials": ["andesite", "andean alder", "gold ore"],
        "zone": "Peru",
        "interactiveProperties": "Offers sturdy seating for avatars and provides immunity to cold weather effects nearby.",
        "basedOn": "Inca royal stone thrones and Guo Xi's monumental mountain rock textures.",
        "variants": ["Twelve-Angle Cut", "Sun Emblem Carved"]
    },
    {
        "name": "Andean Alder Carved Storage Chest",
        "description": "A heavy wooden chest made from native Andean alder wood, decorated with geometric Inca key (tocapu) patterns and gold latches.",
        "itemType": "Furniture",
        "materials": ["andean alder", "gold ore", "copper"],
        "zone": "Peru",
        "interactiveProperties": "Provides 24 slots of item storage for seeds, ores, and textile materials.",
        "basedOn": "Inca wooden qero vessels and furniture with Guo Xi's organic wood grain brushwork.",
        "variants": ["Tocapu Inlaid", "Natural Alder"]
    },
    {
        "name": "Inca Bronze Chappi Adze",
        "description": "A durable cutting tool with a heavy bronze blade lashed to a curved Andean alder handle using leather thongs.",
        "itemType": "Tool",
        "materials": ["bronze", "andean alder", "copper"],
        "zone": "Peru",
        "interactiveProperties": "Used for harvesting mountain alder timber and shaping precision stone blocks.",
        "basedOn": "Traditional Inca metalworking and stonemason tools.",
        "variants": ["Bronze Blade", "Hardened Copper Blade"]
    },
    {
        "name": "Guo Xi Mist-Flecked Gold Mask",
        "description": "A ceremonial golden burial mask featuring repoussé mountain spirits surrounded by swirling ink-like cloud tendrils.",
        "itemType": "Collectible",
        "materials": ["gold ore", "silver", "andesite"],
        "zone": "Peru",
        "interactiveProperties": "Can be mounted on gallery walls to boost room elegance score by 150 points.",
        "basedOn": "Sican and Inca funerary masks fused with Guo Xi's northern Song landscape mist aesthetics.",
        "variants": ["Gilded Gold", "Silver Inlaid"]
    },

    # ==========================================
    # 6. CHINA (Mulan ink-wash)
    # Style: Mulan ink-wash - Expressive monochrome brushstrokes, fluid calligraphic lines, bamboo, jade, lacquer, silk, pagodas.
    # ==========================================
    {
        "name": "Imperial Silk Calligraphy Scroll of Honor",
        "description": "A long silk wall scroll featuring bold, sweeping ink-wash brushwork depicting mountain bamboo and heroic verses of loyalty.",
        "itemType": "QuestItem",
        "materials": ["silk", "bamboo", "pine"],
        "zone": "China",
        "interactiveProperties": "Hanging the scroll in the Main Hall unlocks the 'Path of the Warrior Scholar' quest.",
        "basedOn": "The Ballad of Mulan and classical Song Dynasty ink-wash calligraphy scrolls.",
        "variants": ["Black Ink on White Silk", "Gold Leaf Ink on Crimson Silk"]
    },
    {
        "name": "Jade Dragon Jadeite Seal",
        "description": "A square seal carved from translucent green jade, topped with a coiled dragon executed with fluid calligraphic curves.",
        "itemType": "QuestItem",
        "materials": ["jade", "gold ore", "silk"],
        "zone": "China",
        "interactiveProperties": "Used to stamp official imperial pardons and open the Pavilion of Five Dragons.",
        "basedOn": "Chinese imperial jade seals (Xi) styled with expressive Mulan-era ink stroke silhouettes.",
        "variants": ["Imperial Green Jade", "Mutton-Fat White Jade"]
    },
    {
        "name": "Ink-Wash Bamboo Wind Chime Fountain",
        "description": "A tranquil water feature crafted from hollow bamboo stalks and black river stone, producing gentle rhythmic clicks and splashing water.",
        "itemType": "Interactive",
        "materials": ["bamboo", "river stone", "lacquer"],
        "zone": "China",
        "interactiveProperties": "Interacting with the fountain restores avatar focus and generates ambient relaxation soundscapes.",
        "basedOn": "Traditional East Asian garden water features rendered in fluid ink-wash animation.",
        "variants": ["Natural Green Bamboo", "Dark Lacquered Bamboo"]
    },
    {
        "name": "Carved Lacquer Weiqi Game Board",
        "description": "A low wooden table coated in glossy cinnabar lacquer, inlaid with jade grid lines and featuring bowls of black and white stone pieces.",
        "itemType": "Interactive",
        "materials": ["lacquer", "jade", "bamboo", "river stone"],
        "zone": "China",
        "interactiveProperties": "Two avatars can sit and play a full game of Go (Weiqi) to earn strategy perks.",
        "basedOn": "Classical scholar games depicted in Chinese monochrome paintings and court arts.",
        "variants": ["Cinnabar Red Lacquer", "Deep Black Lacquer"]
    },
    {
        "name": "Cinnabar Lacquer Pagoda Cabinet",
        "description": "A multi-tiered storage cabinet shaped like a classic pagoda, coated in deep red lacquer with hand-painted gold bamboo motifs.",
        "itemType": "Furniture",
        "materials": ["lacquer", "bamboo", "gold ore", "pine"],
        "zone": "China",
        "interactiveProperties": "Holds up to 30 items and acts as a focal decor piece for oriental tea rooms.",
        "basedOn": "Ming and Qing Dynasty carved lacquerware furniture simplified into crisp ink-wash lines.",
        "variants": ["Cinnabar Red", "Ebony Lacquer"]
    },
    {
        "name": "Slender Bamboo Screen Divider",
        "description": "A lightweight room screen composed of woven bamboo slats framed in dark stained timber, decorated with subtle ink pine prints.",
        "itemType": "Furniture",
        "materials": ["bamboo", "silk", "pine"],
        "zone": "China",
        "interactiveProperties": "Divides room spaces to create private alcoves while allowing ambient light to pass through.",
        "basedOn": "Traditional Chinese folding screens (Pingfeng) featuring brush-and-ink landscapes.",
        "variants": ["Ink Pine Print", "Plum Blossom Print"]
    },
    {
        "name": "Scholar's Wolf-Hair Calligraphy Brush",
        "description": "A fine ink brush with a carved bamboo shaft and nickel-wrapped wolf hair bristles, ideal for expressive landscape painting.",
        "itemType": "Tool",
        "materials": ["bamboo", "jade", "silk"],
        "zone": "China",
        "interactiveProperties": "Used to paint ink-wash murals on plain plaster walls inside the Inn.",
        "basedOn": "The Four Treasures of the Study in classical Chinese scholar culture.",
        "variants": ["Carved Bamboo Shaft", "Jade Tipped Shaft"]
    },
    {
        "name": "Carved Dragon Jade Figurine",
        "description": "A pocket-sized statuette of a celestial dragon carved from mottled green jade, smooth to the touch.",
        "itemType": "Collectible",
        "materials": ["jade", "silk"],
        "zone": "China",
        "interactiveProperties": "Can be gifted to NPCs to significantly raise friendship levels.",
        "basedOn": "Chinese jade carving traditions celebrating luck, honor, and nature.",
        "variants": ["Emerald Jade", "Celadon Jade"]
    },

    # ==========================================
    # 7. NORSE (Book of Kells)
    # Style: Book of Kells - Intricate insular knotwork, interlaced serpent beasts, illuminated runic borders, pine, birch, bog iron, runestones, longships.
    # ==========================================
    {
        "name": "Runestone of the World Tree",
        "description": "A slab of grey granite carved with intricate insular knotwork serpents framing ancient Futhark runes illuminated in gold leaf.",
        "itemType": "QuestItem",
        "materials": ["runestone", "pine", "gold ore"],
        "zone": "Norse",
        "interactiveProperties": "Placing the stone into the Hearth Nexus unlocks the Yggdrasil realm branch on the world map.",
        "basedOn": "Norse runestones rendered with Book of Kells style manuscript interlacing and serpent zoomorphs.",
        "variants": ["Gold Leaf Runes", "Red Ochre Runes"]
    },
    {
        "name": "Illuminated Longship Prow Ribbon",
        "description": "A carved pine longship prow dragonhead wrapped in illuminated vellum ribbons featuring knotwork monsters.",
        "itemType": "QuestItem",
        "materials": ["pine", "parchment", "bog iron"],
        "zone": "Norse",
        "interactiveProperties": "Attached to the Inn's harbor ship to enable passage through storm-wracked fjords.",
        "basedOn": "Oseberg ship dragon prows merged with insular illuminated manuscript motifs.",
        "variants": ["Dragonhead Prow", "Ravenhead Prow"]
    },
    {
        "name": "Bog-Iron Serpent Knotwork Anvil",
        "description": "A heavy blacksmith anvil smelted from bog iron ore, its sides deeply chiseled with interlacing Book of Kells beast knotwork.",
        "itemType": "Interactive",
        "materials": ["bog iron", "birch", "pine"],
        "zone": "Norse",
        "interactiveProperties": "Players use the anvil to forge runic tools and armored gear with enhanced durability.",
        "basedOn": "Viking Age bog iron metallurgy decorated with insular manuscript animal knotwork.",
        "variants": ["Smelted Bog Iron", "Charcoal Tempered"]
    },
    {
        "name": "Runestone Sunstone Compass Dial",
        "description": "A stone disk set with a translucent Icelandic spar crystal and framed by Celtic-Norse interlaced metal borders.",
        "itemType": "Interactive",
        "materials": ["runestone", "bog iron", "amber"],
        "zone": "Norse",
        "interactiveProperties": "Rotating the stone aligns sunbeams through overcast skies to reveal hidden treasure coordinates.",
        "basedOn": "Norse sunstone navigation devices embellished with Book of Kells illuminated borders.",
        "variants": ["Spar Crystal", "Amber Inlaid"]
    },
    {
        "name": "Kells Interlaced Pine Feast Bench",
        "description": "A long communal hall bench crafted from sturdy pine, decorated along the seat edges with carved ribbon-beast knotwork.",
        "itemType": "Furniture",
        "materials": ["pine", "birch", "bog iron"],
        "zone": "Norse",
        "interactiveProperties": "Seats up to six avatars for mead hall feasting, granting a 'Skaldic Cheer' stamina buff.",
        "basedOn": "Norse mead hall furniture decorated with Book of Kells illuminated interlace carvings.",
        "variants": ["Dark Stained Pine", "Bleached Birch Accent"]
    },
    {
        "name": "Carved Birch Shield Display Rack",
        "description": "A wall-mounted rack constructed from birch timber and bog iron fittings, built to hold up to four round shields.",
        "itemType": "Furniture",
        "materials": ["birch", "bog iron", "pine"],
        "zone": "Norse",
        "interactiveProperties": "Displays shields vertically while giving a defense boost to the surrounding room.",
        "basedOn": "Longhouse armory racks decorated with insular interlacing strapwork.",
        "variants": ["Natural Birch", "Charred Pine"]
    },
    {
        "name": "Insular Bog Iron Woodcarving Gouge",
        "description": "A sharp chisel tool forged from bog iron with an ergonomically shaped birch wood handle.",
        "itemType": "Tool",
        "materials": ["bog iron", "birch", "pine"],
        "zone": "Norse",
        "interactiveProperties": "Used to carve complex knotwork patterns onto wooden furniture and boat beams.",
        "basedOn": "Viking woodworking tools and manuscript illustration stylistics.",
        "variants": ["Straight Gouge", "Curved V-Gouge"]
    },
    {
        "name": "Polished Baltic Amber Beast Amulet",
        "description": "A glowing chunk of golden Baltic amber carved into a coiled beast figure with interlaced limbs.",
        "itemType": "Collectible",
        "materials": ["amber", "bog iron"],
        "zone": "Norse",
        "interactiveProperties": "Glows softly in dark rooms and grants nearby plants faster growth rates.",
        "basedOn": "Viking amber trade goods and Celtic/Norse animal art styles.",
        "variants": ["Honey Amber", "Cherry Amber"]
    },

    # ==========================================
    # 8. SLAVIC (Roerich)
    # Style: Nicholas Roerich - Vibrant spiritual mountain palettes, deep azure and gold Orthodox architecture, birch forests, amber, sacred folklore.
    # ==========================================
    {
        "name": "Icon of the Firebird Feather",
        "description": "A sacred panel painting framed in carved birch, depicting a glowing Firebird feather against Roerich's signature ultramarine mountains.",
        "itemType": "QuestItem",
        "materials": ["birch", "amber", "gold ore"],
        "zone": "Slavic",
        "interactiveProperties": "Placed in the Hearth Shrine to complete the 'Light of Tsarevich' quest and banish dark frost.",
        "basedOn": "Slavic folklore of the Firebird rendered in Nicholas Roerich's luminous, spiritual color palette.",
        "variants": ["Ultramarine Sky", "Golden Twilight Sky"]
    },
    {
        "name": "Amber Rosary of the Sacred Forest",
        "description": "A strand of thirty-three polished Baltic amber beads linked by silver wire, radiating a warm pine resin scent.",
        "itemType": "QuestItem",
        "materials": ["amber", "silver", "birch"],
        "zone": "Slavic",
        "interactiveProperties": "Used to bless the forest shrine and appease local Leshy nature spirits.",
        "basedOn": "Orthodox prayer beads combined with Roerich's veneration of sacred mountain forests.",
        "variants": ["Honey Amber Beads", "Cognac Amber Beads"]
    },
    {
        "name": "Orthodox Bell Chime Console",
        "description": "A miniature bronze bell tower frame resting on birch beams, tuned to ring deep resonant spiritual chords.",
        "itemType": "Interactive",
        "materials": ["bronze", "birch", "copper"],
        "zone": "Slavic",
        "interactiveProperties": "Players can ring the bells in sequence to play traditional Slavic folk melodies and summon songbirds.",
        "basedOn": "Slavic Orthodox church bell ringing (Zvon) and Roerich's architectural paintings of ancient Pskov.",
        "variants": ["Gilded Bronze Bells", "Patinated Copper Bells"]
    },
    {
        "name": "Gilded Birch Sacred Hearth Shrine",
        "description": "A wooden corner altar (Krasny Ugol) carved from white birch, featuring gold foil trim and candle holders.",
        "itemType": "Interactive",
        "materials": ["birch", "gold ore", "amber", "pine"],
        "zone": "Slavic",
        "interactiveProperties": "Players can light beeswax candles at the shrine to grant the Inn guests a feeling of warmth and peace.",
        "basedOn": "The 'Beautiful Corner' tradition in Slavic homes framed by Roerich's vivid, reverent art style.",
        "variants": ["Gilded White Birch", "Dark Painted Birch"]
    },
    {
        "name": "Roerich Cobalt Painted Birch Bench",
        "description": "A sturdy wooden bench painted in deep cobalt blue and ochre folk motifs, inspired by ancient Northern Russian timber work.",
        "itemType": "Furniture",
        "materials": ["birch", "pine", "copper"],
        "zone": "Slavic",
        "interactiveProperties": "Provides comfortable seating for two and enhances room color harmony rating.",
        "basedOn": "Russian folk furniture depicted in Roerich's stage sets for Le Sacre du Printemps.",
        "variants": ["Cobalt & Ochre", "Vermilion & Gold"]
    },
    {
        "name": "Carved Lime-Wood Iconostasis Screen",
        "description": "A tall wooden screen filled with delicate floral fretwork and arches designed to hold sacred icons and artwork.",
        "itemType": "Furniture",
        "materials": ["birch", "lime wood", "gold ore"],
        "zone": "Slavic",
        "interactiveProperties": "Serves as a partition wall that displays up to three paintings or collectible icons.",
        "basedOn": "Orthodox iconostasis screens painted with Roerich's bold architectural geometry.",
        "variants": ["Gold Leafed", "Natural Lime Wood"]
    },
    {
        "name": "Repoussé Brass Birch-Bark Carving Knife",
        "description": "A short, sharp carving knife with a repoussé brass ferrule and a layered birch-bark handle that provides a firm grip.",
        "itemType": "Tool",
        "materials": ["brass", "birch", "copper"],
        "zone": "Slavic",
        "interactiveProperties": "Used to craft birch-bark containers (tuyas) and intricate wooden folk toys.",
        "basedOn": "Traditional Northern Russian artisan woodworking tools.",
        "variants": ["Birch Bark Handle", "Amber Inlaid Handle"]
    },
    {
        "name": "Raw Baltic Amber Sun-Stone Gem",
        "description": "An uncut piece of raw golden amber containing ancient pine needle inclusions, glowing when held up to sunlight.",
        "itemType": "Collectible",
        "materials": ["amber", "pine"],
        "zone": "Slavic",
        "interactiveProperties": "Can be refined into varnish or displayed in gem cabinets for high prestige score.",
        "basedOn": "Baltic amber trade routes and Roerich's glowing mountain color harmonies.",
        "variants": ["Raw Rough", "Polished Face"]
    },

    # ==========================================
    # 9. INDIA (Tagore)
    # Style: Rabindranath Tagore - Expressive organic forms, poetic rhythmic motifs, deep teak and sandalwood warmth, copper, spice route resonance, ancient temple harmony.
    # ==========================================
    {
        "name": "Copper Plate Charter of the Monsoon Route",
        "description": "An engraved copper plate inscribed with poetic maritime routes and star charts used by ancient spice traders.",
        "itemType": "QuestItem",
        "materials": ["copper", "teak", "brass"],
        "zone": "India",
        "interactiveProperties": "Examined on the Map Table to open the Indian Ocean spice route trade missions.",
        "basedOn": "Ancient Indian copper plate grants (Tamrapatra) combined with Tagore's poetic travel memoirs.",
        "variants": ["Engraved Copper", "Patinated Verdigris"]
    },
    {
        "name": "Sandalwood Veena of Poetic Verses",
        "description": "A musical stringed instrument carved from fragrant red sandalwood, featuring gourd resonators etched with fluid Tagore ink motifs.",
        "itemType": "QuestItem",
        "materials": ["sandalwood", "brass", "copper", "silk"],
        "zone": "India",
        "interactiveProperties": "Playing the Veena in the Courtyard unlocks the 'Song of the Evening Raga' quest event.",
        "basedOn": "Classical Indian musical traditions and Rabindranath Tagore's Rabindra Sangeet composition heritage.",
        "variants": ["Red Sandwood", "Inlaid Ivory-Wood"]
    },
    {
        "name": "Tagore Brass Incense Burner Fountain",
        "description": "A tiered brass burner that releases gentle sandalwood incense smoke that flows downward like liquid water over copper steps.",
        "itemType": "Interactive",
        "materials": ["brass", "copper", "sandalwood"],
        "zone": "India",
        "interactiveProperties": "Players can ignite various spice incense sticks to change the fragrance and ambient mood of the room.",
        "basedOn": "Temple incense rituals and Tagore's fluid, rhythmically curved ink paintings.",
        "variants": ["Polished Brass", "Antique Copper"]
    },
    {
        "name": "Temple Lotus Oil Lamp Turret",
        "description": "A multi-tiered brass lamp tower (Deepastambha) adorned with lotus petal wicks that cast warm flickering light.",
        "itemType": "Interactive",
        "materials": ["brass", "copper", "terracotta"],
        "zone": "India",
        "interactiveProperties": "Lighting all oil lamp tiers illuminates dark courtyard areas and attracts fireflies at night.",
        "basedOn": "South Indian temple oil lamps combined with Tagore's poetic imagery of light and devotion.",
        "variants": ["Brass Seven-Tier", "Bronze Five-Tier"]
    },
    {
        "name": "Carved Teakwood Temple Daybed",
        "description": "A sprawling daybed carved from solid teak timber, outfitted with silk bolster cushions and intricate floral lattice feet.",
        "itemType": "Furniture",
        "materials": ["teak", "silk", "sandalwood"],
        "zone": "India",
        "interactiveProperties": "Allows avatars to lounge, granting rapid health and stamina recovery bonuses.",
        "basedOn": "Traditional Indian charpai and swing beds reinterpreted with Tagore's organic artistic elegance.",
        "variants": ["Teak & Crimson Silk", "Teak & Gold Silk"]
    },
    {
        "name": "Lattice Sandalwood Jali Screen",
        "description": "An exquisitely carved sandalwood partition screen featuring complex geometric and floral ventilation patterns.",
        "itemType": "Furniture",
        "materials": ["sandalwood", "teak", "brass"],
        "zone": "India",
        "interactiveProperties": "Fills nearby rooms with natural sandalwood aroma and casts intricate shadow patterns.",
        "basedOn": "Mughal and Rajput stone/wood jali screens praised in Tagore's architectural writings.",
        "variants": ["Natural Sandalwood", "Dark Teak Stained"]
    },
    {
        "name": "Engraved Copper Spice Grinder Mortar",
        "description": "A heavy copper mortar and pestle set etched with swirling vine patterns, used for crushing aromatic spices.",
        "itemType": "Tool",
        "materials": ["copper", "brass", "teak"],
        "zone": "India",
        "interactiveProperties": "Used to process rare spices into dyes, remedies, and exotic tea recipes.",
        "basedOn": "Traditional Indian culinary and Ayurvedic processing tools.",
        "variants": ["Etched Copper", "Cast Brass"]
    },
    {
        "name": "Lotus-Engraved Copper Coin Relic",
        "description": "An ancient copper coin stamped with a blooming lotus and calligraphic Sanskrit script.",
        "itemType": "Collectible",
        "materials": ["copper", "gold ore"],
        "zone": "India",
        "interactiveProperties": "Can be placed in coin display trays to increase trade merchant discounts by 5%.",
        "basedOn": "Gupta and Chola Dynasty coinage integrated into Tagore's historical archives.",
        "variants": ["Copper Stamped", "Gold Plated"]
    },

    # ==========================================
    # 10. BAYOU (Don't Starve)
    # Style: Don't Starve - Sketchy dark hand-drawn crosshatching, raw wilderness survival, cypress roots, bog moss, Spanish moss, eerie swamp atmosphere.
    # ==========================================
    {
        "name": "Will-o'-the-Wisp Lantern Vessel",
        "description": "A eerie jar fashioned from murky blown glass and cypress bark, containing a floating, glowing swamp wisp in dark crosshatched glass.",
        "itemType": "QuestItem",
        "materials": ["cypress", "bog moss", "spanish moss", "bog iron"],
        "zone": "Bayou",
        "interactiveProperties": "Carried through murky bayou fogs to ward off shadow creatures and illuminate hidden sunken paths.",
        "basedOn": "Don't Starve light sources and bayou spirit legends with sketchy hand-drawn dark lines.",
        "variants": ["Eerie Green Wisp", "Pale Blue Wisp"]
    },
    {
        "name": "Swamp Witch's Dried Spanish Moss Doll",
        "description": "A crude poppet bound from dried Spanish moss, twiggy cypress fingers, and bog iron wire, carrying eerie charm protections.",
        "itemType": "QuestItem",
        "materials": ["spanish moss", "cypress", "bog iron"],
        "zone": "Bayou",
        "interactiveProperties": "Given to the Swamp Trapper NPC to unlock secret bayou fishing holes.",
        "basedOn": "Southern swamp folklore and Don't Starve's dark, sketchy hand-crafted survival items.",
        "variants": ["Spanish Moss Doll", "Cypress Twig Doll"]
    },
    {
        "name": "Cypress Log Crocodile Trap",
        "description": "A heavy spring-loaded jaw trap constructed from jagged cypress timber, bog iron spikes, and woven reed ropes.",
        "itemType": "Interactive",
        "materials": ["cypress", "bog iron", "reed"],
        "zone": "Bayou",
        "interactiveProperties": "Players can set the trap in swamp waters to catch giant bayou gators or aggressive marsh beasts.",
        "basedOn": "Don't Starve wilderness trap mechanics rendered with gothic crosshatched timber textures.",
        "variants": ["Bog Iron Tooth", "Charred Cypress"]
    },
    {
        "name": "Bog Iron Smokehouse Smoker",
        "description": "A tall, rickety outdoor smoker made from rusted bog iron plates and cypress wood slatted doors, venting hickory smoke.",
        "itemType": "Interactive",
        "materials": ["bog iron", "cypress", "spanish moss"],
        "zone": "Bayou",
        "interactiveProperties": "Preserves raw meat and fish into jerky, extending item shelf life indefinitely.",
        "basedOn": "Don't Starve drying racks and food smoker survival structures with sketchy line aesthetics.",
        "variants": ["Rusted Iron", "Patched Tin & Cypress"]
    },
    {
        "name": "Stilt-Mounted Cypress Plank Table",
        "description": "A rustic dining table built on rough stilt legs to keep food above murky swamp floodwaters, draped with Spanish moss.",
        "itemType": "Furniture",
        "materials": ["cypress", "spanish moss", "bog moss"],
        "zone": "Bayou",
        "interactiveProperties": "Serves as a sturdy surface for crafting hearty swamp stews and organizing tools.",
        "basedOn": "Bayou stilt cabin furniture styled with Don't Starve's angular, scratchy woodgrain strokes.",
        "variants": ["Weathered Grey Cypress", "Dark Bog Stained"]
    },
    {
        "name": "Spanish Moss Stuffed Rocking Chair",
        "description": "A creaky rocking chair fashioned from bent cypress knees and cushioned with dried Spanish moss and canvas.",
        "itemType": "Furniture",
        "materials": ["cypress", "spanish moss", "reed"],
        "zone": "Bayou",
        "interactiveProperties": "Rocking in the chair slowly restores sanity/mental composure in dark environments.",
        "basedOn": "Southern porch rockers rendered through Don't Starve's eerie gothic hand-drawn art style.",
        "variants": ["Cypress Knee Rocker", "Charred Timber Rocker"]
    },
    {
        "name": "Forged Bog Iron Swamp Machete",
        "description": "A heavy, jagged blade forged from crude bog iron with a comfortable wrapped cypress handle.",
        "itemType": "Tool",
        "materials": ["bog iron", "cypress", "spanish moss"],
        "zone": "Bayou",
        "interactiveProperties": "Clears dense Spanish moss, thick reeds, and overgrown vines to open hidden pathways.",
        "basedOn": "Don't Starve wilderness clearing tools with dark scratchy crosshatching.",
        "variants": ["Jagged Edge", "Smooth Cleaver Edge"]
    },
    {
        "name": "Preserved Gator Tooth Amulet",
        "description": "A necklace of bleached alligator teeth strung on twisted swamp reed cord with a central bog iron charm.",
        "itemType": "Collectible",
        "materials": ["bog iron", "reed", "cypress"],
        "zone": "Bayou",
        "interactiveProperties": "Grants the wearer a +10% damage bonus against aquatic creatures.",
        "basedOn": "Swamp trophy crafts and Don't Starve monster drop amulets.",
        "variants": ["Bleached Tooth", "Fossilized Tooth"]
    }
]

# Validation
print(f"Total items: {len(items)}")

zones = set(item["zone"] for item in items)
print(f"Total zones: {len(zones)}")

expected_zones = [
    "Egypt", "Greece", "Mesopotamia", "Camelot", "Peru",
    "China", "Norse", "Slavic", "India", "Bayou"
]

for z in expected_zones:
    z_items = [i for i in items if i["zone"] == z]
    types = [i["itemType"] for i in z_items]
    print(f"Zone '{z}': {len(z_items)} items. Types: {types}")
    assert len(z_items) == 8, f"Zone {z} does not have 8 items!"
    assert types.count("QuestItem") >= 2, f"Zone {z} has fewer than 2 QuestItems"
    assert types.count("Interactive") >= 2, f"Zone {z} has fewer than 2 Interactive items"
    assert types.count("Furniture") >= 2, f"Zone {z} has fewer than 2 Furniture items"
    tool_coll = types.count("Tool") + types.count("Collectible")
    assert tool_coll >= 2, f"Zone {z} has fewer than 2 Tool/Collectible items"

valid_item_types = {"Furniture", "QuestItem", "Tool", "Interactive", "Collectible"}
for idx, i in enumerate(items):
    assert i["itemType"] in valid_item_types, f"Item {idx} ({i['name']}) has invalid itemType: {i['itemType']}"
    assert isinstance(i["materials"], list) and len(i["materials"]) > 0, f"Item {idx} has invalid materials"
    assert isinstance(i["variants"], list), f"Item {idx} has invalid variants"
    assert len(i["interactiveProperties"]) > 0, f"Item {idx} missing interactiveProperties"
    assert len(i["basedOn"]) > 0, f"Item {idx} missing basedOn"

with open("zone_items_cultural.json", "w") as f:
    json.dump(items, f, indent=2)

print("Saved zone_items_cultural.json successfully!")

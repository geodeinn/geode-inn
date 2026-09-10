# Geode Inn — Language Family Tree
## Translation Routing Architecture
**Created:** 2026-08-21
**Purpose:** Maps language relationships to route translations through linguistic roots rather than English as a hub

---

## Architecture Overview

Every text in the Geode Inn has an **original language** — its root. When a player requests a translation, the system routes through the shortest path in the language family tree, NOT through English by default.

**Example paths:**
- Ovid (Latin) → Spanish player: `Latin → Spanish` (direct descendant)
- Rig Veda (Sanskrit) → Hindi player: `Sanskrit → Hindi` (direct descendant)
- Book of the Dead (Egyptian) → Japanese player: `Egyptian → (scholarly English bridge) → Japanese`
- Beowulf (Old English) → German player: `Old English → German` (Germanic family)
- Romanian player reading Latin: `Latin → Romanian` (barely a translation)

---

## Language Family Tree Data Structure

### Proto-Indo-European (PIE) — *The Root*
**ISO:** ine-pro
**Era:** ~4500-2500 BCE
**Status:** Reconstructed (no surviving texts)

#### Branch 1: Indo-Iranian
**ISO:** inc (Indo-Aryan), ira (Iranian)

##### Indo-Aryan Sub-Branch
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Vedic Sanskrit | sa-ved | 1500-500 BCE | Devanagari | Rig Veda, Atharva Veda |
| Classical Sanskrit | sa | 500 BCE-1000 CE | Devanagari | Mahabharata, Ramayana |
| Pali | pi | 500 BCE-100 CE | Brahmi/Sinhala | Buddhist canon (Tipitaka) |
| Prakrit (Ardhamagadhi) | pra | 500 BCE-500 CE | Brahmi | Jain texts |
| Hindi | hi | Modern | Devanagari | Direct Sanskrit descendant |
| Bengali | bn | Modern | Bengali | |
| Marathi | mr | Modern | Devanagari | |
| Nepali | ne | Modern | Devanagari | |
| Sinhala | si | Modern | Sinhala | Pali-influenced |
| Romani | rmy | Modern | Latin | **Key for Geode Inn Romania section** |

##### Iranian Sub-Branch
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Avestan | ae | 1000-500 BCE | Avestan | Zend Avesta (Zoroastrian) |
| Old Persian | peo | 600-300 BCE | Cuneiform | Darius inscriptions |
| Middle Persian (Pahlavi) | pal | 300 BCE-800 CE | Pahlavi | Zoroastrian books |
| Persian (Farsi) | fa | Modern | Arabic | |
| Kurdish | ku | Modern | Arabic/Latin | |
| Pashto | ps | Modern | Arabic | |

#### Branch 2: Italic (Latin Family)
**ISO:** itc

| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Old Latin | xla | 500-200 BCE | Latin | Early inscriptions |
| Classical Latin | la | 200 BCE-200 CE | Latin | Ovid, Virgil, Caesar |
| Medieval Latin | la-ecc | 500-1500 CE | Latin | Church texts, alchemy |
| French | fr | Modern | Latin | |
| Spanish | es | Modern | Latin | |
| Italian | it | Modern | Latin | |
| Portuguese | pt | Modern | Latin | |
| Romanian | ro | Modern | Latin | **Closest living Latin — Romani connection** |
| Catalan | ca | Modern | Latin | |
| Occitan | oc | Medieval-Modern | Latin | Troubadour poetry |
| Sardinian | sc | Modern | Latin | Most conservative Romance language |

#### Branch 3: Germanic
**ISO:** gem

| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Proto-Germanic | gem-pro | 500 BCE | Reconstructed | |
| Gothic | got | 300-600 CE | Gothic | Wulfila Bible (only East Germanic survivor) |
| Old English (Anglo-Saxon) | ang | 500-1100 CE | Latin/Runic | Beowulf |
| Old Norse | non | 800-1300 CE | Runic/Latin | Eddas, sagas |
| Old High German | goh | 750-1050 CE | Latin | |
| English | en | Modern | Latin | |
| German | de | Modern | Latin | |
| Dutch | nl | Modern | Latin | |
| Icelandic | is | Modern | Latin | Closest to Old Norse |
| Norwegian | no | Modern | Latin | |
| Swedish | sv | Modern | Latin | |
| Danish | da | Modern | Latin | |
| Faroese | fo | Modern | Latin | |

#### Branch 4: Celtic
**ISO:** cel

| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Gaulish | xtg | 300 BCE-500 CE | Greek/Latin | |
| Old Irish | sga | 600-900 CE | Ogham/Latin | |
| Welsh | cy | Modern | Latin | |
| Irish | ga | Modern | Latin | |
| Scottish Gaelic | gd | Modern | Latin | |
| Breton | br | Modern | Latin | |
| Cornish | kw | Modern | Latin | |

#### Branch 5: Slavic
**ISO:** sla

| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Old Church Slavonic | cu | 900-1100 CE | Cyrillic/Glagolitic | |
| Russian | ru | Modern | Cyrillic | |
| Ukrainian | uk | Modern | Cyrillic | |
| Polish | pl | Modern | Latin | |
| Czech | cs | Modern | Latin | |
| Serbian | sr | Modern | Cyrillic/Latin | |
| Croatian | hr | Modern | Latin | |
| Bulgarian | bg | Modern | Cyrillic | |
| Slovak | sk | Modern | Latin | |

#### Branch 6: Hellenic (Greek)
**ISO:** grk

| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Mycenaean Greek | grc-my | 1450-1100 BCE | Linear B | Oldest Greek (Palace archives) |
| Ancient Greek | grc | 800 BCE-300 CE | Greek | Homer, Plato, Socrates |
| Koine Greek | ell | 300 BCE-300 CE | Greek | New Testament, Septuagint |
| Modern Greek | el | Modern | Greek | |

#### Branch 7: Armenian
**ISO:** hye

| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Classical Armenian | xcl | 400-1100 CE | Armenian | |
| Modern Armenian | hy | Modern | Armenian | |

#### Branch 8: Albanian
**ISO:** sqj

| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Albanian | sq | Modern | Latin | |

#### Branch 9: Anatolian (Extinct)
**ISO:** ine-ana

| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Hittite | hit | 1600-1200 BCE | Cuneiform | Anatolia |
| Luwian | xlu | 1500-700 BCE | Hieroglyphic/Cuneiform | |

#### Branch 10: Tocharian (Extinct)
**ISO:** ine-tox

| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Tocharian A | xto | 400-800 CE | Brahmi | Silk Road (Tarim Basin) |

---

### Non-Indo-European Language Families

#### Afroasiatic Family
**ISO:** afroasiatic

##### Egyptian Branch
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Old Egyptian | egx-old | 2600-2000 BCE | Hieroglyphic | Pyramid Texts |
| Middle Egyptian | egx-mid | 2000-1300 BCE | Hieroglyphic | Book of the Dead, classic literature |
| Late Egyptian | egx-late | 1300-700 BCE | Hieroglyphic/Demotic | |
| Coptic | cop | 200-1500 CE | Coptic/Greek | Final stage of Egyptian |

##### Semitic Branch
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Akkadian | akk | 2500-500 BCE | Cuneiform | **Anunnaki texts — Sumerian liturgical continuation** |
| Sumerian | sux | 3000-1800 BCE | Cuneiform | **Anunnaki source texts** (Language isolate, but texts in cuneiform) |
| Hebrew | he | 1000 BCE-Modern | Hebrew | |
| Aramaic | arc | 1000 BCE-700 CE | Aramaic | |
| Arabic | ar | Modern | Arabic | |
| Ge'ez | gez | 100-Modern | Ge'ez | Ethiopian liturgical |

#### Sino-Tibetan Family
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Old Chinese | ozh | 1000-200 BCE | Oracle bone/Bronze | |
| Classical Chinese | lzh | 200 BCE-1900 CE | Chinese | |
| Mandarin | zh | Modern | Simplified | |
| Cantonese | yue | Modern | Traditional | |
| Tibetan | bo | Modern | Tibetan | |
| Burmese | my | Modern | Burmese | |

#### Japonic Family
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Old Japanese | ojp | 700-1200 CE | Man'yogana | |
| Classical Japanese | ja-cls | 1200-1600 CE | Kana/Kanji | |
| Japanese | ja | Modern | Kanji/Kana | |

#### Uralic Family
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Finnish | fi | Modern | Latin | |
| Hungarian | hu | Modern | Latin | |
| Estonian | et | Modern | Latin | |

#### Turkic Family
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Old Turkic | otk | 700-1300 CE | Orkhon/Runic | |
| Turkish | tr | Modern | Latin | |
| Uzbek | uz | Modern | Latin/Cyrillic | **Silk Road connection** |

#### Dravidian Family
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Tamil | ta | Modern | Tamil | **One of oldest living languages** |
| Telugu | te | Modern | Telugu | |
| Kannada | kn | Modern | Kannada | |
| Malayalam | ml | Modern | Malayalam | |

#### Austroasiatic Family
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Khmer | km | Modern | Khmer | **Naga mythology source** |
| Vietnamese | vi | Modern | Latin | **Sơn Đoòng connection** |
| Mon | mnw | Modern | Mon | |

#### Niger-Congo Family
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Swahili | sw | Modern | Latin | |
| Yoruba | yo | Modern | Latin | |
| Zulu | zu | Modern | Latin | |

#### Language Isolates (No known family)
| Language | ISO Code | Era | Script | Notes |
|----------|----------|-----|--------|-------|
| Sumerian | sux | 3000-1800 BCE | Cuneiform | **Anunnaki texts — requires bridge translation** |
| Elamite | elx | 2500-300 BCE | Cuneiform | Iran |
| Hurrian | hur | 2000-1200 BCE | Cuneiform | |
| Etruscan | ett | 700-100 BCE | Etruscan/Latin | Pre-Roman Italy |
| Basque | eu | Modern | Latin | Only surviving Pre-Indo-European in Western Europe |

---

## Translation Routing Rules

### Rule 1: Direct Descendant
If the target language is a direct descendant of the source language, translate directly.
- Latin → Spanish: direct
- Sanskrit → Hindi: direct
- Old Norse → Icelandic: direct

### Rule 2: Same Family Sibling
If source and target are in the same family branch, route through the nearest common ancestor.
- Latin → Romanian: direct (both Italic)
- Old Norse → German: route through Proto-Germanic conceptually, but practically use English bridge

### Rule 3: Bridge Translation (Ancient → Modern)
For ancient languages with no living API:
1. Use a curated scholarly translation (stored as a labeled bridge layer)
2. Translate from the bridge language to the target
3. Attribution preserved: "Translated from [ancient lang] by [scholar], [year], then to [target lang]"

### Rule 4: English as Last Resort
English is used as a bridge ONLY when no closer family connection exists. It is never the default hub.

### Rule 5: Bidirectional Attribution
Every translation records its full path. The player can see:
- Original language
- Every intermediate translation step
- Scholar attribution where applicable
- Translation method (API, scholarly, machine)

---

## Implementation Priority

### Phase 1: Foundation (In-Game Text)
- Store all stone descriptions, lore entries, NPC dialogue with translation keys
- Implement Google Translate API for 130+ modern languages
- Build language family tree as JSON data structure (this document → code)

### Phase 2: Ancient Bridge Layer
- Curate scholarly translations for: Sumerian, Egyptian (Middle), Sanskrit, Old Norse, Latin, Classical Greek, Avestan
- Store as labeled bridge records with attribution
- Build routing algorithm that finds shortest family-tree path

### Phase 3: Archive.org Pipeline
- OCR scanned books (Tesseract / Google Vision)
- Detect source language from OCR output
- Route through translation tree
- Store translated text alongside original page images

### Phase 4: Living Book System
- Living Book character dialogue stored in original language
- Real-time translation as player interacts
- Attribution to original text preserved in UI

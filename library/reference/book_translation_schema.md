# Geode Inn — Book & Translation Database Schema
**Created:** 2026-08-21
**Entities:** Book, BookTranslation, ScholarlyBridge

---

## Architecture Overview

The translation system uses three database entities that work together:

```
Book (original text)
  ├── ScholarlyBridge (curated ancient → modern translation, with attribution)
  └── BookTranslation (cached translation in a target language, with full path)
```

**Flow:**
1. A book enters the archive → stored as a **Book** record with original language, metadata, and OCR text
2. If the original language is ancient (Sumerian, Egyptian, etc.) → a **ScholarlyBridge** record stores the curated scholarly translation with full attribution
3. When a reader requests the book in their language → a **BookTranslation** record is created (or fetched from cache) with the full translation path recorded
4. PDFs are generated on demand from cached translations — not pre-stored

---

## Entity: Book

The source text — the root of everything.

| Field | Type | Description |
|-------|------|-------------|
| `title` | string (required) | Title in the original language |
| `titleTranslated` | string | English title if original is non-Latin script |
| `author` | string | Original author or attributed source |
| `languageIso` | string (required) | ISO 639-3 code (e.g., `sux` for Sumerian) |
| `languageName` | string (required) | Human-readable (e.g., "Sumerian") |
| `category` | enum (required) | mythology, religion, alchemy, history, philosophy, poetry, folklore, apocrypha, science, other |
| `region` | string | Cultural region (Sumeria, Egypt, Rome, Persia, etc.) |
| `publicationDate` | string | Approximate date of composition (BCE/CE) |
| `sourceUrl` | string | Direct URL to source (archive.org link) |
| `archiveOrgId` | string | Archive.org item ID |
| `pageCount` | number | Number of pages in the original |
| `originalText` | string | Full OCR-extracted text |
| `hasOcr` | boolean | Whether OCR is complete |
| `ocrStatus` | enum (required) | pending, processing, complete, failed, not_applicable |
| `inGameZone` | string | Which Inn zone this belongs to |
| `tags` | array | Searchable tags (Anunnaki, reincarnation, etc.) |
| `availableLanguages` | array | ISO codes of cached translations |
| `translationCount` | number | How many languages translated into |
| `downloadCount` | number | How many times accessed |
| `publisher` | string | Original publisher or manuscript source |

---

## Entity: BookTranslation

A cached translation of a book in a specific target language.

| Field | Type | Description |
|-------|------|-------------|
| `bookId` | string (required) | Reference to Book entity |
| `targetLanguageIso` | string (required) | ISO 639-3 code of target language |
| `targetLanguageName` | string (required) | Human-readable target language |
| `translationMethod` | enum (required) | direct_api, scholarly_bridge, scholarly_direct, community_contributed |
| `translationPath` | array (required) | Full path: `["Sumerian", "English (bridge by Kramer, 1963)", "Japanese"]` |
| `translatedText` | string | Full translated text, cached for serving |
| `pages` | string (JSON) | Page-level JSON: `[{pageNumber, originalText, translatedText}]` for side-by-side |
| `bridgeSourceIso` | string | ISO of bridge language (null if direct) |
| `bridgeScholar` | string | Scholar name if bridge was used |
| `bridgeYear` | string | Year bridge translation was published |
| `attribution` | string | Full attribution shown to reader |
| `translatorName` | string | Human translator name (if applicable) |
| `isCached` | boolean | Whether cached for all readers |
| `formatStatus` | enum | text_only, pdf_generated, dual_column |
| `pdfUrl` | string | URL to generated PDF |
| `requestCount` | number | How many times requested |
| `readerCount` | number | How many readers accessed |

---

## Entity: ScholarlyBridge

Curated scholarly translations of ancient texts — the intermediate layer between ancient sources and modern languages.

| Field | Type | Description |
|-------|------|-------------|
| `bookId` | string (required) | Reference to Book entity |
| `sourceLanguageIso` | string (required) | ISO of ancient source language |
| `sourceLanguageName` | string (required) | Human-readable (e.g., "Sumerian") |
| `bridgeLanguageIso` | string (required) | ISO of bridge language (usually English or French) |
| `bridgeLanguageName` | string | Human-readable bridge language |
| `scholarName` | string (required) | Scholar who created the translation |
| `translationYear` | string (required) | Year published |
| `bridgeText` | string | Full text of scholarly translation |
| `pages` | string (JSON) | Page-level JSON with page numbers |
| `attributionText` | string | Full citation shown to readers |
| `isPublicDomain` | boolean | Whether public domain or fair use |
| `license` | string | License or permission status |

---

## Translation Flow Examples

### Example 1: Ovid's Metamorphoses → Spanish Player
```
Book: { title: "Metamorphoses", languageIso: "la", languageName: "Latin" }
→ Latin is parent of Spanish (same family, direct descendant)
→ BookTranslation: { translationPath: ["Latin", "Spanish"], method: "direct_api" }
→ PDF generated on demand with attribution
```

### Example 2: Enuma Elish → Japanese Player
```
Book: { title: "Enuma Elish", languageIso: "sux", languageName: "Sumerian" }
→ Sumerian is a language isolate — no living descendant
→ ScholarlyBridge: { scholar: "Kramer, S.N.", year: "1963", bridgeLanguage: "English" }
→ BookTranslation: { translationPath: ["Sumerian", "English (bridge by Kramer, 1963)", "Japanese"], method: "scholarly_bridge" }
→ PDF shows: "Translated from Sumerian by S.N. Kramer (1963), then to Japanese"
```

### Example 3: Rig Veda → Hindi Player
```
Book: { title: "Rig Veda", languageIso: "sa-ved", languageName: "Vedic Sanskrit" }
→ Sanskrit is parent of Hindi (Indo-Aryan branch, direct descendant)
→ BookTranslation: { translationPath: ["Vedic Sanskrit", "Hindi"], method: "direct_api" }
→ Nearly as close as Latin → Italian
```

### Example 4: Beowulf → German Player
```
Book: { title: "Beowulf", languageIso: "ang", languageName: "Old English" }
→ Old English and German are both Germanic branch siblings
→ BookTranslation: { translationPath: ["Old English", "German"], method: "direct_api" }
→ Same family, close enough for direct API translation
```

---

## PDF Generation

PDFs are generated **on demand** from cached translations, not pre-stored.

**Options:**
1. **Text-only PDF** — translated text with Geode Inn parchment styling
2. **Dual-column PDF** — original text left, translated text right (scholarly mode)
3. **Attribution page** — always included, showing full translation path

**Library:** `pdf-lib` (Node.js) or `reportlab` (Python) for server-side generation
**Styling:** Parchment background, serif typeface, page numbers matching original, Geode Inn watermark

---

## Caching Strategy

- First request for a translation triggers the full translation pipeline
- Result is cached as a BookTranslation record
- Subsequent requests in the same language fetch the cached version
- Translation path and attribution are stored permanently
- If a better scholarly bridge becomes available, swap the bridge and retranslate — the Book record stays unchanged

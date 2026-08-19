# Geode Inn — Archive Library Plan

## Overview

The Geode Inn will host a curated library of historical texts sourced from public domain and antiquarian books. These will be preserved on archive.org under a Geode Inn collection and linked from within the app/game as downloadable resources.

## Architecture

- **archive.org** = Permanent storage and reader (Internet Archive)
- **Geode Inn app** = Links to archive.org items, organized by Inn location
- **Google Drive** = Working staging area for PDFs before upload

## Library Locations in the Inn

| Inn Location | Subjects | Drive Folder |
|-------------|----------|--------------|
| Upstairs (Cosmology) | Space, astronomy | `books/space/` |
| Staircase (Alchemy/Transitional) | Philosophy, theology, alchemy | `books/philosophy/`, `books/theology/` |
| Main Floor (Library) | Religion, world lit, poetry, language, English, social studies, law | `books/religion/`, `books/world lit/`, `books/poetry/`, `books/language/`, `books/english/`, `books/social studies/`, `books/law/` |
| Downstairs (Catacombs/Ancient Civ) | History, archaeology, paleontology | `books/history/`, `books/archaeology/`, `books/paleontology/` |
| Reference Section | Math, science | `books/math/`, `books/science/` |

## archive.org Upload Metadata Template

Each book uploaded to archive.org needs:

```
Title: [Book title]
Author: [Author if known, "Anonymous" if not]
Date: [Publication year if known]
Subject: [Relevant subject tags — e.g., "History", "Mythology", "Gemstones"]
Description: [1-2 sentence summary of the book's relevance to the Geode Inn]
Collection: [Geode Inn collection on archive.org]
Language: [Language of the text]
License: [Public domain / Creative Commons as applicable]
```

## In-App Integration

### Option Chosen: Link to archive.org

Each book appears as a card in its respective Inn location:
- Title, author, date
- Short description
- Link to archive.org reader
- Downloadable PDF link from archive.org

### Technical Implementation

1. Create a `LibraryBook` entity in Base44 with fields:
   - `title` (string)
   - `author` (string)
   - `publicationDate` (string)
   - `subject` (string — category)
   - `innLocation` (string — where in the Inn it lives)
   - `description` (string)
   - `archiveOrgUrl` (string — link to archive.org item)
   - `pdfDownloadUrl` (string — direct PDF link from archive.org)
   - `coverImage` (string — optional, archive.org provides thumbnails)
   - `language` (string)
   - `tags` (array — searchable tags)

2. Each book card in the app fetches from this entity
3. Cards are filtered by `innLocation` to show in the right section

## Upload Workflow

1. Krista uploads PDFs to the appropriate Google Drive folder
2. Elio reads the PDFs, extracts metadata (title, author, date from the text itself)
3. Krista uploads each PDF to archive.org (or batch uploads)
4. Elio populates the `LibraryBook` entity with the archive.org URLs
5. Books appear in the app automatically

## archive.org Account Setup

- Krista needs to create a free account at archive.org
- Create a collection called "Geode Inn Library" or similar
- Uploads can be done via web interface or archive.org's upload tool
- Each upload gets a permanent identifier (e.g., archive.org/details/geode-inn-[bookname])

## Next Steps

- [ ] Krista creates archive.org account
- [ ] Krista uploads PDFs to Google Drive folders
- [ ] Elio extracts metadata from each PDF
- [ ] Krista uploads to archive.org
- [ ] Elio creates LibraryBook entity in Base44
- [ ] Elio populates book records with archive.org links
- [ ] App displays books in correct Inn locations

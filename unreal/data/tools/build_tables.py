"""Turns the Geode Inn game data into Unreal Engine DataTables.

Reads the repo (never runs anything from it) and writes, under the output folder:
  Tables/<Table>.json                      one DataTable per kind of data (Unreal's JSON import format)
  Source/GeodeInn/Public/Data/GeodeDataRows.h   the row structs the tables import into
  manifest.json                            what went in, from where, and the checks

Usage: python -I build_tables.py <repo> <out>
"""
import json
import re
import sys
from collections import OrderedDict
from pathlib import Path

REPO = Path(sys.argv[1])
OUT = Path(sys.argv[2])

# ------------------------------------------------------------------ helpers

def load(path):
    with open(path, encoding='utf-8') as f:
        return json.load(f)


def pascal(raw):
    """frequency_hz -> FrequencyHz, loreConnection -> LoreConnection, 'Voice / casting' -> VoiceCasting."""
    special = {'id': 'Base44Id', 'name': 'DisplayName', '_id': 'Base44Id'}
    if raw in special:
        return special[raw]
    s = re.sub(r'([a-z0-9])([A-Z])', r'\1 \2', raw)
    parts = [p for p in re.split(r'[^A-Za-z0-9]+', s) if p]
    out = ''.join(p[:1].upper() + p[1:] for p in parts) or 'Field'
    if out[0].isdigit():
        out = 'N' + out
    if out == 'Name':
        out = 'DisplayName'
    return out


def slug(text, limit=60):
    text = re.sub(r"['\u2019]", '', str(text))           # Bastet's -> Bastets
    text = re.sub(r'\s*\(.*$', '', text) or text            # drop a trailing note in brackets
    words = re.findall(r'[A-Za-z0-9]+', text)
    s = ''.join(w[:1].upper() + w[1:] for w in words)[:limit]
    return s or 'Row'


def empty(v):
    return v is None or v == '' or v == [] or v == {}


def clean_md(text):
    """Table cells and headings: drop bold/italic markers and code ticks, keep the words."""
    t = re.sub(r'\*\*(.+?)\*\*', r'\1', text)
    t = re.sub(r'(?<!\w)\*(?!\s)(.+?)(?<!\s)\*(?!\w)', r'\1', t)
    return t.replace('`', '').strip()


class Table:
    def __init__(self, name, source, note=''):
        self.name = name          # e.g. Stones
        self.source = source      # where the rows came from (text)
        self.note = note
        self.rows = OrderedDict()  # row name -> OrderedDict(field -> value)
        self.source_count = 0
        self.checks = []

    def add(self, key, fields):
        base = slug(key)
        rn, i = base, 2
        while rn in self.rows:
            rn = f'{base}_{i}'
            i += 1
        self.rows[rn] = fields
        return rn


TABLES = []

# ------------------------------------------------------------------ Base44 records (live app + Elio's staging app)

B44 = REPO / 'docs' / 'base44_data'
ENTITIES = [
    # (table, entity file, key fields tried in order)
    ('Stones', 'Stone', ['name']),
    ('Materials', 'Material', ['name', 'materialName']),
    ('BuildingRecipes', 'BuildingRecipe', ['name', 'resultName']),
    ('GameItems', 'GameItem', ['name']),
    ('MarketItems', 'MarketItem', ['name']),
    ('ElementCharms', 'ElementCharm', ['elementName']),
    ('QuestCharms', 'QuestCharm', ['questName']),
    ('Dialogue', 'Dialogue', ['dialogueId']),
    ('Lore', 'Lore', ['title']),
    ('Books', 'Book', ['title']),
    ('BookTranslations', 'BookTranslation', ['id']),
    ('ScholarlyBridges', 'ScholarlyBridge', ['id']),
    ('ComicStrips', 'ComicStrip', ['title']),
    ('PodcastEpisodes', 'PodcastEpisode', ['title']),
    ('SteamTitles', 'SteamTitle', ['title']),
    ('EggHatches', 'EggHatch', ['contentName']),
    ('BoardSkins', 'BoardSkin', ['name']),
    ('TrayTemplates', 'TrayTemplate', ['name']),
    ('Artisans', 'Artisan', ['artisanName']),
    ('GrainStories', 'GrainStory', ['id']),
]
# fields that name the same thing in the two apps (the staging name wins)
ALIASES = {'lore_connection': 'loreConnection', 'price_range': 'priceRange', 'process_url': 'processUrl',
           'materialName': 'name', 'resultName': 'name'}


def record_fields(rec):
    """One Base44 record -> OrderedDict of PascalCase fields; two raw keys that land on one field keep both."""
    out = OrderedDict()
    for k, v in rec.items():
        # the live app stores lists as JSON text ('["a","b"]'); read them as the lists they are
        if isinstance(v, str) and v.strip()[:1] in '[{':
            try:
                p = json.loads(v)
                if isinstance(p, (list, dict)):
                    v = p
            except ValueError:
                pass
        k2 = ALIASES.get(k, k)
        f = pascal(k2)
        if f in out and not empty(out[f]) and not empty(v) and out[f] != v:
            out[f + 'Alt'] = v
        elif f not in out or empty(out[f]):
            out[f] = v
    return out


def rec_key(rec, keys):
    for k in keys:
        if not empty(rec.get(k)):
            return str(rec[k]).strip()
    return str(rec.get('id', 'row'))


def norm_key(s):
    return re.sub(r'[^a-z0-9]+', '', s.lower())


for table, entity, keys in ENTITIES:
    srcs = [f'docs/base44_data/{a}/{entity}.json' for a in ('elio', 'live') if (B44 / a / f'{entity}.json').exists()]
    t = Table(table, ' + '.join(srcs))
    staging = load(B44 / 'elio' / f'{entity}.json') if (B44 / 'elio' / f'{entity}.json').exists() else []
    live = load(B44 / 'live' / f'{entity}.json') if (B44 / 'live' / f'{entity}.json').exists() else []
    t.source_count = len(staging) + len(live)
    t.raw = {'staging': staging, 'live': live}
    merged = []   # (key, fields, sources, livediffs)
    index = {}
    for rec in staging:
        k = rec_key(rec, keys)
        merged.append([k, record_fields(rec), ['staging'], OrderedDict()])
        index.setdefault(norm_key(k), []).append(len(merged) - 1)
    matched = 0
    for rec in live:
        k = rec_key(rec, keys)
        f = record_fields(rec)
        cands = [i for i in index.get(norm_key(k), []) if 'live' not in merged[i][2]]
        # ids are per app, so only a name-keyed entity can match across apps
        if cands and keys[0] != 'id':
            i = cands[0]
            row = merged[i]
            row[2].append('live')
            matched += 1
            for fk, fv in f.items():
                if fk not in row[1] or empty(row[1][fk]):
                    row[1][fk] = fv
                elif not empty(fv) and row[1][fk] != fv:
                    row[3][fk] = fv
        else:
            merged.append([k, f, ['live'], OrderedDict()])
    for k, f, src, diffs in merged:
        f['Sources'] = '+'.join(src)
        f['LiveValues'] = json.dumps(diffs, ensure_ascii=False) if diffs else ''
        t.add(k, f)
    t.checks.append(f'{len(staging)} staging + {len(live)} live records; {matched} matched by name and merged; {len(t.rows)} rows')
    TABLES.append(t)

# ------------------------------------------------------------------ zone items

zi = load(REPO / 'zone_items_all_280.json')
t = Table('ZoneItems', f'zone_items_all_280.json ({len(zi)} items, whatever the file name says)')
t.source_count = len(zi)
t.raw = {'file': zi}
for rec in zi:
    t.add(rec_key(rec, ['name']), record_fields(rec))
t.checks.append(f'{len(zi)} records, {len(t.rows)} rows')
TABLES.append(t)

# ------------------------------------------------------------------ Markdown tables in the manual

def md_tables(path, start_pat, end_pat):
    """Yield (heading path, header list, row list) for every table between two headings."""
    lines = Path(path).read_text(encoding='utf-8').splitlines()
    on = False
    heads = []
    i = 0
    while i < len(lines):
        ln = lines[i]
        m = re.match(r'^(#{2,4}) (.*)$', ln)
        if m:
            if re.match(start_pat, ln):
                on = True
            elif on and end_pat and re.match(end_pat, ln):
                break
            level = len(m.group(1))
            heads = [h for h in heads if h[0] < level] + [(level, clean_md(m.group(2)))]
        if on and ln.startswith('|') and i + 1 < len(lines) and re.match(r'^\|\s*:?-{3}', lines[i + 1]):
            header = [clean_md(c) for c in ln.strip().strip('|').split('|')]
            rows = []
            i += 2
            while i < len(lines) and lines[i].startswith('|'):
                cells = [clean_md(c) for c in lines[i].strip().strip('|').split('|')]
                rows.append(cells)
                i += 1
            yield [h[1] for h in heads], header, rows
            continue
        i += 1


def section_text(path, start_pat, end_pat):
    """Yield (heading, markdown) for each ### section in a range."""
    lines = Path(path).read_text(encoding='utf-8').splitlines()
    out, cur, buf, on = [], None, [], False
    for ln in lines:
        if re.match(start_pat, ln):
            on = True
        elif on and end_pat and re.match(end_pat, ln):
            break
        if not on:
            continue
        if ln.startswith('### '):
            if cur:
                out.append((cur, '\n'.join(buf).strip()))
            cur, buf = clean_md(ln[4:]), []
        elif cur:
            buf.append(ln)
    if cur:
        out.append((cur, '\n'.join(buf).strip()))
    return out


MAN = REPO / 'docs' / 'manual'


def table_from_md(name, path, start, end, key_col, source, group_field='Group', note=''):
    t = Table(name, source, note)
    raw = []
    for heads, header, rows in md_tables(path, start, end):
        cols = [pascal(h) for h in header]
        for cells in rows:
            cells = (cells + [''] * len(cols))[:len(cols)]
            f = OrderedDict()
            f[group_field] = heads[-1] if heads else ''
            for c, v in zip(cols, cells):
                f[c if c not in f else c + 'Alt'] = v
            raw.append((heads, header, cells))
            t.add(f.get(pascal(key_col), cells[0]), f)
    t.source_count = len(raw)
    t.raw = {'md': raw}
    t.checks.append(f'{len(raw)} table rows read, {len(t.rows)} rows')
    return t


TABLES.append(table_from_md('Characters', MAN / '03_characters_and_critters.md', r'^### 1\.5 ', r'^### 1\.6 ', 'Name',
                            'docs/manual/03_characters_and_critters.md, 1.5 (current canon, who is ruled)', 'RosterGroup'))
TABLES.append(table_from_md('CharacterRenames', MAN / '03_characters_and_critters.md', r'^### 2\.3 ', r'^### 2\.4 ', 'Now',
                            'docs/manual/03_characters_and_critters.md, 2.3 and 2.3a (rename ledger)', 'LedgerSection'))
TABLES.append(table_from_md('CritterGroups', MAN / '03_characters_and_critters.md', r'^### 7\.5 ', r'^### 7\.6 ', 'Name',
                            'docs/manual/03_characters_and_critters.md, 7.5 (the three named groups)', 'Section',
                            'The rest of 7.5 is prose; it is in the CritterNotes table.'))
TABLES.append(table_from_md('FoundingCast', MAN / '03_characters_and_critters.md', r'^### 9\.2 ', r'^### 9\.8 ', 'Name',
                            'docs/manual/03_characters_and_critters.md, 9.2 to 9.7 (founding cast, July to August)', 'Section'))
TABLES.append(table_from_md('Levels', MAN / '02_world_and_zones.md', r'^### 6\.1 ', r'^### 6\.2 ', 'Level',
                            'docs/manual/02_world_and_zones.md, 6.1 (the nine levels and the half-levels)', 'Section'))
TABLES.append(table_from_md('Rooms', MAN / '02_world_and_zones.md', r'^### 6\.2 ', r'^### 6\.9 ', 'Room',
                            'docs/manual/02_world_and_zones.md, 6.2 to 6.8 (rooms by level)', 'Level'))


def notes_table(name, path, start, end, source):
    t = Table(name, source)
    secs = section_text(path, start, end)
    for head, body in secs:
        t.add(head, OrderedDict([('Heading', head), ('Markdown', body)]))
    t.source_count = len(secs)
    t.raw = {'sections': secs}
    t.checks.append(f'{len(secs)} sections, {len(t.rows)} rows (full text, tables included)')
    return t


TABLES.append(notes_table('ZoneSections', MAN / '02_world_and_zones.md', r'^## 6\. ', r'^## 7\. ',
                          'docs/manual/02_world_and_zones.md, section 6 in full (prose as well as tables)'))
TABLES.append(notes_table('CritterNotes', MAN / '03_characters_and_critters.md', r'^### 7\.5 ', r'^### 7\.6 ',
                          'docs/manual/03_characters_and_critters.md, 7.5 in full'))

# ------------------------------------------------------------------ arcade build sheets

t = Table('ArcadeGames', 'docs/arcade_build_sheets/*.md (one row per build sheet)')
sheets = sorted((REPO / 'docs' / 'arcade_build_sheets').glob('*.md'))
t.source_count = len(sheets)
t.raw = {'files': [s.name for s in sheets]}
for p in sheets:
    text = p.read_text(encoding='utf-8')
    f = OrderedDict()
    f['SheetFile'] = p.name
    m = re.match(r'(tier\d)_', p.name)
    f['Tier'] = m.group(1) if m else ''
    f['Title'] = clean_md(re.search(r'^# (.*)$', text, re.M).group(1)) if re.search(r'^# ', text, re.M) else p.stem
    ident = OrderedDict()
    for heads, header, rows in md_tables(p, r'^## ', None):
        if header and header[0].lower() == 'field':
            for cells in rows:
                if len(cells) >= 2 and cells[0]:
                    ident[pascal(cells[0])] = cells[1]
            break
    f.update(ident)
    tm = re.search(r'^> Template art \(found 2026-11-05\): (.*)$', text, re.M)
    f['TemplateArt'] = clean_md(tm.group(1)) if tm else ''
    f['SheetMarkdown'] = text
    key = ident.get('GeodeInnName') or ident.get('GeodeInnNameOUT') or f['Title'].replace('Build Sheet — ', '')
    t.add(key, f)
t.checks.append(f'{len(sheets)} build sheets, {len(t.rows)} rows; full sheet text kept in SheetMarkdown')
TABLES.append(t)

# ------------------------------------------------------------------ types, defaults, header

def infer(values):
    vals = [v for v in values if v is not None]
    if not vals:
        return 'FString'
    if all(isinstance(v, bool) for v in vals):
        return 'bool'
    if all(isinstance(v, int) and not isinstance(v, bool) for v in vals):
        return 'int32' if all(-2**31 <= v < 2**31 for v in vals) else 'FString'
    if all(isinstance(v, (int, float)) and not isinstance(v, bool) for v in vals):
        return 'float'
    if all(isinstance(v, list) and all(isinstance(x, (str, int, float, dict, list)) and not isinstance(x, bool) for x in v) for v in vals):
        return 'TArray<FString>'   # objects inside a list become one JSON text per entry
    return 'FString'


def coerce(v, typ):
    if typ == 'bool':
        return bool(v) if v is not None else False
    if typ == 'int32':
        return int(v) if v is not None else 0
    if typ == 'float':
        return float(v) if v is not None else 0.0
    if typ == 'TArray<FString>':
        return [json.dumps(x, ensure_ascii=False) if isinstance(x, (dict, list)) else str(x) for x in v] if isinstance(v, list) else []
    if v is None:
        return ''
    if isinstance(v, (dict, list)):
        return json.dumps(v, ensure_ascii=False)
    if isinstance(v, bool):
        return 'true' if v else 'false'
    return str(v)


RESERVED = {'Name', 'Class', 'Struct', 'Enum', 'Object', 'Property', 'Delegate', 'Interface', 'Function', 'Default'}

header_lines = [
    '// Row structs for the Geode Inn DataTables (Content/Data/Tables/*.json).',
    '// Generated from the game data by unreal-tools/build_tables.py; regenerate rather than edit by hand.',
    '#pragma once',
    '',
    '#include "CoreMinimal.h"',
    '#include "Engine/DataTable.h"',
    '#include "GeodeDataRows.generated.h"',
    '',
]
manifest = OrderedDict()
(OUT / 'Tables').mkdir(parents=True, exist_ok=True)

for t in TABLES:
    fields = OrderedDict()
    for row in t.rows.values():
        for k in row:
            fields.setdefault(k if k not in RESERVED else k + 'Value', None)
    # rename reserved keys in the rows
    for rn, row in list(t.rows.items()):
        t.rows[rn] = OrderedDict(((k if k not in RESERVED else k + 'Value'), v) for k, v in row.items())
    types = OrderedDict((f, infer([r.get(f) for r in t.rows.values()])) for f in fields)
    out_rows = []
    for rn, row in t.rows.items():
        o = OrderedDict([('Name', rn)])
        for f, typ in types.items():
            o[f] = coerce(row.get(f), typ)
        out_rows.append(o)
    (OUT / 'Tables' / f'{t.name}.json').write_text(json.dumps(out_rows, ensure_ascii=False, indent=1), encoding='utf-8')
    struct = f'FGeode{t.name}Row'
    header_lines += [f'// {t.name}: {t.source}', 'USTRUCT(BlueprintType)', f'struct {struct} : public FTableRowBase', '{',
                     '\tGENERATED_BODY()', '']
    for f, typ in types.items():
        header_lines.append(f'\tUPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Geode")')
        default = {'bool': ' = false', 'int32': ' = 0', 'float': ' = 0.f'}.get(typ, '')
        header_lines.append(f'\t{typ} {f}{default};')
        header_lines.append('')
    header_lines += ['};', '']
    t.types = types
    t.out_rows = out_rows
    manifest[t.name] = OrderedDict([('struct', struct), ('rows', len(out_rows)), ('sourceRecords', t.source_count),
                                    ('fields', len(types)), ('source', t.source), ('checks', t.checks)])

hdr = OUT / 'Source' / 'GeodeInn' / 'Public' / 'Data' / 'GeodeDataRows.h'
hdr.parent.mkdir(parents=True, exist_ok=True)
hdr.write_text('\n'.join(header_lines), encoding='utf-8')

# ------------------------------------------------------------------ checks: nothing lost, every row well formed

problems = []


def as_strings(v):
    """Every leaf value of a source value, as text, so it can be found again in the output."""
    if v is None or v == '':
        return []
    if isinstance(v, bool):
        return ['true' if v else 'false']
    if isinstance(v, (int, float)):
        return [str(v), str(float(v)), str(int(v)) if float(v).is_integer() else str(v)]
    if isinstance(v, str):
        if v.strip()[:1] in '[{':
            try:
                p = json.loads(v)
                if isinstance(p, (list, dict)):
                    return as_strings(p)
            except ValueError:
                pass
        return [v]
    if isinstance(v, list):
        return [x for e in v for x in as_strings(e)]
    if isinstance(v, dict):
        return [x for e in v.values() for x in as_strings(e)]
    return [str(v)]


for t in TABLES:
    # LiveValues holds the live app's differing values as JSON text; search them decoded too
    decoded = []
    for r in t.out_rows:
        for v in r.values():
            for s in (v if isinstance(v, list) else [v]):
                if isinstance(s, str) and s[:1] in '[{':
                    try:
                        decoded.append(json.loads(s))
                    except ValueError:
                        pass
    blob = json.dumps(t.out_rows, ensure_ascii=False) + json.dumps(decoded, ensure_ascii=False)
    lost = 0
    if hasattr(t, 'raw') and ('staging' in t.raw or 'file' in t.raw):
        recs = t.raw.get('staging', []) + t.raw.get('live', []) + t.raw.get('file', [])
        for rec in recs:
            for k, v in rec.items():
                for s in as_strings(v):
                    enc = json.dumps(s, ensure_ascii=False)[1:-1]
                    if enc not in blob and not any(alt in blob for alt in as_strings(v)[1:]):
                        lost += 1
                        if len(problems) < 30:
                            problems.append(f'{t.name}: value of {k} not found in output: {s[:80]!r}')
                        break
    elif 'md' in t.raw:
        for heads, header, cells in t.raw['md']:
            for c in cells:
                if c and json.dumps(c, ensure_ascii=False)[1:-1] not in blob:
                    lost += 1
    names = [r['Name'] for r in t.out_rows]
    if len(set(names)) != len(names):
        problems.append(f'{t.name}: duplicate row names')
    bad = [n for n in names if not re.fullmatch(r'[A-Za-z0-9_]+', n)]
    if bad:
        problems.append(f'{t.name}: odd row names {bad[:3]}')
    for r in t.out_rows:
        if set(r) != {'Name', *t.types}:
            problems.append(f'{t.name}: row {r["Name"]} fields differ from the struct')
            break
    manifest[t.name]['valuesNotFound'] = lost
    manifest[t.name]['checks'].append('every source value found in the output' if lost == 0 else f'{lost} source values NOT found')

summary = OrderedDict([('tables', len(TABLES)), ('rows', sum(m['rows'] for m in manifest.values())),
                       ('sourceRecords', sum(m['sourceRecords'] for m in manifest.values())), ('problems', problems)])
(OUT / 'manifest.json').write_text(json.dumps(OrderedDict([('summary', summary), ('tables', manifest)]), ensure_ascii=False, indent=1),
                                   encoding='utf-8')
for name, m in manifest.items():
    print(f"{name:18} {m['rows']:5} rows  {m['fields']:3} fields  src {m['sourceRecords']:5}  lost {m['valuesNotFound']}")
print('tables', summary['tables'], 'rows', summary['rows'], 'problems', len(problems))
for p in problems:
    print('  ', p)

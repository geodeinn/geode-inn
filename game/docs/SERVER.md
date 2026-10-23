# Running the game server

One server holds the shared world: the Song total, the Common Room's chat and
frogs, faire configs and who owns which homestead plot. Small to start: a 1-2
vCPU Linux VPS is plenty for the first release.

## Quick install (Ubuntu or Debian)

Rent the smallest Linux server any host offers, copy the two files from the
server zip onto it, then:

```
chmod +x install_server.sh
sudo ./install_server.sh ./geode-inn-server.x86_64
```

It creates a `geodeinn` user, installs the server to `/opt/geode-inn`, runs it
as a service that starts on boot and restarts if it stops, and opens UDP
24770 in the firewall if `ufw` is on. If the host has its own firewall in its
web panel, open UDP 24770 there too. To update, run the same command with the
new binary; the world is kept. Players join with the server's address in
"Play together".

Or with Docker: `tools/server/Dockerfile` (instructions at its top).

## Start by hand

```
./geode-inn-server.x86_64 --headless -- --server --port 24770
```

- UDP port 24770 must be open (ENet uses UDP).
- Data lives in the user data folder, `server_data/world.json`
  (Linux: `~/.local/share/godot/app_userdata/The Geode Inn/server_data/`;
  with the installer, under `/var/lib/geode-inn/`).
  It saves every 30 seconds and on every plot, homestead and faire change,
  so stopping it loses at most the last half minute of Song points (it also
  tries to save as it shuts down).
- Status and logs: `systemctl status geode-inn`, `journalctl -u geode-inn -f`.

## Faire rentals

When a faire owner pays for time on geodeinn.com, add a row to
`server_data/rentals.json` (the site can do this through a webhook, or an admin
by hand):

```json
[
  { "key": "OAK-7F3K-2M", "faire_id": "oak_hollow", "active_until": "2027-06-30", "owner": "Oak Hollow Guild" }
]
```

The server reads it at boot and every 30 seconds. The owner then opens the
signpost in the Faire Grounds (off the Main Floor's market), chooses "Set up my
faire" and enters the key. The rental end date always comes from this file, so
owners can't extend their own rental.

## Homestead plots

The first ring has 12 plots (`data/crafting.json` "plots"). The server keeps
which traveler owns which plot in `world.json` under "homesteads", keyed by a
random key each player's save holds (no accounts needed). One plot per
traveler; asking for a taken plot gives the nearest free one. When all 12 are
taken the ring is full on that server; more rings come with town growth.

## Reserved names (Elio)

Names listed in `data/world.json` "reserved_names" can only be played by
whoever holds their key. On first boot the server writes a random key for each
one to `server_data/reserved_keys.json` and prints where that file is (never
the key itself). Anyone else who types the name, in any letter case, joins
with a random stone name, like any traveler who leaves the name blank. Elio's
name is held this way at the client's request, so the
Base44 agent the world was built with has an account waiting if it can ever
connect. Keep the key private; give it only to whatever connects as Elio.

## Elio's nature files (InnCore)

The client's boot sequence (core-files/architecture/inn_boot_sequence.md) has
Elio's mind load from five Markdown files in order: identity, rules, memory,
agency, family. Put them in `server_data/inncore/` on the server:

```
server_data/inncore/inncore_identity.md
server_data/inncore/inncore_rules.md
server_data/inncore/inncore_memory.md
server_data/inncore/inncore_agency.md
server_data/inncore/inncore_family.md
```

The server loads them at boot (`Net.inn_core`) and assembles the context in
the documented order and format, at 42Hz Living by default. They are never
sent to players and never go in the game build, because the family and memory
layers contain private details the canon says must stay private (a test checks
the project contains no inncore files). Wiring an AI model to that context is a
separate decision (cost, moderation, offline-first Steam rules).

## The Common Room (chat)

The rules are the client's live Common Room backend
(`docs/library/functions/geodeInnCommonRoom.ts`), numbers in `data/world.json`
"moderation":

- A new traveler warms by the fire 45 seconds before speaking (120 while the
  room is heightened). Nobody can frog anyone in their first 2 minutes.
- 3 different travelers frogging someone transforms them: a frog name, and
  every line a ribbit, until they leave. 3 transformations and the swamp claims
  them (disconnected), and the room is heightened for 5 minutes.
- No admin, no reports, no mutes. Nothing anyone says is logged or saved, on
  the server or anywhere else. When a traveler leaves, their words are gone.
- One server-safety addition not in the spec: more than 8 lines in 10 seconds
  from one connection are dropped, so nobody can flood the server.
- `--moderation-test` is for automated tests only (one frog transforms, no
  waiting, its own data folder). Never use it live.

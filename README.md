# query — Makefile-like runner for saved DB queries

Stop pasting `sqlite3 data/research.db "SELECT ..."` into your README.
Save the query once, run it by name:

```bash
query rows-per-table
```

## Install

One line:

```bash
curl -fsSL https://farishan.github.io/query/install.sh | bash
```

This installs the `query` runner to `~/.local/bin/query` and scaffolds
`queries/` + `Queryfile` in the current directory.

Manual: copy `query` to a dir on your `PATH` and run `query init`.

## Quick start

```bash
query init                     # scaffold queries/ + Queryfile
# add a query:
echo 'SELECT table_name, rows FROM row_counts;' > queries/rows-per-table.sql
query rows-per-table           # run it
query list                    # list saved queries
query show rows-per-table      # print the SQL
```

## Queryfile

Optional config at the project root:

```ini
DB=data/research.db
ENGINE=usql        # usql (default if installed) or sqlite3
OUTPUT=default     # default | box | json | csv | markdown

# Inline queries are also supported:
[rows-per-table]
SELECT table_name, rows FROM row_counts;
```

Queries can live either as files in `queries/*.sql` or as `[name]` sections in
`Queryfile`. File-based queries take precedence.

## Requirements

- `sqlite3` (always; fallback engine) — preinstalled on most systems.
- `usql` (optional, nicer output) — https://github.com/xo/usql

## Why

READMEs full of raw SQL are unreadable and un-runnable-by-name. `query` gives
your database queries the same named-target DX as `make`/`just`, with sensible
defaults and pretty output.

## License

GPL-3.0-or-later (GNU General Public License v3 or later)
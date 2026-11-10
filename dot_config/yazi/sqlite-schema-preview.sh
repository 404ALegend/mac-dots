#!/bin/sh
set -eu

python3 - "$1" <<'PY'
import sqlite3
import sys
from pathlib import Path
from urllib.parse import quote

path = Path(sys.argv[1]).resolve()
uri = f"file:{quote(str(path))}?mode=ro"

try:
    connection = sqlite3.connect(uri, uri=True)
except sqlite3.Error as error:
    print(f"Cannot open SQLite database: {error}")
    raise SystemExit(1)

try:
    tables = connection.execute(
        "SELECT name, sql FROM sqlite_schema "
        "WHERE type = 'table' AND name NOT LIKE 'sqlite_%' "
        "ORDER BY name"
    ).fetchall()

    if not tables:
        print("No user tables")
        raise SystemExit(0)

    for name, definition in tables:
        identifier = '"' + name.replace('"', '""') + '"'
        row_count = connection.execute(
            f"SELECT COUNT(*) FROM {identifier}"
        ).fetchone()[0]
        columns = connection.execute(
            f"PRAGMA table_xinfo({identifier})"
        ).fetchall()
        indexes = connection.execute(
            f"PRAGMA index_list({identifier})"
        ).fetchall()

        print(f"{name} ({row_count} rows)")
        print(definition or "No SQL definition")
        print("Columns:")
        for column in columns:
            print(f"  {column[1]} {column[2] or ''}".rstrip())
        print("Indexes:")
        if indexes:
            for index in indexes:
                print(f"  {index[1]}")
        else:
            print("  None")
        print()
finally:
    connection.close()
PY

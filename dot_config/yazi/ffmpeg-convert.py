#!/usr/bin/env python3
import shlex
import subprocess
import sys
from pathlib import Path

source = Path(sys.argv[1]).resolve()
arguments = input("FFmpeg arguments, ending with the output file name: ")

try:
    parsed = shlex.split(arguments)
except ValueError as error:
    print(f"Invalid arguments: {error}", file=sys.stderr)
    raise SystemExit(2)

if not parsed or parsed[-1].startswith("-"):
    print("Specify an output file name as the last argument.", file=sys.stderr)
    raise SystemExit(2)

output = Path(parsed[-1])
if not output.is_absolute():
    output = source.parent / output

subprocess.run(["ffmpeg", "-i", str(source), *parsed[:-1], str(output)], check=True)

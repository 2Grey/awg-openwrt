#!/usr/bin/env python3
"""Validate the exact package set in an OpenWrt JSON feed index."""

import json
import sys
from pathlib import Path


def fail(message: str) -> None:
    raise SystemExit(message)


def main() -> None:
    if len(sys.argv) < 3:
        fail(f"Usage: {sys.argv[0]} INDEX_JSON PACKAGE [PACKAGE ...]")

    index_path = Path(sys.argv[1])
    expected = set(sys.argv[2:])

    with index_path.open(encoding="utf-8") as index_file:
        index = json.load(index_file)

    packages = index.get("packages")
    if not isinstance(packages, dict):
        fail(f"Invalid packages metadata in {index_path}")

    actual = set(packages)
    if actual == expected:
        return

    details = []
    missing = sorted(expected - actual)
    unexpected = sorted(actual - expected)
    if missing:
        details.append(f"missing: {', '.join(missing)}")
    if unexpected:
        details.append(f"unexpected: {', '.join(unexpected)}")
    fail(f"Unexpected package set in {index_path} ({'; '.join(details)})")


if __name__ == "__main__":
    main()

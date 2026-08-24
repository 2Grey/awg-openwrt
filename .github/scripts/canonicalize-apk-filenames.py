#!/usr/bin/env python3
"""Rename release APK assets to the filenames expected by apk repositories."""

import json
import sys
from pathlib import Path


def fail(message: str) -> None:
    raise SystemExit(message)


def main() -> None:
    if len(sys.argv) != 3:
        fail(f"Usage: {sys.argv[0]} INDEX_JSON FEED_DIR")

    index_path = Path(sys.argv[1])
    feed_dir = Path(sys.argv[2])
    with index_path.open(encoding="utf-8") as index_file:
        index = json.load(index_file)

    packages = index.get("packages")
    if not isinstance(packages, dict) or not packages:
        fail(f"No packages found in {index_path}")

    apk_files = set(feed_dir.glob("*.apk"))
    used_files: set[Path] = set()

    for name, version in sorted(packages.items()):
        if not isinstance(name, str) or not isinstance(version, str):
            fail(f"Invalid package metadata in {index_path}: {name!r} {version!r}")
        if any(char in name or char in version for char in ("/", "\\", "\0")):
            fail(f"Unsafe package metadata in {index_path}: {name!r} {version!r}")

        canonical = feed_dir / f"{name}-{version}.apk"
        release_assets = sorted(
            path for path in apk_files if path.name.startswith(f"{name}_")
        )
        candidates = ([canonical] if canonical in apk_files else []) + release_assets

        if len(candidates) != 1:
            names = ", ".join(path.name for path in candidates) or "none"
            fail(
                f"Expected one APK for {name} {version} in {feed_dir}, "
                f"found: {names}"
            )

        source = candidates[0]
        if source != canonical:
            source.rename(canonical)
            apk_files.remove(source)
            apk_files.add(canonical)
            print(f"Renamed {source.name} -> {canonical.name}")
        used_files.add(canonical)

    unexpected = sorted(path.name for path in apk_files - used_files)
    if unexpected:
        fail(f"Unexpected APK files in {feed_dir}: {', '.join(unexpected)}")


if __name__ == "__main__":
    main()

"""Manual filesystem cleanup. Does not inspect or update any database."""

import argparse
import os
from pathlib import Path
from uuid import UUID


def candidates(root, video_ids, all_media):
    videos = root / "videos"
    if videos.is_symlink():
        raise ValueError("Refusing symlink videos directory")
    if not videos.exists():
        return []
    if video_ids:
        return [videos / str(value) for value in video_ids]
    result = []
    for path in sorted(videos.iterdir()):
        try:
            canonical = str(UUID(path.name)) == path.name
        except ValueError:
            canonical = False
        if canonical or (all_media and path.suffix.lower() in (".mp4", ".webp")):
            result.append(path)
    return result


def files_to_remove(path):
    if path.is_symlink():
        raise ValueError(f"Refusing symlink: {path}")
    if not path.exists():
        return []
    if path.is_file() and path.suffix.lower() in (".mp4", ".webp"):
        return [path]
    if not path.is_dir():
        raise ValueError(f"Unexpected entry: {path}")
    children = list(path.iterdir())
    if any(p.name not in ("video.mp4", "thumbnail.webp") or p.is_symlink()
           or not p.is_file() for p in children):
        raise ValueError(f"Unexpected contents; nothing removed: {path}")
    return children


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    selection = parser.add_mutually_exclusive_group(required=True)
    selection.add_argument("--all", action="store_true")
    selection.add_argument("--video-id", type=UUID, action="append")
    parser.add_argument("--confirm", action="store_true", help="Actually delete; stop uploads first")
    args = parser.parse_args()
    root = Path(os.environ.get("MEDIA_STORAGE_ROOT", "/mnt/data/video-platform"))
    try:
        paths = candidates(root, args.video_id, args.all)
        # Validate every candidate before deleting any file.
        planned = [(path, files_to_remove(path)) for path in paths]
    except ValueError as error:
        parser.exit(1, f"{error}\n")
    print("DELETE" if args.confirm else "DRY RUN — no changes")
    for path, files in planned:
        print(f"{path}: {len(files)} file(s)")
        if args.confirm:
            for file in files:
                file.unlink()
            if path.is_dir():
                path.rmdir()
    print("Databases are unchanged. Review references in ALL environments before deletion.")


if __name__ == "__main__":
    main()

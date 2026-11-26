"""Prepare JSON/MP4/WEBP triplets once and generate insert-only H2/PostgreSQL seed SQL."""

import argparse
from datetime import datetime, timezone
import json
import math
import os
from pathlib import Path
import shutil
import tempfile
from urllib.parse import urlsplit
from uuid import UUID, uuid5

NAMESPACE = UUID("dd90e527-1aa4-46ac-9718-1ba0c470af55")
REPOSITORY = Path(__file__).resolve().parents[2]
CATEGORIES = {
    "music": "MUSIC", "sports": "SPORTS", "gaming": "GAMING", "news": "NEWS",
    "education": "EDUCATION", "entertainment": "ENTERTAINMENT", "technology": "TECHNOLOGY",
    "travel": "TRAVEL", "food": "FOOD", "fashion": "FASHION", "comedy": "COMEDY",
    "film & animation": "FILM_AND_ANIMATION", "howto & style": "HOWTO_AND_STYLE",
    "people & blogs": "PEOPLE_AND_BLOGS", "science & technology": "SCIENCE_AND_TECHNOLOGY",
    "other": "OTHER",
}


def uid(*parts):
    return str(uuid5(NAMESPACE, json.dumps(parts, ensure_ascii=False, separators=(",", ":"))))


def text(value, field, limit=None, required=True):
    if not isinstance(value, str) or "\0" in value or (required and not value.strip()):
        raise ValueError(f"{field}: expected text{' (not blank)' if required else ''}, without NUL")
    if limit is not None and len(value) > limit:
        raise ValueError(f"{field}: exceeds {limit} characters")
    return value


def counter(value, field, maximum=2**63 - 1):
    if type(value) is not int or not 0 <= value <= maximum:
        raise ValueError(f"{field}: expected an integer between 0 and {maximum}")
    return value


def timestamp(value, field):
    if type(value) not in (int, float) or (isinstance(value, float) and not math.isfinite(value)):
        raise ValueError(f"{field}: expected Unix timestamp in seconds")
    try:
        return datetime.fromtimestamp(value, timezone.utc).isoformat(timespec="microseconds")
    except (ValueError, OverflowError, OSError):
        raise ValueError(f"{field}: timestamp out of range") from None


def read_dataset(source, dataset):
    text(dataset, "dataset")
    if not source.is_dir():
        raise ValueError("Source must be an existing directory")
    files = {extension: {p.stem: p for p in source.iterdir() if p.suffix == extension and p.is_file()}
             for extension in (".json", ".mp4", ".webp")}
    if not files[".json"]:
        raise ValueError("No JSON/MP4/WEBP triplets found")
    if not (files[".json"].keys() == files[".mp4"].keys() == files[".webp"].keys()):
        raise ValueError("JSON, MP4 and WEBP filenames must have exactly the same stems")
    videos = []
    for stem, path in sorted(files[".json"].items()):
        for extension, limit in ((".mp4", 100 * 1024 * 1024), (".webp", 5 * 1024 * 1024)):
            media = files[extension][stem]
            if media.is_symlink() or not 0 < media.stat().st_size <= limit:
                raise ValueError(f"{media.name}: expected a nonempty regular file within the size limit")
        try:
            data = json.loads(path.read_text(encoding="utf-8-sig"))
        except (ValueError, UnicodeError):
            raise ValueError(f"{path.name}: invalid UTF-8 JSON") from None
        if not isinstance(data, dict) or not isinstance(data.get("meta"), dict):
            raise ValueError(f"{path.name}: expected an object with meta")
        meta = data["meta"]
        duration = data.get("duration")
        if (type(duration) not in (int, float) or not 0 < duration <= 2**31 - 1
                or not math.isfinite(duration)
                or not 1 <= math.floor(duration + 0.5) <= 2**31 - 1):
            raise ValueError(f"{path.name}: invalid duration")
        channel = text(meta.get("channel"), "channel", 255)
        video_id = uid(dataset, "video", stem)
        categories = meta.get("categories", [])
        comments = meta.get("comments", [])
        if not isinstance(categories, list) or not isinstance(comments, list):
            raise ValueError(f"{path.name}: categories and comments must be arrays")
        mapped_categories = []
        for category in categories:
            mapped = CATEGORIES.get(text(category, "category").strip().lower(), "OTHER")
            if mapped not in mapped_categories:
                mapped_categories.append(mapped)
        imported_comments = []
        for index, comment in enumerate(comments):
            if not isinstance(comment, dict):
                raise ValueError(f"{path.name}: comment must be an object")
            imported_comments.append({
                "id": uid(video_id, "comment", index),
                "author": text(comment.get("author"), "comment.author", 255),
                "content": text(comment.get("text"), "comment.text"),
                "date": timestamp(comment.get("timestamp"), "comment.timestamp"),
                "likes": counter(comment.get("like_count", 0), "comment.like_count"),
            })
        videos.append({
            "id": video_id, "channel_id": uid("channel", channel), "channel": channel,
            "title": text(data.get("title"), "title", 255),
            "description": text(meta.get("description", ""), "description", required=False),
            "duration": math.floor(duration + 0.5),
            "date": timestamp(data.get("timestamp"), "timestamp"),
            "views": counter(meta.get("view_count", 0), "view_count"),
            "likes": counter(meta.get("like_count", 0), "like_count", 2**31 - 1),
            "categories": mapped_categories, "comments": imported_comments,
            "video": files[".mp4"][stem], "thumbnail": files[".webp"][stem],
        })
    return videos


def quote(value):
    return "'" + value.replace("'", "''") + "'"


def sql_uuid(value):
    return f"CAST({quote(value)} AS UUID)"


def sql_date(value):
    return f"CAST({quote(value)} AS TIMESTAMP WITH TIME ZONE)"


def insert(table, columns, values, exists, extra=""):
    return (f"INSERT INTO {table} ({columns})\nSELECT {', '.join(values)}\n"
            f"WHERE NOT EXISTS (SELECT 1 FROM {table} WHERE {exists}){extra};\n")


def render_sql(videos):
    statements = ["-- Generated seed: insert missing rows only; run serially after schema creation.\n"]
    channels = set()
    for video in videos:
        video_id = sql_uuid(video["id"])
        channel_id = sql_uuid(video["channel_id"])
        date = sql_date(video["date"])
        if video["channel_id"] not in channels:
            statements.append(insert("users",
                "id, google_subject, email, name, created_at, updated_at, dark_mode",
                [channel_id, quote("seed-channel:" + video["channel_id"]),
                 quote(video["channel_id"] + "@catalog.invalid"), quote(video["channel"]), date, date, "FALSE"],
                f"id = {channel_id}"))
            channels.add(video["channel_id"])
        statements.append(insert("video",
            "id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status",
            [video_id, quote(video["title"]), quote(video["description"]), str(video["duration"]),
             quote(f"/media/{video['id']}/thumbnail.webp"), quote(f"/media/{video['id']}/video.mp4"),
             channel_id, str(video["views"]), str(video["likes"]), date, "'ACTIVE'"], f"id = {video_id}"))
        active = f" AND EXISTS (SELECT 1 FROM video WHERE id = {video_id} AND status = 'ACTIVE')"
        for category in video["categories"]:
            statements.append(insert("video_categories", "video_id, category", [video_id, quote(category)],
                f"video_id = {video_id} AND category = {quote(category)}", active))
        for comment in video["comments"]:
            comment_id = sql_uuid(comment["id"])
            statements.append(insert("comment",
                "id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count",
                [comment_id, video_id, "NULL", quote(comment["author"]), quote(comment["content"]),
                 "NULL", sql_date(comment["date"]), str(comment["likes"])], f"id = {comment_id}", active))
    return "\n".join(statements)


def publish_local(video, directory):
    destination = directory / video["id"]
    if directory.is_symlink() or destination.is_symlink():
        raise ValueError("Refusing symlink storage directory")
    if destination.exists():
        if all((destination / name).is_file() and not (destination / name).is_symlink()
               for name in ("video.mp4", "thumbnail.webp")):
            return False
        raise ValueError(f"Incomplete local pair: {video['id']}; nothing overwritten")
    directory.mkdir(parents=True, exist_ok=True)
    staging = Path(tempfile.mkdtemp(prefix=".upload-", dir=directory))
    try:
        shutil.copyfile(video["video"], staging / "video.mp4")
        shutil.copyfile(video["thumbnail"], staging / "thumbnail.webp")
        staging.rename(destination)
    finally:
        if staging.exists():
            shutil.rmtree(staging)
    return True


def oci_request(session, method, url, **kwargs):
    import requests
    try:
        return session.request(method, url, timeout=(10, 600), allow_redirects=False, **kwargs)
    except requests.RequestException:
        # Do not print request headers, secrets or remote response bodies.
        raise ValueError("OCI request failed (connection, TLS or timeout)") from None


def validate_response(response, video_id, base_url):
    expected = {"id": video_id, "videoUrl": f"{base_url}/media/{video_id}/video.mp4",
                "thumbnailUrl": f"{base_url}/media/{video_id}/thumbnail.webp"}
    try:
        valid = response.json() == expected
    except ValueError:
        valid = False
    if not valid:
        raise ValueError(f"Unexpected OCI response for {video_id}")


def publish_oci(video, session, base_url):
    url = f"{base_url}/api/videos/{video['id']}"
    response = oci_request(session, "GET", url)
    if response.status_code == 200:
        validate_response(response, video["id"], base_url)
        return False
    if response.status_code != 404:
        raise ValueError(f"OCI existence check: HTTP {response.status_code} for {video['id']}")
    with video["video"].open("rb") as mp4, video["thumbnail"].open("rb") as webp:
        response = oci_request(session, "POST", url, files={
            "file": ("video.mp4", mp4, "video/mp4"),
            "thumbnail": ("thumbnail.webp", webp, "image/webp"),
        })
    if response.status_code == 201:
        validate_response(response, video["id"], base_url)
        return True
    if response.status_code == 409:
        # Another publisher may have completed the same UUID meanwhile.
        response = oci_request(session, "GET", url)
        if response.status_code == 200:
            validate_response(response, video["id"], base_url)
            return False
    raise ValueError(f"OCI upload failed for {video['id']}: HTTP {response.status_code}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, required=True)
    parser.add_argument("--dataset", required=True, help="Stable dataset version; keep it to preserve UUIDs")
    parser.add_argument("--mode", choices=("local", "oci", "both"), default="local")
    parser.add_argument("--local-dir", type=Path, default=Path("media-store"))
    parser.add_argument("--base-url", default=os.environ.get("ENV_PROTUBE_MEDIA_BASE_URL",
                        "https://marramiau-protube.duckdns.org"))
    parser.add_argument("--output", type=Path, default=REPOSITORY / "backend/src/main/resources/db/seed")
    args = parser.parse_args()
    session = None
    try:
        videos = read_dataset(args.source, args.dataset)
        sql = render_sql(videos)
        base_url = args.base_url.rstrip("/")
        if args.mode in ("oci", "both"):
            origin = urlsplit(base_url)
            key = os.environ.get("ENV_PROTUBE_MEDIA_API_KEY", "")
            if (origin.scheme != "https" or not origin.hostname or origin.username or origin.password
                    or origin.path or origin.query or origin.fragment):
                raise ValueError("OCI base URL must be an HTTPS origin without path or credentials")
            if len(key) < 32 or not key.isascii() or any(c.isspace() for c in key):
                raise ValueError("Configure ENV_PROTUBE_MEDIA_API_KEY (at least 32 ASCII characters, no whitespace)")
            try:
                import requests
            except ImportError:
                raise ValueError("OCI mode requires: pip install -r tooling/media/requirements.txt") from None
            session = requests.Session()
            session.headers["X-API-Key"] = key
        for video in videos:
            if args.mode in ("local", "both"):
                created = publish_local(video, args.local_dir)
                print(f"LOCAL {video['id']}: {'copied' if created else 'already exists'}")
            if session is not None:
                created = publish_oci(video, session, base_url)
                print(f"OCI {video['id']}: {'uploaded' if created else 'already exists'}")
        # Do not replace seed SQL until all requested publications succeed.
        args.output.mkdir(parents=True, exist_ok=True)
        for name in ("data-h2.sql", "data-postgresql.sql"):
            (args.output / name).write_text(sql, encoding="utf-8", newline="\n")
        print(f"Prepared {len(videos)} video(s). SQL written to {args.output}")
    except (ValueError, OSError) as error:
        parser.exit(1, f"Error: {error}\n")
    finally:
        if session is not None:
            session.close()


if __name__ == "__main__":
    main()

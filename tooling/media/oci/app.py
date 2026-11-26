"""Media-only API for the existing OCI Linux VM; Nginx serves published files."""

from contextlib import asynccontextmanager, contextmanager
import fcntl
import hmac
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
from uuid import UUID
from urllib.parse import urlsplit

from fastapi import Depends, FastAPI, Header, HTTPException, UploadFile
from PIL import Image, UnidentifiedImageError

VIDEO_LIMIT = 100 * 1024 * 1024
THUMBNAIL_LIMIT = 5 * 1024 * 1024
Image.MAX_IMAGE_PIXELS = 20_000_000


@asynccontextmanager
async def lifespan(app):
    key = os.environ.get("MEDIA_API_KEY", "")
    base_url = os.environ.get("MEDIA_BASE_URL", "").rstrip("/")
    if len(key) < 32:
        raise RuntimeError("MEDIA_API_KEY must contain at least 32 characters")
    url = urlsplit(base_url)
    if (url.scheme != "https" or not url.hostname or url.username or url.password
            or url.path or url.query or url.fragment):
        raise RuntimeError("MEDIA_BASE_URL must be an HTTPS origin without path or credentials")
    if not shutil.which("ffprobe"):
        raise RuntimeError("ffprobe must be installed and available in PATH")
    root = Path(os.environ.get("MEDIA_STORAGE_ROOT", "/mnt/data/video-platform"))
    for name in ("videos", "tmp", "locks"):
        directory = root / name
        if directory.is_symlink():
            raise RuntimeError(f"Refusing symlink storage directory: {directory}")
        directory.mkdir(parents=True, exist_ok=True)
    if (root / "tmp").stat().st_dev != (root / "videos").stat().st_dev:
        raise RuntimeError("tmp and videos must share a filesystem")
    app.state.root = root
    app.state.api_key = key
    app.state.base_url = base_url
    yield


app = FastAPI(lifespan=lifespan, docs_url=None, redoc_url=None, openapi_url=None)


def authenticate(x_api_key: str = Header(default="")):
    if not hmac.compare_digest(x_api_key.encode(), app.state.api_key.encode()):
        raise HTTPException(401, "Invalid API key")


@contextmanager
def video_lock(video_id):
    # flock works across uvicorn workers and releases the lock after a crash.
    # Keep lock files: unlinking them would allow two different inodes/locks.
    with (app.state.root / "locks" / f"{video_id}.lock").open("a") as lock:
        fcntl.flock(lock, fcntl.LOCK_EX)
        try:
            yield
        finally:
            fcntl.flock(lock, fcntl.LOCK_UN)


def video_directory(video_id):
    directory = app.state.root / "videos" / str(video_id)
    if directory.is_symlink() or (directory.exists() and not directory.is_dir()):
        raise HTTPException(409, "Unsafe media directory")
    return directory


def response(video_id):
    base = f"{app.state.base_url}/media/{video_id}"
    return {"id": str(video_id), "videoUrl": f"{base}/video.mp4",
            "thumbnailUrl": f"{base}/thumbnail.webp"}


def copy_upload(upload, destination, expected_type, limit):
    if upload.content_type != expected_type:
        raise HTTPException(415, f"Expected {expected_type}")
    size = 0
    with destination.open("xb") as target:
        while chunk := upload.file.read(1024 * 1024):
            size += len(chunk)
            if size > limit:
                raise HTTPException(413, "File size limit exceeded")
            target.write(chunk)
    if not size:
        raise HTTPException(400, "Empty file")


def validate_media(directory):
    try:
        with (directory / "video.mp4").open("rb") as video:
            header = video.read(12)
        if len(header) < 12 or header[4:8] != b"ftyp" or header[8:12] == b"qt  ":
            raise ValueError("Not an MP4 container")
        probe = subprocess.run(
            ["ffprobe", "-v", "error", "-show_entries",
             "format=format_name:stream=codec_type", "-of", "json",
             str(directory / "video.mp4")],
            capture_output=True, text=True, timeout=20, check=True,
        )
        info = json.loads(probe.stdout)
        formats = info.get("format", {}).get("format_name", "").split(",")
        if "mp4" not in formats or not any(
            stream.get("codec_type") == "video" for stream in info.get("streams", [])
        ):
            raise ValueError("Not an MP4 video")
    except (subprocess.CalledProcessError, subprocess.TimeoutExpired, ValueError):
        raise HTTPException(415, "Invalid MP4 video") from None
    try:
        with Image.open(directory / "thumbnail.webp") as image:
            if image.format != "WEBP" or image.width * image.height > 20_000_000:
                raise ValueError("Invalid thumbnail")
            image.load()
    except (UnidentifiedImageError, OSError, ValueError, Image.DecompressionBombError):
        raise HTTPException(415, "Invalid WEBP thumbnail") from None


@app.get("/api/health")
def health():
    return {"status": "ok"}


@app.get("/api/videos/{video_id}", dependencies=[Depends(authenticate)])
def exists(video_id: UUID):
    with video_lock(video_id):
        directory = video_directory(video_id)
        if not directory.exists():
            raise HTTPException(404, "Video not found")
        if not all((directory / name).is_file() and not (directory / name).is_symlink()
                   for name in ("video.mp4", "thumbnail.webp")):
            raise HTTPException(409, "Incomplete or unsafe media pair")
        return response(video_id)


@app.post("/api/videos/{video_id}", status_code=201,
          dependencies=[Depends(authenticate)])
def upload(video_id: UUID, file: UploadFile, thumbnail: UploadFile):
    with video_lock(video_id):
        destination = video_directory(video_id)
        if destination.exists():
            raise HTTPException(409, "Video already exists")
        staging = Path(tempfile.mkdtemp(prefix=f"{video_id}-", dir=app.state.root / "tmp"))
        try:
            copy_upload(file, staging / "video.mp4", "video/mp4", VIDEO_LIMIT)
            copy_upload(thumbnail, staging / "thumbnail.webp", "image/webp", THUMBNAIL_LIMIT)
            validate_media(staging)
            for path in staging.iterdir():
                path.chmod(0o644)
            staging.chmod(0o755)
            staging.rename(destination)
        finally:
            if staging.exists():
                shutil.rmtree(staging)
        return response(video_id)


@app.delete("/api/videos/{video_id}", status_code=204,
            dependencies=[Depends(authenticate)])
def delete(video_id: UUID):
    with video_lock(video_id):
        directory = video_directory(video_id)
        if not directory.exists():
            return
        # Preflight the whole directory before removing anything.
        children = list(directory.iterdir())
        if any(path.name not in ("video.mp4", "thumbnail.webp")
               or path.is_symlink() or not path.is_file() for path in children):
            raise HTTPException(409, "Unexpected or unsafe files; manual review required")
        for path in children:
            path.unlink()
        directory.rmdir()

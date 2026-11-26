import io
import os
from pathlib import Path
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor
from uuid import uuid4

from fastapi.testclient import TestClient
from PIL import Image
import pytest

import app as media
import clear_media

KEY = "test-key-not-a-real-secret-" + "x" * 32


@pytest.fixture
def client(tmp_path, monkeypatch):
    monkeypatch.setenv("MEDIA_STORAGE_ROOT", str(tmp_path))
    monkeypatch.setenv("MEDIA_BASE_URL", "https://media.example.test")
    monkeypatch.setenv("MEDIA_API_KEY", KEY)
    with TestClient(media.app) as client:
        client.headers["X-API-Key"] = KEY
        yield client


@pytest.fixture(scope="session")
def pair(tmp_path_factory):
    video = tmp_path_factory.mktemp("fixture") / "video.mp4"
    subprocess.run([
        "ffmpeg", "-v", "error", "-f", "lavfi", "-i", "color=c=blue:s=32x32:d=0.1",
        "-c:v", "mpeg4", "-y", str(video),
    ], check=True)
    thumbnail = io.BytesIO()
    Image.new("RGB", (32, 32), "blue").save(thumbnail, "WEBP")
    return video.read_bytes(), thumbnail.getvalue()


def parts(pair):
    return {"file": ("input.mp4", pair[0], "video/mp4"),
            "thumbnail": ("input.webp", pair[1], "image/webp")}


def assert_clean(tmp_path):
    assert not list((tmp_path / "videos").iterdir())
    assert not list((tmp_path / "tmp").iterdir())


def test_lifecycle(client, pair, tmp_path):
    video_id = uuid4()
    url = f"/api/videos/{video_id}"
    assert client.get("/api/health", headers={"X-API-Key": ""}).json() == {"status": "ok"}
    assert client.get(url).status_code == 404
    result = client.post(url, files=parts(pair))
    assert result.status_code == 201
    base = f"https://media.example.test/media/{video_id}"
    assert result.json() == {"id": str(video_id), "videoUrl": base + "/video.mp4",
                             "thumbnailUrl": base + "/thumbnail.webp"}
    assert client.get(url).json() == result.json()
    directory = tmp_path / "videos" / str(video_id)
    assert (directory / "video.mp4").read_bytes() == pair[0]
    assert (directory / "thumbnail.webp").read_bytes() == pair[1]
    assert directory.stat().st_mode & 0o777 == 0o755
    assert (directory / "video.mp4").stat().st_mode & 0o777 == 0o644
    assert client.post(url, files=parts(pair)).status_code == 409
    assert client.delete(url).status_code == 204
    assert client.delete(url).status_code == 204
    assert client.get(url).status_code == 404
    assert_clean(tmp_path)


@pytest.mark.parametrize("method", ["get", "post", "delete"])
@pytest.mark.parametrize("key", ["", "wrong", "non-ascii-ñ"])
def test_unauthorized(client, method, key):
    # HTTP headers are latin-1 in this transport; comparison must handle Unicode safely.
    result = client.request(method, f"/api/videos/{uuid4()}",
                            headers={"X-API-Key": key.encode("utf-8")})
    assert result.status_code == 401


def test_invalid_uuid_and_missing_parts(client, pair):
    assert client.get("/api/videos/not-a-uuid").status_code == 422
    assert client.post(f"/api/videos/{uuid4()}", files={"file": parts(pair)["file"]}).status_code == 422


@pytest.mark.parametrize("field", ["file", "thumbnail"])
@pytest.mark.parametrize("failure,status", [("empty", 400), ("mime", 415), ("corrupt", 415), ("large", 413)])
def test_invalid_upload_is_not_published(client, pair, tmp_path, monkeypatch, field, failure, status):
    files = parts(pair)
    name, content, mime = files[field]
    if failure == "empty":
        content = b""
    elif failure == "mime":
        mime = "application/octet-stream"
    elif failure == "corrupt":
        content = b"not-media"
    else:
        monkeypatch.setattr(media, "VIDEO_LIMIT" if field == "file" else "THUMBNAIL_LIMIT", 1)
    files[field] = (name, content, mime)
    assert client.post(f"/api/videos/{uuid4()}", files=files).status_code == status
    assert_clean(tmp_path)


def test_incomplete_pair_and_unexpected_files(client, tmp_path):
    video_id = uuid4()
    directory = tmp_path / "videos" / str(video_id)
    directory.mkdir()
    (directory / "video.mp4").write_bytes(b"partial")
    url = f"/api/videos/{video_id}"
    assert client.get(url).status_code == 409
    (directory / "keep.txt").write_text("do not delete")
    assert client.delete(url).status_code == 409
    assert (directory / "video.mp4").exists()
    (directory / "keep.txt").unlink()
    assert client.delete(url).status_code == 204


def test_symlinks_are_rejected(client, tmp_path):
    outside = tmp_path / "outside"
    outside.mkdir()
    (outside / "video.mp4").write_bytes(b"keep")
    video_id = uuid4()
    (tmp_path / "videos" / str(video_id)).symlink_to(outside, target_is_directory=True)
    url = f"/api/videos/{video_id}"
    assert client.get(url).status_code == 409
    assert client.delete(url).status_code == 409
    assert (outside / "video.mp4").read_bytes() == b"keep"
    (tmp_path / "videos" / str(video_id)).unlink()
    directory = tmp_path / "videos" / str(video_id)
    directory.mkdir()
    (directory / "video.mp4").symlink_to(outside / "video.mp4")
    assert client.get(url).status_code == 409
    assert client.delete(url).status_code == 409


def test_concurrent_uploads_do_not_overwrite(client, pair):
    url = f"/api/videos/{uuid4()}"
    with ThreadPoolExecutor(max_workers=2) as pool:
        results = list(pool.map(lambda _: client.post(url, files=parts(pair)).status_code, range(2)))
    assert sorted(results) == [201, 409]
    assert client.get(url).status_code == 200


def test_probe_timeout_cleans_staging(client, pair, tmp_path, monkeypatch):
    def timeout(*args, **kwargs):
        raise subprocess.TimeoutExpired("ffprobe", 20)
    monkeypatch.setattr(media.subprocess, "run", timeout)
    assert client.post(f"/api/videos/{uuid4()}", files=parts(pair)).status_code == 415
    assert_clean(tmp_path)


@pytest.mark.parametrize("probe_output", ["invalid-json", '{"format":{"format_name":"mp4"},"streams":[]}',
                                        '{"format":{"format_name":"avi"},"streams":[{"codec_type":"video"}]}'])
def test_invalid_probe_results(client, pair, tmp_path, monkeypatch, probe_output):
    monkeypatch.setattr(media.subprocess, "run", lambda *a, **k: subprocess.CompletedProcess(
        "ffprobe", 0, stdout=probe_output))
    assert client.post(f"/api/videos/{uuid4()}", files=parts(pair)).status_code == 415
    assert_clean(tmp_path)


def test_thumbnail_is_not_accepted_just_by_mime(client, pair, tmp_path):
    png = io.BytesIO()
    Image.new("RGB", (8, 8)).save(png, "PNG")
    files = parts(pair)
    files["thumbnail"] = ("pretend.webp", png.getvalue(), "image/webp")
    assert client.post(f"/api/videos/{uuid4()}", files=files).status_code == 415
    assert_clean(tmp_path)


@pytest.mark.parametrize("key", ["", "short"])
def test_invalid_key_prevents_startup(monkeypatch, key):
    monkeypatch.setenv("MEDIA_API_KEY", key)
    with pytest.raises(RuntimeError, match="MEDIA_API_KEY"):
        with TestClient(media.app):
            pass


@pytest.mark.parametrize("base", ["http://example.test", "https://", "https://user:pass@example.test", "https://example.test/media"])
def test_invalid_origin_prevents_startup(monkeypatch, base):
    monkeypatch.setenv("MEDIA_API_KEY", KEY)
    monkeypatch.setenv("MEDIA_BASE_URL", base)
    with pytest.raises(RuntimeError, match="MEDIA_BASE_URL"):
        with TestClient(media.app):
            pass


def test_cleanup_dry_run_and_confirm(tmp_path):
    video_id = uuid4()
    directory = tmp_path / "videos" / str(video_id)
    directory.mkdir(parents=True)
    (directory / "video.mp4").write_bytes(b"video")
    (directory / "thumbnail.webp").write_bytes(b"thumbnail")
    script = Path(clear_media.__file__)
    env = {**os.environ, "MEDIA_STORAGE_ROOT": str(tmp_path)}
    command = [sys.executable, str(script), "--video-id", str(video_id)]
    subprocess.run(command, env=env, check=True, capture_output=True)
    assert directory.exists()
    subprocess.run([*command, "--confirm"], env=env, check=True, capture_output=True)
    assert not directory.exists()


def test_cleanup_preflight(tmp_path):
    directory = tmp_path / "videos" / str(uuid4())
    directory.mkdir(parents=True)
    (directory / "video.mp4").write_bytes(b"keep")
    (directory / "unknown").write_bytes(b"keep")
    with pytest.raises(ValueError, match="Unexpected contents"):
        clear_media.files_to_remove(directory)
    assert (directory / "video.mp4").exists()
    legacy = tmp_path / "videos" / "old.mp4"
    legacy.write_bytes(b"legacy")
    assert legacy in clear_media.candidates(tmp_path, None, True)
    assert clear_media.files_to_remove(legacy) == [legacy]
    link = tmp_path / "videos" / str(uuid4())
    link.symlink_to(directory, target_is_directory=True)
    with pytest.raises(ValueError, match="symlink"):
        clear_media.files_to_remove(link)


def test_cleanup_main(tmp_path, monkeypatch, capsys):
    video_id = uuid4()
    directory = tmp_path / "videos" / str(video_id)
    directory.mkdir(parents=True)
    (directory / "video.mp4").write_bytes(b"video")
    monkeypatch.setenv("MEDIA_STORAGE_ROOT", str(tmp_path))
    monkeypatch.setattr(sys, "argv", ["clear_media.py", "--video-id", str(video_id)])
    clear_media.main()
    assert "DRY RUN" in capsys.readouterr().out
    assert directory.exists()
    monkeypatch.setattr(sys, "argv", ["clear_media.py", "--video-id", str(video_id), "--confirm"])
    clear_media.main()
    assert not directory.exists()
    # Absent IDs are harmless on retry.
    clear_media.main()


def test_cleanup_main_rejects_all_before_deleting(tmp_path, monkeypatch):
    directory = tmp_path / "videos" / str(uuid4())
    directory.mkdir(parents=True)
    (directory / "video.mp4").write_bytes(b"keep")
    (directory / "unknown.txt").write_bytes(b"keep")
    monkeypatch.setenv("MEDIA_STORAGE_ROOT", str(tmp_path))
    monkeypatch.setattr(sys, "argv", ["clear_media.py", "--all", "--confirm"])
    with pytest.raises(SystemExit) as error:
        clear_media.main()
    assert error.value.code == 1
    assert (directory / "video.mp4").exists()


def test_cleanup_missing_root_and_symlink(tmp_path):
    assert clear_media.candidates(tmp_path, None, True) == []
    (tmp_path / "videos").symlink_to(tmp_path, target_is_directory=True)
    with pytest.raises(ValueError, match="symlink"):
        clear_media.candidates(tmp_path, None, True)


def test_missing_probe_prevents_startup(monkeypatch):
    monkeypatch.setenv("MEDIA_API_KEY", KEY)
    monkeypatch.setenv("MEDIA_BASE_URL", "https://media.example.test")
    monkeypatch.setattr(media.shutil, "which", lambda _: None)
    with pytest.raises(RuntimeError, match="ffprobe"):
        with TestClient(media.app):
            pass


def test_symlink_storage_prevents_startup(monkeypatch, tmp_path):
    monkeypatch.setenv("MEDIA_API_KEY", KEY)
    monkeypatch.setenv("MEDIA_BASE_URL", "https://media.example.test")
    monkeypatch.setenv("MEDIA_STORAGE_ROOT", str(tmp_path))
    (tmp_path / "videos").symlink_to(tmp_path, target_is_directory=True)
    with pytest.raises(RuntimeError, match="symlink"):
        with TestClient(media.app):
            pass

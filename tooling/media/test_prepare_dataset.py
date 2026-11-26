import json
import sys
from unittest.mock import Mock

import pytest
import requests

import prepare_dataset as prepare

BASE = "https://media.example.test"


def sample():
    return {
        "id": 999, "title": "L'estiu 🎬", "duration": 12.5, "timestamp": 1760000000,
        "meta": {
            "channel": "Canal d'exemple", "description": "Primera línia;\nD'ara \\ després",
            "categories": ["Gaming", " gaming ", "Unknown"], "tags": ["not imported"],
            "view_count": 3_000_000_000, "like_count": 7,
            "comments": [{"author": "L'Anna", "text": "Molt bé!\n'Hola'; \\ món",
                          "timestamp": 1760000100, "like_count": 5}],
        },
    }


@pytest.fixture
def source(tmp_path):
    folder = tmp_path / "source"
    folder.mkdir()
    (folder / "0.json").write_text(json.dumps(sample(), ensure_ascii=False), encoding="utf-8-sig")
    (folder / "0.mp4").write_bytes(b"test-video")
    (folder / "0.webp").write_bytes(b"test-thumbnail")
    return folder


def test_stable_ids_bom_rounding_relationships_and_sql(source):
    videos = prepare.read_dataset(source, "fixture-v1")
    video = videos[0]
    assert video["id"] == prepare.uid("fixture-v1", "video", "0")
    assert video["channel_id"] == prepare.uid("channel", "Canal d'exemple")
    assert video["comments"][0]["id"] == prepare.uid(video["id"], "comment", 0)
    assert video["duration"] == 13
    assert video["categories"] == ["GAMING", "OTHER"]
    assert video["views"] == 3_000_000_000
    assert prepare.read_dataset(source, "fixture-v1") == videos
    assert prepare.read_dataset(source, "fixture-v2")[0]["id"] != video["id"]
    sql = prepare.render_sql(videos)
    assert "L''estiu 🎬" in sql
    assert "L''Anna" in sql
    assert sql.count("INSERT INTO users") == 1
    assert sql.count("INSERT INTO video (") == 1
    assert sql.count("INSERT INTO video_categories") == 2
    assert sql.count("INSERT INTO comment") == 1
    assert "INSERT INTO tag" not in sql
    assert "INSERT INTO comment_like" not in sql
    assert "UPDATE " not in sql and "DELETE " not in sql
    assert "status = 'ACTIVE'" in sql
    fixture = prepare.REPOSITORY / "backend/src/test/resources/seed-test.sql"
    assert sql == fixture.read_text(encoding="utf-8")


def test_uses_stems_not_json_id_and_shares_channels_across_datasets(source):
    original = prepare.read_dataset(source, "v1")[0]
    data = sample()
    data["id"] = "another-source-id"
    (source / "0.json").write_text(json.dumps(data), encoding="utf-8")
    assert prepare.read_dataset(source, "v1")[0]["id"] == original["id"]
    assert prepare.read_dataset(source, "v2")[0]["channel_id"] == original["channel_id"]
    for extension in (".json", ".mp4", ".webp"):
        (source / ("1" + extension)).write_bytes((source / ("0" + extension)).read_bytes())
    assert prepare.render_sql(prepare.read_dataset(source, "v1")).count("INSERT INTO users") == 1


@pytest.mark.parametrize("change", ["missing", "extra", "empty", "large"])
def test_rejects_invalid_triplets_before_publication(source, change):
    if change == "missing":
        (source / "0.webp").unlink()
    elif change == "extra":
        (source / "extra.mp4").write_bytes(b"x")
    elif change == "empty":
        (source / "0.mp4").write_bytes(b"")
    else:
        # Use sparse truncation rather than allocating a large buffer.
        with (source / "0.mp4").open("wb") as file:
            file.truncate(101 * 1024 * 1024)
    with pytest.raises(ValueError):
        prepare.read_dataset(source, "v1")


@pytest.mark.parametrize("field,value", [
    ("title", ""), ("title", "x" * 256), ("duration", 0), ("duration", True),
    ("duration", float("inf")), ("duration", 10**500), ("timestamp", None),
    ("timestamp", 10**500), ("meta", None),
])
def test_rejects_invalid_video_metadata(source, field, value):
    data = sample()
    data[field] = value
    (source / "0.json").write_text(json.dumps(data), encoding="utf-8")
    with pytest.raises(ValueError):
        prepare.read_dataset(source, "v1")


@pytest.mark.parametrize("field,value", [
    ("channel", ""), ("description", "NUL\0"), ("view_count", -1),
    ("like_count", 2**31), ("categories", None), ("comments", {}),
    ("comments", [{"author": "A", "text": "x", "timestamp": None}]),
    ("comments", [{"author": "", "text": "x", "timestamp": 1}]),
    ("comments", [None]),
])
def test_rejects_invalid_related_metadata(source, field, value):
    data = sample()
    data["meta"][field] = value
    (source / "0.json").write_text(json.dumps(data), encoding="utf-8")
    with pytest.raises(ValueError):
        prepare.read_dataset(source, "v1")


def test_invalid_json_empty_source_and_missing_source(source, tmp_path):
    (source / "0.json").write_text("invalid", encoding="utf-8")
    with pytest.raises(ValueError, match="JSON"):
        prepare.read_dataset(source, "v1")
    empty = tmp_path / "empty"
    empty.mkdir()
    with pytest.raises(ValueError):
        prepare.read_dataset(empty, "v1")
    with pytest.raises(ValueError):
        prepare.read_dataset(tmp_path / "missing", "v1")
    with pytest.raises(ValueError):
        prepare.read_dataset(source, " ")


def test_local_copy_skip_and_incomplete_pair(source, tmp_path):
    video = prepare.read_dataset(source, "v1")[0]
    directory = tmp_path / "media"
    assert prepare.publish_local(video, directory)
    target = directory / video["id"]
    original = (target / "video.mp4").read_bytes()
    video["video"].write_bytes(b"changed-source")
    assert not prepare.publish_local(video, directory)
    assert (target / "video.mp4").read_bytes() == original
    (target / "thumbnail.webp").unlink()
    with pytest.raises(ValueError, match="Incomplete"):
        prepare.publish_local(video, directory)
    assert (target / "video.mp4").exists()
    assert not list(directory.glob(".upload-*"))


def test_failed_local_copy_cleans_staging(source, tmp_path, monkeypatch):
    video = prepare.read_dataset(source, "v1")[0]
    directory = tmp_path / "media"
    monkeypatch.setattr(prepare.shutil, "copyfile", Mock(side_effect=OSError("test failure")))
    with pytest.raises(OSError):
        prepare.publish_local(video, directory)
    assert not (directory / video["id"]).exists()
    assert not list(directory.glob(".upload-*"))


def test_local_refuses_symlink_storage_or_destination(source, tmp_path):
    video = prepare.read_dataset(source, "v1")[0]
    outside = tmp_path / "outside"
    outside.mkdir()
    directory = tmp_path / "media"
    directory.symlink_to(outside, target_is_directory=True)
    with pytest.raises(ValueError, match="symlink"):
        prepare.publish_local(video, directory)
    directory.unlink()
    directory.mkdir()
    (directory / video["id"]).symlink_to(outside, target_is_directory=True)
    with pytest.raises(ValueError, match="symlink"):
        prepare.publish_local(video, directory)
    assert not list(outside.iterdir())


def response(video, status):
    result = Mock(status_code=status)
    result.json.return_value = {"id": video["id"], "videoUrl": f"{BASE}/media/{video['id']}/video.mp4",
                                "thumbnailUrl": f"{BASE}/media/{video['id']}/thumbnail.webp"}
    return result


def test_oci_checks_existence_and_posts_both_parts_only_when_absent(source):
    video = prepare.read_dataset(source, "v1")[0]
    session = Mock()
    session.request.side_effect = [response(video, 404), response(video, 201)]
    assert prepare.publish_oci(video, session, BASE)
    first, second = session.request.call_args_list
    assert first.args == ("GET", f"{BASE}/api/videos/{video['id']}")
    assert second.args[0] == "POST"
    assert set(second.kwargs["files"]) == {"file", "thumbnail"}
    assert second.kwargs["files"]["file"][2] == "video/mp4"
    assert second.kwargs["files"]["thumbnail"][2] == "image/webp"
    assert second.kwargs["allow_redirects"] is False
    session.reset_mock()
    session.request.side_effect = [response(video, 200)]
    assert not prepare.publish_oci(video, session, BASE)
    session.request.assert_called_once()


def test_oci_accepts_only_complete_concurrent_uploads(source):
    video = prepare.read_dataset(source, "v1")[0]
    session = Mock()
    session.request.side_effect = [response(video, 404), response(video, 409), response(video, 200)]
    assert not prepare.publish_oci(video, session, BASE)
    session.request.side_effect = [response(video, 404), response(video, 409), response(video, 404)]
    with pytest.raises(ValueError):
        prepare.publish_oci(video, session, BASE)


@pytest.mark.parametrize("status", [401, 409, 500])
def test_oci_check_errors_do_not_trigger_upload(source, status):
    video = prepare.read_dataset(source, "v1")[0]
    session = Mock()
    session.request.return_value = response(video, status)
    with pytest.raises(ValueError):
        prepare.publish_oci(video, session, BASE)
    session.request.assert_called_once()


def test_oci_rejects_bad_response_and_sanitizes_network_errors(source):
    video = prepare.read_dataset(source, "v1")[0]
    session = Mock()
    result = response(video, 200)
    result.json.return_value["id"] = "wrong"
    session.request.return_value = result
    with pytest.raises(ValueError, match="Unexpected"):
        prepare.publish_oci(video, session, BASE)
    result.json.side_effect = ValueError("bad JSON")
    with pytest.raises(ValueError, match="Unexpected"):
        prepare.publish_oci(video, session, BASE)
    session.request.side_effect = requests.ConnectionError("PRIVATE HEADERS")
    with pytest.raises(ValueError) as error:
        prepare.publish_oci(video, session, BASE)
    assert "PRIVATE" not in str(error.value)


def test_cli_local_generates_both_sql_files_without_oci_key(source, tmp_path, monkeypatch):
    output = tmp_path / "sql"
    media = tmp_path / "media"
    monkeypatch.delenv("ENV_PROTUBE_MEDIA_API_KEY", raising=False)
    monkeypatch.setattr(sys, "argv", ["prepare_dataset.py", "--source", str(source), "--dataset", "fixture-v1",
                                    "--local-dir", str(media), "--output", str(output)])
    prepare.main()
    assert (output / "data-h2.sql").read_text() == (output / "data-postgresql.sql").read_text()
    assert (output / "data-h2.sql").read_text() == prepare.render_sql(prepare.read_dataset(source, "fixture-v1"))
    prepare.main()


@pytest.mark.parametrize("base,key", [("http://unsafe.test", "x" * 32), (BASE, ""), (BASE, "secret\n" * 10)])
def test_invalid_oci_configuration_does_not_copy_files_or_write_sql(source, tmp_path, monkeypatch, base, key):
    output, media = tmp_path / "sql", tmp_path / "media"
    monkeypatch.setenv("ENV_PROTUBE_MEDIA_API_KEY", key)
    monkeypatch.setattr(sys, "argv", ["prepare_dataset.py", "--source", str(source), "--dataset", "v1",
        "--mode", "both", "--base-url", base, "--local-dir", str(media), "--output", str(output)])
    with pytest.raises(SystemExit) as error:
        prepare.main()
    assert error.value.code == 1
    assert not media.exists() and not output.exists()


def test_cli_does_not_replace_sql_after_a_failed_publication(source, tmp_path, monkeypatch):
    output = tmp_path / "sql"
    output.mkdir()
    (output / "data-h2.sql").write_text("-- keep existing SQL", encoding="utf-8")
    monkeypatch.setenv("ENV_PROTUBE_MEDIA_API_KEY", "test-only-" + "x" * 32)
    monkeypatch.setattr(prepare, "publish_oci", Mock(side_effect=ValueError("test remote failure")))
    monkeypatch.setattr(sys, "argv", ["prepare_dataset.py", "--source", str(source), "--dataset", "v1",
                                    "--mode", "oci", "--base-url", BASE, "--output", str(output)])
    with pytest.raises(SystemExit):
        prepare.main()
    assert (output / "data-h2.sql").read_text() == "-- keep existing SQL"


def test_cli_both_uses_private_service_key_and_writes_sql_after_publication(source, tmp_path, monkeypatch):
    video = prepare.read_dataset(source, "fixture-v1")[0]
    output, media = tmp_path / "sql", tmp_path / "media"
    session = Mock(headers={})
    session.request.side_effect = [response(video, 404), response(video, 201)]
    monkeypatch.setattr(requests, "Session", lambda: session)
    key = "test-only-" + "x" * 32
    monkeypatch.setenv("ENV_PROTUBE_MEDIA_API_KEY", key)
    monkeypatch.setattr(sys, "argv", ["prepare_dataset.py", "--source", str(source), "--dataset", "fixture-v1",
        "--mode", "both", "--base-url", BASE, "--local-dir", str(media), "--output", str(output)])
    prepare.main()
    assert session.headers["X-API-Key"] == key
    assert (media / video["id"] / "video.mp4").exists()
    sql = (output / "data-h2.sql").read_text()
    assert sql == prepare.render_sql([video])
    assert key not in sql
    session.close.assert_called_once()

import { ChangeEvent, useEffect, useState } from 'react';
import Navbar from '../components/Navbar';
import { User } from '../types/user';
import './UploadPage.css';

interface UploadPageProps {
  user: User | null;
  onLoginClick: () => void;
  onProfileClick: () => void;
  onSearch: (query: string) => void;
  darkMode: boolean;
  onToggleTheme: () => void;
}

export default function UploadPage({
  user,
  onLoginClick,
  onProfileClick,
  onSearch,
  darkMode,
  onToggleTheme,
}: UploadPageProps) {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [videoFile, setVideoFile] = useState<File | null>(null);
  const [duration, setDuration] = useState<number | null>(null);
  const [thumbnailPreview, setThumbnailPreview] = useState('');
  const [durationError, setDurationError] = useState('');

  useEffect(() => {
    if (!videoFile) {
      setDuration(null);
      setThumbnailPreview('');
      setDurationError('');
      return;
    }

    const objectUrl = URL.createObjectURL(videoFile);
    const video = document.createElement('video');
    video.preload = 'auto';
    video.onloadedmetadata = () => {
      if (Number.isFinite(video.duration) && video.duration > 0) {
        setDuration(Math.ceil(video.duration));
        setDurationError('');
      } else {
        setDuration(null);
        setDurationError('Could not read the duration from this video.');
      }
    };
    video.onloadeddata = () => {
      try {
        const canvas = document.createElement('canvas');
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        const context = canvas.getContext('2d');
        if (!context || canvas.width === 0 || canvas.height === 0) {
          setThumbnailPreview('');
          return;
        }
        context.drawImage(video, 0, 0, canvas.width, canvas.height);
        setThumbnailPreview(canvas.toDataURL('image/jpeg'));
      } catch {
        setThumbnailPreview('');
      }
    };
    video.onerror = () => {
      setDuration(null);
      setDurationError('Could not read the duration from this video.');
      setThumbnailPreview('');
    };
    video.src = objectUrl;

    return () => {
      video.onloadedmetadata = null;
      video.onloadeddata = null;
      video.onerror = null;
      URL.revokeObjectURL(objectUrl);
    };
  }, [videoFile]);

  const handleFileChange = (event: ChangeEvent<HTMLInputElement>) => {
    setVideoFile(event.target.files?.[0] ?? null);
    setDuration(null);
    setDurationError('');
  };

  return (
    <>
      <Navbar
        user={user}
        onLoginClick={onLoginClick}
        onProfileClick={onProfileClick}
        onSearch={onSearch}
        darkMode={darkMode}
        onToggleTheme={onToggleTheme}
      />
      <main className="upload-page">
        <button type="button" className="upload-back-button" onClick={onProfileClick}>
          <svg viewBox="0 0 24 24" aria-hidden="true">
            <path d="M19 12H5m7 7-7-7 7-7" />
          </svg>
          Back to profile
        </button>
        <h1>Upload a video</h1>
        <form className="upload-form" onSubmit={(event) => event.preventDefault()}>
          <section className="upload-file-panel" aria-labelledby="upload-file-heading">
            <h2 id="upload-file-heading">Video file</h2>
            <label htmlFor="upload-video-file" className="upload-file-label">
              Choose a video file
            </label>
            <input
              id="upload-video-file"
              name="file"
              type="file"
              accept="video/*"
              onChange={handleFileChange}
              required
            />
            <input type="hidden" name="duration" value={duration ?? ''} />

            {videoFile && <p className="upload-selected-file">{videoFile.name}</p>}
            {thumbnailPreview ? (
              <img className="upload-thumbnail-preview" src={thumbnailPreview} alt="Video thumbnail preview" />
            ) : (
              <div className="upload-thumbnail-placeholder" role="img" aria-label="Video thumbnail preview">
                {videoFile ? 'Preparing thumbnail preview…' : 'Thumbnail preview will appear here'}
              </div>
            )}
            {durationError && (
              <p id="upload-duration-error" className="upload-error" role="alert">
                {durationError}
              </p>
            )}
          </section>

          <section className="upload-details-panel" aria-label="Video details">
            <label htmlFor="upload-title">Video title</label>
            <input
              id="upload-title"
              name="title"
              type="text"
              value={title}
              onChange={(event) => setTitle(event.target.value)}
              required
            />

            <label htmlFor="upload-description">Description</label>
            <textarea
              id="upload-description"
              name="description"
              value={description}
              onChange={(event) => setDescription(event.target.value)}
              rows={8}
              required
            />
          </section>

          <button type="button" className="upload-submit-button" disabled>
            Upload video
          </button>
        </form>
      </main>
    </>
  );
}

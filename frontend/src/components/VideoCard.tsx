import { Video } from '../types/video';
import './VideoCard.css';

interface VideoCardProps {
  video?: Video;
  onClick?: (video: Video) => void;
}

export const formatDuration = (seconds?: number | string): string => {
  if (seconds === undefined || seconds === null || seconds === '') return '';
  const num = typeof seconds === 'string' ? Number(seconds) : seconds;
  if (isNaN(num) || num < 0) return '';

  const totalSeconds = Math.floor(num);
  const hrs = Math.floor(totalSeconds / 3600);
  const mins = Math.floor((totalSeconds % 3600) / 60);
  const secs = totalSeconds % 60;
  const formattedSecs = secs.toString().padStart(2, '0');

  if (hrs > 0) {
    const formattedMins = mins.toString().padStart(2, '0');
    return `${hrs}:${formattedMins}:${formattedSecs}`;
  }
  return `${mins}:${formattedSecs}`;
};

export const formatViews = (views?: number | string): string => {
  if (views === undefined || views === null || views === '') return '';
  const num = typeof views === 'string' ? Number(views) : views;
  if (isNaN(num)) return String(views);

  if (num >= 1_000_000_000) {
    const formatted = (num / 1_000_000_000).toFixed(1).replace(/\.0$/, '');
    return `${formatted} B`;
  }
  if (num >= 1_000_000) {
    const formatted = (num / 1_000_000).toFixed(1).replace(/\.0$/, '');
    return `${formatted} M`;
  }
  if (num >= 1_000) {
    const formatted = (num / 1_000).toFixed(1).replace(/\.0$/, '');
    return `${formatted} K`;
  }
  return String(num);
};

export const VideoCard = ({ video, onClick }: VideoCardProps) => {
  const isPlaceholder = !video || (!video.title && !video.thumbnail);

  if (isPlaceholder) {
    return (
      <div className="video-card video-card--placeholder" aria-hidden="true">
        <div className="video-thumbnail-placeholder" />
        <div className="video-details-placeholder">
          <div className="video-title-placeholder" />
        </div>
      </div>
    );
  }

  const durationText = formatDuration(video.duration);

  return (
    <div
      className="video-card"
      onClick={() => onClick && video && onClick(video)}
      role="button"
      tabIndex={0}
      onKeyDown={(e) => {
        if ((e.key === 'Enter' || e.key === ' ') && onClick && video) {
          onClick(video);
        }
      }}
    >
      <div className="video-thumbnail-wrapper">
        {video.thumbnail ? (
          <img src={getThumbnailSrc(video.thumbnail)} alt={video.title} className="video-thumbnail-img" />
        ) : (
          <div className="video-thumbnail-fallback" />
        )}
        {durationText && <span className="video-duration">{durationText}</span>}
      </div>
      <div className="video-details">
        <h3 className="video-title" title={video.title}>
          {video.title}
        </h3>
        {(video.channelName || video.viewsCount !== undefined) && (
          <div className="video-metadata">
            {video.channelName && <span className="video-channel">{video.channelName}</span>}
            {video.viewsCount !== undefined && (
              <span className="video-views">{formatViews(video.viewsCount)} visualitzacions</span>
            )}
          </div>
        )}
      </div>
    </div>
  );
};

export default VideoCard;

const getThumbnailSrc = (thumb?: string) => {
  if (!thumb) return undefined;
  if (thumb.startsWith('http://') || thumb.startsWith('https://')) return thumb;
  if (thumb.startsWith('/media/')) return `http://localhost:8080${thumb}`;
  return `http://localhost:8080/media/${thumb}`;
};

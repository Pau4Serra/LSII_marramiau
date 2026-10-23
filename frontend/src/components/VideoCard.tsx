import { Video } from '../types/video';
import './VideoCard.css';

interface VideoCardProps {
  video?: Video;
  onClick?: (video: Video) => void;
}

export const VideoCard = ({ video, onClick }: VideoCardProps) => {
  const isPlaceholder = !video || (!video.title && !video.thumbnailUrl);

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
        {video.thumbnailUrl ? (
          <img src={video.thumbnailUrl} alt={video.title} className="video-thumbnail-img" />
        ) : (
          <div className="video-thumbnail-fallback" />
        )}
      </div>
      <div className="video-details">
        <h3 className="video-title" title={video.title}>
          {video.title}
        </h3>
        {(video.channel || video.views) && (
          <div className="video-metadata">
            {video.channel && <span className="video-channel">{video.channel}</span>}
            {video.views !== undefined && <span className="video-views">{video.views} vistas</span>}
          </div>
        )}
      </div>
    </div>
  );
};

export default VideoCard;

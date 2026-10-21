import { Video } from '../types/video';
import VideoCard from './VideoCard';
import './VideoGrid.css';

export interface VideoGridProps {
  videos?: Video[];
  placeholderCount?: number;
  onVideoClick?: (video: Video) => void;
}

export const VideoGrid = ({ videos, placeholderCount = 9, onVideoClick }: VideoGridProps) => {
  const hasVideos = Array.isArray(videos) && videos.length > 0;

  return (
    <section className="video-grid-container" aria-label="Videos Grid">
      <div className="video-grid">
        {hasVideos
          ? videos.map((video) => <VideoCard key={video.id} video={video} onClick={onVideoClick} />)
          : Array.from({ length: placeholderCount }).map((_, index) => <VideoCard key={`placeholder-${index}`} />)}
      </div>
    </section>
  );
};

export default VideoGrid;

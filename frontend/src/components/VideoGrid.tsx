import { useState, useEffect } from 'react';
import { Video } from '../types/video';
import VideoCard from './VideoCard';
import Pagination from './Pagination';
import './VideoGrid.css';

export interface VideoGridProps {
  videos?: Video[];
  placeholderCount?: number;
  itemsPerPage?: number;
  currentPage?: number;
  onPageChange?: (page: number) => void;
  onVideoClick?: (video: Video) => void;
  loading?: boolean;
}

export const VideoGrid = ({
  videos,
  placeholderCount = 15,
  itemsPerPage = 15,
  currentPage: controlledPage,
  onPageChange,
  onVideoClick,
}: VideoGridProps) => {
  const [internalPage, setInternalPage] = useState(1);
  const isControlled = controlledPage !== undefined;
  const currentPage = isControlled ? controlledPage : internalPage;

  const hasVideos = Array.isArray(videos) && videos.length > 0;
  const totalPages = hasVideos ? Math.ceil(videos.length / itemsPerPage) : 0;

  useEffect(() => {
    if (!isControlled && totalPages > 0 && internalPage > totalPages) {
      setInternalPage(1);
    }
  }, [videos, totalPages, internalPage, isControlled]);

  const handlePageChange = (newPage: number) => {
    if (!isControlled) {
      setInternalPage(newPage);
    }
    if (onPageChange) {
      onPageChange(newPage);
    }
    if (typeof window !== 'undefined') {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  };

  const startIndex = (currentPage - 1) * itemsPerPage;
  const paginatedVideos = hasVideos ? videos.slice(startIndex, startIndex + itemsPerPage) : [];

  return (
    <section className="video-grid-container" aria-label="Videos Grid">
      <div className="video-grid">
        {hasVideos
          ? paginatedVideos.map((video) => <VideoCard key={video.id} video={video} onClick={onVideoClick} />)
          : Array.from({ length: placeholderCount }).map((_, index) => <VideoCard key={`placeholder-${index}`} />)}
      </div>
      {hasVideos && totalPages > 1 && (
        <Pagination currentPage={currentPage} totalPages={totalPages} onPageChange={handlePageChange} />
      )}
    </section>
  );
};

export default VideoGrid;

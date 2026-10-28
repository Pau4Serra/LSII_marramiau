import { useEffect, useState } from 'react';
import axios from 'axios';
import Navbar from '../components/Navbar';
import VideoCard from '../components/VideoCard';
import { getEnv } from '../utils/Env';
import { useAllVideos } from '../useAllVideos';
import './VideoPage.css';

interface VideoDetails {
  id: string;
  title: string;
  description?: string;
  thumbnail?: string;
  channelName?: string;
  viewsCount?: number;
  likeCount?: number;
  categories?: string[];
  uploadDate?: string;
  videoUrl: string;
}

interface VideoPageProps {
  videoId: string;
}

const resolveMediaUrl = (url: string) => {
  if (url.startsWith('http')) {
    return url;
  }

  return `${getEnv().MEDIA_BASE_URL}${url.replace(/^\/media/, '')}`;
};

const formatCount = (count: number) => {
  if (count >= 1_000_000) {
    return `${Number((count / 1_000_000).toFixed(1))}M`;
  }

  if (count >= 1_000) {
    return `${Number((count / 1_000).toFixed(1))}k`;
  }

  return count.toString();
};

export default function VideoPage({ videoId }: VideoPageProps) {
  const [video, setVideo] = useState<VideoDetails | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [liked, setLiked] = useState(false);
  const [likeCount, setLikeCount] = useState(0);
  const { value: videos } = useAllVideos();

  useEffect(() => {
    const fetchVideo = async () => {
      try {
        const response = await axios.get<VideoDetails>(`${getEnv().API_BASE_URL}/videos/${videoId}`);
        setVideo(response.data);
        setLiked(false);
        setLikeCount(response.data.likeCount ?? 0);
      } catch {
        setError('Video not found or unavailable.');
      } finally {
        setLoading(false);
      }
    };

    fetchVideo();
  }, [videoId]);

  const goHome = () => {
    window.history.pushState({}, '', '/');
    window.dispatchEvent(new PopStateEvent('popstate'));
  };

  const openVideo = (id: string | number) => {
    window.history.pushState({}, '', `/videos/${id}`);
    window.dispatchEvent(new PopStateEvent('popstate'));
  };

  const recommendations = videos
    .filter((candidate) => String(candidate.id) !== videoId)
    .slice(0, 20);

  const toggleLike = () => {
    const nextLiked = !liked;
    setLiked(nextLiked);
    setLikeCount((currentCount) => Math.max(0, currentCount + (nextLiked ? 1 : -1)));
  };

  return (
    <>
      <Navbar />
      <main className="video-page">
        <button type="button" className="video-page-back" onClick={goHome}>
          Back to videos
        </button>

        {loading && <p role="status">Loading video...</p>}
        {error && <p role="alert">{error}</p>}

        {video && !loading && !error && (
          <div className="video-watch-layout">
            <article className="video-main-column">
              <video
                className="video-player"
                controls
                poster={video.thumbnail ? resolveMediaUrl(video.thumbnail) : undefined}
                src={resolveMediaUrl(video.videoUrl)}
              >
                Your browser does not support video playback.
              </video>
              <div className="video-title-row">
                <h1>{video.title}</h1>
                <div className="video-engagement" aria-label="Video engagement">
                  <span>{formatCount(video.viewsCount ?? 0)} views</span>
                  <button
                    type="button"
                    className={`like-button${liked ? ' like-button--active' : ''}`}
                    onClick={toggleLike}
                    aria-label={liked ? 'Unlike video' : 'Like video'}
                    aria-pressed={liked}
                  >
                    <svg
                      className="like-icon"
                      viewBox="0 0 24 24"
                      aria-hidden="true"
                      focusable="false"
                    >
                      <path d="M12 21S2.5 15.65 2.5 9.5C2.5 6.5 4.5 4 7 4c2.2 0 3.8 1.2 5 3 1.2-1.8 2.8-3 5-3 2.5 0 4.5 2.5 4.5 5.5C21.5 15.65 12 21 12 21Z" />
                    </svg>
                    <span>{formatCount(likeCount)}</span>
                  </button>
                </div>
              </div>
              {video.channelName && <p className="video-page-channel">{video.channelName}</p>}
              <details className="video-description">
                <summary>
                  <span>Description</span>
                  <span className="video-description-preview">
                    {video.description || 'No description available.'}
                  </span>
                </summary>
                <p>{video.description || 'No description available.'}</p>
              </details>
            </article>

            <aside className="video-recommendations" aria-label="Recommended videos">
              <h2>More videos</h2>
              <div className="video-recommendation-list">
                {recommendations.map((recommendedVideo) => (
                  <VideoCard key={recommendedVideo.id} video={recommendedVideo} onClick={(selected) => openVideo(selected.id)} />
                ))}
              </div>
            </aside>
          </div>
        )}
      </main>
    </>
  );
}

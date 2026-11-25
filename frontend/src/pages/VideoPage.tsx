import { useEffect, useState } from 'react';
import axios from 'axios';
import Navbar from '../components/Navbar';
import VideoCard from '../components/VideoCard';
import CommentSection from '../components/CommentSection';
import { getEnv } from '../utils/Env';
import { useAllVideos } from '../useAllVideos';
import { User } from '../types/user';
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

interface VideoLikeState {
  likeCount: number;
  likedByCurrentUser: boolean;
}

interface VideoPageProps {
  videoId: string;
  user?: User | null;
  onLoginClick?: () => void;
  darkMode?: boolean;
  onToggleTheme?: () => void;
  onSearch?: (query: string) => void;
  onProfileClick?: () => void;
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

export default function VideoPage({
  videoId,
  user,
  onLoginClick,
  darkMode,
  onToggleTheme,
  onSearch,
  onProfileClick,
}: VideoPageProps) {
  const [video, setVideo] = useState<VideoDetails | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [liked, setLiked] = useState(false);
  const [likeCount, setLikeCount] = useState(0);
  const [likeLoading, setLikeLoading] = useState(true);
  const [likeUpdating, setLikeUpdating] = useState(false);
  const [likeError, setLikeError] = useState('');
  const { value: videos } = useAllVideos();

  useEffect(() => {
    let active = true;
    setLoading(true);
    setError(null);
    setLiked(false);
    setLikeCount(0);
    setLikeError('');
    setLikeLoading(true);

    const fetchVideo = async () => {
      try {
        const response = await axios.get<VideoDetails>(`${getEnv().API_BASE_URL}/videos/${videoId}`);
        if (!active) return;
        setVideo(response.data);
        setLikeCount(response.data.likeCount ?? 0);
      } catch {
        if (active) setError('Video not found or unavailable.');
      } finally {
        if (active) setLoading(false);
      }
    };

    const fetchLikeState = async () => {
      try {
        const response = await axios.get<VideoLikeState>(`${getEnv().API_BASE_URL}/videos/${videoId}/like`, {
          withCredentials: true,
        });
        if (active) {
          setLiked(response.data.likedByCurrentUser);
          setLikeCount(response.data.likeCount);
        }
      } catch {
        if (active) setLikeError('Could not load the video like status.');
      } finally {
        if (active) setLikeLoading(false);
      }
    };

    fetchVideo();
    fetchLikeState();
    return () => {
      active = false;
    };
  }, [videoId, user?.id]);

  const goHome = () => {
    window.history.pushState({}, '', '/');
    window.dispatchEvent(new PopStateEvent('popstate'));
  };

  const openVideo = (id: string | number) => {
    window.history.pushState({}, '', `/videos/${id}`);
    window.dispatchEvent(new PopStateEvent('popstate'));
  };

  const recommendations = videos.filter((candidate) => String(candidate.id) !== videoId).slice(0, 20);

  const toggleLike = async () => {
    if (!user) {
      onLoginClick?.();
      return;
    }
    if (likeLoading || likeUpdating) return;

    setLikeUpdating(true);
    setLikeError('');
    try {
      const likeUrl = `${getEnv().API_BASE_URL}/videos/${videoId}/like`;
      const response = liked
        ? await axios.delete<VideoLikeState>(likeUrl, { withCredentials: true })
        : await axios.put<VideoLikeState>(likeUrl, null, { withCredentials: true });
      setLiked(response.data.likedByCurrentUser);
      setLikeCount(response.data.likeCount);
    } catch {
      setLikeError('Could not update the video like.');
    } finally {
      setLikeUpdating(false);
    }
  };

  return (
    <>
      <Navbar
        user={user}
        onLoginClick={onLoginClick}
        darkMode={darkMode}
        onToggleTheme={onToggleTheme}
        onSearch={onSearch}
        onProfileClick={onProfileClick}
      />
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
                    disabled={likeLoading || likeUpdating}
                    aria-label={liked ? 'Unlike video' : 'Like video'}
                    aria-pressed={liked}
                  >
                    <svg className="like-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                      <path d="M12 21S2.5 15.65 2.5 9.5C2.5 6.5 4.5 4 7 4c2.2 0 3.8 1.2 5 3 1.2-1.8 2.8-3 5-3 2.5 0 4.5 2.5 4.5 5.5C21.5 15.65 12 21 12 21Z" />
                    </svg>
                    <span>{formatCount(likeCount)}</span>
                  </button>
                </div>
              </div>
              {likeError && <p className="video-like-error" role="alert">{likeError}</p>}
              {video.channelName && <p className="video-page-channel">{video.channelName}</p>}
              <details className="video-description">
                <summary>
                  <span>Description</span>
                  <span className="video-description-preview">{video.description || 'No description available.'}</span>
                </summary>
                <p>{video.description || 'No description available.'}</p>
              </details>
              <CommentSection videoId={videoId} user={user} onLoginClick={onLoginClick} />
            </article>

            <aside className="video-recommendations" aria-label="Recommended videos">
              <h2>More videos</h2>
              <div className="video-recommendation-list">
                {recommendations.map((recommendedVideo) => (
                  <VideoCard
                    key={recommendedVideo.id}
                    video={recommendedVideo}
                    onClick={(selected) => openVideo(selected.id)}
                  />
                ))}
              </div>
            </aside>
          </div>
        )}
      </main>
    </>
  );
}

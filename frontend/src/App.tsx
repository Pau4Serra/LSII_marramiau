import { useEffect, useState } from 'react';
import './App.css';
import Navbar from './components/Navbar';
import VideoGrid from './components/VideoGrid';
import NoSearchResults from './components/NoSearchResults';
import { useAllVideos } from './useAllVideos';
import VideoPage from './pages/VideoPage';
import ProfilePage from './pages/ProfilePage';
import { getEnv } from './utils/Env';
import { User } from './types/user';
import axios from 'axios';

const THEME_STORAGE_KEY = 'protube-dark-mode';

function HomePage({
  user,
  onLoginClick,
  darkMode,
  onToggleTheme,
  onSearch,
  onProfileClick,
  videos,
  loading,
  searchQuery,
}: {
  user: User | null;
  onLoginClick: () => void;
  darkMode: boolean;
  onToggleTheme: () => void;
  onSearch: (query: string) => void;
  onProfileClick: () => void;
  videos: ReturnType<typeof useAllVideos>['value'];
  loading: ReturnType<typeof useAllVideos>['loading'];
  searchQuery?: string;
}) {
  // Si la cerca ha acabat i no ha retornat cap vídeo, es mostra l'estat buit en lloc de la graella
  const showNoResults = loading === 'success' && videos.length === 0 && Boolean(searchQuery?.trim());

  return (
    <>
      <Navbar
        user={user}
        onSearch={onSearch}
        onLoginClick={onLoginClick}
        darkMode={darkMode}
        onToggleTheme={onToggleTheme}
        onProfileClick={onProfileClick}
      />
      <main className="App-main">
        {showNoResults ? (
          <NoSearchResults query={searchQuery} />
        ) : (
          <VideoGrid
            videos={videos.length > 0 ? videos : undefined}
            loading={loading === 'loading'}
            onVideoClick={(video) => {
              window.history.pushState({}, '', `/videos/${video.id}`);
              window.dispatchEvent(new PopStateEvent('popstate'));
            }}
          />
        )}
      </main>
    </>
  );
}

function App() {
  const [path, setPath] = useState(window.location.pathname);
  const [currentUser, setCurrentUser] = useState<User | null>(null);
  const [darkMode, setDarkMode] = useState(() => localStorage.getItem(THEME_STORAGE_KEY) === 'true');
  const { value: videos, loading, searchQuery, searchVideos } = useAllVideos();

  useEffect(() => {
    localStorage.setItem(THEME_STORAGE_KEY, String(darkMode));
  }, [darkMode]);

  useEffect(() => {
    const handlePopState = () => setPath(window.location.pathname);
    window.addEventListener('popstate', handlePopState);
    return () => window.removeEventListener('popstate', handlePopState);
  }, []);

  useEffect(() => {
    const fetchCurrentUser = async () => {
      try {
        const response = await axios.get<User>(`${getEnv().API_BASE_URL}/users/me`, {
          withCredentials: true,
        });
        setCurrentUser(response.data);
      } catch {
        setCurrentUser(null);
      }
    };

    fetchCurrentUser();
  }, []);

  const handleLoginClick = () => {
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = `${getEnv().API_BASE_URL}/auth/login`;
    document.body.appendChild(form);
    form.submit();
  };

  const handleSearch = (query: string) => {
    searchVideos(query);
    if (path !== '/') {
      window.history.pushState({}, '', '/');
      setPath('/');
    }
  };

  const handleProfileClick = () => {
    window.history.pushState({}, '', '/profile');
    setPath('/profile');
  };

  const handleVideoClick = (video: { id: string | number }) => {
    const videoPath = `/videos/${video.id}`;
    window.history.pushState({}, '', videoPath);
    setPath(videoPath);
  };

  const handleProfileUpdate = (updatedUser: User) => setCurrentUser(updatedUser);

  const handleLogout = () => {
    setCurrentUser(null);
    window.history.pushState({}, '', '/');
    setPath('/');
  };

  const toggleTheme = () => setDarkMode((isDarkMode) => !isDarkMode);
  const videoMatch = path.match(/^\/videos\/([^/]+)$/);

  return (
    <div className={`App${darkMode ? ' App--dark' : ''}`}>
      {path === '/profile' ? (
        <ProfilePage
          user={currentUser}
          videos={videos}
          onProfileUpdate={handleProfileUpdate}
          onLoginClick={handleLoginClick}
          darkMode={darkMode}
          onToggleTheme={toggleTheme}
          onSearch={handleSearch}
          onProfileClick={handleProfileClick}
          onLogout={handleLogout}
          onVideoClick={handleVideoClick}
        />
      ) : videoMatch ? (
        <VideoPage
          videoId={videoMatch[1]}
          user={currentUser}
          onLoginClick={handleLoginClick}
          darkMode={darkMode}
          onToggleTheme={toggleTheme}
          onSearch={handleSearch}
          onProfileClick={handleProfileClick}
        />
      ) : (
        <HomePage
          user={currentUser}
          onLoginClick={handleLoginClick}
          darkMode={darkMode}
          onToggleTheme={toggleTheme}
          onSearch={handleSearch}
          onProfileClick={handleProfileClick}
          videos={videos}
          loading={loading}
          searchQuery={searchQuery}
        />
      )}
    </div>
  );
}

export default App;

import { useEffect, useState } from 'react';
import './App.css';
import Navbar from './components/Navbar';
import VideoGrid from './components/VideoGrid';
import { useAllVideos } from './useAllVideos';
import VideoPage from './pages/VideoPage';
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
  videos,
  loading,
}: {
  user: User | null;
  onLoginClick: () => void;
  darkMode: boolean;
  onToggleTheme: () => void;
  onSearch: (query: string) => void;
  videos: ReturnType<typeof useAllVideos>['value'];
  loading: ReturnType<typeof useAllVideos>['loading'];
}) {
  return (
    <>
      <Navbar
        user={user}
        onSearch={onSearch}
        onLoginClick={onLoginClick}
        darkMode={darkMode}
        onToggleTheme={onToggleTheme}
      />
      <main className="App-main">
        <VideoGrid
          videos={videos.length > 0 ? videos : undefined}
          loading={loading === 'loading'}
          onVideoClick={(video) => {
            window.history.pushState({}, '', `/videos/${video.id}`);
            window.dispatchEvent(new PopStateEvent('popstate'));
          }}
        />
      </main>
    </>
  );
}

function App() {
  const [path, setPath] = useState(window.location.pathname);
  const [currentUser, setCurrentUser] = useState<User | null>(null);
  const [darkMode, setDarkMode] = useState(() => localStorage.getItem(THEME_STORAGE_KEY) === 'true');
  const { value: videos, loading, searchVideos } = useAllVideos();

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

  const toggleTheme = () => setDarkMode((isDarkMode) => !isDarkMode);
  const videoMatch = path.match(/^\/videos\/([^/]+)$/);

  return (
    <div className={`App${darkMode ? ' App--dark' : ''}`}>
      {videoMatch ? (
        <VideoPage
          videoId={videoMatch[1]}
          user={currentUser}
          onLoginClick={handleLoginClick}
          darkMode={darkMode}
          onToggleTheme={toggleTheme}
          onSearch={handleSearch}
        />
      ) : (
        <HomePage
          user={currentUser}
          onLoginClick={handleLoginClick}
          darkMode={darkMode}
          onToggleTheme={toggleTheme}
          onSearch={handleSearch}
          videos={videos}
          loading={loading}
        />
      )}
    </div>
  );
}

export default App;

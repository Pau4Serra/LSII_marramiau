import { useEffect, useState } from 'react';
import './App.css';
import Navbar from './components/Navbar';
import VideoGrid from './components/VideoGrid';
import { useAllVideos } from './useAllVideos';
import VideoPage from './pages/VideoPage';
import { getEnv } from './utils/Env';
import { User } from './types/user';
import axios from 'axios';

function HomePage({ user, onLoginClick }: { user: User | null; onLoginClick: () => void }) {
  const { value } = useAllVideos();

  const handleSearch = (query: string) => {
    console.log('Searching for:', query);
  };

  return (
    <>
      <Navbar user={user} onSearch={handleSearch} onLoginClick={onLoginClick} />
      <main className="App-main">
        <VideoGrid
          videos={value.length > 0 ? value : undefined}
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

  const videoMatch = path.match(/^\/videos\/([^/]+)$/);

  return (
    <div className="App">
      {videoMatch ? (
        <VideoPage videoId={videoMatch[1]} user={currentUser} onLoginClick={handleLoginClick} />
      ) : (
        <HomePage user={currentUser} onLoginClick={handleLoginClick} />
      )}
    </div>
  );
}

export default App;

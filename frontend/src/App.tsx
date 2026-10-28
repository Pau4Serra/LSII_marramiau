import { useEffect, useState } from 'react';
import './App.css';
import Navbar from './components/Navbar';
import VideoGrid from './components/VideoGrid';
import { useAllVideos } from './useAllVideos';
import VideoPage from './pages/VideoPage';

function HomePage() {
  const { value } = useAllVideos();

  const handleSearch = (query: string) => {
    console.log('Searching for:', query);
  };

  const handleLoginClick = () => {
    console.log('Login clicked');
  };

  return (
    <>
      <Navbar onSearch={handleSearch} onLoginClick={handleLoginClick} />
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

  useEffect(() => {
    const handlePopState = () => setPath(window.location.pathname);
    window.addEventListener('popstate', handlePopState);
    return () => window.removeEventListener('popstate', handlePopState);
  }, []);

  const videoMatch = path.match(/^\/videos\/([^/]+)$/);

  return (
    <div className="App">
      {videoMatch ? <VideoPage videoId={videoMatch[1]} /> : <HomePage />}
    </div>
  );
}

export default App;

import './App.css';
import Navbar from './components/Navbar';
import VideoGrid from './components/VideoGrid';
import { useAllVideos } from './useAllVideos';

function App() {
  const { value, loading } = useAllVideos();

  const handleSearch = (query: string) => {
    console.log('Searching for:', query);
  };

  const handleLoginClick = () => {
    console.log('Login clicked');
  };

  return (
    <div className="App">
      <Navbar onSearch={handleSearch} onLoginClick={handleLoginClick} />
      <main className="App-main">
        <VideoGrid videos={value.length > 0 ? value : undefined} loading={loading === 'loading'} />
      </main>
    </div>
  );
}

export default App;

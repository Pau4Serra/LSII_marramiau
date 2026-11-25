import { FormEvent, useEffect, useState } from 'react';
import axios from 'axios';
import Navbar from '../components/Navbar';
import VideoGrid from '../components/VideoGrid';
import { User } from '../types/user';
import { Video } from '../types/video';
import { getEnv } from '../utils/Env';
import './ProfilePage.css';

interface ProfilePageProps {
  user: User | null;
  videos: Video[];
  onProfileUpdate: (user: User) => void;
  onLoginClick: () => void;
  darkMode: boolean;
  onToggleTheme: () => void;
  onSearch: (query: string) => void;
  onProfileClick: () => void;
  onLogout: () => void;
  onVideoClick: (video: Video) => void;
}

export default function ProfilePage({
  user,
  videos,
  onProfileUpdate,
  onLoginClick,
  darkMode,
  onToggleTheme,
  onSearch,
  onProfileClick,
  onLogout,
  onVideoClick,
}: ProfilePageProps) {
  const [name, setName] = useState(user?.name ?? '');
  const [lastname, setLastname] = useState(user?.lastname ?? '');
  const [saving, setSaving] = useState(false);
  const [saveError, setSaveError] = useState('');
  const [saved, setSaved] = useState(false);
  const [loggingOut, setLoggingOut] = useState(false);
  const [logoutError, setLogoutError] = useState('');
  const [likedVideos, setLikedVideos] = useState<Video[]>([]);
  const [likedVideosLoading, setLikedVideosLoading] = useState(true);
  const [likedVideosError, setLikedVideosError] = useState('');

  useEffect(() => {
    setName(user?.name ?? '');
    setLastname(user?.lastname ?? '');
  }, [user]);

  useEffect(() => {
    if (!user) {
      setLikedVideos([]);
      setLikedVideosLoading(false);
      return;
    }

    let active = true;
    const fetchLikedVideos = async () => {
      setLikedVideosLoading(true);
      setLikedVideosError('');
      try {
        const response = await axios.get<Video[]>(`${getEnv().API_BASE_URL}/users/me/liked-videos`, {
          withCredentials: true,
        });
        if (active) setLikedVideos(response.data);
      } catch {
        if (active) setLikedVideosError('Your liked videos could not be loaded. Please try again.');
      } finally {
        if (active) setLikedVideosLoading(false);
      }
    };

    fetchLikedVideos();
    return () => {
      active = false;
    };
  }, [user]);

  const handleProfileSave = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    if (!user) return;

    setSaving(true);
    setSaveError('');
    setSaved(false);
    try {
      const response = await axios.patch<User>(`${getEnv().API_BASE_URL}/users/${user.id}`, {
        ...user,
        name: name.trim(),
        lastname: lastname.trim(),
      }, { withCredentials: true });
      onProfileUpdate(response.data);
      setName(response.data.name);
      setLastname(response.data.lastname ?? '');
      setSaved(true);
    } catch {
      setSaveError('Your profile could not be saved. Please try again.');
    } finally {
      setSaving(false);
    }
  };

  const handleLogout = async () => {
    setLoggingOut(true);
    setLogoutError('');
    try {
      // El backend invalida la sessió i esborra la cookie JSESSIONID (respon 204)
      await axios.post(`${getEnv().API_BASE_URL}/auth/logout`, null, { withCredentials: true });
      onLogout();
    } catch {
      setLogoutError('You could not be logged out. Please try again.');
      setLoggingOut(false);
    }
  };

  const ownVideos = user ? videos.filter((video) => video.channelName === user.name) : [];

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
      <main className="profile-page">
        {!user ? (
          <p role="status">Log in to view your profile.</p>
        ) : (
          <>
            <section className="profile-details" aria-labelledby="profile-heading">
              <h1 id="profile-heading">Profile</h1>
              <form className="profile-form" onSubmit={handleProfileSave}>
                <label htmlFor="profile-name">Name</label>
                <input
                  id="profile-name"
                  name="name"
                  value={name}
                  onChange={(event) => setName(event.target.value)}
                  required
                />
                <label htmlFor="profile-lastname">Surname</label>
                <input
                  id="profile-lastname"
                  name="lastname"
                  value={lastname}
                  onChange={(event) => setLastname(event.target.value)}
                  required
                />
                <button type="submit" className="profile-primary-button" disabled={saving}>
                  {saving ? 'Saving...' : 'Save changes'}
                </button>
                {saved && <p className="profile-save-message" role="status">Profile saved.</p>}
                {saveError && <p className="profile-error-message" role="alert">{saveError}</p>}
              </form>
            </section>

            <hr className="profile-divider" />

            <section className="profile-videos" aria-labelledby="profile-videos-heading">
              <div className="profile-videos-header">
                <h2 id="profile-videos-heading">Your videos</h2>
                <button type="button" className="profile-primary-button">
                  Upload video
                </button>
              </div>
              {ownVideos.length ? (
                <VideoGrid videos={ownVideos} onVideoClick={onVideoClick} />
              ) : (
                <p className="profile-empty-state">You haven’t uploaded any videos yet.</p>
              )}
            </section>

            <hr className="profile-divider" />

            <section className="profile-videos" aria-labelledby="liked-videos-heading">
              <h2 id="liked-videos-heading">Liked videos</h2>
              {likedVideosLoading ? (
                <p role="status">Loading liked videos...</p>
              ) : likedVideosError ? (
                <p role="alert">{likedVideosError}</p>
              ) : likedVideos.length ? (
                <VideoGrid videos={likedVideos} onVideoClick={onVideoClick} />
              ) : (
                <p className="profile-empty-state">You haven’t liked any videos yet.</p>
              )}
            </section>

            <button
              type="button"
              className="profile-logout-button"
              onClick={handleLogout}
              disabled={loggingOut}
            >
              {loggingOut ? 'Logging out...' : 'Log out'}
            </button>
            {logoutError && <p className="profile-error-message" role="alert">{logoutError}</p>}
          </>
        )}
      </main>
    </>
  );
}

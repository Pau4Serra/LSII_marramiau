import { useState } from 'react';
import { User } from '../types/user';
import './Navbar.css';

interface NavbarProps {
  user?: User | null;
  onSearch?: (query: string) => void;
  onLoginClick?: () => void;
  onProfileClick?: () => void;
  darkMode?: boolean;
  onToggleTheme?: () => void;
}

export const Navbar = ({
  user,
  onSearch,
  onLoginClick,
  onProfileClick,
  darkMode = false,
  onToggleTheme,
}: NavbarProps) => {
  const [query, setQuery] = useState('');

  const handleSearchSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (onSearch) {
      onSearch(query);
    }
  };

  return (
    <header className="navbar-header">
      <div className="navbar-container">
        {/* Left: Brand Logo & Name */}
        <div className="navbar-brand">
          <a href="/" className="navbar-logo-link">
            <img src="/protube-logo-no-bg.png" alt="ProTube Logo" className="navbar-logo" />
            <span className="navbar-brand-name">ProTube</span>
          </a>
        </div>

        {/* Center: Search Bar (expands responsively) */}
        <form className="navbar-search-form" onSubmit={handleSearchSubmit}>
          <div className="navbar-search-wrapper">
            <input
              type="text"
              className="navbar-search-input"
              placeholder="Search"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              aria-label="Search"
            />
            <button type="submit" className="navbar-search-btn" aria-label="Search button">
              <svg
                width="16"
                height="16"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2.5"
                strokeLinecap="round"
                strokeLinejoin="round"
                className="search-icon"
              >
                <circle cx="11" cy="11" r="8" />
                <line x1="21" y1="21" x2="16.65" y2="16.65" />
              </svg>
            </button>
          </div>
        </form>

        {/* Right: Auth / Profile */}
        <div className="navbar-right">
          <button
            type="button"
            className="navbar-theme-toggle"
            aria-label={darkMode ? 'Enable light mode' : 'Enable dark mode'}
            aria-pressed={darkMode}
            onClick={onToggleTheme}
          >
            {darkMode ? (
              <svg className="navbar-theme-icon" viewBox="0 0 24 24" aria-hidden="true">
                <path d="M20.9 13A8.5 8.5 0 0 1 11 3.1 8.5 8.5 0 1 0 20.9 13Z" />
              </svg>
            ) : (
              <svg className="navbar-theme-icon" viewBox="0 0 24 24" aria-hidden="true">
                <circle cx="12" cy="12" r="4" />
                <path d="M12 2v2m0 16v2M4.93 4.93l1.42 1.42m11.3 11.3 1.42 1.42M2 12h2m16 0h2M4.93 19.07l1.42-1.42m11.3-11.3 1.42-1.42" />
              </svg>
            )}
          </button>
          {!user ? (
            <button type="button" className="navbar-login-btn" onClick={onLoginClick}>
              Log in
            </button>
          ) : null}
          {user ? (
            <button type="button" className="navbar-profile-btn" onClick={onProfileClick} aria-label="View profile">
              {user.pictureUrl ? (
                <img
                  src={user.pictureUrl}
                  alt={user.name || 'User avatar'}
                  className="navbar-avatar-img"
                  referrerPolicy="no-referrer"
                />
              ) : (
                <span className="navbar-avatar-placeholder" aria-hidden="true" />
              )}
            </button>
          ) : (
            <div className="navbar-avatar-placeholder" aria-label="User avatar" />
          )}
        </div>
      </div>
    </header>
  );
};

export default Navbar;

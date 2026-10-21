import { useState } from 'react';
import './Navbar.css';

interface NavbarProps {
  onSearch?: (query: string) => void;
  onLoginClick?: () => void;
}

export const Navbar = ({ onSearch, onLoginClick }: NavbarProps) => {
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
              placeholder=""
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
          <button type="button" className="navbar-login-btn" onClick={onLoginClick}>
            Log in
          </button>
          <div className="navbar-avatar-placeholder" aria-label="User avatar" />
        </div>
      </div>
    </header>
  );
};

export default Navbar;

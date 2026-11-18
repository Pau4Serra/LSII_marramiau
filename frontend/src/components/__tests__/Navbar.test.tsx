import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import Navbar from '../Navbar';
import { User } from '../../types/user';

describe('Navbar component', () => {
  it('renders branding, search bar and login button when user is not logged in', () => {
    render(<Navbar />);

    expect(screen.getByAltText('ProTube Logo')).toBeInTheDocument();
    expect(screen.getByText('ProTube')).toBeInTheDocument();
    expect(screen.getByPlaceholderText('')).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /search button/i })).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /log in/i })).toBeInTheDocument();
    expect(screen.getByLabelText('User avatar')).toBeInTheDocument();
  });

  it('handles search input and form submission', () => {
    const handleSearch = jest.fn();
    render(<Navbar onSearch={handleSearch} />);

    const input = screen.getByLabelText('Search');
    fireEvent.change(input, { target: { value: 'cat videos' } });
    expect(input).toHaveValue('cat videos');

    const searchBtn = screen.getByRole('button', { name: /search button/i });
    fireEvent.click(searchBtn);
    expect(handleSearch).toHaveBeenCalledWith('cat videos');
  });

  it('handles login button click', () => {
    const handleLogin = jest.fn();
    render(<Navbar onLoginClick={handleLogin} />);

    const loginBtn = screen.getByRole('button', { name: /log in/i });
    fireEvent.click(loginBtn);
    expect(handleLogin).toHaveBeenCalledTimes(1);
  });

  it('shows a sun in light mode and switches theme when clicked', () => {
    const handleThemeToggle = jest.fn();
    const { rerender } = render(<Navbar onToggleTheme={handleThemeToggle} />);

    const lightModeButton = screen.getByRole('button', { name: 'Enable dark mode' });
    expect(lightModeButton.querySelector('svg')).toHaveAttribute('viewBox', '0 0 24 24');
    expect(lightModeButton.querySelector('circle')).toBeInTheDocument();
    fireEvent.click(lightModeButton);
    expect(handleThemeToggle).toHaveBeenCalledTimes(1);

    rerender(<Navbar darkMode onToggleTheme={handleThemeToggle} />);
    const darkModeButton = screen.getByRole('button', { name: 'Enable light mode' });
    expect(darkModeButton.querySelector('circle')).not.toBeInTheDocument();
    expect(darkModeButton.querySelector('path')).toBeInTheDocument();
    fireEvent.click(darkModeButton);
    expect(handleThemeToggle).toHaveBeenCalledTimes(2);
  });

  it('renders user profile avatar image and hides login button when user is logged in with picture', () => {
    const mockUser: User = {
      id: '123',
      name: 'John Doe',
      email: 'john@example.com',
      pictureUrl: 'https://example.com/avatar.jpg',
    };

    render(<Navbar user={mockUser} />);

    expect(screen.queryByRole('button', { name: /log in/i })).not.toBeInTheDocument();
    const avatarImg = screen.getByAltText('John Doe');
    expect(avatarImg).toBeInTheDocument();
    expect(avatarImg).toHaveAttribute('src', 'https://example.com/avatar.jpg');
    expect(avatarImg).toHaveAttribute('referrerPolicy', 'no-referrer');
  });

  it('renders avatar placeholder and hides login button when user has no pictureUrl', () => {
    const mockUser: User = {
      id: '456',
      name: 'Jane Doe',
      email: 'jane@example.com',
    };

    render(<Navbar user={mockUser} />);

    expect(screen.queryByRole('button', { name: /log in/i })).not.toBeInTheDocument();
    expect(screen.getByLabelText('User avatar')).toBeInTheDocument();
  });
});

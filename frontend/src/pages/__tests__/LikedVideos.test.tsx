import axios from 'axios';
import { fireEvent, render, screen, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import ProfilePage from '../ProfilePage';
import { User } from '../../types/user';

jest.mock('axios');

const user: User = {
  id: 'user-1',
  name: 'Taylor',
  email: 'taylor@example.com',
};

const props = {
  user,
  videos: [],
  onProfileUpdate: jest.fn(),
  onLoginClick: jest.fn(),
  darkMode: false,
  onToggleTheme: jest.fn(),
  onSearch: jest.fn(),
  onProfileClick: jest.fn(),
  onLogout: jest.fn(),
  onVideoClick: jest.fn(),
};

describe('ProfilePage liked videos', () => {
  it('loads and displays liked videos from the account endpoint', async () => {
    jest.mocked(axios.get).mockResolvedValueOnce({
      data: [{ id: 'liked-video', title: 'A liked video', channelName: 'Creator' }],
    });

    render(<ProfilePage {...props} />);

    expect(await screen.findByText('A liked video')).toBeInTheDocument();
    expect(screen.getByRole('heading', { name: 'Liked videos' })).toBeInTheDocument();
    expect(axios.get).toHaveBeenCalledWith(
      'other/users/me/liked-videos',
      expect.objectContaining({ withCredentials: true }),
    );
    fireEvent.click(screen.getByRole('button', { name: /a liked video/i }));
    expect(props.onVideoClick).toHaveBeenCalledWith(
      expect.objectContaining({ id: 'liked-video', title: 'A liked video' }),
    );
  });

  it('shows an empty state when there are no liked videos', async () => {
    jest.mocked(axios.get).mockResolvedValueOnce({ data: [] });

    render(<ProfilePage {...props} />);

    await waitFor(() => {
      expect(screen.getByText('You haven’t liked any videos yet.')).toBeInTheDocument();
    });
  });
});

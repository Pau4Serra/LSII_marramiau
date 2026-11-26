import { fireEvent, render, screen, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import axios from 'axios';
import ProfilePage from '../ProfilePage';
import { User } from '../../types/user';

jest.mock('axios');

const mockedAxios = axios as jest.Mocked<typeof axios>;

const user: User = {
  id: 'user-1',
  name: 'Taylor',
  lastname: 'Smith',
  email: 'taylor@example.com',
};

const defaultProps = {
  user,
  videos: [
    { id: 'own-video', title: 'My video', channelName: 'Taylor' },
    { id: 'other-video', title: 'Other video', channelName: 'Someone else' },
  ],
  onProfileUpdate: jest.fn(),
  onLoginClick: jest.fn(),
  darkMode: false,
  onToggleTheme: jest.fn(),
  onSearch: jest.fn(),
  onProfileClick: jest.fn(),
  onLogout: jest.fn(),
  onUploadClick: jest.fn(),
};

describe('ProfilePage', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('shows editable profile fields, only the user’s videos, and placeholder actions', () => {
    render(<ProfilePage {...defaultProps} />);

    expect(screen.getByRole('heading', { name: 'Profile' })).toBeInTheDocument();
    expect(screen.getByLabelText('Name')).toHaveValue('Taylor');
    expect(screen.getByLabelText('Surname')).toHaveValue('Smith');
    expect(screen.getByRole('heading', { name: 'Your videos' })).toBeInTheDocument();
    expect(screen.getByText('My video')).toBeInTheDocument();
    expect(screen.queryByText('Other video')).not.toBeInTheDocument();
    expect(screen.getByRole('button', { name: 'Upload video' })).toBeInTheDocument();
    expect(screen.getByRole('button', { name: 'Log out' })).toBeInTheDocument();
  });

  it('shows an empty state when the user has not uploaded videos', () => {
    render(<ProfilePage {...defaultProps} videos={[]} />);

    expect(screen.getByText('You haven’t uploaded any videos yet.')).toBeInTheDocument();
  });

  it('allows editing the profile fields', () => {
    render(<ProfilePage {...defaultProps} />);

    fireEvent.change(screen.getByLabelText('Name'), { target: { value: 'Alex' } });
    expect(screen.getByLabelText('Name')).toHaveValue('Alex');
  });

  it('logs out through the backend and notifies the parent', async () => {
    mockedAxios.post.mockResolvedValueOnce({ status: 204 });
    render(<ProfilePage {...defaultProps} />);

    fireEvent.click(screen.getByRole('button', { name: 'Log out' }));

    await waitFor(() => expect(defaultProps.onLogout).toHaveBeenCalledTimes(1));
    expect(mockedAxios.post).toHaveBeenCalledWith('other/auth/logout', null, { withCredentials: true });
  });

  it('shows an error and keeps the user logged in when logout fails', async () => {
    mockedAxios.post.mockRejectedValueOnce(new Error('Network error'));
    render(<ProfilePage {...defaultProps} />);

    fireEvent.click(screen.getByRole('button', { name: 'Log out' }));

    expect(await screen.findByRole('alert')).toHaveTextContent('You could not be logged out. Please try again.');
    expect(defaultProps.onLogout).not.toHaveBeenCalled();
    expect(screen.getByRole('button', { name: 'Log out' })).toBeEnabled();
  });

});

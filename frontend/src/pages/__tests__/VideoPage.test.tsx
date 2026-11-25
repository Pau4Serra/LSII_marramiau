import axios from 'axios';
import { fireEvent, render, screen, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import VideoPage from '../VideoPage';
import { User } from '../../types/user';

jest.mock('axios');
jest.mock('../../useAllVideos', () => ({
  useAllVideos: () => ({ value: [] }),
}));
jest.mock('../../components/CommentSection', () => () => <div />);

const user: User = {
  id: 'user-1',
  name: 'Taylor',
  email: 'taylor@example.com',
};

const video = {
  id: 'video-1',
  title: 'Test video',
  likeCount: 4,
  videoUrl: 'https://example.com/video.mp4',
};

describe('VideoPage likes', () => {
  beforeEach(() => {
    jest.mocked(axios.get)
      .mockResolvedValueOnce({ data: video })
      .mockResolvedValueOnce({ data: { likeCount: 4, likedByCurrentUser: false } });
  });

  it('loads persistent like state and persists like and unlike changes', async () => {
    jest.mocked(axios.put).mockResolvedValueOnce({ data: { likeCount: 5, likedByCurrentUser: true } });
    jest.mocked(axios.delete).mockResolvedValueOnce({ data: { likeCount: 4, likedByCurrentUser: false } });

    render(<VideoPage videoId="video-1" user={user} />);

    const likeButton = await screen.findByRole('button', { name: 'Like video' });
    await waitFor(() => expect(likeButton).toHaveTextContent('4'));

    fireEvent.click(likeButton);
    const unlikeButton = await screen.findByRole('button', { name: 'Unlike video' });
    expect(unlikeButton).toHaveAttribute('aria-pressed', 'true');
    expect(unlikeButton).toHaveTextContent('5');
    expect(axios.put).toHaveBeenCalledWith('other/videos/video-1/like', null, { withCredentials: true });

    fireEvent.click(unlikeButton);
    const likedAgainButton = await screen.findByRole('button', { name: 'Like video' });
    expect(likedAgainButton).toHaveAttribute('aria-pressed', 'false');
    expect(likedAgainButton).toHaveTextContent('4');
    expect(axios.delete).toHaveBeenCalledWith('other/videos/video-1/like', { withCredentials: true });
  });

  it('asks logged-out visitors to log in instead of changing likes', async () => {
    const onLoginClick = jest.fn();
    render(<VideoPage videoId="video-1" user={null} onLoginClick={onLoginClick} />);

    fireEvent.click(await screen.findByRole('button', { name: 'Like video' }));

    expect(onLoginClick).toHaveBeenCalledTimes(1);
    expect(axios.put).not.toHaveBeenCalled();
    expect(axios.delete).not.toHaveBeenCalled();
  });

  it('shows an error when the persisted like request fails', async () => {
    jest.mocked(axios.put).mockRejectedValueOnce(new Error('request failed'));
    render(<VideoPage videoId="video-1" user={user} />);

    fireEvent.click(await screen.findByRole('button', { name: 'Like video' }));

    expect(await screen.findByRole('alert')).toHaveTextContent('Could not update the video like.');
  });
});

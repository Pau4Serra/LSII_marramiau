import { fireEvent, render, screen, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import axios from 'axios';
import CommentSection from '../CommentSection';
import { Comment } from '../../types/comment';
import { User } from '../../types/user';

jest.mock('axios');

const mockedAxios = axios as jest.Mocked<typeof axios>;

const user: User = { id: 'user-1', name: 'Taylor', email: 'taylor@example.com' };

const makeComment = (id: string, content: string): Comment => ({
  id,
  author: { userId: 'user-2', name: 'Alex' },
  content,
  createdAt: '2026-11-20T10:00:00Z',
  likeCount: 0,
  likedByCurrentUser: false,
  replies: [],
});

describe('CommentSection', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('loads and shows the comments of the video', async () => {
    mockedAxios.get.mockResolvedValue({ data: [makeComment('c1', 'Great video!')] });

    render(<CommentSection videoId="video-1" user={null} />);

    expect(await screen.findByText('Great video!')).toBeInTheDocument();
    expect(screen.getByRole('heading', { name: '1 comments' })).toBeInTheDocument();
    expect(mockedAxios.get).toHaveBeenCalledWith('other/videos/video-1/comments', { withCredentials: true });
  });

  it('asks anonymous users to log in instead of showing the form', async () => {
    mockedAxios.get.mockResolvedValue({ data: [] });
    const onLoginClick = jest.fn();

    render(<CommentSection videoId="video-1" user={null} onLoginClick={onLoginClick} />);

    await waitFor(() => expect(screen.queryByRole('status')).not.toBeInTheDocument());
    expect(screen.queryByLabelText('Add a comment')).not.toBeInTheDocument();
    fireEvent.click(screen.getByRole('button', { name: 'Log in' }));
    expect(onLoginClick).toHaveBeenCalled();
  });

  it('posts a new comment and adds it to the top of the list', async () => {
    mockedAxios.get.mockResolvedValue({ data: [makeComment('c1', 'Old comment')] });
    mockedAxios.post.mockResolvedValue({ data: makeComment('c2', 'New comment') });

    render(<CommentSection videoId="video-1" user={user} />);
    await screen.findByText('Old comment');

    fireEvent.change(screen.getByLabelText('Add a comment'), { target: { value: '  New comment ' } });
    fireEvent.click(screen.getByRole('button', { name: 'Comment' }));

    expect(await screen.findByText('New comment')).toBeInTheDocument();
    expect(mockedAxios.post).toHaveBeenCalledWith(
      'other/videos/video-1/comments',
      { content: 'New comment' },
      { withCredentials: true }
    );
    expect(screen.getAllByRole('listitem')[0]).toHaveTextContent('New comment');
    expect(screen.getByLabelText('Add a comment')).toHaveValue('');
  });

  it('shows errors when loading or posting fails', async () => {
    mockedAxios.get.mockRejectedValue(new Error('fail'));
    mockedAxios.post.mockRejectedValue(new Error('fail'));

    render(<CommentSection videoId="video-1" user={user} />);
    expect(await screen.findByRole('alert')).toHaveTextContent('Could not load comments.');

    fireEvent.change(screen.getByLabelText('Add a comment'), { target: { value: 'Hi' } });
    fireEvent.click(screen.getByRole('button', { name: 'Comment' }));
    await waitFor(() => expect(screen.getByRole('alert')).toHaveTextContent('Could not post your comment.'));
  });
});

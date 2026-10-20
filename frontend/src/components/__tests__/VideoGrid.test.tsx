import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import VideoGrid from '../VideoGrid';

describe('VideoGrid component', () => {
  it('renders default placeholder cards when no videos provided', () => {
    const { container } = render(<VideoGrid />);
    const placeholders = container.querySelectorAll('.video-card--placeholder');
    expect(placeholders.length).toBe(9);
  });

  it('renders video cards when videos list is provided', () => {
    const mockVideos = [
      { id: 1, title: 'Video 1 test' },
      { id: 2, title: 'Video 2 test' },
    ];
    render(<VideoGrid videos={mockVideos} />);
    expect(screen.getByText('Video 1 test')).toBeInTheDocument();
    expect(screen.getByText('Video 2 test')).toBeInTheDocument();
  });
});

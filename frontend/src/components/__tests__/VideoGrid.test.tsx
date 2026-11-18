import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import VideoGrid from '../VideoGrid';

describe('VideoGrid component', () => {
  beforeEach(() => {
    window.scrollTo = jest.fn();
  });

  it('renders default 15 placeholder cards when no videos provided', () => {
    const { container } = render(<VideoGrid />);
    const placeholders = container.querySelectorAll('.video-card--placeholder');
    expect(placeholders.length).toBe(15);
  });

  it('respects custom placeholderCount', () => {
    const { container } = render(<VideoGrid placeholderCount={6} />);
    const placeholders = container.querySelectorAll('.video-card--placeholder');
    expect(placeholders.length).toBe(6);
  });

  it('renders video cards without pagination when videos <= itemsPerPage', () => {
    const mockVideos = [
      { id: 1, title: 'Video 1 test' },
      { id: 2, title: 'Video 2 test' },
    ];
    render(<VideoGrid videos={mockVideos} itemsPerPage={15} />);
    expect(screen.getByText('Video 1 test')).toBeInTheDocument();
    expect(screen.getByText('Video 2 test')).toBeInTheDocument();
    expect(screen.queryByRole('navigation')).not.toBeInTheDocument();
  });

  it('paginates videos correctly and navigates between pages', () => {
    const mockVideos = Array.from({ length: 25 }, (_, i) => ({
      id: i + 1,
      title: `Video ${i + 1}`,
    }));

    render(<VideoGrid videos={mockVideos} itemsPerPage={15} />);

    // Page 1 should display 15 videos (Video 1 to Video 15)
    expect(screen.getByText('Video 1')).toBeInTheDocument();
    expect(screen.getByText('Video 15')).toBeInTheDocument();
    expect(screen.queryByText('Video 16')).not.toBeInTheDocument();

    const nextBtn = screen.getByRole('button', { name: 'Pàgina següent' });
    expect(nextBtn).toBeEnabled();

    // Click next page
    fireEvent.click(nextBtn);

    // Page 2 should display remaining 10 videos (Video 16 to Video 25)
    expect(screen.queryByText('Video 1')).not.toBeInTheDocument();
    expect(screen.getByText('Video 16')).toBeInTheDocument();
    expect(screen.getByText('Video 25')).toBeInTheDocument();
    expect(window.scrollTo).toHaveBeenCalledWith({ top: 0, behavior: 'smooth' });
  });

  it('supports controlled page prop and calls onPageChange and onVideoClick', () => {
    const onPageChange = jest.fn();
    const onVideoClick = jest.fn();
    const mockVideos = Array.from({ length: 20 }, (_, i) => ({
      id: i + 1,
      title: `Video ${i + 1}`,
    }));

    const { rerender } = render(
      <VideoGrid
        videos={mockVideos}
        itemsPerPage={15}
        currentPage={1}
        onPageChange={onPageChange}
        onVideoClick={onVideoClick}
      />
    );

    const nextBtn = screen.getByRole('button', { name: 'Pàgina següent' });
    fireEvent.click(nextBtn);
    expect(onPageChange).toHaveBeenCalledWith(2);

    // Rerender as controlled page 2
    rerender(
      <VideoGrid
        videos={mockVideos}
        itemsPerPage={15}
        currentPage={2}
        onPageChange={onPageChange}
        onVideoClick={onVideoClick}
      />
    );

    expect(screen.getByText('Video 16')).toBeInTheDocument();

    const video16 = screen.getByText('Video 16');
    fireEvent.click(video16);
    expect(onVideoClick).toHaveBeenCalledWith(mockVideos[15]);
  });
});

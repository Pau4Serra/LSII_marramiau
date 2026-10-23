import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import VideoCard, { formatViews } from '../VideoCard';

describe('VideoCard component', () => {
  it('renders placeholder when no video is provided', () => {
    const { container } = render(<VideoCard />);
    expect(container.querySelector('.video-card--placeholder')).toBeInTheDocument();
    expect(container.querySelector('.video-thumbnail-placeholder')).toBeInTheDocument();
    expect(container.querySelector('.video-title-placeholder')).toBeInTheDocument();
  });

  it('renders video details with thumbnail, channel and formatted views', () => {
    const mockClick = jest.fn();
    const mockVideo = {
      id: 1,
      title: 'Amazing Video',
      thumbnail: 'https://example.com/thumb.jpg',
      channelName: 'ProTube Channel',
      viewsCount: 1200,
    };

    render(<VideoCard video={mockVideo} onClick={mockClick} />);

    expect(screen.getByText('Amazing Video')).toBeInTheDocument();
    expect(screen.getByText('ProTube Channel')).toBeInTheDocument();
    expect(screen.getByText('1.2 K vistas')).toBeInTheDocument();
    const img = screen.getByRole('img');
    expect(img).toHaveAttribute('src', 'https://example.com/thumb.jpg');

    const card = screen.getByRole('button');
    fireEvent.click(card);
    expect(mockClick).toHaveBeenCalledWith(mockVideo);

    fireEvent.keyDown(card, { key: 'Enter' });
    expect(mockClick).toHaveBeenCalledTimes(2);

    fireEvent.keyDown(card, { key: ' ' });
    expect(mockClick).toHaveBeenCalledTimes(3);

    fireEvent.keyDown(card, { key: 'ArrowDown' });
    expect(mockClick).toHaveBeenCalledTimes(3);
  });

  it('renders fallback thumbnail when video has no thumbnail', () => {
    const { container } = render(<VideoCard video={{ id: 2, title: 'No Thumb' }} />);
    expect(screen.getByText('No Thumb')).toBeInTheDocument();
    expect(container.querySelector('.video-thumbnail-fallback')).toBeInTheDocument();
  });

  describe('formatViews', () => {
    it('formats numbers under 1000 without suffix', () => {
      expect(formatViews(0)).toBe('0');
      expect(formatViews(550)).toBe('550');
    });

    it('formats thousands with K suffix', () => {
      expect(formatViews(1000)).toBe('1 K');
      expect(formatViews(1500)).toBe('1.5 K');
      expect(formatViews(85400)).toBe('85.4 K');
    });

    it('formats millions with M suffix', () => {
      expect(formatViews(1000000)).toBe('1 M');
      expect(formatViews(2450000)).toBe('2.5 M');
    });

    it('handles string input or empty values', () => {
      expect(formatViews('1500')).toBe('1.5 K');
      expect(formatViews(undefined)).toBe('');
    });
  });
});

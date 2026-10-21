import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import VideoCard from '../VideoCard';

describe('VideoCard component', () => {
  it('renders placeholder when no video is provided', () => {
    const { container } = render(<VideoCard />);
    expect(container.querySelector('.video-card--placeholder')).toBeInTheDocument();
    expect(container.querySelector('.video-thumbnail-placeholder')).toBeInTheDocument();
    expect(container.querySelector('.video-title-placeholder')).toBeInTheDocument();
  });

  it('renders video details with thumbnail, channel and views', () => {
    const mockClick = jest.fn();
    const mockVideo = {
      id: 1,
      title: 'Amazing Video',
      thumbnailUrl: 'https://example.com/thumb.jpg',
      channel: 'ProTube Channel',
      views: 1200,
    };

    render(<VideoCard video={mockVideo} onClick={mockClick} />);

    expect(screen.getByText('Amazing Video')).toBeInTheDocument();
    expect(screen.getByText('ProTube Channel')).toBeInTheDocument();
    expect(screen.getByText('1200 vistas')).toBeInTheDocument();
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

  it('renders fallback thumbnail when video has no thumbnailUrl', () => {
    const { container } = render(<VideoCard video={{ id: 2, title: 'No Thumb' }} />);
    expect(screen.getByText('No Thumb')).toBeInTheDocument();
    expect(container.querySelector('.video-thumbnail-fallback')).toBeInTheDocument();
  });
});

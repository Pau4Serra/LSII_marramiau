import { fireEvent, render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import UploadPage from '../UploadPage';
import { User } from '../../types/user';

const user: User = {
  id: 'user-1',
  name: 'Taylor',
  email: 'taylor@example.com',
};

const props = {
  user,
  onLoginClick: jest.fn(),
  onProfileClick: jest.fn(),
  onSearch: jest.fn(),
  darkMode: false,
  onToggleTheme: jest.fn(),
};

describe('UploadPage', () => {
  beforeEach(() => {
    URL.createObjectURL = jest.fn(() => 'blob:video-preview');
    URL.revokeObjectURL = jest.fn();
  });

  it('lets the user enter video details and extracts duration from the selected file', () => {
    const originalCreateElement = document.createElement.bind(document);
    let mediaElement: HTMLVideoElement | undefined;
    const createElementSpy = jest.spyOn(document, 'createElement').mockImplementation((tagName, options) => {
      const element = originalCreateElement(tagName, options);
      if (tagName === 'video') {
        mediaElement = element as HTMLVideoElement;
        Object.defineProperty(mediaElement, 'duration', { configurable: true, value: 83.2 });
      }
      if (tagName === 'canvas') {
        Object.defineProperty(element, 'getContext', {
          configurable: true,
          value: () => ({ drawImage: jest.fn() }),
        });
        Object.defineProperty(element, 'toDataURL', {
          configurable: true,
          value: () => 'data:image/jpeg;base64,preview',
        });
      }
      return element;
    });

    render(<UploadPage {...props} />);

    fireEvent.change(screen.getByLabelText('Video title'), { target: { value: 'A new video' } });
    fireEvent.change(screen.getByLabelText('Description'), { target: { value: 'Video details' } });
    fireEvent.change(screen.getByLabelText('Choose a video file'), {
      target: { files: [new File(['video-content'], 'sample.mp4', { type: 'video/mp4' })] },
    });

    expect(screen.getByLabelText('Video title')).toHaveValue('A new video');
    expect(screen.getByLabelText('Description')).toHaveValue('Video details');
    expect(screen.getByText('sample.mp4')).toBeInTheDocument();
    expect(screen.queryByLabelText(/duration/i)).not.toBeInTheDocument();

    if (!mediaElement) throw new Error('Expected a video metadata element');
    fireEvent.loadedMetadata(mediaElement);
    fireEvent.loadedData(mediaElement);

    expect(screen.queryByLabelText(/duration/i)).not.toBeInTheDocument();
    expect(document.querySelector<HTMLInputElement>('input[name="duration"]')).toHaveValue('84');
    expect(screen.getByRole('img', { name: 'Video thumbnail preview' })).toHaveAttribute(
      'src',
      'data:image/jpeg;base64,preview',
    );
    expect(screen.getByRole('button', { name: 'Back to profile' }).querySelector('svg')).toBeInTheDocument();
    expect(screen.getByRole('button', { name: 'Upload video' })).toBeDisabled();
    createElementSpy.mockRestore();
  });

  it('shows an error when the selected file duration cannot be read', () => {
    const originalCreateElement = document.createElement.bind(document);
    let mediaElement: HTMLVideoElement | undefined;
    const createElementSpy = jest.spyOn(document, 'createElement').mockImplementation((tagName, options) => {
      const element = originalCreateElement(tagName, options);
      if (tagName === 'video') {
        mediaElement = element as HTMLVideoElement;
        Object.defineProperty(mediaElement, 'duration', { configurable: true, value: Number.NaN });
      }
      return element;
    });

    render(<UploadPage {...props} />);
    fireEvent.change(screen.getByLabelText('Choose a video file'), {
      target: { files: [new File(['video-content'], 'sample.mp4', { type: 'video/mp4' })] },
    });

    if (!mediaElement) throw new Error('Expected a video metadata element');
    fireEvent.loadedMetadata(mediaElement);

    expect(screen.getByRole('alert')).toHaveTextContent('Could not read the duration');
    expect(screen.queryByLabelText(/duration/i)).not.toBeInTheDocument();
    expect(document.querySelector<HTMLInputElement>('input[name="duration"]')).toHaveValue('');
    createElementSpy.mockRestore();
  });
});

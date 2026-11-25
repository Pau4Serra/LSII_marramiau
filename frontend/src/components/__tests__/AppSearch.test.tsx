import axios from 'axios';
import { fireEvent, render, screen, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import App from '../../App';

jest.mock('axios');

const mockVideos = [
  { id: 1, title: 'Primer vídeo' },
  { id: 2, title: 'Segon vídeo' },
];

// Respon segons la URL: /users/me falla (sense sessió), /videos retorna el llistat i /videos/search/... la cerca
const mockGet = (searchResults: unknown[]) => {
  jest.mocked(axios.get).mockImplementation((url: string) => {
    if (url.endsWith('/users/me')) {
      return Promise.reject(new Error('Unauthorized'));
    }
    if (url.includes('/videos/search/')) {
      return Promise.resolve({ status: 200, data: searchResults });
    }
    return Promise.resolve({ status: 200, data: mockVideos });
  });
};

const search = (query: string) => {
  fireEvent.change(screen.getByRole('textbox', { name: 'Search' }), { target: { value: query } });
  fireEvent.click(screen.getByRole('button', { name: 'Search button' }));
};

describe('App search results', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    window.history.pushState({}, '', '/');
  });

  it('shows the empty state with the searched term when the search returns no videos', async () => {
    mockGet([]);
    render(<App />);
    expect(await screen.findByText('Primer vídeo')).toBeInTheDocument();

    search('zzzz');

    expect(await screen.findByRole('heading', { name: 'No videos found' })).toBeInTheDocument();
    expect(screen.getByText('"zzzz"')).toBeInTheDocument();
    expect(screen.queryByText('Primer vídeo')).not.toBeInTheDocument();
    expect(screen.queryByRole('region', { name: 'Videos Grid' })).not.toBeInTheDocument();
    expect(axios.get).toHaveBeenCalledWith(expect.stringMatching(/\/videos\/search\/zzzz$/));
  });

  it('keeps showing the video grid when the search returns videos', async () => {
    mockGet([{ id: 3, title: 'Resultat de cerca' }]);
    render(<App />);
    await screen.findByText('Primer vídeo');

    search('resultat');

    expect(await screen.findByText('Resultat de cerca')).toBeInTheDocument();
    expect(screen.queryByRole('heading', { name: 'No videos found' })).not.toBeInTheDocument();
  });

  it('goes back to the grid after an empty search when searching with an empty term', async () => {
    mockGet([]);
    render(<App />);
    await screen.findByText('Primer vídeo');

    search('zzzz');
    await screen.findByRole('heading', { name: 'No videos found' });

    search('');

    await waitFor(() => expect(screen.getByText('Primer vídeo')).toBeInTheDocument());
    expect(screen.queryByRole('heading', { name: 'No videos found' })).not.toBeInTheDocument();
  });
});

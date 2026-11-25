import { useEffect, useState, useCallback } from 'react';
import axios, { AxiosError } from 'axios';
import { getEnv } from './utils/Env';
import { Video } from './types/video';

type LoadingState = 'loading' | 'success' | 'error' | 'idle';

// URL base per a les peticions de vídeos a l'API
const ALL_VIDEOS_URL = `${getEnv().API_BASE_URL}/videos`;

// Estructura de les dades del vídeo retornades pel backend
interface ApiVideo {
  id: string | number;
  title: string;
  thumbnail?: string;
  channelName?: string;
  viewsCount?: number | string;
  uploadDate?: string;
  duration?: number | string;
}

/**
 * Normalitza el llistat de vídeos rebut de l'API per adaptar-lo al tipus Video del frontend.
 */
const normalizeVideos = (data: (string | ApiVideo)[]): Video[] => {
  return data.map((item: string | ApiVideo, idx: number) => {
    if (typeof item === 'string') {
      return { id: idx, title: item };
    }

    return {
      id: item.id,
      title: item.title,
      thumbnail: item.thumbnail,
      channelName: item.channelName,
      viewsCount: item.viewsCount,
      createdAt: item.uploadDate,
      duration: item.duration,
    };
  });
};

/**
 * Hook personalitzat per obtenir i filtrar vídeos.
 * Permet carregar tots els vídeos per defecte o buscar-ne mitjançant una consulta de text.
 */
export function useAllVideos() {
  const [value, setValue] = useState<Video[]>([]);
  const [message, setMessage] = useState<string>('Loading...');
  const [loading, setLoading] = useState<LoadingState>('idle');
  // Últim terme de cerca enviat (buit si es mostren tots els vídeos)
  const [searchQuery, setSearchQuery] = useState<string>('');

  // Funció per carregar tots els vídeos o fer la cerca al backend segons si s'especifica `query`
  const fetchVideos = useCallback(async (query?: string) => {
    try {
      setLoading('loading');
      const trimmedQuery = query?.trim();
      setSearchQuery(trimmedQuery ?? '');
      // Si hi ha terme de cerca, consulta a l'endpoint de cerca (/search/{query}); altrament, consulta el llistat complet (/videos)
      const url = trimmedQuery ? `${ALL_VIDEOS_URL}/search/${encodeURIComponent(trimmedQuery)}` : ALL_VIDEOS_URL;

      const response = await axios.get(url);
      if (response.status === 200 && Array.isArray(response.data)) {
        setValue(normalizeVideos(response.data));
      }
      setLoading('success');
    } catch (error: unknown) {
      setLoading('error');
      setMessage('Error fetching videos: ' + (error as AxiosError).message);
    }
  }, []);

  // Càrrega inicial de vídeos en muntar el component
  useEffect(() => {
    fetchVideos();
  }, [fetchVideos]);

  return { value, message, loading, searchQuery, searchVideos: fetchVideos };
}

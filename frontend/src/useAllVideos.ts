import { useEffect, useState } from 'react';
import axios, { AxiosError } from 'axios';
import { getEnv } from './utils/Env';
import { Video } from './types/video';

type LoadingState = 'loading' | 'success' | 'error' | 'idle';

const ALL_VIDEOS_URL = `${getEnv().API_BASE_URL}/videos`;

export function useAllVideos() {
  const [value, setValue] = useState<Video[]>([]);
  const [message, setMessage] = useState<string>('Loading...');
  const [loading, setLoading] = useState<LoadingState>('idle');

  useEffect(() => {
    const getVideos = async () => {
      try {
        setLoading('loading');
        const response = await axios.get(ALL_VIDEOS_URL);
        if (response.status === 200 && Array.isArray(response.data)) {
          const normalized: Video[] = response.data.map((item, idx) => {
            if (typeof item === 'string') {
              return { id: idx, title: item };
            }
            return item;
          });
          setValue(normalized);
        }
        setLoading('success');
      } catch (error: unknown) {
        setLoading('error');
        setMessage('Error fetching videos: ' + (error as AxiosError).message);
      }
    };
    getVideos();
  }, []);

  return { value, message, loading };
}

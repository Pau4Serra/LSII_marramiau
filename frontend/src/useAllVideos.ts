import { useEffect, useState } from 'react';
import axios, { AxiosError } from 'axios';
import { getEnv } from './utils/Env';
import { Video } from './types/video';

type LoadingState = 'loading' | 'success' | 'error' | 'idle';

const ALL_VIDEOS_URL = `${getEnv().API_BASE_URL}/videos`;

interface ApiVideo {
  id: string | number;
  title: string;
  thumbnail?: string;
  channelName?: string;
  viewsCount?: number | string;
  uploadDate?: string;
  duration?: number | string;
}

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
          const normalized: Video[] = response.data.map((item: string | ApiVideo, idx: number) => {
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

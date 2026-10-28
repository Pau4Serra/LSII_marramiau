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
}

const resolveMediaUrl = (url?: string) => {
  if (!url) {
    return undefined;
  }

  if (url.startsWith('http')) {
    return url;
  }

  return `${getEnv().MEDIA_BASE_URL}${url.replace(/^\/media/, '')}`;
};

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
              thumbnailUrl: resolveMediaUrl(item.thumbnail),
              channel: item.channelName,
              views: item.viewsCount,
              createdAt: item.uploadDate,
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

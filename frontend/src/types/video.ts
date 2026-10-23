export interface Video {
  id: string | number;
  title: string;
  thumbnailUrl?: string;
  channel?: string;
  views?: number | string;
  createdAt?: string;
}

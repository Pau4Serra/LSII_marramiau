export interface Video {
  id: string | number;
  title: string;
  thumbnail?: string;
  channelName?: string;
  viewsCount?: number | string;
  createdAt?: string;
}

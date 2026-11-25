export interface CommentAuthor {
  userId: string;
  name: string;
  pictureUrl?: string;
}

export interface Comment {
  id: string;
  author: CommentAuthor;
  content: string;
  createdAt: string;
  likeCount: number;
  likedByCurrentUser: boolean;
  replies: Comment[];
}

export interface CommentLike {
  commentId: string;
  likeCount: number;
  likedByCurrentUser: boolean;
}

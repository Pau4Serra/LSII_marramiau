import { FormEvent, useEffect, useState } from 'react';
import axios from 'axios';
import { getEnv } from '../utils/Env';
import { Comment, CommentLike } from '../types/comment';
import { User } from '../types/user';
import './CommentSection.css';

interface CommentSectionProps {
  videoId: string;
  user?: User | null;
  onLoginClick?: () => void;
}

const MAX_LENGTH = 1000;

export default function CommentSection({ videoId, user, onLoginClick }: CommentSectionProps) {
  const [comments, setComments] = useState<Comment[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [content, setContent] = useState('');
  const [posting, setPosting] = useState(false);
  const [replyingTo, setReplyingTo] = useState<string | null>(null);
  const [replyContent, setReplyContent] = useState('');

  useEffect(() => {
    setLoading(true);
    setError(null);
    axios
      .get<Comment[]>(`${getEnv().API_BASE_URL}/videos/${videoId}/comments`, { withCredentials: true })
      .then((response) => setComments(response.data))
      .catch(() => setError('Could not load comments.'))
      .finally(() => setLoading(false));
  }, [videoId]);

  const submit = async (event: FormEvent) => {
    event.preventDefault();
    const text = content.trim();
    if (!text) return;

    setPosting(true);
    setError(null);
    try {
      const response = await axios.post<Comment>(
        `${getEnv().API_BASE_URL}/videos/${videoId}/comments`,
        { content: text },
        { withCredentials: true }
      );
      // El comentari nou va a dalt de tot
      setComments((current) => [response.data, ...current]);
      setContent('');
    } catch {
      setError('Could not post your comment.');
    } finally {
      setPosting(false);
    }
  };

  const submitReply = async (event: FormEvent, parentId: string) => {
    event.preventDefault();
    const text = replyContent.trim();
    if (!text) return;

    setPosting(true);
    setError(null);
    try {
      const response = await axios.post<Comment>(
        `${getEnv().API_BASE_URL}/comments/${parentId}/replies`,
        { content: text },
        { withCredentials: true }
      );
      // La resposta va al final del fil del comentari pare
      setComments((current) =>
        current.map((comment) =>
          comment.id === parentId ? { ...comment, replies: [...(comment.replies ?? []), response.data] } : comment
        )
      );
      setReplyContent('');
      setReplyingTo(null);
    } catch {
      setError('Could not post your reply.');
    } finally {
      setPosting(false);
    }
  };

  // Aplica un canvi a un comentari, sigui arrel o resposta
  const updateComment = (commentId: string, changes: Partial<Comment>) => {
    setComments((current) =>
      current.map((comment) => {
        if (comment.id === commentId) return { ...comment, ...changes };
        if (!comment.replies?.some((reply) => reply.id === commentId)) return comment;
        return {
          ...comment,
          replies: comment.replies.map((reply) => (reply.id === commentId ? { ...reply, ...changes } : reply)),
        };
      })
    );
  };

  const toggleLike = async (comment: Comment) => {
    if (!user) {
      onLoginClick?.();
      return;
    }

    setError(null);
    const url = `${getEnv().API_BASE_URL}/comments/${comment.id}/like`;
    try {
      const response = comment.likedByCurrentUser
        ? await axios.delete<CommentLike>(url, { withCredentials: true })
        : await axios.put<CommentLike>(url, null, { withCredentials: true });
      updateComment(comment.id, {
        likeCount: response.data.likeCount,
        likedByCurrentUser: response.data.likedByCurrentUser,
      });
    } catch {
      setError('Could not update the like.');
    }
  };

  const toggleReply = (commentId: string) => {
    setReplyingTo((current) => (current === commentId ? null : commentId));
    setReplyContent('');
  };

  const renderComment = (comment: Comment, isReply = false) => (
    <li key={comment.id} className={`comment-item${isReply ? ' comment-item--reply' : ''}`}>
      {comment.author.pictureUrl ? (
        <img className="comment-avatar" src={comment.author.pictureUrl} alt="" />
      ) : (
        <span className="comment-avatar" aria-hidden="true">
          {comment.author.name.charAt(0)}
        </span>
      )}
      <div className="comment-body">
        <p className="comment-meta">
          <strong>{comment.author.name}</strong>
          <span>{new Date(comment.createdAt).toLocaleDateString()}</span>
        </p>
        <p className="comment-content">{comment.content}</p>

        <div className="comment-actions">
          <button
            type="button"
            className={`comment-like-button${comment.likedByCurrentUser ? ' comment-like-button--active' : ''}`}
            onClick={() => toggleLike(comment)}
            aria-label={comment.likedByCurrentUser ? 'Unlike comment' : 'Like comment'}
            aria-pressed={comment.likedByCurrentUser}
          >
            <svg className="comment-like-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
              <path d="M12 21S2.5 15.65 2.5 9.5C2.5 6.5 4.5 4 7 4c2.2 0 3.8 1.2 5 3 1.2-1.8 2.8-3 5-3 2.5 0 4.5 2.5 4.5 5.5C21.5 15.65 12 21 12 21Z" />
            </svg>
            <span>{comment.likeCount}</span>
          </button>

          {/* El backend només permet respostes a comentaris arrel */}
          {!isReply && user && (
            <button type="button" className="comment-reply-button" onClick={() => toggleReply(comment.id)}>
              Reply
            </button>
          )}
        </div>

        {!isReply && replyingTo === comment.id && (
          <form className="comment-form" onSubmit={(event) => submitReply(event, comment.id)}>
            <textarea
              aria-label={`Reply to ${comment.author.name}`}
              placeholder="Add a reply..."
              value={replyContent}
              maxLength={MAX_LENGTH}
              onChange={(event) => setReplyContent(event.target.value)}
            />
            <div className="comment-form-actions">
              <button type="button" onClick={() => toggleReply(comment.id)}>
                Cancel
              </button>
              <button type="submit" disabled={posting || !replyContent.trim()}>
                Reply
              </button>
            </div>
          </form>
        )}

        {!isReply && comment.replies?.length > 0 && (
          <ul className="comment-list comment-replies">{comment.replies.map((reply) => renderComment(reply, true))}</ul>
        )}
      </div>
    </li>
  );

  return (
    <section className="comment-section" aria-label="Comments">
      <h2>{comments.length} comments</h2>

      {user ? (
        <form className="comment-form" onSubmit={submit}>
          <textarea
            aria-label="Add a comment"
            placeholder="Add a comment..."
            value={content}
            maxLength={MAX_LENGTH}
            onChange={(event) => setContent(event.target.value)}
          />
          <button type="submit" disabled={posting || !content.trim()}>
            Comment
          </button>
        </form>
      ) : (
        <p className="comment-login">
          <button type="button" onClick={onLoginClick}>
            Log in
          </button>{' '}
          to comment.
        </p>
      )}

      {loading && <p role="status">Loading comments...</p>}
      {error && <p role="alert">{error}</p>}

      <ul className="comment-list">{comments.map((comment) => renderComment(comment))}</ul>
    </section>
  );
}

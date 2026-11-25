import { FormEvent, useEffect, useState } from 'react';
import axios from 'axios';
import { getEnv } from '../utils/Env';
import { Comment } from '../types/comment';
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

      <ul className="comment-list">
        {comments.map((comment) => (
          <li key={comment.id} className="comment-item">
            {comment.author.pictureUrl ? (
              <img className="comment-avatar" src={comment.author.pictureUrl} alt="" />
            ) : (
              <span className="comment-avatar" aria-hidden="true">
                {comment.author.name.charAt(0)}
              </span>
            )}
            <div>
              <p className="comment-meta">
                <strong>{comment.author.name}</strong>
                <span>{new Date(comment.createdAt).toLocaleDateString()}</span>
              </p>
              <p className="comment-content">{comment.content}</p>
            </div>
          </li>
        ))}
      </ul>
    </section>
  );
}

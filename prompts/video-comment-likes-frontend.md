# Video comment likes (frontend)

**Approved on:** YYYY-MM-DD
**Approved by:** <team members / PR link>
**Used for:** Adding a persisted like / unlike button to comments and replies, consuming the existing comment-like endpoints of `CommentController`.

## Prompt

> okay perf, ahora quiero que añadas un botón de like de comentarios y implementa la lógica de like de comentarios ya existente, que se guarden los likes y tambien los puedas quitar

- **Scope:** Add a like button with its counter to every comment and reply in `CommentSection`. Likes must be persisted in the backend and the user must be able to remove them.
- **Backend endpoints:**
  - `PUT /api/comments/{commentId}/like` likes a comment and returns `CommentLikeResponseDTO` (`commentId`, `likeCount`, `likedByCurrentUser`).
  - `DELETE /api/comments/{commentId}/like` removes the like and returns the same DTO.
  - `GET /api/videos/{videoId}/comments` already returns `likeCount` and `likedByCurrentUser` for each comment and reply, so the state survives page reloads.
  - Both like endpoints require an authenticated session.
- **Conventions:** Same as the comments feature. Reuse the look of the existing video like button (heart icon, red when active). Append CSS without overwriting existing rules.

## Output

AI-generated (Claude), reviewed before committing.

| File | Change |
| --- | --- |
| `frontend/src/components/CommentSection.tsx` | Heart like button with counter on comments and replies, toggles between `PUT` and `DELETE`, updates the comment from the API response; anonymous users are sent to log in |
| `frontend/src/components/CommentSection.css` | Appended styles for the actions row and the like button |
| `frontend/src/types/comment.ts` | New `CommentLike` type matching `CommentLikeResponseDTO` |
| `frontend/src/components/__tests__/CommentSection.test.tsx` | 3 new tests: liking, unliking a reply, anonymous user and error state |

## Notes

- **No optimistic update:** The counter only changes after the backend confirms, so the UI always shows the saved state.

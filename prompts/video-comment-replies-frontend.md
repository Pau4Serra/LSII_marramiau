# Video comment replies (frontend)

**Approved on:** YYYY-MM-DD
**Approved by:** <team members / PR link>
**Used for:** Adding replies to the existing comments section on the video page, consuming the reply endpoint of `CommentController`.

## Prompt

> he hecho commit de momento pero falta lo de contestar comentarios

- **Scope:** Extend `CommentSection` so authenticated users can reply to a comment and every comment shows its replies underneath. Keep the implementation simple and minimal, as in the original comments feature.
- **Backend endpoints:**
  - `GET /api/videos/{videoId}/comments` already returns each root comment with its `replies` list.
  - `POST /api/comments/{commentId}/replies` with body `{ "content": string }` (1 to 1000 characters) returns the created reply (requires an authenticated session).
  - The backend only allows replies to root comments (one level of nesting); replying to a reply returns `422`.
- **Conventions:** Same as the comments feature: React 19 + TypeScript, `axios`, per-component CSS with the theme variables, Jest + Testing Library.

## Output

AI-generated (Claude), reviewed before committing.

| File | Change |
| --- | --- |
| `frontend/src/components/CommentSection.tsx` | "Reply" button on root comments (logged-in users only), inline reply form with Cancel, replies rendered as a nested list |
| `frontend/src/components/CommentSection.css` | Styles for the reply button, reply form actions and the indented, smaller reply items |
| `frontend/src/components/__tests__/CommentSection.test.tsx` | 3 new tests: rendering existing replies, posting a reply, cancelling and the error state |

## Notes

- **Out of scope:** Comment likes (`PUT`/`DELETE /api/comments/{id}/like`).
- **Nesting:** The "Reply" button is only shown on root comments, matching the backend rule.
- **Test detail:** React mirrors a controlled `textarea` value into its text content, so the reply test waits for the form to close before checking the new reply text.

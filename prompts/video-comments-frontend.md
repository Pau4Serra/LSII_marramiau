# Video comments section (frontend)

**Approved on:** YYYY-MM-DD
**Approved by:** <team members / PR link>
**Used for:** Implementing a minimal comments UI (list and create) on the video page, consuming the existing `CommentController` REST endpoints.

## Prompt

- **Scope:** Add a comments section to `VideoPage` that lists a video's comments and lets an authenticated user post a new one. Keep the implementation simple and minimal ("lowkey").
- **Stack:** React 19 + TypeScript + Vite, `axios` for HTTP, one CSS file per component, Jest + Testing Library for tests.
- **Backend endpoints:**
  - `GET /api/videos/{videoId}/comments` returns `CommentResponseDTO[]` (public).
  - `POST /api/videos/{videoId}/comments` with body `{ "content": string }` (1 to 1000 characters) returns the created `CommentResponseDTO` (requires an authenticated session).
- **Conventions:** Follow existing component and test patterns, and reuse `getEnv().API_BASE_URL` and the theme CSS variables (`--app-text`, `--muted-text`, `--panel-background`).

## Output

AI-generated (Claude), reviewed before committing.

| File | Change |
| --- | --- |
| `frontend/src/components/CommentSection.tsx` | New component: fetches and renders comments, plus the post form for logged-in users |
| `frontend/src/components/CommentSection.css` | Styles for the section, form and comment list |
| `frontend/src/types/comment.ts` | `Comment` and `CommentAuthor` types matching the backend DTOs |
| `frontend/src/components/__tests__/CommentSection.test.tsx` | 4 tests: loading, anonymous user, posting and error states |
| `frontend/src/pages/VideoPage.tsx` | Mounts `CommentSection` below the video description |

## Notes

- **Out of scope:** Replies (`POST /api/comments/{id}/replies`) and comment likes (`PUT`/`DELETE /api/comments/{id}/like`). The backend already supports both, and they can be added in a follow-up.
- **Test setup:** `jest.setup.ts` mocks `getEnv()` globally (`API_BASE_URL: 'other'`), so the tests expect URLs prefixed with `other/`.
- **Follow-up edits:** Prettier formatting was applied with `eslint --fix`.

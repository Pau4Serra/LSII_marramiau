# Logout from the profile page (frontend)

**Approved on:** YYYY-MM-DD
**Approved by:** <team members / PR link>
**Used for:** Wiring the profile page "Log out" button to the backend logout endpoint so the session cookie is cleared and the UI returns to the logged-out state.

## Prompt

Original prompt (as written by the user):

> okay, mirate el estado actual del repo y implementa lo de logout que se añadio para que el botón de logout en el perfil de usuario haga logout y se borre la cookie

## Refined prompt

_Later reformulation of the original prompt, written to make the context explicit._

- **Scope:** Make the existing "Log out" button in `ProfilePage` end the session. Keep it minimal.
- **Stack:** React 19 + TypeScript + Vite, `axios` with `withCredentials: true`, one CSS file per component, Jest + Testing Library for tests.
- **Backend endpoint:** `POST /api/auth/logout` (configured in `SecurityConfig`): invalidates the HTTP session, clears authentication, deletes the `JSESSIONID` cookie and answers `204 No Content`.
- **Expected behaviour:** After a successful logout, clear the current user in `App` and navigate back to `/`. If the request fails, show an error and keep the user logged in.
- **Conventions:** Reuse `getEnv().API_BASE_URL`, the existing `profile-error-message` style, and the existing test patterns (`jest.mock('axios')`, `API_BASE_URL` mocked as `other`).

## Output

AI-generated (Claude), reviewed before committing.

| File | Change |
| --- | --- |
| `frontend/src/pages/ProfilePage.tsx` | New `onLogout` prop; the "Log out" button calls `POST /auth/logout`, shows "Logging out..." while pending and an error alert if it fails |
| `frontend/src/App.tsx` | `handleLogout`: sets the current user to `null` and navigates to `/` |
| `frontend/src/pages/__tests__/ProfilePage.test.tsx` | 2 new tests: successful logout and failed logout |

## Notes

- The cookie is `HttpOnly`, so the frontend cannot delete it; the backend removes it in the logout response.
- No CSS changes were needed: `.profile-logout-button` and `.profile-error-message` already existed in `ProfilePage.css`.

# Autoplay on the video page (frontend)

**Approved on:** YYYY-MM-DD
**Approved by:** <team members / PR link>
**Used for:** Making the video on `VideoPage` start playing automatically when the page opens, with a muted fallback when the browser blocks autoplay with sound.

## Prompt

Original prompt (as written by the user):

> hola, mirate los nuevos cambios y quiero que añadas que al entrar en el videoplayer, que el video tenga autoplay, es decir, que cuando entre el video empieze automaticamente

## Refined prompt

_Later reformulation of the original prompt, written to make the context explicit._

- **Scope:** When `VideoPage` finishes loading a video, the `<video>` player starts playing on its own. Keep it minimal and do not touch unrelated code.
- **Browser policy:** Browsers (Chrome, Firefox, Safari) block autoplay with sound unless the user has interacted with the site. First try `play()` with sound; if the promise is rejected, set `muted = true` and try again, so the video always starts. If even that fails, leave the controls for a manual play.
- **Stack:** React 19 + TypeScript + Vite, Jest + Testing Library.
- **Conventions:** Code comments in Catalan, existing test patterns (`jest.mock('axios')`, `API_BASE_URL` mocked as `other`).

## Output

AI-generated (Claude), reviewed before committing.

| File | Change |
| --- | --- |
| `frontend/src/pages/VideoPage.tsx` | `videoRef` on the player, `autoPlay` + `playsInline` attributes, and an effect that calls `play()` and falls back to muted playback if the browser rejects it |
| `frontend/src/pages/__tests__/VideoPage.test.tsx` | 2 new tests (autoplay with sound, muted fallback). Also fixed the `CommentSection` mock (`__esModule` + `default`) and added `jest.clearAllMocks()`, because the existing like tests were failing |

## Notes

- When the browser falls back to muted autoplay, the user has to unmute with the player controls. Navigating from the home page by clicking a video usually counts as an interaction, so in that case the video normally plays with sound; opening a `/videos/:id` link directly usually starts muted.

# Empty state for searches with no results (frontend)

**Approved on:** YYYY-MM-DD
**Approved by:** <team members / PR link>
**Used for:** Showing a "No videos found" message on the home page when a search from the navbar returns no videos, instead of the grey placeholder grid.

## Prompt

Original prompt (as written by the user):

> perfecto, ahora quiero que cuando busques algo con el buscador, si no retorna ningun resultado, que salga una mensaje como "No videos found, try searching again with different words" o algo asi, un + seria hacerlo similar al de youtube cuando no sale nada

## Refined prompt

_Later reformulation of the original prompt, written to make the context explicit._

- **Scope:** When a search done with the `Navbar` (`useAllVideos` -> `/videos/search/{q}`) finishes and returns no videos, the home page shows an empty state instead of the `VideoGrid` placeholders. Searching again (or with an empty term) brings the grid back. Do not touch unrelated code.
- **Design:** Inspired by the typical empty search state of video sites (illustration, title, hint), but original: an SVG magnifying glass with a cross, the title "No videos found", the searched term, and the hint "Try searching again with different words or check your spelling." It must use the project's theme variables (`--panel-background`, `--muted-text`, `--app-text`) so it works in light and dark mode, and be responsive.
- **Stack:** React 19 + TypeScript + Vite, Jest + Testing Library.
- **Conventions:** Code comments in Catalan, one CSS file per component, tests in `__tests__`.

## Output

AI-generated (Claude), reviewed before committing.

| File | Change |
| --- | --- |
| `frontend/src/components/NoSearchResults.tsx` / `.css` | New empty state component (illustration, title, searched term, hint) |
| `frontend/src/useAllVideos.ts` | The hook also returns `searchQuery`, the last searched term (empty when listing all videos) |
| `frontend/src/App.tsx` | `HomePage` shows `NoSearchResults` when the search finished, returned 0 videos and there is a search term |
| `frontend/src/components/__tests__/NoSearchResults.test.tsx` | 3 tests for the component |
| `frontend/src/components/__tests__/AppSearch.test.tsx` | 3 tests for the whole flow in `App` (empty search, search with results, going back to the grid) |

## Notes

- If the full list of videos is empty (no search term), the placeholder grid is still shown, as before.

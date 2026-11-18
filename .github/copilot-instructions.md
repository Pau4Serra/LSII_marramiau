# ProTube repository instructions

## Repository shape

This is a monorepo with three cooperating parts:

- `backend/` is a Spring Boot 3 REST application on Java 21. Controllers expose the API, services hold application logic, repositories persist JPA entities, and response records in `model/dto/` are used at API boundaries.
- `frontend/` is a React 19 + TypeScript SPA built with Vite. `App.tsx` composes the page, hooks such as `useAllVideos.ts` call the backend, and reusable UI components live under `src/components/` with colocated Jest/Testing Library tests.
- `tooling/videoGrabber/` is a Python utility that creates the video-store files consumed by the backend: one `.mp4`, `.webp`, and `.json` set per video.

The backend's catalog is file-backed rather than database-backed: `VideoService` reads JSON metadata from `pro_tube.store.dir`, maps it to `PublicVideoResponseDTO`, and `MvcConfig` serves the matching media files at `/media/**`. The frontend builds API URLs from `VITE_API_DOMAIN` (`<domain>/api`) and media URLs from `VITE_MEDIA_DOMAIN` (`<domain>/media`); do not hardcode these domains in new API or media code.

Spring profiles currently separate local development and production. `dev` is the default and uses an in-memory H2 database with initial data; `prod` uses PostgreSQL and disables initial data. The production Maven profile also builds `frontend/` and copies its `dist/` output into the backend static resources. OAuth uses Google and is configured through environment variables.

## Build, test, and lint

Run commands from the indicated directory:

### Backend

```text
cd backend
./mvnw clean verify
```

On Windows, use `.\mvnw.cmd clean verify` if the wrapper command is not executable. Run one test class or method with:

```text
./mvnw test -Dtest=VideosControllerTest
./mvnw test -Dtest=VideosControllerTest#getVideos
```

Generate the JaCoCo report used by CI with `./mvnw clean verify -Pcoverage`; the HTML report is under `backend/target/site/jacoco/`.

### Frontend

```text
cd frontend
npm ci
npm run build
npm run test
npm run lint
```

Run one Jest test file with `npx jest src/components/__tests__/VideoCard.test.tsx`. Run one named test with `npx jest src/components/__tests__/VideoCard.test.tsx -t "test name"`. `npm run test` enables coverage by default. `npm run format` applies Prettier; `npm run lint-fix` applies ESLint fixes.

The pull-request workflow (`.github/workflows/main.yml`) runs the frontend build, coverage tests, lint, and backend `./mvnw clean verify -Pcoverage` on PRs and pushes to `main`.

### Video store tooling

The grabber requires Python 3, `yt-dlp`, and `ffmpeg`. From `tooling/videoGrabber/`, run the documented command shape:

```text
python3 main.py --store={Store_Folder} --id=10 --recreate --videos={Path_to_video_list.txt}
```

The generated store path must be supplied to the backend through `ENV_PROTUBE_STORE_DIR`. Never introduce a repository-specific absolute store path.

## Project conventions

- Keep the backend flow `controller -> service -> repository`; controllers should return DTOs/response records rather than JPA entities.
- Keep media and metadata handling consistent: a metadata file's public ID is derived from its configured source, and its thumbnail/video URLs use `/media/<id>.webp` and `/media/<id>.mp4`.
- Preserve the existing environment contract: `ENV_PROTUBE_STORE_DIR`, `ENV_PROTUBE_FRONTEND_URL`, Google OAuth variables, and production PostgreSQL variables are read by Spring configuration; frontend runtime configuration uses Vite `VITE_*` variables.
- Follow the existing frontend component/test arrangement and TypeScript types in `src/types/`; update the API normalization in `useAllVideos.ts` when the backend response shape changes.
- The repository uses `main` for production, `release` for QA/pre-production, and `develop` for shared development. New feature branches use `feature/<ticket>-short-name`; contributions go through reviewed pull requests rather than direct commits to `main`.
- Use Conventional Commits. When AI contributes to code or architecture, reference the approved prompt and task in the commit message, as required by the root README and `.github/git-commit-instructions.md`.

## Requirements and AI traceability

`REQUIREMENT.md` is the authoritative acceptance-criteria and priority breakdown for the MVP. Check it before implementing user-facing behavior.

The root `README.md` requires team-reviewed AI configuration and preservation of prompts. Reuse an approved prompt from `prompts/` when one applies; otherwise add a new team-approved prompt there. Keep the prompt and the resulting change traceable through the pull request/commit.

## Database migration workflow

When asked to create, migrate, upgrade, or downgrade the database, first compare the current JPA entities and mappings with the existing migration files/schema and inspect the relevant Git commit history. Use that comparison to determine whether each change requires creating, deleting, or renaming a column/table, and preserve data explicitly for renames or transformations instead of treating them as drop-and-add operations.

Create a reviewed Flyway SQL migration using the standard filename `V<N>__description.sql`, where `<N>` is the next unused version. Never modify a migration that may already have been applied. Do not apply a generated migration automatically unless explicitly requested; show or validate the SQL first, and keep `spring.jpa.hibernate.ddl-auto=validate` for production. Prefer a forward corrective migration or a tested backup/restore for rollback rather than assuming every change has a safe automatic down migration.

## Commit message workflow

Avoid overly verbose descriptions or unnecessary details. Use the Conventional Commits pattern with no errors. Don't add ```plaintext ... ``` or anything like these notations in the message body.
# Protube
Video platform trying to replicate Youtube. 

Monorepo:
backend/ (Spring Boot, Java 21, PostgreSQL)
frontend/ (React + TypeScript, Vite)

## Commands
- Backend: cd backend && ./mvnw verify
- Frontend: cd frontend && npm test

## Conventions
- Branchs: main (production), release (pre-production/QA), develop (shared dev branch), on new feature: feature/<ticket>-short-name
- Commits: Conventional Commits
- Never push to main: PR + squash
- Controller → Service → Repository
- Return DTOs, never JPA entities

## Definition of Done
- Tests added, CI green
- Coverage threshold met (>80%)
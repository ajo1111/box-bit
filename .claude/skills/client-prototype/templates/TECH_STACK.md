# {{APP_NAME}} tech stack

Goal: one TypeScript codebase for {{platforms}}, with **Convex as the single realtime source of truth**, so every client and every AI agent working on the repo stays in sync.

## Architecture at a glance

```mermaid
flowchart LR
  subgraph Clients
    M[Expo app]
    W[Next.js web]
  end
  subgraph Convex
    Q[Queries - live]
    MU[Mutations]
    A[Actions + HTTP]
    S[Scheduler / crons]
    DB[(DB + storage + search)]
  end
  AUTH[Auth]
  EXT[{{Integrations}}]
  M <--> Q
  W <--> Q
  M --> MU
  W --> MU
  MU --> DB
  Q --> DB
  EXT -- webhooks --> A
  A --> DB
  S --> A
  AUTH -. JWT .-> Convex
```

## Each layer and what it does

| Layer | Tool | What it does for {{APP_NAME}} |
|---|---|---|
| Repo | Turborepo + pnpm | `apps/mobile`, `apps/web`, `packages/backend` (Convex), `packages/ui` (tokens), `packages/shared`. Shared generated types make schema drift a build error. |
| Mobile | Expo + Expo Router + EAS | {{…}} |
| Web | Next.js on Vercel | {{…}} |
| Backend | Convex | Schema = contract; live queries; transactional mutations; actions for third parties; HTTP actions for webhooks; scheduler/crons for {{jobs}}; storage; search; components ({{aggregate, rate-limiter, workpool, migrations, agent}}); preview deployment per branch. |
| Permissions | Convex custom functions (`convex-helpers`) | All reads of protected data go through one `canView(viewer, owner, field)` helper. Never filtered in UI. |
| Auth | {{Clerk / Convex Auth}} | {{orgs, roles}} |
| {{Edge}} | {{Tool}} | {{What it does here}} |

Edge menu (pick what the product needs): video **Mux**; payments **Stripe** (Connect for marketplaces); push **Expo Push**; health **HealthKit / Health Connect** or **Terra/Junction**; maps **Mapbox**; animation **Reanimated**, **Rive**, **Skia** / web **motion**; UI web **Base UI**, **Sonner**, **Recharts**, **cva/clsx**; AI **Claude via Convex actions**; ops **Sentry**, **PostHog**; tests **Vitest + convex-test**, **Maestro**, **Playwright**.

## Data model (first cut)

| Table | Key fields |
|---|---|

## Agent orchestration

1. **One contract:** `packages/backend/convex/schema.ts` plus generated `api.*`. No REST endpoints to drift.
2. **Lanes:** Architect (issues, ADRs, docs), Backend (sole schema owner, migrations + tests), Mobile, Web, Design QA (Emil skills: `review-animations`, `break-ui`, `mobile-native`), Test/Review (CI gatekeeper).
3. **Sync:** type errors on mismatch, Convex preview deployment per branch, schema PRs merge before dependent UI PRs, small PRs, green CI required.
4. **Shared memory:** `CLAUDE.md`, `docs/` (+ `docs/decisions/` ADRs), and GitHub issues.

## Phased roadmap

| Phase | Scope |
|---|---|
| 0. Prototype | `mockup/index.html` |
| 1. MVP | {{…}} |
| 2 | {{…}} |
| 3 | {{…}} |

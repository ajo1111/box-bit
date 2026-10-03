# {{APP_NAME}}: rules for agents

Read `docs/PRODUCT_SUMMARY.md` and `docs/TECH_STACK.md` before starting any task.

## Source of truth
- `packages/backend/convex/schema.ts` is the data contract. Clients use only the generated `api.*` types; no hand-written REST endpoints.
- Only the **backend lane** changes the schema. Every schema change ships with a migration and `convex-test` coverage, and merges before any UI PR that depends on it.
- Architecture decisions go in `docs/decisions/NNNN-title.md`.

## Permissions (non-negotiable)
- Every query returning protected data goes through `canView(viewer, owner, field)`. Never filter private data in the UI.
- {{Product-specific rules: minors, roles, visibility modes.}}
- Add a `convex-test` case for every new visibility rule.

## Lanes
| Lane | Owns | Must not touch |
|---|---|---|
| Architect | issues, ADRs, `docs/` | app code |
| Backend | `packages/backend/` | `apps/*` UI |
| Mobile | `apps/mobile/` | schema |
| Web | `apps/web/` | schema |
| Design QA | reviews only | — |
| Test/Review | CI, test suites | feature code |

## Workflow
- Small PRs, one issue each. CI (typecheck, lint, tests) must be green. Each PR gets a Convex preview deployment.
- Run `pnpm typecheck && pnpm test` before pushing.

## UI and motion (Emil Kowalski skills in `.claude/skills/`)
- Build motion with `animate` (web) or `animate-expo` (mobile). Before merging UI, run `review-animations`, `break-ui`, and `mobile-native`. Choose libraries with `pick-ui-library`.
- Rules: UI animation under 300 ms; never `ease-in`; `--ease-out: cubic-bezier(0.23,1,0.32,1)`, `--ease-in-out: cubic-bezier(0.77,0,0.175,1)`, `--ease-drawer: cubic-bezier(0.32,0.72,0,1)`; press `scale(0.97)`; never from `scale(0)`; animate transform and opacity only; tabs never slide; respect reduced motion; one haptic per action, on the same frame as the visual.
- Design tokens live in `packages/ui`; `mockup/index.html` is the visual reference.

# BoxBit: rules for agents

Read `docs/PRODUCT_SUMMARY.md` and `docs/TECH_STACK.md` before starting any task.

## Source of truth
- `packages/backend/convex/schema.ts` is the data contract. Clients use only the generated `api.*` types; no hand-written REST endpoints.
- Only the **backend lane** changes the schema. Every schema change ships with a migration (`@convex-dev/migrations`) and `convex-test` coverage, and merges before any UI PR that depends on it.
- Architecture decisions go in `docs/decisions/NNNN-title.md` (ADR format).

## Privacy (non-negotiable)
- Every query that returns fighter data must go through the shared `canView(viewer, owner, field)` helper. Never filter private data in the UI.
- Fight Camp mode hides training and stats from everyone except the fighter's coaches.
- Youth (under 18): public posts need coach approval; promoter contact routes to the head coach; no GPS routes stored.
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

## UI and motion: Emil Kowalski skills (`.claude/skills/`)
- Building animation: `animate` (web) or `animate-expo` (mobile). Before merging UI: `review-animations`, `break-ui`, and `mobile-native` (for web views on phones).
- Library choices: `pick-ui-library` (Sonner, Base UI, motion, NumberFlow, Recharts, Virtuoso, zustand, cva/clsx).
- Core rules: UI animation under 300 ms; never `ease-in`; use `--ease-out: cubic-bezier(0.23,1,0.32,1)`, `--ease-in-out: cubic-bezier(0.77,0,0.175,1)`, `--ease-drawer: cubic-bezier(0.32,0.72,0,1)`; press feedback `scale(0.97)`; never animate from `scale(0)`; only animate transform and opacity; tab switches never slide; respect reduced motion; haptics on the same frame as the visual, one per action.
- Design tokens live in `packages/ui`; `mockup/index.html` is the visual reference.

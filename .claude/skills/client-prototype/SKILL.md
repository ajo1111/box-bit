---
name: client-prototype
description: End-to-end pipeline for turning a client conversation (transcript, notes, or a brief) into a confirmed product summary, competitor research with links, a recommended tech stack (Convex-centered, agent-maintainable), an in-depth clickable prototype published as an Artifact, and a repo scaffold (docs + CLAUDE.md agent rules). Use when the user says they have a new client or app idea, pastes a meeting transcript, asks to "prototype this for a client", "mock up an app", "what stack should we use", or wants something clickable to show a client. Works for web, mobile, or both.
---

# Client Prototype Pipeline

You are acting as product lead, researcher, solutions architect and design engineer for an agency that builds apps for clients with AI agents. The deliverable is something the user and their client can **click through together** plus the documents that let agents build the real thing later.

Run the stages in order. Do not skip the confirmation gate in stage 3.

## Stage 0: Intake

Collect from the user's message (ask only for what is missing and blocking):
- The transcript, notes, or brief. Pull out every named **person, product, website, competitor, device or partner**. These become research targets.
- Platforms: web, iOS, Android, or all.
- Any stack constraints. Default backend is **Convex** unless the user says otherwise.
- The project slug (used for the folder and the working app name). If none, take it from the repo name or coin a short placeholder and say it is a placeholder.

Extract into a scratch list:
- **Roles** (who uses it), **jobs** each role needs done, **features mentioned**, **cultural/brand cues** (vernacular, values, tone), **integrations** (devices, APIs, existing platforms), **business angles** (who pays, bulk sales, partnerships).

## Stage 1: Research (run searches in parallel)

1. Every website, app or company named in the input: what it does, what it lacks, and whether to **integrate, complement, or compete**. Correct misremembered names (e.g. "Conquer, starts with a K" → Konquer).
2. Direct competitors (search by category + audience + year) and adjacent products (training, scheduling, social, marketplace analogs).
3. Any hardware/partner named: what data it actually exposes and how (SDK, API, Apple Health / Health Connect, webhooks). Never promise data the device doesn't produce.
4. Current docs for the chosen stack pieces when a detail might have changed (e.g. Convex + Expo setup).

Record every source URL. All claims in the docs link to sources. Use `templates/RESEARCH.md`.

## Stage 2: Design references

- Load the design-engineering skills that exist in this repo or user scope: `emil-design-eng` (core rules), `animate` / `animate-expo`, `mobile-native`, `pick-ui-library`, `review-animations`, `break-ui`. If they are missing and the user wants them: `git clone --depth 1 https://github.com/emilkowalski/skill` and copy `skills/*` into `.claude/skills/` with its MIT LICENSE.
- Load `artifact-design` before writing the prototype (artifact page contract).

## Stage 3: Summary and confirmation gate

Write `docs/PRODUCT_SUMMARY.md` from `templates/PRODUCT_SUMMARY.md`: a one-liner, a roles table, MVP features, what it is not, and **open questions for the client**. Put the short version in chat and ask the user to confirm or correct it.

If the user asked for everything in one go, continue building but clearly mark the summary as "draft for confirmation" in both chat and the doc.

## Stage 4: Tech stack

Write `docs/TECH_STACK.md` from `templates/TECH_STACK.md`. Keep the default spine and adapt the edges:
- **Spine:** Turborepo + pnpm monorepo, Convex (schema = contract, realtime queries, mutations, actions, HTTP webhooks, scheduler/crons, storage, search, components, preview deployments), auth (Clerk for orgs/roles, or Convex Auth for fewer vendors).
- **Clients:** Expo + Expo Router for mobile, Next.js for web. Drop whichever isn't needed.
- **Edges:** pick per project (video, payments, push, wearables, maps, AI, analytics). Every row says *what it does for this product*, not what the tool is in general.
- Include: a mermaid architecture diagram, a first-cut data model table, where privacy/permissions are enforced (server side, one helper), the **agent orchestration** section, and a phased roadmap.

## Stage 5: Prototype (the centerpiece)

Follow `references/prototype-spec.md`. Start from `assets/prototype-shell.html` (a working device frame, role switcher, tour checklist, tabs, sheets, toasts, motion tokens) and fill it with this client's world. `references/example-boxbit.md` describes a finished example; the full file is `examples/boxbit-prototype.html`.

Non-negotiables:
- Every role from intake gets a switchable view, and each role has 3–5 tabs that do something.
- Realistic sample data in the client's vernacular; never lorem ipsum. Simulated integrations are labeled as simulated on the page.
- A "Try this" checklist of 6–10 actions that tick off as the viewer does them; this is how the client tours it.
- At least one **signature moment** that sells the vision (e.g. a live session with an animated character), and at least one moment that demonstrates the hardest product idea (e.g. "preview as someone else" for privacy).
- Motion follows the Emil rules (see spec). Respect reduced motion.

Check once: syntax-check the script (`node --check` on the extracted `<script>`), then one screenshot pass with Playwright (`/opt/pw-browsers` Chromium, install `playwright` into the scratchpad if needed) through the main flows, fix what's visibly broken, then publish with the Artifact tool. Tell the user the link is private until they share it.

Save the file to `mockup/index.html` in the repo (or `prototypes/<slug>/index.html` if the repo holds several clients).

## Stage 6: Repo scaffold for agents

- `CLAUDE.md` from `templates/CLAUDE.md`: source of truth, privacy/permission rules, agent lanes, workflow, design rules.
- `README.md` linking every doc and the prototype.
- Vendored design skills in `.claude/skills/` if the user wants them.
- Commit on the designated branch with a clear message and push. If push fails, report the exact step and the fix; don't claim it pushed.

## Stage 7: Report

In chat, in this order:
1. The prototype link (and that it's private until shared).
2. The summary to confirm.
3. The stack table (layer, tool, what it does here) and how agents stay in sync.
4. Competitors and referenced sites with links, one line each on the lesson.
5. Open questions for the client.
6. Files written and push status.

Keep it scannable. No filler.

## Rerunning for an existing client

If `docs/PRODUCT_SUMMARY.md` already exists, read it and the prototype first. Apply the user's feedback as edits, republish the same file path so the link stays the same, and update the docs that changed.

# Prototype spec

The prototype is a single self-contained HTML file published as an Artifact. It must convince a non-technical client that the product is real and let the agency test ideas cheaply.

## Page layout

- **Guide rail** (left, page theme-aware): app name, one-paragraph pitch in the client's words, role switcher, "Try this" checklist with progress count, "What's real and what's simulated" note, reset button.
- **Device** (right): a working phone (390×800) for mobile products; for web products, swap the device for a browser frame or a full-width app shell and keep the guide rail as a collapsible panel.
- Below 920px the rail stacks above the device; below 440px the device goes full width.

## Inside the app

| Must have | Notes |
|---|---|
| Role switcher | Each role sees different tabs and data. Switching resets to the first tab. |
| 3–5 tabs per role | Bottom tab bar on mobile. Tabs never slide (peers, not hierarchy). |
| Feed or home | Real-looking content with the product's own post types. |
| A creation flow | Compose, assign, register, book… whatever the core write action is. Ends with a toast and the new item visible. |
| A detail sheet | Bottom sheet with drag-to-dismiss (velocity > 0.11 px/ms or 120px). |
| A data view | Charts drawn to scale with real-feeling numbers that add up (totals match bars). |
| Settings that matter | Privacy, permissions, connected devices/integrations. Changing them changes what other views show. |
| Signature moment | The one thing the client talked about most, made interactive (live timer, animated character, map, matchmaking…). |
| "View as" | When access control is part of the idea, let the viewer preview what another role sees, with hidden items blurred. |

State lives in one object; render functions per tab; event delegation through `data-act`. Per-viewer state (role, checklist) can persist in `localStorage` wrapped in try/catch.

## Visual identity

- Derive palette and type from the client's world (sport, trade, neighborhood, materials). Write tokens in `:root`. The app itself may commit to one theme; the page around it supports light and dark.
- A display face with character, a readable body face, a mono for data labels (Google Fonts only, with fallbacks).
- Avoid generic AI looks (cream + terracotta serif, purple gradients, Inter everywhere, emoji section markers).

## Motion (Emil Kowalski rules)

- Tokens: `--ease-out: cubic-bezier(0.23,1,0.32,1)`, `--ease-in-out: cubic-bezier(0.77,0,0.175,1)`, `--ease-drawer: cubic-bezier(0.32,0.72,0,1)`.
- Press feedback `scale(0.97)` at 100–160ms on every pressable.
- UI animation under 300ms; sheets ~380ms on the drawer curve; never `ease-in`; never from `scale(0)`.
- Only animate transform and opacity. Transitions over keyframes for anything triggered repeatedly.
- Toasts enter and exit from the same edge. Stagger first-load lists 30–80ms, only once.
- Delight (characters, celebrations) only in rare moments.
- `prefers-reduced-motion`: drop movement, keep opacity.

## Copy

- Use the client's vocabulary and real-sounding names, places and numbers. Mark fictional orgs as samples where they could be mistaken for real ones.
- Buttons say what happens; toasts confirm what happened.
- No trademarked characters or brand imitation (inspired-by is fine, copies are not).

## Verification

1. Extract the `<script>` and run `node --check`.
2. Playwright: load, click through every role and the signature flow, screenshot 3–4 states, and collect console errors (font cert errors in the sandbox are expected).
3. Fix visible breakage once, then publish.

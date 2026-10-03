# client-prototype skill

A reusable pipeline that takes a client transcript and produces a product summary to confirm, research with links, a Convex-centered tech stack, a clickable prototype Artifact, and an agent-ready repo scaffold.

## Use it

In Claude Code, type `/client-prototype` and paste the transcript, or just say "prototype this for a client" with the notes.

## Make it available in every project

- **All your projects on this machine:** copy this folder to `~/.claude/skills/client-prototype/`.
- **Cloud sessions and teammates:** keep it in a dedicated repo (for example `your-org/agency-skills`) and copy it into each new client repo's `.claude/skills/`, or install it as a plugin from that repo.
- **Pair it with Emil Kowalski's skills:** `npx skills@latest add emilkowalski/skills`.

## Contents

| Path | Purpose |
|---|---|
| `SKILL.md` | The pipeline, stages 0–7 |
| `references/prototype-spec.md` | Prototype requirements, motion rules, verification |
| `references/example-boxbit.md` | Summary of the first project run through the pipeline |
| `templates/` | PRODUCT_SUMMARY, TECH_STACK, RESEARCH, CLAUDE.md |
| `assets/prototype-shell.html` | Working starter: device, roles, checklist, tabs, sheets, toasts |
| `examples/` | The full BoxBit prototype and stack doc as a quality bar |

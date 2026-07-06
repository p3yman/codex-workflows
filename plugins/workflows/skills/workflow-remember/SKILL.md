---
name: workflow-remember
description: Use when recording durable project memory in .context/knowledge/index.md from completed feature work, design decisions, review findings, migrations, user instructions, conventions, gotchas, or "remember this" requests.
---

# Workflow Remember

Use this skill to update durable project knowledge. Durable knowledge is reusable context that should guide future work across multiple features. It belongs in `.context/knowledge/index.md`, not only in a feature folder.

This skill does not replace feature artifacts. Keep detailed research, spec, technical design, plan, changelog, review, and QA notes in the feature folder. Write only compact, reusable memory entries to knowledge.

## Inputs

Accept any of:

- A feature folder under `.context/plans/`.
- `research.md`, `spec.md`, `technical-design.md`, `plan.md`, `changelog.md`, `review.md`, or QA notes.
- A user instruction such as "remember this", "record this decision", "save this convention", or "add this to project memory".
- A diff, PR, review finding, migration note, or implementation discovery that should affect future work.

## Workflow

1. Locate project workflow context:
   - read `.context/workflows.yaml` when present
   - read `.context/knowledge/index.md` when present
   - create `.context/knowledge/index.md` from `plugins/workflows/assets/templates/context-knowledge-index.md` only when the project is already using `.context/` and the file is missing
2. Read the source material needed for the memory update:
   - feature artifacts when a feature folder is provided
   - conversation notes or user-provided decisions
   - relevant docs only when needed to avoid writing vague memory
3. Classify each candidate memory:
   - Durable decision
   - Project convention
   - Feature outcome
   - Gotcha or operational note
   - Important doc or external reference
4. Filter aggressively:
   - Keep facts that future work should reuse.
   - Skip temporary task details, implementation minutiae, stale hypotheses, and one-off TODOs.
   - Prefer linking to source artifacts instead of copying long explanations.
5. Update `.context/knowledge/index.md`.
   - Preserve existing entries.
   - Merge duplicates instead of adding near-identical memory.
   - Keep entries dated when the date helps future readers understand context.
   - Link to source feature artifacts, docs, PRs, or files when available.
6. If `.context/plans/index.md` has broken links discovered while reading source material, report them and recommend `workflow-update`; do not turn this skill into broad index repair.
7. Do not stage or commit. Recommend `workflow-commit` when the knowledge update should be committed.

## What To Record

Good durable memory:

- "Billing is team-scoped, not user-scoped."
- "Stripe webhook handlers must verify signatures before JSON parsing."
- "Use `.context/plans/shared/` for committed team-visible workflow records; keep local-only drafts under `.context/plans/local/` in team mode."
- "For migrations, record durable project decisions in `.context/knowledge/index.md` and keep feature history in `.context/plans/`."

Weak memory to skip:

- "Phase 2 changed three files."
- "Need to run tests later."
- "Maybe use Stripe Checkout."
- "User asked about billing."

## Agent Use

| Need | Agent |
|---|---|
| Find related workflow docs | `context-locator` |
| Extract durable decisions from feature docs | `context-analyzer` |
| Understand implementation discovery before recording it | `codebase-analyzer` |

Use agents only when they reduce guesswork. For a direct "remember this" instruction, update knowledge directly.

## Question Handling

If missing input blocks the memory update, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`. If unavailable, ask numbered chat questions, ask long-answer questions one at a time, and always include a recommended option.

## Output

Reply with:

- knowledge path
- entries added or updated
- source artifacts used
- skipped items, if any, and why
- remaining questions, if any
- recommended next step

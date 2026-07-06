---
name: workflow-plan
description: Use when turning research, spec, technical design, or other context into a Codex Workflows plan.md with a phase overview table, detailed phase task lists, blocking questions, verification, and manual commit guidance.
---

# Feature Plan

Use this skill after research exists or when the user provides enough context to plan directly.

## Inputs

Prefer an existing feature folder under `.context/plans/` when setup has been run.

If none exists, create one using the same naming rules as `workflow-research`.

Read available inputs before planning:

- `research.md`
- `spec.md`
- `technical-design.md`
- Linear issue or issue intake notes
- `.context/workflows.yaml`
- `.context/knowledge/index.md`
- `.context/docs/`, configured project docs, or root `docs/`
- `.context/docs/design.md` or the configured `design.file` for UX, redesign, or frontend UI work

## Agent Use

Before writing the plan, use focused agents when their output would reduce guesswork:

| Need | Agent |
|---|---|
| Locate impacted files | `codebase-locator` |
| Get file:line implementation details | `codebase-analyzer` |
| Find examples and test conventions | `codebase-pattern-finder` |
| Reuse earlier decisions | `context-locator`, then `context-analyzer` |
| Confirm external API/library behavior | `web-search-researcher` |

## Required Plan Shape

Create or update `plan.md` from `plugins/workflows/assets/templates/plan.md`.

Every plan must be decision-complete where repo evidence supports a choice. Do not leave implementation approach, file ownership, verification, or commit boundaries for the implementer to invent. Record only true unknowns as questions.

For UX, redesign, or frontend UI work, plans must follow `.context/docs/design.md` when it exists. Capture concrete UI/UX decisions in phase `Implementation Decisions`, including layout, visual hierarchy, component variants, interaction states, copy hierarchy, responsive behavior, accessibility expectations, and screenshot/manual verification. If any design choice is unclear and cannot be inferred from `design.md`, existing UI, research, or spec, put it in `Opening Questions` or that phase's `Blocking Questions`.

Every plan must include:

- `## Opening Questions` for cross-cutting questions to ask later only when they block implementation.
- `## Overview` with the phase table.
- `## Phases` with one detailed section per phase.
- `## Acceptance Criteria`.
- `## Out of Scope`.
- `## Verification`.

The overview table must use this shape:

| Phase | Status | Short Description | T-shirt Size | Change Surface | Line Areas | Verification |
|---|---|---|---|---|---|---|

Column rules:

- `Phase`: numbered phase name.
- `Status`: start new phases as `Pending`; use only `Pending`, `Ready for review`, or `Implemented`.
- `Short Description`: one compact sentence.
- `T-shirt Size`: XS, S, M, L, or XL.
- `Change Surface`: expected files/modules.
- `Line Areas`: functions, sections, selectors, docs headings, or exact line numbers when research found them.
- `Verification`: exact checks or manual verification for the phase.

Do not invent exact line numbers before implementation unless research found them.

## Detailed Phases

Include one section per phase:

```md
### Phase 1: Short phase name

- [ ] Phase 1 complete

Objective:
- One compact statement of what this phase accomplishes.

Implementation Decisions:
- Decision-complete bullets for approach, ownership, data flow, and constraints.

Tasks:
- [ ] Concrete implementation task.
- [ ] Concrete documentation or workflow task.

Blocking Questions:
- None.

Verification:
- Exact command or manual check for this phase.

Commit Plan:
- Do not commit from `workflow-implement`. Use `workflow-commit` after verification and workflow doc updates.
```

When a phase has open questions, write only questions that would block that phase. If the likely answer can be inferred from repo context, choose it and record the decision instead of asking.

For UI/UX phases, do not leave broad questions like "make the UI better" or "improve UX" for implementation. Convert them into specific decisions or specific blocking questions.

## Question Handling

When asking the user for missing input, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`.

If `request_user_input` is unavailable, ask in chat:

- Long-answer questions: one numbered question at a time, with a recommended default.
- Short-answer questions: a numbered list.
- Always recommend a good option.

## Output

Reply with:

- feature folder path
- the overview table
- short description
- overall T-shirt size
- likely change surface
- likely line areas
- notable risks or open questions

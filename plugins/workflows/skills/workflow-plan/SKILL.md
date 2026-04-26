---
name: workflow-plan
description: Use when turning feature research or context into a Codex Workflows plan.md with a phase overview table, detailed phase task lists, blocking questions, verification, and commit guidance.
---

# Feature Plan

Use this skill after research exists or when the user provides enough context to plan directly.

## Inputs

Prefer an existing feature folder:

```text
thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/
```

If none exists, create one using the same naming rules as `workflow-research`.

## Agent Use

Before writing the plan, use focused agents when their output would reduce guesswork:

| Need | Agent |
|---|---|
| Locate impacted files | `codebase-locator` |
| Get file:line implementation details | `codebase-analyzer` |
| Find examples and test conventions | `codebase-pattern-finder` |
| Reuse earlier decisions | `thoughts-locator`, then `thoughts-analyzer` |
| Confirm external API/library behavior | `web-search-researcher` |

## Required Plan Shape

Create or update `plan.md` from `plugins/workflows/assets/templates/plan.md`.

Every plan must be decision-complete where repo evidence supports a choice. Do not leave implementation approach, file ownership, verification, or commit boundaries for the implementer to invent. Record only true unknowns as questions.

Every plan must include:

- `## Opening Questions` for cross-cutting questions to ask later only when they block implementation.
- `## Overview` with the phase table.
- `## Phases` with one detailed section per phase.
- `## Acceptance Criteria`.
- `## Out of Scope`.
- `## Verification`.

The overview table must use this shape:

| Phase | Short Description | T-shirt Size | Change Surface | Line Areas | Verification |
|---|---|---|---|---|---|

Column rules:

- `Phase`: numbered phase name.
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
- Commit related chunks after verification and workflow doc updates.
```

When a phase has open questions, write only questions that would block that phase. If the likely answer can be inferred from repo context, choose it and record the decision instead of asking.

## Output

Reply with:

- feature folder path
- the overview table
- short description
- overall T-shirt size
- likely change surface
- likely line areas
- notable risks or open questions

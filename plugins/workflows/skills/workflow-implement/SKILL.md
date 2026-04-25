---
name: workflow-implement
description: Use when implementing one phase from a Codex Workflows plan. Updates changelog.md and marks completed plan.md checkboxes after the phase is done.
---

# Feature Implement

Use this skill to implement a planned phase from:

```text
thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/plan.md
```

## Workflow

1. Read `plan.md`, `research.md` if present, and `changelog.md` if present.
2. Identify the requested phase. If no phase is specified, choose the first unchecked phase.
3. Use `codebase-analyzer` for unfamiliar implementation paths before editing.
4. Use `codebase-pattern-finder` before adding new code that should match local conventions.
5. Use `test-writer` when the phase requires new or updated tests.
6. Use `error-analyzer` if verification fails with a non-obvious error.
7. Implement only that phase unless the user explicitly expands scope.
8. Run the phase verification from the overview table when feasible.
9. Update `changelog.md` with:
   - date
   - completed phase
   - files changed
   - behavior changed
   - verification performed or still missing
10. Mark only the completed phase checkbox in `plan.md`.
11. Leave unfinished phases unchecked.

## Agent Use

| Need | Agent |
|---|---|
| Re-understand code before editing | `codebase-analyzer` |
| Match local implementation style | `codebase-pattern-finder` |
| Generate focused tests | `test-writer` |
| Diagnose failing checks | `error-analyzer` |

## Changelog Entry Format

```md
## YYYY-MM-DD - Phase N: Phase name

- Changed:
- Verification:
- Notes:
```

## Output

Reply with:

- completed phase
- files changed
- verification result
- remaining unchecked phases

Do not update `thoughts/index.md`; that belongs to `workflow-share` when the feature is finished.

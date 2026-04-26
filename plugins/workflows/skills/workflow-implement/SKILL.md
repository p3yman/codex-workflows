---
name: workflow-implement
description: Use when implementing one phase from a Codex Workflows plan. Handles blocking questions, updates changelog.md, marks completed phase tasks, and commits related chunks to the current branch.
---

# Feature Implement

Use this skill to implement a planned phase from:

```text
thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/plan.md
```

## Workflow

1. Read `plan.md`, `research.md` if present, and `changelog.md` if present.
2. Identify the requested phase. If no phase is specified, choose the first unchecked phase.
3. Review `## Opening Questions` and the selected phase's `Blocking Questions`.
4. Ask the user before editing only when an unresolved question blocks the selected phase. If a question is already answered by repo context, record the decision in the implementation summary instead of asking.
5. Use `codebase-analyzer` for unfamiliar implementation paths before editing.
6. Use `codebase-pattern-finder` before adding new code that should match local conventions.
7. Use `test-writer` when the phase requires new or updated tests.
8. Use `error-analyzer` if verification fails with a non-obvious error.
9. Implement only that phase unless the user explicitly expands scope.
10. Complete only the selected phase's task checkboxes in `plan.md`; leave future phase tasks unchecked.
11. Run the selected phase verification from the overview table and phase section when feasible.
12. Update `changelog.md` with:
   - date
   - completed phase
   - files changed
   - behavior changed
   - verification performed or still missing
13. Mark only the completed phase checkbox in `plan.md` when all required phase tasks are done.
14. Review the diff and stage only files relevant to the completed phase.
15. Create one or more commits for coherent related chunks on the current branch. Tie commit messages to the completed phase.
16. Leave unfinished phases and unrelated dirty work untouched.
17. If this was the final unchecked phase, report that implementation is complete and tell the user to run `workflow-qa` for the final quality gate and PR readiness check.

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
- Commits:
```

## Commit Guidance

- Prefer one commit per completed phase.
- Split into multiple commits only when the phase contains clearly separate related chunks, such as runtime changes and documentation changes.
- Use `git diff` or equivalent before staging.
- Stage with path-level or patch-level selection so unrelated work is not included.
- If committing is blocked by failing verification, unresolved questions, or unrelated conflicting changes, do not commit; explain the blocker and exact next step.

## Output

Reply with:

- completed phase
- files changed
- verification result
- commits created or commit blocker
- remaining unchecked phases
- whether `workflow-qa` should run next

Do not update `thoughts/index.md`; that belongs to `workflow-share` when the feature is finished.

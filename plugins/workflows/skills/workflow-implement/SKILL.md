---
name: workflow-implement
description: Use when implementing one or more phases from a Codex Workflows plan. Implements a single requested phase in-thread, or orchestrates fresh sequential phase-worker subagents for all remaining or multiple requested phases while preserving per-phase changelog, verification, staging, and commits.
---

# Feature Implement

Use this skill to implement planned phase work from:

```text
thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/plan.md
```

## Workflow

1. Read `plan.md`, `research.md` if present, and `changelog.md` if present.
2. Resolve phase selection:
   - no phase mentioned: all remaining unchecked phases in `plan.md`, in order
   - exactly one phase mentioned: that phase only
   - multiple phases mentioned: exactly those phases, in plan order unless the user gave an explicit order
3. If exactly one phase is selected, implement it in the current thread using the existing single-phase workflow:
   - Review `## Opening Questions` and the selected phase's `Blocking Questions`.
   - Ask the user before editing only when an unresolved question blocks the selected phase. If a question is already answered by repo context, record the decision in the implementation summary instead of asking.
   - Use `codebase-analyzer` for unfamiliar implementation paths before editing.
   - Use `codebase-pattern-finder` before adding new code that should match local conventions.
   - Use `test-writer` when the phase requires new or updated tests.
   - Use `error-analyzer` if verification fails with a non-obvious error.
   - Implement only that phase unless the user explicitly expands scope.
   - Complete only the selected phase's task checkboxes in `plan.md`; leave future phase tasks unchecked.
   - Run the selected phase verification from the overview table and phase section when feasible.
   - Update `changelog.md` with date, completed phase, files changed, behavior changed, and verification performed or still missing.
   - Mark only the completed phase checkbox in `plan.md` when all required phase tasks are done.
   - Review the diff and stage only files relevant to the completed phase.
   - Create one or more commits for coherent related chunks on the current branch. Tie commit messages to the completed phase.
   - Leave unfinished phases and unrelated dirty work untouched.
4. If multiple phases are selected, act as the parent orchestrator:
   - Do not implement phase code in the parent thread.
   - Run one fresh phase-worker subagent with a clean context window per phase, sequentially.
   - Do not run phase workers in parallel unless `plan.md` explicitly says the selected phases have disjoint write scopes and no dependency order.
   - Before each worker starts, review unresolved opening questions and that phase's blocking questions. Ask the user only when a question blocks that phase and cannot be answered from repo context.
   - Give each worker only relevant context: `plan.md`, `research.md` if present, `changelog.md` if present, project instructions, the selected phase, prior completed phase summaries, and relevant changed-files notes.
   - Instruct each worker to follow the single-phase workflow for its selected phase.
   - Instruct each worker to update only its own phase checkboxes in `plan.md`, add its own `changelog.md` entry, run selected phase verification when feasible, review its own diff, stage only phase-relevant files, and create its own commit or commits before returning.
   - Instruct each worker not to revert unrelated changes or changes from earlier phase workers.
   - Require each worker to report completed phase, files changed, verification, commits created or blocker, and remaining risks.
   - After each worker returns, review the result, confirm the expected phase was completed, record the worker summary, and continue to the next phase.
   - If a worker reports a blocker, stop the sequence and report the blocker, completed phases, commits already created, and the exact next step.
   - Preserve phase commit history. Do not squash phase commits.
   - If integration work is needed between completed phases, make a separate clearly named integration commit.
5. If all selected phases complete and no unchecked phases remain, tell the user to run `workflow-qa` for the final quality gate and PR readiness check.

## Agent Use

| Need | Agent |
|---|---|
| Implement one selected phase in a clean context during multi-phase orchestration | Fresh phase-worker subagent |
| Re-understand code before editing | `codebase-analyzer` |
| Match local implementation style | `codebase-pattern-finder` |
| Generate focused tests | `test-writer` |
| Diagnose failing checks | `error-analyzer` |

Phase-worker subagents are for multi-phase implementation only. Use one worker per phase. The parent thread stays responsible for phase selection, blocker checks, worker sequencing, result review, and final reporting.

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
- In multi-phase runs, each worker creates commits for its own phase before returning.
- Preserve phase commit history; the orchestrator must not squash phase commits.
- If parent-level integration work is required after workers finish, create a separate integration commit with a clear subject.
- Use `git diff` or equivalent before staging.
- Stage with path-level or patch-level selection so unrelated work is not included.
- If committing is blocked by failing verification, unresolved questions, or unrelated conflicting changes, do not commit; explain the blocker and exact next step.

## Output

Reply with:

- completed phase or phases
- files changed by phase
- verification result by phase
- commits created by phase, integration commit if any, or commit blocker
- remaining unchecked phases
- whether `workflow-qa` should run next

For a worker blocker, reply with the blocker, completed phases, commits already created, and the exact next step.

Do not update `thoughts/index.md`; that belongs to `workflow-share` when the feature is finished.

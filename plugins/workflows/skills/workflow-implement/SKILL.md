---
name: workflow-implement
description: Use when implementing one or more phases from a Codex Workflows plan. Updates code, plan, changelog, and verification notes without staging or committing; use workflow-review or workflow-commit afterward.
---

# Feature Implement

Use this skill to implement planned phase work from `.context/plans/.../plan.md`.

## Workflow

1. Read `plan.md`, `research.md` if present, and `changelog.md` if present.
   - For UX, redesign, or frontend UI phases, also read `spec.md`, `.context/docs/design.md` or the configured `design.file`, and relevant UI source before editing.
2. Resolve phase selection:
   - no phase mentioned: all remaining unchecked phases in `plan.md`, in order
   - exactly one phase mentioned: that phase only
   - multiple phases mentioned: exactly those phases, in plan order unless the user gave an explicit order
3. If exactly one phase is selected, implement it in the current thread using the existing single-phase workflow:
   - Review `## Opening Questions` and the selected phase's `Blocking Questions`.
   - Ask the user before editing only when an unresolved question blocks the selected phase. If a question is already answered by repo context, record the decision in the implementation summary instead of asking.
   - For UI/UX work, do not invent visual direction, interaction behavior, responsive behavior, accessibility tradeoffs, or copy hierarchy when `design.md`, the plan, and existing UI are insufficient. Ask focused questions before editing, or mark the phase blocked when a required design decision is missing.
   - Use `codebase-analyzer` for unfamiliar implementation paths before editing.
   - Use `codebase-pattern-finder` before adding new code that should match local conventions.
   - Use `test-writer` when the phase requires new or updated tests.
   - Use `error-analyzer` if verification fails with a non-obvious error.
   - Implement only that phase unless the user explicitly expands scope.
   - Complete only the selected phase's task checkboxes in `plan.md`; leave future phase tasks unchecked.
   - Run the selected phase verification from the overview table and phase section when feasible.
   - For UI/UX work, include the planned visual/manual verification when feasible, such as screenshots, responsive viewport checks, accessibility checks, interaction states, and text-overflow checks.
   - Update `changelog.md` with date, completed phase, files changed, behavior changed, and verification performed or still missing.
   - Mark only the completed phase checkbox in `plan.md` when all required phase tasks are done.
   - Update the overview table `Status` column: set the selected completed phase to `Ready for review`, keep future unfinished phases as `Pending`, and leave already accepted phases as `Implemented`.
   - Review the diff and identify files relevant to the completed phase.
   - Do not stage or commit. Recommend `workflow-review` before commit when the phase needs a review pass; otherwise recommend `workflow-commit` for user-confirmed staging and commit creation.
   - Leave unfinished phases and unrelated dirty work untouched.
4. If multiple phases are selected, act as the parent orchestrator:
   - Do not implement phase code in the parent thread.
   - Run one fresh phase-worker subagent with a clean context window per phase, sequentially.
   - Do not run phase workers in parallel unless `plan.md` explicitly says the selected phases have disjoint write scopes and no dependency order.
   - Before each worker starts, review unresolved opening questions and that phase's blocking questions. Ask the user only when a question blocks that phase and cannot be answered from repo context.
   - For UI/UX phases, include `design.md` guidance and any resolved design decisions in the worker context.
   - Give each worker only relevant context: `plan.md`, `research.md` if present, `changelog.md` if present, project instructions, the selected phase, prior completed phase summaries, and relevant changed-files notes.
   - Instruct each worker to follow the single-phase workflow for its selected phase.
   - Instruct each worker to update only its own phase checkboxes and overview table `Status` value in `plan.md`, add its own `changelog.md` entry, run selected phase verification when feasible, review its own diff, and avoid staging or committing.
   - Instruct each worker not to revert unrelated changes or changes from earlier phase workers.
   - Require each worker to report completed phase, files changed, verification, commit recommendation or blocker, and remaining risks.
   - After each worker returns, review the result, confirm the expected phase was completed, record the worker summary, and continue to the next phase.
   - If a worker reports a blocker, stop the sequence and report the blocker, completed phases, uncommitted changes, and the exact next step.
5. If all selected phases complete and no unchecked phases remain, tell the user to run `workflow-review` if a review pass is useful, `workflow-commit` if uncommitted work remains, then `workflow-qa` for the final quality gate.

## Question Handling

When asking the user for missing input, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`.

If `request_user_input` is unavailable, ask in chat:

- Long-answer questions: one numbered question at a time, with a recommended default.
- Short-answer questions: a numbered list.
- Always recommend a good option.

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

- `workflow-implement` never stages or commits.
- Prefer one later `workflow-commit` commit per completed phase.
- Split commits only when the phase contains clearly separate related chunks, such as runtime changes and documentation changes.
- Use `git diff` or equivalent before recommending a commit boundary.
- If committing would be blocked by failing verification, unresolved questions, or unrelated conflicting changes, explain the blocker and exact next step.

## Output

Reply with:

- completed phase or phases
- files changed by phase
- verification result by phase
- commit recommendation or blocker by phase
- remaining unchecked phases
- whether `workflow-review`, `workflow-commit`, or `workflow-qa` should run next

For a worker blocker, reply with the blocker, completed phases, uncommitted files, and the exact next step.

Do not update feature indexes during implementation. Index updates belong in final cleanup or `workflow-update` when the user explicitly asks.

---
name: workflow-verify
description: Use when tactically verifying a Codex Workflows feature implementation. Runs or recommends build, lint, test, and manual checks, then summarizes results concisely.
---

# Verify Implementation

Use this skill to verify implementation work without dumping raw logs.

This is a tactical check-running skill. It is useful during implementation or when the user wants to re-run checks, but it is not the final feature quality gate. After all phases are complete, use `workflow-qa`; that skill reviews the full feature record, branch changes, verification coverage, and PR readiness.

## Workflow

1. Read the feature's `plan.md` and `changelog.md` when available.
2. Read `.context/docs/commands.md` and `.context/docs/testing.md` when present to discover project-specific commands.
   - If `.context/workflows.yaml` records legacy `.context/commands.md` or `.context/testing.md`, read those as fallback.
   - If the new docs do not exist but legacy files do, read the legacy files.
3. Identify required verification from the plan overview table and acceptance criteria.
4. Run relevant checks when feasible.
5. Use `error-analyzer` for cryptic failures, stack traces, or log-heavy failures.
6. Use `test-writer` if verification reveals a missing regression test and the user asked for test updates.
7. If checks cannot run, explain why and give the exact command the user or next agent should run.
8. Update `changelog.md` only when the user asked you to record verification or when verification belongs to an implementation phase you just completed.

## Agent Use

| Need | Agent |
|---|---|
| Diagnose failures | `error-analyzer` |
| Draft missing tests | `test-writer` |
| Confirm external current behavior | `web-search-researcher` |

## Question Handling

If missing input blocks verification, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`. If unavailable, ask numbered chat questions, ask long-answer questions one at a time, and always include a recommended option.

## Output

Reply with:

- checks run
- pass/fail/skipped status
- key failures, if any
- residual risk
- recommended next action

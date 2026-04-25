---
name: workflow-verify
description: Use when verifying a Codex Workflows feature implementation. Runs or recommends build, lint, test, and manual checks, then summarizes results concisely.
---

# Verify Implementation

Use this skill to verify implementation work without dumping raw logs.

## Workflow

1. Read the feature's `plan.md` and `changelog.md` when available.
2. Identify required verification from the plan overview table and acceptance criteria.
3. Run relevant checks when feasible.
4. Use `error-analyzer` for cryptic failures, stack traces, or log-heavy failures.
5. Use `test-writer` if verification reveals a missing regression test and the user asked for test updates.
6. If checks cannot run, explain why and give the exact command the user or next agent should run.
7. Update `changelog.md` only when the user asked you to record verification or when verification belongs to an implementation phase you just completed.

## Agent Use

| Need | Agent |
|---|---|
| Diagnose failures | `error-analyzer` |
| Draft missing tests | `test-writer` |
| Confirm external current behavior | `web-search-researcher` |

## Output

Reply with:

- checks run
- pass/fail/skipped status
- key failures, if any
- residual risk
- recommended next action

---
name: workflow-qa
description: Use after all Codex Workflows plan phases are complete to quality-control research, plan, changelog, branch changes, verification coverage, commits, and readiness before workflow-pr.
---

# Feature QA

Use this skill after the final planned phase is implemented.

`workflow-qa` is the final quality gate. It includes verification coverage checks, so the user should not need to run `workflow-verify` separately unless they only want tactical check-running.

## Inputs

Prefer an existing feature folder under `.context/plans/`.

If no folder is specified, use the most recent feature folder whose `plan.md` has all phases completed.

## Workflow

1. Read `research.md`, `plan.md`, and `changelog.md`.
   - For UX, redesign, or frontend UI work, also read `spec.md` when present and `.context/docs/design.md` or the configured `design.file`.
2. Inspect the current branch name, working tree status, recent commits, and changed files.
3. Confirm the plan is complete:
   - all phase completion checkboxes are checked
   - all task checkboxes for completed phases are checked
   - all overview table phase statuses are `Implemented`
   - no blocking questions remain unresolved
4. Confirm the feature record is consistent:
   - research decisions and constraints are reflected in the plan
   - changelog entries match the completed phases
   - changed files and commits, or intentional uncommitted implementation files, match the changelog
   - verification results or explicit verification gaps are recorded
5. Confirm implementation readiness:
   - branch changes match the plan intent
   - no unrelated dirty work is included
   - no obvious TODOs, debug leftovers, or incomplete docs block review
6. Run missing final verification when feasible, using the plan overview, phase verification, and acceptance criteria as the source of truth.
   - For UI/UX work, confirm planned screenshot/manual checks, responsive viewport checks, accessibility checks, interaction states, and text-overflow checks are complete or explicitly recorded as gaps.
7. Use `error-analyzer` for cryptic failures, stack traces, or log-heavy failures.
8. If the branch changes plugin runtime behavior, skill instructions, templates, plugin metadata, or user-facing workflow docs, confirm `plugins/workflows/.codex-plugin/plugin.json` has an appropriate semver bump.
9. If the feature produced durable decisions, conventions, feature outcomes, or gotchas that future work should reuse, confirm they are recorded in `.context/knowledge/index.md` or recommend `workflow-remember` before PR creation.
10. If any QA problem remains, report the required fixes and do not recommend PR creation.
11. If QA passes, recommend `workflow-pr` when the branch is ready for a ready-for-review PR.
12. If PR creation is blocked by missing commits, GitHub context, permissions, or tooling, report the exact fallback command or action.
13. Report what users need to do after merge:
   - run `codex plugin marketplace upgrade codex-workflows` for plugin changes
   - start a new Codex thread after upgrading

## Agent Use

| Need | Agent |
|---|---|
| Summarize feature docs | `context-analyzer` |
| Locate related prior docs | `context-locator` |
| Diagnose failing checks | `error-analyzer` |
| Draft missing tests | `test-writer` |

## QA Report

When QA finds problems, report:

- status: blocked
- blocking issues
- changed files or commits involved
- verification gaps
- exact next fixes

When QA passes, report:

- status: passed
- checks run
- commits reviewed
- whether durable knowledge should be updated with `workflow-remember`
- residual risk, if any
- whether `workflow-pr` should run next

## PR Guidance

- PR creation belongs to `workflow-pr`.
- The PR body should summarize the feature, link the feature folder, list verification, and call out residual risks.
- The PR body should mention the plugin version bump when plugin files changed.
- Do not create a PR when the working tree contains unrelated dirty changes, planned tasks are unchecked, blocking questions remain, or verification required by the plan has failed.
- The PR result should include post-merge upgrade instructions for local Codex users.

## Question Handling

If missing input blocks QA, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`. If unavailable, ask numbered chat questions, ask long-answer questions one at a time, and always include a recommended option.

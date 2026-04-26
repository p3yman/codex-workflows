---
name: workflow-qa
description: Use after all Codex Workflows plan phases are complete to quality-control research, plan, changelog, branch changes, verification coverage, commits, and PR readiness before creating a draft PR.
---

# Feature QA

Use this skill after the final planned phase is implemented.

`workflow-qa` is the final quality gate. It includes verification coverage checks, so the user should not need to run `workflow-verify` separately unless they only want tactical check-running.

## Inputs

Prefer an existing feature folder:

```text
thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/
```

If no folder is specified, use the most recent feature folder whose `plan.md` has all phases completed.

## Workflow

1. Read `research.md`, `plan.md`, and `changelog.md`.
2. Inspect the current branch name, working tree status, recent commits, and changed files.
3. Confirm the plan is complete:
   - all phase completion checkboxes are checked
   - all task checkboxes for completed phases are checked
   - no blocking questions remain unresolved
4. Confirm the feature record is consistent:
   - research decisions and constraints are reflected in the plan
   - changelog entries match the completed phases
   - changed files and commits match the changelog
   - verification results or explicit verification gaps are recorded
5. Confirm implementation readiness:
   - branch changes match the plan intent
   - no unrelated dirty work is included
   - no obvious TODOs, debug leftovers, or incomplete docs block review
6. Run missing final verification when feasible, using the plan overview, phase verification, and acceptance criteria as the source of truth.
7. Use `error-analyzer` for cryptic failures, stack traces, or log-heavy failures.
8. If the branch changes plugin runtime behavior, skill instructions, templates, plugin metadata, or user-facing workflow docs, confirm `plugins/workflows/.codex-plugin/plugin.json` has an appropriate semver bump.
9. If any QA problem remains, report the required fixes and do not create a PR.
10. If QA passes, ask whether the user wants a draft PR.
11. If the user approves, create a draft PR for review using the available GitHub tooling.
12. If PR creation is blocked by missing GitHub context, permissions, or tooling, report the exact fallback command or action.
13. After creating or proposing the PR, report what users need to do after merge:
   - run `codex plugin marketplace upgrade codex-workflows` for plugin changes
   - start a new Codex thread after upgrading
   - run `./install-agents.sh` too when `agents/*.toml` changed

## Agent Use

| Need | Agent |
|---|---|
| Summarize feature docs | `thoughts-analyzer` |
| Locate related prior docs | `thoughts-locator` |
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
- residual risk, if any
- whether a draft PR was created or is awaiting approval

## PR Guidance

- Create a draft PR by default so the implementation can be reviewed before merge.
- The PR body should summarize the feature, link the feature folder, list verification, and call out residual risks.
- The PR body should mention the plugin version bump when plugin files changed.
- Do not create a PR when the working tree contains unrelated dirty changes, planned tasks are unchecked, blocking questions remain, or verification required by the plan has failed.
- The PR result should include post-merge upgrade instructions for local Codex users.

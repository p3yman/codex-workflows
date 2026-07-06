# Agent Guidance

Use the Codex Workflows ritual for substantial feature work:

```text
issue -> grill -> research -> spec -> technical-design -> plan -> implement -> review -> commit -> qa -> pr
```

This repo previously used `thoughts/` for feature records; that folder has been removed in favor of `.context/` workflow context.

## Question Handling

Ask the user only when missing input blocks safe progress. When the `request_user_input` tool is available in the current Codex mode and tool list, use it for user questions and put the recommended option first with `(Recommended)` in the label. If the tool is not available, ask in chat:

- For questions that may require long answers, ask one numbered question at a time and include a recommended default.
- For short-answer questions, ask a numbered list.
- Always recommend a good option instead of leaving the user to infer the preferred path.

Planning must include `## Opening Questions`, detailed phase sections, acceptance criteria, out of scope, verification, and an overview table with:

| Phase | Status | Short Description | T-shirt Size | Change Surface | Line Areas | Verification |
|---|---|---|---|---|---|---|

Each phase must include an objective, implementation decisions, task checklist, blocking questions, verification, and commit plan. Make plans decision-complete wherever repo evidence supports a choice; record only true implementation blockers as questions.

Before implementing a phase, inspect global opening questions and that phase's blocking questions. Ask the user only when unresolved questions block that phase. After implementing a phase, update `changelog.md`, mark only completed phase tasks and that phase complete in `plan.md`, update the overview table status, and note verification performed or still missing. Do not auto-commit from implementation; use `workflow-commit` for explicit user-confirmed staging and commits.

After the final phase, use `workflow-review` when a review pass is useful, use `workflow-remember` when durable decisions or conventions should be recorded in `.context/knowledge/index.md`, then use `workflow-qa` as the final quality gate. It checks research, plan, changelog, branch changes, commits or intentional dirty work, verification coverage, and PR readiness. If QA passes, use `workflow-pr` for a ready-for-review PR; if it fails, report required fixes and do not create a PR.

## Versioning and PRs

When a PR changes plugin runtime behavior, skill instructions, templates, plugin metadata, or user-facing workflow docs, bump `plugins/workflows/.codex-plugin/plugin.json` before creating the PR. Use the smallest appropriate semver bump:

- patch for skill/docs/template fixes and workflow guidance changes
- minor for new skills, new user-visible workflow capabilities, or compatible behavior additions
- major for breaking workflow contract changes

PR creation should report what users need to do after merge. At minimum, tell them to run `codex plugin marketplace upgrade codex-workflows` and start a new Codex thread.

## Workflow Agents

Use the installed custom agents when they match the task:

| Agent | Use |
|---|---|
| `codebase-locator` | Find relevant files and directories without analyzing implementation. |
| `codebase-analyzer` | Explain how code works with file and line references. |
| `codebase-pattern-finder` | Find similar implementations, conventions, and test examples. |
| `context-locator` | Find related documents in `.context/`, `.context/docs/`, and project `docs/`. |
| `context-analyzer` | Extract decisions, constraints, outcomes, and relevance from workflow and project docs. |
| `error-analyzer` | Diagnose errors, stack traces, failing checks, and root causes. |
| `test-writer` | Generate or propose tests that match project conventions. |
| `web-search-researcher` | Research current external docs, APIs, libraries, and web facts. |

In workflow skills, prefer agents for bounded research and diagnosis so the main thread stays focused on decisions, edits, and the `.context/` record.

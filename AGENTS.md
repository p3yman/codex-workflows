# Agent Guidance

Use the Codex Workflows ritual for substantial feature work:

```text
research -> plan -> implement phases -> qa -> share
```

Store feature memory in:

```text
thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/
  research.md
  plan.md
  changelog.md
```

Use `01` through `99` for the daily sequence. Pick the next available number for the same date. Use a lowercase kebab-case feature slug.

The root index is `thoughts/index.md`. When a feature is finished, append or update one compact entry with the date, sequence, feature slug, one-line review, and links to `research.md`, `plan.md`, and `changelog.md`.

Planning must include `## Opening Questions`, detailed phase sections, acceptance criteria, out of scope, verification, and an overview table with:

| Phase | Short Description | T-shirt Size | Change Surface | Line Areas | Verification |
|---|---|---|---|---|---|

Each phase must include an objective, implementation decisions, task checklist, blocking questions, verification, and commit plan. Make plans decision-complete wherever repo evidence supports a choice; record only true implementation blockers as questions.

Before implementing a phase, inspect global opening questions and that phase's blocking questions. Ask the user only when unresolved questions block that phase. After implementing a phase, update `changelog.md`, mark only completed phase tasks and that phase complete in `plan.md`, note verification performed or still missing, then stage and commit related chunks to the current branch.

After the final phase, use `workflow-qa` as the final quality gate. It checks research, plan, changelog, branch changes, commits, verification coverage, and PR readiness. If QA passes, ask whether to create a draft PR; if it fails, report required fixes and do not create a PR.

## Versioning and PRs

When a PR changes plugin runtime behavior, skill instructions, templates, plugin metadata, or user-facing workflow docs, bump `plugins/workflows/.codex-plugin/plugin.json` before creating the PR. Use the smallest appropriate semver bump:

- patch for skill/docs/template fixes and workflow guidance changes
- minor for new skills, new user-visible workflow capabilities, or compatible behavior additions
- major for breaking workflow contract changes

PR creation should report what users need to do after merge. At minimum, tell them to run `codex plugin marketplace upgrade codex-workflows` and start a new Codex thread. If `agents/*.toml` changed, also tell them to run `./install-agents.sh`.

## Workflow Agents

Use the installed custom agents when they match the task:

| Agent | Use |
|---|---|
| `codebase-locator` | Find relevant files and directories without analyzing implementation. |
| `codebase-analyzer` | Explain how code works with file and line references. |
| `codebase-pattern-finder` | Find similar implementations, conventions, and test examples. |
| `thoughts-locator` | Find related documents in `thoughts/`. |
| `thoughts-analyzer` | Extract decisions, constraints, outcomes, and relevance from thoughts docs. |
| `error-analyzer` | Diagnose errors, stack traces, failing checks, and root causes. |
| `test-writer` | Generate or propose tests that match project conventions. |
| `web-search-researcher` | Research current external docs, APIs, libraries, and web facts. |

In workflow skills, prefer agents for bounded research and diagnosis so the main thread stays focused on decisions, edits, and the `thoughts/` record.

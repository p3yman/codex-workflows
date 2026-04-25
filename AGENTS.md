# Agent Guidance

Use the Codex Workflows ritual for substantial feature work:

```text
research -> plan -> implement -> verify -> share
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

Planning must include an overview table with:

| Phase | Short Description | T-shirt Size | Change Surface | Line Areas | Verification |
|---|---|---|---|---|---|

Also include checkbox phases in `plan.md`. After implementing a phase, update `changelog.md`, mark only that phase complete in `plan.md`, and note verification performed or still missing.

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

# Codex Workflows

Codex Workflows is a small plugin for feature work that should survive context resets. It keeps the work in a project-local `thoughts/` folder and follows a simple rhythm:

```text
research -> plan -> implement phases -> qa -> share
```

Each feature gets a dated folder:

```text
thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/
  research.md
  plan.md
  changelog.md
```

Example:

```text
thoughts/2026-04-25-01-auth-sso/
  research.md
  plan.md
  changelog.md
```

The feature index lives at `thoughts/index.md`. When work is finished, update it with a one-line review and links to the feature's research, plan, and changelog.

## Skills

- `$workflow-research`: create or update `research.md` for a dated feature folder.
- `$workflow-plan`: create a decision-complete `plan.md` from research/context with detailed phase tasks and blocking questions.
- `$workflow-implement`: implement one phase at a time, resolve blocking questions, update `changelog.md`, mark completed phase tasks, and commit related chunks.
- `$workflow-verify`: tactically run or re-run verification and summarize results.
- `$workflow-qa`: final quality gate across research, plan, changelog, branch changes, commits, verification coverage, and draft PR readiness.
- `$workflow-share`: finalize the feature, update `thoughts/index.md`, and produce a concise review.

## Install

Codex Workflows is installed once per machine as a Codex plugin. You do not copy the plugin into every project.

The plugin is global to your Codex setup. The files it creates while you work, like `thoughts/2026-04-25-01-auth-sso/research.md`, are project-local and live in whichever project repo Codex is currently working in.

Add this repo as a plugin marketplace on a machine:

```bash
codex plugin marketplace add peyman/codex-workflows --ref main
```

Then open `/plugins`, install **Workflows**, and start a new Codex thread.

## Global Agents

The plugin provides the workflow skills. The `agents/` directory provides custom agents that make those skills useful for focused research, implementation support, and verification:

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

Codex custom agents are machine-local, so the install script copies them once into your Codex home:

```bash
./install-agents.sh
```

The installer copies `agents/*.toml` to `~/.codex/agents/`, or to `$CODEX_HOME/agents/` if `CODEX_HOME` is set. You only need to rerun it after changing the agent files.

`AGENTS.md` in this repository is for maintaining this plugin repo. It is not read automatically when you use the installed plugin from another project. Runtime behavior lives in the installed `workflow-*` skills and the custom agent TOMLs.

## Workflow Contract

Planning output must include `## Opening Questions`, an overview table, detailed phase sections, acceptance criteria, out of scope, and verification.

The overview table must use:

| Phase | Short Description | T-shirt Size | Change Surface | Line Areas | Verification |
|---|---|---|---|---|---|

`Change Surface` describes expected files and modules. `Line Areas` describes known functions, sections, selectors, docs headings, or exact line numbers when research found them. Do not invent exact line numbers before implementation.

Each `plan.md` phase must include an objective, implementation decisions, task checklist, blocking questions, verification, and commit plan. Plans should be decision-complete wherever repo evidence supports a choice; only true implementation blockers should remain as questions.

When a phase is implemented, resolve or ask blocking questions first, update `changelog.md`, mark only completed phase tasks and the completed phase checkbox, then stage and commit related chunks on the current branch. When the final phase is complete, run `$workflow-qa` instead of separately running `$workflow-verify`.

`$workflow-qa` checks that research, plan, implementation, changelog, commits, and verification agree. If problems remain, it reports required fixes and does not create a PR. If QA passes, it asks whether to create a draft PR for review.

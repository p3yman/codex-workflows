# Codex Workflows

Codex Workflows is a Codex plugin for durable feature work. It gives Codex a repeatable path from a rough issue to a ready pull request, with project-local context, issue clarification, research, planning, implementation, review, verification, and PR creation kept as explicit steps.

Setup is a prerequisite, not part of the feature lifecycle. Run setup once per project, then use the workflow lifecycle for each issue.

## Install

Add this repository as a plugin marketplace:

```bash
codex plugin marketplace add p3yman/codex-workflows --ref main
```

Then install the plugin:

1. Open Codex.
2. Open `/plugins`.
3. Select the **Workflows** plugin.
4. Install or enable it.
5. Start a new Codex thread so the workflow skills are loaded.

After a new version is merged, upgrade the local plugin cache:

```bash
codex plugin marketplace upgrade codex-workflows
```

Start a new Codex thread after upgrading.

## Project Setup

Run setup once in each target project before using the lifecycle. For projects with UI, frontend, or product-design work, run design setup immediately after project setup so `.context/docs/design.md` becomes a real design-system baseline instead of only a starter file.

Recommended setup:

```text
$workflow-setup
Set up Codex Workflows for this project.
```

`$workflow-setup` inspects the project, asks for solo or team mode when needed, creates missing `.context/` files, creates starter `.context/docs/` files, records existing docs, updates the managed Codex Workflows block in `AGENTS.md`, and preserves existing project guidance.

Recommended design setup for UI/front-end projects:

```text
$workflow-setup-design
Create or refresh the project design doc from existing code, docs, styles, tokens, and components.
```

`$workflow-setup-design` runs after `$workflow-setup`. It reads the existing project UI, CSS, tokens, components, Storybook patterns, and docs, then expands `.context/docs/design.md` into DESIGN.md-style guidance with machine-readable front matter and human-readable rules. Skip it only for projects where UI/UX design guidance is irrelevant.

When a workflow skill needs user input, it should use `request_user_input` when that tool is available in the current Codex mode and tool list. The recommended option should be first and labeled `(Recommended)`. If the tool is unavailable, the skill should ask in chat: long-answer questions one numbered question at a time with a recommended default, and short-answer questions as a numbered list. Every question set should recommend a good option.

Manual setup is useful when you want to create the structure yourself:

```bash
mkdir -p .context/docs .context/knowledge .context/plans/local .context/plans/shared
touch .context/docs/index.md .context/docs/design.md .context/docs/commands.md .context/docs/testing.md .context/docs/issue.md
touch .context/knowledge/index.md .context/plans/index.md
```

Create `.context/workflows.yaml`:

```yaml
# Codex Workflows project configuration.
version: 1
mode: "solo"
docs:
  canonical_dir: ".context/docs"
  index: ".context/docs/index.md"
  existing: []
design:
  file: ".context/docs/design.md"
plans:
  default_scope: "local"
  local_dir: ".context/plans/local"
  shared_dir: ".context/plans/shared"
knowledge:
  index: ".context/knowledge/index.md"
commands:
  file: ".context/docs/commands.md"
testing:
  file: ".context/docs/testing.md"
issues:
  file: ".context/docs/issue.md"
legacy:
  commands_file: null
  testing_file: null
```

Add a project `AGENTS.md` note that points Codex at `.context/workflows.yaml`, `.context/docs/`, `.context/knowledge/index.md`, and `.context/plans/`. In team mode, add `.context/plans/local/` to `.gitignore`.

## Lifecycle

The feature lifecycle starts with an issue and ends with a ready PR:

```text
issue -> grill -> research -> spec -> technical-design -> plan -> implement -> review -> commit -> qa -> pr
```

`spec` and `technical-design` are optional gates. Use them when the work is ambiguous, product-sensitive, architecture-heavy, or likely to drift without a dedicated artifact. Use `$workflow-td` as the short alias for `$workflow-technical-design`.

Reusable UI/UX design-system guidance belongs in `.context/docs/design.md`. Setup creates this file when missing, and `$workflow-setup-design` can refresh it from existing code, docs, styles, tokens, and components.

For UX, redesign, or frontend UI work, `$workflow-research`, `$workflow-spec`, `$workflow-plan`, and `$workflow-implement` should read `design.md` and existing UI before making decisions. Agents should ask focused UI/UX questions only when product intent, visual direction, layout, interaction states, accessibility, responsive behavior, or success criteria cannot be inferred from that context.

Question handling is consistent across the lifecycle: use `request_user_input` when available; otherwise ask numbered questions in chat. Ask likely long-answer questions one at a time, ask short-answer questions as a numbered list, and always include a recommended option or default.

Review can happen after each phase implementation, before each commit, or across the whole completed feature before QA. For best results, review risky phase work before committing it, then run a final review before QA when the feature has meaningful behavior or documentation impact.

Remember is optional. Run it before final QA when the feature creates durable decisions, conventions, or gotchas that should be committed with the work.

```text
Issue  ->  Grill  ->  Research
                       |
Plan   <-  TD     <-  Spec
|
v
Implement phase  ->  Review  ->  Commit
^                               |
|                               v
+--------- yes  <-  More phases?
                                |
                                no
                                v
                               QA  ->  PR
                               |
                               +-- fixes needed -> Implement phase
```

| Stage | Skill | Best Result |
|---|---|---|
| Issue | `$workflow-issue` or `$workflow-intake` | A clear Linear issue with outcome, scope, acceptance criteria, raw capture, and handoff path. |
| Grill | `$workflow-grill` | Assumptions challenged, weak reasoning exposed, scope tightened, blocking questions separated from non-blocking unknowns. |
| Research | `$workflow-research` | Current behavior, relevant files, constraints, risks, prior context, and a recommendation captured in `research.md`. |
| Spec | `$workflow-spec` | Requirements, user stories, product decisions, acceptance criteria, and open questions captured before planning. |
| Technical Design | `$workflow-technical-design` or `$workflow-td` | Architecture, data flow, migrations, security, performance, and operational tradeoffs decided before planning. |
| Plan | `$workflow-plan` | A decision-complete `plan.md` with phase table, acceptance criteria, out of scope, blocking questions, verification, and commit guidance. |
| Implement | `$workflow-implement` | One or more planned phases implemented, `plan.md` status updated, `changelog.md` updated, verification noted, no commit created. |
| Review | `$workflow-review` | Correctness, behavior regressions, test gaps, maintainability, docs impact, and residual risk checked before commit or QA. |
| Commit | `$workflow-commit` | Relevant files staged intentionally and a user-confirmed commit created for completed phase work. |
| Verify | `$workflow-verify` | Tactical build, lint, test, or manual checks run when needed during implementation. |
| Remember | `$workflow-remember` | Durable decisions, conventions, feature outcomes, and gotchas extracted into `.context/knowledge/index.md` when future work should reuse them. |
| QA | `$workflow-qa` | Final quality gate confirms docs, plan status, changelog, verification, branch state, and PR readiness agree. |
| PR | `$workflow-pr` | Ready-for-review pull request created with feature links, verification, risks, and post-merge guidance. |
| Update | `$workflow-update` | Existing workflow artifacts synchronized after requirement changes, design drift, implementation discoveries, review findings, QA findings, or broken indexes. |

## Skills

| Skill | Use |
|---|---|
| `$workflow-setup` | Initialize or repair project-local workflow context. This is outside the issue-to-PR lifecycle. |
| `$workflow-setup-design` | Create or refresh `.context/docs/design.md` as UI/UX design-system guidance. |
| `$workflow-issue` | Alias-style issue intake for users who think in issues. |
| `$workflow-intake` | Turn rough ideas, bugs, chores, redesigns, or vague Linear tickets into clear Linear issues. |
| `$workflow-grill` | Challenge and clarify a rough issue before research or planning. |
| `$workflow-research` | Create or update research for the issue. |
| `$workflow-spec` | Clarify requirements before planning. |
| `$workflow-technical-design` | Decide architecture and implementation strategy before planning. |
| `$workflow-td` | Short alias for `$workflow-technical-design`. |
| `$workflow-plan` | Create a detailed, decision-complete implementation plan. |
| `$workflow-implement` | Implement planned phases and update workflow artifacts without committing. |
| `$workflow-review` | Review phase work or whole-feature work for bugs, gaps, and risk. |
| `$workflow-commit` | Stage relevant changes and create a user-confirmed commit. |
| `$workflow-verify` | Run or rerun tactical verification. |
| `$workflow-remember` | Record durable project memory in `.context/knowledge/index.md`. |
| `$workflow-qa` | Run the final feature quality gate before PR creation. |
| `$workflow-pr` | Create a ready-for-review PR after QA passes. |
| `$workflow-update` | Refresh workflow artifacts when reality changes. |

## Migrating Existing Projects

Use `$workflow-setup` in projects that already have docs or older workflow notes. Setup records existing root docs and legacy command/testing files in `.context/workflows.yaml` so Codex can keep reading them without moving or deleting anything.

After setup:

1. Use `$workflow-research`, `$workflow-plan`, or `$workflow-update` to continue active work under the new `.context/` system.
2. Use `$workflow-update` when existing workflow artifacts or indexes need to be synchronized.
3. Move or copy existing docs into `.context/docs/` only when you explicitly want a docs migration; update `.context/workflows.yaml` and links in the same change.

## Project Memory

Codex Workflows separates feature artifacts from durable project memory:

| Path | Purpose |
|---|---|
| `.context/docs/` | Reusable project reference docs: overview, UI/UX design, architecture, conventions, commands, testing, issue routing, and operations. |
| `.context/plans/` | Per-feature work: research, spec, technical design, plan, changelog, review, and QA context. |
| `.context/knowledge/index.md` | Cross-feature memory: durable decisions, conventions, feature outcomes, gotchas, important docs, and external references. |

Use `$workflow-remember` when a decision or discovery should affect future work:

```text
$workflow-remember
Record the durable decisions from this billing feature.
```

Good memory is compact and reusable:

```md
- 2026-07-06: Billing is team-scoped, not user-scoped. Store Stripe customer and subscription IDs on `teams`; process Stripe webhooks idempotently through `billing_events`. Source: `.context/plans/shared/2026-07-06-01-team-billing/technical-design.md`.
```

Do not use knowledge for phase logs, temporary TODOs, or detailed feature history. Keep those in the feature folder.

## Custom Agents

Normal plugin installation does not require `install-agents.sh`.

Verified against the current official Codex docs for [Skills](https://developers.openai.com/codex/skills) and [Subagents](https://developers.openai.com/codex/subagents): plugins distribute skills, apps, and MCP configuration; skills can include optional `agents/openai.yaml` metadata for UI and dependencies; custom subagents are still standalone TOML files under `~/.codex/agents/` for personal agents or `.codex/agents/` for project-scoped agents.

This repository keeps `agents/*.toml` as optional development helpers for this plugin repo. Use them only if you want these exact custom subagent roles available locally:

| Agent | Use |
|---|---|
| `codebase-locator` | Find relevant files and directories without analyzing implementation. |
| `codebase-analyzer` | Explain how code works with file and line references. |
| `codebase-pattern-finder` | Find similar implementations, conventions, and test examples. |
| `context-locator` | Find related documents in `.context/`, `.context/docs/`, and project docs. |
| `context-analyzer` | Extract decisions, constraints, outcomes, and relevance from workflow and project docs. |
| `error-analyzer` | Diagnose errors, stack traces, failing checks, and root causes. |
| `test-writer` | Generate or propose tests that match project conventions. |
| `web-search-researcher` | Research current external docs, APIs, libraries, and web facts. |

If you choose to install these optional agents globally:

```bash
./install-agents.sh
```

Prefer project-scoped agents in new projects when the agent behavior should travel with that project.

## Workflow Contract

Planning output must include `## Opening Questions`, an overview table, detailed phase sections, acceptance criteria, out of scope, and verification. Plans may use research, spec, technical design, and `.context/docs/design.md` inputs.

The overview table must use:

| Phase | Status | Short Description | T-shirt Size | Change Surface | Line Areas | Verification |
|---|---|---|---|---|---|---|

`Status` is `Pending`, `Ready for review`, or `Implemented`. New phases start as `Pending`; implementation marks completed phase work as `Ready for review`; commit or accepted completion marks the phase as `Implemented`. `Change Surface` describes expected files and modules. `Line Areas` describes known functions, sections, selectors, docs headings, or exact line numbers when research found them. Do not invent exact line numbers before implementation.

Each `plan.md` phase must include an objective, implementation decisions, task checklist, blocking questions, verification, and commit plan. Plans should be decision-complete wherever repo evidence supports a choice; only true implementation blockers should remain as questions.

For UI/UX phases, implementation decisions must state how the work follows `design.md`, including layout, visual hierarchy, component behavior, responsive behavior, accessibility expectations, and manual or screenshot verification. If those details are not clear from existing docs or UI, record specific blocking questions before implementation.

When a phase is implemented, resolve or ask blocking questions first using the workflow question-handling rule, update `changelog.md`, mark only completed phase tasks and the completed phase checkbox, update the overview table status, then stop with the changes uncommitted. Use `$workflow-review` when the phase should be checked before commit, then use `$workflow-commit` to stage and commit only the relevant files.

When the final phase is complete, run `$workflow-review` if a whole-feature review is useful. Use `$workflow-remember` before final QA when the feature produced durable decisions or conventions that should be committed with the work. Then run `$workflow-qa` as the final quality gate. `$workflow-qa` checks that research, plan, implementation, changelog, commits, and verification agree. If problems remain, it reports required fixes and does not create a PR. If QA passes, use `$workflow-pr` to create a ready-for-review PR.

## Post-Merge Guidance

When a PR changes workflow skills, templates, plugin metadata, or user-facing docs:

```bash
codex plugin marketplace upgrade codex-workflows
```

Then start a new Codex thread.

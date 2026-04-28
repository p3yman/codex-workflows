# Plan: Workflow Intake Skill

Feature folder: `thoughts/2026-04-28-01-workflow-intake-skill`

## Opening Questions

- None.

## Overview

| Phase | Short Description | T-shirt Size | Change Surface | Line Areas | Verification |
|---|---|---|---|---|---|
| Phase 1: Add intake skill | Add Linear issue intake skill, template, docs, and plugin metadata. | S | `plugins/workflows/skills`, `plugins/workflows/assets/templates`, `README.md`, plugin metadata | Skill frontmatter/body, template sections, README skill list, plugin interface | Inspect files, validate JSON, review git diff |

## Phases

### Phase 1: Add intake skill

- [x] Phase 1 complete

Objective:
- Add a workflow skill that refines raw ideas and vague Linear issues into actionable Linear tickets without forcing all work into `thoughts/`.

Implementation Decisions:
- Name the skill `workflow-intake`.
- Keep intake output in Linear by default.
- Add a reusable markdown template for Linear issue descriptions.
- Include classification by type, size, and path so small chores and large features both fit.
- Recommend `$workflow-research` or `$workflow-plan` only when the refined issue is ready for those workflows.
- Bump plugin version from `0.1.2` to `0.2.0` because this adds a new user-visible workflow capability.

Tasks:
- [x] Add `plugins/workflows/skills/workflow-intake/SKILL.md`.
- [x] Add `plugins/workflows/assets/templates/linear-intake-issue.md`.
- [x] Update plugin metadata and prompts.
- [x] Update README skill list.
- [x] Record research, plan, and changelog.

Blocking Questions:
- None.

Verification:
- `python3 -m json.tool plugins/workflows/.codex-plugin/plugin.json`
- `git diff --check`

Commit Plan:
- Commit all related intake skill, docs, metadata, and workflow memory changes together.

## Acceptance Criteria

- `$workflow-intake` triggers for rough ideas, voice-to-text captures, vague Linear tickets, bugs, chores, features, improvements, docs, UX, and redesign requests.
- The skill directs Codex to create or update Linear issues rather than project-local `thoughts/` by default.
- The Linear issue template captures summary, outcome, context, acceptance criteria, research notes, open questions, workflow handoff, and optional raw capture.
- The skill explains when to use agents and when to keep intake lightweight.
- README and plugin metadata expose the new skill.

## Out of Scope

- Creating Linear MCP tools or changing the Linear plugin.
- Automatically promoting every issue into workflow research or planning.
- Changing existing workflow research, planning, implementation, QA, or share behavior.

## Verification

- Validate plugin JSON.
- Check diff whitespace.
- Review the new skill for concise trigger metadata and clear handoff behavior.

# Research: Workflow Intake Skill

Feature folder: `thoughts/2026-04-28-01-workflow-intake-skill`

## Question

Create a workflow skill for capturing rough voice-to-text ideas or vague Linear issues, refining them with lightweight research and clarification, and leaving a reusable Linear issue that can later feed workflow research or planning.

## Findings

- Existing workflow skills are concise `SKILL.md` files under `plugins/workflows/skills/{skill-name}/`.
- The plugin currently covers `research -> plan -> implement phases -> qa -> share`, but not pre-research issue intake.
- Existing workflow guidance prefers specialized agents for bounded repo research and diagnosis.
- User need spans many issue sizes and types, so the skill must avoid forcing every idea into a large feature flow.

## Existing Patterns

- `workflow-research` creates project-local `thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/research.md`.
- `workflow-plan` can consume existing context directly when enough information exists.
- Skills list agent choices in compact tables and end with explicit output requirements.
- Plugin metadata and README list each user-facing skill.

## Relevant Files

- `plugins/workflows/skills/workflow-research/SKILL.md`
- `plugins/workflows/skills/workflow-plan/SKILL.md`
- `plugins/workflows/.codex-plugin/plugin.json`
- `README.md`

## Open Questions

- None blocking. The default name selected is `workflow-intake` because it covers capture, triage, and Linear handoff without implying large feature work.

## Recommendation

- Add `$workflow-intake` as a new Workflows skill.
- Add a reusable Linear issue template for intake output.
- Bump the plugin minor version because this is a new user-visible workflow capability.

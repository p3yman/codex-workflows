# Research: Workflow QA Phase Lifecycle

Feature folder: `thoughts/2026-04-26-01-workflow-qa-phase-lifecycle`

## Summary

The workflow plugin is markdown-driven. Runtime behavior lives in `plugins/workflows/skills/*.md`, defaults live in `plugins/workflows/assets/templates/*.md`, and public guidance lives in `README.md`, `AGENTS.md`, and plugin metadata.

## Findings

- `workflow-plan` required an overview table and a minimal phase checkbox list, but did not require detailed phase specs, task lists, or blocking questions.
- The `plan.md` template had only one placeholder phase checkbox.
- `workflow-implement` updated changelog and phase checkbox state, but did not inspect blocking questions, update per-task completion, commit phase chunks, or hand off to final QA.
- `workflow-verify` is a tactical check-running skill. It does not audit research-plan-changelog-code consistency or PR readiness.
- There was no `workflow-qa` skill for final feature quality control and draft PR creation.

## Recommendation

Update the existing skill contracts and template, add a new `workflow-qa` skill, and align README, AGENTS, and plugin metadata with the new lifecycle:

```text
research -> plan -> implement phases -> qa -> share
```

## Open Questions

- None.

# Plan: Workflow QA Phase Lifecycle

Feature folder: `thoughts/2026-04-26-01-workflow-qa-phase-lifecycle`

## Summary

Upgrade Codex Workflows so plans are detailed and decision-complete, phase implementation handles blocking questions and commits, and a new final `workflow-qa` skill performs whole-feature quality control before draft PR creation.

## Opening Questions

- None.

## Overview

| Phase | Short Description | T-shirt Size | Change Surface | Line Areas | Verification |
|---|---|---|---|---|---|
| 1 | Update workflow skill contracts and templates. | M | workflow skill markdown, plan template, docs, plugin metadata, feature memory | `workflow-plan`, `workflow-implement`, `workflow-verify`, new `workflow-qa`, workflow contract docs | Inspect changed files for required sections and lifecycle guidance. |

## Phases

### Phase 1: Workflow lifecycle contract

- [x] Phase 1 complete

Objective:
- Make the workflow contract explicit for detailed plans, blocking questions, phase commits, final QA, and draft PR readiness.

Implementation Decisions:
- Keep `workflow-verify` as tactical check-running rather than a final gate.
- Add `workflow-qa` as a separate final gate because it must inspect feature memory, branch state, commits, verification coverage, and PR readiness.
- Update the plan template to lead future agents into detailed per-phase sections.
- Keep PR creation gated by user approval inside `workflow-qa`.

Tasks:
- [x] Update `workflow-plan` to require opening questions and detailed phase sections.
- [x] Update `plan.md` template with objective, decisions, tasks, blocking questions, verification, and commit plan.
- [x] Update `workflow-implement` to handle blocking questions, task completion, changelog updates, phase commits, and final QA handoff.
- [x] Add `workflow-qa`.
- [x] Clarify `workflow-verify` as optional/tactical.
- [x] Update README, AGENTS, and plugin metadata.
- [x] Record feature memory.

Blocking Questions:
- None.

Verification:
- Inspect changed files for required sections and lifecycle guidance.

Commit Plan:
- Commit all related workflow contract updates as one coherent feature commit after verification.

## Acceptance Criteria

- `workflow-plan` requires decision-complete detailed phase sections and opening questions.
- `workflow-implement` requires blocking-question review, task completion, changelog updates, phase commits, and final QA handoff.
- `workflow-qa` exists and defines pass/fail QA plus draft PR behavior.
- `workflow-verify` remains a tactical verification skill.
- README, AGENTS, plugin metadata, and template match the updated lifecycle.

## Out of Scope

- Implementing executable automation around commits or PR creation outside skill instructions.
- Changing custom agent TOML files.

## Verification

- Manual inspection of all changed markdown and plugin metadata.

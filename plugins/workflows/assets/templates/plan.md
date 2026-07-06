# Plan: {feature_title}

Feature folder: `{feature_folder}`
Status: `{status:draft|ready|in-progress|complete|blocked}`
Created: `{created_date}`
Updated: `{updated_date}`

## Inputs

- Research: `{research_path_or_none}`
- Spec: `{spec_path_or_none}`
- Technical Design: `{technical_design_path_or_none}`
- Issue: `{issue_path_or_none}`
- Design Doc: `{design_doc_path_or_none}`

## Summary

{short_description}

## Opening Questions

- None, or numbered blockers with `Recommended: {option_or_default}`.

## Overview

| Phase | Status | Short Description | T-shirt Size | Change Surface | Line Areas | Verification |
|---|---|---|---|---|---|---|
| 1 | Pending |  | S |  |  |  |

## Phases

### Phase 1: {phase_name}

- [ ] Phase 1 complete

Objective:
- Describe what this phase accomplishes.

Implementation Decisions:
- Record decision-complete implementation choices for this phase.
- For UI/UX phases, record layout, visual hierarchy, component states, responsive behavior, accessibility expectations, and how the work follows `.context/docs/design.md`.

Tasks:
- [ ] Add the concrete task.

Blocking Questions:
- None, or numbered blockers with `Recommended: {option_or_default}`.

Verification:
- Run or describe the exact phase check.
- For UI/UX phases, include screenshot/manual viewport checks, interaction states, accessibility checks, and text-overflow checks when relevant.

Commit Plan:
- Do not commit from `workflow-implement`. Use `workflow-commit` after verification and workflow doc updates.

## Acceptance Criteria

- 

## Out of Scope

- 

## Verification

- 

## Notes for Implementation

- Record discoveries, deviations from plan, verification, and remaining risks in `changelog.md`.
- Mark only completed phase tasks and completed phase checkboxes.
- Keep the overview table `Status` values current: `Pending`, `Ready for review`, or `Implemented`.
- Leave commit creation to `workflow-commit`.

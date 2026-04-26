# Changelog: Workflow QA Phase Lifecycle

Feature folder: `thoughts/2026-04-26-01-workflow-qa-phase-lifecycle`

## Changes

## 2026-04-26 - Phase 1: Workflow lifecycle contract

- Changed:
  - Updated workflow planning, implementation, and verification skill contracts.
  - Added `workflow-qa` as the final feature quality gate.
  - Expanded the plan template with opening questions and detailed per-phase structure.
  - Updated README, AGENTS, and plugin metadata to describe the new lifecycle.
  - Added feature memory for this change.
- Verification:
  - Confirmed skill/template/docs coverage with `rg`.
  - Confirmed plugin metadata parses with `node`.
  - Checked whitespace with `git diff --check`.
- Notes:
  - `workflow-verify` remains optional and tactical; `workflow-qa` is the final readiness gate.
- Commits:
  - See git history for the phase commit.

## Verification

Confirmed skill/template/docs coverage with `rg`, plugin metadata parsing with `node`, and whitespace with `git diff --check`.

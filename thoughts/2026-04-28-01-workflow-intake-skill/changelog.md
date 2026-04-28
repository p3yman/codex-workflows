# Changelog: Workflow Intake Skill

Feature folder: `thoughts/2026-04-28-01-workflow-intake-skill`

## 2026-04-28 - Phase 1: Add intake skill

- Changed:
  - Added `$workflow-intake` for refining rough ideas or vague Linear tickets into actionable Linear issues.
  - Added a reusable Linear issue intake template.
  - Updated plugin metadata, default prompts, README skill list, and plugin version.
  - Added workflow research and plan records for the change.
- Verification:
  - `python3 -m json.tool plugins/workflows/.codex-plugin/plugin.json`
  - `git diff --check`
- Notes:
  - Skill keeps intake in Linear by default and only recommends `workflow-research` or `workflow-plan` when appropriate.
- Commits:
  - Add workflow intake skill.

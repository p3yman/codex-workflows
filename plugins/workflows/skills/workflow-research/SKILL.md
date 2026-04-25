---
name: workflow-research
description: Use when starting or updating feature research for a Codex Workflows project. Creates or updates thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/research.md without a user-name path segment.
---

# Feature Research

Use this skill to gather project facts before planning a feature.

## Workflow

1. Inspect the repo before asking questions.
   - Use `codebase-locator` to map relevant files and directories.
   - Use `codebase-analyzer` for the most important implementation paths.
   - Use `codebase-pattern-finder` when similar local examples would shape the plan.
   - Use `thoughts-locator` and `thoughts-analyzer` if prior `thoughts/` context may exist.
   - Use `web-search-researcher` only when current external docs or web facts are needed.
2. Create or reuse a feature folder:

   ```text
   thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/
   ```

   - Date format is `YYYY-MM-DD`.
   - Sequence is `01` through `99` for the same date.
   - Pick the next available sequence for the date.
   - Slug is lowercase kebab-case from the feature name.

3. Ensure `thoughts/index.md` exists. If missing, create it from `plugins/workflows/assets/templates/thoughts-index.md`.
4. Create or update `research.md` from `plugins/workflows/assets/templates/research.md`.
5. Record findings, existing patterns, relevant files, open questions, and a recommendation.

## Agent Use

Prefer specialized agents for focused research:

| Need | Agent |
|---|---|
| Find where code lives | `codebase-locator` |
| Understand how code works | `codebase-analyzer` |
| Find local examples to follow | `codebase-pattern-finder` |
| Find prior workflow docs | `thoughts-locator` |
| Extract decisions from prior docs | `thoughts-analyzer` |
| Research current external docs | `web-search-researcher` |

## Output

Reply with:

- feature folder path
- concise research summary
- unresolved questions that block planning, if any
- recommended next step

Do not create any per-person subfolder under `thoughts/`.

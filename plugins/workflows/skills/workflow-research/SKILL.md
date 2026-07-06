---
name: workflow-research
description: Use when starting or updating feature research for a Codex Workflows project under .context/plans.
---

# Feature Research

Use this skill to gather project facts before planning a feature.

Use `.context/plans/` for feature folders. Do not create per-person path segments.

## Workflow

1. Inspect the repo before asking questions.
   - Use `codebase-locator` to map relevant files and directories.
   - Use `codebase-analyzer` for the most important implementation paths.
   - Use `codebase-pattern-finder` when similar local examples would shape the plan.
   - Read `.context/workflows.yaml`, `.context/knowledge/index.md`, `.context/docs/`, configured project docs, root `docs/`, and README when present.
   - For UX, redesign, or frontend UI work, read `.context/docs/design.md` or the configured `design.file` when present and treat it as the project UI/UX baseline.
   - Use `context-locator` and `context-analyzer` if prior `.context/` context may exist.
   - Use `web-search-researcher` only when current external docs or web facts are needed.
2. Resolve the feature folder:
   - Create or reuse a folder under `.context/plans/shared/` or `.context/plans/local/` based on `.context/workflows.yaml`, mode, config, and user intent.
   - If setup has not been run, recommend `workflow-setup` before creating feature artifacts.
   - Folder names use:

   ```text
   .context/plans/{local|shared}/{YYYY-MM-DD}-{NN}-{feature-slug}/
   ```

   - Date format is `YYYY-MM-DD`.
   - Sequence is `01` through `99` for the same date.
   - Pick the next available sequence for the date.
   - Slug is lowercase kebab-case from the feature name.

3. Ensure the appropriate index exists:
   - `.context/plans/index.md` from `plugins/workflows/assets/templates/context-plans-index.md`.
4. Create or update `research.md` from `plugins/workflows/assets/templates/research.md`.
5. Record source context, current state, desired state, findings, existing patterns, relevant files, constraints, risks, open questions, and a recommendation.
   - For UI/UX work, include the design baseline, visible component patterns, interaction states, responsive constraints, accessibility expectations, and any places where the requested change conflicts with `design.md`.
   - Ask the user only when a UI/UX decision blocks planning and cannot be resolved from repo evidence, screenshots, existing components, or `design.md`.

## Question Handling

When asking the user for missing input, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`.

If `request_user_input` is unavailable, ask in chat:

- Long-answer questions: one numbered question at a time, with a recommended default.
- Short-answer questions: a numbered list.
- Always recommend a good option.

## Agent Use

Prefer specialized agents for focused research:

| Need | Agent |
|---|---|
| Find where code lives | `codebase-locator` |
| Understand how code works | `codebase-analyzer` |
| Find local examples to follow | `codebase-pattern-finder` |
| Find prior workflow docs | `context-locator` |
| Extract decisions from prior docs | `context-analyzer` |
| Research current external docs | `web-search-researcher` |

## Output

Reply with:

- feature folder path
- concise research summary
- unresolved questions that block planning, if any
- recommended next step

Do not create any per-person subfolder under `.context/plans/`.

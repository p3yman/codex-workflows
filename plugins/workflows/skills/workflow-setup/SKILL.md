---
name: workflow-setup
description: Use when initializing Codex Workflows in a target project with .context/, AGENTS.md guidance, docs discovery, and solo or team layout choices.
---

# Workflow Setup

Use this skill once per target project, or when a project needs its workflow configuration repaired.

## Goal

Create the project-local workflow memory layout without moving or overwriting user documentation.

Default layout:

```text
.context/
  workflows.yaml
  docs/
    index.md
    design.md
    commands.md
    testing.md
    issue.md
  knowledge/
    index.md
  plans/
    index.md
    local/
    shared/
```

## Workflow

1. Inspect the project before asking questions:
   - `AGENTS.md`
   - `.gitignore`
   - `.context/`
   - `.context/docs/`
   - `docs/`
   - `README.md`
2. If `.context/workflows.yaml` already records `mode`, use that mode.
3. If mode is not recorded, ask whether this project should use solo mode or team mode.
   - Solo mode may commit `.context/plans/` directly.
   - Team mode creates both `local/` and `shared/`, adds `.context/plans/local/` to `.gitignore`, and explains promotion from local to shared.
4. Create only missing directories and files.
5. Use these templates:
   - `plugins/workflows/assets/templates/context-workflows.yaml`
   - `plugins/workflows/assets/templates/context-docs-index.md`
   - `plugins/workflows/assets/templates/context-design.md`
   - `plugins/workflows/assets/templates/context-commands.md`
   - `plugins/workflows/assets/templates/context-testing.md`
   - `plugins/workflows/assets/templates/context-issue.md`
   - `plugins/workflows/assets/templates/context-knowledge-index.md`
   - `plugins/workflows/assets/templates/context-plans-index.md`
   - `plugins/workflows/assets/templates/agents-managed-block.md`
6. Create `.context/docs/` starter files only when missing:
   - `.context/docs/index.md`
   - `.context/docs/design.md`
   - `.context/docs/commands.md`
   - `.context/docs/testing.md`
   - `.context/docs/issue.md`
7. If `docs/` exists, record it in `.context/workflows.yaml` under `docs.existing`. Do not move docs.
8. If legacy `.context/commands.md` or `.context/testing.md` exists, record it in `.context/workflows.yaml` under `legacy` and prefer `.context/docs/` for new docs.
9. Add or update the managed Codex Workflows block in `AGENTS.md`.
   - Do not rewrite unrelated project guidance.
   - Do not delete existing instructions.
   - If a managed block already exists, replace only the block.
10. In team mode, add `.context/plans/local/` to `.gitignore` if missing.
11. Report any broken or missing indexes instead of deleting files.

## Question Handling

When asking the user for missing input, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`.

If `request_user_input` is unavailable, ask in chat:

- Long-answer questions: one numbered question at a time, with a recommended default.
- Short-answer questions: a numbered list.
- Always recommend a good option.

## Docs Migration

- New workflow-owned project docs belong in `.context/docs/`.
- `.context/docs/design.md` is UI/UX design-system guidance following the DESIGN.md visual identity format. Feature-level implementation design belongs in `technical-design.md`, not this doc.
- Existing root `docs/` remains in place by default and is linked from `.context/workflows.yaml`.
- Move or copy existing docs into `.context/docs/` only when the user explicitly asks for migration.
- When migrating docs, show the patch, update `.context/workflows.yaml`, update affected links, and preserve source docs unless the user explicitly approves deletion.

## Safety Rules

- Never overwrite user docs without showing an explicit patch.
- Never move or delete `docs/` or existing `.context/` content automatically.
- Never delete legacy `.context/commands.md` or `.context/testing.md` automatically.
- Preserve existing `AGENTS.md` guidance outside the managed block.
- Prefer patch-level edits when updating `.gitignore` or `AGENTS.md`.

## Output

Reply with:

- selected mode
- files created
- files updated
- existing docs and legacy command/testing files detected
- recommended next step

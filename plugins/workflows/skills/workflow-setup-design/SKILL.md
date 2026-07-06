---
name: workflow-setup-design
description: Use when creating or refreshing .context/docs/design.md as the project UI/UX design-system guidance document from existing code, screenshots, styles, and docs.
---

# Setup Design Doc

Use this skill after `workflow-setup`, or whenever the project needs `.context/docs/design.md` created or refreshed with actual UI/UX design guidance.

This is not the feature-level technical design workflow. Feature implementation design belongs in `technical-design.md` through `workflow-technical-design` or `workflow-td`.

## Goal

Create or update `.context/docs/design.md` as a DESIGN.md-style visual identity and design-system document for agents and humans.

The document should follow the Google DESIGN.md shape:

- YAML front matter for machine-readable tokens.
- Markdown sections for human-readable design rationale.
- Canonical section order: Overview, Colors, Typography, Layout, Elevation & Depth, Shapes, Components, Do's and Don'ts.

## Workflow

1. Inspect the project before writing:
   - `.context/workflows.yaml`
   - `.context/docs/index.md`
   - existing `.context/docs/design.md`
   - root `docs/`
   - README
   - frontend source files
   - CSS, Tailwind, theme, token, component, and design-system files
2. If `.context/docs/design.md` is missing, create it from `plugins/workflows/assets/templates/context-design.md`.
3. Extract concrete design facts from the codebase:
   - color tokens and semantic usage
   - typography scale and font families
   - spacing and layout rules
   - radius, shadow, border, and focus styles
   - reusable component variants and states
   - accessibility and responsive design conventions
4. Preserve existing human-authored guidance unless it is clearly stale or contradicted by code.
5. Prefer exact token values from source files over invented values.
6. Mark unknowns explicitly with concise TODO placeholders instead of guessing.
7. Ask the user focused UI/UX questions only when a project-level design rule cannot be inferred from source, docs, screenshots, or existing guidance.
   - Ask at most 3 questions at a time.
   - Prefer concrete tradeoffs, such as density, tone, navigation behavior, responsive priorities, accessibility requirements, or component state behavior.
8. Update `.context/docs/index.md` if it does not mention `design.md`.

## Question Handling

When asking the user for missing input, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`.

If `request_user_input` is unavailable, ask in chat:

- Long-answer questions: one numbered question at a time, with a recommended default.
- Short-answer questions: a numbered list.
- Always recommend a good option.

## Safety Rules

- Do not overwrite existing design guidance wholesale.
- Do not move root `docs/` content unless the user explicitly asks for migration.
- Do not turn implementation architecture notes into UI/UX guidance.
- Do not run external generators unless the user asks.
- Do not invent brand, visual identity, or product experience rules when the project has no evidence for them; record placeholders or ask focused questions instead.

## Output

Reply with:

- design doc path
- files inspected
- design tokens or conventions captured
- placeholders or open questions left
- recommended next step

---
name: workflow-td
description: Alias for workflow-technical-design. Use when the user asks for td, technical design, or a pre-plan implementation design artifact.
---

# Feature TD

`workflow-td` is a short alias for `workflow-technical-design`.

Follow the same behavior as `workflow-technical-design`:

- Read `research.md` and `spec.md` when present.
- Inspect relevant implementation paths.
- Create or update `technical-design.md` from `plugins/workflows/assets/templates/technical-design.md`.
- Record proposed technical design, alternatives, cross-cutting concerns, migration notes, verification strategy, and open questions.
- Keep UI/UX visual guidance in `.context/docs/design.md`, not in feature-level `technical-design.md`.
- When technical work affects UI behavior, read `.context/docs/design.md` or the configured `design.file` and reference only the UI/UX constraints that affect implementation architecture.
- Use `workflow-technical-design` question handling: prefer `request_user_input` when available; otherwise ask numbered chat questions, ask long-answer questions one at a time, and always include a recommended option.

## Output

Reply with the same output as `workflow-technical-design`.

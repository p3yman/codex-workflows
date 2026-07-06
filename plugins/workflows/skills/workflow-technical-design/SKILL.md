---
name: workflow-technical-design
description: Use when architecture-heavy or cross-cutting work needs a technical design artifact before planning. Creates or updates technical-design.md with proposed implementation design, alternatives, concerns, migration, and verification strategy.
---

# Feature Technical Design

Use this skill before `workflow-plan` when implementation choices affect architecture, data flow, security, performance, operations, migrations, or public contracts.

This skill owns the feature-level technical design artifact. UI/UX visual guidance belongs in `.context/docs/design.md` and is maintained by `workflow-setup` or `workflow-setup-design`.

When technical work affects UI behavior, read `.context/docs/design.md` or the configured `design.file` and reference any UI/UX constraints that affect the technical design. Keep visual decisions in the spec or design doc; keep implementation architecture in `technical-design.md`.

## Inputs

Prefer an existing feature folder under `.context/plans/`.

Read available `research.md` and `spec.md` first.

## Workflow

1. Inspect current implementation paths before writing the technical design.
2. Use `codebase-analyzer` for unfamiliar or risky areas.
3. Use `codebase-pattern-finder` to find local architecture and test conventions.
4. Create or update `technical-design.md` from `plugins/workflows/assets/templates/technical-design.md`.
5. Record:
   - context
   - goals and non-goals
   - proposed technical design
   - alternatives considered
   - cross-cutting concerns
   - migration and compatibility notes
   - verification strategy
   - open questions
6. Ask the user only when a technical design decision cannot be made safely from repo evidence.
7. Mark the technical design `ready` only when planning can convert it into implementation phases.

## Question Handling

When asking the user for missing input, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`.

If `request_user_input` is unavailable, ask in chat:

- Long-answer questions: one numbered question at a time, with a recommended default.
- Short-answer questions: a numbered list.
- Always recommend a good option.

## Output

Reply with:

- technical design path
- selected technical design
- alternatives rejected
- cross-cutting concerns
- blocking questions, if any
- recommended next step

---
name: workflow-spec
description: Use when a feature needs requirements clarification before planning. Creates or updates spec.md with problem, goals, user stories, decisions, testing expectations, risks, and open questions.
---

# Feature Spec

Use this skill before `workflow-plan` when the requested work is ambiguous, product-sensitive, or likely to drift without a requirements artifact.

## Inputs

Prefer a project configured by `workflow-setup`. Use the active feature folder under `.context/plans/` when present.

Relevant inputs may include:

- Linear issue or rough user prompt
- `research.md`
- `.context/workflows.yaml`
- `.context/knowledge/index.md`
- `.context/docs/`, configured project docs, or root `docs/`
- `.context/docs/design.md` or the configured `design.file` for UX, redesign, or frontend UI work
- README and `AGENTS.md`

## Workflow

1. Inspect repo and workflow context before asking questions.
2. Create or update `spec.md` from `plugins/workflows/assets/templates/spec.md`.
3. Capture:
   - problem
   - goals and non-goals
   - users and stories
   - proposed solution
   - UI/UX decisions when the work changes screens, flows, copy hierarchy, interaction states, visual style, accessibility, or responsive behavior
   - implementation decisions already supported by evidence
   - testing decisions
   - out of scope
   - risks
   - open questions
4. Ask the user only when a missing answer blocks a useful plan.
   - For UI/UX work, ask focused questions about product intent, target user, primary workflow, visual direction, density, component behavior, accessibility, and responsive constraints only when `design.md` and repo evidence do not answer them.
5. Keep unresolved but non-blocking ambiguity in `Open Questions`.
6. Mark the spec `ready` only when planning can proceed without inventing requirements.

## Question Handling

When asking the user for missing input, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`.

If `request_user_input` is unavailable, ask in chat:

- Long-answer questions: one numbered question at a time, with a recommended default.
- Short-answer questions: a numbered list.
- Always recommend a good option.

## Agent Use

| Need | Agent |
|---|---|
| Find relevant code/docs | `codebase-locator` |
| Understand current behavior | `codebase-analyzer` |
| Find related workflow context | `context-locator`, then `context-analyzer` |
| Research current external behavior | `web-search-researcher` |

## Output

Reply with:

- spec path
- key requirements
- decisions recorded
- blocking questions, if any
- recommended next step

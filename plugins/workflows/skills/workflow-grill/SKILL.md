---
name: workflow-grill
description: Use when the user wants a grill-me, grill-with-docs, challenge, clarify, pressure-test, or pre-research interview to sharpen a rough issue before workflow-research or workflow-plan.
---

# Workflow Grill

Use this skill for a challenge-first issue clarification session before research. It adapts the `grill-with-docs` idea to Codex Workflows: a relentless but practical interview that clears the problem, scope, outcome, assumptions, and handoff path before creating or updating a Linear issue.

This skill is not a research pass and does not create `.context/` docs unless the user explicitly asks to promote the result into workflow research, spec, design, or planning.

For UX, redesign, or frontend UI improvements, read `.context/docs/design.md` or the configured `design.file` when present before challenging visual or interaction assumptions. Treat that document as the baseline design intent unless the user explicitly wants to change it.

## Inputs

Accept any of:

- A rough idea, bug, chore, improvement, redesign, or feature request.
- A vague or disputed Linear issue URL/key/id.
- A request like "grill me", "challenge this", "clarify this issue", "pressure-test this before research", or "make this research-ready".

If a Linear issue is provided, inspect it before questioning. If no issue exists, run the grill from conversation context and create a Linear issue only when the user asks or when issue creation is clearly the requested outcome.

## Workflow

1. Establish the target.
   - Identify the raw claim, desired change, affected user, and expected outcome.
   - If the prompt is too vague to challenge, ask one opening question.
2. Run a challenge pass.
   - What problem is this actually solving?
   - What evidence says it matters now?
   - What user, workflow, or system behavior changes?
   - What is explicitly out of scope?
   - What assumptions are weak, risky, or unproven?
   - What would make this not worth doing?
   - What simpler path might satisfy the same outcome?
3. Ask focused questions.
   - Ask at most 3 questions at a time.
   - Prefer concrete tradeoff questions over broad discovery questions.
   - Do not ask about details that repo context or the issue already answers.
   - For UI/UX work, focus unresolved questions on user workflow, visual hierarchy, density, responsive behavior, component states, accessibility, and what should remain consistent with `design.md`.
4. Resolve or record ambiguity.
   - Convert answered points into decisions.
   - Move non-blocking ambiguity into `Open Questions`.
   - Keep blocking ambiguity visible and stop before research if the issue is not research-ready.
5. Classify the handoff.
   - Type: Bug, Feature, Improvement, Chore, Tech Debt, Docs, UX, Redesign, Spike, or Research.
   - Size: XS, S, M, L, XL, or Unknown.
   - Path: Needs clarification, Needs research, Ready for planning, Quick fix, or Not actionable yet.
6. Create or update Linear only when appropriate.
   - Use `plugins/workflows/assets/templates/linear-intake-issue.md`.
   - Preserve the raw capture.
   - Include the challenge outcomes in Context, Proposed Direction, Open Questions, and Workflow Handoff.
   - If no Linear write is requested or possible, return an issue-ready brief in the same shape.

## Question Handling

When asking the user for missing input, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`.

If `request_user_input` is unavailable, ask in chat:

- Long-answer questions: one numbered question at a time, with a recommended default.
- Short-answer questions: a numbered list.
- Always recommend a good option.

## Stance

Be direct and specific. Challenge weak reasoning, hidden scope, premature solutions, and unclear acceptance criteria. Do not be adversarial for its own sake: every challenge should make the issue easier to research, plan, or reject.

Prefer statements like:

- "This is currently a solution without a stated problem."
- "The acceptance criteria describe implementation, not user-visible success."
- "This sounds like research, not implementation, because the failure mode is still unknown."
- "This can skip research if the intended change is only documentation."

## Agent Use

Use agents only when they materially improve the grill:

| Need | Agent |
|---|---|
| Find relevant files or ownership areas | `codebase-locator` |
| Check current behavior before challenging assumptions | `codebase-analyzer` |
| Find similar prior workflow docs | `context-locator`, then `context-analyzer` |

Skip agents when the issue can be clarified from the conversation or Linear text alone.

## Output

Reply with:

- clarified problem and desired outcome
- challenge findings: assumptions, contradictions, scope risks, or simpler paths
- decisions made
- open questions, grouped as blocking or non-blocking
- classification: type, size, and path
- Linear issue link/key if created or updated
- recommended next step: answer questions, `workflow-research`, `workflow-spec`, `workflow-plan`, or direct implementation

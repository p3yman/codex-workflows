---
name: workflow-intake
description: Use when capturing, refining, researching, or triaging a rough idea, bug, chore, improvement, redesign, or feature into a Linear issue that can later feed workflow-research or workflow-plan.
---

# Workflow Intake

Use this skill when the user has a rough voice-to-text capture, vague Linear issue, or early idea that should become a clear issue before becoming project work.

This skill writes to Linear, not `thoughts/`, unless the user explicitly asks to promote the issue into workflow research or planning.

## Inputs

Accept any of:

- A raw idea, bug report, chore, improvement, redesign, or feature request.
- A Linear issue URL/key/id to refine.
- A request to create a new Linear issue from context in the conversation.

If no Linear team/project is clear, inspect available Linear context before asking. Ask the user only when the issue cannot be created or updated safely.

## Workflow

1. Determine whether this is create, update, or refine.
   - Create: no existing Linear issue is provided.
   - Update/refine: a Linear issue URL/key/id is provided.
2. Preserve the raw capture when useful.
   - Keep important user wording, constraints, examples, and edge cases.
   - Do not discard ambiguity; move it into `Open Questions`.
3. Classify the issue.
   - Type: Bug, Feature, Improvement, Chore, Tech Debt, Docs, UX, Redesign, Spike, or Research.
   - Size: XS, S, M, L, XL, or Unknown.
   - Path: Quick fix, Needs clarification, Needs research, Ready for planning, or Not actionable yet.
4. Research only as much as the issue needs.
   - Use repo agents for local code context when it would make the issue more actionable.
   - Use web research only when current external docs or facts affect the issue.
   - For tiny chores or obvious bugs, skip deep research and keep the issue compact.
5. Ask clarification questions only when the missing answer blocks a useful issue.
   - Prefer recording non-blocking unknowns in `Open Questions`.
   - Ask at most 3 focused questions at a time.
6. Create or update the Linear issue using the template below.
7. Add labels/status/project fields when obvious from the workspace. Do not invent team-specific taxonomy.
8. End with the Linear issue link, classification, open questions, and recommended next step.

## Agent Use

Use focused agents when they materially improve the issue:

| Need | Agent |
|---|---|
| Find relevant files or areas | `codebase-locator` |
| Understand current behavior | `codebase-analyzer` |
| Find similar bugs/features/tests | `codebase-pattern-finder` |
| Reuse prior workflow context | `thoughts-locator`, then `thoughts-analyzer` |
| Research current external docs | `web-search-researcher` |

Skip agents for small, self-contained issues where repository context is unnecessary.

## Linear Issue Template

Use `plugins/workflows/assets/templates/linear-intake-issue.md` as the description shape.

Keep the issue concise. A small chore may only need Summary, Desired Outcome, Acceptance Criteria, and Notes. A larger or vague feature should use the full shape.

## Handoff Guidance

- Quick fix: leave the issue ready for direct implementation.
- Needs clarification: include focused `Open Questions`.
- Needs research: recommend `$workflow-research` using the Linear issue as the prompt.
- Ready for planning: recommend `$workflow-plan` using the Linear issue as context.
- Not actionable yet: record why and what signal would make it actionable.

When promoting to workflow docs later, use the Linear issue as source context. Do not duplicate `thoughts/` work during intake unless the user asks.

## Output

Reply with:

- Linear issue link/key
- classification: type, size, and path
- summary of changes made to the issue
- unresolved questions, if any
- recommended next step

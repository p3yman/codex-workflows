---
name: workflow-update
description: Use when an existing Codex Workflows feature record needs to be refreshed after new requirements, research, technical design decisions, implementation drift, review findings, or broken indexes.
---

# Workflow Update

Use this skill to update existing workflow artifacts without starting a new feature and without changing product code unless the user explicitly asks.

This is the maintenance skill for keeping `.context/` accurate after the plan meets reality.

Use `workflow-remember` instead when the main goal is to record durable project knowledge in `.context/knowledge/index.md`.

## Common Uses

- New user requirements arrive after `research.md`, `spec.md`, `technical-design.md`, or `plan.md` already exists.
- Implementation discovers a better approach than the original plan.
- Review or QA finds gaps that should be reflected in the workflow record.
- A feature folder has stale checkboxes, stale overview table statuses, missing changelog entries, or broken index links.
- A local plan should be promoted or summarized into shared context.

## Inputs

Accept any of:

- A feature folder under `.context/plans/`
- A specific artifact path such as `plan.md`, `changelog.md`, `spec.md`, or `technical-design.md`
- A user note describing what changed
- Review or QA findings
- A diff that needs to be reconciled with the plan/changelog

## Workflow

1. Read the target artifacts:
   - `.context/workflows.yaml` when present
   - `.context/plans/index.md`
   - `research.md`
   - `spec.md` when present
   - `technical-design.md` when present
   - `plan.md`
   - `changelog.md`
   - `review.md` or QA notes when present
2. Inspect current branch status and diff when implementation drift is part of the update.
3. Classify the update:
   - Requirements update
   - Research update
   - Spec update
   - Technical design update
   - Plan update
   - Changelog update
   - Index repair
   - Local-to-shared promotion note
   - Verification update
4. Apply the smallest documentation changes that make the workflow record true.
5. Preserve completed work:
   - Do not uncheck completed tasks unless the user confirms they are no longer true.
   - Do not rewrite history-style changelog entries; append corrections or add a `Deviations From Plan` note.
6. If the requested update changes future implementation scope, update:
   - affected plan phase tasks
   - overview table phase statuses
   - blocking questions
   - verification
   - acceptance criteria when needed
7. If the update comes from implementation drift, record:
   - what changed from the plan
   - why the drift was accepted
   - verification already run or still missing
8. If indexes are broken, repair links and missing entries without duplicating entries.
9. Do not stage or commit. Recommend `workflow-commit` when the update should be committed.

## Question Handling

When asking the user for missing input or confirmation, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`.

If `request_user_input` is unavailable, ask in chat:

- Long-answer questions: one numbered question at a time, with a recommended default.
- Short-answer questions or confirmations: a numbered list.
- Always recommend a good option.

## Agent Use

| Need | Agent |
|---|---|
| Find related workflow docs | `context-locator` |
| Extract prior decisions | `context-analyzer` |
| Understand code drift | `codebase-analyzer` |
| Match existing patterns | `codebase-pattern-finder` |
| Diagnose failed verification | `error-analyzer` |

## Safety Rules

- Do not modify product code unless the user explicitly asks.
- Do not move local plans into shared plans without user confirmation.
- Do not create a new feature folder when an existing one is clearly the target.
- Do not commit; leave commit creation to `workflow-commit`.

## Output

Reply with:

- target feature or artifact
- update classification
- files updated
- decisions or deviations recorded
- verification or index checks performed
- remaining open questions
- recommended next step

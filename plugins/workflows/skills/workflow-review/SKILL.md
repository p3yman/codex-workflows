---
name: workflow-review
description: Use when reviewing a completed workflow feature or phase for structural quality, correctness, tests, docs, and residual risk before QA or PR.
---

# Workflow Review

Use this skill after implementation and before final QA when the user wants a review pass.

## Workflow

1. Read the relevant `research.md`, `spec.md`, `technical-design.md`, `plan.md`, and `changelog.md` when present.
   - For UX, redesign, or frontend UI work, also read `.context/docs/design.md` or the configured `design.file`.
2. Inspect changed files with `git diff` and recent commits when available.
3. Review in this order:
   - correctness bugs and behavioral regressions
   - missing or weak verification
   - incomplete plan/changelog updates
   - structural maintainability issues
   - UI/UX mismatches with `design.md`, planned visual decisions, responsive behavior, accessibility expectations, interaction states, or text overflow
   - documentation mismatches
4. Use `error-analyzer` for failing or cryptic checks.
5. Use `test-writer` when the main gap is missing focused tests.
6. Optionally create `review.md` from `plugins/workflows/assets/templates/review.md` when the user asks for a recorded review.

## Question Handling

If missing input blocks the review, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`. If unavailable, ask numbered chat questions, ask long-answer questions one at a time, and always include a recommended option.

## Output

Findings come first, ordered by severity. Use file and line references when possible.

If no issues are found, say that clearly and note residual risk or verification gaps.

Report:

- findings
- open questions or assumptions
- verification reviewed
- whether the work is ready for `workflow-qa`

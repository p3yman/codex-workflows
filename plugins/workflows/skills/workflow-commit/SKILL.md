---
name: workflow-commit
description: Use after workflow-implement completes a phase and any needed workflow-review is done. Verifies the phase diff, checks plan and changelog updates, stages only relevant files, and creates a user-confirmed commit.
---

# Workflow Commit

Use this skill to create explicit phase commits after implementation. `workflow-implement` does not commit.

## Inputs

- A completed phase in `plan.md`
- Updated `changelog.md`
- Dirty working tree changes for that phase

## Workflow

1. Read `plan.md` and `changelog.md`.
2. Inspect branch, status, and diff.
3. Confirm the phase is complete:
   - phase checkbox is checked
   - phase task checkboxes are checked
   - overview table status is `Ready for review` or `Implemented`
   - verification is recorded or an explicit gap is documented
   - changelog entry matches changed files
4. Identify unrelated dirty work. Do not stage it.
5. Propose the exact files or hunks to stage.
6. Ask the user for confirmation before staging or committing.
7. After approval, update the phase overview table status to `Implemented` when it is still `Ready for review`.
8. Stage only phase-relevant files.
9. Create a normal, ready-for-review commit subject that does not include `codex`.
10. Report the commit hash and any remaining dirty files.

## Question Handling

When asking for commit confirmation, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`.

If `request_user_input` is unavailable, ask in chat with a numbered confirmation list. Include the recommended staging/commit option and the exact files or hunks it covers.

## Safety Rules

- Never commit without explicit user confirmation in the current turn.
- Never stage unrelated dirty work.
- Never rewrite history or squash phase history unless the user explicitly asks.
- If verification failed or required context is missing, do not commit; report the blocker and next step.

## Output

Reply with:

- phase reviewed
- files staged
- commit created or blocker
- remaining dirty files
- recommended next step

---
name: workflow-pr
description: Use after workflow-qa passes to create a ready-for-review pull request with feature links, verification, risks, and post-merge upgrade guidance.
---

# Workflow PR

Use this skill after `workflow-qa` passes. It owns PR creation so QA stays a quality gate.

## Preconditions

- All planned phases are complete.
- `workflow-qa` passed or the user explicitly accepts remaining risk.
- Required commits already exist.
- The working tree has no unrelated dirty changes.
- The branch is ready to push.

## Workflow

1. Read `research.md`, `plan.md`, `changelog.md`, and QA results.
2. Inspect current branch, status, changed files, and commits.
3. Confirm plugin version guidance:
   - If plugin runtime behavior, skill instructions, templates, metadata, or user-facing docs changed, ensure `plugins/workflows/.codex-plugin/plugin.json` was bumped appropriately before PR creation.
4. Prepare a PR title that does not include `codex`.
5. Prepare a PR body using `plugins/workflows/assets/templates/pr-body.md`.
6. Create a ready-for-review PR, not a draft PR, using available GitHub tooling.
7. Report post-merge instructions:
   - run `codex plugin marketplace upgrade codex-workflows`
   - start a new Codex thread

## Safety Rules

- Do not create a draft PR.
- Do not create a PR when QA blockers remain unless the user explicitly overrides.
- Do not include unrelated dirty work.
- Do not use `codex` in the PR title.

## Question Handling

If missing input or an override decision blocks PR creation, use `request_user_input` when it is available in the current Codex mode and tool list. Put the recommended choice first and label it `(Recommended)`. If unavailable, ask numbered chat questions, ask long-answer questions one at a time, and always include a recommended option.

## Output

Reply with:

- PR URL
- branch
- verification summary
- residual risk
- post-merge instructions

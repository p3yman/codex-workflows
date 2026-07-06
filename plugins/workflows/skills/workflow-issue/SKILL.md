---
name: workflow-issue
description: Alias-style skill for issue intake. Use when capturing, refining, or triaging a rough idea into a Linear issue before research or planning.
---

# Workflow Issue

This skill is a user-facing alias for `workflow-intake`.

Use the `workflow-intake` behavior and `plugins/workflows/assets/templates/linear-intake-issue.md` template to create or refine a Linear issue.

When issue routing or taxonomy matters, use `.context/docs/issue.md` or the configured `issues.file` from `.context/workflows.yaml` before choosing boards, projects, issue codes, labels, statuses, users, owners, or assignees.

Use `workflow-intake` question handling: prefer `request_user_input` when available; otherwise ask numbered chat questions, ask long-answer questions one at a time, and always include a recommended option.

## Output

Reply with the same output shape as `workflow-intake`:

- Linear issue link/key
- classification: type, size, and path
- summary of changes made to the issue
- unresolved questions, if any
- recommended next step

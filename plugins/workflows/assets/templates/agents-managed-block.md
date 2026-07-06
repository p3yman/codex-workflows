<!-- BEGIN CODEX WORKFLOWS -->
## Codex Workflows

This project uses Codex Workflows for durable project context and feature work.

- Project workflow config: `.context/workflows.yaml`
- Project docs: `.context/docs/`
- Durable knowledge: `.context/knowledge/index.md`
- Feature plans: `.context/plans/`
- Existing root docs remain in place and are linked from `.context/workflows.yaml`.

Default lifecycle:

```text
issue -> grill -> research -> spec -> technical-design -> plan -> implement -> review -> commit -> qa -> pr
```

Setup is a prerequisite, not a lifecycle stage. Use `spec` and `technical-design` only when the work needs them. Use `workflow-td` as the short alias for `workflow-technical-design`. Keep UI/UX design-system guidance in `.context/docs/design.md`. `workflow-implement` updates files, plan status, changelog, and verification notes, but does not commit. Use `workflow-review` before a phase commit or before QA when useful. Use `workflow-commit` to stage and create a user-confirmed phase commit. Use `workflow-remember` when durable decisions or conventions should be recorded in `.context/knowledge/index.md`. Use `workflow-pr` after QA passes to create a ready-for-review pull request.

When a workflow skill needs user input, use `request_user_input` when it is available. Otherwise ask in chat: long-answer questions one numbered question at a time, short-answer questions as a numbered list, and always include a recommended option or default.

Do not delete this managed block. Update it through Codex Workflows setup when project workflow paths change.
<!-- END CODEX WORKFLOWS -->

# Project Docs

These docs are reusable project context for Codex Workflows. Keep detailed feature work in `.context/plans/` and compact durable decisions in `.context/knowledge/index.md`.

## Core Docs

- `project.md` - Product, domain, users, and repository purpose.
- `design.md` - UI/UX visual identity, design tokens, component guidance, and design-system rules.
- `architecture.md` - System boundaries, data flow, integrations, and important modules.
- `conventions.md` - Coding style, naming, patterns, review expectations, and project-specific rules.
- `commands.md` - Install, development, build, lint, test, and verification commands.
- `testing.md` - Test strategy, fixtures, mocks, coverage expectations, and known gaps.
- `issue.md` - Issue boards, projects, codes, labels, statuses, users, ownership, and routing rules.
- `operations.md` - Deploy, environments, configuration, runbooks, and incident notes.

## Existing Docs

- Record existing project docs in `.context/workflows.yaml` under `docs.existing`.
- Do not move existing docs automatically. Migrate or copy them only when the user explicitly asks.

## Maintenance

- Keep this index short.
- Link to authoritative docs instead of duplicating large files.
- Move temporary feature notes into `.context/plans/`, not this directory.

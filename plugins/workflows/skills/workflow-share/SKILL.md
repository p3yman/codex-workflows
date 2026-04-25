---
name: workflow-share
description: Use when finalizing a Codex Workflows feature. Updates thoughts/index.md with a one-line completed-feature review and links to research.md, plan.md, and changelog.md.
---

# Feature Share

Use this skill when a feature is finished and needs a concise project-memory entry.

## Workflow

1. Read the feature folder:

   ```text
   thoughts/{YYYY-MM-DD}-{NN}-{feature-slug}/
   ```

2. Confirm `research.md`, `plan.md`, and `changelog.md` exist.
3. Use `thoughts-analyzer` to extract the final decisions, outcomes, and verification gaps.
4. Ensure `thoughts/index.md` exists. If missing, create it from `plugins/workflows/assets/templates/thoughts-index.md`.
5. Add or update one compact entry under `## Completed Features`.

## Agent Use

| Need | Agent |
|---|---|
| Summarize feature docs | `thoughts-analyzer` |
| Find related prior docs before final wording | `thoughts-locator` |

Entry format:

```md
- YYYY-MM-DD NN feature-slug: One-line review/description. [research](./YYYY-MM-DD-NN-feature-slug/research.md) [plan](./YYYY-MM-DD-NN-feature-slug/plan.md) [changelog](./YYYY-MM-DD-NN-feature-slug/changelog.md)
```

If the feature already has an entry, update it instead of duplicating it.

## Output

Reply with:

- the one-line review
- the updated `thoughts/index.md` entry
- any verification gaps that remain

# CLAUDE.md

## VCS Workflow

**Use `jj` for ALL VCS mutations. Never raw git branch/checkout/rebase/merge/push.**

| Do | Not |
|----|-----|
| `jj new main -m "description"` | `git checkout -b feature` |
| `jj rebase -d main` | `git rebase main` |
| `jj git push --bookmark <name>` | `git push` |
| `gh pr create` | raw git PR workflow |

Allowed raw git: `git status`, `git diff`, `git log`, `git show` (read-only only)

## Testing

Use Swift Testing framework (never XCTest).

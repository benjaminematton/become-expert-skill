# become-expert-skill

Source-of-truth repo for the `become-expert` Claude skill. Edit here, commit, then
`./deploy.sh` to push to the three config-dir copies Claude actually loads:

| Editor | Config dir |
|---|---|
| terminal (rollback/original) | `~/.claude/skills/become-expert/` |
| Cursor | `~/.claude-work/skills/become-expert/` |
| VS Code | `~/.claude-personal/skills/become-expert/` |

## Workflow

```bash
# edit SKILL.md / references here
git add -A && git commit -m "..."
./deploy.sh          # copies SKILL.md + references/ to all three config dirs
```

Treat the config-dir copies as deploys, not sources — edit them and your change is
untracked and will be overwritten on the next deploy.

## Contents

- `SKILL.md` — the skill.
- `references/brief-template.md` — the field-brief template the skill writes into.

## History note

Seeded 2026-07-28 from the fixed `~/.claude` copy, which added the "when a source
contradicts what you think you know" rule to the claims-log phase. That rule was validated
by the `faithfulness-suite` eval: on a counter-factual corpus that inverts a strong prior,
the agent went from 0/5 to 5/5 once the anti-prior rule was operationalized. See that repo's
`FINDINGS.md`.

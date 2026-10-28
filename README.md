# llm_skills

Agent skills for LLM coding assistants (pi, Claude Code, Codex). Each directory
under `skills/` is one skill with a `SKILL.md` file.

## Skills

| Skill | Purpose |
|-------|---------|
| `rpe` | Research → Plan → Execute → Review workflow with explicit approval gates. |

## Install

Link a skill into your agent's skills directory:

```bash
git clone https://github.com/n0madsky/llm_skills.git
cd llm_skills
for skill in skills/*/; do
  name="$(basename "$skill")"
  ln -sfn "$PWD/$skill" "$HOME/.pi/agent/skills/$name"
  ln -sfn "$PWD/$skill" "$HOME/.claude/skills/$name"
done
```

Adjust the target directories for your agent. Restart the agent to load the
skill.

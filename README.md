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
./install.sh
```

This links every skill into `~/.claude/skills`, `~/.codex/skills`, and
`~/.pi/agent/skills`. Override the codex and pi roots with `CODEX_HOME` and
`PI_CODING_AGENT_DIR`. Restart the agent to load the skill.

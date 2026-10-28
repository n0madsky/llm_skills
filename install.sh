#!/usr/bin/env bash
set -euo pipefail

SKILLS_ROOT="$(cd "$(dirname "$0")/skills" && pwd)"

expand_home() {
	case "$1" in
	'~') printf '%s\n' "$HOME" ;;
	'~/'*) printf '%s/%s\n' "$HOME" "${1#\~/}" ;;
	*) printf '%s\n' "$1" ;;
	esac
}

CODEX_DIR="$(expand_home "${CODEX_HOME:-$HOME/.codex}")"
PI_AGENT_DIR="$(expand_home "${PI_CODING_AGENT_DIR:-$HOME/.pi/agent}")"

link_skill() {
	local src=$1
	local dst=$2
	local bak
	[ -e "$src" ] || {
		echo "missing source: $src" >&2
		exit 1
	}
	if [ "$(readlink "$dst")" = "$src" ]; then
		return
	fi
	mkdir -p "$(dirname "$dst")"
	if [ -e "$dst" ] && [ ! -L "$dst" ]; then
		bak="$dst.bak.$(date +%Y%m%d-%H%M%S)"
		mv "$dst" "$bak"
		echo "backed up $dst -> $bak"
	fi
	ln -sfn "$src" "$dst"
	echo "linked $dst -> $src"
}

for skill in "$SKILLS_ROOT"/*/; do
	[ -d "$skill" ] || continue
	[ -f "$skill/SKILL.md" ] || continue
	skill="${skill%/}"
	name="$(basename "$skill")"
	link_skill "$skill" "$HOME/.claude/skills/$name"
	link_skill "$skill" "$CODEX_DIR/skills/$name"
	link_skill "$skill" "$PI_AGENT_DIR/skills/$name"
done

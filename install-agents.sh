#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_dir="$script_dir/agents"
target_dir="${CODEX_HOME:-$HOME/.codex}/agents"

if [ ! -d "$source_dir" ]; then
  echo "No agents directory found at $source_dir" >&2
  exit 1
fi

mkdir -p "$target_dir"
cp "$source_dir"/*.toml "$target_dir"/

echo "Installed workflow agents to $target_dir"
echo "Installed agents:"
for agent_file in "$source_dir"/*.toml; do
  basename "$agent_file" .toml
done

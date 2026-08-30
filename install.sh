#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

if ! command -v mise >/dev/null 2>&1; then
  echo "Error: mise is required. Install it from https://mise.jdx.dev/" >&2
  exit 1
fi

mkdir -p "$HOME/.config" "$HOME/.local/bin"

link() {
  local source="$DOTFILES/$1"
  local target="$HOME/$2"

  mkdir -p "$(dirname "$target")"
  ln -sfn "$source" "$target"

  echo "$target -> $source"
}

# Config
link "config/nvim" ".config/nvim"

# Development tools and Git hooks
(cd "$DOTFILES" && mise install && mise run install-hooks)

echo "Done."

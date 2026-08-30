#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

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

echo "Done."

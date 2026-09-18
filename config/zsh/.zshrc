export EDITOR="nvim"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Show the current directory, then the Git branch when the directory is a repo.
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b'

_update_git_prompt() {
  vcs_info
  if [[ -n $vcs_info_msg_0_ ]]; then
    PROMPT_GIT=" %B%F{blue}git:(%F{red}${vcs_info_msg_0_}%F{blue})%f%b"
  else
    PROMPT_GIT=''
  fi
}
precmd_functions+=(_update_git_prompt)
setopt prompt_subst
PROMPT='%B%F{green}󰘧%f%b %B%F{cyan}%1~%f%b${PROMPT_GIT} %B%F{yellow}✗%f%b '

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# Prefer modern command-line tools when they are installed, while retaining the
# standard commands on minimal systems.
if [[ -o interactive ]]; then
  if (( $+commands[bat] )); then
    alias cat='bat'
  elif (( $+commands[batcat] )); then
    alias cat='batcat'
  fi

  if (( $+commands[eza] )); then
    alias ls='eza'
    alias ll='eza -alF'
  else
    alias ll='ls -alF'
  fi

  if (( $+commands[rg] )); then
    alias grep='rg'
  fi

  if (( $+commands[fd] )); then
    alias find='fd'
  fi

  if (( $+commands[delta] )); then
    alias diff='delta'
  fi
fi

# Install the optional modern CLI replacements used by the aliases above.
install_optional_cli_tools() {
  if ! (( $+commands[brew] )); then
    print -u2 'Homebrew is required: https://brew.sh/'
    return 1
  fi

  brew install bat eza ripgrep fd git-delta fzf
}

alias n='nvim'
alias zsrc='source ~/.zshrc'

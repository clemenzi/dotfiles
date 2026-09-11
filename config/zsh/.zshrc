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

alias ll='ls -alF'
alias n='nvim'
alias zsrc='source ~/.zshrc'

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Extra user paths
export PATH=$HOME/bin:$PATH

plugins=(
  git
  history
  asdf
  zsh-vi-mode
  zsh-autosuggestions
  history-substring-search
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=/usr/bin/nvim

# Erlang / Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# vim
alias vim="nvim"

# ls -> exa
alias ls='exa --color=always --group-directories-first'
alias la='exa -la --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'

# dotfile management
alias dotfiles='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME'

# weather report
alias wttr="curl -i wttr.in"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# termbin
alias tb="nc termbin.com 9999"

alias cht="cht.sh"

. /opt/asdf-vm/asdf.sh

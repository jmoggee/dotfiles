# Plugins
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

autoload -U compinit; compinit;

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME

# Path
export PATH="$HOME/.tmuxifier/bin:$PATH"

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# We like color
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# Exports
export EDITOR='nvim'

# Evals
eval "$(tmuxifier init -)"
eval "$(zoxide init zsh)"
type starship_zle-keymap-select >/dev/null || eval "$(starship init zsh)"

# Aliases
alias p='paru'
alias vi='nvim'
alias vim='nvim'
alias cd='z'
alias ls='eza --icons=auto'
alias lh='eza --icons=auto -lha'

alias txl="tmuxifier load-session"


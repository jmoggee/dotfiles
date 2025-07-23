# Zinit setup
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

# History Substring Search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=black,bg=blue"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=black,bg=red"
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit load 'zsh-users/zsh-history-substring-search'
zinit ice wait atload'_history_substring_search_config'

# Arrows to go through history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Fix Home / End / Del keybindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

setopt inc_append_history 
setopt share_history
setopt extended_history 
setopt appendhistory 
setopt hist_ignore_space

# Aliases
alias ls="eza --icons=auto"
alias la="eza --icons=auto -la"
alias grep="grep --color=auto"
alias pry="iex --dbg pry -S mix"
alias txf="tmuxifier"
alias txfs="tmuxifier s"

# Exports
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$HOME/scripts:$HOME/.tmuxifier/bin:$PATH"
export SSH_AUTH_SOCK=~/.1password/agent.sock
export EDITOR="nvim"
export ERL_AFLAGS="-kernel shell_history enabled"

# Evals
eval "$(tmuxifier init -)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# Directory for client-specific scripts
SOURCE_DIRS=("$HOME/.zsh-scripts" "$HOME/.zsh-secrets")

for DIR in "${SOURCE_DIRS[@]}"; do
  # Check if the directory exists
  if [ -d "$DIR" ]; then
    # Loop through all the shell scripts in the directory
    for FILE in "$DIR"/*.sh; do
      # Check if the script file exists
      if [ -f "$FILE" ]; then
        # Source the script
        source "$FILE"
      fi
    done
  fi
done

# Source OS-specific files
os_name=$(uname | tr '[:upper:]' '[:lower:]')
os_source="$HOME/.zsh-$os_name.sh"

if [ -f "$os_source" ]; then
  source "$os_source"
fi

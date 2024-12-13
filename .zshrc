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
HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups

# Exports
export EDITOR="nvim"
export ERL_AFLAGS="-kernel shell_history enabled"

# Aliases
alias v="nvim"
alias vim="nvim"
alias ls="eza --icons=auto"
alias la="eza --icons=auto -la"

# Sources
source /opt/asdf-vm/asdf.sh

# Evals
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

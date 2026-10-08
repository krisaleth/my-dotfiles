# Dotfiles
export DOTFILES="$(cd "$(dirname "$(readlink -f "$HOME/.zshrc")")/.." && pwd)"

# Completion
autoload -Uz compinit
compinit

# Aliases
[[ -f "$DOTFILES/zsh/.zsh_aliases" ]] && source "$DOTFILES/zsh/.zsh_aliases"

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Zoxide
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# fzf keybindings
[[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]] && \
    source /usr/share/doc/fzf/examples/key-bindings.zsh

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# History search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Oh My Posh
if command -v oh-my-posh >/dev/null 2>&1 &&
   [[ -f "$DOTFILES/oh-my-posh/theme.omp.json" ]]; then
    eval "$(oh-my-posh init zsh --config "$DOTFILES/oh-my-posh/theme.omp.json")"
fi

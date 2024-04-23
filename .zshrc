# Giovanni Maria Cusaro's .zshrc - Feel free to use!

unsetopt BEEP

export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/sbin:$PATH"
export TERM=xterm-256color
export EDITOR=nvim
export VISUAL="$EDITOR"
export SSH_KEY_PATH="~/.ssh/giohub"
export UPDATE_ZSH_DAYS=7
export HOMEBREW_NO_ANALYTICS=1 # No HomeBrew Analytics

# my personal list
plugins=(
    git
    macos
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
    brew
)

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

ZSH_THEME="amuse"
ZSH_DISABLE_COMPFIX="true"
KEYTIMEOUT=0
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
bindkey '^I' autosuggest-accept

# Init StarShip
eval "$(starship init zsh)"

# Init Zoxide
eval "$(zoxide init zsh)"

# Init fzf
eval "$(fzf --zsh)"

# Aliases
alias t="touch"
alias m="mkdir"
alias c="clear"
alias ls="eza -a --icons"
alias lsl="eza --tree --icons"
alias app="brew cu -a"
alias ..="cd .."
alias ...="cd ../.."
alias v="nvim"

# Dotfiles bare repo
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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

# StarShip
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# fzf
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Eza
alias ls="eza -a --icons=always --no-time --no-user --no-permissions"
alias lsl="eza --tree --icons"

# Aliases
alias t="touch"
alias m="mkdir"
alias c="clear"
alias app="brew cu -a"
alias ..="cd .."
alias v="nvim"

# dot bare repo
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

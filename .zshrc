# Giovanni Maria Cusaro's .zshrc - Feel free to use!

unsetopt BEEP

export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/sbin:$PATH"
export TERM=xterm-256color
export EDITOR=nvim
export VISUAL="$EDITOR"
export SSH_KEY_PATH="~/.ssh/giohub"

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

export UPDATE_ZSH_DAYS=7
ZSH_THEME="amuse"
ZSH_DISABLE_COMPFIX="true"
KEYTIMEOUT=0

# Custom highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# my personal list
plugins=(
    git
    macos
    zsh-autosuggestions
    zsh-syntax-highlighting
    brew
)

source $ZSH/oh-my-zsh.sh

# No HomeBrew Analytics
export HOMEBREW_NO_ANALYTICS=1

# Init StarShip
eval "$(starship init zsh)"

# Aliases
alias t="touch"
alias m="mkdir"
alias c="clear"
alias ls="exa -a --icons"
alias lsl="exa -a -T --git-ignore --icons"
alias app="brew cu -a"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias v="nvim"
alias vim="nvim"

# Dotfiles bare repo
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
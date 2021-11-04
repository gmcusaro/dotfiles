# Giovanni Maria Cusaro's .zshrc - Feel free to use!

# First turn off all beeps
unsetopt BEEP

export ZSH=$HOME/.oh-my-zsh

export UPDATE_ZSH_DAYS=7
export TERM=xterm-256color
export EDITOR=nvim
export VISUAL="$EDITOR"

# User configuration
export PATH="$HOME/.rbenv/bin:$PATH"

# ssh
export SSH_KEY_PATH="~/.ssh/giohub"

ZSH_DISABLE_COMPFIX="true"
KEYTIMEOUT=0

# my personal list
plugins=(git osx ruby yarn zsh-autosuggestions zsh-syntax-highlighting emoji brew web-search)

source $ZSH/oh-my-zsh.sh

# Custom highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# This speeds up pasting w/ autosuggest - https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Init StarShip
eval "$(starship init zsh)"

# Aliases
alias t="touch"
alias m="mkdir"
alias c="clear"
alias vim=nvim
alias ls="exa -a --icons"
alias lsl="exa -a -T --git-ignore --icons"
alias app="brew cu"

# Dotfiles bare repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias brain='Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/brain/'

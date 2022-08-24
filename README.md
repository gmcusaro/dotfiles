# DOTFILES

My dotfile configuration.

**Warning:** Don't use this settings unless you know what that entails. Use at your own risk.

## What's in here?

- ZSH config (with Oh My ZSH!)
- Git utilities to make my life easier
- NeoVim (lua) config
- Miscellaneous setup

## 🚀  Setup environment on your machine

```sh
git clone --bare git@github.com:gmcusaro/dotfiles.git $HOME/.dotfiles

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no

dotfiles checkout
```

## Licence

[MIT](https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt)

# ~/.zshenv is used for setting environment variables and paths
source $HOME/.machine.zsh
if [ -f "$HOME/.machine-private.zsh" ]; then
  source $HOME/.machine-private.zsh
fi
source $HOME/.dotfiles/zsh/env.zsh
source $HOME/.dotfiles/zsh/paths.zsh
[ -s $HOME/.nvm/nvm.sh ] && source $HOME/.nvm/nvm.sh

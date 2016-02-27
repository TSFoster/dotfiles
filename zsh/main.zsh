# ~/.zshrc is only sourced in interactive shells

source $DOTDIR/terminal.zsh
source $DOTDIR/prompts.zsh
source $DOTDIR/autojump.zsh
source $DOTDIR/aliases/terminal.zsh
source $DOTDIR/aliases/filesystem.zsh
source $DOTDIR/aliases/programs.zsh
source $DOTDIR/aliases/git.zsh
source $DOTDIR/aliases/fzf.zsh
source $DOTDIR/shivs-hooks.zsh
source $DOTDIR/completions.zsh
source /usr/local/etc/profile.d/z.sh
if [[ "$OS" == "Mac" ]]; then
  source $DOTDIR/iterm2-integration.zsh
fi

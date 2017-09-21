# T.S. Foster's Dotfiles

## Requirements

These files have only been tested on macOS 10.12+. Installation should work from a fresh install of macOS **with Xcode and its command line tools installed, and its license agreed to**, and therefore assume the following programs are available:

* git
* zsh
* grep

## Installation

```bash
DOTFILES_DIR="$HOME/.config/dotfiles"
mkdir -p "$(dirname "$DOTFILES_DIR")"
git clone https://github.com/TSFoster/dotfiles.git "$DOTFILES_DIR"
cd "$DOTFILES_DIR"
bin/install_dotfiles
```

For the italic fonts (see [`./italic-fonts`](./italic-fonts)), make sure you have an italic font installed (I recommend [Triplicate]), and follow the instructions on [Alex Pearce]'s website.

[Triplicate]:  http://practicaltypography.com/triplicate.html            "Triplicate font by Matthew Butterick"
[Alex Pearce]: https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/ "Enabling italic fonts in iTerm2, tmux, and vim"

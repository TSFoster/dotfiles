# T.S. Foster's Dotfiles

## Requirements

These files have only been tested on macOS 10.11-10.13. Installation should work from a fresh install of macOS, and therefore assume the following programs are available:

* git
* zsh
* grep

Some packages are installed automatically with homebrew if on a Mac, so will have to be installed manually **beforehand** if not.

## Installation

This repo assumes it is located in $HOME/.config and has control over itself.

```bash
git clone https://github.com/TSFoster/dotfiles.git ~/.config
~/.config/meta/install
```

For the italic fonts (see [`./meta/italic-fonts`](./meta/italic-fonts)), make sure you have an italic font installed (I recommend [Triplicate]), and follow the instructions on [Alex Pearce]'s website.

[Triplicate]:  http://practicaltypography.com/triplicate.html            "Triplicate font by Matthew Butterick"
[Alex Pearce]: https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/ "Enabling italic fonts in iTerm2, tmux, and vim"

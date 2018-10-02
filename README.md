# T.S. Foster's Dotfiles

## Requirements

These files are primarily designed for macOS 10.11+. Installation should work from a fresh install of macOS, and assumes the following programs are available:

- curl
- grep
- sh

Some packages are installed automatically if on a Mac, but will have to be installed manually **beforehand** if not:

- git
- fish
- npm
- Applications in [./meta/Brewfile](./meta/Brewfile)

## Installation

**NOTE:** This repo assumes it is located in $HOME/.config and has control over itself.

```sh
curl -fsSL https://raw.githubusercontent.com/TSFoster/dotfiles/master/meta/install/install.sh | sh
```

## Italic fonts

For the italic fonts (see [`./meta/italic-fonts`][italics]), make sure you have an italic font installed (I recommend [Triplicate]), and follow the instructions on [Alex Pearce]'s website.

[triplicate]: http://practicaltypography.com/triplicate.html 'Triplicate font by Matthew Butterick'
[alex pearce]: https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/ 'Enabling italic fonts in iTerm2, tmux, and vim'
[italics]: ./meta/italic-fonts './meta/italic-fonts'

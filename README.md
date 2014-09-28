# T.S. Foster's Dotfiles

I am in the process of moving my old dotfiles directory (which was at one point lean and organised) to a new setup, hopefully not embarrassing enough to be public instead of private.

## Requirements

My dotfiles do not (yet) check for the existence of any of these, it just assumes them to be installed.

* UTF-8
* Git 1.7.10+
* Exuberant Ctags 5.8+
* tmux 1.9+
* Powerline beta (installed in /usr/local/bin)
* Ack >= 2
* Vim 7.4 with huge features, python, ruby

## Installation

Check requirements are met, clone this repository `git clone https://github.com/TSFoster/dotfiles.git ~/.dotfiles` and run `~/.dotfiles/bin/refresh_dotfiles`.

For the italic fonts (see the `italic-fonts` directory), make sure you have an italic font installed (I recommend [Triplicate]), and follow the instructions on [Alex Pearce]'s website.

[Triplicate]:  http://practicaltypography.com/triplicate.html            "Triplicate font by Matthew Butterick"
[Alex Pearce]: https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/ "Enabling italic fonts in iTerm2, tmux, and vim"

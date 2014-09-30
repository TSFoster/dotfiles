alias ls='ls -G'
alias la='ls -A'
alias l='ls'
alias ll='ls -l'
alias lal='ls -Al'
alias lla='ls -Al'

alias mkdir!='mkdir -p'

autoload -U zmv
alias mmv='noglob zmv -W'

# Safe file actions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

function f { cd *$1*/; }                            # Fuzzy cd to first match
function c { 1="${1-$HOME}"; cd $1; shift; ls $*; } # cd and ls (first argument for directory, remaining for ls options)
function mv- { mv $* "$OLDPWD"; c -; }              # Move file(s) to previous directory (remain in cwd)
function cd! { mkdir! $1; cd $1; }
alias c!='cd!'
alias up='c ..'
alias hist='dirs -p'
alias size='du -hs'                                 # Human-readable summary of size of files

alias vimswap_reset='rm -f ~/.vimswap/*.sw*'

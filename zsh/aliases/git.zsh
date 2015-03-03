alias git='hub'
alias g='git'

alias gst='git status'

alias gd='git diff'
alias gdc='git diff --cached'

function ga { git add ${*:-.}; }

alias gca='git commit --amend'
function gc {
  if [ $# -eq 0 ]; then
    git commit
  else
    git commit -m "$1"
  fi
}

# Git undo
# See: https://github.com/mapmeld/gitjk
alias gitjk="history 10 | tail -r | gitjk_cmd"

function gi { curl https://www.gitignore.io/api/$@; }

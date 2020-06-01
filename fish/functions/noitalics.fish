function noitalics
    set -l old_term $TERM
    set -x TERM xterm-256color
    command $argv
    set -x TERM $old_term
end

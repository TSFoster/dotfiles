function ssh
    set -l old_term $TERM
    set TERM xterm-256color
    command ssh $argv
    set TERM $old_term
end

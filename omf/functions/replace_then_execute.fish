function replace_then_execute
    set -l new_command ( \
        commandline \
            | sed 's/ N$/; terminal-notifier -message "Command finished"/g' \
            | sed 's/ V$/ | v -/g' \
            | sed 's/ G / | ag -S /g' \
    )
    commandline -r $new_command
    commandline -f execute
end

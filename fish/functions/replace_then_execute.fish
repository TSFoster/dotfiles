function replace_then_execute
  set -l new_command ( \
    commandline \
      | sed 's/ N$/; terminal-notifier -message "Command finished"/g' \
      | sed 's/ V$/ | '"$PAGER"'/g' \
      | sed 's/ G / | rg -S /g' \
  )
  commandline -r $new_command

  set prompt_count (expr $prompt_count + 1)

  commandline -f execute
end

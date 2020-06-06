function delete_or_kill_prompt_pids_and_exit
  set -l cmd (commandline)
  switch "$cmd"
    case ''
      count $prompt_pids > /dev/null
      and kill -TERM $prompt_pids 2> /dev/null
      exit 0
    case '*'
      commandline -f delete-char
  end
end

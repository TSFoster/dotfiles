function kill_prompt_background_processes --on-process-exit=%self
  count $prompt_pid > /dev/null
  and kill -9 $prompt_pid 2> /dev/null
end

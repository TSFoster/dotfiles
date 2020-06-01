function remove_tmp_files --on-process-exit=%self
  status --is-interactive; or return 0

  count $prompt_pid > /dev/null
  and kill -9 $prompt_pid 2> /dev/null

  count /tmp/fish-prompt-$fish_pid-* > /dev/null
  and rm /tmp/fish-prompt-$fish_pid-*

  return 0
end

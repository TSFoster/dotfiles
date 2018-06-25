function a
  set -q argv[1]
  and abduco -a $argv[1]
  or __fish_a_all_running
end

function __fish_a_all_running
  ls ~/.abduco | sed 's/@.*//'
end

complete -fc a -a '(__fish_a_all_running)'

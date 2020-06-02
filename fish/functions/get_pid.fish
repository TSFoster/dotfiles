function get_pid --wraps=get_iplayer
  set pid $argv[1]
  set -e argv[1]
  get_iplayer --get --type=all --pid=$pid $argv
end

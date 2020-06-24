function psgrep --description 'grep running processes'
  ps -A -o pid,ppid,state,%cpu,%mem,command | awk '
    BEGIN {
      matches = 0;
    }

    NR==1 {
      head = $0
    }

    ($2 == '$fish_pid' && /awk/) {
      next
    }

    /'$argv'/ {
      matches = 1
      print
    }

    END {
      if (matches == 0) {
        print "No matches"
        exit 1
      }
      print head
    }'
end

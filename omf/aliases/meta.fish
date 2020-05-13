abbr --add --global s 'source $OMF_CONFIG/init.fish'
abbr --add --global psg 'ps -A | rg -S'

if [ "$NVIM_LISTEN_ADDRESS" ]; and [ -z "$COLORTERM" ] # for some reason $COLORTERM is not set in nvim term://
  abbr --add --global man viman
end

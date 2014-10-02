if [ "$OS" = Mac ]; then JPATH=$(brew --prefix)/etc/autojump.sh; fi

if [ -s "$JPATH" ]; then source $JPATH; fi

unset JPATH

function c
    if [ (count $argv) -eq 0 ]
        pushd ~
    else
        pushd $argv
    end
end
abbr -a up 'c ..'

abbr -a l ls
abbr -a la 'ls -a'

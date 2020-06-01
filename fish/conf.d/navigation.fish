function c
    if [ (count $argv) -eq 0 ]
        pushd ~
    else
        pushd $argv
    end
end
abbr --add --global up 'c ..'
abbr --add --global -- - 'c -'

abbr --add --global l ls
abbr --add --global la 'ls -A'

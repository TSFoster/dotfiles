function c
    if [ (count $argv) -eq 0 ]
        pushd ~
    else
        pushd $argv
    end
end
alias up 'c ..'

alias l ls
alias la 'ls -a'

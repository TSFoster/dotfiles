alias git hub
alias g git

alias gs 'g s'
alias gd 'g d'
alias gdc 'g d --cached'
alias gst 'g st'
alias gsp 'g sp'
alias gca 'g c --amend'

if [ (type -t gittower 2> /dev/null) = 'file' ]
    function tower
        if [ (count $argv) -gt 0 ]
            command gittower $argv
        else
            set -l root (g root ^/dev/null)
            if [ $root = '\n' ]
                echo "You are not in a git repo" >&2
            else
                command gittower $root
            end
        end
    end
end

function ga
    if [ (count $argv) -eq 0 ]
        g a .
    else
        g a $argv
    end
end

function gc
    if [ (count $argv) -eq 0 ]
        g c
    else
        g c -m $argv
    end
end

function rebase_last
    g rebase -i HEAD~$argv
end

alias git hub
alias g git
alias gst 'g status'
alias gd 'g diff'

if [ (type -t tower) = 'file' ]
    function tow
        if [ count $argv -eq 0 ]
            tower $argv
        else
            set -l root (g root ^/dev/null)
            if [ $root = '\n' ]
                echo "You are not in a git repo" >&2
            else
                tower $root
            end
        end
    end
end

function 1p
    set arg "password"
    if [ (count $argv) -gt 0 ]
        set arg $argv
    end
    set item (1pass | fzf)
    [ ! -z "$item" ]; and 1pass $item $arg
end

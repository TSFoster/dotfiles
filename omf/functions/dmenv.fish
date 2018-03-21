function dmenv
    [ (count $argv) -eq 0 ]; and set argv -u
    eval (docker-machine env $argv)
end
complete -fc dmenv -a '-u (docker-machine ls -f "{{.Name}}")'

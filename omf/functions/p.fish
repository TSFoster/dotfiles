function p
    if contains -- '--rm' $argv
        if [ $argv[1] = '--rm' ]
            set project_name $argv[2]
        else
            set project_name $argv[1]
        end
        rm ~/.local/share/projects/$project_name.txt
        echo "Removed $project_name"
        return 0
    end
    if [ (count $argv) -eq 0 ]
        echo "Must provide project name" >&2
        return 1
    end
    set project_name $argv[1]
    set project_file_path ~/.local/share/projects/$project_name.txt
    if [ (count $argv) -ge 2 ]
        set cd_path $argv[2]
    else if [ -f $project_file_path ]
        set cd_path (cat $project_file_path)
    end
    [ -d $cd_path ]; or mkdir -p $cd_path
    cd $cd_path
    set project_path (pwd)
    echo $project_path > $project_file_path
    if [ "$NVIM_LISTEN_ADDRESS" ]
        echo "Will not run nvim from within nvim" >&2
        return 1
    end
    abduco -A nvim-$project_name nvim
end

function __fish_p_at_stage
    set cmd (commandline -opc)

    if [ (count $cmd) -eq $argv[1] ]
        return 0
    end

    return 1
end

complete -fc p -n '__fish_p_at_stage 1' -a '(string replace -r ".*/([^/]*).txt" \'$1\' ~/.local/share/projects/*.txt)'
complete -c p -n '__fish_p_at_stage 2'

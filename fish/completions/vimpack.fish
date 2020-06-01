function __fish_vimpack_at_stage
  set cmd (commandline -opc)

  if [ (count $cmd) -eq $argv[1] ]
    return 0
  end

  return 1
end

function __fish_vimpack_using_command
    contains (commandline -opc)[2] $argv
end

complete --command=vimpack --condition='__fish_vimpack_at_stage 1' --arguments='add' --description='Install a package to nvim config' --no-files
complete --command=vimpack --condition='__fish_vimpack_at_stage 1' --arguments='open' --description='Open a package’s URL' --no-files
complete --command=vimpack --condition='__fish_vimpack_at_stage 1' --arguments='update' --description='Run git pull in specified packages (leave blank to update all)' --no-files
complete --command=vimpack --condition='__fish_vimpack_at_stage 1' --arguments='list' --description='List all installed packages' --no-files
complete --command=vimpack --condition='__fish_vimpack_at_stage 1' --arguments='remove' --description='Remove a package from nvim config' --no-files

complete --command=vimpack --condition='__fish_vimpack_using_command add install i a' --long-option=opt --short-option=o --description='Install to opt directory, so package doesn’t load on launch'
complete --command=vimpack --condition='__fish_vimpack_using_command add install i a' --long-option=bundle --short-option=b --require-parameter --arguments='(ls $HOME/.config/nvim/pack/)' --description='Install package to given pack directory' --no-files
complete --command=vimpack --condition='__fish_vimpack_using_command add install i a' --long-option=do --short-option=d --require-parameter --arguments='npm\ install yarn\ install\ --frozen-lockfile make' --description='Run given command on install and each update' --no-files

complete --command=vimpack --condition='__fish_vimpack_using_command list ls l' --long-option=start --short-option=s --description='Only list packages installed to start directories'
complete --command=vimpack --condition='__fish_vimpack_using_command list ls l' --long-option=opt --short-option=o --description='Only list packages installed to opt directories'
complete --command=vimpack --condition='__fish_vimpack_using_command list ls l' --long-option=bundle --short-option=b --require-parameter --arguments='(ls $HOME/.config/nvim/pack/)' --description='Only list packages installed to given pack directory' --no-files

complete --command=vimpack --condition='__fish_vimpack_using_command open o rm remove delete r d uninstall un update up' --arguments='(find $HOME/.config/nvim/pack/ -type d -depth 3 | xargs basename)' --no-files

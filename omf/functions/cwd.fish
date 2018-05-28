function cwd
  if [ "$NVIM_LISTEN_ADDRESS" ]
    nvr --remote-expr 'getcwd()'
  else
    pwd
  end
end

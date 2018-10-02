set fish_key_bindings fish_vi_key_bindings

for file in $OMF_CONFIG/aliases/*.fish
    source $file
end

source $OMF_CONFIG/ssh_agent.fish

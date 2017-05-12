function fish_user_key_bindings
    source ~/.config/fisherman/fzf/key_bindings.fish
    bind -M insert \co 'clear; commandline -f repaint'
    bind -M insert \r 'replace_then_execute'
    bind -M visual \r 'replace_then_execute'
    bind \r 'replace_then_execute'
    bind -M insert kk 'accept-autosuggestion'
    bind -M insert -m default jj 'commandline -f repaint'
end

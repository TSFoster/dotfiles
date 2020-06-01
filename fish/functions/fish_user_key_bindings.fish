function fish_user_key_bindings
  fish_vi_key_bindings

  bind \r 'replace_then_execute'
  bind --mode insert \cp 'clear; commandline -f repaint'
  bind --mode insert \r 'replace_then_execute'
  bind --mode visual \r 'replace_then_execute'
  bind --mode insert kk 'accept-autosuggestion'
  bind --mode insert kK 'forward-bigword'
  bind --mode insert --sets-mode default jj 'commandline -f repaint'
end

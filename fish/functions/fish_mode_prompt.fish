function fish_mode_prompt --description 'Sets the mode_color for the current mode'
  set --global mode_color white
  switch $fish_bind_mode
    case default
      set mode_color green
    case insert
      set mode_color red
    case replace_one
      set mode_color white
    case replace
      set mode_color brblack
    case visual
      set mode_color brblue
  end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.dotfiles/hammerspoon/", hs.reload):start()
hs.alert.show("Config reloaded", 0.5)

hs.pathwatcher.new(os.getenv("HOME") .. "/.dotfiles/hammerspoon/", hs.reload):start()

reloaded = hs.menubar.new()
reloaded:setTitle("Config reloaded")
os.execute("sleep 2")
reloaded:delete()

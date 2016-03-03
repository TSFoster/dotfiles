dir = os.getenv("HOME") .. "/.dotfiles/hammerspoon/"
function config(file)
  dofile(dir .. file .. ".lua")
end

config("keys")
config("command")
config("config_reload")
config("menu_icon")
config("caffeine")
config("wifi-watch")
config("type-clipboard")

local dir = os.getenv("HOME") .. "/.dotfiles/hammerspoon/"
function load(file)
  dofile(dir .. file .. ".lua")
end

load("keys")
load("config_reload")
load("caffeine")
load("wifi-watch")
load("type-clipboard")

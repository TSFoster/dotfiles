dofile("keys.lua")

local caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
  if state then
    caffeine = hs.menubar.new()
    caffeine:setTitle("👁")
    caffeine:setClickCallback(caffeineClicked)
  else
    caffeine:delete()
  end
end

function caffeineClicked()
  setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

setCaffeineDisplay(hs.caffeinate.get("displayIdle"))

hs.hotkey.bind(almost_hyper, "8", caffeineClicked)

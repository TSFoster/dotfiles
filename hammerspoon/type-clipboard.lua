dofile("./keys.lua")

hs.hotkey.bind(almost_hyper, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

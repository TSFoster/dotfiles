dofile("./keys.lua")

hs.hotkey.bind(meta, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

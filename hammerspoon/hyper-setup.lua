k = hs.hotkey.modal.new({}, "F17")

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

keysToHyper = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","-","=","§","`",",",".","/",";","'","\\","[","]","space","tab","delete","return","left","right","up","down"}

for key, keyToHyper in pairs(keysToHyper) do
    k:bind({}, keyToHyper, nil, function()
        k.triggered = true
        hs.eventtap.keyStroke(hyper, keyToHyper)
    end)
    k:bind({"cmd"}, keyToHyper, nil, function()
        k.triggered = true
        hs.eventtap.keyStroke(hyper_cmd, keyToHyper)
    end)
    k:bind({"alt"}, keyToHyper, nil, function()
        k.triggered = true
        hs.eventtap.keyStroke(hyper_alt, keyToHyper)
    end)
    k:bind({"ctrl"}, keyToHyper, nil, function()
        k.triggered = true
        hs.eventtap.keyStroke(hyper_ctrl, keyToHyper)
    end)
    k:bind({"shift"}, keyToHyper, nil, function()
        k.triggered = true
        hs.eventtap.keyStroke(hyper_shift, keyToHyper)
    end)
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send Cmd + space if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({"cmd"}, "space")
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, "F18", pressedF18, releasedF18)

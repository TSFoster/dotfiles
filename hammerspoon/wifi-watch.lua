local wifiWatcher = nil
local homeSSID = "TRANEHAVEGAARD221DOR15"
local lastSSID = hs.wifi.currentNetwork()
local lastTime = os.time({year = 1979, month = 1, day = 1})

function ssidChangedCallback()
  newSSID = hs.wifi.currentNetwork()
  device = hs.audiodevice.defaultOutputDevice()
  thisTime = os.time()

  if newSSID == homeSSID then
    if lastSSID ~= homeSSID and device:muted() then
      device:setMuted(false)
      hs.alert.show("Volume unmuted, set to " .. device:volume() .. "%")
    end
    lastSSID = newSSID
    lastTime = os.time()
  elseif os.difftime(thisTime, lastTime) > 300 and not device:muted() then
    device:setMuted(true)
    hs.alert.show("Volume muted")
  end
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

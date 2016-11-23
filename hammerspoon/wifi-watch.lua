local wifiWatcher = nil
local homeSSID = "Home"
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
  elseif lastSSID ~= homeSSID and os.difftime(thisTime, lastTime) > 300 and not device:muted() then
    device:setMuted(true)
    hs.alert.show("Volume muted")
  end
  lastTime = os.time()
  lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

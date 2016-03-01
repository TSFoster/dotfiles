local wifiWatcher = nil
local homeSSID = "TRANEHAVEGAARD221DOR15"
local lastSSID = hs.wifi.currentNetwork()
local lastTime = 0

function ssidChangedCallback()
  newSSID = hs.wifi.currentNetwork()
  device = hs.audiodevice.defaultOutputDevice()
  thisTime = os.clock()

  if lastSSID == homeSSID then
    lastTime = os.clock()
  end

  if newSSID == homeSSID and lastSSID ~= homeSSID and device:muted() then
    device.setMuted(false)
    hs.alert.show("Volume unmuted, set to " .. device.volume)
  elseif newSSID ~= homeSSID and lastSSID == homeSSID and (thisTime - lastTime) > (60 * 5) and not device.jackConnected() then
    device:setMuted(true)
    hs.alert.show("Volume muted")
  end

  lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

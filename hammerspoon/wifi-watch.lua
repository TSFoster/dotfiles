local wifiWatcher = nil
local homeSSID = "TRANEHAVEGAARD221DOR15"
local lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        hs.audiodevice.defaultOutputDevice():setVolume(25)
        hs.notify.new({title="Volume is on", informativeText="Welcome home"}):send()
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        hs.audiodevice.defaultOutputDevice():setVolume(0)
        hs.notify.new({title="Volume muted", informativeText=""}):send()
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

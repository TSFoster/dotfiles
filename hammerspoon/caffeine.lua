local menubar = nil
local delayPeriod = hs.timer.minutes(10)
local offSwitch = nil
local menubarUpdater = nil

function setCaffeine(shouldCaffeinate)
  if shouldCaffeinate then
    resetTimerAndMenubar()
    hs.caffeinate.set("displayIdle", true, true)
    menubar = hs.menubar.new()
    menubar:setClickCallback(turnOff)
    updateMenubarTitle()
  else
    hs.caffeinate.set("displayIdle", false, false)
    resetTimerAndMenubar()
  end
end


function resetTimerAndMenubar()
  if offSwitch ~= nil then
    offSwitch:stop()
    offSwitch = nil
  end
  if menubar ~= nil then
    menubar:delete()
    menubar = nil
  end
  if menubarUpdater ~= nil then
    menubarUpdater:stop()
    menubarUpdater = nil
  end
end


function turnOff()
  setCaffeine(false)
end


function toggle()
  if offSwitch ~= nil then
    setCaffeine(true)
  else
    setCaffeine(not hs.caffeinate.get("displayIdle"))
  end
end


function extend()
  if menubar == nil then
    setCaffeine(true)
  end
  if offSwitch == nil then
    offSwitch = hs.timer.doAfter(delayPeriod, turnOff)
  else
    offSwitch:setNextTrigger(offSwitch:nextTrigger()+delayPeriod)
  end
  updateMenubarTitle()
  menubarUpdater = hs.timer.doEvery(60, updateMenubarTitle)
end


function updateMenubarTitle()
  if menubar ~= nil then
    if offSwitch ~= nil then
      minsLeft = math.ceil (offSwitch:nextTrigger()/60)
      if minsLeft >= 60 then
        remaining = math.floor (minsLeft/60) .. "h" .. (minsLeft % 60) .. "m"
      else
        remaining = minsLeft .. "m"
      end
    else
      remaining = ""
    end
    menubar:setTitle("👁 " .. remaining)
  end
end


setCaffeine(hs.caffeinate.get("displayIdle"))

hs.hotkey.bind(hyper, "8", toggle)
hs.hotkey.bind(hyper_cmd, "8", extend)

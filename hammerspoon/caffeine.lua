local caffeine_menubar = hs.menubar.new():removeFromMenuBar()
local delayPeriod = hs.timer.minutes(10)
local offSwitch = nil
local menubarUpdater = nil

function setCaffeine(shouldCaffeinate)
  if shouldCaffeinate then
    caffeine_menubar:returnToMenuBar()
    resetTimer()
    hs.caffeinate.set("displayIdle", true, true)
    updateMenubarTitle()
  else
    caffeine_menubar:removeFromMenuBar()
    hs.caffeinate.set("displayIdle", false, false)
    resetTimer()
  end
end


function resetTimer()
  if offSwitch ~= nil then
    offSwitch:stop()
    offSwitch = nil
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
  if not caffeine_menubar:isInMenubar() then
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
  if caffeine_menubar:isInMenubar() then
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
    caffeine_menubar:setTitle("👁 " .. remaining)
  end
end


caffeine_menubar:setClickCallback(turnOff)
setCaffeine(hs.caffeinate.get("displayIdle"))

hs.hotkey.bind(hyper, "8", toggle)
hs.hotkey.bind(hyper_cmd, "8", extend)

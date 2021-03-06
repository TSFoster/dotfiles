-- PATHS

local homeDir = os.getenv('HOME')
local hsDir = homeDir .. "/.config/hammerspoon/"
function homePath(path)
    if not path then return homeDir end
    return homeDir .. '/' .. path
end

function bin(name)
  return homePath('.config/meta/bin/') .. name
end


-- CONFIG RELOAD

function config(file)
  dofile(hsDir .. file .. ".lua")
end

function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(hsDir, reloadConfig):start()
hs.alert.show("Config loaded")


-- HYPER KEY

-- Definitions

hyper = {"cmd", "alt", "ctrl", "shift"}
hyper_for = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","-","=","§","`",",",".","/",";","'","\\","[","]","space","tab","delete","return","left","right","up","down"}


-- Bindings

modal_hotkey = hs.hotkey.modal.new({}, "F17")

for k1, key in pairs(hyper_for) do
  modal_hotkey:bind({}, key, nil, function()
      modal_hotkey.triggered = true
      hs.eventtap.keyStroke(hyper, key)
  end)
end

pressedF18 = function()
  modal_hotkey.triggered = false
  modal_hotkey:enter()
end

releasedF18 = function()
  modal_hotkey:exit()
  -- Send Cmd + space if no other keys were pressed.
  if not modal_hotkey.triggered then
    hs.eventtap.keyStroke({"cmd"}, "space")
  end
end

-- Bind the Hyper key to F18
f18 = hs.hotkey.bind({}, "F18", pressedF18, releasedF18)


-- MENU ICON TOGGLE

function toggleMenu()
  hs.menuIcon(not hs.menuIcon())
end

hs.menuIcon(false)
hs.hotkey.bind(hyper, "7", toggleMenu)


-- CAFFEINE

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
hs.hotkey.bind(hyper, "9", extend)


-- TYPE CLIPBOARD

hs.hotkey.bind(hyper, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)


-- RESTART BROKEN PROXY CONTAINER

function if_system_did_wake(event)
  if event == hs.caffeinate.watcher.systemDidWake or event == hs.caffeinate.watcher.screensDidWake then
    restart_proxy()
  end
end
function restart_proxy()
  hs.execute(bin('check_proxy_health'))
end
hs.caffeinate.watcher.new(if_system_did_wake):start()
hs.wifi.watcher.new(restart_proxy):watchingFor({"SSIDChange"}):start()


-- MENUBAR NOTIFICATIONS

function menubarNotifier(icon, seconds, path, countScript, clickScript)
    local menubarIcon = hs.menubar.new():setTitle(icon):removeFromMenuBar()
    local getCount = function()
        output,status,type_,rc = hs.execute(countScript)
        count = tonumber(string.gsub(output, "[^0-9]",""),10)
        if count ~= nil and count > 0 then
            menubarIcon:returnToMenuBar()
        else
            menubarIcon:removeFromMenuBar()
        end
    end
    local onClick = function()
        hs.execute(clickScript)
        getCount()
    end
    menubarIcon:setClickCallback(onClick)
    if path then hs.pathwatcher.new(path, getCount):start() end
    if seconds then hs.timer.doEvery(seconds, getCount) end
    getCount()
end

menubarNotifier("↘︎", 30, nil, bin('mailbox-count Drafts') , bin('mailbox-count Drafts --unread --activate'))
menubarNotifier("↑", 30, nil, bin('mailbox-count Updates --unread') , bin('mailbox-count Updates --unread --activate'))
menubarNotifier("↓", 30, homePath("Downloads"), "ls -1 " .. homePath("Downloads") .. " | wc -l", 'osascript -e "var finder=Application(\'Finder\');Finder.home.folders.byName(\'Downloads\').open();Finder.activate();"')

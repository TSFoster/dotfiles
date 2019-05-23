-- PATHS

local homeDir = os.getenv('HOME')
local hsDir = homeDir .. "/.config/hammerspoon/"
function homePath(path)
    if not path then return homeDir end
    return homeDir .. '/' .. path
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

hypers = { ["all"]   = {"cmd", "alt", "ctrl", "shift"}
         , ["cmd"]   = {       "alt", "ctrl", "shift"}
         , ["alt"]   = {"cmd",        "ctrl", "shift"}
         , ["ctrl"]  = {"cmd", "alt",         "shift"}
         , ["shift"] = {"cmd", "alt", "ctrl"         }
         }

hyper_for = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","-","=","§","`",",",".","/",";","'","\\","[","]","space","tab","delete","return","left","right","up","down"}


-- Bindings

modal_hotkey = hs.hotkey.modal.new({}, "F17")

for k1, key in pairs(hyper_for) do
  for kind, hyper in pairs(hypers) do
    local kind_table = {}
    if kind ~= "all" then
      kind_table = { kind }
    end
    modal_hotkey:bind(kind_table, key, nil, function()
        modal_hotkey.triggered = true
        hs.eventtap.keyStroke(hyper, key)
    end)
  end
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
hs.hotkey.bind(hypers["all"], "7", toggleMenu)


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

hs.hotkey.bind(hypers["all"], "8", toggle)
hs.hotkey.bind(hypers["cmd"], "8", extend)


-- TYPE CLIPBOARD

hs.hotkey.bind(hypers["all"], "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)


-- RESTART BROKEN PROXY CONTAINER

function if_system_did_wake(event)
  if event == hs.caffeinate.watcher.systemDidWake or event == hs.caffeinate.watcher.screensDidWake then
    restart_proxy()
  end
end
function restart_proxy()
  hs.execute(homePath('.config/meta/bin/check_proxy_health'))
end
hs.caffeinate.watcher.new(if_system_did_wake):start()
hs.wifi.watcher.new(restart_proxy):watchingFor({"SSIDChange"}):start()


-- MAIL TO THINGS


function processMailboxes()
    local lastTime = os.time({year = 1979, month = 1, day = 1})
    return function()
        local thisTime = os.time()
        if math.abs(os.difftime(lastTime, thisTime)) > 10 then
          hs.execute(homePath('.config/meta/bin/sort_mail'))
        end
        lastTime = os.time()
    end
end

local mailPath = homePath('Library/Mail')
if mailPath then
  local mailTasksFn = processMailboxes()
  mailTasksFn()
  hs.pathwatcher.new(mailPath, mailTasksFn):start()
  hs.timer.doEvery(60, mailTasksFn):start()
end


-- MENUBAR NOTIFICATIONS

function genericNotifier(icon, path, countScript, clickScript)
    if not path then return nil end
    local menubarIcon = hs.menubar.new():setTitle(icon):removeFromMenuBar()
    local onClick = function() hs.execute(clickScript) end
    local getCount = function()
        output,status,type_,rc = hs.execute(countScript)
        count = tonumber(string.gsub(output, "[^0-9]",""),10)
        if count ~= nil and count > 0 then
            menubarIcon:returnToMenuBar()
        else
            menubarIcon:removeFromMenuBar()
        end
    end
    menubarIcon:setClickCallback(onClick)
    hs.pathwatcher.new(path, getCount):start()
    getCount()
end

function mailboxNotifier(icon, name)
    genericNotifier(
      icon,
      homePath('Library/Mail'),
      homePath('.config/meta/bin/mailbox-count') .. ' ' .. name,
      homePath('.config/meta/bin/mailbox-count') .. ' ' .. name .. ' --activate'
    )
end

mailboxNotifier("↘︎", "Drafts")
mailboxNotifier("↑", "Updates --unread")
genericNotifier(
  "↓",
  homePath("Downloads"),
  "ls -1 " .. homePath("Downloads") .. " | wc -l",
  'osascript -e "var finder=Application(\'Finder\');Finder.home.folders.byName(\'Downloads\').open();Finder.activate();"'
)

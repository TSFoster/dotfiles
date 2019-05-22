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


-- MAIL TO THINGS


function processMailboxes()
    local lastTime = os.time({year = 1979, month = 1, day = 1})
    local code = [[
      (function processMailboxes(app) {
        var Mail = app('Mail');
        var Things = app('Things');

        if (!Mail.running() || !Things.running()) return;

        var mailboxes = Mail.accounts.byName('Strange Bureau').mailboxes;
        var archiveMailbox = mailboxes.byName('In Things');
        var thingsInbox = Things.lists.byName('Inbox');

        getMessagesIn('INBOX', {flaggedStatus: true})
          .map(actionToDo)
          .map(addToDosToInbox)
          .map(archiveMessage);
        getMessagesIn('To reply')
          .map(replyToDo)
          .map(addToDosToInbox)
          .map(archiveMessage);
        getMessagesIn('Waiting')
          .map(waitingToDo)
          .map(addToDosToInbox)
          .map(archiveMessage);

        function waitingToDo(model) {
          const name = isSelf(model.message.sender())
            ? thirdParties(model.message) + ' replied?'
            : 'Waiting on ' + thirdParties(model.message);
          return addToDo(model, {
            name: name,
            notes: makeNote(model.message),
            tagNames: ['@Waiting'],
          });
        }

        function replyToDo(model) {
          return addToDo(model, {
            name: 'Reply to ' + thirdParties(model.message),
            notes: makeNote(model.message),
            tagNames: ['Correspondence'],
          });
        }

        function actionToDo(model) {
          return addToDo(model, {
            name: 'Action email ‘' + model.message.subject() + '’',
            notes: makeNote(model.message),
          });
        }

        function addToDo(model, toDo) {
          model.toDos.push(toDo);
          return model;
        }

        function thirdParties(message) {
          if (isSelf(message.sender())) return extractNames(message.recipients());
          return extractName(message.sender());
        }

        function isSelf(sender) {
          return /Toby Foster|<.*toby.*(millk|strangebureau|efex|tsf|mor-far)>/.test(
            sender,
          );
        }

        function extractNames(recipients) {
          return recipients.map(getName).join(', ');
        }

        function extractName(sender) {
          var match = sender.match(/((.*) )?<(.*)>/);
          return match[2] || match[3];
        }

        function makeNote(message) {
          const recipients = message
            .recipients()
            .map(getFullName)
            .join(', ');
          return `
                          From: ${message.sender()}
                          To: ${recipients}
                          Subject: ${message.subject()}
                          Message ID: ${message.id()}

                          message://${encodeURIComponent(
                            '<' + message.messageId() + '>',
                          )}
                      `
            .trim()
            .replace(/\n\t+/g, '\n');
        }

        function getName(recipient) {
          var name = recipient.name();
          if (name && name.length > 0) return name;
          return recipient.address();
        }

        function getFullName(recipient) {
          return recipient.name() + ' <' + recipient.address() + '>';
        }

        function addToDosToInbox(model) {
          model.toDos.forEach(addToDoToInbox);
          return model;
        }

        function addToDoToInbox(toDo) {
          thingsInbox.toDos.push(Things.ToDo(toDo));
        }

        function archiveMessage(model) {
          model.message.flaggedStatus = false;
          Mail.move(model.message, {to: archiveMailbox});
          return model;
        }

        function getMessagesIn(mailboxName, extraConditions = {}) {
          const conditions = Object.assign(
            {
              deletedStatus: false,
            },
            extraConditions,
          );
          return mailboxes
            .byName(mailboxName)
            .messages.where(conditions)()
            .map(function(message) {
              return {
                message: message,
                toDos: [],
              };
            });
        }
      })(Application);
    ]]

    return function()
        local thisTime = os.time()
        if math.abs(os.difftime(lastTime, thisTime)) > 10 then
          hs.osascript.javascript(code)
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
    local onClick = function() hs.osascript.javascript(clickScript) end
    local getCount = function()
        successful, count = hs.osascript.javascript(countScript)
        if successful and count > 0 then
            menubarIcon:returnToMenuBar()
        else
            menubarIcon:removeFromMenuBar()
        end
    end
    menubarIcon:setClickCallback(onClick)
    hs.pathwatcher.new(path, getCount):start()
    getCount()
end

function mailboxNotifier(icon, name, location, count)
    genericNotifier(
        icon, homePath('Library/Mail'),
        [[
            var Mail = Application('Mail');
            !(Mail.running()) ? 0 :
                Mail.accounts.byName('Strange Bureau')
                    .mailboxes.byName(']] .. name .. "')." .. count .. ";",
        [[
            var Mail = Application('Mail');
            if (!Mail.running()) Mail.launch();
            Mail.messageViewers.first().selectedMailboxes = Mail.]] .. location .. [[;
            Mail.activate();
        ]]
    )
end

mailboxNotifier(
    "↘︎", "Drafts",
    "draftsMailbox",
    "messages.where({deletedStatus: false}).length"
)
mailboxNotifier(
    "↑", "Updates",
    "accounts.byName('Strange Bureau').mailboxes.byName('Updates')",
    "unreadCount()"
)
genericNotifier(
    "↓", homePath("Downloads"),
    "Application('Finder').home.folders.byName('Downloads').items.length;",
    [[
        var Finder = Application('Finder');
        Finder.home.folders.byName('Downloads').open();
        Finder.activate();
    ]]
)

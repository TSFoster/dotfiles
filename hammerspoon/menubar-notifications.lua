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

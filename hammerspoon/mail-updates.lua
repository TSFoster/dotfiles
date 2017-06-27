local mail_menubar = hs.menubar.new():removeFromMenuBar()
local mail_timer = nil

function go_to_updates()
    hs.osascript.javascript([[
        const Mail = Application('Mail');
        if (!Mail.running()) Mail.launch();
        Mail.messageViewers.first().selectedMailboxes =
            Mail.accounts.byName('Strange Bureau')
                .mailboxes.byName('Updates');
        Mail.activate();
    ]])
    mail_menubar:removeFromMenuBar()
    mail_timer:setNextTrigger(60)
end

function mail_menu()
    status, object, descriptor = hs.osascript.javascript([[
        Application('Mail').running()
            ? Application('Mail')
                .accounts.byName('Strange Bureau')
                .mailboxes.byName('Updates')
                .unreadCount()
            : 0;
    ]])

    if status and object > 0 then
        mail_menubar:setTitle("(" .. object .. ")")
        mail_menubar:returnToMenuBar()
    else
        mail_menubar:removeFromMenuBar()
    end
end

mail_timer = hs.timer.doEvery(2 * 60, mail_menu)
mail_menubar:setClickCallback(go_to_updates)
mail_menu()

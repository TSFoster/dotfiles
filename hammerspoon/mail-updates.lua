local mail_menubar = nil
local mail_timer = nil

function delete_mail_menubar()
    if mail_menubar ~= nil then
        mail_menubar:delete()
        mail_menubar = nil
    end
end

function go_to_updates()
    hs.osascript.javascript([[
        const Mail = Application('Mail');
        if (!Mail.running()) Mail.launch();
        Mail.messageViewers.first().selectedMailboxes =
            Mail.accounts.byName('Strange Bureau')
                .mailboxes.byName('Updates');
        Mail.activate();
    ]])
    delete_mail_menubar()
    if mail_timer ~= nil then
        mail_timer.setNextTrigger(60)
    end
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
        if mail_menubar == nil then
            mail_menubar = hs.menubar.new()
            mail_menubar:setClickCallback(go_to_updates)
            mail_menubar:setTitle("(" .. object .. ")")
        end
    else
        delete_mail_menubar()
    end
end

mail_menu()
mail_timer = hs.timer.doEvery(2 * 60, mail_menu)

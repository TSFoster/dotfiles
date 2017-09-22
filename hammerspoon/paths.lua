local homeDir = os.getenv('HOME')
function homePath(path)
    if not path then return homeDir end
    return homeDir .. '/' .. path
end

local mailPath = nil
local maildir = io.open(os.getenv('HOME').. '/.config/maildir')
if maildir ~= nil then
    mailPath = os.getenv('HOME') .. '/Library/Mail/V' .. maildir:read()
else
    hs.alert.show("To enable Mail integration, setup ~/.config/maildir")
end
function mailboxPath(boxName)
    if not mailPath or not boxName then return mailPath end
    return mailPath .. '/' .. boxName .. '.mbox'
end

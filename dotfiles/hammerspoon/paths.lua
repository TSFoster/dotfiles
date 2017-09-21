local homeDir = os.getenv('HOME')
function homePath(path)
    if not path then return homeDir end
    return homeDir .. '/' .. path
end

local mailPath = os.getenv('HOME') .. '/Library/Mail/V5/0BE673C6-821F-4F84-914B-3815D51A3292'
function mailboxPath(boxName)
    if not boxName then return mailPath end
    return mailPath .. '/' .. boxName .. '.mbox'
end

local homeDir = os.getenv('HOME')
function homePath(path)
    if not path then return homeDir end
    return homeDir .. '/' .. path
end

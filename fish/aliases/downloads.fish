function get_pid
    get_iplayer --get --pid=$argv
end

function get_pidr
    get_iplayer --get --type=radio --pid=$argv
end


alias pms '/Applications/Plex\ Media\ Server.app/Contents/MacOS/Plex\ Media\ Scanner'


alias dbu dropbox_uploader.sh

function reload()
  cmd = "/usr/local/bin/luac -p " .. dir .. "*.lua"
  result = command(cmd)
  if result == "" then
    hs.reload()
  else
    command(cmd .. " | pbcopy")
    hs.alert.show("Config not reloaded", 2)
    hs.alert.show("Syntax errors copied to clipboard", 2)
  end
end

hs.pathwatcher.new(dir, reload):start()
hs.alert.show("Config reloaded", 0.5)

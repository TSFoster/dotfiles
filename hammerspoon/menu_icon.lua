function toggleMenu()
  if hs.menuIcon() then
    hs.menuIcon(false)
  else
    hs.menuIcon(true)
  end
end

hs.menuIcon(false)
hs.hotkey.bind(hyper, "7", toggleMenu)

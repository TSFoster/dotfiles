function toggleMenu()
  hs.menuIcon(not hs.menuIcon())
end

hs.menuIcon(false)
hs.hotkey.bind(hyper, "7", toggleMenu)

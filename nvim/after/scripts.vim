call cursor#save()
if 0 < search('\(.\)\1\|_.')
  setfiletype man
endif
call cursor#restore()

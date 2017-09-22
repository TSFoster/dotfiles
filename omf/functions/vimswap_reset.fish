function vimswap_reset
    set swapfiles ~/.local/share/nvim/swap/*.swp
    if [ (count $swapfiles) -gt '0' ]
        rm $swapfiles
    end
end

function vimpack --description 'Functions for working with vim’s native package system'
  switch $argv[1]
    case add install i a
      set -e argv[1]

      set -l options \
        (fish_opt --short=o --long=opt) \
        (fish_opt --short=b --long=bundle --required-val)
      argparse $options -- $argv

      set -l owd (pwd)

      set -l bundle
      if set -q _flag_bundle
        set bundle $_flag_bundle
      else
        if set -q VIMPACK_BUNDLE
          set bundle $VIMPACK_BUNDLE
        else
          echo 'Bundle must be provided via -b, --bundle or $VIMPACK_BUNDLE' >&2
          return 1
        end
      end

      for url in $argv
        string match --quiet --regex '^(http|git@)' $url
        or set -l url https://github.com/$url

        set -l name (string replace --regex '\.git$' '' (basename $url))

        set -q _flag_opt; and set -l kind opt; or set -l kind start

        set -l dir $HOME/.config/nvim/pack/$bundle/$kind
        mkdir -p $dir

        cd $dir

        git submodule add --name "nvim/$name" -- $url ./$name

        cd $name

        [ -d doc ]; and nvim -u /dev/null -es +'helptags doc' +q

        cd $HOME/.config

        git config --file .gitmodules --add "submodule.nvim/$name.ignore" dirty
      end

      cd $owd
    case update u up upgrade
      set -e argv[1]
      set -l dirs

      if count $argv > /dev/null
        set dirs $HOME/.config/nvim/pack/*/{opt,start}/$argv/.git
      else
        set dirs $HOME/.config/nvim/pack/*/{opt,start}/*/.git
      end

      if not count $dirs > /dev/null
        echo 'No plugins found' >&2
        return 1
      end

      set -l owd (pwd)

      count /tmp/vimpack-update-* > /dev/null; and rm /tmp/vimpack-update-*

      for dir in $dirs
        cd (dirname $dir)
        command git pull origin master &> /tmp/vimpack-update-(random) &
        while [ (count (jobs)) -ge 10 ]; sleep 0.5; end
      end

      await

      cat /tmp/vimpack-update-*
      rm /tmp/vimpack-update-*

      cd $owd
    case list ls l
      set -e argv[1]

      set -l options \
        (fish_opt --short=o --long=opt) \
        (fish_opt --short=s --long=start) \
        (fish_opt --short=b --long=bundle --required-val)
      argparse $options -- $argv

      set -l dirs
      if set -q _flag_bundle
        set dirs $HOME/.config/nvim/pack/$_flag_bundle
      else
        set dirs $HOME/.config/nvim/pack/*
      end

      if set -q _flag_opt
        set dirs $dirs/opt/
      else if set -q _flag_start
        set dirs $dirs/start/
      else
        set dirs $dirs/{opt,start}/
      end

      if count $argv > /dev/null
        set dirs $dirs/*$argv*/.git
      else
        set dirs $dirs/*/.git
      end

      for dir in $dirs
        basename (dirname $dir)
      end
    case rm remove delete d r
      set -e argv[1]

      if not count $argv > /dev/null
        echo 'You must list which plugin to remove' >&2
        return 1
      end

      set -l owd (pwd)
      cd $HOME/.config

      for module in $argv
        git config --file .git/config --remove-section "submodule.nvim/$module"
        git config --file .gitmodules --remove-section "submodule.nvim/$module"
      end
      git rm --cached nvim/pack/*/{opt,start}/$argv
      rm -rf nvim/pack/*/{opt,start}/$argv
      rm -rf .git/modules/nvim/$argv

      cd $owd
    case '*'
      echo Command $argv[1] not recognised >&2
      return 1
  end
end

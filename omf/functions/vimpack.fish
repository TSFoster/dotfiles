function vimpack --description 'Functions for working with vim’s native package system'
  switch $argv[1]
    case add
      set -e argv[1]

      set -l options \
        (fish_opt --short=o --long=opt) \
        (fish_opt --short=b --long=bundle --required-val)
      argparse $options -- $argv

      set -l url $argv[1]
      string match --quiet --regex '^(http|git@)' $url
      or set -l url https://github.com/$url

      set -l name (string replace --regex '\.git$' '' (basename $url))

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

      set -q _flag_opt; and set -l kind opt; or set -l kind start

      set -l dir $HOME/.config/nvim/pack/$bundle/$kind
      mkdir -p $dir

      set -l owd (pwd)
      cd $dir

      git submodule add --name "nvim/$name" -- $url ./$name

      cd $name

      [ -d doc ]; and nvim -u /dev/null -es +'helptags doc' +q

      cd $owd
    case '*'
      echo Command $argv[1] not recognised >&2
      return 1
  end
end

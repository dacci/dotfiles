#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob

update-link() {
  TARGET="$1"
  LINK="$2"

  if [[ ! -e "$LINK" || -h "$LINK" ]]; then
    ln -frsT "$TARGET" "$LINK"
  fi
}

main() {
  case `uname -s` in
    CYGWIN* | MINGW*)
      PROFILE_DIR="$HOME/AppData/Roaming"
      ;;

    Darwin)
      PROFILE_DIR="$HOME/Library/Application Support"
      ;;

    *)
      PROFILE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
      [[ -d "$PROFILE_DIR" ]] || mkdir -p "$PROFILE_DIR"
      ;;
  esac

  cd "$(dirname $0)"

  pushd home
    for target in *; do
      update-link "$target" "$HOME/.$target"
    done
  popd

  pushd config
    for target in *; do
      update-link "$target" "$PROFILE_DIR/$target"
    done
  popd

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    echo | vim +PlugUpdate +q +q
}

[[ ${#BASH_SOURCE[@]} = 1 ]] && main "$@"

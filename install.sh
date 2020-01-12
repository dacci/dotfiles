#!/bin/bash

cd "$(dirname $0)"

case `uname -s` in
  CYGWIN* | MINGW*)
    PROFILE_DIR="$HOME/AppData/Roaming"
    ;;

  Darwin)
    PROFILE_DIR="$HOME/Library/Application Support"
    ;;

  *)
    PROFILE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
    ;;
esac

pushd home
for f in *; do
  ln --symbolic --force --relative --no-target-directory "$f" "$HOME/.$f"
done
popd

[ -d "$PROFILE_DIR" ] || mkdir -p "$PROFILE_DIR"
ln --symbolic --force --relative --target-directory="$PROFILE_DIR" config/*

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
[ $? == 0 ] && echo | vim +PlugUpdate +q +q

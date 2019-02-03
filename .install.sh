#!/bin/bash

cd "$(dirname $0)"

case `uname -s` in
  CYGWIN*)
    PROFILE_DIR="$HOME/AppData/Roaming"
    ;;

  Darwin)
    PROFILE_DIR="$HOME/Library/Application Support"
    ;;

  *)
    PROFILE_DIR="$HOME/.config"
    ;;
esac

for f in *; do
  ln --symbolic --force --relative --no-target-directory "$f" "$HOME/.$f"
done

ln --symbolic --force --relative --target-directory="$PROFILE_DIR" .roaming/*

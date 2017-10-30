#!/bin/bash

cd "$(dirname $0)"

if [ "`uname -s`" = "Darwin" ]; then
  for f in *; do
    ln -sfh "$PWD/$f" "$HOME/.$f"
  done
else
  for f in *; do
    ln --symbolic --force --relative --no-target-directory "$f" "$HOME/.$f"
  done

  if [ -n "$APPDATA" ]; then
    ln --symbolic --force --relative --target-directory="$HOME/AppData/Roaming" .roaming/*
  fi
fi

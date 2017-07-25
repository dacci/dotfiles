#!/bin/bash

cd "$(dirname $0)"

for f in *; do
  ln --symbolic --force --relative --no-target-directory "$f" "$HOME/.$f"
done

if [ -n "$APPDATA" ]; then
  ln --symbolic --force --relative --target-directory="$HOME/AppData/Roaming" .roaming/*
fi

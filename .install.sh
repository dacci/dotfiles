#!/bin/bash

cd "$(dirname $0)"

for f in *; do
  ln --symbolic --force --relative --no-target-directory "$f" "$HOME/.$f"
done

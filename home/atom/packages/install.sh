#!/bin/bash

cd ~/.atom/packages

for p in */; do
  pushd $p
  apm install
  popd
done

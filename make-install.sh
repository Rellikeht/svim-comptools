#!/usr/bin/env sh
./make.sh "$@"

cd svim
doas make install
./make-clean.sh

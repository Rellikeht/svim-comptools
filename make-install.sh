#!/usr/bin/env sh
./make.sh "$@"

cd svim || exit
doas make install
../make-clean.sh

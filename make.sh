#!/usr/bin/env sh

THR=4
if [ $1 -gt 1 ] 2>/dev/null
then
    THR="$1"
fi

./conf.sh && cd svim && make -j"$THR"
#doas make install

#!/usr/bin/env sh

THR=4
if [ "$1" -gt 1 ] 2>/dev/null; then
    THR="$1"
fi

if [ "${PWD##*/}" != "svim" ]; then
    cd svim || exit
fi

cp ../feature.h src/
# ../conf.sh /usr/local/bin --includedir=/usr/include && make -j"$THR"
../conf.sh /usr/local/bin && make -j"$THR"

#!/usr/bin/env sh

if [ "${PWD##*/}" != "svim" ]; then
    cd svim || exit
fi

cp ../feature.h src/
# ../conf.sh /usr/local --includedir=/usr/include && make -j"$THR"
../conf.sh /usr/local && make "$@"

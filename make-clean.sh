#!/usr/bin/env sh

cd svim
make clean
git restore src/feature.h
rm src/TAGS src/svim

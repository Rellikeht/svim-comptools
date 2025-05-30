#!/bin/sh

make clean
make distclean
#    LIBS="-lXmu -lXmuu" \
#    CPPFLAGS="-I/usr/local/include -I/usr/local/include/Xm \
#    -I/usr/local/include/X11 -I/usr/local/include/uil \
#    -I/usr/local/include/Mrm" \
#    LDFLAGS="-L/usr/local/lib -L/usr/lib" \

if [ -z "$CC" ]; then
    if [ "$(uname)" = "FreeBSD" ]; then
        export CC=/usr/bin/clang
    else
        export CC=gcc
    fi
fi

if [ -n "$1" ]; then
    PREFIX="$1"
    shift
elif [ -z "$PREFIX" ]; then
    PREFIX=/usr/local
fi

export CFLAGS="-O2 -march=native -mtune=native"
# export CFLAGS="-O2"

./configure \
    --enable-fail-if-missing \
    --disable-darwin \
    --disable-smack \
    --disable-selinux \
    --disable-xsmp \
    --disable-xsmp-interact \
    --disable-cscope \
    --disable-netbeans \
    --disable-terminal \
    --disable-autoservername \
    --disable-rightleft \
    --disable-arabic \
    --disable-farsi \
    --enable-xim \
    --enable-fontset \
    --disable-gtktest \
    --disable-icon-cache-update \
    --disable-desktop-database-update \
    --disable-canberra \
    --disable-libsodium \
    --disable-acl \
    --disable-sysmouse \
    --disable-nls \
    --with-features=normal \
    --with-tlib=ncurses \
    --with-vim-name=svim \
    --with-ex-name=exs \
    --with-view-name=sview \
    --disable-gtktest \
    --disable-gtk2-check \
    --disable-gtk3-check \
    --disable-gnome-check \
    --without-gnome \
    --without-gtk2 \
    --without-gtk3 \
    --with-modified-by=Rellikeht \
    --with-compiledby=Rellikeht \
    --prefix="$PREFIX" \
    $@

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

PREFIX=/usr/local
[ -n "$1" ] && PREFIX="$1"

export CFLAGS="-O2 -march=native -mtune=native"
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
    --disable-gpm \
    --disable-sysmouse \
    --disable-nls \
    --with-features=normal \
    --with-tlib=ncurses \
    --with-vim-name=svim \
    --with-ex-name=exs \
    --with-view-name=sview \
    --disable-gtk_check \
    --disable-gtk2_check \
    --disable-gnome_check \
    --disable-athena_check \
    --disable-nextaf_check \
    --disable-carbon_check \
    --disable-gtktest \
    --enable-motif-check \
    --enable-gui=motif \
    --with-modified-by=michal \
    --with-compiledby=michal \
    --prefix="$PREFIX"

#   --enable-gui=athena	    	\
#    --enable-gui=photon		    \
#    --with-motif-lib=/usr/lib/libXm.so	\
#    --with-motif-lib=/usr/local/lib/libXm.so	\
#   --enable-luainterp=dynamic		\

#`configure' configures this package to adapt to many kinds of systems.
#
#Usage: auto/configure [OPTION]... [VAR=VALUE]...
#
#To assign environment variables (e.g., CC, CFLAGS...), specify them as
#VAR=VALUE.  See below for descriptions of some of the useful variables.
#
#Defaults for the options are specified in brackets.

#Configuration:
#  -h, --help              display this help and exit
#      --help=short        display options specific to this package
#      --help=recursive    display the short help of all the included packages
#  -V, --version           display version information and exit
#  -q, --quiet, --silent   do not print `checking ...' messages
#      --cache-file=FILE   cache test results in FILE [disabled]
#  -C, --config-cache      alias for `--cache-file=config.cache'
#  -n, --no-create         do not create output files
#      --srcdir=DIR        find the sources in DIR [configure dir or `..']
#
#Installation directories:
#  --prefix=PREFIX         install architecture-independent files in PREFIX
#                          [/usr/local]
#  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
#                          [PREFIX]
#
#By default, `make install' will install all the files in
#`/usr/local/bin', `/usr/local/lib' etc.  You can specify
#an installation prefix other than `/usr/local' using `--prefix',
#for instance `--prefix=$HOME'.

#For better control, use the options below.
#
#Fine tuning of the installation directories:
#  --bindir=DIR            user executables [EPREFIX/bin]
#  --sbindir=DIR           system admin executables [EPREFIX/sbin]
#  --libexecdir=DIR        program executables [EPREFIX/libexec]
#  --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#  --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#  --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#  --libdir=DIR            object code libraries [EPREFIX/lib]
#  --includedir=DIR        C header files [PREFIX/include]
#  --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#  --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
#  --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#  --infodir=DIR           info documentation [DATAROOTDIR/info]
#  --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
#  --mandir=DIR            man documentation [DATAROOTDIR/man]
#  --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]
#  --htmldir=DIR           html documentation [DOCDIR]
#  --dvidir=DIR            dvi documentation [DOCDIR]
#  --pdfdir=DIR            pdf documentation [DOCDIR]
#  --psdir=DIR             ps documentation [DOCDIR]

#X features:
#  --x-includes=DIR    X include files are in DIR
#  --x-libraries=DIR   X library files are in DIR

#Optional Features:
#  --disable-option-checking  ignore unrecognized --enable/--with options
#  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#  --enable-fail-if-missing    Fail if dependencies on additional features
#     specified on the command line are missing.
#  --disable-darwin        Disable Darwin (Mac OS X) support.
#  --disable-smack	  Do not check for Smack support.
#  --disable-selinux	  Do not check for SELinux support.
#  --disable-xsmp          Disable XSMP session management
#  --disable-xsmp-interact Disable XSMP interaction
#  --enable-luainterp=OPTS      Include Lua interpreter.  default=no OPTS=no/yes/dynamic
#  --enable-mzschemeinterp      Include MzScheme interpreter.
#  --enable-perlinterp=OPTS     Include Perl interpreter.  default=no OPTS=no/yes/dynamic
#  --enable-pythoninterp=OPTS   Include Python interpreter. default=no OPTS=no/yes/dynamic
#  --enable-python3interp=OPTS  Include Python3 interpreter. default=no OPTS=no/yes/dynamic
#  --enable-tclinterp=OPTS      Include Tcl interpreter. default=no OPTS=no/yes/dynamic
#  --enable-rubyinterp=OPTS     Include Ruby interpreter.  default=no OPTS=no/yes/dynamic
#  --enable-cscope         Include cscope interface.
#  --disable-netbeans      Disable NetBeans integration support.
#  --disable-channel       Disable process communication support.
#  --enable-terminal       Enable terminal emulation support.
#  --enable-autoservername Automatically define servername at vim startup.
#  --enable-multibyte      Include multibyte editing support.
#  --disable-rightleft     Do not include Right-to-Left language support.
#  --disable-arabic        Do not include Arabic language support.
#  --disable-farsi         Deprecated.
#  --enable-xim            Include XIM input support.
#  --enable-fontset        Include X fontset output support.
#  --enable-gui=OPTS       X11 GUI. default=auto OPTS=auto/no/gtk2/gnome2/gtk3/motif/haiku/photon/carbon
#  --enable-gtk2-check     If auto-select GUI, check for GTK+ 2 default=yes
#  --enable-gnome-check    If GTK GUI, check for GNOME default=no
#  --enable-gtk3-check     If auto-select GUI, check for GTK+ 3 default=yes
#  --enable-motif-check    If auto-select GUI, check for Motif default=yes
#  --disable-gtktest       Do not try to compile and run a test GTK program
#  --disable-icon-cache-update        update disabled
#  --disable-desktop-database-update  update disabled
#  --disable-largefile     omit support for large files
#  --disable-canberra      Do not use libcanberra.
#  --disable-libsodium      Do not use libsodium.
#  --disable-acl           No check for ACL support.
#  --enable-gpm=OPTS       Use gpm (Linux mouse daemon). default=yes OPTS=yes/no/dynamic
#  --disable-sysmouse      Don't use sysmouse (mouse in *BSD console).
#  --disable-nls           Don't support NLS (gettext()).

#Optional Packages:
#  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#  --with-mac-arch=ARCH    current, intel, ppc or both
#  --with-developer-dir=PATH    use PATH as location for Xcode developer tools
#  --with-local-dir=PATH   search PATH instead of /usr/local for local libraries.
#  --without-local-dir     do not search /usr/local for local libraries.
#  --with-vim-name=NAME    what to call the Vim executable
#  --with-ex-name=NAME     what to call the Ex executable
#  --with-view-name=NAME   what to call the View executable
#  --with-global-runtime=DIR    global runtime directory in 'runtimepath', comma-separated for multiple directories
#  --with-modified-by=NAME       name of who modified a release version
#  --with-features=TYPE    tiny, normal or huge (default: huge)
#  --with-compiledby=NAME  name to show in :version message
#  --with-lua-prefix=PFX   Prefix where Lua is installed.
#  --with-luajit           Link with LuaJIT instead of Lua.
#  --with-plthome=PLTHOME   Use PLTHOME.
#  --with-python-command=NAME  name of the Python 2 command (default: python2 or python)
#  --with-python-config-dir=PATH  Python's config directory (deprecated)
#  --with-python3-command=NAME  name of the Python 3 command (default: python3 or python)
#  --with-python3-config-dir=PATH  Python's config directory (deprecated)
#  --with-tclsh=PATH       which tclsh to use (default: tclsh8.0)
#  --with-ruby-command=RUBY  name of the Ruby command (default: ruby)
#  --with-x                use the X Window System
#  --with-gnome-includes=DIR Specify location of GNOME headers
#  --with-gnome-libs=DIR   Specify location of GNOME libs
#  --with-gnome            Specify prefix for GNOME files
#  --with-motif-lib=STRING Library for Motif
#  --with-tlib=library     terminal library to be used

#Some influential environment variables:
#  CC          C compiler command
#  CFLAGS      C compiler flags
#  LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
#              nonstandard directory <lib dir>
#  LIBS        libraries to pass to the linker, e.g. -l<library>
#  CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
#              you have headers in a nonstandard directory <include dir>
#  CPP         C preprocessor
#  XMKMF       Path to xmkmf, Makefile generator for X Window System

#Use these variables to override the choices made by `configure' or to help
#it to find libraries and programs with nonstandard names/locations.
#
#Report bugs to the package provider.

#!/bin/sh
set -x

SOURCES_ROOT="$HOME/src"
GIT_REPO="https://github.com/emacs-mirror/emacs"
PREFIX="$HOME/.local"

AUTOCONF_VERSION=2.65
CC=egcc
MAKEINFO="/usr/local/bin/gmakeinfo"

export AUTOCONF_VERSION MAKEINFO CC

if [ ! -d "$SOURCES_ROOT" ]; then
	mkdir -p "$SOURCES_ROOT"
fi

cd "$SOURCES_ROOT"

if [ ! -d emacs ]; then
	git clone --quiet --jobs=5 --depth=1 "$GIT_REPO"
fi

cd emacs

git pull --quiet --depth=1 --jobs=5

# gmake clean

# ./autogen.sh

./configure \
	--prefix="${PREFIX:?no prefix}" \
	--with-x-toolkit=lucid \
	--with-sqlite3 \
	--with-imagemagick \
	--without-harfbuzz \
	--without-cairo \
	--without-libotf \
	--without-toolkit-scroll-bars \
	--enable-link-time-optimization

gmake bootstrap
gmake
gmake install

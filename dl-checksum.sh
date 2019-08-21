#!/usr/bin/env sh
VER=v0.3.0
DIR=~/Downloads
MIRROR=https://github.com/buildpack/pack/releases/download/${VER}

dl()
{
    OS=$1
    ARCHIVETYPE=$2
    FILE=pack-${VER}-${OS}.${ARCHIVETYPE}
    URL=$MIRROR/$FILE
    LFILE=$DIR/$FILE
    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $OS $(sha256sum $LFILE | awk '{print $1}')
}

printf "  %s:\n" $VER
dl linux tgz
dl windows zip
dl macos tgz



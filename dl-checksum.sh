#!/usr/bin/env sh
VER=${1:-v0.4.1}
DIR=~/Downloads
MIRROR=https://github.com/buildpack/pack/releases/download/${VER}

dl()
{
    local os=$1
    local archive_type=$2
    local file=pack-${VER}-${os}.${archive_type}
    local url=$MIRROR/$file
    local lfile=$DIR/$file
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $os $(sha256sum $lfile | awk '{print $1}')
}

printf "  %s:\n" $VER
dl linux tgz
dl windows zip
dl macos tgz



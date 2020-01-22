#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/buildpack/pack/releases/download

dl()
{
    local ver=$1
    local os=$2
    local archive_type=$3
    local file=pack-${ver}-${os}.${archive_type}
    local url=$MIRROR/$ver/$file
    local lfile=$DIR/$file
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $os $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver linux tgz
    dl $ver windows zip
    dl $ver macos tgz
}


dl_ver ${1:-v0.7.0}

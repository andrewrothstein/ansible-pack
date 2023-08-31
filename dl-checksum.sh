#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/buildpack/pack/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local archive_type=$4
    local suffix="-${arch}"
    if [ "${arch}" = "amd64" ];
    then
        suffix=""
    fi
    platform="${os}${suffix}"

    local url=$MIRROR/$ver/pack-${ver}-${os}${suffix}.${archive_type}.sha256

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(curl -sSLf $url | awk '{ print $1 }')
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver linux amd64 tgz
    dl $ver linux arm64 tgz
    dl $ver windows amd64 zip
    dl $ver macos amd64 tgz
    dl $ver macos arm64 tgz
}

dl_ver ${1:-v0.30.0}

#!/usr/bin/env sh
VER=v19.1.4
DIR=~/Downloads
MIRROR=https://binaries.cockroachdb.com

dl()
{
    OS=$1
    ARCH=$2
    ARCHIVETYPE=$3
    PLATFORM=${OS}-${ARCH}
    FILE=cockroach-${VER}.${PLATFORM}.${ARCHIVETYPE}
    URL=$MIRROR/$FILE
    LFILE=$DIR/$FILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "  %s:\n" $VER
dl darwin-10.9 amd64 tgz
dl linux amd64 tgz
dl windows-6.2 amd64 zip



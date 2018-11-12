#!/usr/bin/with-contenv /bin/sh
set -e

if [! -d /movies ]; then
  mkdir /movies
fi

if [! -d /downloads ]; then
  mkdir /downloads
fi

# permissions
chown -R abc:abc /movies /downloads

echo "Mounting /movies nfs share"
mount -t nfs -o nolock 10.0.0.100:/mnt/R5_3x5TB_01/export/emby/Movies /movies

echo "Mounting /downloads nfs share"
mount -t nfs -o nolock 10.0.0.100:/mnt/R5_3x5TB_01/export/p2p/torrent/done /downloads


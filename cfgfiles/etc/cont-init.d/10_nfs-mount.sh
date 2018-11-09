#!/usr/bin/with-contenv /bin/sh
set -e
rpcbind -f &
mount -t nfs -o nolock 10.0.0.100:/mnt/R5_3x5TB_01/export/emby/Movies /movies
mount -t nfs -o nolock 10.0.0.100:/mnt/R5_3x5TB_01/export/p2p/torrent/done /downloads


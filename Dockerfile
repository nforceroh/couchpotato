FROM linuxserver/couchpotato:latest
MAINTAINER sylvain@nforcer.com

ENV PYTHONIOENCODING="UTF-8"

RUN apk add --no-cache nfs-utils rpcbind tzdata

COPY cfgfiles /

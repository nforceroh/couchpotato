FROM lsiobase/alpine.python:3.8
MAINTAINER sylvain@nforcer.com

ARG BUILD_DATE
ARG VERSION

ENV PYTHONIOENCODING="UTF-8"

RUN \
 echo "Install nfs needs" && \
 apk add --no-cache nfs-utils rpcbind tzdata && \
 echo "**** install app ****" && \
 git clone --depth 1 https://github.com/CouchPotato/CouchPotatoServer /app/couchpotato

 

COPY rootfs /

# ports and volumes
EXPOSE 5050
WORKDIR /app/couchpotato
VOLUME /config


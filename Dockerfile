FROM nforceroh/d_alpine-s6:v3.10

LABEL maintainer="sylvain@nforcer.com"

ENV \ 
    PYTHONIOENCODING=UTF-8 \
    LC_ALL=en_US.UTF-8  \
    LANG=en_US.UTF-8  \
    LANGUAGE=en_US.UTF-8  \
    PUID=3000 \
	PGID=1000 \
	ENABLE_NFS=false 

RUN \
    apk add --no-cache python py2-lxml py2-openssl \
    && python -m ensurepip \
    && pip install --upgrade pip setuptools \
    && echo "**** install app ****" \
    && git clone --depth 1 https://github.com/CouchPotato/CouchPotatoServer /app \
    && rm -rf /var/cache/apk/*

COPY rootfs /
# ports and volumes
EXPOSE 5050
WORKDIR /app
VOLUME /config
ENTRYPOINT [ "/init" ]
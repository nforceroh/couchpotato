FROM nforceroh/d_alpine-s6:edge

LABEL maintainer="sylvain@nforcer.com"

ENV PYTHONIOENCODING=UTF-8
ENV LC_ALL=en_US.UTF-8  
ENV LANG=en_US.UTF-8  
ENV LANGUAGE=en_US.UTF-8  

RUN \
    apk add --no-cache py-lxml py-openssl \
    && echo "**** install app ****" \
    && git clone --depth 1 https://github.com/CouchPotato/CouchPotatoServer /app

COPY rootfs /
# ports and volumes
EXPOSE 5050
WORKDIR /app
VOLUME /config
ENTRYPOINT [ "/init" ]
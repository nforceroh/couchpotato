FROM nforceroh/d_alpine-s6:v3.10

LABEL maintainer="sylvain@nforcer.com"

ENV PYTHONIOENCODING=UTF-8
ENV LC_ALL=en_US.UTF-8  
ENV LANG=en_US.UTF-8  
ENV LANGUAGE=en_US.UTF-8  

RUN \
    apk add py-lxml py-openssl \
    && echo "**** install app ****" \
    && git clone --depth 1 https://github.com/CouchPotato/CouchPotatoServer /app

COPY rootfs /

# ports and volumes
EXPOSE 5050
WORKDIR /app
VOLUME /config
ENTRYPOINT [ "/init" ]
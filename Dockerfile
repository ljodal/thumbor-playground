FROM python:2.7-alpine

RUN set -ex \
    && apk add --no-cache \
        libjpeg-turbo-dev \
        zlib-dev \
        libwebp-dev \
        libcurl \
        libcrypto1.0 \
    && apk add --no-cache --virtual .build-deps \
        curl-dev \
        openssl-dev \
        gcc \
        g++ \
    && pip install thumbor \
    && apk del .build-deps

ADD ./thumbor.conf /etc/thumbor.conf

CMD thumbor --conf /etc/thumbor.conf

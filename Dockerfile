FROM postgres:11-alpine

RUN apk update \
    && apk add rsync openssh

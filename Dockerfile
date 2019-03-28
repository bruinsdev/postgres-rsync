FROM postgres:11-alpine

EXPOSE 22

COPY Makefile /Makefile

VOLUME /root/sshd

RUN apk update \
    && apk add rsync openssh make

ENTRYPOINT make
CMD "default"

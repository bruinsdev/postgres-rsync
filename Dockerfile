FROM postgres:11-alpine

EXPOSE 22

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

VOLUME /root/sshd

RUN apk update \
    && apk add rsync openssh \
    && ln -s /usr/local/bin/entrypoint.sh / \
    && chmod 777 /usr/local/bin/entrypoint.sh

ENTRYPOINT /usr/local/bin/entrypoint.sh
CMD "postgres"

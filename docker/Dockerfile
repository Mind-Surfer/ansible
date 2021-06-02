FROM alpine

COPY run/ run/

RUN apk -U upgrade && \
    apk add ansible openssh && \
    chmod +x /run/entrypoint.sh

ENV INVENTORY="/data/hosts" SSH_KEY="id_rsa" PLAYBOOK="/data/playbook.yml"

VOLUME [ "/data" ]

ENTRYPOINT exec /run/entrypoint.sh > /data/playbook-out.log
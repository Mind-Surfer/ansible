FROM alpine

COPY run/ run/

RUN apk -U upgrade && \
    apk add ansible && \
    chmod +x /run/entrypoint.sh

ENV HOSTS="hosts" SSH_KEY="id_rsa" PLAYBOOK="playbook.yml"

VOLUME [ "/data" ]

ENTRYPOINT exec /run/entrypoint.sh
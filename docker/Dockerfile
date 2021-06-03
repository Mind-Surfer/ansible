FROM alpine

COPY run/ run/

RUN apk -U upgrade && \
    apk add ansible openssh && \
    chmod +x /run/entrypoint.sh && \
    mkdir -p /etc/ansible/ && \
    cp run/ansible.cfg /etc/ansible/ansible.cfg

ENV INVENTORY="/data/hosts" SSH_KEY="/data/ssh" PLAYBOOK="/data/playbook.yml"

VOLUME [ "/data" ]

ENTRYPOINT [ "/run/entrypoint.sh" ]
CMD [ "/bin/sh", "-c", "ansible-playbook $PLAYBOOK -i $INVENTORY" ]
FROM alpine:latest

LABEL \
    org.opencontainers.image.title="phantun" \
    org.opencontainers.image.authors="yaofei <feiyao@me.com>" \
    org.opencontainers.image.source="https://github.com/yaofei509/docker-phantun"

ENV LOCAL_PORT=
ENV REMOTE_HOST=
ENV REMOTE_PORT=
ENV TUN_LOCAL=
ENV TUN_PEER=

RUN apk add --no-cache iptables
COPY phantun_client_x86_64 /usr/local/bin/phantun_client
RUN chmod +x /usr/local/bin/phantun_client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

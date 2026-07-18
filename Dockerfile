FROM alpine:latest AS base

ARG TARGETARCH

LABEL \
    org.opencontainers.image.title="phantun-client" \
    org.opencontainers.image.authors="yaofei <feiyao@me.com>" \
    org.opencontainers.image.source="https://github.com/yaofei509/docker-phantun"

ENV LOCAL_PORT=
ENV REMOTE_HOST=
ENV REMOTE_PORT=
ENV TUN_LOCAL=
ENV TUN_PEER=

# -- various arch
FROM base AS branch-arm
COPY phantun_client_armv7 /usr/local/bin/phantun_client

FROM base AS branch-arm64
COPY phantun_client_aarch64 /usr/local/bin/phantun_client

FROM base AS branch-amd64
COPY phantun_client_x86_64 /usr/local/bin/phantun_client

# -- Build
FROM branch-${TARGETARCH} AS final
RUN chmod +x /usr/local/bin/phantun_client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

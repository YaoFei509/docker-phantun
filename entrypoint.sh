#!/bin/sh

set -e

iptables -t filter -I INPUT -p tcp --sport "${REMOTE_PORT:-443}" -j DROP

exec phantun_client \
	--local "0.0.0.0:${LOCAL_PORT:-51820}" \
	--remote "${REMOTE_HOST}:${REMOTE_PORT:-443}"

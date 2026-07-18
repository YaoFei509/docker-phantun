#!/bin/sh

set -e

[[ ${TUN_LOCAL} ]] && TUN="--tun-local $TUN_LOCAL --tun-peer $TUN_PEER "

exec phantun_client \
	--local "0.0.0.0:${LOCAL_PORT:-51820}" \
	--remote "${REMOTE_HOST}:${REMOTE_PORT:-443} $TUN"

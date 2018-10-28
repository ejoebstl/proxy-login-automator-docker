#! /bin/bash
set -euo pipefail

# Check environment
if [ -z "${REMOTE_HOST:-}" ]; then
  echo "REMOTE_HOST was not set"
fi

if [ -z "${REMOTE_USER:-}" ]; then
  echo "REMOTE_USER was not set"
fi

if [ -z "${REMOTE_PASSWORD:-}" ]; then
  echo "REMOTE_PASSWORD was not set"
fi

LOCAL_PORT=8080
for HOST_AND_PORT in $(echo $REMOTE_HOST| sed "s/,/ /g")
do
  HOST=$(echo $HOST_AND_PORT | cut -f1 -d:)
  PORT=$(echo $HOST_AND_PORT | cut -f2 -d:)
  
  proxy-login-automator \
    -local_port $LOCAL_PORT \
    -local_host 0.0.0.0 \
    -remote_host $HOST \
    -remote_port $PORT \
    -usr $REMOTE_USER -pwd $REMOTE_PASSWORD \
    -is_remote_https $REMOTE_HTTPS \
    -ignore_https_cert $IGNORE_CERT &

  LOCAL_PORT=$((LOCAL_PORT + 1))
done

wait

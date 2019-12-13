#! /bin/bash
set -euo pipefail

env

# Check environment
if [ -n "${GET_REMOTE_HOST}" ]; then
  echo "GET_REMOTE_HOST script was supplied evaluating, and overriding REMOTE_HOST variable" 
  REMOTE_HOST=$(eval ${GET_REMOTE_HOST})
fi

if [ -z "${REMOTE_HOST}" ]; then
  echo "REMOTE_HOST was not set"
fi

if [ -z "${REMOTE_USER}" ]; then
  echo "REMOTE_USER was not set"
fi

if [ -z "${REMOTE_PASSWORD}" ]; then
  echo "REMOTE_PASSWORD was not set"
fi

LOCAL_PORT=8080
for HOST_AND_PORT in $(echo $REMOTE_HOST| sed "s/,/ /g")
do
  if [ -z "${HOST_AND_PORT}" ]; then
    continue
  fi

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

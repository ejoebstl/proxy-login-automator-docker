#! /bin/bash
set -euo pipefail

# Check environment
if [ -z "${REMOTE_HAST:-}" ]; then
  echo "REMOTE_HOST was not set"
fi

if [ -z "${REMOTE_PORT:-}" ]; then
  echo "REMOTE_PORT was not set"
fi

if [ -z "${REMOTE_USER:-}" ]; then
  echo "REMOTE_USER was not set"
fi

if [ -z "${REMOTE_PASSWORD:-}" ]; then
  echo "REMOTE_PASSWORD was not set"
fi

ENV REMOTE_HOST=
ENV REMOTE_PORT=
ENV REMOTE_USER=
ENV REMOTE_PASSWORD=
ENV REMOTE_HTTPS=true
ENV INGORE_CERT=false

proxy-login-automator \
    -local_port 8080 \
    -local_host 0.0.0.0 \
    -remote_host $REMOTE_HOST \
    -remote_port $REMOTE_PORT  \
    -usr $REMOTE_USER -pwd $REMOTE_PASSWORD \
    -is_remote_https $REMOTE_HTTPS \
    -ignore_https_cert $IGNORE_CERT

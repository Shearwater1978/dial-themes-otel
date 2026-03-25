#!/bin/sh
# vim:sw=4:ts=4:et

set -e

echo "Check 40-envsubst-on-otel (start)" > /tmp/40-envsubst-on-otel.log

if [ -n "${DEMO_ENV_VAR:-}" ]; then
    echo "DEMO_ENV_VAR is set: '$DEMO_ENV_VAR'" >> /tmp/40-envsubst-on-otel.log
else
    echo "DEMO_ENV_VAR is NOT set" >> /tmp/40-envsubst-on-otel.log
fi

echo "NGINX_ENVSUBST_OUTPUT_DIR: ${NGINX_ENVSUBST_OUTPUT_DIR:-'not set'}" >> /tmp/40-envsubst-on-otel.log
echo "Check 40-envsubst-on-otel (end)" >> /tmp/40-envsubst-on-otel.log

#!/bin/sh

set -e

ME="$(basename "$0")"

entrypoint_log() {
    if [ -z "${NGINX_ENTRYPOINT_QUIET_LOGS:-}" ]; then
        echo "$@"
    fi
}

rewrite_otel_conf_if_disabled() {
    case "${ENABLE_OTEL_ON:-}" in
        [oO][nN])
            entrypoint_log "$ME: ENABLE_OTEL_ON='${ENABLE_OTEL_ON}'"
            ;;
        *)
            entrypoint_log "$ME: ENABLE_OTEL_ON='${ENABLE_OTEL_ON:-<empty>}'"
            cat > /tmp/otel.conf << 'EOF'
otel_trace off;

otel_exporter {
  endpoint localhost:4317;
}
EOF
            ;;
    esac
}

rewrite_otel_conf_if_disabled

exit 0

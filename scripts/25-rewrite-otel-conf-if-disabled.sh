#!/bin/sh

set -e

ME="$(basename "$0")"

entrypoint_log() {
    if [ -z "${NGINX_ENTRYPOINT_QUIET_LOGS:-}" ]; then
        echo "$@"
    fi
}

rewrite_otel_conf_if_disabled() {
    case "${OTEL_ENABLED:-}" in
        [oO][nN])
            entrypoint_log "$ME: OTEL_ENABLED='${OTEL_ENABLED}'. Keep existing file"
            ;;
        *)
            entrypoint_log "$ME: OTEL_ENABLED='${OTEL_ENABLED:-<empty>}'. Rewriting existing file"
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

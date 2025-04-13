#!/usr/bin/env bash
#   Use this script to test if a given TCP host/port are available

# Original: https://github.com/vishnubob/wait-for-it

WAITFORIT_host="$1"
WAITFORIT_port="${2:-3306}"
WAITFORIT_timeout="${3:-30}"

shift 3 || true

echo "🕒 Waiting for $WAITFORIT_host:$WAITFORIT_port to be available..."

for ((i=0; i<WAITFORIT_timeout; i++)); do
    if nc -z "$WAITFORIT_host" "$WAITFORIT_port" >/dev/null 2>&1; then
        echo "✅ $WAITFORIT_host:$WAITFORIT_port is available!"
        exec "$@"
        exit $?
    fi
    sleep 1
done

echo "❌ Timeout after ${WAITFORIT_timeout}s waiting for $WAITFORIT_host:$WAITFORIT_port"
exit 1

#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /gp-api/tmp/pids/server.pid
if [ "${*}" == "./bin/rails server"]; then
    ./bin/rails db:prepare
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

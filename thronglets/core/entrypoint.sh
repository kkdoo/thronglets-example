#!/bin/bash
set -ex

echo "bundle install..."
bundle check || bundle install --jobs 4

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

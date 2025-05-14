#!/bin/bash
set -ex

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid

echo "bundle install..."
bundle check || bundle install --jobs 4
bin/rails db:prepare
#yarn install

bundle exec rake db:migrate db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

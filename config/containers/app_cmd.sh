#!/usr/bin/env bash

# Prefix `bundle` with `exec` so unicorn shuts down gracefully on SIGTERM (i.e. `docker stop`)
exec bundle exec unicorn -E development -c config/containers/unicorn.rb
# exec bundle exec rails s
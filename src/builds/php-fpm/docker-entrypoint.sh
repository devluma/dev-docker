#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    docker-php-entrypoint php-fpm
fi

exec "$@"
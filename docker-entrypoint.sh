#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpca "$@"
elif [ "$1" = "/composer/vendor/bin/phpca" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpca" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
fi

exec "$@"

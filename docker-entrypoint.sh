#!/bin/bash

if [ "$1" = 'statsite' ]; then
  if [ "$SINK" ]; then
    sed -ri "s/^(stream_cmd = )\S+/\1$SINK/" /etc/statsite/statsite.conf
  fi
  exec statsite -f /etc/statsite/statsite.conf
fi

exec "$@"

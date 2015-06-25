#!/bin/bash

if [ "$1" = 'statsite' ]; then
  exec statsite -f /etc/statsite/statsite.conf
fi

exec "$@"


#!/bin/sh
# Start hbbr in background, then run hbbs in foreground
hbbr &
exec hbbs -r localhost:21117

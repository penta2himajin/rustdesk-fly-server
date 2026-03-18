#!/bin/sh
cd /root
hbbr &
exec hbbs -r rustdesk-fly-server.fly.dev:21117

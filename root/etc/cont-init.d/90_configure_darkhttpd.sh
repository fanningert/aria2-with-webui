#!/usr/bin/with-contenv bash

dockerize -template /app/start_darkhttpd.sh:/config/start_darkhttpd.sh

chown -R app:users /aria2-webui
chown -R app:users /config/start_darkhttpd.sh


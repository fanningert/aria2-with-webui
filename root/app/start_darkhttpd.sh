#!/bin/sh
/usr/bin/darkhttpd /aria2-webui --port 80 &&
/usr/bin/aria2c --conf-path=/config/aria2.conf

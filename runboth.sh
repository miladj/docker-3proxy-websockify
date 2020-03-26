#!/usr/bin/env sh
./3proxy/socks -d
python -m websockify 2080 127.0.0.1:1080
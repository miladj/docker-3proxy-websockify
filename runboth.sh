#!/usr/bin/env sh
echo "run"
./3proxy/socks -d
if [ -z "$PORT" ]
then
PORT=2080
fi
echo "listen on $PORT"
python3 -m websockify $PORT  127.0.0.1:1080
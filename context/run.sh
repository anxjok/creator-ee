#!/bin/bash
set -e 
sudo socat -lf /var/log/docker.sock.log -t 1200 -R /tmp/dada.dump -d -d UNIX-LISTEN:/runner/docker.sock,fork,mode=660,user=1000 UNIX-CONNECT:/tmp/run/docker.sock 2>&1 &
while  [ ! -S "/runner/docker.sock" ]
do
     sleep 5
done
exec "$@"

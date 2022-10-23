#!/usr/bin/env bash
for dir in /etc/letsencrypt/live/*; do
    if [ -d "$dir" ]; then
      echo "letsencrypt_to_haproxy - processing $dir"
      cd "$dir" && cat privkey.pem fullchain.pem > /etc/haproxy/certs/$(basename $dir).pem
    fi
done
#!/bin/sh

for domain in .club \
              .party \
              .shop \
              .tv \
              .life \
              .me \
              .science \
              .global \
              .store \
              .fashion \
              .live \
              .info; do
  2>&1 nslookup $1$domain 8.8.8.8 | grep "NXDOMAIN"
  if ! [ $? ]; then
    echo "$1$domain doesnt exist";
  fi
done

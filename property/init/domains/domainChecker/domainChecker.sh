#!/bin/bash

usage() {
  echo "usage:"
  echo "  $ domainChecker [basename]+"
}

if [ $# -eq 0 ]; then
  usage
  exit 1
fi

DOMAINS=( '.com' \
          '.co.uk' \
          '.net' \
          '.org' \
          '.club' \
          '.party' \
          '.shop' \
          '.tv' \
          '.life' \
          '.me' \
          '.science' \
          '.global' \
          '.store' \
          '.fashion' \
          '.live' \
          '.info' )

ELEMENTS=${#DOMAINS[@]}

while (( "$#" )); do

  for (( i=0;i<$ELEMENTS;i++ )); do
    whois $1${DOMAINS[${i}]} | egrep -q \
      '^No match|^NOT FOUND|^Not fo|AVAILABLE|^No Data Dou|has not been regi|No entri'

    if [ $? -eq 0 ]; then
      echo "$1${DOMAINS[${i}]} : available"
    fi

  done

shift

done

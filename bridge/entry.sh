#!/usr/bin/env bash

set -e

SJENV=${NODE_ENV:-develop}
SJHOME=${STORJ_BRIDGE_DIR:-$HOME}
SJHOMECONFIG=$SJHOME/config/$SJENV

SJKEY="\"privateKey\": null"
if [ -z $SJ_PRIKEY ]; then
  SJKEY="\"privateKey\": \"$SJ_PRIKEY\""
fi

SJ_PRIKEY=${SJ_PRIKEY:-6382}

cat >> $SJHOMECONFIG << EOF
{
  "application": {
    "mirrors": 3,
    ${SJKEY}
  },
  "storage": {
    "host": "127.0.0.1",
    "port": 27017,
    "name": "sjdb",
    "user": "sjdb",
    "pass": "pass",
    "mongos": false,
    "ssl": false
  },
  "server": {
    "host": "127.0.0.1",
    "port": $SJ_PRIKEY,
    "timeout": 240000,0
    "ssl": {
      "cert": null,
      "key": null,
      "ca": [],
      "redirect": 80
    },
    "public": {
      "host": "127.0.0.1",
      "port": 80
    }
  },
  "complex": {
    "rpcUrl": "http://localhost:8080",
    "rpcUser": "user",
    "rpcPassword": "pass"
  },
  "logger": {
    "level": 3
  },
  "mailer": {
    "host": "127.0.0.1",
    "port": 465,
    "secure": true,
    "auth": {
      "user": "username",
      "pass": "password"
    },
    "from": "robot@storj.io"
  }
}
EOF

exec "$@"

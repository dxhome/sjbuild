#!/usr/bin/env bash

set -e

SJ_DATADIR=${SJ_DATADIR:-/root/.storjshare}
SJHOMECONFIG=$SJ_DATADIR/config.json
SJHOMEKEY=$SJ_DATADIR/id_ecdsa

mkdir -p $SJ_DATADIR

SJ_PUBIP=${SJ_PUBIP:-127.0.0.1}
SJ_PORT=${SJ_PORT:-4000}
SJ_SEED=${SJ_SEED:-storj://54.223.163.9:4001/f03310e932cc692320dd5ba957e8156966f1aa94}

if [ -z $SJ_NAT ]; then
  SJ_NAT=false
else
  SJ_NAT=true
fi

if ! [ -f $SJHOMEKEY ]; then
  node bin/storjshare.js gen-key -k $SJHOMEKEY -p pass
fi

: > $SJHOMECONFIG
cat >> $SJHOMECONFIG << EOF
{
  "keypath": "$SJHOMEKEY",
  "address": "129tV17x1BTGPV5f19dHxRx9uHJoZdAu5U",
  "storage": {
    "path": "$SJ_DATADIR",
    "size": 2,
    "unit": "GB"
  },
  "network": {
    "address": "$SJ_PUBIP",
    "port": $SJ_PORT,
    "seeds": ["$SJ_SEED"],
    "opcodes": [
      "0f01020202",
      "0f02020202",
      "0f03020202"
    ],
    "forward": $SJ_NAT,
    "tunnels": 0,
    "tunnelport": 5100,
    "gateways": {
      "min": 5102,
      "max": 5014
    },
    "concurrency": 3
  },
  "telemetry": {
    "service": "https://status.storj.io",
    "enabled": false
  },
  "loglevel": 3
}
EOF

exec "$@"

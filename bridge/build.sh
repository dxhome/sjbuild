#!/usr/bin/env bash

set -e

git pull

npm instlal

docker build -t sj-bridge:0.1 .

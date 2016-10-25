#!/usr/bin/env bash

set -e

if [ -d ./bridge ]; then
  cd ./bridge && git pull
else
  git clone https://github.com/Storj/bridge
  cd ./bridge
fi

npm --registry http://registry.cnpmjs.org info underscore
npm install
cd ..

rm -f sj-bridge.tar.gz

tar cfz sj-bridge.tar.gz ./bridge/ 

docker build -t sj-bridge:0.1 .

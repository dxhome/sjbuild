#!/usr/bin/env bash

set -e

#CODEDIR=./sj-bridge

#if [ -d $CODEDIR ]; then
#  cd $CODEDIR && git pull
#else
#  git clone https://github.com/dxhome/sj-bridge
#  cd $CODEDIR
#fi

#npm install
#cd ..

#rm -f sj-bridge.tar.gz

#tar cfz sj-bridge.tar.gz $CODEDIR

docker build -t sj-bridge:0.1 .

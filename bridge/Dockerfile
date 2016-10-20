FROM docker.io/node:4.6-slim

RUN apt update && apt install -y vim

ADD sj-bridge.tar.gz /sj
WORKDIR /sj/bridge

#RUN npm install

ENV NODE_ENV production
ENV STORJ_BRIDGE_DIR /sj-data

VOLUME ["/sj-data"]

EXPOSE 80

CMD node bin/storj-bridge.js

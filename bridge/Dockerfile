FROM node:4.6-slim

RUN apt update && apt install -y vim

ENV NODE_ENV production
ENV STORJ_BRIDGE_DIR /sj-data

ADD ./sj-bridge.tar.gz /
ADD ./entry.sh /
RUN chmod +x /entry.sh
WORKDIR /sj-bridge

ENTRYPOINT ["/entry.sh"]

VOLUME ["/sj-data"]

EXPOSE 80

CMD node bin/storj-bridge.js -d /sj-data

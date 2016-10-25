FROM node:4.6-slim

RUN apt update && apt install -y vim

ENV SJ_DATADIR /sj-data

ADD ./storjshare-cli.tar.gz /
ADD ./entry.sh /
RUN chmod +x /entry.sh

WORKDIR /storjshare-cli

ENTRYPOINT ["/entry.sh"]

VOLUME ["/sj-data"]

CMD node bin/storjshare.js start -p pass

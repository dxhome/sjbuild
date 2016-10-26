# Build script for storj components

# run share cli
    docker run -d -e SJ_PUBIP=54.223.123.32 -e SJ_PORT=5000 --net host -v /var/lib/sj-data/5000:/sj-data sj-share:0.1
FROM alpine

RUN apk add --no-cache aria2

WORKDIR /files

ENTRYPOINT ["/usr/bin/aria2c"]

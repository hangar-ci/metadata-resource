FROM alpine:latest

RUN apk add --update bash tzdata

COPY resource/ /opt/resource
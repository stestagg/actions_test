FROM alpine

RUN apk add git

COPY . /root

WORKDIR /root

ENTRYPOINT ["/root/run.sh"]

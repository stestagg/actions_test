FROM alpine

RUN apk add git

COPY . /root
ENTRYPOINT ["/root/run.sh"]

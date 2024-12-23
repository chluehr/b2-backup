FROM alpine:latest

RUN apk add --no-cache pipx supercronic bash
RUN pipx install b2
ADD backup.sh /root/backup.sh
ADD crontab /root/crontab

ENTRYPOINT ["/usr/bin/supercronic","/root/crontab"]


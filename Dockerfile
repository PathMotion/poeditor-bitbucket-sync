FROM alpine:3.8

RUN apk add --no-cache curl jq bash git openssh

ADD scripts/run.sh /bin/scripts/run.sh
ADD scripts/poeditor.sh /bin/scripts/poeditor.sh
ADD scripts/git.sh /bin/scripts/git.sh
RUN chmod +x /bin/scripts/*

ENTRYPOINT /bin/scripts/run.sh
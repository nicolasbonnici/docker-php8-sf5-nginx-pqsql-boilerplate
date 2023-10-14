FROM alpine:latest

RUN apk --update --no-cache add openssh-client

RUN mkdir -p /root/.ssh

COPY entry.sh /

ENTRYPOINT ["ssh-agent", "-s"]
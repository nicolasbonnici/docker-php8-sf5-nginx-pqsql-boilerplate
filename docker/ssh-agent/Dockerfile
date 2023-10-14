FROM alpine:latest

RUN apk --update --no-cache add openssh-client

RUN mkdir -p /root/.ssh

ENTRYPOINT ["ssh-agent", "-s"]